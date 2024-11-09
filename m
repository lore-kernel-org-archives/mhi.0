Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9253C8FF
	for <mhi@lists.linux.dev>; Sat,  9 Nov 2024 01:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731117390; cv=none; b=YmrlbmOI+UybWYgJiZ1gBL05ElUVNmBOnqyHFi9lCQyVkeG+bH8QduBiQWnTJNFpx5H7qeCcOOjTsranxqJbwWyQAp/wDoi7xDtxcSXco78Z8V1Z7WbsB9P0O/7gFgCuqpxh0IbnJBAuzi1r6gRGA8Kt/w8Fxwz9/+9Z6k9emZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731117390; c=relaxed/simple;
	bh=Xvr+5zk2IdK1EcqUpFvd7pIrq4iAK0ZMkKMDmdGAZU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jjG16ABUPc52BMTyTrvUyaUPiC80gWVQw7rgNhSa7icfn5/zt4iXEETAbMdhti4AjsXpIm2CIUjaBNhzOav43A/0uQtNUG15YlenELmhYgaVsfE48/IRbn7fZFLPdvmCxXzphKbQcvL7GAx78wyJXcnGDDn8uYBj8Bo1FqZCndo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fuv7o1cl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fuv7o1cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731117389; x=1762653389;
  h=date:from:to:cc:subject:message-id;
  bh=Xvr+5zk2IdK1EcqUpFvd7pIrq4iAK0ZMkKMDmdGAZU0=;
  b=Fuv7o1clib4YqwML6Lt2H1C+pFB7K3AlOkNmRxBt1sA4p5wOzBahWwMo
   GN3GkedhVIn/cvjB06HkpcPpjJ+uJY2OvqZtnq7C103awZav7VevEBoFs
   Xh0U/y3n6SYrzhF8Ewy9P2osWS7BYYHr0OhfhyIKfPikhnHQurEgl9tgy
   cs/LJafDOxCRw9+7QyWZfoVZCjeKepNnOS5KZ1KZgv/OhZNkPMwmAZx+Q
   ZXPOaJE5gYp/HrGtfFqvdydrJj2i2kOkGfGSLS4X+bIU4J5KA1kQyphnG
   LnkstKYcVSN9HzlEyJ70qshItodzhFouMDGV8LVGetC4hlhbl8QIMc39p
   A==;
X-CSE-ConnectionGUID: B0n1ckBhS5OkKSuhtcfDKg==
X-CSE-MsgGUID: xq5DaYP1Qcaeax6gQExB2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="42414935"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="42414935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:56:27 -0800
X-CSE-ConnectionGUID: uUmIrITSSGO8VN/ccDn7fw==
X-CSE-MsgGUID: kY6uyw/FTA6T3TY9yhoQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="90663660"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2024 17:56:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9ai8-000ryO-0z;
	Sat, 09 Nov 2024 01:56:24 +0000
Date: Sat, 09 Nov 2024 09:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 bd23e836423ea3968d539d4f0d5722a3a824b99e
Message-ID: <202411090911.ax9fppPN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: bd23e836423ea3968d539d4f0d5722a3a824b99e  bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR

elapsed time: 773m

configs tested: 176
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    clang-14
arc                        nsimosci_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    gcc-14.2.0
arm                            mps2_defconfig    gcc-14.2.0
arm                        neponset_defconfig    clang-14
arm                            qcom_defconfig    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           tegra_defconfig    clang-15
arm                           u8500_defconfig    clang-14
arm                         wpcm450_defconfig    clang-15
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241109    clang-19
i386        buildonly-randconfig-002-20241109    clang-19
i386        buildonly-randconfig-003-20241109    clang-19
i386        buildonly-randconfig-004-20241109    clang-19
i386        buildonly-randconfig-005-20241109    clang-19
i386        buildonly-randconfig-006-20241109    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241109    clang-19
i386                  randconfig-002-20241109    clang-19
i386                  randconfig-003-20241109    clang-19
i386                  randconfig-004-20241109    clang-19
i386                  randconfig-005-20241109    clang-19
i386                  randconfig-006-20241109    clang-19
i386                  randconfig-011-20241109    clang-19
i386                  randconfig-012-20241109    clang-19
i386                  randconfig-013-20241109    clang-19
i386                  randconfig-014-20241109    clang-19
i386                  randconfig-015-20241109    clang-19
i386                  randconfig-016-20241109    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-15
m68k                                defconfig    gcc-14.2.0
m68k                       m5249evb_defconfig    clang-14
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-15
mips                            gpr_defconfig    clang-15
mips                      maltaaprp_defconfig    clang-14
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                          rb532_defconfig    clang-14
mips                        vocore2_defconfig    clang-15
mips                           xway_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    clang-14
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    clang-14
powerpc                       eiger_defconfig    clang-15
powerpc                     ep8248e_defconfig    clang-14
powerpc                        fsp2_defconfig    clang-14
powerpc                  iss476-smp_defconfig    clang-14
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    gcc-14.2.0
powerpc                 mpc8313_rdb_defconfig    clang-14
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc836x_rdk_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    clang-14
powerpc                      pmac32_defconfig    clang-15
powerpc                     redwood_defconfig    clang-14
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-15
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-15
sh                        edosk7705_defconfig    gcc-14.2.0
sh                             espt_defconfig    clang-15
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7721_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    clang-15
sh                        sh7757lcr_defconfig    clang-15
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241109    gcc-12
x86_64      buildonly-randconfig-002-20241109    gcc-12
x86_64      buildonly-randconfig-003-20241109    gcc-12
x86_64      buildonly-randconfig-004-20241109    gcc-12
x86_64      buildonly-randconfig-005-20241109    gcc-12
x86_64      buildonly-randconfig-006-20241109    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241109    gcc-12
x86_64                randconfig-002-20241109    gcc-12
x86_64                randconfig-003-20241109    gcc-12
x86_64                randconfig-004-20241109    gcc-12
x86_64                randconfig-005-20241109    gcc-12
x86_64                randconfig-006-20241109    gcc-12
x86_64                randconfig-011-20241109    gcc-12
x86_64                randconfig-012-20241109    gcc-12
x86_64                randconfig-013-20241109    gcc-12
x86_64                randconfig-014-20241109    gcc-12
x86_64                randconfig-015-20241109    gcc-12
x86_64                randconfig-016-20241109    gcc-12
x86_64                randconfig-071-20241109    gcc-12
x86_64                randconfig-072-20241109    gcc-12
x86_64                randconfig-073-20241109    gcc-12
x86_64                randconfig-074-20241109    gcc-12
x86_64                randconfig-075-20241109    gcc-12
x86_64                randconfig-076-20241109    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                           alldefconfig    clang-15
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
