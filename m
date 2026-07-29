Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682E3F23DF
	for <mhi@lists.linux.dev>; Wed, 29 Jul 2026 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357830; cv=none; b=jKhPVwAN4X/XsKQwWDAzqs09CsF+QgnEUZimCIYWcSzu1yYllibH/S3nKq9/fVZUDiD61qnMemJPW7j6oLWDAeEPnUgb1B8Hv64IzllbWa/sQdT94ZDSGgXPabrHN6vNfXnxUP0OHMDS9XJrhXpY3U/0+lHdr2VfPf76kC88cfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357830; c=relaxed/simple;
	bh=Bl5GYYtnqR3zHuUX3jzK0ggCcp+h5L8303+5OtW5kHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SFhTeJ2YRuMC07eY22D2+kMz2pjHfOOh2tCbxJGM7dlBeZWK/6441/OOv/xrRJ/5q5AuNkqpR2ciEYTzZiXWcCZeVShkX+EmU6rW5cj9+IcyZiVxbe5BwU01A5J7DuQRzJFITcJIGFva0/RlFmBBipQ9kwjBQPe7M32QtOlv3ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8FZ9Yy5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8FZ9Yy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785357828; x=1816893828;
  h=date:from:to:cc:subject:message-id;
  bh=Bl5GYYtnqR3zHuUX3jzK0ggCcp+h5L8303+5OtW5kHQ=;
  b=P8FZ9Yy5RLa2QO1AvdDJOdqUpX2wMWpuKvmp/bC9bMRltCnT61lctb2c
   8TtithfhBVMRCFI8eGpJd9OlXdZtaAQZPIEb0vHTDxWds2uVAe4rmRgzI
   LVkl42iLh62+nUrHmMCVukrb3Q3bZHDP4aGZAuGt+SUnuGx2DbygWH5e3
   x2alxeo9WcYRIxhznLeBmkPF7yW+zcLQUM/IfQwCv8H0hlsENHZ/Mckmw
   hX3KCilprHjzNSUCtZWYBaQzJsm+yQFJq1ZbQ/m0qhYawLX9NqTPXDpJj
   2F2mfRA/afZaLJKzbERyoRBrdAjmxE7WUqDOalgupk6tr1HDP+00uAl/M
   Q==;
X-CSE-ConnectionGUID: GLugc72GRCCDZh4F1xUaZA==
X-CSE-MsgGUID: Fl2omW+sRPmNIgGfs3/UtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84952192"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="84952192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 13:43:48 -0700
X-CSE-ConnectionGUID: q0FGWCjSQ+m+sODY0NgcoQ==
X-CSE-MsgGUID: Tn5vaQR1RyekWsmLN8H4xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="264380902"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Jul 2026 13:43:47 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpB7s-00000000ffs-1xbY;
	Wed, 29 Jul 2026 20:43:41 +0000
Date: Thu, 30 Jul 2026 04:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 f502c0316c52b1f71fe544f99676805d90c554ba
Message-ID: <202607300422.ljgFpiD6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: f502c0316c52b1f71fe544f99676805d90c554ba  PCI: epf-mhi: Implement mhi_cntrl->flush_async() to flush DMA read/write

elapsed time: 859m

configs tested: 185
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260729    gcc-8.5.0
arc                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-001-20260729    gcc-8.5.0
arm                  randconfig-002-20260729    gcc-8.5.0
arm                  randconfig-003-20260729    gcc-8.5.0
arm                  randconfig-004-20260729    gcc-8.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260729    clang-17
arm64                randconfig-001-20260729    gcc-14.3.0
arm64                randconfig-001-20260730    gcc-15.2.0
arm64                randconfig-002-20260729    clang-17
arm64                randconfig-002-20260729    gcc-14.3.0
arm64                randconfig-002-20260730    gcc-15.2.0
arm64                randconfig-003-20260729    clang-17
arm64                randconfig-003-20260729    gcc-14.3.0
arm64                randconfig-003-20260730    gcc-15.2.0
arm64                randconfig-004-20260729    clang-17
arm64                randconfig-004-20260729    gcc-14.3.0
arm64                randconfig-004-20260730    gcc-15.2.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260729    clang-17
csky                 randconfig-001-20260729    gcc-14.3.0
csky                 randconfig-001-20260730    gcc-15.2.0
csky                 randconfig-002-20260729    clang-17
csky                 randconfig-002-20260729    gcc-14.3.0
csky                 randconfig-002-20260730    gcc-15.2.0
hexagon                       randconfig-001    gcc-9.5.0
hexagon              randconfig-001-20260729    gcc-9.5.0
hexagon              randconfig-001-20260730    clang-24
hexagon              randconfig-002-20260729    gcc-9.5.0
hexagon              randconfig-002-20260730    clang-24
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260729    gcc-14
i386       buildonly-randconfig-001-20260730    gcc-14
i386       buildonly-randconfig-002-20260729    gcc-14
i386       buildonly-randconfig-002-20260730    gcc-14
i386       buildonly-randconfig-003-20260729    gcc-14
i386       buildonly-randconfig-003-20260730    gcc-14
i386       buildonly-randconfig-004-20260729    gcc-14
i386       buildonly-randconfig-004-20260730    gcc-14
i386       buildonly-randconfig-005-20260729    gcc-14
i386       buildonly-randconfig-005-20260730    gcc-14
i386       buildonly-randconfig-006-20260729    gcc-14
i386       buildonly-randconfig-006-20260730    gcc-14
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260729    clang-22
i386                 randconfig-002-20260729    clang-22
i386                 randconfig-003-20260729    clang-22
i386                 randconfig-004-20260729    clang-22
i386                 randconfig-005-20260729    clang-22
i386                 randconfig-006-20260729    clang-22
i386                 randconfig-007-20260729    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260729    clang-22
i386                 randconfig-011-20260729    gcc-14
i386                 randconfig-012-20260729    clang-22
i386                 randconfig-012-20260729    gcc-14
i386                 randconfig-013-20260729    clang-22
i386                 randconfig-013-20260729    gcc-14
i386                 randconfig-014-20260729    gcc-14
i386                 randconfig-015-20260729    clang-22
i386                 randconfig-015-20260729    gcc-14
i386                 randconfig-016-20260729    gcc-14
i386                 randconfig-017-20260729    clang-22
i386                 randconfig-017-20260729    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260729    gcc-9.5.0
loongarch            randconfig-001-20260730    clang-24
loongarch            randconfig-002-20260729    gcc-9.5.0
loongarch            randconfig-002-20260730    clang-24
mips                       bcm63xx_defconfig    clang-24
mips                       maltaup_defconfig    clang-17
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260729    gcc-9.5.0
nios2                randconfig-001-20260730    clang-24
nios2                randconfig-002-20260729    gcc-9.5.0
nios2                randconfig-002-20260730    clang-24
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260729    clang-24
parisc               randconfig-001-20260729    gcc-10.5.0
parisc               randconfig-001-20260730    gcc-14.3.0
parisc               randconfig-002-20260729    clang-24
parisc               randconfig-002-20260729    gcc-16.1.0
parisc               randconfig-002-20260730    gcc-14.3.0
powerpc                    ksi8560_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260729    clang-21
powerpc              randconfig-001-20260729    clang-24
powerpc              randconfig-001-20260730    gcc-14.3.0
powerpc              randconfig-002-20260729    clang-24
powerpc              randconfig-002-20260729    gcc-8.5.0
powerpc              randconfig-002-20260730    gcc-14.3.0
powerpc64            randconfig-001-20260729    clang-24
powerpc64            randconfig-001-20260730    gcc-14.3.0
powerpc64            randconfig-002-20260729    clang-24
powerpc64            randconfig-002-20260729    gcc-10.5.0
powerpc64            randconfig-002-20260730    gcc-14.3.0
riscv                randconfig-001-20260729    gcc-15.2.0
riscv                randconfig-001-20260729    gcc-8.5.0
riscv                randconfig-001-20260730    gcc-15.2.0
riscv                randconfig-002-20260729    gcc-15.2.0
riscv                randconfig-002-20260729    gcc-9.5.0
riscv                randconfig-002-20260730    gcc-15.2.0
s390                 randconfig-001-20260729    clang-17
s390                 randconfig-001-20260729    gcc-15.2.0
s390                 randconfig-001-20260730    gcc-15.2.0
s390                 randconfig-002-20260729    clang-24
s390                 randconfig-002-20260729    gcc-15.2.0
s390                 randconfig-002-20260730    gcc-15.2.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260729    gcc-13.4.0
sh                   randconfig-001-20260729    gcc-15.2.0
sh                   randconfig-001-20260730    gcc-15.2.0
sh                   randconfig-002-20260729    gcc-15.2.0
sh                   randconfig-002-20260730    gcc-15.2.0
sparc                         randconfig-001    gcc-16.1.0
sparc                randconfig-001-20260729    gcc-10.5.0
sparc                randconfig-001-20260729    gcc-8.5.0
sparc                randconfig-001-20260730    clang-24
sparc                randconfig-002-20260729    gcc-10.5.0
sparc                randconfig-002-20260729    gcc-16.1.0
sparc                randconfig-002-20260730    clang-24
sparc64              randconfig-001-20260729    gcc-10.5.0
sparc64              randconfig-001-20260729    gcc-12.5.0
sparc64              randconfig-001-20260730    clang-24
sparc64              randconfig-002-20260729    clang-21
sparc64              randconfig-002-20260729    gcc-10.5.0
sparc64              randconfig-002-20260730    clang-24
um                   randconfig-001-20260729    gcc-10.5.0
um                   randconfig-001-20260729    gcc-14
um                   randconfig-001-20260730    clang-24
um                   randconfig-002-20260729    gcc-10.5.0
um                   randconfig-002-20260729    gcc-14
um                   randconfig-002-20260730    clang-24
x86_64              buildonly-randconfig-001    gcc-14
x86_64     buildonly-randconfig-001-20260729    clang-22
x86_64     buildonly-randconfig-001-20260729    gcc-14
x86_64     buildonly-randconfig-002-20260729    clang-22
x86_64     buildonly-randconfig-002-20260729    gcc-14
x86_64     buildonly-randconfig-003-20260729    clang-22
x86_64     buildonly-randconfig-004-20260729    clang-22
x86_64     buildonly-randconfig-004-20260729    gcc-14
x86_64     buildonly-randconfig-005-20260729    clang-22
x86_64     buildonly-randconfig-006-20260729    clang-22
x86_64     buildonly-randconfig-006-20260729    gcc-12
x86_64     buildonly-randconfig-006-20260729    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    clang-22
x86_64               randconfig-001-20260729    clang-22
x86_64               randconfig-002-20260729    clang-22
x86_64               randconfig-003-20260729    clang-22
x86_64               randconfig-004-20260729    clang-22
x86_64               randconfig-005-20260729    clang-22
x86_64               randconfig-006-20260729    clang-22
x86_64                        randconfig-011    gcc-14
x86_64               randconfig-011-20260729    gcc-14
x86_64               randconfig-012-20260729    gcc-14
x86_64               randconfig-013-20260729    gcc-14
x86_64               randconfig-014-20260729    gcc-14
x86_64               randconfig-015-20260729    gcc-14
x86_64               randconfig-016-20260729    gcc-14
x86_64               randconfig-071-20260729    clang-22
x86_64               randconfig-071-20260729    gcc-12
x86_64               randconfig-072-20260729    gcc-12
x86_64               randconfig-073-20260729    gcc-12
x86_64               randconfig-074-20260729    clang-22
x86_64               randconfig-074-20260729    gcc-12
x86_64               randconfig-075-20260729    gcc-12
x86_64               randconfig-075-20260729    gcc-14
x86_64               randconfig-076-20260729    gcc-12
x86_64               randconfig-076-20260729    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260729    gcc-10.5.0
xtensa               randconfig-001-20260729    gcc-12.5.0
xtensa               randconfig-001-20260730    clang-24
xtensa               randconfig-002-20260729    gcc-10.5.0
xtensa               randconfig-002-20260730    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
