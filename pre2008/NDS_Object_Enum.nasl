###############################################################################
# OpenVAS Vulnerability Test
# $Id: NDS_Object_Enum.nasl 8392 2018-01-12 10:46:21Z cfischer $
#
# Netware NDS Object Enumeration
#
# Authors:
# Forrest Rae <forrest.rae@digitaldefense.net>
#
# Copyright:
# Copyright (C) 2002 Digital Defense, Inc
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

# This script attempts to retrieve Novell server info via ncp (524).

# CHANGELOG:
# v1.2: Added code to enumerate users.
# v1.1: Fixed Server Name issue.  If server name contained an underscroll,
#       it would be removed.
# v1.0: Initial Release

# TODO:
# Figure out how to login to NDS via Nasl.
# See if a chknull can be re-written into a openvas plugin.
# See if "Security equal to admin" can be enumerated.

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.10988");
  script_version("$Revision: 8392 $");
  script_tag(name:"last_modification", value:"$Date: 2018-01-12 11:46:21 +0100 (Fri, 12 Jan 2018) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Netware NDS Object Enumeration");
  script_category(ACT_GATHER_INFO);
  script_copyright("This script is Copyright (C) 2002 Digital Defense, Inc");
  script_family("Netware");
  script_dependencies("gb_netware_core_protocol_detect.nasl");
  script_require_ports("Services/ncp", 524);
  script_mandatory_keys("netware/ncp/detected");

  tag_solution = "The NDS object PUBLIC should not have Browse rights the tree should
  be restricted to authenticated users only.

  Removing Browse rights from the object will fix this issue. If this
  is an external system it is recommended that access 
  to port 524 be blocked from the Internet.";

  tag_summary = "This host is a Novell Netware (eDirectory) server, and has browse
  rights on the PUBLIC object."; 

  tag_impact = "It is possible to enumerate all NDS objects, including users, with 
  crafted queries. An attacker can use this to gain information about this host.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"impact", value:tag_impact);

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_active");

  exit(0);
}

port = get_kb_item( "Services/ncp" );
if( ! port ) port = 524;
if( ! get_port_state( port ) ) exit( 0 );

soc = open_sock_tcp( port );
if( ! soc ) exit( 0 );

# Some vars.
nds_seq_num = raw_string( 0x00 );
server_name = "";
nds_tree_name = "";
nds_object_name = "";
report = "";
report_users = "";
first = 1;

conn_create = raw_string( 0x44, 0x6d, 0x64, 0x54,  # NCP over IP signature: Demand Transport
                          0x00, 0x00, 0x00, 0x17,  # NCP over IP Length: 0x00000017 (23 bytes)
                          0x00, 0x00, 0x00, 0x01,  # NCP over IP version: 1
                          0x00, 0x00, 0x00, 0x00,  # NCP over IP Reply Buffer Size: 0
                          0x11, 0x11,              # Type: Create a service connection
                          ord(nds_seq_num),        # Initial sequence number 0x00
                          0xff,                    # Connection Number low, 0xff (255) wildcard
                          0x01,                    # Task Number: 1
                          0xff,                    # Connection Number high, 0xff (255) wildcard
                          0x04 );                  # Group: Connection

# Build the NCP connection
send( socket:soc, data:conn_create );
r = recv( socket:soc, length:4096 );

# Check for successful connection
# NCP over IP signature: 0x744e6350 = "tNcP"
if( "tNcP" >< r ) {
  # Grab the connection number from the Connection Request Reply
  # 12th and 14th byte of the raw_string r
  conn_number_low = 1;
  conn_number_high = 1;

  conn_number_low = r[11];
  conn_number_high = r[13];

  #####################################################
  # Get Server Name
  #####################################################

  # Increment nds_seq_num
  nds_seq_num = raw_string( ord( nds_seq_num ) + 1 );

  # Build our info req string
  # 20th byte is conn_number_low
  # 22nd byte is conn_numger_high
  server_info_req = raw_string( 0x44, 0x6d, 0x64, 0x54,  # NCP over IP signature: Demand Transport
                                0x00, 0x00, 0x00, 0x1a,  # NCP over IP Length: 26 bytes
                                0x00, 0x00, 0x00, 0x01,  # NCP over IP version: 1
                                0x00, 0x00, 0x00, 0x80,  # NCP over IP Reply Buffer Size: 128
                                0x22, 0x22,              # Type: Service Request
                                ord(nds_seq_num),        # Sequence number
                                ord(conn_number_low),    # Connection Number low
                                0x01,                    # Task Number: 1
                                ord(conn_number_high),   # Connection Number high
                                0x17,                    # Function Code: Get File Server Information
                                0x00, 0x01,              # Packet Length: 1
                                0x11 );                  # Subfunction
  # send request
  send( socket:soc, data:server_info_req );
  r = recv( socket:soc, length:4096 );

  # Check for successful request
  # NCP over IP signature: 0x744e6350 = "tNcP"
  if( "tNcP" >< r ) {
    # Build server name.
    for( i = 16; i < 63; i++ ) {
      if( ord(r[i]) != 0 )
        server_name = string( server_name, r[i] );
    }
    report = string("Server Name: ", server_name, "\n");
  }

  #####################################################
  # Get NDS Tree Name with a NDS_Ping
  #####################################################

  # Increment nds_seq_num
  nds_seq_num = raw_string( ord( nds_seq_num ) + 1 );

  # Build our NDS_Ping string
  # 20th byte is conn_number_low
  # 22nd byte is conn_numger_high
  nds_ping_req = raw_string( 0x44, 0x6d, 0x64, 0x54,  # NCP over IP signature: Demand Transport
                             0x00, 0x00, 0x00, 0x1b,  # NCP over IP Length: 27 bytes
                             0x00, 0x00, 0x00, 0x01,  # NCP over IP version: 1
                             0x00, 0x00, 0x00, 0x28,  # NCP over IP Reply Buffer Size: 128
                             0x22, 0x22,              # Type: Service Request
                             ord(nds_seq_num),        # Sequence number
                             ord(conn_number_low),    # Connection Number low
                             0x01,                    # Task Number: 1
                             ord(conn_number_high),   # Connection Number high
                             0x68,                    # Function Code: Ping for NDS NCP
                             0x01,                    # Subfunction
                             0x00, 0x00, 0x00 );      # Reserved Bytes

  # send request
  send( socket:soc, data:nds_ping_req );
  r = recv( socket:soc, length:4096 );

  # Check for successful request
  # NCP over IP signature: 0x744e6350 = "tNcP"
  if( "tNcP" >< r ) {
    # Build NDS Tree Name.
    for( i = 24; i < 45; i++ ) {
      if( ( r[i] >< "_" ) && ( r[i+1] >< "_" ) ) {
        # do nothing :)
      } else {
        nds_tree_name = string( nds_tree_name, r[i] );
      }
    }
    report = string( report, "NDS Tree Name: ", nds_tree_name, "\n" );
  }

  #####################################################
  # Lets try to enumerate some users.
  #####################################################

  # Initial Object ID = wildcard.
  nds_object_id = raw_string( 0xff, 0xff, 0xff, 0xff );

  # Enumerate All users.
  # 0xfc (252) = "Bindery object does not exist."
  while( ! ( r[14] >< raw_string( 0xfc ) ) ) {
    # Increment nds_seq_num
    nds_seq_num = raw_string( ord( nds_seq_num ) + 1 );

    # Build our NDS_Ping string
    # 20th byte is conn_number_low
    # 22nd byte is conn_numger_high
    # 27th - 30th byte is the Object ID.
    nds_user_req = raw_string( 0x44, 0x6d, 0x64, 0x54,  # NCP over IP signature: Demand Transport
                               0x00, 0x00, 0x00, 0x22,  # NCP over IP Length: 34 bytes
                               0x00, 0x00, 0x00, 0x01,  # NCP over IP version: 1
                               0x00, 0x00, 0x00, 0x39,  # NCP over IP Reply Buffer Size: 57
                               0x22, 0x22,              # Type: Service Request
                               ord(nds_seq_num),        # Sequence number
                               ord(conn_number_low),    # Connection Number low
                               0x04,                    # Task Number: 1
                               ord(conn_number_high),   # Connection Number high
                               0x17,                    # Function Code: Scan Bindery Object
                               0x00, 0x09,              # Packet Length
                               0x37,                    # Subfunction
                               # Object ID
                               ord(nds_object_id[0]), ord(nds_object_id[1]), ord(nds_object_id[2]), ord(nds_object_id[3]), 
                               0x00, 0x01,              # Object Type: 0x0001 = "User Novell - Provo Corp HQ"
                               # Want more? Search for "List of Publicly Registered SAP Types" at 
                               # http://support.novell.com/
                               0x01, 0x2a               # Object Name: *
                               );

    # send request
    send( socket:soc, data:nds_user_req );
    r = recv( socket:soc, length:4096 );

    # Check for successful request
    # NCP over IP signature: 0x744e6350 = "tNcP"
    if( ( "tNcP" >< r ) && ( ! ( r[14] >< raw_string( 0xfc ) ) ) ) {
      nds_object_id = raw_string( ord(r[16] ), ord( r[17] ), ord( r[18] ), ord( r[19] ) );
      nds_object_name = "";

      # Build Object Name.
      # object name begins at 22 and is 48 bytes max.
      for( i = 22; i < 71; i++ ) {
        if( ord(r[i]) == 0 ) {
          # do nothing :)
        } else {
          nds_object_name = string( nds_object_name, r[i] );
        }
      }

      if( first == 1 ) {
        report_users = string( report_users, nds_object_name );
        first = 0;
      } else {
        report_users = string( report_users, ", ", nds_object_name );
      }
    }
  } # End While loop.
  close( soc );
  if( strlen( report ) > 0 ) {
    if( strlen( report_users ) > 0 ) {
      report = string(report, "NDS Users: ", report_users);
    }

    report = 'It was possible to gather the following information about the remote host : \n\n' + report;
    security_message( port:port, data:report );
    exit( 0 );
  }
  exit( 99 );
} else {
  close( soc );
  exit( 0 );
}