###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_coldfusion_xml_entities_info_disc_vuln.nasl 62303 2016-09-01 11:45:09Z Sep$
#
# Adobe ColdFusion 'XML External Entity' Information Disclosure Vulnerability
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:coldfusion";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809027");
  script_version("$Revision: 5759 $");
  script_cve_id("CVE-2016-4264");
  script_bugtraq_id(92684);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-29 11:01:08 +0200 (Wed, 29 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-09-01 11:45:09 +0530 (Thu, 01 Sep 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Adobe ColdFusion 'XML External Entity' Information Disclosure Vulnerability");

  script_tag(name:"summary", value:"This host is running Adobe ColdFusion and is 
  prone to an information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an error in parsing 
  crafted XML entities.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to obtain sensitive information about the application.

  Impact Level: Application");

  script_tag(name:"affected", value:"ColdFusion 10 before Update 21 and
  11 before Update 10.");

  script_tag(name:"solution", value:"Upgrade to version 10 Update 21 or
  11 Update 10 or later.
  For updates refer to http://www.adobe.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"https://helpx.adobe.com/security/products/coldfusion/apsb16-30.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_coldfusion_detect.nasl");
  script_mandatory_keys("coldfusion/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
cfPort = 0;
cfdVer = "";

## Get HTTP Port
if(!cfPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get Version
if(!cfdVer = get_app_version(cpe:CPE, port:cfPort)){
  exit(0);
}

## Checking for Vulnerable version
## https://helpx.adobe.com/coldfusion/kb/coldfusion-10-updates.html
if(version_in_range(version:cfdVer, test_version:"10.0", test_version2:"10.0.20.299202"))
{
  fix = "10.0.21.300068";
  VULN = True;
}

## https://helpx.adobe.com/coldfusion/kb/coldfusion-11-updates.html
else if(version_in_range(version:cfdVer, test_version:"11.0", test_version2:"11.0.09.299201"))
{
  fix = "11.0.10.300066";
  VULN = True;
}

if(VULN)
{
  report = report_fixed_ver(installed_version:cfdVer, fixed_version:fix);
  security_message(data:report, port:cfPort);
  exit(0);
}