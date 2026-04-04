Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF8919D07E
	for <mhi@lists.linux.dev>; Sat,  4 Apr 2026 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775271906; cv=none; b=lcWd5A9mlGYLB3XIDCmcD/kOq37AnEM/EqW8LfG504JIql1YwY3X6fKAiy/quTE1x/nZIYh46XWsfAapTAatcr7XkLGrnin0Sk5YwmdEpNpin3SP7nCm4qozpIFA+l4LzV0ilBOvBbJfStojnQBqAWivrD/a6lUtY5jXDhyvTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775271906; c=relaxed/simple;
	bh=Rw3BYP7iTqH7oQjo5HlYhhVwcKd0EGLtWoDvq88D7/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YHZ5879YGw82mEl+Loqp/qslVbGOgMHfLmPpA5mArRvbput80DXhxq1O00enMPprqUjtZYQ1+JKPbo0yN1wISXItkbN8Mf0lW8MqgF8nIK0Aa/mwmDg91YkGSgyJhOF2eQ5FMr1b5IBf63HrDWWZtCmH6WF7/yIchBBfos+Qwg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6OHvh9F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6OHvh9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775271905; x=1806807905;
  h=date:from:to:cc:subject:message-id;
  bh=Rw3BYP7iTqH7oQjo5HlYhhVwcKd0EGLtWoDvq88D7/s=;
  b=M6OHvh9FOyS5jF7kA4cIDPIY7Jnh5Qencq96JHOYnL0inykcQL1WXrPo
   Lm8jLTpVFA0DRpChslQ0lp9DN4Hmg/ngSZ6U5l/hXthhEkDiCvG365bH2
   rXX8uGp9X+fyDNhcVbMHJ9CJLBaBIoiWLiUDzIXjGaptwnYtcOFuOaJFX
   j29fus4wU2seKNEoOAhIRW0uApXK6v5PoeJd0G683KMHzKRcPukdh/x6+
   sboh4b1eh/+55Ti9uIPjpcWOMdSuMHL4sOk55Ns+JjVFrXx/sy4evL4Ge
   oIVfvRLfBavRcJCOlUizyPwCX9uIg59OyMf24gCmToIP1QF5ZAXfMo99g
   g==;
X-CSE-ConnectionGUID: neF/z3QHSk2+YGe1+LMBYQ==
X-CSE-MsgGUID: OeBB2+ykSx6yadD8LuLO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="87780250"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="87780250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 20:05:04 -0700
X-CSE-ConnectionGUID: +AvfKH4tQZiHKaMg7SR9QA==
X-CSE-MsgGUID: jdp/pegETlO5G3f/I4Geiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="222568358"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2026 20:05:03 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8rJk-000000000S9-0rlz;
	Sat, 04 Apr 2026 03:05:00 +0000
Date: Sat, 04 Apr 2026 11:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc
Message-ID: <202604041125.GTljOxwb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc  bus: mhi: host: pci_generic: Add Telit FE912C04 modem support

elapsed time: 1241m

configs tested: 289
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260403    gcc-10.5.0
arc                   randconfig-001-20260404    gcc-15.2.0
arc                   randconfig-002-20260403    gcc-10.5.0
arc                   randconfig-002-20260404    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260403    gcc-10.5.0
arm                   randconfig-001-20260404    gcc-15.2.0
arm                   randconfig-002-20260403    gcc-10.5.0
arm                   randconfig-002-20260404    gcc-15.2.0
arm                   randconfig-003-20260403    gcc-10.5.0
arm                   randconfig-003-20260404    gcc-15.2.0
arm                   randconfig-004-20260403    gcc-10.5.0
arm                   randconfig-004-20260404    gcc-15.2.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260403    gcc-13.4.0
arm64                 randconfig-001-20260404    gcc-15.2.0
arm64                 randconfig-002-20260403    gcc-13.4.0
arm64                 randconfig-002-20260404    gcc-15.2.0
arm64                 randconfig-003-20260403    gcc-13.4.0
arm64                 randconfig-003-20260404    gcc-15.2.0
arm64                 randconfig-004-20260403    gcc-13.4.0
arm64                 randconfig-004-20260404    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260403    gcc-13.4.0
csky                  randconfig-001-20260404    gcc-15.2.0
csky                  randconfig-002-20260403    gcc-13.4.0
csky                  randconfig-002-20260404    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260403    clang-23
hexagon               randconfig-001-20260404    gcc-15.2.0
hexagon               randconfig-002-20260403    clang-23
hexagon               randconfig-002-20260404    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260403    gcc-14
i386        buildonly-randconfig-001-20260404    clang-20
i386        buildonly-randconfig-002-20260403    clang-20
i386        buildonly-randconfig-002-20260403    gcc-14
i386        buildonly-randconfig-002-20260404    clang-20
i386        buildonly-randconfig-003-20260403    gcc-14
i386        buildonly-randconfig-003-20260404    clang-20
i386        buildonly-randconfig-004-20260403    gcc-14
i386        buildonly-randconfig-004-20260404    clang-20
i386        buildonly-randconfig-005-20260403    gcc-14
i386        buildonly-randconfig-005-20260404    clang-20
i386        buildonly-randconfig-006-20260403    gcc-14
i386        buildonly-randconfig-006-20260404    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260403    gcc-14
i386                  randconfig-001-20260404    clang-20
i386                  randconfig-002-20260403    gcc-14
i386                  randconfig-002-20260404    clang-20
i386                  randconfig-003-20260403    gcc-14
i386                  randconfig-003-20260404    clang-20
i386                  randconfig-004-20260403    gcc-14
i386                  randconfig-004-20260404    clang-20
i386                  randconfig-005-20260403    gcc-14
i386                  randconfig-005-20260404    clang-20
i386                  randconfig-006-20260403    gcc-14
i386                  randconfig-006-20260404    clang-20
i386                  randconfig-007-20260403    gcc-14
i386                  randconfig-007-20260404    clang-20
i386                  randconfig-011-20260403    clang-20
i386                  randconfig-011-20260404    clang-20
i386                  randconfig-012-20260403    clang-20
i386                  randconfig-012-20260404    clang-20
i386                  randconfig-013-20260403    clang-20
i386                  randconfig-013-20260404    clang-20
i386                  randconfig-014-20260403    clang-20
i386                  randconfig-014-20260404    clang-20
i386                  randconfig-015-20260403    clang-20
i386                  randconfig-015-20260404    clang-20
i386                  randconfig-016-20260403    clang-20
i386                  randconfig-016-20260404    clang-20
i386                  randconfig-017-20260403    clang-20
i386                  randconfig-017-20260404    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260403    clang-23
loongarch             randconfig-001-20260404    gcc-15.2.0
loongarch             randconfig-002-20260403    clang-23
loongarch             randconfig-002-20260404    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                      mmu_defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                        omega2p_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260403    clang-23
nios2                 randconfig-001-20260404    gcc-15.2.0
nios2                 randconfig-002-20260403    clang-23
nios2                 randconfig-002-20260404    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260403    gcc-10.5.0
parisc                randconfig-001-20260404    gcc-10.5.0
parisc                randconfig-002-20260403    gcc-10.5.0
parisc                randconfig-002-20260404    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc83xx_defconfig    clang-23
powerpc               randconfig-001-20260403    gcc-10.5.0
powerpc               randconfig-001-20260404    gcc-10.5.0
powerpc               randconfig-002-20260403    gcc-10.5.0
powerpc               randconfig-002-20260404    gcc-10.5.0
powerpc                  storcenter_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260403    gcc-10.5.0
powerpc64             randconfig-001-20260404    gcc-10.5.0
powerpc64             randconfig-002-20260403    gcc-10.5.0
powerpc64             randconfig-002-20260404    gcc-10.5.0
riscv                            alldefconfig    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260403    clang-23
riscv                 randconfig-001-20260403    gcc-10.5.0
riscv                 randconfig-001-20260404    clang-20
riscv                 randconfig-002-20260403    clang-23
riscv                 randconfig-002-20260403    gcc-10.5.0
riscv                 randconfig-002-20260404    clang-20
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260403    clang-23
s390                  randconfig-001-20260404    clang-20
s390                  randconfig-002-20260403    clang-18
s390                  randconfig-002-20260403    clang-23
s390                  randconfig-002-20260404    clang-20
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                        apsh4ad0a_defconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260403    clang-23
sh                    randconfig-001-20260403    gcc-13.4.0
sh                    randconfig-001-20260404    clang-20
sh                    randconfig-002-20260403    clang-23
sh                    randconfig-002-20260403    gcc-15.2.0
sh                    randconfig-002-20260404    clang-20
sh                           se7721_defconfig    gcc-15.2.0
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260403    clang-20
sparc                 randconfig-001-20260404    clang-20
sparc                 randconfig-002-20260403    clang-20
sparc                 randconfig-002-20260404    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260403    clang-20
sparc64               randconfig-001-20260404    clang-20
sparc64               randconfig-002-20260403    clang-20
sparc64               randconfig-002-20260404    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260403    clang-20
um                    randconfig-001-20260404    clang-20
um                    randconfig-002-20260403    clang-20
um                    randconfig-002-20260404    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260403    clang-20
x86_64      buildonly-randconfig-001-20260404    gcc-13
x86_64      buildonly-randconfig-002-20260403    clang-20
x86_64      buildonly-randconfig-002-20260404    gcc-13
x86_64      buildonly-randconfig-003-20260403    clang-20
x86_64      buildonly-randconfig-003-20260404    gcc-13
x86_64      buildonly-randconfig-004-20260403    clang-20
x86_64      buildonly-randconfig-004-20260404    gcc-13
x86_64      buildonly-randconfig-005-20260403    clang-20
x86_64      buildonly-randconfig-005-20260404    gcc-13
x86_64      buildonly-randconfig-006-20260403    clang-20
x86_64      buildonly-randconfig-006-20260404    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260403    clang-20
x86_64                randconfig-001-20260404    gcc-14
x86_64                randconfig-002-20260403    clang-20
x86_64                randconfig-002-20260404    gcc-14
x86_64                randconfig-003-20260403    clang-20
x86_64                randconfig-003-20260404    gcc-14
x86_64                randconfig-004-20260403    clang-20
x86_64                randconfig-004-20260404    gcc-14
x86_64                randconfig-005-20260403    clang-20
x86_64                randconfig-005-20260404    gcc-14
x86_64                randconfig-006-20260403    clang-20
x86_64                randconfig-006-20260404    gcc-14
x86_64                randconfig-011-20260403    gcc-14
x86_64                randconfig-011-20260404    gcc-14
x86_64                randconfig-012-20260403    gcc-14
x86_64                randconfig-012-20260404    gcc-14
x86_64                randconfig-013-20260403    gcc-14
x86_64                randconfig-013-20260404    gcc-14
x86_64                randconfig-014-20260403    gcc-14
x86_64                randconfig-014-20260404    gcc-14
x86_64                randconfig-015-20260403    gcc-14
x86_64                randconfig-015-20260404    gcc-14
x86_64                randconfig-016-20260403    gcc-14
x86_64                randconfig-016-20260404    gcc-14
x86_64                randconfig-071-20260403    gcc-14
x86_64                randconfig-071-20260404    gcc-14
x86_64                randconfig-072-20260403    gcc-14
x86_64                randconfig-072-20260404    gcc-14
x86_64                randconfig-073-20260403    gcc-14
x86_64                randconfig-073-20260404    gcc-14
x86_64                randconfig-074-20260403    gcc-14
x86_64                randconfig-074-20260404    gcc-14
x86_64                randconfig-075-20260403    clang-20
x86_64                randconfig-075-20260403    gcc-14
x86_64                randconfig-075-20260404    gcc-14
x86_64                randconfig-076-20260403    gcc-14
x86_64                randconfig-076-20260404    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260403    clang-20
xtensa                randconfig-001-20260404    clang-20
xtensa                randconfig-002-20260403    clang-20
xtensa                randconfig-002-20260404    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
