Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A070038384
	for <mhi@lists.linux.dev>; Fri, 26 Apr 2024 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714136032; cv=none; b=lOCv6efFMdsY2Ybx1z3zf4pavXVCk/PNk5I7jpvpCvGAsgObXUejD6hKvuwGo/a3tH3QgCeU5ZO1QhpEX9ZtoGttenMnhEvBhvtzIcoDFxPqP5pyb1S89gcFDIxJFS1MPsUIgWFh9SnO0TxUFr2sRpB0nLDHTHHXXAodBtonFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714136032; c=relaxed/simple;
	bh=nlGxeSLSEn0oCaGk1nOelICaUGgTA2EiT3UNsm1o4hU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K9pBEBZZ4SaP7MYO0XhuULhmlW9JlWPU0ud3ujjHczA76QMXyaGyuhdb6qKYXP3idHLew1twMqqNdCRbCO/OAh4Vl28PnbUwJWrLqRsE6T3HNH31T0y78kxqGpvQzXPihJEVzLxxx1ad4vQdaEV42xImodL1mXRRm5qw2VmvJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBhozPf5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBhozPf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714136031; x=1745672031;
  h=date:from:to:cc:subject:message-id;
  bh=nlGxeSLSEn0oCaGk1nOelICaUGgTA2EiT3UNsm1o4hU=;
  b=IBhozPf50TtC0HvRtN0buoYdaRO0DpANQIPx7Vgz5BHJ6GqT7QJhYeEd
   Ree5oLF7I5/2cmev8k4uNudeeVyygYyuRcLAqRG3Jds9pN4CAXhqaz4Az
   b51K63ML+RKUnNL8nWh2j0UEwq/SFd5c1LS2+f2s9VvD27Oo6jXibDb9S
   wiXx1zLEni0cTApuPtGfNuADdcB6NO3zpSAiNk42CLLcWsiQSV/hcmOR6
   ItMO73FJ7DjyUnskPEqbesOmerCw7Trdigqc2tbsSUAoFhGGRDCY8OaiR
   zJkJeScA0fVVFxZv8WKanVGqOkh1srW6n/6SomjWROpkwUiI+NtX9C12B
   Q==;
X-CSE-ConnectionGUID: 4IWcV/qhSCiLT7IIablAzQ==
X-CSE-MsgGUID: EDig+C27Qf2pdGBqGCDuWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9990805"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9990805"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 05:53:50 -0700
X-CSE-ConnectionGUID: fi1Xtnb9T5SNSSMepz/yPA==
X-CSE-MsgGUID: 3ju7Nb/VRcS6xo0QM5KeLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25293272"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Apr 2024 05:53:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0L5G-0003iQ-2I;
	Fri, 26 Apr 2024 12:53:46 +0000
Date: Fri, 26 Apr 2024 20:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 48f98496b1de132f2e056605b5330209136066dc
Message-ID: <202404262027.4HIf0d4s-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 48f98496b1de132f2e056605b5330209136066dc  bus: mhi: host: pci_generic: Add generic edl_trigger to allow devices to enter EDL mode

elapsed time: 1309m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240426   gcc  
arc                   randconfig-002-20240426   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-002-20240426   gcc  
arm                   randconfig-003-20240426   gcc  
arm                   randconfig-004-20240426   gcc  
arm                        shmobile_defconfig   gcc  
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240426   gcc  
arm64                 randconfig-002-20240426   gcc  
arm64                 randconfig-004-20240426   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240426   gcc  
csky                  randconfig-002-20240426   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240426   clang
i386         buildonly-randconfig-005-20240426   clang
i386         buildonly-randconfig-006-20240426   clang
i386                                defconfig   clang
i386                  randconfig-002-20240426   clang
i386                  randconfig-006-20240426   clang
i386                  randconfig-012-20240426   clang
i386                  randconfig-013-20240426   clang
i386                  randconfig-014-20240426   clang
i386                  randconfig-015-20240426   clang
i386                  randconfig-016-20240426   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240426   gcc  
loongarch             randconfig-002-20240426   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240426   gcc  
nios2                 randconfig-002-20240426   gcc  
openrisc                         alldefconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240426   gcc  
parisc                randconfig-002-20240426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-002-20240426   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240426   gcc  
powerpc64             randconfig-002-20240426   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240426   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240426   gcc  
sh                    randconfig-002-20240426   gcc  
sh                          rsk7269_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240426   gcc  
sparc64               randconfig-002-20240426   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240426   gcc  
um                    randconfig-002-20240426   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240426   gcc  
x86_64       buildonly-randconfig-005-20240426   gcc  
x86_64       buildonly-randconfig-006-20240426   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                randconfig-001-20240426   gcc  
x86_64                randconfig-002-20240426   gcc  
x86_64                randconfig-003-20240426   gcc  
x86_64                randconfig-012-20240426   gcc  
x86_64                randconfig-013-20240426   gcc  
x86_64                randconfig-014-20240426   gcc  
x86_64                randconfig-015-20240426   gcc  
x86_64                randconfig-074-20240426   gcc  
x86_64                randconfig-075-20240426   gcc  
x86_64                randconfig-076-20240426   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240426   gcc  
xtensa                randconfig-002-20240426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
