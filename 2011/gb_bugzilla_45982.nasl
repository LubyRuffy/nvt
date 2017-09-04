###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_bugzilla_45982.nasl 7024 2017-08-30 11:51:43Z teissa $
#
# Bugzilla Multiple Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

tag_summary = "Bugzilla is prone to the following vulnerabilities:

1. A security-bypass issue.
2. Multiple cross-site scripting vulnerabilities.
3. Multiple cross-site request-forgery vulnerabilities.

Successfully exploiting these issues may allow an attacker to bypass
certain security restrictions, execute arbitrary script code in the
browser of an unsuspecting user, steal cookie-based authentication
credentials or perform certain administrative actions and perform
actions in the vulnerable application in the context of the victim.

The following versions are vulnerable:

3.1.x versions prior to 3.2.10
3.2.x versions prior to 3.4.10
3.3.x versions prior to 3.6.4
4.x versions prior to 4.0rc2";

tag_solution = "Vendor updates are available. Please see the references for more
information.";

if (description)
{
 script_id(103045);
 script_version("$Revision: 7024 $");
 script_tag(name:"last_modification", value:"$Date: 2017-08-30 13:51:43 +0200 (Wed, 30 Aug 2017) $");
 script_tag(name:"creation_date", value:"2011-01-26 13:20:54 +0100 (Wed, 26 Jan 2011)");
 script_bugtraq_id(45982);
 script_cve_id("CVE-2010-4567","CVE-2010-4568","CVE-2010-4569","CVE-2010-4570","CVE-2011-0046","CVE-2011-0048");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("Bugzilla Multiple Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/45982");
 script_xref(name : "URL" , value : "http://www.bugzilla.org/security/3.2.9/");

 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("bugzilla_detect.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:80);
if(!get_port_state(port))exit(0);

if (!can_host_php(port:port)) exit(0);

if(vers = get_version_from_kb(port:port,app:"bugzilla/version")) {

  if(version_in_range(version:vers, test_version: "3.6", test_version2:"3.6.3") ||
     version_in_range(version:vers, test_version: "3.4", test_version2:"3.4.9") ||
     version_in_range(version:vers, test_version: "3.2", test_version2:"3.2.9") ||
     version_in_range(version:vers, test_version: "4.0", test_version2:"4.0rc1")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
