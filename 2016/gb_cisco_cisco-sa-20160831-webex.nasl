###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_cisco-sa-20160831-webex.nasl 5650 2017-03-21 10:00:45Z teissa $
#
# Cisco WebEx Meetings Player Denial of Service Vulnerability (Windows)
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH
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

CPE = "cpe:/a:cisco:webex_wrf_player";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107075");
  script_version("$Revision: 5650 $");
  script_cve_id("CVE-2016-1415");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-21 11:00:45 +0100 (Tue, 21 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-11-08 11:19:11 +0530 (Tue, 08 Nov 2016)");
  script_name("Cisco WebEx Meetings Player Denial of Service Vulnerability (Windows)");

  script_tag(name: "summary" , value: "This host is installed with Cisco
  WebEx Meetings Player and is prone to Denial of Service Vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the
  help  of detection NVT and check if the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The vulnerability is due to improper validation of user-supplied files. 
  An attacker could exploit this vulnerability by persuading a user to open a malicious file by using the affected software.");

  script_tag(name: "impact" , value: "A successful exploit could allow the attacker to cause WebEx Meetings Player to crash.");

  script_tag(name: "affected" , value:"Cisco WebEx Meetings Player version T29.10 for WRF files.");

  script_tag(name: "solution" , value:"Updates are available from the Cisco WebEx Meetings Server where the player was installed from, see advisory .");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"registry");

  script_xref(name: "URL" , value : "https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160831-webex");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("CISCO");
  script_dependencies("gb_cisco_webexwrf_detect_win.nasl");
  script_mandatory_keys("Cisco/Wrfplayer/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
wpVer = "";

## Get version
if(!wpVer = get_app_version(cpe:CPE)){
  exit(0);
}

if (version_is_equal(version: wpVer, test_version:"29.10"))
{
   report = 'Installed version: ' + wpVer + '\n' +
           'Fixed versions:  See vendor \n';
   security_message(data:report);
   exit(0);
}