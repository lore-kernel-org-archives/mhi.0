Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1718BC0F
	for <mhi@lists.linux.dev>; Thu,  9 Jan 2025 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446856; cv=none; b=GtNCAita1BKkZE3HKkJQZf1MbnRy6sbkM85h7S6HVQdfJrHbYtaHreqW6uESf93k9VSThFsOswJcRb4eJUDeGbTjwvGHOxlxpg7mAdYSQ28cs5YpphysbNcHYm8bihSGeMwvCDTBUzfSWhwViFYfB5hO7iPoMa4cCUsvei90etU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446856; c=relaxed/simple;
	bh=nwjgnF04XbYJu9hWJBatDKACdMqm+R77yCACQx7QiN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LWblnd+6RdoumukwWcnmJCiKtfD/HJP177X3XyG6Lc4KSJyVt8/z4Sjs8y4S9jEw7JKnXMgb7UyL8ytMYe1eOoRxJqgtfYUrU4KO6A6B45C3FISZKXYGFhg57HYMZjJH0KtnSiZdcDqapQz3sBYua+jEiLcirwdD4xVW4oa0mCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfXUepTV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfXUepTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736446854; x=1767982854;
  h=date:from:to:cc:subject:message-id;
  bh=nwjgnF04XbYJu9hWJBatDKACdMqm+R77yCACQx7QiN4=;
  b=DfXUepTVaYmtcrpDqzWCrtwMfT7KsvPRrximAUlslI3iIGVFU950a4XI
   cnWR2gsT4sY86NI5eWOonUcJMfgAhJwwgKpzVZ97wt0XbVvSl10Xntg0X
   fEzd7zLI47Gp1jOnrOx+2q/JAToS3wV+K3OQhqNZ7XapnHAXKkPM2OvMC
   slrBuLPLMN3uMWrCyBNxIVjs4Aub+0doTd5tS/QlWU/hqdYhaltWkf1fn
   to7f6c/3xNWKvGQBG/HyTf5eaGVViZSYhcHBpNeFGJ/eJ6H/AkpQPwaS+
   LCjiUp5lxmkISwPSm0VLBAgcbEJ/fLRLq+d5I2LhToJnnVUE7Zml9IeR1
   A==;
X-CSE-ConnectionGUID: N3hzh/ZiRqi+h9r6wMyIRA==
X-CSE-MsgGUID: /6ClD6KURtivQpOdH6faUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47302900"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47302900"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 10:20:54 -0800
X-CSE-ConnectionGUID: OaMY3RZ9R/mbafWcrlXWdA==
X-CSE-MsgGUID: VmqT++4RRNiQ4J3LWMFWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104361204"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 10:20:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVx9F-000HzF-2y;
	Thu, 09 Jan 2025 18:20:49 +0000
Date: Fri, 10 Jan 2025 02:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 29904a40127ca5df120bcbcab444ea725926b075
Message-ID: <202501100207.vbfMtCEz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 29904a40127ca5df120bcbcab444ea725926b075  bus: mhi: host: pci_generic: Enable MSI-X if the endpoint supports

elapsed time: 1449m

configs tested: 88
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250109    gcc-13.2.0
arc                   randconfig-002-20250109    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250109    gcc-14.2.0
arm                   randconfig-002-20250109    clang-17
arm                   randconfig-003-20250109    clang-20
arm                   randconfig-004-20250109    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250109    gcc-14.2.0
arm64                 randconfig-002-20250109    clang-20
arm64                 randconfig-003-20250109    gcc-14.2.0
arm64                 randconfig-004-20250109    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250109    gcc-14.2.0
csky                  randconfig-002-20250109    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250109    clang-14
hexagon               randconfig-002-20250109    clang-20
i386        buildonly-randconfig-001-20250109    gcc-12
i386        buildonly-randconfig-002-20250109    gcc-12
i386        buildonly-randconfig-003-20250109    clang-19
i386        buildonly-randconfig-004-20250109    clang-19
i386        buildonly-randconfig-005-20250109    clang-19
i386        buildonly-randconfig-006-20250109    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250109    gcc-14.2.0
loongarch             randconfig-002-20250109    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250109    gcc-14.2.0
nios2                 randconfig-002-20250109    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250109    gcc-14.2.0
parisc                randconfig-002-20250109    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250109    clang-15
powerpc               randconfig-002-20250109    gcc-14.2.0
powerpc               randconfig-003-20250109    gcc-14.2.0
powerpc64             randconfig-001-20250109    gcc-14.2.0
powerpc64             randconfig-002-20250109    clang-20
powerpc64             randconfig-003-20250109    clang-17
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250109    gcc-14.2.0
riscv                 randconfig-002-20250109    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250109    gcc-14.2.0
s390                  randconfig-002-20250109    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-14.2.0
sparc64               randconfig-001-20250109    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250109    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250109    clang-19
x86_64      buildonly-randconfig-002-20250109    gcc-12
x86_64      buildonly-randconfig-003-20250109    clang-19
x86_64      buildonly-randconfig-004-20250109    clang-19
x86_64      buildonly-randconfig-005-20250109    clang-19
x86_64      buildonly-randconfig-006-20250109    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
