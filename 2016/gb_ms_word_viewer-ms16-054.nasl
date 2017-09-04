###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms_word_viewer-ms16-054.nasl 5689 2017-03-23 10:00:49Z teissa $
#
# Microsoft Office Word Viewer Remote Code Execution Vulnerability (3155544)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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
  script_oid("1.3.6.1.4.1.25623.1.0.807822");
  script_version("$Revision: 5689 $");
  script_cve_id("CVE-2016-0198");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-23 11:00:49 +0100 (Thu, 23 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-05-11 12:57:51 +0530 (Wed, 11 May 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Office Word Viewer Remote Code Execution Vulnerability (3155544)");

  script_tag(name:"summary", value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-054");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw exist as office software fails
  to properly handle objects in memory.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to run arbitrary code in the context of the current user.

  Impact Level: System/Application");

  script_tag(name:"affected", value:"Microsoft Word Viewer 2007");

  script_tag(name:"solution", value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  below link,
  https://technet.microsoft.com/library/security/MS16-054");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3115132");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3155544");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-054");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_office_products_version_900032.nasl");
  script_mandatory_keys("SMB/Office/WordView/Version");
  exit(0);
}


include("version_func.inc");

## Variable Initailization
wordviewVer = "";

wordviewVer = get_kb_item("SMB/Office/WordView/Version");
if(wordviewVer)
{
  ## Check for Wordview.exe 11.0 < 11.0.8428
  if(version_in_range(version:wordviewVer, test_version:"11.0", test_version2:"11.0.8427"))
  {
    report = 'File checked:     Wordview.exe ' + '\n' +
             'File version:     ' + wordviewVer  + '\n' +
             'Vulnerable range: 11.0 - 11.0.8427 \n' ;
    security_message(data:report);
    exit(0);
  }
}