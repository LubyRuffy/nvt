###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_torrentvolve_xss_vuln.nasl 5148 2017-01-31 13:16:55Z teissa $
#
# TorrentVolve archive.php XSS Vulnerability
#
# Authors:
# Nikita MR <rnikita@secpod.com>
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation will allow attacker to delete arbitrary
files on the affected system if register_globals is enabled.

Impact level: Application";

tag_affected = "TorrentVolve 1.4 and prior.";

tag_insight = "The flaw occurs because archive.php does not sanitise the data
passed into 'deleteTorrent' parameter before being returned to the user.";

tag_solution = "No solution or patch was made available for at least one year
since disclosure of this vulnerability. Likely none will be provided anymore.
General solution options are to upgrade to a newer release, disable respective
features, remove the product or replace the product by another one.";

tag_summary = "This host is running TorrentVolve and is prone to Cross Site
  Scripting vulnerability.";

if(description)
{
  script_id(900577);
  script_version("$Revision: 5148 $");
  script_tag(name:"last_modification", value:"$Date: 2017-01-31 14:16:55 +0100 (Tue, 31 Jan 2017) $");
  script_tag(name:"creation_date", value:"2009-06-26 07:55:21 +0200 (Fri, 26 Jun 2009)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cve_id("CVE-2009-2101");
  script_name("TorrentVolve archive.php XSS Vulnerability");
  script_xref(name : "URL" , value : "http://www.milw0rm.com/exploits/8931");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/51088");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Web application abuses");
  script_dependencies("secpod_torrentvolve_detect.nasl");
  script_require_ports("Services/www", 80);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name:"solution_type", value:"WillNotFix");
  exit(0);
}


include("http_func.inc");
include("version_func.inc");

tvPort = get_http_port(default:80);
if(!tvPort){
  exit(0);
}

tvVer = get_kb_item("www/" + tvPort + "/TorrentVolve");
tvVer = eregmatch(pattern:"^(.+) under (/.*)$", string:tvVer);
if(tvVer[1] == NULL){
  exit(0);
}

if(version_is_less_equal(version:tvVer[1], test_version:"1.4")){
  security_message(tvPort);
}