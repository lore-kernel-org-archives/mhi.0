Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14991B4244
	for <mhi@lists.linux.dev>; Wed, 18 Jun 2025 02:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750215472; cv=none; b=ThqVaPihJnCmqkLIRTwe0qT9Fp1RRhkkoXQ4Klo4yqAS3IryXfQ3Bka+DbsImn7dzYHhgzn7hrmFULZot8Tll+tJ2ZWAiPNUgmCVDk5Bc/Mb3/vxStR26x8SDcKPOBR9w9uEtphY7+0zEsIljiHd3uk14iSWr/KAb/oXzNe0cdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750215472; c=relaxed/simple;
	bh=Z259zK/VC/SKGQbVl2mHvNmH30sC+mFjk04hLnQByGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WjO6xjLP5vUymJOXnAe9eqJfn0qhtN0xgX7d0wOKxdxU9YDobpba69fnYPQSKrb0k9KecaPLLBRy0A9WPgNvyn0TjTX9YVFfQLfVMFBNp4FXJW5rmFmaXpOJodKAZLQdDQDfpabX5o3+eZaufx5zj7w1gWpRaX4a88C8EB0dfs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDTvDaYU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDTvDaYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750215471; x=1781751471;
  h=date:from:to:cc:subject:message-id;
  bh=Z259zK/VC/SKGQbVl2mHvNmH30sC+mFjk04hLnQByGE=;
  b=hDTvDaYUROLfRjEnwTC3Kb6d7uxC2EKUs717XHgOkB47yKxX3XZ5PONJ
   aZ4WsJSJ54IXUQ249N848j/d+92M+2ZLE3+pu66mx4Et1f4gL5x6dA6vm
   BRFBVSWbzCVP1teS6AS/5Vc97/+hlfgQ9dxUc9y2nYHAZPcCx9f7stKeE
   +SId6JOKuCAeg13DaG8iOkgcpAeGy5SwO47uqFdzXa6dHPIwnTE4hssUV
   HcnQ6TT9RfeHPG3hFZe+gyvmuKgUWuSnCgoX4sPGAZsTf3wK3RXJ4Cmse
   4gV5SYuhw8mrMh8hWr5uCleDC0GKxQrIAivJUkcV61FK7/hqVgvBDV4vg
   Q==;
X-CSE-ConnectionGUID: c2kinb/8Tc6HoKZZe6QEVQ==
X-CSE-MsgGUID: PVlhKyqbS82ZrNGbmL178g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="55034558"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="55034558"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 19:57:48 -0700
X-CSE-ConnectionGUID: FB7gO7P4SeCp4DyKy8xASQ==
X-CSE-MsgGUID: eTaldWwPREOqGrvlc8V9bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="150009194"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2025 19:57:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRizh-000JKm-0P;
	Wed, 18 Jun 2025 02:57:45 +0000
Date: Wed, 18 Jun 2025 10:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 3010503f3e064d6145095cc6612456e4950ae618
Message-ID: <202506181047.OMrGQiXF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 3010503f3e064d6145095cc6612456e4950ae618  bus: mhi: host: Fix endianness of BHI vector table

elapsed time: 974m

configs tested: 250
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-21
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-001-20250618    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-15.1.0
arc                   randconfig-002-20250618    gcc-11.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                            hisi_defconfig    gcc-15.1.0
arm                           imxrt_defconfig    clang-21
arm                        keystone_defconfig    clang-21
arm                          pxa3xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250617    gcc-8.5.0
arm                   randconfig-001-20250618    gcc-11.5.0
arm                   randconfig-002-20250617    clang-21
arm                   randconfig-002-20250618    gcc-11.5.0
arm                   randconfig-003-20250617    clang-21
arm                   randconfig-003-20250618    gcc-11.5.0
arm                   randconfig-004-20250617    clang-21
arm                   randconfig-004-20250618    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-001-20250618    gcc-11.5.0
arm64                 randconfig-002-20250617    clang-21
arm64                 randconfig-002-20250618    gcc-11.5.0
arm64                 randconfig-003-20250617    gcc-8.5.0
arm64                 randconfig-003-20250618    gcc-11.5.0
arm64                 randconfig-004-20250617    gcc-12.3.0
arm64                 randconfig-004-20250618    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250617    gcc-13.3.0
csky                  randconfig-001-20250618    gcc-8.5.0
csky                  randconfig-002-20250617    gcc-12.4.0
csky                  randconfig-002-20250618    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-001-20250618    gcc-8.5.0
hexagon               randconfig-002-20250617    clang-21
hexagon               randconfig-002-20250618    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250617    gcc-12
i386        buildonly-randconfig-001-20250618    clang-20
i386        buildonly-randconfig-002-20250617    clang-20
i386        buildonly-randconfig-002-20250618    clang-20
i386        buildonly-randconfig-003-20250617    gcc-12
i386        buildonly-randconfig-003-20250618    clang-20
i386        buildonly-randconfig-004-20250617    gcc-12
i386        buildonly-randconfig-004-20250618    clang-20
i386        buildonly-randconfig-005-20250617    gcc-12
i386        buildonly-randconfig-005-20250618    clang-20
i386        buildonly-randconfig-006-20250617    gcc-12
i386        buildonly-randconfig-006-20250618    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250618    gcc-12
i386                  randconfig-002-20250618    gcc-12
i386                  randconfig-003-20250618    gcc-12
i386                  randconfig-004-20250618    gcc-12
i386                  randconfig-005-20250618    gcc-12
i386                  randconfig-006-20250618    gcc-12
i386                  randconfig-007-20250618    gcc-12
i386                  randconfig-011-20250618    gcc-12
i386                  randconfig-012-20250618    gcc-12
i386                  randconfig-013-20250618    gcc-12
i386                  randconfig-014-20250618    gcc-12
i386                  randconfig-015-20250618    gcc-12
i386                  randconfig-016-20250618    gcc-12
i386                  randconfig-017-20250618    gcc-12
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250617    gcc-15.1.0
loongarch             randconfig-001-20250618    gcc-8.5.0
loongarch             randconfig-002-20250617    gcc-15.1.0
loongarch             randconfig-002-20250618    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    gcc-15.1.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250617    gcc-10.5.0
nios2                 randconfig-001-20250618    gcc-8.5.0
nios2                 randconfig-002-20250617    gcc-14.2.0
nios2                 randconfig-002-20250618    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250617    gcc-8.5.0
parisc                randconfig-001-20250618    gcc-8.5.0
parisc                randconfig-002-20250617    gcc-8.5.0
parisc                randconfig-002-20250618    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   currituck_defconfig    clang-21
powerpc                    gamecube_defconfig    clang-21
powerpc               randconfig-001-20250617    gcc-8.5.0
powerpc               randconfig-001-20250618    gcc-8.5.0
powerpc               randconfig-002-20250617    clang-16
powerpc               randconfig-002-20250618    gcc-8.5.0
powerpc               randconfig-003-20250617    gcc-12.4.0
powerpc               randconfig-003-20250618    gcc-8.5.0
powerpc64             randconfig-001-20250617    gcc-14.3.0
powerpc64             randconfig-001-20250618    gcc-8.5.0
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-002-20250618    gcc-8.5.0
powerpc64             randconfig-003-20250617    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250617    clang-21
riscv                 randconfig-001-20250618    gcc-15.1.0
riscv                 randconfig-002-20250617    gcc-10.5.0
riscv                 randconfig-002-20250618    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250617    clang-21
s390                  randconfig-001-20250618    gcc-15.1.0
s390                  randconfig-002-20250617    clang-20
s390                  randconfig-002-20250618    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-21
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-001-20250618    gcc-15.1.0
sh                    randconfig-002-20250617    gcc-14.3.0
sh                    randconfig-002-20250618    gcc-15.1.0
sh                           se7705_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-001-20250618    gcc-15.1.0
sparc                 randconfig-002-20250617    gcc-13.3.0
sparc                 randconfig-002-20250618    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250617    gcc-15.1.0
sparc64               randconfig-001-20250618    gcc-15.1.0
sparc64               randconfig-002-20250617    gcc-9.3.0
sparc64               randconfig-002-20250618    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250617    gcc-12
um                    randconfig-001-20250618    gcc-15.1.0
um                    randconfig-002-20250617    clang-21
um                    randconfig-002-20250618    gcc-15.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250617    clang-20
x86_64      buildonly-randconfig-001-20250618    gcc-12
x86_64      buildonly-randconfig-002-20250617    clang-20
x86_64      buildonly-randconfig-002-20250618    gcc-12
x86_64      buildonly-randconfig-003-20250617    gcc-11
x86_64      buildonly-randconfig-003-20250618    gcc-12
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-004-20250618    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250618    gcc-12
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250618    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250618    gcc-12
x86_64                randconfig-002-20250618    gcc-12
x86_64                randconfig-003-20250618    gcc-12
x86_64                randconfig-004-20250618    gcc-12
x86_64                randconfig-005-20250618    gcc-12
x86_64                randconfig-006-20250618    gcc-12
x86_64                randconfig-007-20250618    gcc-12
x86_64                randconfig-008-20250618    gcc-12
x86_64                randconfig-071-20250618    clang-20
x86_64                randconfig-072-20250618    clang-20
x86_64                randconfig-073-20250618    clang-20
x86_64                randconfig-074-20250618    clang-20
x86_64                randconfig-075-20250618    clang-20
x86_64                randconfig-076-20250618    clang-20
x86_64                randconfig-077-20250618    clang-20
x86_64                randconfig-078-20250618    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250617    gcc-10.5.0
xtensa                randconfig-001-20250618    gcc-15.1.0
xtensa                randconfig-002-20250617    gcc-12.4.0
xtensa                randconfig-002-20250618    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
