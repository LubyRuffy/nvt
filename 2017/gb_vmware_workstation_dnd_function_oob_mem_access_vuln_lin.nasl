###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_workstation_dnd_function_oob_mem_access_vuln_lin.nasl 5206 2017-02-06 09:20:37Z antu123 $
#
# VMware Workstation DnD Function Out-of-Bounds Access Vulnerability (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

CPE = "cpe:/a:vmware:workstation";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810532");
  script_version("$Revision: 5206 $");
  script_cve_id("CVE-2016-7461");
  script_bugtraq_id(94280);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-02-06 10:20:37 +0100 (Mon, 06 Feb 2017) $");
  script_tag(name:"creation_date", value:"2017-02-03 13:26:17 +0530 (Fri, 03 Feb 2017)");
  script_name("VMware Workstation DnD Function Out-of-Bounds Access Vulnerability (Linux)");

  script_tag(name: "summary" , value:"The host is installed with VMware Workstation
  and is prone to an out-of-bounds memory access vulnerability.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw is due to an out-of-bounds memory 
  access error in drag-and-drop (DnD) function.");

  script_tag(name: "impact" , value:"Successful exploitation will allow
  attackers to execute arbitrary code in the context of the user running the 
  affected application. Failed exploit attempts will likely result in 
  denial-of-service conditions.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"VMware Workstation 12.x before
  12.5.2 on Linux.");

  script_tag(name: "solution" , value:"Upgrade to Workstation version
  12.5.2 or later, For updates refer to http://www.vmware.com");

  script_tag(name:"solution_type", value:"VendorFix");

  ## if both the drag-and-drop function and the copy-and-paste (C&P)
  ## function are disabled application is not vulnerable, so qod is reduced
  script_tag(name:"qod_type", value:"executable_version_unreliable");
  script_xref(name : "URL" , value : "http://www.vmware.com/security/advisories/VMSA-2016-0019.html");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_vmware_prdts_detect_lin.nasl");
  script_mandatory_keys("VMware/Workstation/Linux/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
vmwareVer = "";

## Get version
if(!vmwareVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(vmwareVer =~ "^(12)")
{
  if(version_is_less(version:vmwareVer, test_version:"12.5.2"))
  {
    report = report_fixed_ver(installed_version:vmwareVer, fixed_version:"12.5.2");
    security_message(data:report);
    exit(0);
  }
}