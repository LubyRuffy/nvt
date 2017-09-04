###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-005.nasl 5588 2017-03-16 10:00:36Z teissa $
#
# Microsoft Windows Kernel-Mode Drivers Remote Code Execution Vulnerabilities (3124584)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807028");
  script_version("$Revision: 5588 $");
  script_cve_id("CVE-2016-0009", "CVE-2016-0008");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-16 11:00:36 +0100 (Thu, 16 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-01-13 09:01:03 +0530 (Wed, 13 Jan 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Kernel-Mode Drivers Remote Code Execution Vulnerabilities (3124584)");

  script_tag(name: "summary" , value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-005.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to:
  - A security feature bypass vulnerability exists in the way Windows graphics
    device interface handles objects in memory.
  - An error in the way Windows handles objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an attacker
  to bypass Address Space Layout Randomization (ASLR) protection mechanisms and
  gain access to sensitive informationand to execute arbitrary code in the
  context of the currently logged-in user.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 8 x32/x64
  Microsoft Windows 10 x32/x64
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 Version 1511 x32/x64
  Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2
  Microsoft Windows 7 x32/x64 Edition Service Pack 1
  Microsoft Windows Server 2008 R2 x64 Edition Service Pack 1.");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-005");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3124001");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3124000");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-005");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
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
dllVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2, win8:1,
                   win8x64:1, win2012:1, win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'Gdi32.dll' and 'Win32k.sys'
dllVer = fetch_file_version(sysPath, file_name:"System32\Gdi32.dll");
sysVer = fetch_file_version(sysPath, file_name:"System32\Win32k.sys");
dllVer3 = fetch_file_version(sysPath, file_name:"SysWOW64\Gdi32.dll");
if(dllVer3){
  GdiPath64 = sysPath + "\SysWOW64\Gdi32.dll";
}

if(!dllVer && !sysVer && !dllVer3){
  exit(0);
}

## Windows 7 and Windows 2008 R2
if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2) > 0)
{
  if(dllVer)
  {
    ## Check for Gdi32.dll version
    if(version_is_less(version:dllVer, test_version:"6.1.7601.19091"))
    {
      Vulnerable_range = "Less than 6.1.7601.19091";
      VULN1 = TRUE ;
    }
    else if(version_in_range(version:dllVer, test_version:"6.1.7601.23000", test_version2:"6.1.7601.23289"))
    {
      Vulnerable_range = "6.1.7601.23000 - 6.1.7601.23289";
      VULN1 = TRUE ;
    }
  }

  if(sysVer)
  {
    ## Check for Win32k.sys version
    if(version_is_less(version:sysVer, test_version:"6.1.7601.19091"))
    {
      Vulnerable_range = "Less than 6.1.7601.19091";
      VULN2 = TRUE ;
    }
    else if(sysVer && version_in_range(version:sysVer, test_version:"6.1.7601.23000", test_version2:"6.1.7601.23289"))
    {
      Vulnerable_range = "6.1.7601.23000 - 6.1.7601.23289";
      VULN2 = TRUE ;
    }
  }
}

## Windows Vista and Windows Server 2008
## Currently not supporting for Vista and Windows Server 2008 64 bit
else if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  if(dllVer)
  {
    ## Check for Gdi32.dll version
    if(version_is_less(version:dllVer, test_version:"6.0.6002.19554"))
    {
      Vulnerable_range = "Less than 6.0.6002.19554";
      VULN1 = TRUE ;
    }
    else if(version_in_range(version:dllVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23863"))
    {
      Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23863";
      VULN1 = TRUE ;
    }
  }

  if(sysVer)
  {
    ## Check for Win32k.sys version
    if(version_is_less(version:sysVer, test_version:"6.0.6002.19554"))
    {
      Vulnerable_range = "Less than 6.0.6002.19554";
      VULN2 = TRUE ;
    }
    else if(version_in_range(version:sysVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23863"))
    {
      Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23863";
      VULN2 = TRUE ;
    }
  }
}

## Win 8 x86
else if(hotfix_check_sp(win8:1) > 0 && dllVer)
{
  ## Check for Gdi32.dll version
  if(version_is_less(version:dllVer, test_version:"6.2.9200.17592"))
  {
    Vulnerable_range = "Less than 6.2.9200.17592";
    VULN1 = TRUE ;
  }
  else if(version_in_range(version:dllVer, test_version:"6.2.9200.21000", test_version2:"6.2.9200.21712"))
  {
    Vulnerable_range = "6.2.9200.21000 - 6.2.9200.21712";
    VULN1 = TRUE ;
  }
}

## Win 8 and 2012 x64
else if(hotfix_check_sp(win8x64:1, win2012:1) > 0 && dllVer3)
{
  ## Check for Gdi32.dll version
  if(version_is_less(version:dllVer3, test_version:"6.2.9200.17591"))
  {
     report = 'File checked:     ' + GdiPath64 + '\n' +
              'File version:     ' + dllVer3  + '\n' +
              'Vulnerable range:  Less than 6.2.9200.17591\n' ;
     security_message(data:report);
     exit(0);
  }
  else if(version_in_range(version:dllVer3, test_version:"6.2.9200.21000", test_version2:"6.2.9200.21713"))
  {
    report = 'File checked:     ' + GdiPath64 + '\n' +
             'File version:     ' + dllVer3  + '\n' +
             'Vulnerable range:  6.2.9200.21000 - 6.2.9200.21713\n' ;
    security_message(data:report);
    exit(0);
  }
}

## Win 8.1 and win2012R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0 && dllVer)
{
  ## Check for Gdi32.dll version
  if(version_is_less(version:dllVer, test_version:"6.3.9600.18155"))
  {
    Vulnerable_range = "Less than 6.3.9600.18155";
    VULN1 = TRUE ;
  }
}

## Windows 10
else if(hotfix_check_sp(win10:1, win10x64:1) > 0 && dllVer)
{
  ## Windows 10 Core
  ## Check for Gdi32.dll version
  if(version_is_less(version:dllVer, test_version:"10.0.10240.16644"))
  {
    Vulnerable_range = "Less than 10.0.10240.16644";
    VULN1 = TRUE ;
  }
  ## Windows 10 version 1511
  ## Check for Gdi32.dll version
  else if(version_in_range(version:dllVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.62"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.62";
    VULN1 = TRUE ;
  }
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\System32\Gdi32.dll" + '\n' +
           'File version:     ' + dllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}

if(VULN2)
{
  report = 'File checked:     ' + sysPath + "\System32\Win32k.sys" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);