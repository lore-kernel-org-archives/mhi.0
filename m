Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214194291E
	for <mhi@lists.linux.dev>; Wed, 18 Oct 2023 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0tZzQQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697663368; x=1729199368;
  h=date:from:to:cc:subject:message-id;
  bh=qPZ3TTD+XglHzzQmcrIGtjVBzAG578zBLKK07VyrFpY=;
  b=b0tZzQQED+sY8HQAzbVZ8XjWU+AeKOUCthXt3sClq5sEM+uGQNc9xTS/
   kLX7KftePe/haS+rqf/bJNnGRNJJ6VPkcILV2/geL7aBjPbuvDW9Zr134
   0B9ziCc+8hXSXeqM6dLQSZ/JIV3sCyMgUXjWLsbPMWgGxu0tDeaeO3M5c
   QJlHfWfMO/WF4Kv70+Bse9y0eC6fi+kDiBtBFOT55CP7AMI5BQiwAVsMM
   +Byu2wo9IEZ+uKNKsFLPoIbd/p2LJsHJmPgeppisoc7XAnGK0OBicpBGb
   wvE3go7JCfp+qUymgFEA2r7YUYhPlG2/hv1c2f8GbVPypbfHsgIaOAutk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4702573"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4702573"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 14:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1003952921"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="1003952921"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 14:09:25 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtDn8-00013R-2x;
	Wed, 18 Oct 2023 21:09:22 +0000
Date: Thu, 19 Oct 2023 05:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 b910ee376ab3acf0e916a5fe77f2c93ad710c2f4
Message-ID: <202310190543.v2yN1kfW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: b910ee376ab3acf0e916a5fe77f2c93ad710c2f4  bus: mhi: ep: Do not allocate event ring element on stack

elapsed time: 2251m

configs tested: 151
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
arc                   randconfig-001-20231017   gcc  
arc                   randconfig-001-20231018   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231018   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                             defconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231018   gcc  
i386                  randconfig-002-20231018   gcc  
i386                  randconfig-003-20231018   gcc  
i386                  randconfig-004-20231018   gcc  
i386                  randconfig-005-20231018   gcc  
i386                  randconfig-006-20231018   gcc  
i386                  randconfig-011-20231018   gcc  
i386                  randconfig-012-20231018   gcc  
i386                  randconfig-013-20231018   gcc  
i386                  randconfig-014-20231018   gcc  
i386                  randconfig-015-20231018   gcc  
i386                  randconfig-016-20231018   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231017   gcc  
loongarch             randconfig-001-20231018   gcc  
loongarch             randconfig-001-20231019   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   microwatt_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231017   gcc  
riscv                 randconfig-001-20231018   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231017   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231017   gcc  
sparc                 randconfig-001-20231018   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231018   gcc  
x86_64       buildonly-randconfig-001-20231019   gcc  
x86_64       buildonly-randconfig-002-20231018   gcc  
x86_64       buildonly-randconfig-002-20231019   gcc  
x86_64       buildonly-randconfig-003-20231018   gcc  
x86_64       buildonly-randconfig-003-20231019   gcc  
x86_64       buildonly-randconfig-004-20231018   gcc  
x86_64       buildonly-randconfig-004-20231019   gcc  
x86_64       buildonly-randconfig-005-20231018   gcc  
x86_64       buildonly-randconfig-005-20231019   gcc  
x86_64       buildonly-randconfig-006-20231018   gcc  
x86_64       buildonly-randconfig-006-20231019   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231017   gcc  
x86_64                randconfig-001-20231018   gcc  
x86_64                randconfig-002-20231017   gcc  
x86_64                randconfig-002-20231018   gcc  
x86_64                randconfig-003-20231017   gcc  
x86_64                randconfig-003-20231018   gcc  
x86_64                randconfig-004-20231017   gcc  
x86_64                randconfig-004-20231018   gcc  
x86_64                randconfig-005-20231017   gcc  
x86_64                randconfig-005-20231018   gcc  
x86_64                randconfig-006-20231017   gcc  
x86_64                randconfig-006-20231018   gcc  
x86_64                randconfig-011-20231018   gcc  
x86_64                randconfig-012-20231018   gcc  
x86_64                randconfig-013-20231018   gcc  
x86_64                randconfig-014-20231018   gcc  
x86_64                randconfig-015-20231018   gcc  
x86_64                randconfig-016-20231018   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
