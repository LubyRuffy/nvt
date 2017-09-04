###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_apr2017-3236618_02_lin.nasl 6092 2017-05-10 07:02:40Z cfi $
#
# Oracle Mysql Security Updates (apr2017-3236618) 02 - Linux
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:oracle:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810883");
  script_version("$Revision: 6092 $");
  script_cve_id("CVE-2017-3309", "CVE-2017-3308", "CVE-2017-3329", "CVE-2017-3456", 
                "CVE-2017-3453", "CVE-2017-3600", "CVE-2017-3462", "CVE-2017-3463", 
                "CVE-2017-3461", "CVE-2017-3464" );
  script_bugtraq_id(97742, 97725, 97763, 97831, 97776, 97765, 97851, 97849, 97812,
                    97818);
  script_tag(name:"cvss_base", value:"6.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-05-10 09:02:40 +0200 (Wed, 10 May 2017) $");
  script_tag(name:"creation_date", value:"2017-04-19 16:44:58 +0530 (Wed, 19 Apr 2017)");
  script_name("Oracle Mysql Security Updates (apr2017-3236618) 02 - Linux");

  script_tag(name:"summary", value:"This host is running Oracle MySQL and is
  prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"Multiple flaws exists due to multiple
  unspecified errors in the 'Server: DML', 'Server: Optimizer',
  'Server: Thread Pooling', 'Client mysqldump', 'Server: Security: Privileges'
  components of the application.");

  script_tag(name: "impact" , value:"Successful exploitation of this vulnerability
  will allow remote attackers to have impact on availability, confidentiality
  and integrity.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Oracle MySQL version 5.5.54 and earlier,
  5.6.35 and earlier, 5.7.17 and earlier on Linux");

  script_tag(name:"solution", value:"Apply the patch from below link,
  http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/security-advisory/cpuapr2017-3236618.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_fingerprint.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
mysqlVer = "";
sqlPort = "";

if(host_runs("Linux") != "yes"){
  exit(0);
}

## Get port
if(!sqlPort = get_app_port(cpe:CPE))
{
  CPE = "cpe:/a:mysql:mysql";
  if(!sqlPort = get_app_port(cpe:CPE)){
    exit(0);
  }
}

## Get version
if(!mysqlVer = get_app_version(cpe:CPE, port:sqlPort)){
  exit(0);
}

if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.54") ||
   version_in_range(version:mysqlVer, test_version:"5.6", test_version2:"5.6.35") ||
   version_in_range(version:mysqlVer, test_version:"5.7", test_version2:"5.7.17"))
{
  report = report_fixed_ver(installed_version:mysqlVer, fixed_version: "Apply the patch");
  security_message(data:report, port:sqlPort);
  exit(0);
}