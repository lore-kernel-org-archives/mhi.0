Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA15B5674A
	for <mhi@lists.linux.dev>; Mon,  1 Apr 2024 23:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712012991; cv=none; b=HVD8XAJUreF2vsRLM3c2Szn9gLIoCR9EenVqHtoI/TShI9hP4qQg4zOS8KPGYR6/k1Reu5ZFVhaM9GJ0Rtw3n4fQbifAK5SAJYITf0HC3rJMxi02DaPrfk/DHsaFsXcN0Zht7GDM1qcmJmOLalONFhbsq5NNCW5V8YcSr4ldIcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712012991; c=relaxed/simple;
	bh=nx0Ssxcwedxi4+oE9LGFE+J9T5S/cNavy/xEX+hUaUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KQMkMBsWZpSro6e44ahLPMgz7/em3Rm62/0Xjl+uH2GZ57KgYmSkpKIC9UyjGmYICuWbGZaMt5kqtuWzzfRFglSMNZcpksIWBwkpbmK8gu/Dc+fl42OKS7fiG/PfFLHEGnbJCMzt/MVk47zes+ixB6euH2aMdSPEMH6Poe2tn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAkiXf+H; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAkiXf+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712012990; x=1743548990;
  h=date:from:to:cc:subject:message-id;
  bh=nx0Ssxcwedxi4+oE9LGFE+J9T5S/cNavy/xEX+hUaUE=;
  b=GAkiXf+HTGn+sEgk0ejlIZdP7Vfo5Yxz/iZYztLDivJCfE/Upm0D2Npn
   5By1dogTc/T17PaeoWC7TwSWYwDXUc3BLspeQtzthoDucf/YRfD+2e7kL
   ujODx0XCcbx+Dnd5weH0vkMnr3Yv22SB0Szme5Ht33GY9xyhWcIkQuUUL
   gXFDEgKSAg1Yv5QMh90qC+xBl7tm8Xor9G2DpFSlt3EsKhoCSYQ5oimwO
   l1z3dxQnmc9jClzHgXT55J0QT3T+w/9I13gP/CrQeNJOirxzpPoHx1xxf
   92wVKuFriHrTUH/QHG7EM6yqPhtSLkDiFZ4l5519duxNBNySBSbjWfTMJ
   w==;
X-CSE-ConnectionGUID: LjPcPfjtRS+DJwRPjZNZEg==
X-CSE-MsgGUID: /wDOhkx5Sk6zlhxvDiFdhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7016564"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7016564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 16:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="18324631"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Apr 2024 16:09:48 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrQmV-0000ex-0q;
	Mon, 01 Apr 2024 23:09:38 +0000
Date: Tue, 02 Apr 2024 07:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 813e0ae613d6ee1b3e11f1c41f8b9e9df8ef0493
Message-ID: <202404020717.tAEtvYLm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 813e0ae613d6ee1b3e11f1c41f8b9e9df8ef0493  bus: mhi: host: Add mhi_power_down_keep_dev() API to support system suspend/hibernation

elapsed time: 725m

configs tested: 256
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240401   gcc  
arc                   randconfig-001-20240402   gcc  
arc                   randconfig-002-20240401   gcc  
arc                   randconfig-002-20240402   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                          pxa3xx_defconfig   clang
arm                   randconfig-001-20240401   clang
arm                   randconfig-001-20240402   gcc  
arm                   randconfig-002-20240401   clang
arm                   randconfig-003-20240401   gcc  
arm                   randconfig-004-20240401   gcc  
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240401   gcc  
arm64                 randconfig-002-20240401   gcc  
arm64                 randconfig-003-20240401   gcc  
arm64                 randconfig-004-20240401   gcc  
arm64                 randconfig-004-20240402   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240401   gcc  
csky                  randconfig-001-20240402   gcc  
csky                  randconfig-002-20240401   gcc  
csky                  randconfig-002-20240402   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240401   clang
hexagon               randconfig-002-20240401   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240401   gcc  
i386         buildonly-randconfig-002-20240401   clang
i386         buildonly-randconfig-003-20240401   clang
i386         buildonly-randconfig-004-20240401   gcc  
i386         buildonly-randconfig-005-20240401   gcc  
i386         buildonly-randconfig-006-20240401   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240401   gcc  
i386                  randconfig-002-20240401   gcc  
i386                  randconfig-003-20240401   clang
i386                  randconfig-004-20240401   clang
i386                  randconfig-005-20240401   gcc  
i386                  randconfig-006-20240401   gcc  
i386                  randconfig-011-20240401   clang
i386                  randconfig-012-20240401   clang
i386                  randconfig-013-20240401   gcc  
i386                  randconfig-014-20240401   gcc  
i386                  randconfig-015-20240401   gcc  
i386                  randconfig-016-20240401   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240401   gcc  
loongarch             randconfig-001-20240402   gcc  
loongarch             randconfig-002-20240401   gcc  
loongarch             randconfig-002-20240402   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                 decstation_r4k_defconfig   gcc  
mips                          eyeq5_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240401   gcc  
nios2                 randconfig-001-20240402   gcc  
nios2                 randconfig-002-20240401   gcc  
nios2                 randconfig-002-20240402   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240401   gcc  
parisc                randconfig-001-20240402   gcc  
parisc                randconfig-002-20240401   gcc  
parisc                randconfig-002-20240402   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                   motionpro_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240401   gcc  
powerpc               randconfig-002-20240401   gcc  
powerpc               randconfig-002-20240402   gcc  
powerpc               randconfig-003-20240401   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240401   gcc  
powerpc64             randconfig-001-20240402   gcc  
powerpc64             randconfig-002-20240401   clang
powerpc64             randconfig-002-20240402   gcc  
powerpc64             randconfig-003-20240401   gcc  
powerpc64             randconfig-003-20240402   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240401   clang
riscv                 randconfig-002-20240401   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240401   gcc  
s390                  randconfig-001-20240402   gcc  
s390                  randconfig-002-20240401   gcc  
s390                  randconfig-002-20240402   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240401   gcc  
sh                    randconfig-001-20240402   gcc  
sh                    randconfig-002-20240401   gcc  
sh                    randconfig-002-20240402   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240401   gcc  
sparc64               randconfig-001-20240402   gcc  
sparc64               randconfig-002-20240401   gcc  
sparc64               randconfig-002-20240402   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240401   gcc  
um                    randconfig-001-20240402   gcc  
um                    randconfig-002-20240401   clang
um                    randconfig-002-20240402   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240401   clang
x86_64       buildonly-randconfig-001-20240402   clang
x86_64       buildonly-randconfig-002-20240401   clang
x86_64       buildonly-randconfig-002-20240402   clang
x86_64       buildonly-randconfig-003-20240401   gcc  
x86_64       buildonly-randconfig-003-20240402   clang
x86_64       buildonly-randconfig-004-20240401   gcc  
x86_64       buildonly-randconfig-004-20240402   clang
x86_64       buildonly-randconfig-005-20240401   gcc  
x86_64       buildonly-randconfig-005-20240402   clang
x86_64       buildonly-randconfig-006-20240401   clang
x86_64       buildonly-randconfig-006-20240402   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240401   gcc  
x86_64                randconfig-001-20240402   clang
x86_64                randconfig-002-20240401   clang
x86_64                randconfig-002-20240402   clang
x86_64                randconfig-003-20240401   clang
x86_64                randconfig-003-20240402   gcc  
x86_64                randconfig-004-20240401   gcc  
x86_64                randconfig-004-20240402   clang
x86_64                randconfig-005-20240401   gcc  
x86_64                randconfig-005-20240402   gcc  
x86_64                randconfig-006-20240401   clang
x86_64                randconfig-006-20240402   gcc  
x86_64                randconfig-011-20240401   clang
x86_64                randconfig-011-20240402   gcc  
x86_64                randconfig-012-20240401   gcc  
x86_64                randconfig-012-20240402   gcc  
x86_64                randconfig-013-20240401   gcc  
x86_64                randconfig-013-20240402   clang
x86_64                randconfig-014-20240401   gcc  
x86_64                randconfig-014-20240402   gcc  
x86_64                randconfig-015-20240401   gcc  
x86_64                randconfig-015-20240402   clang
x86_64                randconfig-016-20240401   gcc  
x86_64                randconfig-016-20240402   gcc  
x86_64                randconfig-071-20240401   gcc  
x86_64                randconfig-071-20240402   clang
x86_64                randconfig-072-20240401   gcc  
x86_64                randconfig-072-20240402   clang
x86_64                randconfig-073-20240401   clang
x86_64                randconfig-073-20240402   clang
x86_64                randconfig-074-20240401   gcc  
x86_64                randconfig-074-20240402   gcc  
x86_64                randconfig-075-20240401   gcc  
x86_64                randconfig-075-20240402   clang
x86_64                randconfig-076-20240401   gcc  
x86_64                randconfig-076-20240402   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240401   gcc  
xtensa                randconfig-001-20240402   gcc  
xtensa                randconfig-002-20240401   gcc  
xtensa                randconfig-002-20240402   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
