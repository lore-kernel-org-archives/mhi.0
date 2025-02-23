Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3401A29A
	for <mhi@lists.linux.dev>; Sun, 23 Feb 2025 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740333634; cv=none; b=fP4uJVNdpM8pAu91HQQ/7tx85pEE6lTJhjMOm1Hj1xYwsI5tgrjExxWG3jxkQsZXuBAbvEdfzu/rUXKUyDcLa08hzEMR4rJxRFuTUmcTcavAst8kwG6SbcRqTdWU6i5LUkTDHIXbDCHBpMkvYZMau5FZz39C/CWx9LQ5HYcw3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740333634; c=relaxed/simple;
	bh=VUjdxtK9n2PTjDqTXXelZH/Xkz6OqS7EXL3B+aWVQvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=orvKmEDOI3np5h29yLBoG9HEWUasxLOTkoMey15ot5KuLbh41vBeJOWkuZ490xkRYsmpsHaLcvLSwCcYvS/NkeFTZI01W1BX1CspFFze+0WlqGsId92rEEKIelSp803/PtVUOBajwL3s2brho66o30V1nSb4RzGOU9OENU/Z/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPbHg5M2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPbHg5M2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740333633; x=1771869633;
  h=date:from:to:cc:subject:message-id;
  bh=VUjdxtK9n2PTjDqTXXelZH/Xkz6OqS7EXL3B+aWVQvw=;
  b=PPbHg5M2f4TSZPD2aVrDFIwmSaBbYRZiNzEyc4hxWRWJ1mGQz6P9THT4
   pQc/hNOz+4nhThTQM1VX0zmDwbHQlCAO33DXvGCSbIgLvhaaZknH9/9KC
   AKs49zLiIq9dUscNLcFq0ib5p1EtIsY3pj6xej2ZFZlrb+WSSPQTVhxra
   uzHEorRMn6XShVhumJcaa6DzfT0zkdHMz9PXeutTbbiCt5mWaGX7TxzJT
   AzbPqo10+asaAVsLuWy0zCrAmcg095p9vyHzjbDU+TUXcL5Ln9RTVAzzp
   NYrn/o2eXyUs4MjS3BsFb53XSsK6F1KMAnED2yRSEvF94wFUjFtQJUsIz
   g==;
X-CSE-ConnectionGUID: aPTZxMyBQ1ind2TfMGIm6Q==
X-CSE-MsgGUID: 9H8AOG+1Q4S4/771cUWH5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="51304429"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="51304429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 10:00:32 -0800
X-CSE-ConnectionGUID: +08dHd3aSSeVQKj2umZQBQ==
X-CSE-MsgGUID: ZnJ2dIefQPiSiLmbwVLdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115827855"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2025 10:00:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmGHE-0007Uy-0q;
	Sun, 23 Feb 2025 18:00:28 +0000
Date: Mon, 24 Feb 2025 02:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 cba6bdfd79291b82422b6e6b4036ebc076d5625f
Message-ID: <202502240204.SZHHdZ2I-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: cba6bdfd79291b82422b6e6b4036ebc076d5625f  bus: mhi: host: pci_generic: Add support for SA8775P endpoint

elapsed time: 1448m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20250223    gcc-13.2.0
arc                   randconfig-002-20250223    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-21
arm                   randconfig-001-20250223    gcc-14.2.0
arm                   randconfig-002-20250223    clang-21
arm                   randconfig-003-20250223    clang-19
arm                   randconfig-004-20250223    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250223    clang-21
arm64                 randconfig-002-20250223    gcc-14.2.0
arm64                 randconfig-003-20250223    clang-21
arm64                 randconfig-004-20250223    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250223    gcc-14.2.0
csky                  randconfig-002-20250223    gcc-14.2.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250223    clang-21
hexagon               randconfig-002-20250223    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250223    clang-19
i386        buildonly-randconfig-002-20250223    gcc-11
i386        buildonly-randconfig-003-20250223    gcc-12
i386        buildonly-randconfig-004-20250223    clang-19
i386        buildonly-randconfig-005-20250223    gcc-12
i386        buildonly-randconfig-006-20250223    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250223    gcc-14.2.0
loongarch             randconfig-002-20250223    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250223    gcc-14.2.0
nios2                 randconfig-002-20250223    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250223    gcc-14.2.0
parisc                randconfig-002-20250223    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                   bluestone_defconfig    clang-21
powerpc                      chrp32_defconfig    clang-21
powerpc                   motionpro_defconfig    clang-17
powerpc               randconfig-001-20250223    gcc-14.2.0
powerpc               randconfig-002-20250223    clang-17
powerpc               randconfig-003-20250223    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250223    gcc-14.2.0
powerpc64             randconfig-002-20250223    clang-21
powerpc64             randconfig-003-20250223    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250223    clang-17
riscv                 randconfig-002-20250223    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250223    clang-18
s390                  randconfig-002-20250223    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250223    gcc-14.2.0
sh                    randconfig-002-20250223    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250223    gcc-14.2.0
sparc                 randconfig-002-20250223    gcc-14.2.0
sparc64               randconfig-001-20250223    gcc-14.2.0
sparc64               randconfig-002-20250223    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250223    clang-21
um                    randconfig-002-20250223    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250223    clang-19
x86_64      buildonly-randconfig-002-20250223    gcc-12
x86_64      buildonly-randconfig-003-20250223    gcc-12
x86_64      buildonly-randconfig-004-20250223    gcc-12
x86_64      buildonly-randconfig-005-20250223    gcc-12
x86_64      buildonly-randconfig-006-20250223    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250223    gcc-14.2.0
xtensa                randconfig-002-20250223    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
