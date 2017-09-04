###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_java_privilege_escalation_vuln.nasl 5782 2017-03-30 09:01:05Z teissa $
#
# Oracle Java SE Privilege Escalation Vulnerability (Windows)
#
# Authors:
# Tushar Khelge <ktushar@secpod.com>
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

CPE = "cpe:/a:oracle:jre";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807248");
  script_version("$Revision: 5782 $");
  script_cve_id("CVE-2016-0603");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-30 11:01:05 +0200 (Thu, 30 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-02-12 10:43:38 +0530 (Fri, 12 Feb 2016)");
  script_name("Oracle Java SE Privilege Escalation Vulnerability (Windows)");

  script_tag(name: "summary" , value:"The host is installed with Oracle Java SE
  JRE and is prone to Privilege Escalation Vulnerability");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to some unspecified
  error.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to have an impact on confidentiality, integrity and availability
  via unknown vectors.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Oracle Java SE 6 update 111 and prior,
  7 update 95 and prior, 8 update 71 and prior, and 8 update 72 and prior
  on Windows.");

  script_tag(name: "solution" , value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/alert-cve-2016-0603-2874360.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/alert-cve-2016-0603-2874360.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_win.nasl");
  script_mandatory_keys("Sun/Java/JRE/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
jreVer = "";

## Get version
if(!jreVer = get_app_version(cpe:CPE))
{
  CPE = "cpe:/a:sun:jre";
  if(!jreVer = get_app_version(cpe:CPE)){
    exit(0);
  }
}

if(jreVer =~ "^(1\.(6|7|8))")
{
  jreVer = ereg_replace(pattern:"[a-z]+_|-", string:jreVer, replace: ".");

  ##Check for Oracle Java SE Versions
  if(version_in_range(version:jreVer, test_version:"1.8.0", test_version2:"1.8.0.72")||
     version_in_range(version:jreVer, test_version:"1.6.0", test_version2:"1.6.0.111")||
     version_in_range(version:jreVer, test_version:"1.7.0", test_version2:"1.7.0.95"))
  {
    report = report_fixed_ver(installed_version:jreVer, fixed_version: "Apply the patch");
    security_message(data:report);
    exit(0);
  }
}