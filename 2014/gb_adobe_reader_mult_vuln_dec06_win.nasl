###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_adobe_reader_mult_vuln_dec06_win.nasl 6759 2017-07-19 09:56:33Z teissa $
#
# Adobe Reader Multiple Vulnerabilities Dec06 (Windows)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:adobe:acrobat_reader";
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.804366";

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6759 $");
  script_cve_id("CVE-2006-6027", "CVE-2006-6236");
  script_bugtraq_id(21155, 21338);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-19 11:56:33 +0200 (Wed, 19 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-04-07 19:51:38 +0530 (Mon, 07 Apr 2014)");
  script_name("Adobe Reader Multiple Vulnerabilities Dec06 (Windows)");

  tag_summary =
"This host is installed with Adobe Reader and is prone to multiple
vulnerabilities.";

  tag_vuldetect =
"Get the installed version with the help of detect NVT and check the version
is vulnerable or not.";

  tag_insight =
"Flaws are due to errors in the 'AcroPDF ActiveX' control in AcroPDF.dll.";

  tag_impact =
"Successful exploitation will allow attackers to conduct denial of service,
possibly execute arbitrary code and compromise a user's system.

Impact Level: System/Application";

  tag_affected =
"Adobe Reader version 7.0 through 7.0.8 on Windows.";

  tag_solution =
"Upgrade to Adobe Reader version 8.0 or later. For updates refer to
http://get.adobe.com/reader";


  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/23138");
  script_xref(name : "URL" , value : "http://securitytracker.com/id?1017297");
  script_xref(name : "URL" , value : "http://www.kb.cert.org/vuls/id/198908");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/30574");
  script_xref(name : "URL" , value : "http://www.adobe.com/support/security/bulletins/apsb06-20.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("secpod_adobe_prdts_detect_win.nasl");
  script_mandatory_keys("Adobe/Reader/Win/Ver");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
readerVer = "";

## Get version
if(!readerVer = get_app_version(cpe:CPE, nvt:SCRIPT_OID)){
  exit(0);
}

if(readerVer && readerVer =~ "^7")
{
  ## Check Adobe Reader vulnerable versions
  if(version_in_range(version:readerVer, test_version:"7.0", test_version2:"7.0.8"))
  {
    security_message(0);
    exit(0);
  }
}