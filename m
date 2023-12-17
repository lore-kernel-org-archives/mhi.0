Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629C321B6
	for <mhi@lists.linux.dev>; Sun, 17 Dec 2023 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5uEY3wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702814951; x=1734350951;
  h=date:from:to:cc:subject:message-id;
  bh=WEU2DI+JJG/N+W9qlt0tojSImrbBLeop1KXpnzpiopw=;
  b=P5uEY3wEoGeKJQO3QAQ1TXzMIkGvNXC/MpifirueX4mBDK0vWo6hoobA
   JdLOMnw41pK/fPT9r65U3ZRLkc+sA8ryLz8ZDep/7+LRMvVtHV82stZa9
   L74sfP0nYgg0KBlE4kBAXyFgXe7+DikST8vBvaEuHhVpH4qws8ENJRIxy
   scx6ojnc8pfd0ohNzXJLbjX4TEEpXTA3IchrLS6YcQr+ZDECVGZMXBKpJ
   OVtkdkvL40/ecWjwhNp70yfsBakqOFsG+7sop2N+kBiZXE2l/a4FzcDTe
   P2sntQFkB8ZcDY5fgy+Mm9qH5ofVqLnXoM378oEH3zWu0LpqsyQee91i0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2606432"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="2606432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 04:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="16848848"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2023 04:09:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEpxB-00030L-2d;
	Sun, 17 Dec 2023 12:09:05 +0000
Date: Sun, 17 Dec 2023 20:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 01bd694ac2f682fb8017e16148b928482bc8fa4b
Message-ID: <202312172039.sIzNWlYd-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 01bd694ac2f682fb8017e16148b928482bc8fa4b  bus: mhi: host: Drop chan lock before queuing buffers

elapsed time: 1817m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231217   gcc  
arc                   randconfig-002-20231217   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   clang
arm                       netwinder_defconfig   clang
arm                   randconfig-001-20231217   clang
arm                   randconfig-002-20231217   clang
arm                   randconfig-003-20231217   clang
arm                   randconfig-004-20231217   clang
arm                             rpc_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231217   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231216   gcc  
i386         buildonly-randconfig-002-20231216   gcc  
i386         buildonly-randconfig-003-20231216   gcc  
i386         buildonly-randconfig-004-20231216   gcc  
i386         buildonly-randconfig-005-20231216   gcc  
i386         buildonly-randconfig-006-20231216   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231216   gcc  
i386                  randconfig-002-20231216   gcc  
i386                  randconfig-003-20231216   gcc  
i386                  randconfig-004-20231216   gcc  
i386                  randconfig-005-20231216   gcc  
i386                  randconfig-006-20231216   gcc  
i386                  randconfig-011-20231216   clang
i386                  randconfig-012-20231216   clang
i386                  randconfig-013-20231216   clang
i386                  randconfig-014-20231216   clang
i386                  randconfig-015-20231216   clang
i386                  randconfig-016-20231216   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     kilauea_defconfig   clang
powerpc                     mpc512x_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                         wii_defconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231217   clang
x86_64       buildonly-randconfig-002-20231217   clang
x86_64       buildonly-randconfig-003-20231217   clang
x86_64       buildonly-randconfig-004-20231217   clang
x86_64       buildonly-randconfig-005-20231217   clang
x86_64       buildonly-randconfig-006-20231217   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
