Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902715A862
	for <mhi@lists.linux.dev>; Mon,  7 Oct 2024 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728284138; cv=none; b=IKRpYNCiS8/Inp9GxZtgbmvSzymWqiN4+Y7GUFzsXBQ3MxYTBcQMeA1bU5WVJQ87Cd8p6Z1MVbe9amQcSs1l0ITLZGUlj1sl+jXqL9PsRYo6VtbEx0lpVw4+ETDtiYtbdNwoj1TCrXkZH3pqbqPe0+whKNgQTVKHYVVvDkg0YuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728284138; c=relaxed/simple;
	bh=oRXHUinoN0Vb9Ek70jBGekazwru16o3uYGFUAZWbNYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WBImPmjn2cG2+MJLd46STD7aiuDK6cMfj8I5hXqcvxuTXn0HDf3UObhYuKcAXkMbaOnlz7zlA/qnLDy2hlh6harl8n3ZtOzYKHk8YmARlQ1uo3HaOAjb56+VDiaJjXRaCLCqQcE7zi3Uvgf+JguZnRNI714GM5n4Qs0xbrlCrdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLo1Je5E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLo1Je5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728284136; x=1759820136;
  h=date:from:to:cc:subject:message-id;
  bh=oRXHUinoN0Vb9Ek70jBGekazwru16o3uYGFUAZWbNYk=;
  b=nLo1Je5EOVol+BJgRIKtHrwQyPIYDEOYFHLUEmG9+2FvDed5n78aJ7Rp
   B994Qk7+DZio4ZwKhPYAV5ul8fIbR5zoV6hrnX5sAi4/sEF/oBONsOp/I
   WH2lIEvmG2pvsXzNjnZmqmcNXYu4NP7fKlcRLSfUGeyeFmAOLtNoAltXi
   2oc2JIXqtrkTI3xCNNYvV18LUrlvOcqp6bKVmROdZVvn9yJe94W4097AI
   qP9zbbz5b6XzEynZkJt0S0bc8ar7x21/unYTCjXfaxgSztXRbA4r4cSF+
   gEQMke3d0XYvma60l/9jw+R2foJOoW4y6OdC9K5R+l8DfuiWk9HIXjWJt
   w==;
X-CSE-ConnectionGUID: xRi/EzuyRYqlH1lJDiBJGA==
X-CSE-MsgGUID: ATDYF5jRT8eVfq2pm6n1FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38549112"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="38549112"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 23:55:36 -0700
X-CSE-ConnectionGUID: m0g8Wcy5RJ+1AxBZtBfV8Q==
X-CSE-MsgGUID: /W9sLi38Qyes/DhSO/N1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="112846495"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:55:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxheV-0004hM-3D;
	Mon, 07 Oct 2024 06:55:31 +0000
Date: Mon, 07 Oct 2024 14:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 6d61859bbe7682304626e8ad13489b418f2e8175
Message-ID: <202410071420.hQLubWFL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 6d61859bbe7682304626e8ad13489b418f2e8175  bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR

elapsed time: 755m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                          ep93xx_defconfig    gcc-14.1.0
arm                          pxa910_defconfig    gcc-14.1.0
arm                        realview_defconfig    gcc-14.1.0
arm                        spear6xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241007    clang-18
i386        buildonly-randconfig-002-20241007    clang-18
i386        buildonly-randconfig-003-20241007    clang-18
i386        buildonly-randconfig-004-20241007    clang-18
i386        buildonly-randconfig-005-20241007    clang-18
i386        buildonly-randconfig-006-20241007    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241007    clang-18
i386                  randconfig-002-20241007    clang-18
i386                  randconfig-003-20241007    clang-18
i386                  randconfig-004-20241007    clang-18
i386                  randconfig-005-20241007    clang-18
i386                  randconfig-006-20241007    clang-18
i386                  randconfig-011-20241007    clang-18
i386                  randconfig-012-20241007    clang-18
i386                  randconfig-013-20241007    clang-18
i386                  randconfig-014-20241007    clang-18
i386                  randconfig-015-20241007    clang-18
i386                  randconfig-016-20241007    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           gcw0_defconfig    gcc-14.1.0
mips                     loongson1c_defconfig    gcc-14.1.0
mips                      loongson3_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           alldefconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    gcc-14.1.0
sh                           se7724_defconfig    gcc-14.1.0
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                generic_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
