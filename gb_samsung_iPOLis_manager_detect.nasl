###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_samsung_iPOLis_manager_detect.nasl 5351 2017-02-20 08:03:12Z mwiegand $
#
# Samsung iPOLiS Device Manager Version Detection (Windows)
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
  script_oid("1.3.6.1.4.1.25623.1.0.805481");
  script_version("$Revision: 5351 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-02-20 09:03:12 +0100 (Mon, 20 Feb 2017) $");
  script_tag(name:"creation_date", value:"2015-03-20 15:38:22 +0530 (Fri, 20 Mar 2015)");
  script_name("Samsung iPOLiS Device Manager Version Detection (Windows)");

  script_tag(name: "summary" , value: "Detection of installed version of
  Samsung iPOLiS Device Manager.

  The script logs in via smb, searches for string 'iPOLiS Device Manager' in
  the registry and reads the version information from registry.");

  script_tag(name:"qod_type", value:"registry");
  script_summary("Detection of installed version of iPOLiS Device Manager");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}


## variable Initialization
key = "";
Ver = "";
iver = NULL;
os_arch = "";
ipolisPath = "";
ipolisName = "";
vers = string("unknown");


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");
include("version_func.inc");

## Get OS Architecture
os_arch = get_kb_item("SMB/Windows/Arch");
if(!os_arch){
  exit(0);
}


## Only 32-bit version is available
## Check for 32 bit platform
if("x86" >< os_arch){
  key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\";
}
## Check for 64 bit platform
else if("x64" >< os_arch){
  key = "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\";
}

##Iterate
foreach item (registry_enum_keys(key:key))
{
  ipolisName = registry_get_sz(key:key + item, item:"DisplayName");

  #### Confirm Application
  if("iPOLiS Device Manager" >< ipolisName)
  {
    Ver = registry_get_sz(key:key + item, item:"DisplayVersion");
    iver = eregmatch(pattern:"([0-9.]+)", string:Ver);
    if(iver[1]){ 
      vers = iver[1];
    }

    ipolisPath = registry_get_sz(key:key + item, item:"InstallLocation");
    if(!ipolisPath){
      ipolisPath = "Couldn find the install location from registry";
    }

    if(vers)
    {
      set_kb_item(name:"Samsung/iPOLiS_Device_Manager/Win/Ver", value:vers);

      ## build cpe and store it as host_detail
      cpe = build_cpe(value:vers, exp:"^([0-9.]+)", base:"cpe:/a:samsung:ipolis_device_manager:");

      if(isnull(cpe))
        cpe = "cpe:/a:samsung:ipolis_device_manager";

      ## Register Product and Build Report
      register_product(cpe:cpe, location:ipolisPath);

      log_message(data: build_detection_report(app: "iPOLiS Device Manager",
                                           version: vers,
                                           install: ipolisPath,
                                           cpe: cpe,
                                           concluded: vers));
      exit(0);
    }
  }
}