###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ibm_was_potential_info_disclose_vuln.nasl 5689 2017-03-23 10:00:49Z teissa $
#
# IBM Websphere Application Server Potential Information Disclosure Vulnerability
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:ibm:websphere_application_server";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809339");
  script_version("$Revision: 5689 $");
  script_cve_id("CVE-2016-5986");
  script_bugtraq_id(93013);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-03-23 11:00:49 +0100 (Thu, 23 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-03 13:28:39 +0530 (Mon, 03 Oct 2016)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("IBM Websphere Application Server Potential Information Disclosure Vulnerability");

  script_tag(name: "summary" , value:"This host is installed with IBM Websphere
  application server and is prone to information disclosure vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight", value:"The flaw exist due to an improper handling of
  responses under certain conditions.");

  script_tag(name: "impact" , value:"Successful exploitation will allow a remote
  attacker to gain server identification information.

  Impact Level: Application");

  script_tag(name: "affected" , value:"IBM WebSphere Application Server (WAS)
  7.0 before 7.0.0.43, 8.0 before 8.0.0.13, 8.5 before 8.5.5.11, 9.0 before
  9.0.0.2, and Liberty before 16.0.0.3");

  script_tag(name:"solution" , value:"Upgrade to IBM WebSphere Application
  Server (WAS) to 7.0.0.43, or 8.0.0.13, or 8.5.5.11, or 9.0.0.2 or Liberty
  Fix 16.0.0.3 or later.
  For updates refer to http://www-03.ibm.com/software/products/en/appserv-was");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg21990056");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ibm_websphere_detect.nasl");
  script_mandatory_keys("ibm_websphere_application_server/installed");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

wasVer = "";
report = "";
liberty = "";

## Get version
if(!wasVer = get_app_version(cpe:CPE, nofork:TRUE)){
  exit(0);
}

## Get port
if(!wasPort = get_app_port(cpe:CPE)){
  exit(0);
}

##Check Liberty profile is installed
liberty = get_kb_item("ibm_websphere_application_server/liberty/profile/installed");

## Check WAS vulnerable versions
if (liberty)
{
  if(version_is_less(version:wasVer, test_version:"16.0.0.3"))
  {
    fix = "16.0.0.3";
    VULN = TRUE;
  }
}

else 
{
  if(version_in_range(version:wasVer, test_version:"7.0", test_version2:"7.0.0.41"))
  {
    fix = "7.0.0.43";
    VULN = TRUE;
  }

  else if(version_in_range(version:wasVer, test_version:"8.0", test_version2:"8.0.0.12"))
  {
    fix = "8.0.0.13";
    VULN = TRUE;
  }

  else if(version_in_range(version:wasVer, test_version:"8.5", test_version2:"8.5.5.10"))
  {
    fix = "8.5.5.11";
    VULN = TRUE;
  }
 
  else if(version_in_range(version:wasVer, test_version:"9.0", test_version2:"9.0.0.1"))
  {
    fix = "9.0.0.2";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:wasVer, fixed_version:fix);
  security_message(data:report, port:wasPort);
  exit(0);
}