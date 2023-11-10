Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2F3B285
	for <mhi@lists.linux.dev>; Fri, 10 Nov 2023 20:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcCz6SLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699649606; x=1731185606;
  h=date:from:to:cc:subject:message-id;
  bh=cNxbUXMz1HkOgjQZobLuf7AERSI5WWY3L9nf+Gd0eCA=;
  b=VcCz6SLqMjNyGlKJzt5i7ece7rq4YuYUfEvp0j8N4TrHH6YoxYcvMElK
   N5M/33XbVPTB5N2QnE7dFsT4AXh6kjDNfeueO6Fz+cjz3w9VZ8kpuSVuJ
   8gEj6KQ+CrmG9TXSw/DOwHb9AIfNpY2EGExwrus5Bvfk0xx/xqUm9ehbz
   5dscRngKbRE5AVumT7kVJv/bw6IqAaRn/WR1kldF2H4xmG5tTbgNJDp+t
   DFN7DHagK1VVHAy70ZQcashSaYEEZo8RgBi7r2jHG7v1Elutcr+BsMICy
   Nhhzxic0UxpG+wkraRlQSENhRUkg2VQEAdqtjoszK3vxiBNbDqsQWsj6q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="387395202"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="387395202"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 12:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767413338"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="767413338"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Nov 2023 12:53:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1YVG-0009t7-1e;
	Fri, 10 Nov 2023 20:53:22 +0000
Date: Sat, 11 Nov 2023 04:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 83c5dcf78ab992181c7d8bd5e94a0fdbde4c0efe
Message-ID: <202311110454.7SrcnokZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 83c5dcf78ab992181c7d8bd5e94a0fdbde4c0efe  bus: mhi: host: Add alignment check for event ring read pointer

elapsed time: 1458m

configs tested: 197
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231110   gcc  
arc                   randconfig-002-20231110   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                   randconfig-001-20231110   gcc  
arm                   randconfig-002-20231110   gcc  
arm                   randconfig-003-20231110   gcc  
arm                   randconfig-004-20231110   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231110   gcc  
arm64                 randconfig-002-20231110   gcc  
arm64                 randconfig-003-20231110   gcc  
arm64                 randconfig-004-20231110   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231110   gcc  
csky                  randconfig-002-20231110   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231110   gcc  
i386         buildonly-randconfig-002-20231110   gcc  
i386         buildonly-randconfig-003-20231110   gcc  
i386         buildonly-randconfig-004-20231110   gcc  
i386         buildonly-randconfig-005-20231110   gcc  
i386         buildonly-randconfig-006-20231110   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231110   gcc  
i386                  randconfig-001-20231111   gcc  
i386                  randconfig-002-20231110   gcc  
i386                  randconfig-002-20231111   gcc  
i386                  randconfig-003-20231110   gcc  
i386                  randconfig-003-20231111   gcc  
i386                  randconfig-004-20231110   gcc  
i386                  randconfig-004-20231111   gcc  
i386                  randconfig-005-20231110   gcc  
i386                  randconfig-005-20231111   gcc  
i386                  randconfig-006-20231110   gcc  
i386                  randconfig-006-20231111   gcc  
i386                  randconfig-011-20231110   gcc  
i386                  randconfig-012-20231110   gcc  
i386                  randconfig-013-20231110   gcc  
i386                  randconfig-014-20231110   gcc  
i386                  randconfig-015-20231110   gcc  
i386                  randconfig-016-20231110   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231110   gcc  
loongarch             randconfig-002-20231110   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                           gcw0_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                        qi_lb60_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231110   gcc  
nios2                 randconfig-002-20231110   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231110   gcc  
parisc                randconfig-002-20231110   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc               randconfig-001-20231110   gcc  
powerpc               randconfig-002-20231110   gcc  
powerpc               randconfig-003-20231110   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc64             randconfig-001-20231110   gcc  
powerpc64             randconfig-002-20231110   gcc  
powerpc64             randconfig-003-20231110   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231110   gcc  
riscv                 randconfig-002-20231110   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231110   gcc  
s390                  randconfig-002-20231110   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231110   gcc  
sh                    randconfig-002-20231110   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231110   gcc  
sparc                 randconfig-002-20231110   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231110   gcc  
sparc64               randconfig-002-20231110   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231110   gcc  
um                    randconfig-002-20231110   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231110   gcc  
x86_64       buildonly-randconfig-002-20231110   gcc  
x86_64       buildonly-randconfig-003-20231110   gcc  
x86_64       buildonly-randconfig-004-20231110   gcc  
x86_64       buildonly-randconfig-005-20231110   gcc  
x86_64       buildonly-randconfig-006-20231110   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231110   gcc  
x86_64                randconfig-002-20231110   gcc  
x86_64                randconfig-003-20231110   gcc  
x86_64                randconfig-004-20231110   gcc  
x86_64                randconfig-005-20231110   gcc  
x86_64                randconfig-006-20231110   gcc  
x86_64                randconfig-011-20231110   gcc  
x86_64                randconfig-012-20231110   gcc  
x86_64                randconfig-013-20231110   gcc  
x86_64                randconfig-014-20231110   gcc  
x86_64                randconfig-015-20231110   gcc  
x86_64                randconfig-016-20231110   gcc  
x86_64                randconfig-071-20231110   gcc  
x86_64                randconfig-072-20231110   gcc  
x86_64                randconfig-073-20231110   gcc  
x86_64                randconfig-074-20231110   gcc  
x86_64                randconfig-075-20231110   gcc  
x86_64                randconfig-076-20231110   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa                randconfig-001-20231110   gcc  
xtensa                randconfig-002-20231110   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
