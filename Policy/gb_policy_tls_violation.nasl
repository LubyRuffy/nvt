###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_policy_tls_violation.nasl 4741 2016-12-12 09:21:30Z cfi $
#
# SSL/TLS: Policy Check Violations
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.105780");
  script_version("$Revision: 4741 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2016-12-12 10:21:30 +0100 (Mon, 12 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-06-28 14:30:12 +0200 (Tue, 28 Jun 2016)");
  script_name("SSL/TLS: Policy Check Violations");
  script_category(ACT_END);
  script_family("Policy");
  script_copyright("Copyright (c) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_policy_tls.nasl");
  script_mandatory_keys("tls_policy/perform_test", "ssl_tls/port");

  script_tag(name:"summary", value:"SSL/TLS Policy Check Violations");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("ssl_funcs.inc");

if( ! port = get_ssl_port() ) exit( 0 );

policy_violating_ssl_versions = get_kb_item( "tls_policy/policy_violating_ssl_versions/" + port );
if( ! policy_violating_ssl_versions ) exit( 0 );

minimum_TLS = get_kb_item( "tls_policy/minimum_TLS" );

report = 'Minimum allowed TLS version: ' + minimum_TLS + '\n\nThe following SSL/TLS versions are supported by the remote service and violating the TLS policy:\n\n' + str_replace( string:policy_violating_ssl_versions, find:" ", replace:'\n' ) + '\n';
log_message( port:port, data:report );
exit( 0 );