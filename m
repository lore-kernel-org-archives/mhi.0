Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8C21CEAB9
	for <mhi@lists.linux.dev>; Fri,  6 Sep 2024 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636994; cv=none; b=VkOdlv5cLhhjugkBS8Bub/EaJWKoGDnOCUcaJ3xI8nMGfGNmgo4anzviWqu8uUNJlfIPK08eULUQIzqZ0bleJ7PAxdKKckX5VKdKlep4xt1Sh0OqdiblTAZxgEjIqyMWLvxiFJ1ZnFhlhSm1MvUmzXKh9xZO2oEd+7aQ2jY5des=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636994; c=relaxed/simple;
	bh=ia1eozrT7d45RDBW8tlWKJInygdq2Erv3d95Ylw3hcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfkCBwdf870JnP6fm7kg4V9i1MwdKoNwpFccQE7DDVpoNFSbrm0VGMna3iO3orz5Hut4LtMu4TJT5J3FTfX8WQIRIDfEJc/4iwoY5QFgnO0jrpS791FAJevaH/ovN5boWMltmgAJIUCOcchZ0RR/c/WfEoo62B9TYEFqoBOUPLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvlQ4ehs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvlQ4ehs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725636992; x=1757172992;
  h=date:from:to:cc:subject:message-id;
  bh=ia1eozrT7d45RDBW8tlWKJInygdq2Erv3d95Ylw3hcs=;
  b=AvlQ4ehsPhGgk2nIWQjxH6Qck7Zez5F1ljsa2XOCWDKqC34TiO3kwuD0
   pCVY+IL3FFiolsEyEW8wFD9WkocR5AreSBzWh7NftNCcG0uHLDkN0YNj4
   fXiIFrZ1cOB1JV+GsUygN96KXY8G0WpPTlRF9bXtXP3F1IxsSKytCEVGX
   s6Vps2HODhHQYXICb7Q7coBKZ/WGtB5/LkTdPAV3iMnnUx/OsPsiS2Q3i
   8j6R2WYX89L6vpBYZ+EClpaKUTUKR7ChrjxCdXtmEtGCCOks2GmxfrufO
   Yt+1VrW+oQs6hD5wTxTr+UFtS0yx/Z66HsuZIoExGZQNJ2Jl87i0gTooF
   w==;
X-CSE-ConnectionGUID: bMVcRWfxQCeF92dhCdR5Yw==
X-CSE-MsgGUID: lIOYZ/fZSjmZGGfDQIujGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24274013"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24274013"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 08:36:30 -0700
X-CSE-ConnectionGUID: Ra625f7NQeSlrUX9x7ZZww==
X-CSE-MsgGUID: REncFrjmQSab3lRYQwEMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="70780930"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2024 08:36:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smb0c-000BQn-2a;
	Fri, 06 Sep 2024 15:36:26 +0000
Date: Fri, 06 Sep 2024 23:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 84a5ae5b23ba6320bbdfeccfe9a3ad31b2cc41d9
Message-ID: <202409062356.beQEcA4H-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 84a5ae5b23ba6320bbdfeccfe9a3ad31b2cc41d9  bus: mhi: host: pci_generic: Enable EDL trigger for Foxconn modems

elapsed time: 1464m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                      footbridge_defconfig   clang-20
arm                         nhk8815_defconfig   clang-20
arm                         s5pv210_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240906   gcc-12
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   gcc-12
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   gcc-12
i386         buildonly-randconfig-006-20240906   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   gcc-12
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   gcc-12
i386                  randconfig-005-20240906   gcc-12
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   gcc-12
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson1c_defconfig   clang-20
mips                      malta_kvm_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                            defconfig   gcc-12
parisc                            allnoconfig   clang-20
parisc                              defconfig   gcc-12
powerpc                           allnoconfig   clang-20
powerpc                      arches_defconfig   clang-20
powerpc                   bluestone_defconfig   clang-20
powerpc                 linkstation_defconfig   clang-20
powerpc                 mpc8315_rdb_defconfig   clang-20
powerpc                      ppc44x_defconfig   clang-20
powerpc                      tqm8xx_defconfig   clang-20
riscv                             allnoconfig   clang-20
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          landisk_defconfig   clang-20
sh                          sdk7780_defconfig   clang-20
sh                             sh03_defconfig   clang-20
sh                     sh7710voipgw_defconfig   clang-20
sh                            titan_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240906   clang-18
x86_64       buildonly-randconfig-002-20240906   clang-18
x86_64       buildonly-randconfig-003-20240906   clang-18
x86_64       buildonly-randconfig-004-20240906   clang-18
x86_64       buildonly-randconfig-005-20240906   clang-18
x86_64       buildonly-randconfig-006-20240906   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240906   clang-18
x86_64                randconfig-002-20240906   clang-18
x86_64                randconfig-003-20240906   clang-18
x86_64                randconfig-004-20240906   clang-18
x86_64                randconfig-005-20240906   clang-18
x86_64                randconfig-006-20240906   clang-18
x86_64                randconfig-011-20240906   clang-18
x86_64                randconfig-012-20240906   clang-18
x86_64                randconfig-013-20240906   clang-18
x86_64                randconfig-014-20240906   clang-18
x86_64                randconfig-015-20240906   clang-18
x86_64                randconfig-016-20240906   clang-18
x86_64                randconfig-071-20240906   clang-18
x86_64                randconfig-072-20240906   clang-18
x86_64                randconfig-073-20240906   clang-18
x86_64                randconfig-074-20240906   clang-18
x86_64                randconfig-075-20240906   clang-18
x86_64                randconfig-076-20240906   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
