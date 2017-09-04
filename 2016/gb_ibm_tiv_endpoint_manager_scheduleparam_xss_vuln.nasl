###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_tiv_endpoint_manager_scheduleparam_xss_vuln.nasl 5813 2017-03-31 09:01:08Z teissa $
#
# IBM Tivoli Endpoint Manager 'ScheduleParam' Cross Site Scripting Vulnerability
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (c) 2016 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
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

CPE = "cpe:/a:ibm:tivoli_endpoint_manager";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809398");
  script_version("$Revision: 5813 $");
  script_cve_id("CVE-2012-0719");
  script_bugtraq_id(52514);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-31 11:01:08 +0200 (Fri, 31 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-11-15 13:41:38 +0100 (Tue, 15 Nov 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Tivoli Endpoint Manager 'ScheduleParam' Cross Site Scripting Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with IBM Tivoli
  Endpoint Manager and is prone to cross site scripting vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw is due to an improper sanitization of
  parameter 'ScheduleParam' in webreports.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to steal the victim's cookie-based authentication credentials.

  Impact Level: Application");

  script_tag(name: "affected" , value:"IBM Tivoli Endpoint Manager versions
  before 8.2.1175.");

  script_tag(name: "solution" , value:"Upgrade to IBM Tivoli Endpoint Manager
  version 8.2.1175, or 8.2 patch 3, or later.
  For updates refer to http://www-03.ibm.com/software/products/en/endpoint-manager-family");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://infosec.cert-pa.it/cve-2012-1837.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_endpoint_manager_web_detect.nasl");
  script_mandatory_keys("ibm_endpoint_manager/installed");
  script_require_ports("Services/www", 52311);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

##Variable initialization
tivPort = 0;
tivVer = "";

## Get port
if(!tivPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Get tiv version
if(!tivVer = get_app_version(cpe:CPE)){
  exit(0);
}

##Check for Vulnerable Version
if(version_is_less(version:tivVer, test_version:"8.2.1175"))
{
  report = report_fixed_ver(installed_version:tivVer, fixed_version:"8.2.1175");
  security_message(port:tivPort, data:report);
  exit(0);
}
