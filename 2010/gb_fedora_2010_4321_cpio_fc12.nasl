###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for cpio FEDORA-2010-4321
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

include("revisions-lib.inc");
tag_insight = "GNU cpio copies files into or out of a cpio or tar archive.  Archives
  are files which contain a collection of other files plus information
  about them, such as their file name, owner, timestamps, and access
  permissions.  The archive can be another file on the disk, a magnetic
  tape, or a pipe.  GNU cpio supports the following archive formats:  binary,
  old ASCII, new ASCII, crc, HPUX binary, HPUX old ASCII, old tar and POSIX.1
  tar.  By default, cpio creates binary format archives, so that they are
  compatible with older cpio programs.  When it is extracting files from
  archives, cpio automatically recognizes which kind of archive it is reading
  and can read archives created on machines with a different byte-order.

  Install cpio if you need a program to manage file archives.";

tag_affected = "cpio on Fedora 12";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.fedoraproject.org/pipermail/package-announce/2010-March/037401.html");
  script_id(861781);
  script_version("$Revision: 6625 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:29:16 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2010-03-22 11:34:53 +0100 (Mon, 22 Mar 2010)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_xref(name: "FEDORA", value: "2010-4321");
  script_cve_id("CVE-2010-0624");
  script_name("Fedora Update for cpio FEDORA-2010-4321");

  script_summary("Check for the Version of cpio");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");


res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC12")
{

  if ((res = isrpmvuln(pkg:"cpio", rpm:"cpio~2.10~5.fc12", rls:"FC12")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}