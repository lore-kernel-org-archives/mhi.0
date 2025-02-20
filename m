Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD31FC7C1
	for <mhi@lists.linux.dev>; Thu, 20 Feb 2025 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065178; cv=none; b=IXSLKp+L2r7m+XanhPKqym2wDCbiN2RWUrdmlWLSa4msqyK985tfNQBipmd6AudiEe0yEty02c80qeyijx+Cz6SnvKulHTBp55rOrZ1J0pFYRGiUJxzaZTWaCBl+bKvYW6bCXRbQ0V32dxsM/bEkEwqGdh+eEUQWlYiRV+eQwSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065178; c=relaxed/simple;
	bh=HOlPMrMnAxhGBPuqzDG/7EeHv1MX6qjbSX4y25RhiVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ni+LH5FN6Q/UD7v0Ys8f7EW2LbrkkcM1W5r7AvoGYBOEOE20kpeOfNfdGGZ0ECq6Om4JudkWlUAfXwHYQGYosRTILtfXJiHofsN7PGqgIXPUedIabpPVJCXeP7YUwTPRL0BV7cGWbMKWS8gsm+5S3CDYYYbR+uLVtDrIUJnZIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBVbxKnD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBVbxKnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740065177; x=1771601177;
  h=date:from:to:cc:subject:message-id;
  bh=HOlPMrMnAxhGBPuqzDG/7EeHv1MX6qjbSX4y25RhiVY=;
  b=DBVbxKnDzvAo+1dNv7Pqd5bqTwwxiFQC8gnj/cCih4e5cOsbHfpzcp8+
   8GgeuHy5uLCvwgsBcDyjqCK+PNFJZObCtxk9wcYD/Uzh3IDIcxKCB9iVo
   w6EWXc055f8AnfL84tRz57mUTQQMlpRAeMzt2jW9g+eNPNhhUtovMHRdi
   Y1TtvkLDqcxxK7W/W1icglEZhz3nHNGbxzhsk3ECcvH0pbQXF/ECVS5l4
   BF1mFwK+0x9ueBVJT/P8tXBmje8EUZBoKRULqG7sfhZAvzkt1x94H3MES
   dldqIQD4/PId/gtMMY9ZFLqRXcp2kiBitxocCtI3bQ1I9Lk9TzJR3dHjd
   Q==;
X-CSE-ConnectionGUID: eKS+zzCURces0TrjJ1hnHA==
X-CSE-MsgGUID: UIgKXkSSRdWkdLzCgZZ+hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66209109"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="66209109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:26:15 -0800
X-CSE-ConnectionGUID: ZwlT7sG8SJmUSbtN2PwWRA==
X-CSE-MsgGUID: BtAQtmkNRimKftoS1SMSkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="120057362"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2025 07:26:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl8RD-0004RP-00;
	Thu, 20 Feb 2025 15:26:08 +0000
Date: Thu, 20 Feb 2025 23:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-fixes] BUILD SUCCESS
 a321d163de3d8aa38a6449ab2becf4b1581aed96
Message-ID: <202502202317.b0kSiNGX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-fixes
branch HEAD: a321d163de3d8aa38a6449ab2becf4b1581aed96  bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock

elapsed time: 1456m

configs tested: 81
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250220    gcc-13.2.0
arc                  randconfig-002-20250220    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250220    gcc-14.2.0
arm                  randconfig-002-20250220    gcc-14.2.0
arm                  randconfig-003-20250220    gcc-14.2.0
arm                  randconfig-004-20250220    gcc-14.2.0
arm64                           allmodconfig    clang-18
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250220    gcc-14.2.0
arm64                randconfig-002-20250220    gcc-14.2.0
arm64                randconfig-003-20250220    clang-21
arm64                randconfig-004-20250220    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250220    gcc-14.2.0
csky                 randconfig-002-20250220    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250220    clang-21
hexagon              randconfig-002-20250220    clang-21
i386                            allmodconfig    gcc-12
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250220    gcc-12
i386       buildonly-randconfig-002-20250220    gcc-12
i386       buildonly-randconfig-003-20250220    gcc-12
i386       buildonly-randconfig-004-20250220    clang-19
i386       buildonly-randconfig-005-20250220    clang-19
i386       buildonly-randconfig-006-20250220    clang-19
i386                               defconfig    clang-19
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250220    gcc-14.2.0
loongarch            randconfig-002-20250220    gcc-14.2.0
nios2                randconfig-001-20250220    gcc-14.2.0
nios2                randconfig-002-20250220    gcc-14.2.0
parisc               randconfig-001-20250220    gcc-14.2.0
parisc               randconfig-002-20250220    gcc-14.2.0
powerpc              randconfig-001-20250220    gcc-14.2.0
powerpc              randconfig-002-20250220    clang-16
powerpc              randconfig-003-20250220    clang-21
powerpc64            randconfig-001-20250220    clang-16
powerpc64            randconfig-002-20250220    clang-18
powerpc64            randconfig-003-20250220    gcc-14.2.0
riscv                randconfig-001-20250220    gcc-14.2.0
riscv                randconfig-002-20250220    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250220    clang-19
s390                 randconfig-002-20250220    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250220    gcc-14.2.0
sh                   randconfig-002-20250220    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250220    gcc-14.2.0
sparc                randconfig-002-20250220    gcc-14.2.0
sparc64              randconfig-001-20250220    gcc-14.2.0
sparc64              randconfig-002-20250220    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250220    gcc-12
um                   randconfig-002-20250220    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250220    gcc-12
x86_64     buildonly-randconfig-002-20250220    gcc-12
x86_64     buildonly-randconfig-003-20250220    gcc-12
x86_64     buildonly-randconfig-004-20250220    gcc-12
x86_64     buildonly-randconfig-005-20250220    gcc-12
x86_64     buildonly-randconfig-006-20250220    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250220    gcc-14.2.0
xtensa               randconfig-002-20250220    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
