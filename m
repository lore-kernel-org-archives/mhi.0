Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93861315D35
	for <mhi@lists.linux.dev>; Sat,  6 Sep 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757171518; cv=none; b=uYPFOxozGwWn49g1jWQnMG3zxpCFkfqrAYzhlbm1cITD6A0ND9S7RZh3/xQamfDVVZyMqOcrgR7q/y7WVCgzZllu4zWjJ8n9XXfKzNX3LiEUPyIX+5nOgBwFQhAh7yKwc+cIaFCz/3iHccY/J3BVoDIa6HFExTb/tQgSd8NmHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757171518; c=relaxed/simple;
	bh=OE1PVmp/YrRGjbcI5W0MX6C5PbMr7z48KEBu6s0d7Q4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AnTk20hLHhze3Rc6yijBD0/56hKpH6vWtE9vR1AEubhJ2J+4qTDgNjCvc7d4rFdv19Kw9QNVfzg5rR87i5AHP7my6R3crIqYjy9ZsWyRZ+pbwIo0OzWvPR66ILczcXyGGMd7LA7r8Rc7k4JZfewgnfcMwt3ZcpmVoSbX9pTVioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxGsun+H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxGsun+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757171515; x=1788707515;
  h=date:from:to:cc:subject:message-id;
  bh=OE1PVmp/YrRGjbcI5W0MX6C5PbMr7z48KEBu6s0d7Q4=;
  b=JxGsun+HL2V+tX1LO8tx1nDfXwIAmP7uZaUqFwNFo3VsGBzh2I5B81gr
   /jkmZEsmC7sY5tv9MahPi56hD04+9AzwFnqrhLAab+tC6WE9WFuxbbQQc
   aC84c+U0IaNg5OkHxAxoJH6t9xMUtnNFOIzQFxSron+/6FEirzpTWEAgB
   5TQ3vhVk4gXda4az1FOUtsX8W1YJlnsPH9T+GcSRIHpUmm42yYRowv1BF
   XCdL6NkQ9SYTf4pj5aCLhxLR/BbirGwPNUNVVlu8GShIi68oY12QpT6MH
   o6mzLdBJ2Aq9Ko5TFwKHBeUfhU85HJQ1idCTHaX0uQg/eYu8iVRtwhEwb
   g==;
X-CSE-ConnectionGUID: Bw3/M7HiSUWjlLIIsTG4GA==
X-CSE-MsgGUID: xIix4sTPRWKR0JRCZONN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63322872"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63322872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 08:11:54 -0700
X-CSE-ConnectionGUID: FB1FdbROQJeXWHpWA+93pg==
X-CSE-MsgGUID: fDp7yanqTtGwmYpJS31jNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="171583751"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2025 08:11:53 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuuZz-0001Z1-11;
	Sat, 06 Sep 2025 15:11:51 +0000
Date: Sat, 06 Sep 2025 23:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 376358bb9770e5313d22d8784511497096cdb75f
Message-ID: <202509062337.yVfQUydl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 376358bb9770e5313d22d8784511497096cdb75f  bus: mhi: host: pci_generic: Add support for all Foxconn T99W696 SKU variants

elapsed time: 1453m

configs tested: 215
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    clang-22
arc                   randconfig-001-20250905    gcc-11.5.0
arc                   randconfig-001-20250906    gcc-8.5.0
arc                   randconfig-002-20250905    gcc-13.4.0
arc                   randconfig-002-20250906    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                   randconfig-001-20250905    clang-22
arm                   randconfig-001-20250906    gcc-8.5.0
arm                   randconfig-002-20250905    clang-22
arm                   randconfig-002-20250906    gcc-8.5.0
arm                   randconfig-003-20250905    clang-16
arm                   randconfig-003-20250906    gcc-8.5.0
arm                   randconfig-004-20250905    gcc-14.3.0
arm                   randconfig-004-20250906    gcc-8.5.0
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                 randconfig-001-20250905    clang-22
arm64                 randconfig-001-20250906    gcc-8.5.0
arm64                 randconfig-002-20250905    clang-17
arm64                 randconfig-002-20250906    gcc-8.5.0
arm64                 randconfig-003-20250905    clang-17
arm64                 randconfig-003-20250906    gcc-8.5.0
arm64                 randconfig-004-20250905    clang-22
arm64                 randconfig-004-20250906    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                  randconfig-001-20250906    gcc-11.5.0
csky                  randconfig-001-20250906    gcc-15.1.0
csky                  randconfig-002-20250906    gcc-11.5.0
csky                  randconfig-002-20250906    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250906    clang-20
hexagon               randconfig-001-20250906    gcc-11.5.0
hexagon               randconfig-002-20250906    clang-22
hexagon               randconfig-002-20250906    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250906    clang-20
i386        buildonly-randconfig-002-20250906    clang-20
i386        buildonly-randconfig-002-20250906    gcc-11
i386        buildonly-randconfig-003-20250906    clang-20
i386        buildonly-randconfig-003-20250906    gcc-13
i386        buildonly-randconfig-004-20250906    clang-20
i386        buildonly-randconfig-004-20250906    gcc-13
i386        buildonly-randconfig-005-20250906    clang-20
i386        buildonly-randconfig-006-20250906    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250906    gcc-13
i386                  randconfig-002-20250906    gcc-13
i386                  randconfig-003-20250906    gcc-13
i386                  randconfig-004-20250906    gcc-13
i386                  randconfig-005-20250906    gcc-13
i386                  randconfig-006-20250906    gcc-13
i386                  randconfig-007-20250906    gcc-13
i386                  randconfig-011-20250906    clang-20
i386                  randconfig-012-20250906    clang-20
i386                  randconfig-013-20250906    clang-20
i386                  randconfig-014-20250906    clang-20
i386                  randconfig-015-20250906    clang-20
i386                  randconfig-016-20250906    clang-20
i386                  randconfig-017-20250906    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250906    clang-22
loongarch             randconfig-001-20250906    gcc-11.5.0
loongarch             randconfig-002-20250906    gcc-11.5.0
loongarch             randconfig-002-20250906    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250906    gcc-11.5.0
nios2                 randconfig-002-20250906    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-13
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250906    gcc-11.5.0
parisc                randconfig-002-20250906    gcc-11.5.0
parisc                randconfig-002-20250906    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    clang-22
powerpc               randconfig-001-20250906    gcc-11.5.0
powerpc               randconfig-001-20250906    gcc-14.3.0
powerpc               randconfig-002-20250906    clang-20
powerpc               randconfig-002-20250906    gcc-11.5.0
powerpc               randconfig-003-20250906    clang-22
powerpc               randconfig-003-20250906    gcc-11.5.0
powerpc                     tqm5200_defconfig    clang-22
powerpc                     tqm8541_defconfig    clang-22
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20250906    gcc-11.5.0
powerpc64             randconfig-001-20250906    gcc-13.4.0
powerpc64             randconfig-002-20250906    gcc-10.5.0
powerpc64             randconfig-002-20250906    gcc-11.5.0
powerpc64             randconfig-003-20250906    clang-22
powerpc64             randconfig-003-20250906    gcc-11.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-13
riscv                 randconfig-001-20250906    gcc-13.4.0
riscv                 randconfig-001-20250906    gcc-15.1.0
riscv                 randconfig-002-20250906    gcc-15.1.0
riscv                 randconfig-002-20250906    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-13
s390                  randconfig-001-20250906    gcc-10.5.0
s390                  randconfig-001-20250906    gcc-15.1.0
s390                  randconfig-002-20250906    clang-22
s390                  randconfig-002-20250906    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-13
sh                    randconfig-001-20250906    gcc-15.1.0
sh                    randconfig-002-20250906    gcc-12.5.0
sh                    randconfig-002-20250906    gcc-15.1.0
sh                          rsk7203_defconfig    clang-22
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250906    gcc-15.1.0
sparc                 randconfig-001-20250906    gcc-8.5.0
sparc                 randconfig-002-20250906    gcc-13.4.0
sparc                 randconfig-002-20250906    gcc-15.1.0
sparc64                             defconfig    gcc-13
sparc64               randconfig-001-20250906    clang-22
sparc64               randconfig-001-20250906    gcc-15.1.0
sparc64               randconfig-002-20250906    gcc-14.3.0
sparc64               randconfig-002-20250906    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-13
um                                  defconfig    gcc-13
um                             i386_defconfig    gcc-13
um                    randconfig-001-20250906    gcc-12
um                    randconfig-001-20250906    gcc-15.1.0
um                    randconfig-002-20250906    clang-22
um                    randconfig-002-20250906    gcc-15.1.0
um                           x86_64_defconfig    gcc-13
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250905    clang-20
x86_64      buildonly-randconfig-001-20250906    gcc-13
x86_64      buildonly-randconfig-002-20250905    clang-20
x86_64      buildonly-randconfig-002-20250906    gcc-13
x86_64      buildonly-randconfig-003-20250905    gcc-13
x86_64      buildonly-randconfig-003-20250906    gcc-13
x86_64      buildonly-randconfig-004-20250905    clang-20
x86_64      buildonly-randconfig-004-20250906    gcc-13
x86_64      buildonly-randconfig-005-20250905    clang-20
x86_64      buildonly-randconfig-005-20250906    gcc-13
x86_64      buildonly-randconfig-006-20250905    gcc-13
x86_64      buildonly-randconfig-006-20250906    gcc-13
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250906    gcc-13
x86_64                randconfig-002-20250906    gcc-13
x86_64                randconfig-003-20250906    gcc-13
x86_64                randconfig-004-20250906    gcc-13
x86_64                randconfig-005-20250906    gcc-13
x86_64                randconfig-006-20250906    gcc-13
x86_64                randconfig-007-20250906    gcc-13
x86_64                randconfig-008-20250906    gcc-13
x86_64                randconfig-071-20250906    clang-20
x86_64                randconfig-072-20250906    clang-20
x86_64                randconfig-073-20250906    clang-20
x86_64                randconfig-074-20250906    clang-20
x86_64                randconfig-075-20250906    clang-20
x86_64                randconfig-076-20250906    clang-20
x86_64                randconfig-077-20250906    clang-20
x86_64                randconfig-078-20250906    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250906    gcc-12.5.0
xtensa                randconfig-001-20250906    gcc-15.1.0
xtensa                randconfig-002-20250906    gcc-10.5.0
xtensa                randconfig-002-20250906    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
