###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_foxit_pdf_toolkit_detect.nasl 6506 2017-07-03 10:22:51Z cfischer $
#
# Foxit PDF Toolkit Detection
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810522");
  script_version("$Revision: 6506 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-07-03 12:22:51 +0200 (Mon, 03 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-01-25 15:52:27 +0530 (Wed, 25 Jan 2017)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Foxit PDF Toolkit Detection");

  script_tag(name: "summary" , value: "Detection of installed version of
  Foxit PDF Toolkit.

  The script logs in via smb and gets the version from Foxit PDF Toolkit 
  file 'fhtml2pdf.exe'.");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Product detection");
  script_dependencies("secpod_reg_enum.nasl", "smb_reg_service_pack.nasl");
  script_mandatory_keys("SMB/WindowsVersion", "SMB/Windows/Arch");
  script_require_ports(139, 445);
  exit(0);
}

include("smb_nt.inc");
include("cpe.inc");
include("secpod_smb_func.inc");
include("host_details.inc");
include("version_func.inc");

## Get host
host    = get_host_ip();

usrname = get_kb_item("SMB/login");
passwd  = get_kb_item("SMB/password");
domain  = get_kb_item("SMB/domain");
if( domain ) usrname = domain + '\\' + usrname;

if(!host || !usrname || !passwd){
  exit(0);
}

## Get the handle to execute wmi query
handle = wmi_connect(host:host, username:usrname, password:passwd);

if(!handle){
  exit(0);
}

## WMI query to grep the file version
query = 'Select Manufacturer, Version from CIM_DataFile Where FileName ='
        + raw_string(0x22) +'fhtml2pdf' +raw_string(0x22) + ' AND Extension ='
        + raw_string(0x22) +'exe' + raw_string(0x22);

appConfirm = wmi_query(wmi_handle:handle, query:query);

## Application confirmation
if("Foxit Software Inc" >< appConfirm)
{
  ## Grep for version from query response
  version = eregmatch(pattern:"\fhtml2pdf.exe.?([0-9.]+)", string:appConfirm);
  if(version[1])
  {
    path = eregmatch(pattern:"Foxit Software Inc\|(.*)\|([0-9.]+)", string:appConfirm);
    if(path){
      path = path[1];
    } else {
        path = "Couldn find the install location from registry";
    }

    ## Set the version in KB
    set_kb_item(name:"Foxit/PDFToolkit/Win/Ver", value:version[1]);

    ## build cpe and store it as host_detail
    cpe = build_cpe(value:version[1], exp:"^([0-9.]+)", base:"cpe:/a:foxitsoftware:foxit_pdf_toolkit:");
    if(isnull(cpe))
      cpe = "cpe:/a:foxitsoftware:foxit_pdf_toolkit";

    ## Register Product and Build Report
    register_product(cpe:cpe, location:path);

    log_message(data: build_detection_report(app: "Foxit PDF Toolkit",
                                             version: version[1],
                                             install: path,
                                             cpe: cpe,
                                             concluded: version[1]));
    exit(0);
  }
}
exit(0);

