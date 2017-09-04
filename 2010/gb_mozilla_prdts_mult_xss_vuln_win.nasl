###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mozilla_prdts_mult_xss_vuln_win.nasl 6444 2017-06-27 11:24:02Z santu $
#
# Mozilla Products Multiple Cross-site Scripting Vulnerabilities (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Upgrade to Firefox version 3.6.11 or 3.5.14 or later
  http://www.mozilla.com/en-US/firefox/all.html

  Upgrade to Seamonkey version 2.0.9 or later
  http://www.seamonkey-project.org/releases/";

tag_impact = "Successful exploitation will let attackers to inject arbitrary web script or
  HTML via a crafted name of a file or directory on a Gopher server.
  Impact Level: Application";
tag_affected = "SeaMonkey version before 2.0.9
  Firefox version before 3.5.14 and 3.6.x before 3.6.11";
tag_insight = "The flaw is due to an error in functions used by the 'Gopher parser'
  to convert text to HTML tags, could be exploited to turn text into executable
  JavaScript.";
tag_summary = "The host is installed with Mozilla Firefox/Seamonkey and is prone
  to multiple vulnerabilities.";

if(description)
{
  script_id(801471);
  script_version("$Revision: 6444 $");
  script_tag(name:"last_modification", value:"$Date: 2017-06-27 13:24:02 +0200 (Tue, 27 Jun 2017) $");
  script_tag(name:"creation_date", value:"2010-10-28 11:50:37 +0200 (Thu, 28 Oct 2010)");
  script_cve_id("CVE-2010-3177");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_name("Mozilla Products Multiple Cross-site Scripting Vulnerabilities (Windows)");

  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2010/mfsa2010-68.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2010 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_firefox_detect_win.nasl", "gb_seamonkey_detect_win.nasl");
  script_mandatory_keys("Mozilla/Firefox_or_Seamonkey_or_Thunderbird/Installed");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Firefox Check
ffVer = get_kb_item("Firefox/Win/Ver");
if(ffVer)
{
  # Grep for Firefox version
  if(version_is_less(version:ffVer, test_version:"3.5.14") ||
     version_in_range(version:ffVer, test_version:"3.6.0", test_version2:"3.6.10"))
  {
    security_message(0);
    exit(0);
  }
}

# Seamonkey Check
smVer = get_kb_item("Seamonkey/Win/Ver");
if(smVer != NULL)
{
  # Grep for Seamonkey version
  if(version_is_less(version:smVer, test_version:"2.0.9")){
    security_message(0);
  }
}