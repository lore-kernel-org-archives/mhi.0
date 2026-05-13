Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5FF37BE6B
	for <mhi@lists.linux.dev>; Wed, 13 May 2026 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648508; cv=none; b=fMBCGGjjX0zr7lIgZLuO/D8SeKHUOT1gwn9epG+FtdzZjj78jdbsX7eIVO+6SaWeTnR9mENXn4748yourEYBl2nlwbIBK7k2Lbjh00QarYS8KS3r67dLskPOCAm7RxOSJIXS9/IerfFT+zI+s+Oi2UUOuxplKJo99dTp+cJMCS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648508; c=relaxed/simple;
	bh=2jk1KHIFHdefdcjWEOwCyvBs9+2efwRXH1FHvFnpBps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c0+5P1G7lmBRHypsfxlk0s53FQ5a+RJ27XxL1mg+XNLQUu/BNOIrgYDK8TXSDzeVPHMTKRtOyhozqSMmcEGI8s3+vWBkbEJTHaxmWXG2FHg3WvAQY/Xj34FcnPksP87WGexhJACDpWCYc5bnYUYSiz/ajJDSFLzEykInCQQIXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFAsTpKO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFAsTpKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778648506; x=1810184506;
  h=date:from:to:cc:subject:message-id;
  bh=2jk1KHIFHdefdcjWEOwCyvBs9+2efwRXH1FHvFnpBps=;
  b=lFAsTpKOhqh5z47tzDq1nmeFWaWWV8/b0D7cs0bCQ2Q6TVuBOK6UiW5t
   NWdxn7qAI9SsejFKBX5kkZpYvdPCyyiSsdX7qzonz43/Np4ODrx3OCnjg
   VVdNpmO6U7jMfnXtt4t1xhiA7HbsIJ3tgc3o31FQn31ZIK9kxMFLxzxzs
   gGL+MgAipVuqWntX70E4kskFUcn9xedzg9Sw5RzSYSeKgrSFBuiwOZD0d
   5nCb7dxyiXqt+hUWBrOt3bZ96hy4jVACbHx3l7u3pMJGsUuGBg9kc/O1z
   oLUpI8M1BSzymwDG4jKn3JgDVJDYQWFuHPixm336jtgBL+2kD57U5opfe
   A==;
X-CSE-ConnectionGUID: b2DTkcWGS++W4f+wYdS79Q==
X-CSE-MsgGUID: IAzbglC0RpiV305eAEXbnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90950158"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="90950158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:01:46 -0700
X-CSE-ConnectionGUID: 5mEpt+5tQfOeoWSPICATlw==
X-CSE-MsgGUID: PJqVcJzFSTq2eHYFE2+skA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="241992947"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 May 2026 22:01:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN1j4-000000003Sj-1Nn2;
	Wed, 13 May 2026 05:01:42 +0000
Date: Wed, 13 May 2026 13:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 519ddf194b158b91439319f6b977b8a465fda0fb
Message-ID: <202605131358.snNyIFx9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 519ddf194b158b91439319f6b977b8a465fda0fb  bus: mhi: ep: Protect mhi_ep_handle_syserr() in the error path

elapsed time: 861m

configs tested: 229
configs skipped: 12

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
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260513    gcc-14.3.0
arc                   randconfig-001-20260513    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260513    gcc-14.3.0
arc                   randconfig-002-20260513    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          gemini_defconfig    clang-20
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260513    gcc-14.3.0
arm                   randconfig-001-20260513    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260513    gcc-14.3.0
arm                   randconfig-002-20260513    gcc-8.5.0
arm                            randconfig-003    gcc-8.5.0
arm                   randconfig-003-20260513    gcc-14.3.0
arm                   randconfig-003-20260513    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260513    gcc-14.3.0
arm                   randconfig-004-20260513    gcc-8.5.0
arm                           sama7_defconfig    clang-23
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260513    clang-23
arm64                 randconfig-001-20260513    gcc-12.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260513    clang-23
arm64                 randconfig-002-20260513    gcc-12.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260513    clang-23
arm64                 randconfig-003-20260513    gcc-12.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260513    clang-23
arm64                 randconfig-004-20260513    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260513    clang-23
csky                  randconfig-001-20260513    gcc-12.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260513    clang-23
csky                  randconfig-002-20260513    gcc-12.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260513    gcc-8.5.0
hexagon               randconfig-002-20260513    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260513    clang-20
i386        buildonly-randconfig-002-20260513    clang-20
i386        buildonly-randconfig-003-20260513    clang-20
i386        buildonly-randconfig-004-20260513    clang-20
i386        buildonly-randconfig-005-20260513    clang-20
i386        buildonly-randconfig-006-20260513    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260513    clang-20
i386                  randconfig-002-20260513    clang-20
i386                  randconfig-003-20260513    clang-20
i386                  randconfig-004-20260513    clang-20
i386                  randconfig-005-20260513    clang-20
i386                  randconfig-006-20260513    clang-20
i386                  randconfig-007-20260513    clang-20
i386                  randconfig-011-20260513    clang-20
i386                  randconfig-012-20260513    clang-20
i386                  randconfig-012-20260513    gcc-14
i386                  randconfig-013-20260513    clang-20
i386                  randconfig-014-20260513    clang-20
i386                  randconfig-015-20260513    clang-20
i386                  randconfig-016-20260513    clang-20
i386                  randconfig-017-20260513    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260513    gcc-8.5.0
loongarch             randconfig-002-20260513    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                    maltaup_xpa_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260513    gcc-8.5.0
nios2                 randconfig-002-20260513    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260513    gcc-8.5.0
parisc                randconfig-002-20260513    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                     rainier_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260513    gcc-8.5.0
powerpc               randconfig-002-20260513    gcc-8.5.0
powerpc64             randconfig-001-20260513    gcc-8.5.0
powerpc64             randconfig-002-20260513    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260513    gcc-15.2.0
riscv                 randconfig-002-20260513    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260513    gcc-15.2.0
s390                  randconfig-002-20260513    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260513    gcc-15.2.0
sh                    randconfig-002-20260513    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                          randconfig-001    gcc-11.5.0
sparc                 randconfig-001-20260513    gcc-11.5.0
sparc                          randconfig-002    gcc-11.5.0
sparc                 randconfig-002-20260513    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-11.5.0
sparc64               randconfig-001-20260513    gcc-11.5.0
sparc64                        randconfig-002    gcc-11.5.0
sparc64               randconfig-002-20260513    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-11.5.0
um                    randconfig-001-20260513    gcc-11.5.0
um                             randconfig-002    gcc-11.5.0
um                    randconfig-002-20260513    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260513    gcc-12
x86_64      buildonly-randconfig-002-20260513    gcc-12
x86_64      buildonly-randconfig-003-20260513    gcc-12
x86_64      buildonly-randconfig-004-20260513    gcc-12
x86_64      buildonly-randconfig-005-20260513    gcc-12
x86_64      buildonly-randconfig-006-20260513    gcc-12
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260513    clang-20
x86_64                randconfig-002-20260513    clang-20
x86_64                randconfig-003-20260513    clang-20
x86_64                randconfig-004-20260513    clang-20
x86_64                randconfig-005-20260513    clang-20
x86_64                randconfig-006-20260513    clang-20
x86_64                randconfig-011-20260513    gcc-14
x86_64                randconfig-012-20260513    gcc-14
x86_64                randconfig-013-20260513    gcc-14
x86_64                randconfig-014-20260513    gcc-14
x86_64                randconfig-015-20260513    gcc-14
x86_64                randconfig-016-20260513    gcc-14
x86_64                randconfig-071-20260513    gcc-14
x86_64                randconfig-072-20260513    gcc-14
x86_64                randconfig-073-20260513    gcc-14
x86_64                randconfig-074-20260513    gcc-14
x86_64                randconfig-075-20260513    gcc-14
x86_64                randconfig-076-20260513    gcc-14
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
xtensa                         randconfig-001    gcc-11.5.0
xtensa                randconfig-001-20260513    gcc-11.5.0
xtensa                         randconfig-002    gcc-11.5.0
xtensa                randconfig-002-20260513    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
