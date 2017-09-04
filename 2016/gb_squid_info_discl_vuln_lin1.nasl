###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_squid_info_discl_vuln_lin1.nasl 5083 2017-01-24 11:21:46Z cfi $
#
# Squid Information Disclosure Vulnerability (Linux)
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
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

CPE = 'cpe:/a:squid-cache:squid';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106480");
  script_version("$Revision: 5083 $");
  script_tag(name: "last_modification", value: "$Date: 2017-01-24 12:21:46 +0100 (Tue, 24 Jan 2017) $");
  script_tag(name: "creation_date", value: "2016-12-19 14:15:02 +0700 (Mon, 19 Dec 2016)");
  script_tag(name: "cvss_base", value: "5.0");
  script_tag(name: "cvss_base_vector", value: "AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_cve_id("CVE-2016-10003");

  script_tag(name: "qod_type", value: "remote_banner_unreliable");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Squid Information Disclosure Vulnerability (Linux)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_squid_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("squid_proxy_server/installed","Host/runs_unixoide");

  script_tag(name: "summary", value: "Squid is prone an information disclosure vulnerability.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "Due to incorrect comparsion of request headers Squid can deliver responses
containing private data to clients it should not have reached.");

  script_tag(name: "impact", value: "This problem allows a remote attacker to discover private and sensitive
information about another clients browsing session. Potentially including credentials which allow access to
further sensitive resources.

This problem only affects Squid configured to use the Collapsed Forwarding feature.");

  script_tag(name: "affected", value: "Squid 3.5.x 4.0.x on Linux.");

  script_tag(name: "solution", value: "Upgrade to 3.5.23, 4.0.17 or later.");

  script_xref(name: "URL", value: "http://www.squid-cache.org/Advisories/SQUID-2016_10.txt");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (host_runs("Linux") != "yes")
  exit(0);

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_in_range(version: version, test_version: "3.5.0", test_version2: "3.5.22")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.5.23");
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "4.0.0", test_version2: "4.0.16")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.0.17");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);