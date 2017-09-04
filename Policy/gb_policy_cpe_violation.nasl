###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_policy_cpe_violation.nasl 4926 2017-01-03 08:49:00Z cfi $
#
# CPE-based Policy Check Violations
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH, http://www.greenbone.net
#
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
  script_oid("1.3.6.1.4.1.25623.1.0.103964");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 4926 $");
  script_name("CPE-based Policy Check Violations");
  script_tag(name:"last_modification", value:"$Date: 2017-01-03 09:49:00 +0100 (Tue, 03 Jan 2017) $");
  script_tag(name:"creation_date", value:"2014-01-06 11:43:01 +0700 (Mon, 06 Jan 2014)");
  script_category(ACT_END);
  script_family("Policy");
  script_copyright("Copyright (c) 2014 Greenbone Networks GmbH");
  script_dependencies("gb_policy_cpe.nasl");
  script_mandatory_keys("policy/cpe/checkfor");

  script_tag(name:"summary", value:"Shows all CPEs which are either present or missing (depending on what to check for) from CPE-based Policy Check.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

checkfor = get_kb_item("policy/cpe/checkfor");

if (checkfor == "present") {
  missing = get_kb_item("policy/cpe/missing");

  if (missing) {
    report = string("The following CPEs are missing on the remote host\n\nPolicy-CPE\n");
    report += missing;
  }
} else {
  present = get_kb_item("policy/cpe/present");
  poss_present = get_kb_item("policy/cpe/possibly_present");

  if (present) {
    report = string("The following CPEs have been detected on the remote host\n\nPolicy-CPE|Detected-CPE\n");
    report += present;
  }

  if (poss_present) {
    report = string("The following CPEs *may* have been detected on the remote host\n\nPolicy-CPE|Detected-CPE\n");
    report += poss_present;
  }
}

if (report) {
  log_message(port:port, data:report);
}

exit(0);