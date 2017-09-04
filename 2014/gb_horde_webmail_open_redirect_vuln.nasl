###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_horde_webmail_open_redirect_vuln.nasl 6759 2017-07-19 09:56:33Z teissa $
#
# Horde Webmail 'url' Parameter Open Redirect Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

SCRIPT_OID = "1.3.6.1.4.1.25623.1.0.804431";
CPE = "cpe:/a:horde:horde_groupware";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6759 $");
  script_tag(name:"cvss_base", value:"8.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 11:56:33 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-04-17 12:16:13 +0530 (Thu, 17 Apr 2014)");
  script_name("Horde Webmail 'url' Parameter Open Redirect Vulnerability");

  tag_summary =
"This host is installed Horde Webmail and is prone to open redirect
vulnerability.";

  tag_vuldetect =
"Send a crafted HTTP GET request and check whether it redirects to the
malicious websites.";

  tag_insight =
"The flaw exists because the application does not validate the 'url'
parameter upon submission to the /horde/util/go.php script.";

  tag_impact =
"Successful exploitation will allow remote attackers to create a specially
crafted URL, that if clicked, would redirect a victim from the intended
legitimate web site to an arbitrary web site of the attacker's choosing.

Impact Level: Application";

  tag_affected =
"Horde Webmail version 5.1 and prior";

  tag_solution =
"No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"solution_type", value:"WillNotFix");

  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/32638");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/125953");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_family("Web application abuses");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_dependencies("horde_detect.nasl");
  script_mandatory_keys("horde/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("http_func.inc");
include("version_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
url = "";
hordeRes = "";
hordeReq = "";
hordePort = 0;

## Get HTTP Port
if(!hordePort = get_app_port(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

## Get vTiger Location
if(!dir = get_app_location(cpe:CPE, nvt:SCRIPT_OID, port:hordePort)){
  exit(0);
}

## Construct the attack request with userdoesnotexists
url = dir + "/util/go.php?url=http://www.horde.org/apps/webmail";

hordeReq = http_get(item:url, port:hordePort);
hordeRes = http_keepalive_send_recv( port:hordePort, data:hordeReq);

## Confirm the exploit
if("200 OK" >< hordeRes &&
   hordeRes =~ "refresh: 0; URL=http://www.horde.org/apps/webmail"){
  security_message(port:hordePort);
}