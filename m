Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A03B52F1
	for <mhi@lists.linux.dev>; Tue, 20 Jan 2026 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943398; cv=none; b=X3RLTKUx1p/PbVFAd5ChQoEFujbT1qdAWFc5OxlrGDamoiRKmaeNBTGQ8b4bIR7iFxjbOGLdH1VcTXYEkZ2or2lhEAqd95pP5kAzJ3+v6pGbcJXHXgYl8UQM7aJQ91CdMOnk3DIR3oH5R+85R8c55WfUVBe2Hv0wQmIokR6ItK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943398; c=relaxed/simple;
	bh=FTIRBCYFwr1hkUHnMLeVxyk4qPphBOnNF7jGMhX6SCQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hA+bJ8KGsjSBlDjbkVnWOGoOYy4h3uF9qDvHvUtBXO2tU2pRc+kOepe9JfQUnQAX5bpE39Q7qZWdxRhKODRE0YWuDaMlUKkD3dPhdt4IgECSpxYknzZK4um/UpWCvCV4bWRFPM1DpNVAjqwqpRfiFhQXUa8HWBAn0K1b+q/lSEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbsPO6yT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbsPO6yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768943396; x=1800479396;
  h=date:from:to:cc:subject:message-id;
  bh=FTIRBCYFwr1hkUHnMLeVxyk4qPphBOnNF7jGMhX6SCQ=;
  b=bbsPO6yTlap3VKFHZ4hmQtsTajkZyjJTHm+fR/lL5Xpu8kgWxpnkg/zz
   UnphRC1+Y27NJQTt7t5/gHkGfv1oJg8OOkjtJ4bpKndOnxE9v19ZFNN8Q
   RTZixyl1Zq2gNaIFqjoIpY0kNm9zd61i5snNUm+gpZxwauj4OzHFPJMoj
   bf0q3/67+0T+lRF1sZh3G5awiW11sbgNNoc6PSRxHcbtoQs5lX0Q5bPeh
   7CUtOjolrFYONIoq01zbxOUD6QIXMHmeV4x77zy31YV1CTdW4uAzuTYgP
   2arvfZcvbRaykSJyuAOUo4lIxfR2cmaQvXshJ6OXAQFkbok2KqA6qFC52
   g==;
X-CSE-ConnectionGUID: BJj2Vw/xRCO/Gp6XA3Ib0Q==
X-CSE-MsgGUID: CIFG0gBsQZCipzVUAMnFeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80791583"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="80791583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:09:55 -0800
X-CSE-ConnectionGUID: L1T5BJ1uQgKKgpE2cpP9Cg==
X-CSE-MsgGUID: pzOUFiiqQuablOYUU2vH3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="237482962"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2026 13:09:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viIz1-00000000PXV-2m7a;
	Tue, 20 Jan 2026 21:09:51 +0000
Date: Wed, 21 Jan 2026 05:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-ath-resolution] BUILD SUCCESS
 a1cf17be3ba3718f1a8c70e614f4c0ee026a90fd
Message-ID: <202601210502.94P4ff1q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-ath-resolution
branch HEAD: a1cf17be3ba3718f1a8c70e614f4c0ee026a90fd  Merge branch 'mhi-next' into 'ath-next'

elapsed time: 733m

configs tested: 291
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                            hsdk_defconfig    clang-18
arc                   randconfig-001-20260120    clang-22
arc                   randconfig-001-20260120    gcc-10.5.0
arc                   randconfig-001-20260121    clang-18
arc                   randconfig-002-20260120    clang-22
arc                   randconfig-002-20260120    gcc-8.5.0
arc                   randconfig-002-20260121    clang-18
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                         at91_dt_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    clang-18
arm                         mv78xx0_defconfig    gcc-15.2.0
arm                   randconfig-001-20260120    clang-22
arm                   randconfig-001-20260121    clang-18
arm                   randconfig-002-20260120    clang-22
arm                   randconfig-002-20260120    gcc-13.4.0
arm                   randconfig-002-20260121    clang-18
arm                   randconfig-003-20260120    clang-22
arm                   randconfig-003-20260121    clang-18
arm                   randconfig-004-20260120    clang-22
arm                   randconfig-004-20260121    clang-18
arm                        spear3xx_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260120    gcc-12.5.0
arm64                 randconfig-001-20260120    gcc-15.2.0
arm64                 randconfig-001-20260121    gcc-15.2.0
arm64                 randconfig-002-20260120    gcc-15.2.0
arm64                 randconfig-002-20260120    gcc-8.5.0
arm64                 randconfig-002-20260121    gcc-15.2.0
arm64                 randconfig-003-20260120    clang-22
arm64                 randconfig-003-20260120    gcc-15.2.0
arm64                 randconfig-003-20260121    gcc-15.2.0
arm64                 randconfig-004-20260120    clang-22
arm64                 randconfig-004-20260120    gcc-15.2.0
arm64                 randconfig-004-20260121    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260120    gcc-15.2.0
csky                  randconfig-001-20260121    gcc-15.2.0
csky                  randconfig-002-20260120    gcc-15.2.0
csky                  randconfig-002-20260121    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260120    gcc-12.5.0
hexagon               randconfig-001-20260121    gcc-15.2.0
hexagon               randconfig-002-20260120    gcc-12.5.0
hexagon               randconfig-002-20260121    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260120    gcc-14
i386        buildonly-randconfig-002-20260120    gcc-14
i386        buildonly-randconfig-003-20260120    gcc-14
i386        buildonly-randconfig-004-20260120    gcc-14
i386        buildonly-randconfig-005-20260120    gcc-14
i386        buildonly-randconfig-006-20260120    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260120    clang-20
i386                  randconfig-001-20260121    clang-20
i386                  randconfig-002-20260120    clang-20
i386                  randconfig-002-20260121    clang-20
i386                  randconfig-003-20260120    clang-20
i386                  randconfig-003-20260121    clang-20
i386                  randconfig-004-20260120    clang-20
i386                  randconfig-004-20260121    clang-20
i386                  randconfig-005-20260120    clang-20
i386                  randconfig-005-20260121    clang-20
i386                  randconfig-006-20260120    clang-20
i386                  randconfig-006-20260121    clang-20
i386                  randconfig-007-20260120    clang-20
i386                  randconfig-007-20260121    clang-20
i386                  randconfig-011-20260120    clang-20
i386                  randconfig-012-20260120    clang-20
i386                  randconfig-012-20260120    gcc-14
i386                  randconfig-013-20260120    clang-20
i386                  randconfig-014-20260120    clang-20
i386                  randconfig-015-20260120    clang-20
i386                  randconfig-016-20260120    clang-20
i386                  randconfig-017-20260120    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson32_defconfig    clang-18
loongarch             randconfig-001-20260120    gcc-12.5.0
loongarch             randconfig-001-20260121    gcc-15.2.0
loongarch             randconfig-002-20260120    gcc-12.5.0
loongarch             randconfig-002-20260121    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                          hp300_defconfig    gcc-15.2.0
m68k                        m5307c3_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    clang-18
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
mips                      maltasmvp_defconfig    gcc-15.2.0
mips                          rb532_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260120    gcc-12.5.0
nios2                 randconfig-001-20260121    gcc-15.2.0
nios2                 randconfig-002-20260120    gcc-12.5.0
nios2                 randconfig-002-20260121    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260120    gcc-8.5.0
parisc                randconfig-001-20260121    gcc-9.5.0
parisc                randconfig-002-20260120    gcc-8.5.0
parisc                randconfig-002-20260121    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    ge_imp3a_defconfig    clang-18
powerpc                        icon_defconfig    gcc-15.2.0
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                     mpc512x_defconfig    clang-18
powerpc               randconfig-001-20260120    gcc-8.5.0
powerpc               randconfig-001-20260121    gcc-9.5.0
powerpc               randconfig-002-20260120    gcc-8.5.0
powerpc               randconfig-002-20260121    gcc-9.5.0
powerpc                     redwood_defconfig    gcc-15.2.0
powerpc                     tqm8540_defconfig    clang-18
powerpc64             randconfig-001-20260120    gcc-8.5.0
powerpc64             randconfig-001-20260121    gcc-9.5.0
powerpc64             randconfig-002-20260120    gcc-8.5.0
powerpc64             randconfig-002-20260121    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260120    gcc-13.4.0
riscv                 randconfig-001-20260121    clang-16
riscv                 randconfig-002-20260120    gcc-10.5.0
riscv                 randconfig-002-20260120    gcc-13.4.0
riscv                 randconfig-002-20260121    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260120    gcc-13.4.0
s390                  randconfig-001-20260120    gcc-15.2.0
s390                  randconfig-001-20260121    clang-16
s390                  randconfig-002-20260120    clang-22
s390                  randconfig-002-20260120    gcc-13.4.0
s390                  randconfig-002-20260121    clang-16
sh                               alldefconfig    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                         apsh4a3a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.2.0
sh                        edosk7760_defconfig    gcc-15.2.0
sh                          r7780mp_defconfig    gcc-15.2.0
sh                    randconfig-001-20260120    gcc-13.4.0
sh                    randconfig-001-20260120    gcc-15.2.0
sh                    randconfig-001-20260121    clang-16
sh                    randconfig-002-20260120    gcc-11.5.0
sh                    randconfig-002-20260120    gcc-13.4.0
sh                    randconfig-002-20260121    clang-16
sh                          rsk7264_defconfig    gcc-15.2.0
sh                   rts7751r2dplus_defconfig    gcc-15.2.0
sh                           se7343_defconfig    gcc-15.2.0
sh                           se7705_defconfig    gcc-15.2.0
sh                           se7712_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260120    gcc-8.5.0
sparc                 randconfig-002-20260120    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260120    gcc-8.5.0
sparc64               randconfig-002-20260120    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260120    gcc-8.5.0
um                    randconfig-002-20260120    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260120    gcc-14
x86_64      buildonly-randconfig-002-20260120    gcc-14
x86_64      buildonly-randconfig-003-20260120    gcc-14
x86_64      buildonly-randconfig-004-20260120    gcc-14
x86_64      buildonly-randconfig-005-20260120    gcc-14
x86_64      buildonly-randconfig-006-20260120    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260120    gcc-14
x86_64                randconfig-001-20260121    clang-20
x86_64                randconfig-002-20260120    gcc-14
x86_64                randconfig-002-20260121    clang-20
x86_64                randconfig-003-20260120    gcc-14
x86_64                randconfig-003-20260121    clang-20
x86_64                randconfig-004-20260120    gcc-14
x86_64                randconfig-004-20260121    clang-20
x86_64                randconfig-005-20260120    gcc-14
x86_64                randconfig-005-20260121    clang-20
x86_64                randconfig-006-20260120    gcc-14
x86_64                randconfig-006-20260121    clang-20
x86_64                randconfig-011-20260120    gcc-14
x86_64                randconfig-011-20260121    gcc-14
x86_64                randconfig-012-20260120    gcc-14
x86_64                randconfig-012-20260121    gcc-14
x86_64                randconfig-013-20260120    gcc-14
x86_64                randconfig-013-20260121    gcc-14
x86_64                randconfig-014-20260120    gcc-14
x86_64                randconfig-014-20260121    gcc-14
x86_64                randconfig-015-20260120    gcc-14
x86_64                randconfig-015-20260121    gcc-14
x86_64                randconfig-016-20260120    gcc-14
x86_64                randconfig-016-20260121    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260120    gcc-8.5.0
xtensa                randconfig-002-20260120    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
