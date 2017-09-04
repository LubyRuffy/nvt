##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_isc_bind_control_channel_dos_vuln_win.nasl 6223 2017-05-26 12:27:08Z antu123 $
#
# ISC BIND Control Channel Denial of Service Vulnerability (Windows) 
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

CPE = "cpe:/a:isc:bind";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810978");
  script_version("$Revision: 6223 $");
  script_cve_id("CVE-2017-3138");
  script_bugtraq_id(97657);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-26 14:27:08 +0200 (Fri, 26 May 2017) $");
  script_tag(name:"creation_date", value:"2017-05-23 11:40:43 +0530 (Tue, 23 May 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("ISC BIND Control Channel Denial of Service Vulnerability (Windows)");

  script_tag(name: "summary" , value:"The host is installed with ISC BIND and is
  prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exist due to a feature in named
  which allows operators to issue commands to a running server by communicating 
  with the server process over a control channel, using a utility program such 
  as rndc.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service (assertion failure and daemon exit) via
  null command string.

  Impact Level: Application");

  script_tag(name:"affected", value:"ISC BIND 9.9.9 through 9.9.9-P7, 9.9.10b1
  through 9.9.10rc2, 9.10.4 through 9.10.4-P7, 9.10.5b1 through 9.10.5rc2, 
  9.11.0 through 9.11.0-P4, 9.11.1b1 through 9.11.1rc2, 9.9.9-S1 through 
  9.9.9-S9 on Windows.");

  script_tag(name:"solution", value:"Upgrade to ISC BIND version 9.9.9-P8 or 
  9.10.4-P8 or 9.11.0-P5 or 9.9.9-S10 or 9.9.10rc3 or 9.10.5rc3 or 9.11.1rc3 
  or later on Windows. For updates refer to https://www.isc.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://kb.isc.org/article/AA-01471/74/CVE-2017-3138");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("bind_version.nasl", "os_detection.nasl");
  script_mandatory_keys("ISC BIND/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");
include("revisions-lib.inc");

##Variable Initialization
bindPort = "";
infos = "";
bindVer ="";
proto ="";
fix= "";

## exit, if its not Windows
if(host_runs("Windows") != "yes"){
  exit(0);
}

## Get port
if( ! bindPort = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_proto( cpe:CPE, port:bindPort ) ) exit( 0 );

bindVer = infos["version"];
proto = infos["proto"];

## Check for vulnerable version
if(bindVer =~ "^(9\.9)")
{
  if (bindVer =~ "9\.9\.9" && revcomp(a: bindVer, b: "9.9.9.P8") < 0){
      fix = "9.9.9-P8";
    }
 
  else if((revcomp(a: bindVer, b: "9.9.10.b1") >= 0) && (revcomp(a: bindVer, b: "9.9.10.rc3") < 0)){
    fix = "9.9.10.rc3";
  }

  else if((revcomp(a: bindVer, b: "9.10.4") >= 0) && (revcomp(a: bindVer, b: "9.10.4.P8") < 0)){
    fix = "9.10.4.P8";
  }

  else if((revcomp(a: bindVer, b: "9.10.5.b1") >= 0) && (revcomp(a: bindVer, b: "9.10.5.rc3") < 0)){
    fix = "9.10.5.rc3";
  }

  else if((revcomp(a: bindVer, b: "9.11.0") >= 0) && (revcomp(a: bindVer, b: "9.11.0.P5") < 0)){
    fix = "9.11.0.P5";
  }

  else if((revcomp(a: bindVer, b: "9.11.1.b1") >= 0) && (revcomp(a: bindVer, b: "9.11.1.rc3") < 0)){
    fix = "9.10.5.rc3";
  }
 
  else if((revcomp(a: bindVer, b: "9.9.9.S1") >= 0) && (revcomp(a: bindVer, b: "9.9.9.S10") < 0)){
    fix = "9.9.9.S10";
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:bindVer, fixed_version:fix);
  security_message(data:report, port:bindPort, proto:proto);
  exit(0);
}

exit(99);