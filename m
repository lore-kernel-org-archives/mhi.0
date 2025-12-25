Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75226ED3C
	for <mhi@lists.linux.dev>; Thu, 25 Dec 2025 04:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766635653; cv=none; b=fVaqpMB6BY6FrLrG9K/TzGyNFeSBThUVYZeTDXiXDGR+Lq92fUsz2DW6eldLHZegGDeRW2BAsw0a1CWuYQKJINLN0ersAVXRvWo+1NMqoZDm3lcWhglOiPnUs+VstiYyA+LYZtNDtfUmh9GlA0HuEEkvFD3i2mY9+WC/SrqT0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766635653; c=relaxed/simple;
	bh=U5PFQpWjyrveppKbvdUVYE7oFGFucWmYLqg0pYYCLew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hbsJtoB4igxuatPd1E6YE7TFkD3YM9iwUoSR6NtIVx6msvl1s5aFpe/CjssUtbM06fj/CL1HqfdNFyGlYwIKOJ/af8GfJ2nsQnpWyrmPXBxu5NTr9ZjFTP39TN5PcbSUH2Id3vdxzr25WKDZjbelGqjEmfMZ0nFQ/94LAu/N+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCFDiXW3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCFDiXW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766635651; x=1798171651;
  h=date:from:to:cc:subject:message-id;
  bh=U5PFQpWjyrveppKbvdUVYE7oFGFucWmYLqg0pYYCLew=;
  b=DCFDiXW35+6oCa0AngsDSXpnvOgaWNXZIT7Lhp426upSaLbmcHwzr1Ba
   v7yX6Az7lS85Mmvn2R1UhA9KuEkfiLGm3YqIzITQva+ipxfM6dHPrhrdj
   WH+TMrPJrAVDE2JbBuJ6LjD2rHEFH3nYt2sAAJxga05ODT8Yu7a29aBy/
   cJR69ioU0X39n9q4Z0UQ/KK3Kn09pKZ33lvlgxZdACu3d2BcYUBStwkuq
   2fMVbf1Gfn4SKmYZ/EqmxkMNjCumOD3dqvZhK35Dk3vACP+0WGWjK9Roi
   zOO7ajHZUo0WFa3HOojyxRTAURmjVU4WQVaC1Gf5EaKnGMN67l0UTGhlS
   w==;
X-CSE-ConnectionGUID: cKCglvIiQA+xRr6CWia7rg==
X-CSE-MsgGUID: UVQuylP7QR2/qTxDxEaprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67646930"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="67646930"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:07:30 -0800
X-CSE-ConnectionGUID: wQZz1XZrS4WP4qZwguOIow==
X-CSE-MsgGUID: u8te8DmoR+6aORDg/Wjq0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199292285"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Dec 2025 20:07:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYcdK-000000003iV-1R0M;
	Thu, 25 Dec 2025 04:07:26 +0000
Date: Thu, 25 Dec 2025 12:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 820c866c42de99e7d65c7bd1f591f067dbbe3cae
Message-ID: <202512251209.rmwhVyAq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 820c866c42de99e7d65c7bd1f591f067dbbe3cae  mhi: host: Add support for loading dual ELF image format

elapsed time: 1349m

configs tested: 236
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251225    gcc-11.5.0
arc                   randconfig-002-20251225    gcc-11.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          exynos_defconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20251225    clang-22
arm                   randconfig-001-20251225    gcc-11.5.0
arm                   randconfig-002-20251225    gcc-11.5.0
arm                   randconfig-002-20251225    gcc-12.5.0
arm                   randconfig-003-20251225    clang-22
arm                   randconfig-003-20251225    gcc-11.5.0
arm                   randconfig-004-20251225    clang-22
arm                   randconfig-004-20251225    gcc-11.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                           spitz_defconfig    gcc-15.1.0
arm                           tegra_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251224    gcc-8.5.0
arm64                 randconfig-001-20251225    gcc-11.5.0
arm64                 randconfig-002-20251224    gcc-14.3.0
arm64                 randconfig-002-20251225    gcc-11.5.0
arm64                 randconfig-003-20251224    clang-17
arm64                 randconfig-003-20251225    gcc-11.5.0
arm64                 randconfig-004-20251224    gcc-10.5.0
arm64                 randconfig-004-20251225    gcc-11.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251224    gcc-15.1.0
csky                  randconfig-001-20251225    gcc-11.5.0
csky                  randconfig-002-20251224    gcc-15.1.0
csky                  randconfig-002-20251225    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251224    clang-22
hexagon               randconfig-001-20251225    clang-22
hexagon               randconfig-002-20251224    clang-22
hexagon               randconfig-002-20251225    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251224    clang-20
i386        buildonly-randconfig-002-20251224    gcc-14
i386        buildonly-randconfig-003-20251224    clang-20
i386        buildonly-randconfig-004-20251224    gcc-12
i386        buildonly-randconfig-005-20251224    gcc-14
i386        buildonly-randconfig-006-20251224    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251224    gcc-14
i386                  randconfig-002-20251224    gcc-14
i386                  randconfig-003-20251224    gcc-14
i386                  randconfig-004-20251224    gcc-12
i386                  randconfig-005-20251224    clang-20
i386                  randconfig-006-20251224    clang-20
i386                  randconfig-007-20251224    gcc-14
i386                  randconfig-011-20251224    clang-20
i386                  randconfig-012-20251224    clang-20
i386                  randconfig-013-20251224    clang-20
i386                  randconfig-014-20251224    clang-20
i386                  randconfig-015-20251224    clang-20
i386                  randconfig-016-20251224    clang-20
i386                  randconfig-017-20251224    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251224    gcc-15.1.0
loongarch             randconfig-001-20251225    clang-22
loongarch             randconfig-002-20251224    gcc-12.5.0
loongarch             randconfig-002-20251225    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
m68k                        stmark2_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           gcw0_defconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251224    gcc-11.5.0
nios2                 randconfig-001-20251225    clang-22
nios2                 randconfig-002-20251224    gcc-11.5.0
nios2                 randconfig-002-20251225    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251224    gcc-8.5.0
parisc                randconfig-001-20251225    clang-22
parisc                randconfig-002-20251224    gcc-9.5.0
parisc                randconfig-002-20251225    clang-22
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                      pmac32_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251224    clang-22
powerpc               randconfig-001-20251225    clang-22
powerpc               randconfig-002-20251224    clang-22
powerpc               randconfig-002-20251225    clang-22
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251224    gcc-8.5.0
powerpc64             randconfig-001-20251225    clang-22
powerpc64             randconfig-002-20251224    gcc-13.4.0
powerpc64             randconfig-002-20251225    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251224    gcc-8.5.0
riscv                 randconfig-002-20251224    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251224    gcc-10.5.0
s390                  randconfig-002-20251224    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251224    gcc-14.3.0
sh                    randconfig-002-20251224    gcc-10.5.0
sh                           se7724_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251225    gcc-8.5.0
sparc                 randconfig-002-20251225    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251225    gcc-9.5.0
sparc64               randconfig-002-20251225    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251225    gcc-13
um                    randconfig-002-20251225    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251224    clang-20
x86_64      buildonly-randconfig-001-20251225    gcc-14
x86_64      buildonly-randconfig-002-20251224    gcc-14
x86_64      buildonly-randconfig-002-20251225    gcc-14
x86_64      buildonly-randconfig-003-20251224    gcc-14
x86_64      buildonly-randconfig-003-20251225    gcc-14
x86_64      buildonly-randconfig-004-20251224    clang-20
x86_64      buildonly-randconfig-004-20251225    gcc-14
x86_64      buildonly-randconfig-005-20251224    gcc-14
x86_64      buildonly-randconfig-005-20251225    gcc-14
x86_64      buildonly-randconfig-006-20251224    clang-20
x86_64      buildonly-randconfig-006-20251225    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251224    clang-20
x86_64                randconfig-002-20251224    gcc-14
x86_64                randconfig-003-20251224    clang-20
x86_64                randconfig-004-20251224    gcc-14
x86_64                randconfig-005-20251224    gcc-14
x86_64                randconfig-006-20251224    gcc-14
x86_64                randconfig-014-20251224    gcc-14
x86_64                randconfig-071-20251224    clang-20
x86_64                randconfig-072-20251224    gcc-14
x86_64                randconfig-073-20251224    clang-20
x86_64                randconfig-074-20251224    gcc-14
x86_64                randconfig-075-20251224    clang-20
x86_64                randconfig-076-20251224    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251225    gcc-8.5.0
xtensa                randconfig-002-20251225    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
