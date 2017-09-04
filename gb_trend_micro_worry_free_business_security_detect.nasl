###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_trend_micro_worry_free_business_security_detect.nasl 3914 2016-08-31 09:49:38Z antu123 $
#
# Trend Micro Worry-Free Business Security Version Detection (Windows)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.809142");
  script_version("$Revision: 3914 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2016-08-31 11:49:38 +0200 (Wed, 31 Aug 2016) $");
  script_tag(name:"creation_date", value:"2016-08-23 11:41:39 +0530 (Tue, 23 Aug 2016)");
  script_name("Trend Micro Worry-Free Business Security Version Detection (Windows)");
  script_tag(name: "summary" , value: "Detection of installed version of Trend
  Micro Worry-Free Business Security.

  The script logs in via smb, searches for string 'Trend Micro Worry-Free
  Business Security' in the registry and reads the version information from
  registry.");

  script_tag(name:"qod_type", value:"registry");
  script_summary("Detection of Trend Micro Worry-Free Business Security");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");
include("version_func.inc");

## variable Initialization
os_arch = "";
trendPath = "";
trendName = "";
trendVer = "";
key = "";

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(-1);
}

## Confirm Trend Micro Worry-Free Business Security
if(!registry_key_exists(key:"SOFTWARE\TrendMicro\WFBS") &&
   !registry_key_exists(key:"SOFTWARE\Wow6432Node\TrendMicro\WFBS")){
  exit(0);
}

## Check for 32 bit platform
if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}

## Check for 64 bit platform
else if("x64" >< os_arch){
  key = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
}

if(isnull(key)){
  exit(0);
}

foreach item (registry_enum_keys(key:key))
{
  trendName = registry_get_sz(key:key + item, item:"DisplayName");

  #### Confirm Application
  if("Trend Micro Worry-Free Business Security" >< trendName)
  {
    trendVer = registry_get_sz(key:key + item, item:"DisplayVersion");
    trendPath = registry_get_sz(key:key + item, item:"InstallLocalPath");

    if(!trendPath){
      trendPath = "Couldn find the install location from registry";
    }

    if(trendVer)
    {
      set_kb_item(name:"Trend/Micro/Worry-Free/Business/Security/Ver", value:trendVer);

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:trendVer, exp:"^([0-9.]+)", base:"cpe:/a:trend_micro:business_security:");
      if(isnull(cpe))
        cpe = "cpe:/a:trend_micro:business_security";
    }

    ## Register Product and Build Report
    register_product(cpe:cpe, location:trendPath);

    log_message(data: build_detection_report(app: "Trend Micro Worry-Free Business Security",
                                             version: trendVer,
                                             install: trendPath,
                                             cpe: cpe,
                                             concluded: trendVer));
    exit(0);
  }
}