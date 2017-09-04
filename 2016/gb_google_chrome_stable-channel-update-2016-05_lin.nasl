##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_stable-channel-update-2016-05_lin.nasl 5867 2017-04-05 09:01:13Z teissa $
#
# Google Chrome Security Updates(stable-channel-update-2016-05)-Linux
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

CPE = "cpe:/a:google:chrome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807590");
  script_version("$Revision: 5867 $");
  script_cve_id("CVE-2016-1667", "CVE-2016-1668", "CVE-2016-1669", "CVE-2016-1670");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 11:01:13 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-05-17 11:47:13 +0530 (Tue, 17 May 2016)");
  script_name("Google Chrome Security Updates(stable-channel-update-2016-05)-Linux");

  script_tag(name: "summary" , value:"The host is installed with Google Chrome
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to
  - Same origin bypass in DOM.
  - Same origin bypass in Blink V8 bindings.
  - Buffer overflow in V8.
  - Race condition in loader.");

  script_tag(name: "impact" , value:"Successful exploitation of this
  vulnerability will allow remote attackers to bypass security restrictions,
  to obtain sensitive information and to cause a denial of service 
  (buffer overflow) or possibly have unspecified other impact.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Google Chrome version 
  prior to 50.0.2661.102 on Linux");

  script_tag(name: "solution", value:"Upgrade to Google Chrome version
  50.0.2661.102 or later.
  For updates refer to http://www.google.com/chrome");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2016/05/stable-channel-update.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_google_chrome_detect_lin.nasl");
  script_mandatory_keys("Google-Chrome/Linux/Ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
chr_ver = "";

## Get version
if(!chr_ver = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(version_is_less(version:chr_ver, test_version:"50.0.2661.102"))
{
  report = report_fixed_ver(installed_version:chr_ver, fixed_version:"50.0.2661.102");
  security_message(data:report);
  exit(0);
}