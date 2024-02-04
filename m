Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9246FC5
	for <mhi@lists.linux.dev>; Sun,  4 Feb 2024 06:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707027135; cv=none; b=KWuj2KVPL1mjxOdTpE4X5lk0smfhs1IeJSYTpOGn9ykcV51btKxz2/HhOKjtKTEDt4T9vrBK5JEMop2Pjo8JLbIr9GXHE5OhrXsJWkVWJ+8p+BHslqdA3IJK0Yni1eCD9o7VUy7KaEOOsRMxIHWw3z3jyJCRG9b4BWaEGOzosb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707027135; c=relaxed/simple;
	bh=VxXnP+iUOI9dAUeE1nUXJqzZprBa7eRnbed9HO99c44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JMwZvmFXCthvZgreN/WLBbbGY+jWpUGm3+QnOuHKH5nDOTkdEo6u+LMgUIHFfxwyGzY/i0cnWukVVadFfREd4dfki+jxk8lSq34F0qIhE3wEd7T7EuSMU/5Qlw+6CT/RcJvCAwyQMa59BqvNKN3DM8AUEqXAY372hX8dDDCtfgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jkq0DXYA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jkq0DXYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707027133; x=1738563133;
  h=date:from:to:cc:subject:message-id;
  bh=VxXnP+iUOI9dAUeE1nUXJqzZprBa7eRnbed9HO99c44=;
  b=Jkq0DXYA5xWADKmk4IGzmjUOUOYJj19xgwDgZ3odeDyCCxXUhaJRaaRN
   yi1+lFcT294dgxrJBc0uf4h5GNodps83UKQiq3X+eoki7Lym/egwLvrLh
   79d2dHK95J0LlOCFMIq2TwDKGuTA9XcPW7MuqJznPhXNlEw61elxUS54j
   B7mZQ/otdKJ6udjwkXprXMV1dBfTb1WkUe/Wi6jwwoKgr+mubK4RPq042
   IhulyZbhuXVAz67Tmu/22+qgGh1sRIq+3tsejoUCIa9vZj49mokMhNzcS
   YTPmfp0xrhYFb+UX9MooP8D0j+0JHv8/0cNb24emKTtHNBR6OAE+dyQEi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11460111"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11460111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 22:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="722239"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2024 22:12:10 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWVjc-00064O-1R;
	Sun, 04 Feb 2024 06:12:08 +0000
Date: Sun, 04 Feb 2024 14:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 ae1d892d518af5c092f2b1f8e6921996c6a95cb3
Message-ID: <202402041453.nx9uVRgs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: ae1d892d518af5c092f2b1f8e6921996c6a95cb3  bus: mhi: ep: Use kcalloc() instead of kzalloc()

elapsed time: 1448m

configs tested: 279
configs skipped: 3

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
arc                        nsimosci_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240203   gcc  
arc                   randconfig-001-20240204   gcc  
arc                   randconfig-002-20240203   gcc  
arc                   randconfig-002-20240204   gcc  
arc                           tb10x_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240204   gcc  
arm                   randconfig-002-20240204   clang
arm                   randconfig-003-20240203   gcc  
arm                   randconfig-003-20240204   clang
arm                   randconfig-004-20240204   gcc  
arm                         s5pv210_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                         socfpga_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240204   gcc  
arm64                 randconfig-002-20240204   clang
arm64                 randconfig-003-20240203   gcc  
arm64                 randconfig-003-20240204   gcc  
arm64                 randconfig-004-20240203   gcc  
arm64                 randconfig-004-20240204   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240203   gcc  
csky                  randconfig-001-20240204   gcc  
csky                  randconfig-002-20240203   gcc  
csky                  randconfig-002-20240204   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240204   clang
hexagon               randconfig-002-20240204   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240203   clang
i386         buildonly-randconfig-001-20240204   gcc  
i386         buildonly-randconfig-002-20240203   gcc  
i386         buildonly-randconfig-002-20240204   gcc  
i386         buildonly-randconfig-003-20240203   clang
i386         buildonly-randconfig-003-20240204   gcc  
i386         buildonly-randconfig-004-20240203   clang
i386         buildonly-randconfig-004-20240204   gcc  
i386         buildonly-randconfig-005-20240203   clang
i386         buildonly-randconfig-005-20240204   gcc  
i386         buildonly-randconfig-006-20240203   gcc  
i386         buildonly-randconfig-006-20240204   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240203   clang
i386                  randconfig-001-20240204   clang
i386                  randconfig-002-20240203   gcc  
i386                  randconfig-002-20240204   clang
i386                  randconfig-003-20240203   clang
i386                  randconfig-003-20240204   clang
i386                  randconfig-004-20240203   gcc  
i386                  randconfig-004-20240204   gcc  
i386                  randconfig-005-20240203   clang
i386                  randconfig-005-20240204   clang
i386                  randconfig-006-20240203   gcc  
i386                  randconfig-006-20240204   gcc  
i386                  randconfig-011-20240203   clang
i386                  randconfig-011-20240204   clang
i386                  randconfig-012-20240203   gcc  
i386                  randconfig-012-20240204   gcc  
i386                  randconfig-013-20240203   gcc  
i386                  randconfig-013-20240204   clang
i386                  randconfig-014-20240203   gcc  
i386                  randconfig-014-20240204   clang
i386                  randconfig-015-20240203   gcc  
i386                  randconfig-015-20240204   clang
i386                  randconfig-016-20240203   gcc  
i386                  randconfig-016-20240204   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240203   gcc  
loongarch             randconfig-001-20240204   gcc  
loongarch             randconfig-002-20240203   gcc  
loongarch             randconfig-002-20240204   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                            gpr_defconfig   clang
mips                       lemote2f_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240203   gcc  
nios2                 randconfig-001-20240204   gcc  
nios2                 randconfig-002-20240203   gcc  
nios2                 randconfig-002-20240204   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240203   gcc  
parisc                randconfig-001-20240204   gcc  
parisc                randconfig-002-20240203   gcc  
parisc                randconfig-002-20240204   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240204   gcc  
powerpc               randconfig-002-20240204   gcc  
powerpc               randconfig-003-20240204   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc64             randconfig-001-20240204   gcc  
powerpc64             randconfig-002-20240203   gcc  
powerpc64             randconfig-002-20240204   clang
powerpc64             randconfig-003-20240204   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240204   clang
riscv                 randconfig-002-20240204   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240203   gcc  
s390                  randconfig-001-20240204   clang
s390                  randconfig-002-20240204   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240203   gcc  
sh                    randconfig-001-20240204   gcc  
sh                    randconfig-002-20240203   gcc  
sh                    randconfig-002-20240204   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240203   gcc  
sparc64               randconfig-001-20240204   gcc  
sparc64               randconfig-002-20240203   gcc  
sparc64               randconfig-002-20240204   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240204   gcc  
um                    randconfig-002-20240204   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240203   gcc  
x86_64       buildonly-randconfig-001-20240204   clang
x86_64       buildonly-randconfig-002-20240203   gcc  
x86_64       buildonly-randconfig-002-20240204   clang
x86_64       buildonly-randconfig-003-20240203   gcc  
x86_64       buildonly-randconfig-003-20240204   gcc  
x86_64       buildonly-randconfig-004-20240203   gcc  
x86_64       buildonly-randconfig-004-20240204   gcc  
x86_64       buildonly-randconfig-005-20240203   gcc  
x86_64       buildonly-randconfig-005-20240204   clang
x86_64       buildonly-randconfig-006-20240203   gcc  
x86_64       buildonly-randconfig-006-20240204   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240203   gcc  
x86_64                randconfig-001-20240204   gcc  
x86_64                randconfig-002-20240203   gcc  
x86_64                randconfig-002-20240204   gcc  
x86_64                randconfig-003-20240203   clang
x86_64                randconfig-003-20240204   clang
x86_64                randconfig-004-20240203   gcc  
x86_64                randconfig-004-20240204   clang
x86_64                randconfig-005-20240203   gcc  
x86_64                randconfig-005-20240204   gcc  
x86_64                randconfig-006-20240203   gcc  
x86_64                randconfig-006-20240204   gcc  
x86_64                randconfig-011-20240203   gcc  
x86_64                randconfig-011-20240204   gcc  
x86_64                randconfig-012-20240203   gcc  
x86_64                randconfig-012-20240204   gcc  
x86_64                randconfig-013-20240203   clang
x86_64                randconfig-013-20240204   gcc  
x86_64                randconfig-014-20240203   clang
x86_64                randconfig-014-20240204   gcc  
x86_64                randconfig-015-20240203   clang
x86_64                randconfig-015-20240204   clang
x86_64                randconfig-016-20240203   clang
x86_64                randconfig-016-20240204   clang
x86_64                randconfig-071-20240203   clang
x86_64                randconfig-071-20240204   gcc  
x86_64                randconfig-072-20240203   gcc  
x86_64                randconfig-072-20240204   gcc  
x86_64                randconfig-073-20240203   clang
x86_64                randconfig-073-20240204   gcc  
x86_64                randconfig-074-20240203   clang
x86_64                randconfig-074-20240204   clang
x86_64                randconfig-075-20240203   clang
x86_64                randconfig-075-20240204   clang
x86_64                randconfig-076-20240203   clang
x86_64                randconfig-076-20240204   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240203   gcc  
xtensa                randconfig-001-20240204   gcc  
xtensa                randconfig-002-20240203   gcc  
xtensa                randconfig-002-20240204   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
