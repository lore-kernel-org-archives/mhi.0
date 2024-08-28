Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D58165F1C
	for <mhi@lists.linux.dev>; Wed, 28 Aug 2024 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836872; cv=none; b=U0MyEvAFwawb25cvsdKnVRHsGEm8vRlfC9RnPRk3+Btgd5sDC3mi8uoaMqD4a3N6k84I0qwBoiKEbxB0FKc2pPLyI6obylgAQX4th0tDSl4Lt7Ymc0wg5l2gI3V9s/11dfgKlKdUhtMTGAjeC46aM+4idVm/IIDzdlVkAe338Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836872; c=relaxed/simple;
	bh=6yR9HoB8hx4BcGvIuVdNWwR/hxq4c+rL+QH0yWqpMJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=agb8eA/1Rq6sthNpz14qOo35NjnxyHqfUo7TXiKirGfZobwql1DLLrm+lVHdZe5KM4D6todlWn6KAQtprRrr3iXOBOdmqe/bcHDFqUNqCsFZDhu76z2LfPXGinwGZo1Pypah7XAodd3qlpJRWgyHEjWOnVcOw+Bn7rpBDPbJ82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWjhDVIV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWjhDVIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724836870; x=1756372870;
  h=date:from:to:cc:subject:message-id;
  bh=6yR9HoB8hx4BcGvIuVdNWwR/hxq4c+rL+QH0yWqpMJU=;
  b=fWjhDVIVpwdpwNWSxdtwY43o9KDXyJj6xjjPgDcZ32qaWZxKLPwWCRQ6
   HAFcTTZsvrVur1cQOLTL9lTNGIhm4PFvQL58DcSgZPQyhdWMVM5qipTWE
   8sekM9+wEgIGvDtTYKTko3r63d/WoFRMaigIc7cahGlObFje7gYsIGoel
   RvD/k2swtgX4uy9fLO7BWiR3pi27lgMvCazHdul9SEdfYr6QGrJ0CR4iP
   Ydf2hT/yDcsXBOmDgGfCsHR8EysfL4OHHssBvbPZON0HEHuB030l7UNfF
   fbWJ3/bIgY+uQOY56SBW0IYtgdOkPo5sHBhS7ANeRDXaIEJU/MMf1AtgC
   Q==;
X-CSE-ConnectionGUID: Qbj+d5hfRyugpa31TYw/VQ==
X-CSE-MsgGUID: HyayHyqBQMSYtJGLGOjsbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27152060"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="27152060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 02:21:07 -0700
X-CSE-ConnectionGUID: E3g0zJNZTjqCxl6YRykgtg==
X-CSE-MsgGUID: /yw+vHWhQ+CpRBR8UZcPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67839555"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2024 02:21:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjErP-000KjQ-0s;
	Wed, 28 Aug 2024 09:21:03 +0000
Date: Wed, 28 Aug 2024 17:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 969db85b4f63fcc9a0ae42e808bf68aaafdb7283
Message-ID: <202408281701.WKDTEHD4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 969db85b4f63fcc9a0ae42e808bf68aaafdb7283  bus: mhi: host: pci_generic: Add support for Netprisma LCUR57 and FCUN69

elapsed time: 1472m

configs tested: 185
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240828   gcc-13.2.0
arc                   randconfig-002-20240828   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                   randconfig-001-20240828   gcc-13.2.0
arm                   randconfig-002-20240828   gcc-13.2.0
arm                   randconfig-003-20240828   gcc-13.2.0
arm                   randconfig-004-20240828   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240828   gcc-13.2.0
arm64                 randconfig-002-20240828   gcc-13.2.0
arm64                 randconfig-003-20240828   gcc-13.2.0
arm64                 randconfig-004-20240828   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240828   gcc-13.2.0
csky                  randconfig-002-20240828   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240828   gcc-12
i386         buildonly-randconfig-002-20240828   clang-18
i386         buildonly-randconfig-002-20240828   gcc-12
i386         buildonly-randconfig-003-20240828   clang-18
i386         buildonly-randconfig-003-20240828   gcc-12
i386         buildonly-randconfig-004-20240828   gcc-12
i386         buildonly-randconfig-005-20240828   gcc-12
i386         buildonly-randconfig-006-20240828   clang-18
i386         buildonly-randconfig-006-20240828   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240828   clang-18
i386                  randconfig-001-20240828   gcc-12
i386                  randconfig-002-20240828   gcc-12
i386                  randconfig-003-20240828   clang-18
i386                  randconfig-003-20240828   gcc-12
i386                  randconfig-004-20240828   clang-18
i386                  randconfig-004-20240828   gcc-12
i386                  randconfig-005-20240828   clang-18
i386                  randconfig-005-20240828   gcc-12
i386                  randconfig-006-20240828   gcc-12
i386                  randconfig-011-20240828   gcc-12
i386                  randconfig-012-20240828   gcc-12
i386                  randconfig-013-20240828   clang-18
i386                  randconfig-013-20240828   gcc-12
i386                  randconfig-014-20240828   gcc-11
i386                  randconfig-014-20240828   gcc-12
i386                  randconfig-015-20240828   gcc-12
i386                  randconfig-016-20240828   gcc-11
i386                  randconfig-016-20240828   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240828   gcc-13.2.0
loongarch             randconfig-002-20240828   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240828   gcc-13.2.0
nios2                 randconfig-002-20240828   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240828   gcc-13.2.0
parisc                randconfig-002-20240828   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc               randconfig-003-20240828   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240828   gcc-13.2.0
powerpc64             randconfig-002-20240828   gcc-13.2.0
powerpc64             randconfig-003-20240828   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240828   gcc-13.2.0
riscv                 randconfig-002-20240828   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240828   gcc-13.2.0
s390                  randconfig-002-20240828   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                    randconfig-001-20240828   gcc-13.2.0
sh                    randconfig-002-20240828   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240828   gcc-13.2.0
sparc64               randconfig-002-20240828   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240828   gcc-13.2.0
um                    randconfig-002-20240828   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240828   clang-18
x86_64       buildonly-randconfig-002-20240828   clang-18
x86_64       buildonly-randconfig-003-20240828   clang-18
x86_64       buildonly-randconfig-004-20240828   clang-18
x86_64       buildonly-randconfig-005-20240828   clang-18
x86_64       buildonly-randconfig-006-20240828   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240828   clang-18
x86_64                randconfig-002-20240828   clang-18
x86_64                randconfig-003-20240828   clang-18
x86_64                randconfig-004-20240828   clang-18
x86_64                randconfig-005-20240828   clang-18
x86_64                randconfig-006-20240828   clang-18
x86_64                randconfig-011-20240828   clang-18
x86_64                randconfig-012-20240828   clang-18
x86_64                randconfig-013-20240828   clang-18
x86_64                randconfig-014-20240828   clang-18
x86_64                randconfig-015-20240828   clang-18
x86_64                randconfig-016-20240828   clang-18
x86_64                randconfig-071-20240828   clang-18
x86_64                randconfig-072-20240828   clang-18
x86_64                randconfig-073-20240828   clang-18
x86_64                randconfig-074-20240828   clang-18
x86_64                randconfig-075-20240828   clang-18
x86_64                randconfig-076-20240828   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240828   gcc-13.2.0
xtensa                randconfig-002-20240828   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
