###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_google_chrome_clickjacking_vuln_jun13_macosx.nasl 6104 2017-05-11 09:03:48Z teissa $
#
# Google Chrome Clickjacking Vulnerability June13 (MAC OS X)
#
# Authors:
# Arun Kallavi <karun@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_impact = "Successful exploitation will allow attackers to obtain sensitive information
  and conduct clickjacking attacks against the user's Flash configuration.
  Impact Level: Application";

tag_affected = "Google Chrome version prior to 27.0.1453.116 on MAC OS X";
tag_insight = "Flaw within Flash plug-in which does not properly determine whether a user
  wishes to permit camera or microphone access by a Flash application.";
tag_solution = "Upgrade to the Google Chrome 27.0.1453.116 or later,
  For updates refer to http://www.google.com/chrome";
tag_summary = "The host is installed with Google Chrome and is prone to
  Clickjacking vulnerability.";

if(description)
{
  script_id(803676);
  script_version("$Revision: 6104 $");
  script_cve_id("CVE-2013-2866");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2017-05-11 11:03:48 +0200 (Thu, 11 May 2017) $");
  script_tag(name:"creation_date", value:"2013-06-24 12:10:48 +0530 (Mon, 24 Jun 2013)");
  script_name("Google Chrome Clickjacking Vulnerability June13 (MAC OS X)");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1028694");
  script_xref(name : "URL" , value : "http://googlechromereleases.blogspot.in/2013/06/stable-channel-update_18.html");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_google_chrome_detect_macosx.nasl");
  script_mandatory_keys("GoogleChrome/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
chromeVer = "";

## Get the version from KB
chromeVer = get_kb_item("GoogleChrome/MacOSX/Version");
if(!chromeVer){
  exit(0);
}

## Check for Google Chrome Version less than 27.0.1453.116
if(version_is_less(version:chromeVer, test_version:"27.0.1453.116")){
  security_message(0);
}