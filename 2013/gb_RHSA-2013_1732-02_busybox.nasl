###############################################################################
# OpenVAS Vulnerability Test
#
# RedHat Update for busybox RHSA-2013:1732-02
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_id(871069);
  script_version("$Revision: 6687 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-12 11:46:43 +0200 (Wed, 12 Jul 2017) $");
  script_tag(name:"creation_date", value:"2013-11-21 10:42:42 +0530 (Thu, 21 Nov 2013)");
  script_cve_id("CVE-2013-1813");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_name("RedHat Update for busybox RHSA-2013:1732-02");

  tag_insight = "BusyBox provides a single binary that includes versions of a large number
of system commands, including a shell. This can be very useful for
recovering from certain types of system failures, particularly those
involving broken shared libraries.

It was found that the mdev BusyBox utility could create certain directories
within /dev with world-writable permissions. A local unprivileged user
could use this flaw to manipulate portions of the /dev directory tree.
(CVE-2013-1813)

This update also fixes the following bugs:

* Previously, due to a too eager string size optimization on the IBM System
z architecture, the 'wc' BusyBox command failed after processing standard
input with the following error:

    wc: : No such file or directory

This bug was fixed by disabling the string size optimization and the 'wc'
command works properly on IBM System z architectures. (BZ#820097)

* Prior to this update, the 'mknod' command was unable to create device
nodes with a major or minor number larger than 255. Consequently, the kdump
utility failed to handle such a device. The underlying source code has been
modified, and it is now possible to use the 'mknod' command to create
device nodes with a major or minor number larger than 255. (BZ#859817)

* If a network installation from an NFS server was selected, the 'mount'
command used the UDP protocol by default. If only TCP mounts were supported
by the server, this led to a failure of the mount command. As a result,
Anaconda could not continue with the installation. This bug is now fixed
and NFS mount operations default to the TCP protocol. (BZ#855832)

All busybox users are advised to upgrade to these updated packages, which
contain backported patches to correct these issues.
";

  tag_affected = "busybox on Red Hat Enterprise Linux Desktop (v. 6),
  Red Hat Enterprise Linux Server (v. 6),
  Red Hat Enterprise Linux Workstation (v. 6)";

  tag_solution = "Please Install the Updated Packages.";


  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "RHSA", value: "2013:1732-02");
  script_xref(name: "URL" , value: "https://www.redhat.com/archives/rhsa-announce/2013-November/msg00035.html");
  script_summary("Check for the Version of busybox");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("Red Hat Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/rhel", "ssh/login/rpms");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "RHENT_6")
{

  if ((res = isrpmvuln(pkg:"busybox", rpm:"busybox~1.15.1~20.el6", rls:"RHENT_6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}