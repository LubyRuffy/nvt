###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_M4_189.nasl 3616 2016-06-29 08:07:03Z thomas-rotter $
#
# IT-Grundschutz, 11. EL, Ma�nahme 4.189
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
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

tag_summary = "IT-Grundschutz M4.189: Schutz vor unzul�ssigen Programmaufrufen beim IIS-Einsatz.

  ACHTUNG: Dieser Test wird nicht mehr unterst�tzt. Er wurde zudem in neueren
  EL gestrichen.

  Diese Pr�fung bezieht sich auf die 11. Erg�nzungslieferung (11. EL) des IT-
  Grundschutz. Die detaillierte Beschreibung zu dieser Ma�nahme findet sich unter
  nachfolgendem Verweis. Es ist zu beachten, dass der dortige Text sich immer auf
  die aktuellste Erg�nzungslieferung bezieht. Titel und Inhalt k�nnen sich bei einer
  Aktualisierung �ndern, allerdings nicht die Kernthematik.

";


if(description)
{
  script_id(894189);
  script_version("$Revision: 3616 $");
  script_tag(name:"last_modification", value:"$Date: 2016-06-29 10:07:03 +0200 (Wed, 29 Jun 2016) $");
  script_tag(name:"creation_date", value:"2010-01-14 14:29:35 +0100 (Thu, 14 Jan 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("IT-Grundschutz M4.189: Schutz vor unzul�ssigen Programmaufrufen beim IIS-Einsatz (Windows)");
  script_xref(name : "URL", value : "http://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKataloge/Inhalt/_content/m/m04/m04189.html");
  script_summary("IT-Grundschutz M4.189: Schutz vor unzul�ssigen Programmaufrufen beim IIS-Einsatz.");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"general_note");
  script_copyright("Copyright (c) 2009 Greenbone Networks GmbH");
  script_family("IT-Grundschutz-11");
  script_mandatory_keys("Tools/Present/wmi");
  script_mandatory_keys("Compliance/Launch/GSHB-11");
  script_dependencies("GSHB/GSHB_IIS_metabase.nasl","GSHB/GSHB_WMI_IIS_exec_cmd.nasl", "GSHB/GSHB_WMI_OSInfo.nasl");
#  script_require_keys("GSHB/AspEnableParentPaths", "WMI/SSIEnableCmdDirective");
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"deprecated", value:TRUE);
  exit(0);
}

exit(66);