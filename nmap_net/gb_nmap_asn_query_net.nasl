###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_asn_query_net.nasl 5499 2017-03-06 13:06:09Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: jah, Michael Pattrick
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

tag_summary = "Maps IP addresses to autonomous system (AS) numbers.

The script works by sending DNS TXT queries to a DNS server which in turn queries a third-party
service provided by Team Cymru (team-cymru.org) using an in-addr.arpa style zone set up especially
for use by Nmap. The responses to these queries contain both Origin and Peer ASNs and their
descriptions, displayed along with the BGP Prefix and Country Code. The script caches results to
reduce the number of queries and should perform a single query for all scanned targets in a BGP
Prefix present in Team Cymru's database.

Be aware that any targets against which this script is run will be sent to and potentially recorded
by one or more DNS servers and Team Cymru. In addition your IP address will be sent along with the
ASN to a DNS server (your default DNS server, or whichever one you specified with the
'dns' script argument).


SYNTAX:

dns:  The address of a recursive nameserver to use (optional).";

if(description)
{
    script_id(104046);
    script_version("$Revision: 5499 $");
    script_tag(name:"last_modification", value:"$Date: 2017-03-06 14:06:09 +0100 (Mon, 06 Mar 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"0.0");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
    script_name("Nmap NSE net: asn-query");


    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"dns", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");


phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("dns");
    if (!isnull(pref) && pref != "") {
        argv["dns"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"asn-query", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"asn-query");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (asn-query.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            log_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            log_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}