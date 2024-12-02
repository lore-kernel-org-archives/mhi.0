Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D221DED42
	for <mhi@lists.linux.dev>; Mon,  2 Dec 2024 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733180959; cv=none; b=CuAXd/xiV1vCIFshMGUcbat3upC47nsPfI/N0iu7hILpIczqKnQl/lLS5syxMZZX1qphJSZ+LyIg21ayV+r1O+49RmH9g+Sr4C3be8FXIrEaQHjzBSpjuBw9E7PZd8ARMW+5Xk+XH1f5PQVVsG661dwvObqt8VPUcgzRWgh22Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733180959; c=relaxed/simple;
	bh=CyBMDhbZEE7R0oACyGD5LlcjBOt/j4Yjz3J0xrMAH8w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=exoUUAqCrmEPevy1tdyEGFum/sNPAydMoWxVPZUYLL5Qf157hxn2H+zeKWzeIS/b/TY9edlniEfrQqravwsg6RxTKazcr/q/9CMcXKga/jaXGrNCfqlx5YDddD4CfQ7MVoL38SoChSrU/CiL+JEFLhWPo1ltO6URN/Fsg0foBqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ib1aafMc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ib1aafMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733180958; x=1764716958;
  h=date:from:to:cc:subject:message-id;
  bh=CyBMDhbZEE7R0oACyGD5LlcjBOt/j4Yjz3J0xrMAH8w=;
  b=ib1aafMcicwv+BkrnrU8207QVgtI+24Dhb3V32ArXE/ybPhSRYuXXCkw
   hn4c0jCpV7jTNu/AP8YwZf/T/slzC4nO9aGpKthX6eM2o0trXz3TofP8L
   yYiKI8NZiDUZ9TxHADNduaZp5xrMQI3Mto4PrBXebDdGdHEmKAP09dZJl
   5JSG3QgGRd2tCt5kYpBF35jBUt7XzJ1OT11uDhxNkEgt1ZfmpUjhZJW7l
   Dx8+HFhUBWSo5E/DKQHxqXcdeHomnexNE8F6+OFnParDS6dWHz5ZRb2DM
   fqJopVaQSzTtHjX1Z3zj5ZHKgs6sThJ0JD0kfomRDsnWfiiVP5JBSdgbB
   Q==;
X-CSE-ConnectionGUID: bArPNts+QMC9igJnzsGTnw==
X-CSE-MsgGUID: jiWFoaeNTNCBYb2Tpe3IEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33432068"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33432068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 15:09:17 -0800
X-CSE-ConnectionGUID: Rbqdt/AnRECFSCxc71J4FA==
X-CSE-MsgGUID: 41/NIof+SseeMrkispC2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="92903531"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2024 15:09:15 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIFXV-00030e-0Z;
	Mon, 02 Dec 2024 23:09:13 +0000
Date: Tue, 03 Dec 2024 07:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-fixes] BUILD SUCCESS
 098d8374033f323dae87a1d792a3c8911c2cf57f
Message-ID: <202412030709.e6nDUIm3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-fixes
branch HEAD: 098d8374033f323dae87a1d792a3c8911c2cf57f  bus: mhi: host: pci_generic: fix MHI BAR mapping

elapsed time: 779m

configs tested: 183
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241202    gcc-13.2.0
arc                   randconfig-001-20241202    gcc-14.2.0
arc                   randconfig-001-20241203    clang-20
arc                   randconfig-002-20241202    gcc-13.2.0
arc                   randconfig-002-20241202    gcc-14.2.0
arc                   randconfig-002-20241203    clang-20
arc                        vdk_hs38_defconfig    clang-14
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                         mv78xx0_defconfig    gcc-14.2.0
arm                           omap1_defconfig    gcc-14.2.0
arm                          pxa168_defconfig    clang-20
arm                          pxa168_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-20
arm                   randconfig-001-20241202    gcc-14.2.0
arm                   randconfig-001-20241203    clang-20
arm                   randconfig-002-20241202    clang-20
arm                   randconfig-002-20241202    gcc-14.2.0
arm                   randconfig-002-20241203    clang-20
arm                   randconfig-003-20241202    gcc-14.2.0
arm                   randconfig-003-20241203    clang-20
arm                   randconfig-004-20241202    clang-20
arm                   randconfig-004-20241202    gcc-14.2.0
arm                   randconfig-004-20241203    clang-20
arm                         s5pv210_defconfig    clang-14
arm                         socfpga_defconfig    clang-20
arm                        spear6xx_defconfig    clang-14
arm                        spear6xx_defconfig    clang-20
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241202    gcc-14.2.0
arm64                 randconfig-001-20241203    clang-20
arm64                 randconfig-002-20241202    gcc-14.2.0
arm64                 randconfig-002-20241203    clang-20
arm64                 randconfig-003-20241202    gcc-14.2.0
arm64                 randconfig-003-20241203    clang-20
arm64                 randconfig-004-20241202    clang-14
arm64                 randconfig-004-20241202    gcc-14.2.0
arm64                 randconfig-004-20241203    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241202    clang-19
i386        buildonly-randconfig-001-20241202    gcc-12
i386        buildonly-randconfig-001-20241203    clang-19
i386        buildonly-randconfig-002-20241202    clang-19
i386        buildonly-randconfig-002-20241202    gcc-12
i386        buildonly-randconfig-002-20241203    clang-19
i386        buildonly-randconfig-003-20241202    clang-19
i386        buildonly-randconfig-003-20241202    gcc-12
i386        buildonly-randconfig-003-20241203    clang-19
i386        buildonly-randconfig-004-20241202    clang-19
i386        buildonly-randconfig-004-20241203    clang-19
i386        buildonly-randconfig-005-20241202    clang-19
i386        buildonly-randconfig-005-20241203    clang-19
i386        buildonly-randconfig-006-20241202    clang-19
i386        buildonly-randconfig-006-20241203    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    clang-14
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                           ip28_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-14
nios2                             allnoconfig    gcc-14.2.0
openrisc                         alldefconfig    clang-20
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                    amigaone_defconfig    clang-14
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                   currituck_defconfig    clang-20
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    clang-14
powerpc                      pasemi_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    clang-14
powerpc                    socrates_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-14.2.0
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                            migor_defconfig    clang-20
sh                            migor_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                           se7619_defconfig    clang-20
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7705_defconfig    clang-20
sh                           se7780_defconfig    clang-14
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sh                              ul2_defconfig    clang-14
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241202    clang-19
x86_64      buildonly-randconfig-001-20241203    gcc-11
x86_64      buildonly-randconfig-002-20241202    clang-19
x86_64      buildonly-randconfig-002-20241202    gcc-12
x86_64      buildonly-randconfig-002-20241203    gcc-11
x86_64      buildonly-randconfig-003-20241202    clang-19
x86_64      buildonly-randconfig-003-20241202    gcc-12
x86_64      buildonly-randconfig-003-20241203    gcc-11
x86_64      buildonly-randconfig-004-20241202    clang-19
x86_64      buildonly-randconfig-004-20241203    gcc-11
x86_64      buildonly-randconfig-005-20241202    clang-19
x86_64      buildonly-randconfig-005-20241202    gcc-12
x86_64      buildonly-randconfig-005-20241203    gcc-11
x86_64      buildonly-randconfig-006-20241202    clang-19
x86_64      buildonly-randconfig-006-20241202    gcc-12
x86_64      buildonly-randconfig-006-20241203    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
