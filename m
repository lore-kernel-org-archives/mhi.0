Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF11C3C11
	for <mhi@lists.linux.dev>; Tue,  9 Sep 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406816; cv=none; b=K5hbXBxePuuOsvytSalUbYyT2BiPbtHRNhuCLJpTHO5WEUEAvNxeImxKgAESgWtw2lu9YL8rHp0FBHJgK+SsT0HIbhfRQyhvj6/tVLUdJJCI13n1+3zxjKfVHVpTO8ktr8GUTw7Te0UOjXq9ojenC7zKRMt5nqjBTe0BHw7KQEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406816; c=relaxed/simple;
	bh=rWRPMoglklPfFFEQCVVYYiiisPtX27JCE9JX6n5kTnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mbfHXQ/DhnBQKtFGIglFHqCHZ8Ljdan5xiKf1q0ba673YZAhI0DcYWqPfETbTTcQpcgbYBgtaGZrYS4pL3KpZVbvj6FJeRS350mZIXad0Ley6cgJApIY9ivk1dBIqHJyOTmWTJVZHm1WAWnrrAiU5qwWYQgN0zczAeTOtEcND0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eElQBWcC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eElQBWcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757406815; x=1788942815;
  h=date:from:to:cc:subject:message-id;
  bh=rWRPMoglklPfFFEQCVVYYiiisPtX27JCE9JX6n5kTnQ=;
  b=eElQBWcCs10RtLTBA5zerJzz6Y8O3DpMSPkLnfFfk5HwleaWrQAatAVr
   155eiiPBpxElqQHLRNDfftXikudbBpvdwKiDhNDmy48Ylw3R0OQooysWV
   mX+PIeRk4lCY/JDF2Q+W7P/tWOFST/ydE/BkorAX/Bav1U6GpGH8b2+o2
   RCjy0n2J+J+daRTU4+M0EO1j/FWvbDJl8bn5XKJoLKxk1sE6uB8/GN5Y/
   ZgK0ULn2/WYEvggo7gYKzgpH3W+R10IqFgPhIhuaNIB6lI/oyG5cxB0s1
   1NLPoPPAm77mCSoZHhCP82ozhE3Yj0MKSxn3gYtrHrDqNFZZEhyiSYrJW
   g==;
X-CSE-ConnectionGUID: MvbFrRRqSiOfhKxk4x6CIQ==
X-CSE-MsgGUID: a4QqfsNgTjCi5p5CbaXMeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59828578"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59828578"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:33:34 -0700
X-CSE-ConnectionGUID: Gi3XysY/SHevV36jAAZnCA==
X-CSE-MsgGUID: C9uxeerNSMqApKHlfVczDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="173490365"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2025 01:33:32 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvtn8-0004eN-0J;
	Tue, 09 Sep 2025 08:33:30 +0000
Date: Tue, 09 Sep 2025 16:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 d0856a6dff57f95cc5d2d74e50880f01697d0cc4
Message-ID: <202509091629.lD0T93zw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: d0856a6dff57f95cc5d2d74e50880f01697d0cc4  bus: mhi: host: Do not use uninitialized 'dev' pointer in mhi_init_irq_setup()

elapsed time: 1151m

configs tested: 241
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250908    gcc-8.5.0
arc                   randconfig-001-20250909    clang-16
arc                   randconfig-002-20250908    gcc-13.4.0
arc                   randconfig-002-20250909    clang-16
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        multi_v7_defconfig    clang-22
arm                             mxs_defconfig    clang-22
arm                       netwinder_defconfig    clang-22
arm                   randconfig-001-20250908    clang-22
arm                   randconfig-001-20250909    clang-16
arm                   randconfig-002-20250908    clang-22
arm                   randconfig-002-20250909    clang-16
arm                   randconfig-003-20250908    gcc-12.5.0
arm                   randconfig-003-20250909    clang-16
arm                   randconfig-004-20250908    gcc-14.3.0
arm                   randconfig-004-20250909    clang-16
arm                       versatile_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250908    clang-20
arm64                 randconfig-001-20250909    clang-16
arm64                 randconfig-002-20250908    clang-16
arm64                 randconfig-002-20250909    clang-16
arm64                 randconfig-003-20250908    gcc-9.5.0
arm64                 randconfig-003-20250909    clang-16
arm64                 randconfig-004-20250908    gcc-8.5.0
arm64                 randconfig-004-20250909    clang-16
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250908    gcc-14.3.0
csky                  randconfig-001-20250909    gcc-8.5.0
csky                  randconfig-002-20250908    gcc-15.1.0
csky                  randconfig-002-20250909    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250908    clang-17
hexagon               randconfig-001-20250909    gcc-8.5.0
hexagon               randconfig-002-20250908    clang-20
hexagon               randconfig-002-20250909    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250908    gcc-14
i386        buildonly-randconfig-001-20250909    clang-20
i386        buildonly-randconfig-002-20250908    gcc-14
i386        buildonly-randconfig-002-20250909    clang-20
i386        buildonly-randconfig-003-20250908    gcc-12
i386        buildonly-randconfig-003-20250909    clang-20
i386        buildonly-randconfig-004-20250908    gcc-14
i386        buildonly-randconfig-004-20250909    clang-20
i386        buildonly-randconfig-005-20250908    clang-20
i386        buildonly-randconfig-005-20250909    clang-20
i386        buildonly-randconfig-006-20250908    clang-20
i386        buildonly-randconfig-006-20250909    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250909    clang-20
i386                  randconfig-002-20250909    clang-20
i386                  randconfig-003-20250909    clang-20
i386                  randconfig-004-20250909    clang-20
i386                  randconfig-005-20250909    clang-20
i386                  randconfig-006-20250909    clang-20
i386                  randconfig-007-20250909    clang-20
i386                  randconfig-011-20250909    gcc-14
i386                  randconfig-012-20250909    gcc-14
i386                  randconfig-013-20250909    gcc-14
i386                  randconfig-014-20250909    gcc-14
i386                  randconfig-015-20250909    gcc-14
i386                  randconfig-016-20250909    gcc-14
i386                  randconfig-017-20250909    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250908    gcc-15.1.0
loongarch             randconfig-001-20250909    gcc-8.5.0
loongarch             randconfig-002-20250908    clang-18
loongarch             randconfig-002-20250909    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250908    gcc-8.5.0
nios2                 randconfig-001-20250909    gcc-8.5.0
nios2                 randconfig-002-20250908    gcc-11.5.0
nios2                 randconfig-002-20250909    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250908    gcc-13.4.0
parisc                randconfig-001-20250909    gcc-8.5.0
parisc                randconfig-002-20250908    gcc-8.5.0
parisc                randconfig-002-20250909    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                  mpc885_ads_defconfig    clang-22
powerpc                      pasemi_defconfig    clang-22
powerpc               randconfig-001-20250908    gcc-15.1.0
powerpc               randconfig-001-20250909    gcc-8.5.0
powerpc               randconfig-002-20250908    clang-19
powerpc               randconfig-002-20250909    gcc-8.5.0
powerpc               randconfig-003-20250908    gcc-9.5.0
powerpc               randconfig-003-20250909    gcc-8.5.0
powerpc64             randconfig-001-20250908    gcc-8.5.0
powerpc64             randconfig-001-20250909    gcc-8.5.0
powerpc64             randconfig-002-20250908    gcc-10.5.0
powerpc64             randconfig-002-20250909    gcc-8.5.0
powerpc64             randconfig-003-20250908    clang-22
powerpc64             randconfig-003-20250909    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250908    gcc-11.5.0
riscv                 randconfig-001-20250909    gcc-15.1.0
riscv                 randconfig-002-20250908    gcc-13.4.0
riscv                 randconfig-002-20250909    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250908    clang-22
s390                  randconfig-001-20250909    gcc-15.1.0
s390                  randconfig-002-20250908    gcc-12.5.0
s390                  randconfig-002-20250909    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250908    gcc-14.3.0
sh                    randconfig-001-20250909    gcc-15.1.0
sh                    randconfig-002-20250908    gcc-14.3.0
sh                    randconfig-002-20250909    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250908    gcc-8.5.0
sparc                 randconfig-001-20250909    gcc-15.1.0
sparc                 randconfig-002-20250908    gcc-12.5.0
sparc                 randconfig-002-20250909    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250908    gcc-13.4.0
sparc64               randconfig-001-20250909    gcc-15.1.0
sparc64               randconfig-002-20250908    gcc-8.5.0
sparc64               randconfig-002-20250909    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250908    gcc-14
um                    randconfig-001-20250909    gcc-15.1.0
um                    randconfig-002-20250908    clang-22
um                    randconfig-002-20250909    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250908    clang-20
x86_64      buildonly-randconfig-001-20250909    gcc-14
x86_64      buildonly-randconfig-002-20250908    gcc-14
x86_64      buildonly-randconfig-002-20250909    gcc-14
x86_64      buildonly-randconfig-003-20250908    gcc-14
x86_64      buildonly-randconfig-003-20250909    gcc-14
x86_64      buildonly-randconfig-004-20250908    gcc-14
x86_64      buildonly-randconfig-004-20250909    gcc-14
x86_64      buildonly-randconfig-005-20250908    gcc-14
x86_64      buildonly-randconfig-005-20250909    gcc-14
x86_64      buildonly-randconfig-006-20250908    clang-20
x86_64      buildonly-randconfig-006-20250909    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250909    gcc-14
x86_64                randconfig-002-20250909    gcc-14
x86_64                randconfig-003-20250909    gcc-14
x86_64                randconfig-004-20250909    gcc-14
x86_64                randconfig-005-20250909    gcc-14
x86_64                randconfig-006-20250909    gcc-14
x86_64                randconfig-007-20250909    gcc-14
x86_64                randconfig-008-20250909    gcc-14
x86_64                randconfig-071-20250909    gcc-14
x86_64                randconfig-072-20250909    gcc-14
x86_64                randconfig-073-20250909    gcc-14
x86_64                randconfig-074-20250909    gcc-14
x86_64                randconfig-075-20250909    gcc-14
x86_64                randconfig-076-20250909    gcc-14
x86_64                randconfig-077-20250909    gcc-14
x86_64                randconfig-078-20250909    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250908    gcc-9.5.0
xtensa                randconfig-001-20250909    gcc-15.1.0
xtensa                randconfig-002-20250908    gcc-11.5.0
xtensa                randconfig-002-20250909    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
