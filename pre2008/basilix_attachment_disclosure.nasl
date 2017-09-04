# OpenVAS Vulnerability Test
# $Id: basilix_attachment_disclosure.nasl 6053 2017-05-01 09:02:51Z teissa $
# Description: BasiliX Attachment Disclosure Vulnerability
#
# Authors:
# George A. Theall, <theall@tifaware.com>
#
# Copyright:
# Copyright (C) 2004 George A. Theall
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
#

tag_summary = "The remote web server contains a series of PHP scripts that are prone to
information disclosure. 

Description :

The remote host appears to be running a BasiliX version 1.1.0 or lower. 
Such versions save attachments by default under '/tmp/BasiliX', which is
world-readable and apparently never emptied by BasiliX itself.  As a
result, anyone with shell access on the affected system or who can place
CGI files on it can access attachments uploaded to BasiliX.";

tag_solution = "Upgrade to BasiliX version 1.1.1 or later.";

if (description) {
  script_id(14306);
  script_version("$Revision: 6053 $");
  script_tag(name:"last_modification", value:"$Date: 2017-05-01 11:02:51 +0200 (Mon, 01 May 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2002-1711");
  script_bugtraq_id(5065);

  name = "BasiliX Attachment Disclosure Vulnerability";
  script_name(name);
 
 
  summary = "Checks for attachment disclosure vulnerability in BasiliX";
 
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_banner");
  script_family("Web application abuses");

  script_copyright("This script is Copyright (C) 2004 George A. Theall");

  script_dependencies("basilix_detect.nasl");
  script_require_ports("Services/www", 80);

  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_xref(name : "URL" , value : "http://archives.neohapsis.com/archives/vulnwatch/2002-q2/0117.html");
  exit(0);
}


include("http_func.inc");


port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);
if (!can_host_php(port:port)) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/basilix"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  ver = matches[1];

  if (ver =~ "^(0\..*|1\.(0.*|1\.0))$") {
    security_message(port);
    exit(0);
  }
}