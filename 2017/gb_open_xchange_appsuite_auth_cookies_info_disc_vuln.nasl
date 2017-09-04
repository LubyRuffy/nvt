###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_open_xchange_appsuite_auth_cookies_info_disc_vuln.nasl 4936 2017-01-04 10:59:39Z antu123 $
#
# Open-Xchange AppSuite 'authentication cookies' Information Disclosure Vulnerability
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:open-xchange:open-xchange_appsuite";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807392");
  script_version("$Revision: 4936 $");
  script_cve_id("CVE-2016-4027");
  script_bugtraq_id(91354);
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-01-04 11:59:39 +0100 (Wed, 04 Jan 2017) $");
  script_tag(name:"creation_date", value:"2017-01-02 15:28:47 +0530 (Mon, 02 Jan 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("Open-Xchange AppSuite 'authentication cookies' Information Disclosure Vulnerability");

  script_tag(name: "summary" , value:"The host is installed with Open-Xchange (OX)
  AppSuite and is prone to information disclosure vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists as the system may store
  authentication cookies on the target user's system after a session has
  terminated.");

  script_tag(name:"impact", value:"Successful exploitation will allow attackers
  to access cookies that contain authentication information.

  Impact Level: Application");

  script_tag(name:"affected", value:"Open-Xchange (OX) AppSuite versions
  7.6.2-rev0 to 7.6.2-rev42, 7.6.3-rev0 - 7.6.3-rev10, 
  7.8.0-rev0 - 7.8.0-rev22, 7.8.1-rev0 - 7.8.1-rev9");

  script_tag(name:"solution", value:"Upgrade to Open-Xchange (OX) AppSuite
  version 7.8.1-rev10, or 7.6.2-rev43, or 7.8.0-rev23, or 7.6.3-rev11, or later.
  For updates refer to https://www.open-xchange.com");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://www.securitytracker.com/id/1036157");
  script_xref(name : "URL" , value : "https://packetstormsecurity.com/files/137599");
  script_xref(name : "URL" , value : "http://www.securityfocus.com/archive/1/archive/1/538732/100/0/threaded");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ox_app_suite_detect.nasl");
  script_mandatory_keys("open_xchange_appsuite/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}

##
### Code Starts Here
##

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
oxPort = "";
oxVer = "";

## Get HTTP Port
if(!oxPort = get_app_port(cpe:CPE)){
  exit(0);
}

## Get the version
oxVer = get_app_version(cpe:CPE, port:oxPort);
if(!oxVer || "unknown" >< oxVer){
  exit(0);
}

## Get the revision
oxRev = get_kb_item("open_xchange_appsuite/" + oxPort + "/revision");

if(oxRev)
{
  ## Updating version with revision number
  oxVer = oxVer + "." + oxRev;

  ##Check for vulnerable version
  if(oxVer =~ "^(7\.8\.1)" && version_is_less( version:oxVer, test_version:"7.8.1.10"))
  {
    fix = "7.8.1-rev10";
    VULN = TRUE;
  }

  else if(oxVer =~ "^(7\.6\.2)" && version_is_less( version:oxVer, test_version:"7.6.2.43"))
  {
    fix = "7.6.2-rev43";
    VULN = TRUE;
  }

  else if(oxVer =~ "^(7\.6\.3)" && version_is_less( version:oxVer, test_version:"7.6.3.11"))
  {
    fix = "7.6.3-rev11";
    VULN = TRUE;
  }

  else if(oxVer =~ "^(7\.8\.0)" && version_is_less( version:oxVer, test_version:"7.8.0.23"))
  {
    fix = "7.8.0-rev23";
    VULN = TRUE;
  }

  if(VULN)
  {
    report = report_fixed_ver(installed_version:oxVer, fixed_version:fix);
    security_message(data:report);
    exit(0);
  }
}