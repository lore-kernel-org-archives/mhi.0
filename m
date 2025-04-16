Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A7D22FF2D
	for <mhi@lists.linux.dev>; Wed, 16 Apr 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792755; cv=none; b=OqtCpCFMt8WOufIgX51rtz3IS0ua8jKpU12PLd1PsjbSm7heZBSQvOBK/7vGDjhPlxd/oNI2kYFv9Tx6ZvaC3OxU9JBwne2veS9+dWDOhGY0wrPYKok4NLpMK2ywULi9gWG/Z3NPLGkM3G9bY6FriyPXUNkYtOfW35IFl7QaAV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792755; c=relaxed/simple;
	bh=VZXfWnNt7bEU3f8Mf/zMlIxotHSDK4pn97e0Su4QUUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZmN6eAiL6WrRsMn9WEd2NR6RrrUFbnTvkA3UWIwF146UOCfBhVDm1mLPkrdFp7VYDnR3Emph/3AdwFgP/U/UQHjzLDDOT1dN51oWFMlDnLm0b/kP5DE49sFdifNyxpUdfcIrHZOiR4hXK8/lDnMaETcGPBy3XXlOfjDvAPOGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d52EDixE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d52EDixE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744792754; x=1776328754;
  h=date:from:to:cc:subject:message-id;
  bh=VZXfWnNt7bEU3f8Mf/zMlIxotHSDK4pn97e0Su4QUUc=;
  b=d52EDixEAcAygGkLIf69vZM+RYurrye5/KFFFsZeo6ETIKCPJVuil3RV
   7tyE9SuAOShbPgleV8oXdK6bCHYNBfbTtjPKXCh9HLkg2Dr6OqOiwTwac
   EEvM57qsHcIn0jw2+czNKtfY/A6vnvP8DQVOjEBhcBYPl0i29xqO0B+Sf
   sKsH6IObGOFLsb32fhqHGBBedzy5VgOdXGaxBPPoPcQbpD/8kqyHessga
   ivyATor81qX4dJzSBIdqYjcwtDbMrYEy1R3Ur+keotNBmJ+DWbGWoadp6
   wIwdVo+el2GbICbR67uyfLmQOp+D5jfQIRupyDA7TZEc9RonTluXk8fla
   A==;
X-CSE-ConnectionGUID: GotPFLABQleho/1OVsrj7A==
X-CSE-MsgGUID: 7dSzRnEgQ8mCJSQ9ZpC4Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50128504"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="50128504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:39:14 -0700
X-CSE-ConnectionGUID: vgwZ/GZuSKmOhEWlbV163Q==
X-CSE-MsgGUID: RpYBCyPSSHuyE5BsnBv00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135231032"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 01:39:12 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4yIY-000JM8-0U;
	Wed, 16 Apr 2025 08:39:10 +0000
Date: Wed, 16 Apr 2025 16:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-fixes] BUILD SUCCESS
 9fff23899ca43cf07af0b59a8096368013b4946a
Message-ID: <202504161644.XyEHvfyy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-fixes
branch HEAD: 9fff23899ca43cf07af0b59a8096368013b4946a  bus: mhi: ep: Update read pointer only after buffer is written

elapsed time: 1451m

configs tested: 113
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250415    gcc-14.2.0
arc                   randconfig-002-20250415    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                   randconfig-001-20250415    clang-21
arm                   randconfig-002-20250415    clang-21
arm                   randconfig-003-20250415    gcc-10.5.0
arm                   randconfig-004-20250415    gcc-6.5.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250415    clang-16
arm64                 randconfig-002-20250415    gcc-7.5.0
arm64                 randconfig-003-20250415    gcc-9.5.0
arm64                 randconfig-004-20250415    gcc-9.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250415    gcc-13.3.0
csky                  randconfig-002-20250415    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250415    clang-20
hexagon               randconfig-002-20250415    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250415    clang-20
i386        buildonly-randconfig-002-20250415    clang-20
i386        buildonly-randconfig-003-20250415    clang-20
i386        buildonly-randconfig-004-20250415    clang-20
i386        buildonly-randconfig-005-20250415    gcc-12
i386        buildonly-randconfig-006-20250415    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250415    gcc-14.2.0
loongarch             randconfig-002-20250415    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250415    gcc-13.3.0
nios2                 randconfig-002-20250415    gcc-7.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250415    gcc-12.4.0
parisc                randconfig-002-20250415    gcc-10.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250415    gcc-5.5.0
powerpc               randconfig-002-20250415    clang-17
powerpc               randconfig-003-20250415    gcc-7.5.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250415    gcc-7.5.0
powerpc64             randconfig-002-20250415    clang-17
powerpc64             randconfig-003-20250415    gcc-10.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250415    gcc-14.2.0
riscv                 randconfig-002-20250415    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250415    clang-21
s390                  randconfig-002-20250415    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250415    gcc-11.5.0
sh                    randconfig-002-20250415    gcc-9.3.0
sh                           se7206_defconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250415    gcc-6.5.0
sparc                 randconfig-002-20250415    gcc-12.4.0
sparc64               randconfig-001-20250415    gcc-14.2.0
sparc64               randconfig-002-20250415    gcc-12.4.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250415    clang-21
um                    randconfig-002-20250415    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250415    clang-20
x86_64      buildonly-randconfig-002-20250415    gcc-11
x86_64      buildonly-randconfig-003-20250415    gcc-12
x86_64      buildonly-randconfig-004-20250415    clang-20
x86_64      buildonly-randconfig-005-20250415    clang-20
x86_64      buildonly-randconfig-006-20250415    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250415    gcc-6.5.0
xtensa                randconfig-002-20250415    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
