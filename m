Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B045249
	for <mhi@lists.linux.dev>; Fri, 27 Oct 2023 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+aEvA+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698384369; x=1729920369;
  h=date:from:to:cc:subject:message-id;
  bh=bEJhoUfG5bSlpdYu0rw7g1Xxs9sORgC6dMvpsHgNJso=;
  b=K+aEvA+6q1YwKuEPjsLy8ayCv79esf/p2E9bAzyIAwLTwlsAO6PCUGl6
   DSWfq795USJPEY6SkhfJU8j7MM9JBgr4XksNVxDdp659cROldC5j7n5Ou
   /LK7Yu9wDLXAGA3nFExU/gZwR6EZJoZCEt43fU7ntNUAiF/M9cORriTsk
   yDkWloF09+B8gxqilJ8/X8sV/87Pm9aIVJqD29EGKuwfw5IGL7LfTwdGj
   gugDV/03dvENokFCKd2jCIpHBR2/szCTnE9sVNWJdJJw/uXHvZ6v0bXhN
   k56MTiSBgl9C2V6k1bjfcmAencPxAo1GOhfOTpWNOqpzGQ+Ei6rBCSh/B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418819865"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="418819865"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 22:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="876215545"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="876215545"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2023 22:26:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwFMD-000AVf-2n;
	Fri, 27 Oct 2023 05:26:05 +0000
Date: Fri, 27 Oct 2023 13:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 12606ba1d46b34a241eb3d0956727e5379f0f626
Message-ID: <202310271332.N0oCFw2m-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 12606ba1d46b34a241eb3d0956727e5379f0f626  bus: mhi: ep: Do not allocate event ring element on stack

elapsed time: 2719m

configs tested: 235
configs skipped: 2

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
arc                   randconfig-001-20231025   gcc  
arc                   randconfig-001-20231026   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231026   gcc  
arm                   randconfig-001-20231027   gcc  
arm                       spear13xx_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231025   gcc  
i386         buildonly-randconfig-001-20231026   gcc  
i386         buildonly-randconfig-001-20231027   gcc  
i386         buildonly-randconfig-002-20231025   gcc  
i386         buildonly-randconfig-002-20231026   gcc  
i386         buildonly-randconfig-002-20231027   gcc  
i386         buildonly-randconfig-003-20231025   gcc  
i386         buildonly-randconfig-003-20231026   gcc  
i386         buildonly-randconfig-003-20231027   gcc  
i386         buildonly-randconfig-004-20231025   gcc  
i386         buildonly-randconfig-004-20231026   gcc  
i386         buildonly-randconfig-004-20231027   gcc  
i386         buildonly-randconfig-005-20231025   gcc  
i386         buildonly-randconfig-005-20231026   gcc  
i386         buildonly-randconfig-005-20231027   gcc  
i386         buildonly-randconfig-006-20231025   gcc  
i386         buildonly-randconfig-006-20231026   gcc  
i386         buildonly-randconfig-006-20231027   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231025   gcc  
i386                  randconfig-001-20231026   gcc  
i386                  randconfig-001-20231027   gcc  
i386                  randconfig-002-20231025   gcc  
i386                  randconfig-002-20231026   gcc  
i386                  randconfig-002-20231027   gcc  
i386                  randconfig-003-20231025   gcc  
i386                  randconfig-003-20231026   gcc  
i386                  randconfig-003-20231027   gcc  
i386                  randconfig-004-20231025   gcc  
i386                  randconfig-004-20231026   gcc  
i386                  randconfig-004-20231027   gcc  
i386                  randconfig-005-20231025   gcc  
i386                  randconfig-005-20231026   gcc  
i386                  randconfig-005-20231027   gcc  
i386                  randconfig-006-20231025   gcc  
i386                  randconfig-006-20231026   gcc  
i386                  randconfig-006-20231027   gcc  
i386                  randconfig-011-20231025   gcc  
i386                  randconfig-011-20231026   gcc  
i386                  randconfig-011-20231027   gcc  
i386                  randconfig-012-20231025   gcc  
i386                  randconfig-012-20231026   gcc  
i386                  randconfig-012-20231027   gcc  
i386                  randconfig-013-20231025   gcc  
i386                  randconfig-013-20231026   gcc  
i386                  randconfig-013-20231027   gcc  
i386                  randconfig-014-20231025   gcc  
i386                  randconfig-014-20231026   gcc  
i386                  randconfig-014-20231027   gcc  
i386                  randconfig-015-20231025   gcc  
i386                  randconfig-015-20231026   gcc  
i386                  randconfig-015-20231027   gcc  
i386                  randconfig-016-20231025   gcc  
i386                  randconfig-016-20231026   gcc  
i386                  randconfig-016-20231027   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231025   gcc  
loongarch             randconfig-001-20231026   gcc  
loongarch             randconfig-001-20231027   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231025   gcc  
riscv                 randconfig-001-20231026   gcc  
riscv                 randconfig-001-20231027   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231025   gcc  
s390                  randconfig-001-20231026   gcc  
s390                  randconfig-001-20231027   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231025   gcc  
sparc                 randconfig-001-20231026   gcc  
sparc                 randconfig-001-20231027   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231025   gcc  
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-001-20231027   gcc  
x86_64       buildonly-randconfig-002-20231025   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-002-20231027   gcc  
x86_64       buildonly-randconfig-003-20231025   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-003-20231027   gcc  
x86_64       buildonly-randconfig-004-20231025   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-004-20231027   gcc  
x86_64       buildonly-randconfig-005-20231025   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-005-20231027   gcc  
x86_64       buildonly-randconfig-006-20231025   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64       buildonly-randconfig-006-20231027   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231025   gcc  
x86_64                randconfig-001-20231026   gcc  
x86_64                randconfig-001-20231027   gcc  
x86_64                randconfig-002-20231025   gcc  
x86_64                randconfig-002-20231026   gcc  
x86_64                randconfig-002-20231027   gcc  
x86_64                randconfig-003-20231025   gcc  
x86_64                randconfig-003-20231026   gcc  
x86_64                randconfig-003-20231027   gcc  
x86_64                randconfig-004-20231025   gcc  
x86_64                randconfig-004-20231026   gcc  
x86_64                randconfig-004-20231027   gcc  
x86_64                randconfig-005-20231025   gcc  
x86_64                randconfig-005-20231026   gcc  
x86_64                randconfig-005-20231027   gcc  
x86_64                randconfig-006-20231025   gcc  
x86_64                randconfig-006-20231026   gcc  
x86_64                randconfig-006-20231027   gcc  
x86_64                randconfig-011-20231026   gcc  
x86_64                randconfig-011-20231027   gcc  
x86_64                randconfig-012-20231026   gcc  
x86_64                randconfig-012-20231027   gcc  
x86_64                randconfig-013-20231026   gcc  
x86_64                randconfig-013-20231027   gcc  
x86_64                randconfig-014-20231026   gcc  
x86_64                randconfig-014-20231027   gcc  
x86_64                randconfig-015-20231026   gcc  
x86_64                randconfig-015-20231027   gcc  
x86_64                randconfig-016-20231026   gcc  
x86_64                randconfig-016-20231027   gcc  
x86_64                randconfig-071-20231026   gcc  
x86_64                randconfig-071-20231027   gcc  
x86_64                randconfig-072-20231026   gcc  
x86_64                randconfig-072-20231027   gcc  
x86_64                randconfig-073-20231026   gcc  
x86_64                randconfig-073-20231027   gcc  
x86_64                randconfig-074-20231026   gcc  
x86_64                randconfig-074-20231027   gcc  
x86_64                randconfig-075-20231026   gcc  
x86_64                randconfig-075-20231027   gcc  
x86_64                randconfig-076-20231026   gcc  
x86_64                randconfig-076-20231027   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
