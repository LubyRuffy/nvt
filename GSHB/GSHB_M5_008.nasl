###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M5_008.nasl 3312 2016-05-13 07:08:19Z benallard $
#
# IT-Grundschutz, 14. EL, Ma�nahme 5.008
#
# Authors:
# Thomas Rotter <thomas.rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_id(95050);
  script_version("$Revision: 3312 $");
  script_tag(name:"last_modification", value:"$Date: 2016-05-13 09:08:19 +0200 (Fri, 13 May 2016) $");
  script_tag(name:"creation_date", value:"2015-03-25 10:14:11 +0100 (Wed, 25 Mar 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"general_note");
  script_name("IT-Grundschutz M5.008: Regelm��iger Sicherheitscheck des Netzes");
  script_xref(name : "URL" , value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m05/m05008.html");
  script_summary  ("IT-Grundschutz M5.008: Regelm��iger Sicherheitscheck des Netzes.");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Tools/Present/wmi");
  script_mandatory_keys("Compliance/Launch/GSHB");
  script_tag(name : "summary" , value :
"IT-Grundschutz M5.008: Regelm��iger Sicherheitscheck des Netzes.

Stand: 14. Erg�nzungslieferung (14. EL).

Hinweis:
Es wird lediglich ein Meldung ausgegeben, dass mit aktuelleten Plugins getestet werden soll.
");

  exit(0);
}

include("itg.inc");

name = 'IT-Grundschutz M5.008: Regelm��iger Sicherheitscheck des Netzes\n';

gshbm = "GSHB Ma�nahme 5.008: ";

result = string("unvollst�ndig");
desc = string("F�hren Sie bitte eine OpenVAS-Pr�fung Ihres Netzwerkes\nmit dem aktuellen NVT-Set aus.");


set_kb_item(name:"GSHB/M5_008/result", value:result);
set_kb_item(name:"GSHB/M5_008/desc", value:desc);
set_kb_item(name:"GSHB/M5_008/name", value:name);

silence = get_kb_item("GSHB/silence");
if (!silence) itg_send_details (itg_id: 'GSHB/M5_008');

exit(0);