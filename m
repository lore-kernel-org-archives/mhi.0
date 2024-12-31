Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A242944E
	for <mhi@lists.linux.dev>; Tue, 31 Dec 2024 05:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735623718; cv=none; b=ceY+BQvrFtKXfNQHlW7gyMNQGujIOrtF7MYEEi16LWs22YgdmB11WWg29drYzC+mByECrLgWJ9Dk6iHgz8xb9qpDgdgkc5f2NQmKzylxn4MVgKQda6SkHF87F83hcaG6plT+npGhtNAcXC2ab1wsFKXx9TCw2IwJYoODpIXFVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735623718; c=relaxed/simple;
	bh=RAfdFvetpAYn00IOCxYRprCQIxTwtKK9+4N6psPE5B0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rczb8zDAOi5rLn63lcN0wxwQTQNkdHPU/k9lanpwuk6duQGlYitV/337XzRzUtaQQBdJzTj1jd5+e8uB8vIOzFY9n3w413sFaP1lq2i1e0/6mRfQoEwvgzqxLWzQEgM/AKnnQbFRvGSj3dnCgUHlEFhXRsNnJmFh96+jOCQwSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzcyPtgx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzcyPtgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735623716; x=1767159716;
  h=date:from:to:cc:subject:message-id;
  bh=RAfdFvetpAYn00IOCxYRprCQIxTwtKK9+4N6psPE5B0=;
  b=nzcyPtgx1s3hQhr3G2nlvOLa9DBHLP2yd9LI3d97ebiOGC5m7OvkQslB
   hPrIqjN0/rp60HsOariIO5b9ikC1PwDRKVjmx/O65iaGI2BqpNELccvMB
   2eOBlnvxUpDI/l8dGrwLMJ3Cl6ej3J+JF1Hynx5ZQnNy+7tULwpFwtw/g
   BCRKPwiqLfm9Qr7fP9/NE+WbwvElSWidIkGj9hg9p0xCUQC5MD7CEguCp
   Dzt/TcBkTlxpj/mFLYbGK/aisQug8/EcAg4Ofd9JJhHdNySfc8CjbuReE
   6/oBUyeiX6fsfX6J2Ckd15MQTvepsW/Rig71hthSZshc6ySxtenBXIrcj
   A==;
X-CSE-ConnectionGUID: NOWQqYU3Sr+bw+fwfHYvlw==
X-CSE-MsgGUID: IZuSRRlaTzmiOSwIx53Hvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="53450898"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="53450898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 21:41:55 -0800
X-CSE-ConnectionGUID: 3S6/5LL/T4uDaj6TWrz22Q==
X-CSE-MsgGUID: bttMGIh/RduPIGdr3FE38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124254969"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Dec 2024 21:41:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSV0p-0006nf-1s;
	Tue, 31 Dec 2024 05:41:51 +0000
Date: Tue, 31 Dec 2024 13:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 9241459b3cc2e66252d32bef88e858dcf9c7c487
Message-ID: <202412311356.wCpv1Wqo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 9241459b3cc2e66252d32bef88e858dcf9c7c487  bus: mhi: host: pci_generic: Add support for QDU100 device

elapsed time: 833m

configs tested: 194
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241231    gcc-13.2.0
arc                   randconfig-002-20241231    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                            mmp2_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20241231    clang-19
arm                   randconfig-002-20241231    clang-17
arm                   randconfig-003-20241231    gcc-14.2.0
arm                   randconfig-004-20241231    gcc-14.2.0
arm                           sunxi_defconfig    clang-15
arm                           tegra_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241231    clang-20
arm64                 randconfig-002-20241231    clang-20
arm64                 randconfig-003-20241231    gcc-14.2.0
arm64                 randconfig-004-20241231    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241231    gcc-14.2.0
csky                  randconfig-002-20241231    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241231    clang-20
hexagon               randconfig-002-20241231    clang-16
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241231    gcc-11
i386        buildonly-randconfig-002-20241231    clang-19
i386        buildonly-randconfig-003-20241231    clang-19
i386        buildonly-randconfig-004-20241231    clang-19
i386        buildonly-randconfig-005-20241231    gcc-12
i386        buildonly-randconfig-006-20241231    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241231    gcc-11
i386                  randconfig-002-20241231    gcc-11
i386                  randconfig-003-20241231    gcc-11
i386                  randconfig-004-20241231    gcc-11
i386                  randconfig-005-20241231    gcc-11
i386                  randconfig-006-20241231    gcc-11
i386                  randconfig-007-20241231    gcc-11
i386                  randconfig-011-20241231    gcc-12
i386                  randconfig-012-20241231    gcc-12
i386                  randconfig-013-20241231    gcc-12
i386                  randconfig-014-20241231    gcc-12
i386                  randconfig-015-20241231    gcc-12
i386                  randconfig-016-20241231    gcc-12
i386                  randconfig-017-20241231    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241231    gcc-14.2.0
loongarch             randconfig-002-20241231    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241231    gcc-14.2.0
nios2                 randconfig-002-20241231    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241231    gcc-14.2.0
parisc                randconfig-002-20241231    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      cm5200_defconfig    clang-15
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-15
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc                    mvme5100_defconfig    clang-15
powerpc                      pasemi_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241231    clang-15
powerpc               randconfig-002-20241231    clang-20
powerpc               randconfig-003-20241231    clang-15
powerpc                     sequoia_defconfig    clang-15
powerpc64                        alldefconfig    gcc-14.2.0
powerpc64             randconfig-001-20241231    clang-20
powerpc64             randconfig-002-20241231    clang-19
powerpc64             randconfig-003-20241231    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241231    clang-20
riscv                 randconfig-002-20241231    clang-15
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241231    gcc-14.2.0
s390                  randconfig-002-20241231    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20241231    gcc-14.2.0
sh                    randconfig-002-20241231    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7722_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241231    gcc-14.2.0
sparc                 randconfig-002-20241231    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241231    gcc-14.2.0
sparc64               randconfig-002-20241231    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241231    clang-20
um                    randconfig-002-20241231    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241231    clang-19
x86_64      buildonly-randconfig-002-20241231    gcc-12
x86_64      buildonly-randconfig-003-20241231    clang-19
x86_64      buildonly-randconfig-004-20241231    gcc-12
x86_64      buildonly-randconfig-005-20241231    clang-19
x86_64      buildonly-randconfig-006-20241231    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241231    gcc-12
x86_64                randconfig-002-20241231    gcc-12
x86_64                randconfig-003-20241231    gcc-12
x86_64                randconfig-004-20241231    gcc-12
x86_64                randconfig-005-20241231    gcc-12
x86_64                randconfig-006-20241231    gcc-12
x86_64                randconfig-007-20241231    gcc-12
x86_64                randconfig-008-20241231    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241231    gcc-14.2.0
xtensa                randconfig-002-20241231    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
