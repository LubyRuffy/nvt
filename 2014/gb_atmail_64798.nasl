###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_atmail_64798.nasl 6756 2017-07-18 13:31:14Z cfischer $
#
# Atmail Multiple Unspecified Security Vulnerabilities.
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.103881";
CPE = "cpe:/a:atmail:atmail";

tag_insight = "Atmail is prone to multiple unspecified security vulnerabilities. ";
tag_impact = "Impact and attack vectors are unknown.";
tag_affected = "Versions prior to Atmail 6.6.4 and 7.1.2 are vulnerable.";
tag_summary = "Atmail is prone to multiple security vulnerabilities.";
tag_solution = "Updates are available.";
tag_vuldetect = "Check the installed version.";

if (description)
{
 script_oid(SCRIPT_OID);
 script_bugtraq_id(64798,64797,64796,64789);
 script_cve_id("CVE-2013-5034","CVE-2013-5033","CVE-2013-5032","CVE-2013-5031");
 script_tag(name:"cvss_base", value:"10.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
 script_version ("$Revision: 6756 $");

 script_name("Atmail Multiple Unspecified Security Vulnerabilities.");


 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64798");
 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64797");
 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64796");
 script_xref(name:"URL", value:"http://www.securityfocus.com/bid/64789");
 script_xref(name:"URL", value:"http://blog.atmail.com/2013/atmail-7-1-2-security-hotfix/");
 script_xref(name:"URL", value:"http://atmail.com/");
 
 script_tag(name:"last_modification", value:"$Date: 2017-07-18 15:31:14 +0200 (Tue, 18 Jul 2017) $");
 script_tag(name:"creation_date", value:"2014-01-14 12:23:14 +0100 (Tue, 14 Jan 2014)");
 script_category(ACT_GATHER_INFO);
 script_tag(name:"qod_type", value:"remote_banner");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("atmail_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("Atmail/installed");

 script_tag(name : "impact" , value : tag_impact);
 script_tag(name : "vuldetect" , value : tag_vuldetect);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name : "affected" , value : tag_affected);

 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");
include("version_func.inc");

if ( ! port = get_app_port( cpe:CPE, nvt:SCRIPT_OID ) ) exit(0);
if ( vers = get_app_version( cpe:CPE, nvt:SCRIPT_OID, port:port ) )
{
  if ( vers  =~ "^6\." )
    check_version = '6.6.4';

  if ( vers  =~ "^7\." )
    check_version = '7.1.2';

  if( check_version )
  {  
    if(version_is_less(version: vers, test_version: check_version)) {
      security_message(port:port);
      exit(0);
    }
  }  

}

exit(99);