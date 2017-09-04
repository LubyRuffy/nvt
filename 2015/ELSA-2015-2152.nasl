# OpenVAS Vulnerability Test 
# Description: Oracle Linux Local Check 
# $Id: ELSA-2015-2152.nasl 6560 2017-07-06 11:58:38Z cfischer $
 
# Authors: 
# Eero Volotinen <eero.volotinen@solinor.com> 
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
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
#
if(description)
 {
script_oid("1.3.6.1.4.1.25623.1.0.122785");
script_version("$Revision: 6560 $");
script_tag(name:"creation_date", value:"2015-11-25 13:18:51 +0200 (Wed, 25 Nov 2015)");
script_tag(name:"last_modification", value:"$Date: 2017-07-06 13:58:38 +0200 (Thu, 06 Jul 2017) $");
script_name("Oracle Linux Local Check: ELSA-2015-2152");
script_tag(name: "insight", value: "ELSA-2015-2152 -  kernel security, bug fix, and enhancement update - [3.10.0-327.OL7]- Oracle Linux certificates (Alexey Petrenko)[3.10.0-327]- [mm] free compound page with correct order (Andrea Arcangeli) [1274867]- [netdrv] revert 'ixgbe: Refactor busy poll socket code to address multiple issues' (John Greene) [1261275]- [powerpc] dma: dma_set_coherent_mask() should not be GPL only (Gustavo Duarte) [1275976][3.10.0-326]- [md] dm-cache: the CLEAN_SHUTDOWN flag was not being set (Mike Snitzer) [1274450]- [md] dm-btree: fix leak of bufio-backed block in btree_split_beneath error path (Mike Snitzer) [1274393]- [md] dm-btree-remove: fix a bug when rebalancing nodes after removal (Mike Snitzer) [1274396]- [fs] nfsd: fix duplicated destroy_delegation code introduced by backport ('J. Bruce Fields') [1273228]- [fs] xfs: validate transaction header length on log recovery (Brian Foster) [1164135]- [net] ipv6: don't use CHECKSUM_PARTIAL on MSG_MORE/UDP_CORK sockets (Hannes Frederic Sowa) [1271759]- [net] add length argument to skb_copy_and_csum_datagram_iovec (Sabrina Dubroca) [1269228]- [x86] kvm: fix edge EOI and IOAPIC reconfig race (Radim Krcmar) [1271333]- [x86] kvm: set KVM_REQ_EVENT when updating IRR (Radim Krcmar) [1271333]- [kernel] Initialize msg/shm IPC objects before doing ipc_addid() (Lennert Buytenhek) [1271507] {CVE-2015-7613}[3.10.0-325]- [fs] nfsd: ensure that delegation stateid hash references are only put once ('J. Bruce Fields') [1233284]- [fs] nfsd: ensure that the ol stateid hash reference is only put once ('J. Bruce Fields') [1233284]- [fs] nfsv4: Fix a nograce recovery hang (Benjamin Coddington) [1264478]- [fs] vfs: Test for and handle paths that are unreachable from their mnt_root ('Eric W. Biederman') [1209371] {CVE-2015-2925}- [fs] dcache: Handle escaped paths in prepend_path ('Eric W. Biederman') [1209371] {CVE-2015-2925}- [fs] xfs: add an xfs_zero_eof() tracepoint (Brian Foster) [1260383]- [fs] xfs: always drain dio before extending aio write submission (Brian Foster) [1260383]- [md] dm-cache: fix NULL pointer when switching from cleaner policy (Mike Snitzer) [1269959]- [mm] Temporary fix for BUG_ON() triggered by THP vs. gup() race (David Gibson) [1268999]- [hid] usbhid: improve handling of Clear-Halt and reset (Don Zickus) [1260123]- [drm] qxl: fix framebuffer dirty rectangle tracking (Gerd Hoffmann) [1268293]- [s390] hmcdrv: fix interrupt registration (Hendrik Brueckner) [1262735]- [block] blk-mq: fix deadlock when reading cpu_list (Jeff Moyer) [1260615]- [block] blk-mq: avoid inserting requests before establishing new mapping (Jeff Moyer) [1260615]- [block] blk-mq: fix q->mq_usage_counter access race (Jeff Moyer) [1260615]- [block] blk-mq: Fix use after of free q->mq_map (Jeff Moyer) [1260615]- [block] blk-mq: fix sysfs registration/unregistration race (Jeff Moyer) [1260615]- [block] blk-mq: avoid setting hctx->tags->cpumask before allocation (Jeff Moyer) [1260615]- [netdrv] cxgb4: Enhance driver to update FW, when FW is too old (Sai Vemuri) [1077966]- [netdrv] cxgb4: Force uninitialized state if FW in adapter is unsupported (Sai Vemuri) [1077966]- [powerpc] revert 'Use the POWER8 Micro Partition Prefetch Engine in KVM HV on POWER8' (Thomas Huth) [1269653][3.10.0-324]- [netdrv] i40e/i40evf: set AQ count after memory allocation (Neil Horman) [1267663]- [netdrv] i40e: fix offload of GRE tunnels (Neil Horman) [1267663]- [netdrv] i40evf: don't blow away MAC address (Neil Horman) [1267663]- [netdrv] i40e/i40evf: grab the AQ spinlocks before clearing registers (Neil Horman) [1267663]- [netdrv] i40e: Fix a memory leak in X722 rss config path (Neil Horman) [1267663]- [netdrv] i40evf: Use numa_mem_id() to better support memoryless node (Neil Horman) [1267663]- [netdrv] i40e: Use numa_mem_id() to better support memoryless node (Neil Horman) [1267663]- [netdrv] i40e: fix 32 bit build warnings (Neil Horman) [1267663]- [netdrv] i40e: fix kbuild warnings (Neil Horman) [1267663]- [netdrv] i40evf: tweak init timing (Neil Horman) [1267663]- [netdrv] i40e: warn on double free (Neil Horman) [1267663]- [netdrv] i40e: refactor interrupt enable (Neil Horman) [1267663]- [netdrv] i40e: Strip VEB stats if they are disabled in HW (Neil Horman) [1267663]- [netdrv] i40e/i40evf: add new device id 1588 (Neil Horman) [1267663]- [netdrv] i40e: Remove useless message (Neil Horman) [1267663]- [netdrv] i40e: limit debugfs io ops (Neil Horman) [1267663]- [netdrv] i40e: use QOS field consistently (Neil Horman) [1267663]- [netdrv] i40e: count drops in netstat interface (Neil Horman) [1267663]- [netdrv] i40e/i40evf: fix Tx hang workaround code (Neil Horman) [1267663]- [netdrv] i40e: fixup padding issue in get_cee_dcb_cfg_v1_resp (Neil Horman) [1267663]- [netdrv] i40e: Fix a port VLAN configuration bug (Neil Horman) [1267663]- [netdrv] i40e/i40evf: fix up type clash in i40e_aq_rc_to_posix conversion (Neil Horman) [1267663]- [netdrv] i40e: rtnl_lock called twice in i40e_pci_error_resume() (Neil Horman) [1267663]- [netdrv] i40evf: missing rtnl_unlock in i40evf_resume() (Neil Horman) [1267663][3.10.0-323]- [scsi] report 'INQUIRY result too short' once (Vitaly Kuznetsov) [1254049]- [scsi] scsi_scan: don't dump trace when scsi_prep_async_scan() is called twice (Vitaly Kuznetsov) [1254049]- [fs] userfaultfd: add missing mmput() in error path (Andrea Arcangeli) [1263480]- [mm] check if section present during memory block registering (Jan Stancek) [1256723]- [mm] avoid setting up anonymous pages into file mapping (Larry Woodman) [1261582]- [mm] add p[te or md] revert 'protnone helpers for use by NUMA balancing' (Thomas Huth) [1256718]- [powerpc] revert 'mm: convert p[te or md]_numa users to p[te or md]_protnone_numa' (Thomas Huth) [1256718]- [powerpc] revert 'mm: add paranoid warnings for unexpected DSISR_PROTFAULT' (Thomas Huth) [1256718]- [mm] revert 'convert p[te or md]_mknonnuma and remaining page table manipulations' (Thomas Huth) [1256718]- [mm] revert 'numa: Do not mark PTEs pte_numa when splitting huge pages' (Thomas Huth) [1256718]- [mm] revert 'remove remaining references to NUMA hinting bits and helpers' (Thomas Huth) [1256718]- [mm] revert 'numa: do not trap faults on the huge zero page' (Thomas Huth) [1256718]- [mm] revert 'numa: add paranoid check around pte_protnone_numa' (Thomas Huth) [1256718]- [mm] revert 'numa: avoid unnecessary TLB flushes when setting NUMA hinting entries' (Thomas Huth) [1256718]- [powerpc] mm: Change the swap encoding in pte (Thomas Huth) [1256718]- [x86] perf: Fix multi-segment problem of perf_event_intel_uncore (Jiri Olsa) [1257825]- [lib] partially revert '[lib] vsprintf: implement bitmap printing through '*pb[l]'' (Maurizio Lombardi) [1260118]- [drm] radeon: update no_64bit_msi flag for certain ASICs (Oded Gabbay) [1262429]- [drm] nouveau: fbcon: take runpm reference when userspace has an open fd (Ben Skeggs) [1176163]- [drm] qxl: validate monitors config modes (Dave Airlie) [1242847]- [drm] radeon: don't attempt WC mappings on powerpc (Dave Airlie) [1262429]- [drm] drm/qxl: recreate the primary surface when the bo is not primary (Dave Airlie) [1258301]- [drm] qxl: only report first monitor as connected if we have no state (Dave Airlie) [1258301]- [drm] dp_mst: drop cancel work sync in the mstb destroy path (Dave Airlie) [1251331]- [drm] dp_mst: split connector registration into two parts (Dave Airlie) [1251331]- [drm] dp_mst: update the link_address_sent before sending the link address (Dave Airlie) [1251331]- [drm] dp_mst: fixup handling hotplug on port removal (Dave Airlie) [1251331]- [drm] dp_mst: don't pass port into the path builder function (Dave Airlie) [1251331]- [drm] dp_mst: make functions that always return 0 return void (Dave Airlie) [1251331]- [kernel] uprobes: fix kABI broken by the exported return_instance (Oleg Nesterov) [1207373]- [kernel] uprobes: Make arch_uretprobe_is_alive(RP_CHECK_CALL) more clever (Oleg Nesterov) [1207373]- [kernel] uprobes: Add the 'enum rp_check ctx' arg to arch_uretprobe_is_alive() (Oleg Nesterov) [1207373]- [kernel] uprobes: Change prepare_uretprobe() to (try to) flush the dead frames (Oleg Nesterov) [1207373]- [kernel] uprobes: Change handle_trampoline() to flush the frames invalidated by longjmp() (Oleg Nesterov) [1207373]- [kernel] uprobes: Reimplement arch_uretprobe_is_alive() (Oleg Nesterov) [1207373]- [kernel] uprobes: Export 'struct return_instance', introduce arch_uretprobe_is_alive() (Oleg Nesterov) [1207373]- [kernel] uprobes: Change handle_trampoline() to find the next chain beforehand (Oleg Nesterov) [1207373]- [kernel] uprobes: Change prepare_uretprobe() to use uprobe_warn() (Oleg Nesterov) [1207373]- [kernel] uprobes: Send SIGILL if handle_trampoline() fails (Oleg Nesterov) [1207373]- [kernel] uprobes: Introduce free_ret_instance() (Oleg Nesterov) [1207373]- [kernel] uprobes: Introduce get_uprobe() (Oleg Nesterov) [1207373]- [kernel] lockdep: Fix a race between /proc/lock_stat and module unload (Jerome Marchand) [1183891]- [kernel] lockdep: Fix the module unload key range freeing logic (Jerome Marchand) [1183891]- [kernel] module: Free lock-classes if parse_args failed (Jerome Marchand) [1183891]- [cpufreq] revert 'intel_pstate: honor user space min_perf_pct override on resume' (Prarit Bhargava) [1269518][3.10.0-322]- [fs] nfs: fix v4.2 SEEK on files over 2 gigs ('J. Bruce Fields') [1262181]- [fs] nfs: verify open flags before allowing open (Benjamin Coddington) [1164431]- [fs] nfsv4.1: Fix pnfs_put_lseg races (Benjamin Coddington) [1263155]- [fs] nfsv4.1: pnfs_send_layoutreturn should use GFP_NOFS (Benjamin Coddington) [1263155]- [fs] nfsv4.1: Pin the inode and super block in asynchronous layoutreturns (Benjamin Coddington) [1263155]- [fs] nfsv4.1: Pin the inode and super block in asynchronous layoutcommit (Benjamin Coddington) [1263155]- [md] raid0: apply base queue limits *before* disk_stack_limits (Jes Sorensen) [1265182]- [net] revert 'ipv6: Don't reduce hop limit for an interface' (Sabrina Dubroca) [1258324]- [x86] kvmclock: abolish PVCLOCK_COUNTS_FROM_ZERO (Radim Krcmar) [1263030]- [x86] revert 'kvm: x86: zero kvmclock_offset when vcpu0 initializes kvmclock system MSR' (Radim Krcmar) [1263030]- [x86] kvm: svm: reset mmu on VCPU reset (Igor Mammedov) [1255217]- [edac] sb_edac: correctly fetch DIMM width on Ivy Bridge and Haswell (Aristeu Rozanski) [1112413]- [edac] sb_edac: look harder for DDRIO on Haswell systems (Aristeu Rozanski) [1112413]- [tools] perf-trace: Fix race condition at the end of started workloads (Jiri Olsa) [1250068]- [netdrv] cxgb4: Fix tx flit calculation (Sai Vemuri) [1266248]- [netdrv] igb: assume MSI-X interrupts during initialization (Stefan Assmann) [1263625]- [cpufreq] intel_pstate: disable Skylake processors (Prarit Bhargava) [1267343]- [infiniband] mlx4: Report checksum offload cap for RAW QP when query device (Doug Ledford) [1265795]- [infiniband] core: Add support of checksum capability reporting for RC and RAW (Doug Ledford) [1265795][3.10.0-321]- [netdrv] i40e/i40evf: check for stopped admin queue (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: refactor tx timeout logic (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Bump i40e to 1.3.21 and i40evf to 1.3.13 (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add get AQ result command to nvmupdate utility (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add exec_aq command to nvmupdate utility (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add wait states to NVM state machine (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add GetStatus command for nvmupdate (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add handling of writeback descriptor (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: save aq writeback for future inspection (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Bump i40e to 1.3.9 and i40evf to 1.3.5 (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Cache the CEE TLV status returned from firmware (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add VIRTCHNL_VF_OFFLOAD flag (Stefan Assmann) [1267255]- [netdrv] i40evf: Remove PF specific register definitions from the VF (Stefan Assmann) [1267255]- [netdrv] i40evf: Use the correct defines to match the VF registers (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add capability to gather VEB per TC stats (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add TX/RX outer UDP checksum support for X722 (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add support for writeback on ITR feature for X722 (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: RSS changes for X722 (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Update register.h file for X722 (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Update FW API with X722 support (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add flags for X722 capabilities (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add device ids for X722 (Stefan Assmann) [1267255]- [netdrv] i40e: use BIT and BIT_ULL macros (Stefan Assmann) [1267255]- [netdrv] i40e: clean up error status messages (Stefan Assmann) [1267255]- [netdrv] i40evf: support virtual channel API version 1.1 (Stefan Assmann) [1267255]- [netdrv] i40evf: handle big resets (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: add macros for virtual channel API version and device capability (Stefan Assmann) [1267255]- [netdrv] i40e: add VF capabilities to virtual channel interface (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Fix and refactor dynamic ITR code (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Bump version to 1.3.6 for i40e and 1.3.2 for i40evf (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add support for pre-allocated pages for PD (Stefan Assmann) [1267255]- [netdrv] i40evf: add MAC address filter in open, not init (Stefan Assmann) [1267255]- [netdrv] i40evf: don't delete all the filters (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Update the admin queue command header (Stefan Assmann) [1267255]- [netdrv] i40evf: Allow for an abundance of vectors (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: improve Tx performance with a small tweak (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Update Flex-10 related device/function capabilities (Stefan Assmann) [1267255]- [netdrv] i40e/i40evf: Add stats to track FD ATR and SB dynamic enable state (Stefan Assmann) [1267255]- [netdrv] i40e: Fix for recursive RTNL lock during PROMISC change (Stefan Assmann) [1267254]- [netdrv] i40e: Fix RS bit update in Tx path and disable force WB workaround (Stefan Assmann) [1267254]- [netdrv] i40e: add GRE tunnel type to csum encoding (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: refactor tx timeout logic (Stefan Assmann) [1267254]- [netdrv] i40e: Move i40e_get_head into header file (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: check for stopped admin queue (Stefan Assmann) [1267254]- [netdrv] i40e: fix VLAN inside VXLAN (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Bump i40e to 1.3.21 and i40evf to 1.3.13 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add get AQ result command to nvmupdate utility (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add exec_aq command to nvmupdate utility (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add wait states to NVM state machine (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add GetStatus command for nvmupdate (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add handling of writeback descriptor (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: save aq writeback for future inspection (Stefan Assmann) [1267254]- [netdrv] i40e: rename variable to prevent clash of understanding (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Bump i40e to 1.3.9 and i40evf to 1.3.5 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Cache the CEE TLV status returned from firmware (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add VIRTCHNL_VF_OFFLOAD flag (Stefan Assmann) [1267254]- [netdrv] i40e: Remove redundant and unneeded messages (Stefan Assmann) [1267254]- [netdrv] i40e: correct spelling error (Stefan Assmann) [1267254]- [netdrv] i40e: Fix comment for ethtool diagnostic link test (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add capability to gather VEB per TC stats (Stefan Assmann) [1267254]- [netdrv] i40e: Fix ethtool offline diagnostic with netqueues (Stefan Assmann) [1267254]- [netdrv] i40e: Fix legacy interrupt mode in the driver (Stefan Assmann) [1267254]- [netdrv] i40e: Move function calls to i40e_shutdown instead of i40e_suspend (Stefan Assmann) [1267254]- [netdrv] i40e: add RX to port CRC errors label (Stefan Assmann) [1267254]- [netdrv] i40e: don't degrade __le16 (Stefan Assmann) [1267254]- [netdrv] i40e: Add AQ commands for NVM Update for X722 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add ATR HW eviction support for X722 (Stefan Assmann) [1267254]- [netdrv] i40e: Add IWARP support for X722 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add TX/RX outer UDP checksum support for X722 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add support for writeback on ITR feature for X722 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: RSS changes for X722 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Update register.h file for X722 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Update FW API with X722 support (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add flags for X722 capabilities (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add device ids for X722 (Stefan Assmann) [1267254]- [netdrv] i40e: use BIT and BIT_ULL macros (Stefan Assmann) [1267254]- [netdrv] i40e: provide correct API version to older VF drivers (Stefan Assmann) [1267254]- [netdrv] i40e: support virtual channel API 1.1 (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: add macros for virtual channel API version and device capability (Stefan Assmann) [1267254]- [netdrv] i40e: add VF capabilities to virtual channel interface (Stefan Assmann) [1267254]- [netdrv] i40e: clean up unneeded gotos (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Fix and refactor dynamic ITR code (Stefan Assmann) [1267254]- [netdrv] i40e: only report generic filters in get_ts_info (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Bump version to 1.3.6 for i40e and 1.3.2 for i40evf (Stefan Assmann) [1267254]- [netdrv] i40e: Refine an error message to avoid confusion (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add support for pre-allocated pages for PD (Stefan Assmann) [1267254]- [netdrv] i40e: un-disable VF after reset (Stefan Assmann) [1267254]- [netdrv] i40e: do a proper reset when disabling a VF (Stefan Assmann) [1267254]- [netdrv] i40e: correctly program filters for VFs (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Update the admin queue command header (Stefan Assmann) [1267254]- [netdrv] i40e: Remove incorrect #ifdef's (Stefan Assmann) [1267254]- [netdrv] i40e: ignore duplicate port VLAN requests (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: improve Tx performance with a small tweak (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Update Flex-10 related device/function capabilities (Stefan Assmann) [1267254]- [netdrv] i40e/i40evf: Add stats to track FD ATR and SB dynamic enable state (Stefan Assmann) [1267254]- [netdrv] i40e: Implement ndo_features_check() (Stefan Assmann) [1267254][3.10.0-320]- [md] raid1: Avoid raid1 resync getting stuck (Jes Sorensen) [1256954]- [fs] gfs2: fallocate: do not rely on file_update_time to mark the inode dirty (Andrew Price) [1264521]- [fs] gfs2: Update timestamps on fallocate (Andrew Price) [1264521]- [fs] gfs2: Update i_size properly on fallocate (Andrew Price) [1264521]- [fs] gfs2: Use inode_newsize_ok and get_write_access in fallocate (Andrew Price) [1264521]- [fs] revert 'nfs: Make close(2) asynchronous when closing NFS O_DIRECT files' (Benjamin Coddington) [1263385]- [fs] gfs2: Average in only non-zero round-trip times for congestion stats (Robert S Peterson) [1162821]- [fs] lockd: fix rpcbind crash on lockd startup failure ('J. Bruce Fields') [1253782]- [fs] Failing to send a CLOSE if file is opened WRONLY and server reboots on a 4.x mount (Benjamin Coddington) [1263376]- [fs] fsnotify: fix oops in fsnotify_clear_marks_by_group_flags() (Lukas Czerner) [1247436]- [net] sctp: fix race on protocol/netns initialization (Marcelo Leitner) [1251807] {CVE-2015-5283}- [x86] Mark Broadwell-DE SoC Supported (Prarit Bhargava) [1131685]- [kernel] sched,numa: limit amount of virtual memory scanned in task_numa_work (Rik van Riel) [1261722]- [drivers] base: show nohz_full cpus in sysfs (Rik van Riel) [1212618]- [drivers] base: show isolated cpus in sysfs (Rik van Riel) [1212618]- [cpufreq] intel_pstate: add quirk to disable HWP on Skylake-S processors (Jerry Snitselaar) [1263069]- [drivers] core: Add symlink to device-tree from devices with an OF node (Gustavo Duarte) [1258828]- [powerpc] device: Add dev_of_node() accessor (Gustavo Duarte) [1258828]- [powerpc] iommu: Support 'hybrid' iommu/direct DMA ops for coherent_mask < dma_mask (Gustavo Duarte) [1246880]- [powerpc] iommu: Cleanup setting of DMA base/offset (Gustavo Duarte) [1246880]- [powerpc] iommu: Remove dma_data union (Gustavo Duarte) [1246880]- [powerpc] kvm: book3s-hv: Fix handling of interrupted VCPUs (Thomas Huth) [1263568]- [powerpc] kvm: Take the kvm->srcu lock in kvmppc_h_logical_ci_load/store() (Thomas Huth) [1263577][3.10.0-319]- [netdrv] cxgb4: Make necessary changes after reverting FCoE (Sai Vemuri) [1258657]- [netdrv] revert 'cxgb4: add cxgb4_fcoe.c for FCoE' (Sai Vemuri) [1258657]- [infiniband] iw_cxgb4: Cleanup register defines/MACROS (Sai Vemuri) [1251611]- [infiniband] iw_cxgb4: 32b platform fixes (Sai Vemuri) [1251611]- [infiniband] iw_cxgb4: use BAR2 GTS register for T5 kernel mode CQs (Sai Vemuri) [1251611]- [infiniband] iw_cxgb4: enforce qp/cq id requirements (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix incorrect sequence numbers shown in devlog (Sai Vemuri) [1251611]- [netdrv] cxgb4: remove unused fn to enable/disable db coalescing (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf: function and argument name cleanup (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add debugfs facility to inject FL starvation (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add PHY firmware support for T420-BT cards (Sai Vemuri) [1251611]- [netdrv] cxgb4: Update T4/T5 adapter register ranges (Sai Vemuri) [1251611]- [netdrv] cxgb4: Optimize and cleanup setup memory window code (Sai Vemuri) [1251611]- [netdrv] cxgb4: replace ntoh{s, l} and hton{s, l} calls with the generic byteorder (Sai Vemuri) [1251611]- [netdrv] cxgb4: Remove dead function t4_read_edc and t4_read_mc (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf: Cleanup macros, add comments and add new MACROS (Sai Vemuri) [1251611]- [netdrv] cxgb3/4/4vf: Update drivers to use dma_rmb/wmb where appropriate (Sai Vemuri) [1251611]- [netdrv] cxgb4: add cxgb4_fcoe.c for FCoE (Sai Vemuri) [1251611]- [infiniband] iw_cxgb4: Remove negative advice dmesg warnings (Sai Vemuri) [1251611]- [netdrv] cxgb4: Initialize RSS mode for all Ports (Sai Vemuri) [1251611]- [netdrv] cxgb4: Discard the packet if the length is greater than mtu (Sai Vemuri) [1251611]- [netdrv] cxgb4: Move SGE Ingress DMA state monitor code to a new routine (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add device node to ULD info (Sai Vemuri) [1251611]- [netdrv] cxgb4: Pass in a Congestion Channel Map to t4_sge_alloc_rxq() (Sai Vemuri) [1251611]- [netdrv] cxgb4: Enable congestion notification from SGE for IQs and FLs (Sai Vemuri) [1251611]- [netdrv] cxgb4: Make sure that Freelist size is larger than Egress Congestion Threshold (Sai Vemuri) [1251611]- [netdrv] cxgb4: drop __GFP_NOFAIL allocation (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix MC1 memory offset calculation (Sai Vemuri) [1251611]- [netdrv] cxgb4: Don't call t4_slow_intr_handler when we're not the Master PF (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add comment for calculate tx flits and sge length code (Sai Vemuri) [1251611]- [netdrv] cxgb4: Use device node in page allocation (Sai Vemuri) [1251611]- [netdrv] cxgb4: Freelist starving threshold varies from adapter to adapter (Sai Vemuri) [1251611]- [netdrv] cxgb4: Increased the value of MAX_IMM_TX_PKT_LEN from 128 to 256 bytes (Sai Vemuri) [1251611]- [netdrv] cxgb4: Move ethtool related code to a separate file (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix to dump devlog, even if FW is crashed (Sai Vemuri) [1251611]- [netdrv] cxgb4: Firmware macro changes for fw version 1.13.32.0 (Sai Vemuri) [1251611]- [infiniband] cxgb4: Serialize CQ event upcalls with CQ destruction (Sai Vemuri) [1251611]- [infiniband] cxgb4: Don't hang threads forever waiting on WR replies (Sai Vemuri) [1251611]- [netdrv] cxgb4vf: Fix sparse warnings (Sai Vemuri) [1251611]- [netdrv] cxgb4: Disable interrupts and napi before unregistering netdev (Sai Vemuri) [1251611]- [netdrv] cxgb4: Allocate dynamic mem. for egress and ingress queue maps (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix frame size warning for 32 bit arch (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf/csiostor: Make PCI Device ID Tables be 'const' (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add device ID for new adapter (Sai Vemuri) [1251611]- [netdrv] cxgb4: fix coccinelle warnings (Sai Vemuri) [1251611]- [netdrv] cxgb4: Try and provide an RDMA CIQ per cpu (Sai Vemuri) [1251611]- [netdrv] cxgb4: Use pci_enable_msix_range() instead of pci_enable_msix() (Sai Vemuri) [1251611]- [netdrv] cxgb4: Move offload Rx queue allocation to separate function (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix PCI-E Memory window interface for big-endian systems (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support in cxgb4 to get expansion rom version via ethtool (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix trace observed while dumping clip_tbl (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support in debugfs to dump the congestion control table (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support to dump mailbox content in debugfs (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support for ULP RX logic analyzer output in debugfs (Sai Vemuri) [1251611]- [netdrv] cxgb4: Added support in debugfs to display TP logic analyzer output (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support in debugfs to display sensor information (Sai Vemuri) [1251611]- [netdrv] chelsio: cxgb4: fix sparse warning (Sai Vemuri) [1251611]- [netdrv] cxgb4: Delete an unnecessary check before the function call 'release_firmware' (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add low latency socket busy_poll support (Sai Vemuri) [1251611]- [netdrv] cxgb4: Improve IEEE DCBx support, other minor open-lldp fixes (Sai Vemuri) [1251611]- [netdrv] cxgb4: Remove preprocessor check for CONFIG_CXGB4_DCB (Sai Vemuri) [1251611]- [netdrv] cxgb4: Move firmware version MACRO to t4fw_version.h (Sai Vemuri) [1251611]- [netdrv] cxgb4: Added support in debugfs to dump different timer and clock values of the adapter (Sai Vemuri) [1251611]- [netdrv] cxgb4: Added support in debugfs to dump PM module stats (Sai Vemuri) [1251611]- [netdrv] cxgb4: Addded support in debugfs to dump CIM outbound queue content (Sai Vemuri) [1251611]- [netdrv] cxgb4: Added support in debugfs to dump cim ingress bound queue contents (Sai Vemuri) [1251611]- [netdrv] cxgb4: Added support in debugfs to dump sge_qinfo (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fixes cxgb4_inet6addr_notifier unregister call (Sai Vemuri) [1251611]- [netdrv] mode_t whack-a-mole: chelsio (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add debugfs options to dump the rss key, config for PF, VF, etc (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add debugfs entry to dump the contents of the flash (Sai Vemuri) [1251611]- [netdrv] cxgb4: Update ipv6 address handling api (Sai Vemuri) [1251611]- [netdrv] cxgb4: Ripping out old hard-wired initialization code in driver (Sai Vemuri) [1251611]- [netdrv] iw_cxgb4/cxgb4/cxgb4vf/cxgb4i/csiostor: Cleanup register defines/macros related to all other cpl messages (Sai Vemuri) [1251611]- [netdrv] iw_cxgb4/cxgb4/cxgb4i: Cleanup register defines/MACROS related to CM CPL messages (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support for mps_tcam debugfs (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support for cim_qcfg entry in debugfs (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support for cim_la entry in debugfs (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support for devlog (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add PCI device ID for new T5 adapter (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf/csiostor: Cleanup PL, XGMAC, SF and MC related register defines (Sai Vemuri) [1251611]- [netdrv] cxgb4/csiostor: Cleanup TP, MPS and TCAM related register defines (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxg4vf/csiostor: Cleanup MC, MA and CIM related register defines (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf/csiostor: Cleanup SGE and PCI related register defines (Sai Vemuri) [1251611]- [infiniband] cxgb4/cxgb4vf/csiostor: Cleanup SGE register defines (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fix decoding QSA module for ethtool get settings (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add support for QSA modules (Sai Vemuri) [1251611]- [netdrv] cxgb4/csiostor: Don't use MASTER_MUST for fw_hello call (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf: global named must be unique (Sai Vemuri) [1251611]- [netdrv] cxgb4: Update firmware version after flashing it via ethtool (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf: Use new interfaces to calculate BAR2 SGE Queue Register addresses (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf: Add code to calculate T5 BAR2 Offsets for SGE Queue Registers (Sai Vemuri) [1251611]- [netdrv] cxgb4vf: Add and initialize some sge params for VF driver (Sai Vemuri) [1251611]- [netdrv] cxgb4: Update FW version string to match FW binary version 1.12.25.0 (Sai Vemuri) [1251611]- [netdrv] cxgb4: Add a check for flashing FW using ethtool (Sai Vemuri) [1251611]- [netdrv] cxgb4: Fill in supported link mode for SFP modules (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf/csiostor: Add T4/T5 PCI ID Table (Sai Vemuri) [1251611]- [infiniband] cxgb4/cxgb4vf/csiostor: Cleanup macros/register defines related to PCIE, RSS and FW (Sai Vemuri) [1251611]- [netdrv] cxgb4/cxgb4vf/csiostor: Cleanup macros/register defines related to port and VI (Sai Vemuri) [1251611]"); 
script_tag(name : "solution", value : "update software");
script_tag(name : "solution_type", value : "VendorFix");
script_tag(name : "summary", value : "Oracle Linux Local Security Checks ELSA-2015-2152");
script_xref(name : "URL" , value : "http://linux.oracle.com/errata/ELSA-2015-2152.html");
script_cve_id("CVE-2013-7421","CVE-2014-9644","CVE-2014-8171","CVE-2010-5313","CVE-2014-3647","CVE-2014-7842","CVE-2015-2925","CVE-2015-4170","CVE-2015-5283","CVE-2015-6526","CVE-2015-7613","CVE-2015-7837","CVE-2014-9419","CVE-2015-0239","CVE-2015-3339");
script_tag(name:"cvss_base", value:"6.9");
script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
script_tag(name:"qod_type", value:"package");
script_dependencies("gather-package-list.nasl");
script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release");
script_category(ACT_GATHER_INFO);
script_copyright("Eero Volotinen");
script_family("Oracle Linux Local Security Checks");
exit(0);
}
include("revisions-lib.inc");
include("pkg-lib-rpm.inc");
release = get_kb_item("ssh/login/release");
res = "";
if(release == NULL)
{
 exit(0);
}
if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"kernel", rpm:"kernel~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-tools", rpm:"kernel-tools~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-tools-libs", rpm:"kernel-tools-libs~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"kernel-tools-libs-devel", rpm:"kernel-tools-libs-devel~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"perf", rpm:"perf~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }
  if ((res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~3.10.0~327.el7", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);  
  }

}
if (__pkg_match) exit(99); #Not vulnerable
  exit(0);
