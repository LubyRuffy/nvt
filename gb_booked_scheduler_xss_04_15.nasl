###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_booked_scheduler_xss_04_15.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# Booked Scheduler Cross Site Scripting Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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

CPE = 'cpe:/a:twinkle_toes:booked_scheduler';

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105260");
 script_version ("$Revision: 6032 $");
 script_tag(name:"cvss_base", value:"4.6");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:S/C:P/I:P/A:P");
 script_name("Booked Scheduler Cross Site Scripting Vulnerability");

 script_tag(name:"qod_type", value:"remote_active");

 script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
 script_tag(name:"creation_date", value:"2015-04-20 14:32:41 +0200 (Mon, 20 Apr 2015)");
 script_category(ACT_ATTACK);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_tag(name : "solution" , value : "Ask the vendor for an update");
 script_tag(name : "summary" , value : "Booked Scheduler is prone to a cross-site scripting vulnerability because the software
fails to sufficiently sanitize user-supplied input

An attacker may leverage these issues to execute arbitrary script code
in the browser of an unsuspecting user in the context of the affected
site.");

 exit(0);
}

include("http_func.inc");
include("host_details.inc");
include("http_keepalive.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! dir = get_app_location( cpe:CPE, port:port ) ) exit( 0 );

url = dir + '/index.php?from=";></><script>alert(/openvas-xss-test/)</script>';

if( http_vuln_check( port:port, url:url, pattern:"<script>alert\(/openvas-xss-test/\)</script>", check_header:TRUE ) )
{
  security_message(port:port);
  set_kb_item( name: "booked_scheduler/" + port + "/XSS", value:TRUE);
  exit(0);
}

exit(0);
