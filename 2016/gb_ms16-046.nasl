###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-046.nasl 5867 2017-04-05 09:01:13Z teissa $
#
# Microsoft Windows Secondary Logon Privilege Elevation Vulnerability (3148538)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807313");
  script_version("$Revision: 5867 $");
  script_cve_id("CVE-2016-0135");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-04-05 11:01:13 +0200 (Wed, 05 Apr 2017) $");
  script_tag(name:"creation_date", value:"2016-04-13 09:03:18 +0530 (Wed, 13 Apr 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Windows Secondary Logon Privilege Elevation Vulnerability (3148538)");

  script_tag(name: "summary" , value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-046.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and 
  check appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"The flaw exist due to Windows Secondary
  Logon Service fails to properly manage request handles in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow an
  attacker to run arbitrary code in kernel mode.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/en-us/library/security/MS16-046");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-in/kb/3148538");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/MS16-046");
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
if(hotfix_check_sp(win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

##Fetch the version of 'Seclogon.dll'
sysVer = fetch_file_version(sysPath, file_name:"System32\Seclogon.dll");
if(!sysVer){
  exit(0);
}

##Windows 10
if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  ## Check for Seclogon.dll version
  if(version_is_less(version:sysVer, test_version:"10.0.10240.16724"))
  {
    Vulnerable_range = "Less than 10.0.10240.16724";
    VULN = TRUE ;
  }
  ##Windows 10 Version 1511
  else if(version_in_range(version:sysVer, test_version:"10.0.10586.0", test_version2:"10.0.10586.161"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.161";
    VULN = TRUE ;
  }
}

  
if(VULN)
{
  report = 'File checked:     ' + sysPath + "\System32\Seclogon.dll" + '\n' +
           'File version:     ' + sysVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
exit(0);