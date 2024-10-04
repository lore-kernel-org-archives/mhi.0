Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92C175AD
	for <mhi@lists.linux.dev>; Fri,  4 Oct 2024 04:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728014525; cv=none; b=pvdzqpbw+jUUw7DRysSSvOIBJ0nB1M8u2WtfwHw4jRq8BRGoYLBl1pCejnajpktWCvcEGrPhUg44A3uDtfcmCR9+6ajtcQihrnvTe7YVWL3PU2Mp969rQ9QxYNq/Z+2te8B+lVzqYT6L6lFK6IfOMOhC1dJYgekma1BNNqSmakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728014525; c=relaxed/simple;
	bh=odPloYd4eoOIDkLuIltcZCYkb2kxMKhnRHZUSOdc15c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gEXb+Q04PRAxz8oDyMzXRIi78DymHtQ4uzsGKvQjR/SSNwfInJq9ct8EdvMQc5yF+LbducDnl96EYla3QKG5cq9S83pGS/tPwTDsE23w0JEyhnJ4I8paPSAyp2ab4aHb3yppIdbIXaIBoJiEpgrCha5I5UCtB3tZqnJoLyv3tgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkb1BhcA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkb1BhcA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728014524; x=1759550524;
  h=date:from:to:cc:subject:message-id;
  bh=odPloYd4eoOIDkLuIltcZCYkb2kxMKhnRHZUSOdc15c=;
  b=hkb1BhcAgQEqySsfufyaIxGwq9K6Xu2jyrjjq6eHJ0vsAymv4LJLfjgX
   QD7BSByjiBETnybnvjR3tN0nJGkKDzMghemagUn9HYKFDbACqU/tbbSxh
   ZbFVoeYsQkLP8uVs9Bi5bY/YjStVevGk/d8e/TWvcrGtOm3nKElkPRWls
   +cbogQEgdKuJfNS5O+NWvcClLsfgE8Lkpn+t4uyDoSt/Xl7lSz5H9HnFl
   LyFDZ3kdOczQpQzSvwnxZfC8cD7yYdlW1b3ehY8FsaY5K4lEZFBi5cn3Z
   +KCW4MF6r12eDHaqhxku5FVjGcG/TX9kjhCQi3Wy1l0I3hoILgRzIA9M2
   A==;
X-CSE-ConnectionGUID: 1t8IZlMNQ+SmPSfmIgty/g==
X-CSE-MsgGUID: WrhMmXHnSz6bA16BguoZEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27400647"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27400647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 21:02:03 -0700
X-CSE-ConnectionGUID: S5jEV/pqSRuVYjV+L91jSQ==
X-CSE-MsgGUID: QH4qfryPTPWcR9ND62RArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74887061"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 21:02:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swZVw-0001CV-0g;
	Fri, 04 Oct 2024 04:02:00 +0000
Date: Fri, 04 Oct 2024 12:01:56 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 8daf110a44e744664f5f4158ac5e1302ee0e2081
Message-ID: <202410041243.7CyJrPr4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 8daf110a44e744664f5f4158ac5e1302ee0e2081  bus: mhi: host: Fix typos in the comments

elapsed time: 1302m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsimosci_defconfig    clang-20
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          gemini_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241004    clang-18
i386        buildonly-randconfig-002-20241004    clang-18
i386        buildonly-randconfig-002-20241004    gcc-12
i386        buildonly-randconfig-003-20241004    clang-18
i386        buildonly-randconfig-003-20241004    gcc-12
i386        buildonly-randconfig-004-20241004    clang-18
i386        buildonly-randconfig-004-20241004    gcc-12
i386        buildonly-randconfig-005-20241004    clang-18
i386        buildonly-randconfig-006-20241004    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241004    clang-18
i386                  randconfig-001-20241004    gcc-12
i386                  randconfig-002-20241004    clang-18
i386                  randconfig-003-20241004    clang-18
i386                  randconfig-003-20241004    gcc-12
i386                  randconfig-004-20241004    clang-18
i386                  randconfig-004-20241004    gcc-12
i386                  randconfig-005-20241004    clang-18
i386                  randconfig-005-20241004    gcc-12
i386                  randconfig-006-20241004    clang-18
i386                  randconfig-006-20241004    gcc-12
i386                  randconfig-011-20241004    clang-18
i386                  randconfig-012-20241004    clang-18
i386                  randconfig-013-20241004    clang-18
i386                  randconfig-014-20241004    clang-18
i386                  randconfig-014-20241004    gcc-12
i386                  randconfig-015-20241004    clang-18
i386                  randconfig-016-20241004    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme16x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           jazz_defconfig    clang-20
mips                    maltaup_xpa_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                     tqm8560_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
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
sh                               j2_defconfig    clang-20
sh                          rsk7264_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7751_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
