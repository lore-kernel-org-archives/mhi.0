Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335C2AD22
	for <mhi@lists.linux.dev>; Wed,  9 Jul 2025 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752041271; cv=none; b=r34wIski06qAelmAkvuEkkjYcDQLJNrmGx55RMALfYvqJAjPxgRSF3Ms8xpUXK5EvyuySFctJosB8oCz+gtqCLZm/jRfiV1iZr+5LN1kbpfxI2AjCtv+h9+HdnfzN+wbA3s00VOfUYhCDKAD3OH/Jupx6vSU1wU7U7QZfsTev3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752041271; c=relaxed/simple;
	bh=EPRxsOV6xGB4LJtLGcYRq9ai1AjY/G6bYkXuA3L0L34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mFmxzEUFEjtuCpJTuib1iX2FDIpCjCsr3M/Gx5VjSdc7cb9ONx+L8as6bPXIzrMuMANBnIJ05cVhhro+49nN5af/CduXcucwCwYRvdAW/4HWeC4Y20ahvEFkWpJP/IWq1B6uM9yjwGNhhH4em+kML0VPyhhc8kdkXhQK6x+vvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7OFGidu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7OFGidu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752041269; x=1783577269;
  h=date:from:to:cc:subject:message-id;
  bh=EPRxsOV6xGB4LJtLGcYRq9ai1AjY/G6bYkXuA3L0L34=;
  b=X7OFGidu0Y5e2M/y21IDL6lxhK4L+X3h+INHHaY68EpkXy8JsOhk7fhn
   Z42VnCb3OVgqQdOKgo7z4RavqMVmOil/LIgbyAaCTPunqnlxV+QqWDume
   i6JVgLYc4Acw0Z2ZanUxL1pAWjf/ShLB6QVOfFqoFH9uDnFzelyTcxNaw
   YYE9UoRFqCQARrCitLkLwLXAKjSZR+e1Zk4SJJX3qRGCcWIZVSKT84xJe
   2r3YKcbNORRoQpd38eTyrgKB1s3ZylrjAgrY3MYeBjgGzrl/zPR/ujkGJ
   4GtBNI1xy5ttCJAQqvPtfdKxC9ZmooJ9DmzjFfaxlEuCzLlkczu07/zKh
   Q==;
X-CSE-ConnectionGUID: 1lnIOf3ZQ3iK5fpulk9r7w==
X-CSE-MsgGUID: 7TYmwwe2T1GMngUla6eBxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53505321"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="53505321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 23:07:49 -0700
X-CSE-ConnectionGUID: QohIQMVbQYOYF1yoO2aGgQ==
X-CSE-MsgGUID: 7Bs7hx/ZRO+GH5qDJsftog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="159719510"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2025 23:07:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZNy5-0003A3-2u;
	Wed, 09 Jul 2025 06:07:45 +0000
Date: Wed, 09 Jul 2025 14:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 7a793ba2cc4a9ef59ab290d50cd847d314514323
Message-ID: <202507091409.eerzXNt2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 7a793ba2cc4a9ef59ab290d50cd847d314514323  bus: mhi: host: pci_generic: Add Foxconn T99W696 modem

elapsed time: 1020m

configs tested: 225
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-21
arc                              allyesconfig    clang-19
arc                   randconfig-001-20250708    gcc-13.4.0
arc                   randconfig-001-20250709    gcc-10.5.0
arc                   randconfig-002-20250708    gcc-8.5.0
arc                   randconfig-002-20250709    gcc-10.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                           imxrt_defconfig    gcc-15.1.0
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250708    clang-21
arm                   randconfig-001-20250709    gcc-10.5.0
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-002-20250709    gcc-10.5.0
arm                   randconfig-003-20250708    gcc-10.5.0
arm                   randconfig-003-20250709    gcc-10.5.0
arm                   randconfig-004-20250708    clang-21
arm                   randconfig-004-20250709    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                 randconfig-001-20250708    gcc-9.5.0
arm64                 randconfig-001-20250709    gcc-10.5.0
arm64                 randconfig-002-20250708    clang-19
arm64                 randconfig-002-20250709    gcc-10.5.0
arm64                 randconfig-003-20250708    clang-21
arm64                 randconfig-003-20250709    gcc-10.5.0
arm64                 randconfig-004-20250708    gcc-8.5.0
arm64                 randconfig-004-20250709    gcc-10.5.0
csky                              allnoconfig    clang-21
csky                  randconfig-001-20250708    gcc-13.4.0
csky                  randconfig-001-20250709    gcc-14.2.0
csky                  randconfig-002-20250708    gcc-15.1.0
csky                  randconfig-002-20250709    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250708    clang-21
hexagon               randconfig-001-20250709    gcc-14.2.0
hexagon               randconfig-002-20250708    clang-21
hexagon               randconfig-002-20250709    gcc-14.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250708    clang-20
i386        buildonly-randconfig-001-20250709    clang-20
i386        buildonly-randconfig-002-20250708    clang-20
i386        buildonly-randconfig-002-20250709    clang-20
i386        buildonly-randconfig-003-20250708    clang-20
i386        buildonly-randconfig-003-20250709    clang-20
i386        buildonly-randconfig-004-20250708    gcc-12
i386        buildonly-randconfig-004-20250709    clang-20
i386        buildonly-randconfig-005-20250708    clang-20
i386        buildonly-randconfig-005-20250709    clang-20
i386        buildonly-randconfig-006-20250708    clang-20
i386        buildonly-randconfig-006-20250709    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250709    clang-20
i386                  randconfig-002-20250709    clang-20
i386                  randconfig-003-20250709    clang-20
i386                  randconfig-004-20250709    clang-20
i386                  randconfig-005-20250709    clang-20
i386                  randconfig-006-20250709    clang-20
i386                  randconfig-007-20250709    clang-20
i386                  randconfig-011-20250709    clang-20
i386                  randconfig-012-20250709    clang-20
i386                  randconfig-013-20250709    clang-20
i386                  randconfig-014-20250709    clang-20
i386                  randconfig-015-20250709    clang-20
i386                  randconfig-016-20250709    clang-20
i386                  randconfig-017-20250709    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250708    clang-21
loongarch             randconfig-001-20250709    gcc-14.2.0
loongarch             randconfig-002-20250708    clang-21
loongarch             randconfig-002-20250709    gcc-14.2.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-001-20250709    gcc-14.2.0
nios2                 randconfig-002-20250708    gcc-8.5.0
nios2                 randconfig-002-20250709    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250708    gcc-9.3.0
parisc                randconfig-001-20250709    gcc-14.2.0
parisc                randconfig-002-20250708    gcc-14.3.0
parisc                randconfig-002-20250709    gcc-14.2.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-001-20250709    gcc-14.2.0
powerpc               randconfig-002-20250708    clang-19
powerpc               randconfig-002-20250709    gcc-14.2.0
powerpc               randconfig-003-20250708    clang-21
powerpc               randconfig-003-20250709    gcc-14.2.0
powerpc64             randconfig-001-20250708    clang-21
powerpc64             randconfig-001-20250709    gcc-14.2.0
powerpc64             randconfig-002-20250708    clang-21
powerpc64             randconfig-002-20250709    gcc-14.2.0
powerpc64             randconfig-003-20250708    clang-21
powerpc64             randconfig-003-20250709    gcc-14.2.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250708    clang-16
riscv                 randconfig-001-20250709    gcc-12
riscv                 randconfig-002-20250708    gcc-11.5.0
riscv                 randconfig-002-20250709    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250708    gcc-14.3.0
s390                  randconfig-001-20250709    gcc-12
s390                  randconfig-002-20250708    gcc-9.3.0
s390                  randconfig-002-20250709    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250708    gcc-11.5.0
sh                    randconfig-001-20250709    gcc-12
sh                    randconfig-002-20250708    gcc-15.1.0
sh                    randconfig-002-20250709    gcc-12
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250708    gcc-13.4.0
sparc                 randconfig-001-20250709    gcc-12
sparc                 randconfig-002-20250708    gcc-13.4.0
sparc                 randconfig-002-20250709    gcc-12
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250708    clang-21
sparc64               randconfig-001-20250709    gcc-12
sparc64               randconfig-002-20250708    gcc-15.1.0
sparc64               randconfig-002-20250709    gcc-12
um                               alldefconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250708    clang-21
um                    randconfig-001-20250709    gcc-12
um                    randconfig-002-20250708    clang-17
um                    randconfig-002-20250709    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-001-20250709    clang-20
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250709    clang-20
x86_64      buildonly-randconfig-003-20250708    clang-20
x86_64      buildonly-randconfig-003-20250709    clang-20
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-004-20250709    clang-20
x86_64      buildonly-randconfig-005-20250708    clang-20
x86_64      buildonly-randconfig-005-20250709    clang-20
x86_64      buildonly-randconfig-006-20250708    clang-20
x86_64      buildonly-randconfig-006-20250709    clang-20
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250709    clang-20
x86_64                randconfig-002-20250709    clang-20
x86_64                randconfig-003-20250709    clang-20
x86_64                randconfig-004-20250709    clang-20
x86_64                randconfig-005-20250709    clang-20
x86_64                randconfig-006-20250709    clang-20
x86_64                randconfig-007-20250709    clang-20
x86_64                randconfig-008-20250709    clang-20
x86_64                randconfig-071-20250709    gcc-12
x86_64                randconfig-072-20250709    gcc-12
x86_64                randconfig-073-20250709    gcc-12
x86_64                randconfig-074-20250709    gcc-12
x86_64                randconfig-075-20250709    gcc-12
x86_64                randconfig-076-20250709    gcc-12
x86_64                randconfig-077-20250709    gcc-12
x86_64                randconfig-078-20250709    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250708    gcc-8.5.0
xtensa                randconfig-001-20250709    gcc-12
xtensa                randconfig-002-20250708    gcc-9.3.0
xtensa                randconfig-002-20250709    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
