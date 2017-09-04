###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_firefox_mult_vuln_win.nasl 6329 2017-06-13 15:39:42Z teissa $
#
# Mozilla Firefox Multiple Vulnerabilities (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.805099");
  script_version("$Revision: 6329 $");
  script_cve_id("CVE-2015-4497", "CVE-2015-4498");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-06-13 17:39:42 +0200 (Tue, 13 Jun 2017) $");
  script_tag(name:"creation_date", value:"2015-08-31 16:06:00 +0530 (Mon, 31 Aug 2015)");
  script_name("Mozilla Firefox Multiple Vulnerabilities (Windows)");

  script_tag(name: "summary" , value:"This host is installed with Mozilla
  Firefox and is prone to multiple Vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to:
  - A use-after-free vulnerability with a '<canvas>' element on a page. This
  occurs when a resize event is triggered in concert with style changes but
  the canvas references have been recreated in the meantime, destroying the
  originally referenced context. This results in an exploitable crash.
  - A vulnerablity in the way Firefox handles installation of add-ons.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code by leveraging improper interaction between
  resize events and changes to Cascading Style Sheets (CSS) token sequences for
  a CANVAS element and to bypass an intended user-confirmation requirement by
  constructing a crafted data.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Mozilla Firefox version before 40.0.3 on
  Windows");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 40.0.3
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2015-94");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl");
  script_mandatory_keys("Firefox/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}

# Check for vulnerable version
if(version_is_less(version:ffVer, test_version:"40.0.3"))
{
  report = 'Installed version: ' + ffVer + '\n' +
           'Fixed version:     ' + "40.0.3" + '\n';
  security_message(data:report);
  exit(0);
}