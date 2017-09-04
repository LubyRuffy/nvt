###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_picasa_detect_win.nasl 6032 2017-04-26 09:02:50Z teissa $
#
# Google Picasa Version Detection (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Updated By: Rachana Shetty <srachana@secpod.com> on 2011-08-02
#  - Updated to detect build version from .exe file.
#
# Updated By: Shakeel <bshakeel@secpod.com> on 2014-01-20
#  - According to CR57 and new style script_tags.
#
# Copyright:
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.801769");
  script_version("$Revision: 6032 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-04-26 11:02:50 +0200 (Wed, 26 Apr 2017) $");
  script_tag(name:"creation_date", value:"2011-04-11 14:40:00 +0200 (Mon, 11 Apr 2011)");
  script_tag(name:"qod_type", value:"registry");
  script_name("Google Picasa Version Detection (Windows)");

  script_tag(name: "summary" , value: "Detection of installed version of
  Google Picasa on Windows.

  The script logs in via smb, searches for Picasa in the registry, gets the
  Picasa installation path from registry and fetches version from 
  'moviethumb.exe' file.");


  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}

include("cpe.inc");
include("smb_nt.inc");
include("secpod_smb_func.inc");
include("host_details.inc");
include("version_func.inc");

## Variable Initialization
picName="";
picPath="";
picVer="";
osArch = "";
key_list = "";

osArch = get_kb_item("SMB/Windows/Arch");
if(!osArch){
  exit(0);
}

#Check if Adobe Application is installed
if(!registry_key_exists(key:"SOFTWARE\Google\Picasa") &&
   !registry_key_exists(key:"SOFTWARE\Wow6432Node\Google\Picasa")){
  exit(0);
}

## if os is 32 bit iterate over comman path
if("x86" >< osArch){
  key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\");
}

## Check for 64 bit platform
else if("x64" >< osArch){
 key_list = make_list("SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\",
                      "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\");
}

foreach key (key_list)
{
  foreach item (registry_enum_keys(key:key))
  {
    picName = registry_get_sz(key:key + item, item:"DisplayName");
  
    ## Check the name of the application
    if("Picasa" >< picName)
    {
      ## Check for the install path
      picPath = registry_get_sz(key:key + item, item:"UninstallString");
      if(!isnull(picPath))
      {
        picPath = ereg_replace(pattern:'"', replace:"", string:picPath);
        picPath = picPath - "\Uninstall.exe";

        ## Check for moviethumb (original picasa.exe) file version
        picVer = fetch_file_version(sysPath:picPath, file_name:"moviethumb.exe");
        if(picVer)
        {
          ## Set the KB item
          set_kb_item(name:"Google/Picasa/Win/Ver", value:picVer);

          ## build cpe and store it as host_detail
          cpe = build_cpe(value:picVer, exp:"^([0-9.]+)", base:"cpe:/a:google:picasa:");
          if(isnull(cpe))
            cpe = "cpe:/a:google:picasa";

          if("x64" >< osArch && "Wow6432Node" >!< key)
          { 
            ## Set the KB item
            set_kb_item(name:"Google/Picasa64/Win/Ver", value:picVer);

            ## build cpe and store it as host_detail for 64 bit
            cpe = build_cpe(value:picVer, exp:"^([0-9.]+)", base:"cpe:/a:google:picasa:x64:");
            if(isnull(cpe))
              cpe = "cpe:/a:google:picasa:x64";
          }

          ##register cpe
          register_product(cpe:cpe, location:picPath);
          log_message(data: build_detection_report(app: "Google Picasa",
                                                   version: picVer,
                                                   install: picPath,
                                                   cpe: cpe,
                                                   concluded: picVer));
          ## To improve performance by avoiding extra iteration over uninstall path
          exit(0);
        }
      }
    }
  }
}