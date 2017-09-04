###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_hpe_sizer_convergedsystems_virtualization_remote_code_exec_vuln.nasl 5568 2017-03-14 10:00:33Z teissa $
#
# HPE Sizer ConvergedSystems Virtualization Remote Arbitrary Code Execution Vulnerability
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

CPE = "cpe:/a:hp:sizer_for_converged_systems_virtualization";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809438");
  script_version("$Revision: 5568 $");
  script_cve_id("CVE-2016-4377");
  script_bugtraq_id(92479);
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-14 11:00:33 +0100 (Tue, 14 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-10-10 12:59:16 +0530 (Mon, 10 Oct 2016)");
  script_name("HPE Sizer ConvergedSystems Virtualization Remote Arbitrary Code Execution Vulnerability");

  script_tag(name:"summary", value:"This host is installed with HPE Sizer
  ConvergedSystems Virtualization and is prone to remote arbitrary code execution
  vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exist due to an unspecified
  error.");

  script_tag(name:"impact", value:"Successful exploitation will allow
  arbitrary code execution.

  Impact Level: System/Application.");

  script_tag(name:"affected", value:"HPE Sizer for ConvergedSystems Virtualization
  prior to version 16.7.1.");

  script_tag(name:"solution", value:"Upgrade to HPE Sizer for ConvergedSystems
  Virtualization version 16.7.1 or later. For updates refer to https://www.hpe.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");

  script_xref(name:"URL", value:"http://h20564.www2.hpe.com/hpsc/doc/public/display?docId=emr_na-c05237578");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_dependencies("gb_hpe_sizer_convergedsystems_virtualization_detect.nasl");
  script_mandatory_keys("HPE/ConvergedSystems/Virtualization/Sizing/Tool/Win/Ver");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
hpVer= "";

## Get version
if(!hpVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Check For Version less than 16.7.1
if(version_is_less(version:hpVer, test_version:"16.7.1"))
{
  report = report_fixed_ver(installed_version:hpVer, fixed_version:"16.7.1");
  security_message(data:report);
  exit(0);
}