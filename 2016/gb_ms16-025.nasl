###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-025.nasl 5598 2017-03-17 10:00:43Z teissa $
#
# Microsoft Windows Library Loading Remote Code Execution Vulnerability (3140709)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806896");
  script_version("$Revision: 5598 $");
  script_cve_id("CVE-2016-0100");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-17 11:00:43 +0100 (Fri, 17 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-03-09 08:53:44 +0530 (Wed, 09 Mar 2016)");
  script_name("Microsoft Windows Library Loading Remote Code Execution Vulnerability (3140709)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-025");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation of
  input before loading certain libraries.");

  script_tag(name:"impact", value:"Successful exploitation will allow  an
  authenticated user to execute code with elevated privileges that would allow
  them to install programs, and to take complete control of an affected system.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows Vista x32/x64 Edition Service Pack 2
  Microsoft Windows Server 2008 x32/x64 Edition Service Pack 2");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-025");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3140709");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-025");

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
sysVer = "";
## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win2008:3) <= 0){
  exit(0);
}

## Get System Path
sysPath = registry_get_sz(key:"SOFTWARE\Microsoft\Windows\CurrentVersion",
                          item:"CommonFilesDir");
if(!sysPath ){
  exit(0);
}

##Fetch the version of wab32.dll
sysVer = fetch_file_version(sysPath, file_name:"\System\Wab32.dll");
if(!sysVer){
  exit(0);
}

if (sysVer =~ "^(6\.0\.6002\.1)"){
  Vulnerable_range = "Less than 6.0.6002.19598";
}
else if (sysVer =~ "^(6\.0\.6002\.2)"){
  Vulnerable_range = "6.0.6002.23000 - 6.0.6002.23909";
}

## Windows Vista and Server 2008
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for wab32.dll version
  if(version_is_less(version:sysVer, test_version:"6.0.6002.19598")||
     version_in_range(version:sysVer, test_version:"6.0.6002.23000", test_version2:"6.0.6002.23909"))
  {
    report = 'File checked:     ' + sysPath + "\System\Wab32.dll" + '\n' +
             'File version:     ' + sysVer  + '\n' +
             'Vulnerable range: ' + Vulnerable_range + '\n' ;
    security_message(data:report);
    exit(0);
  }
}