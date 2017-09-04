###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms15-085.nasl 6600 2017-07-07 09:58:31Z teissa $
#
# Microsoft Windows Mount Manager Privilege Elevation Vulnerability (3082487)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806011");
  script_version("$Revision: 6600 $");
  script_cve_id("CVE-2015-1769");
  script_bugtraq_id(76222);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 11:58:31 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-08-12 08:30:53 +0530 (Wed, 12 Aug 2015)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Mount Manager Privilege Elevation Vulnerability (3082487)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS15-085.");

  script_tag(name: "vuldetect" , value: "Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value: "The flaw is due to improper symbolic link
  processing by the Mount Manager component.");

  script_tag(name: "impact" , value: "Successful exploitation will allow a local
  attacker to elevate privileges.

  Impact Level: System");

  script_tag(name: "affected" , value:"
  Microsoft Windows 8 x32/x64
  Microsoft Windows 8.1 x32/x64
  Microsoft Windows 10 x32/x64
  Microsoft Windows Server 2012
  Microsoft Windows Server 2012R2
  Microsoft Windows Vista x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2 and prior
  Microsoft Windows 7 x32/x64 Edition Service Pack 1 and prior
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1 and prior.");

  script_tag(name: "solution" , value: "Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS15-085");

  script_tag(name:"solution_type", value:"VendorFix");


  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3071756");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS15-085");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
exeVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win8:1, win8x64:1, win8_1:1, win8_1x64:1, win2012:1,
                   win2012R2:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath){
  exit(0);
}

## Get Version from 'Ntoskrnl.exe' file
exeVer = fetch_file_version(sysPath, file_name:"system32\Ntoskrnl.exe");
if(!exeVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:exeVer, test_version:"6.0.6002.19454") ||
     version_in_range(version:exeVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23761")){
    security_message(0);
  }
  exit(0);
}

## Windows 7 and Windows 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:exeVer, test_version:"6.1.7601.18933") ||
     version_in_range(version:exeVer, test_version:"6.1.7601.22000", test_version2:"6.1.7601.23135")){
    security_message(0);
  }
  exit(0);
}

## Win 8 and 2012
if(hotfix_check_sp(win8:1, win8x64:1, win2012:1) > 0)
{
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:exeVer, test_version:"6.2.9200.17438") ||
     version_in_range(version:exeVer, test_version:"6.2.9200.20000", test_version2:"6.2.9200.21547")){
    security_message(0);
  }
  exit(0);
}

## Win 8.1 and win2012R2
if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Ntoskrnl.exe version
  if(version_is_less(version:exeVer, test_version:"6.3.9600.17936")){
    security_message(0);
  }
  exit(0);
}

## Windows 10
if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  ## Check for Ntoskrnl.exe version
  ## Windows 10 Core
  if(version_is_less(version:exeVer, test_version:"10.0.10240.16430")){
    security_message(0);
  }
  exit(0);
}