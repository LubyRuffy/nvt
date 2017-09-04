###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_thunderbird_mfsa_2016-96_2016-96_win.nasl 4883 2016-12-30 07:47:11Z antu123 $
#
# Mozilla Thunderbird Security Updates(mfsa_2016-96_2016-96)-Windows
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

CPE = "cpe:/a:mozilla:thunderbird";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809844");
  script_version("$Revision: 4883 $");
  script_cve_id("CVE-2016-9899", "CVE-2016-9895", "CVE-2016-9897", "CVE-2016-9898", 
                "CVE-2016-9900", "CVE-2016-9904", "CVE-2016-9905", "CVE-2016-9893" );
  script_bugtraq_id(94885, 94884);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2016-12-30 08:47:11 +0100 (Fri, 30 Dec 2016) $");
  script_tag(name:"creation_date", value:"2016-12-29 11:39:06 +0530 (Thu, 29 Dec 2016)");
  script_name("Mozilla Thunderbird Security Updates(mfsa_2016-96_2016-96)-Windows");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Thunderbird and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the
  help of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exist due to,
  - An Use-after-free while manipulating DOM events and audio elements.
  - A CSP bypass using marquee tag.
  - The Memory corruption in libGLES.
  - An Use-after-free in Editor while manipulating DOM subtrees.
  - A Restricted external resources can be loaded by SVG images through data URLs.
  - A Cross-origin information leak in shared atoms.
  - A Crash in EnumerateSubDocuments.
  - Other Memory Corruption Errors.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to steal cookie-based authentication credentials, bypass certain
  security restrictions, obtain sensitive information and execute arbitrary
  code in the context of the affected application. Failed exploit attempts
  will likely result in denial-of-service conditions. 

  Impact Level: System/Application.");

  script_tag(name: "affected" , value:"Mozilla Thunderbird version before 45.6 on Windows.");
  script_tag(name: "solution" , value:"Upgrade to Mozilla Thunderbird 45.6 or later,
  For updates refer to https://www.mozilla.org/en-US/thunderbird");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2016-96");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_thunderbird_detect_win.nasl");
  script_mandatory_keys("Thunderbird/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
tbVer = "";

## Get version
if(!tbVer = get_app_version(cpe:CPE)){
  exit(0);
}

# Check for vulnerable version
if(version_is_less(version:tbVer, test_version:"45.6"))
{
  report = report_fixed_ver(installed_version:tbVer, fixed_version:"45.6");
  security_message(data:report);
  exit(0);
}