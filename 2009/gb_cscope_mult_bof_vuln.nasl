###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cscope_mult_bof_vuln.nasl 11554 2018-09-22 15:11:42Z cfischer $
#
# Cscope Multiple Buffer Overflow Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2009 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.800611");
  script_version("$Revision: 11554 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-22 17:11:42 +0200 (Sat, 22 Sep 2018) $");
  script_tag(name:"creation_date", value:"2009-05-18 09:37:31 +0200 (Mon, 18 May 2009)");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_cve_id("CVE-2009-0148");
  script_name("Cscope Multiple Buffer Overflow vulnerability");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2009/1238");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=490667");
  script_xref(name:"URL", value:"http://sourceforge.net/project/shownotes.php?release_id=679527");

  script_tag(name:"qod_type", value:"executable_version");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 Greenbone Networks GmbH");
  script_family("Buffer overflow");
  script_dependencies("gb_cscope_detect.nasl");
  script_mandatory_keys("Cscope/Ver");
  script_tag(name:"impact", value:"Successful exploitation could allow remote attackers to execute arbitrary
  code or cause buffer overflows while parsing specially crafted files or
  directories.");
  script_tag(name:"affected", value:"Cscope version prior to 15.7a");
  script_tag(name:"insight", value:"Boundary error exists in various functions using insecure sprintf, snprintf
  via long strings in input such as source-code tokens and pathnames.");
  script_tag(name:"solution", value:"Upgrade to Cscope version 15.7a
  http://sourceforge.net/projects/cscope");
  script_tag(name:"summary", value:"This host has installed Cscope and is prone to Multiple Buffer
  Overflow vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}


include("version_func.inc");

cscopeVer = get_kb_item("Cscope/Ver");
if(!cscopeVer){
  exit(0);
}

if(version_is_less(version:cscopeVer, test_version:"15.7a")){
  security_message( port: 0, data: "The target host was found to be vulnerable" );
}
