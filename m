Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B923AB87
	for <mhi@lists.linux.dev>; Wed, 31 Dec 2025 23:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767223163; cv=none; b=JK8W/0oZGe/5LLIw2pth13nkDb83JHcXe98QuYtM5mXMSZlq/3Jy4lZSnPBiw8y3os7LgZRLkn6h4sR5DzI1HLSpev74P0W6gOXgWAg0iB2wWonDOs4Oe4/JmApVf3Eyv4kyeSfPM1EUcWhBJQI76tdLRQItnBfJaJ5aTXA7zNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767223163; c=relaxed/simple;
	bh=Xvv+sR2pwgrjmyUmldx6mgduDfEQpba3m7wgWXlv96k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I4LS0NgcLMic+itaJiHYvqLY6Goub6eWGU86aTQYNB6FsfFlOMj0n/SFIA3ew4ye5V2StNl72Lq9cZ0CQF7eZBGM/UstJVHqF9lv5wnD039CAgjY8ThuGF1HXfZ60lp6lBSvSAg3N/bpxufu6sUkVsvLWXnZjRAXPk8CwjfcBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ezb4GeSx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ezb4GeSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767223161; x=1798759161;
  h=date:from:to:cc:subject:message-id;
  bh=Xvv+sR2pwgrjmyUmldx6mgduDfEQpba3m7wgWXlv96k=;
  b=Ezb4GeSx4TyTFMJQ5yo2tM545iQUsXM2gbrPPS86mUmshBHnTe8aB8hS
   /0aiY3exrEIPrp2JIi0jhGAX+DSv2i0ZfvAjmoms4Tsoqeee395TfHGHT
   jMP2DeGE/JM6I9qlKv3oQtZY86FAF8mqAXKXHG97SHSmmxmrQLpSFZTyZ
   SFg5rrkUTXa+v6rMkcx4IfxWag20fpF2Yxuilm+ncaYkUTbanDf7dq9c2
   eHyR5aiL6KvsrksmqyogcoJJgsRsAPSV3zt08YyDcHm+9KgmhtVkOAGOd
   8A8r0Ea2tsDFcdysjqq9L6lNyY2GhForvDmNrT/p67Dx72SzD8SH7oo4G
   Q==;
X-CSE-ConnectionGUID: y1Ewm1e+STyUS3KbIEbEhQ==
X-CSE-MsgGUID: mrR90l7ZQ22wce8PC/CUwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68721025"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68721025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 15:19:20 -0800
X-CSE-ConnectionGUID: wtzrnamQSyCh3LpHsTJAfQ==
X-CSE-MsgGUID: 3aLCMPZnS/uNNotVPUAtEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="206404770"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Dec 2025 15:19:19 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb5TI-000000001XZ-3pMX;
	Wed, 31 Dec 2025 23:19:16 +0000
Date: Thu, 01 Jan 2026 07:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 91a0b0dce350766675961892ba4431363c4e29f7
Message-ID: <202601010749.Fh1zqdEc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 91a0b0dce350766675961892ba4431363c4e29f7  bus: mhi: ep: Use bus callbacks for .probe() and .remove()

elapsed time: 731m

configs tested: 173
configs skipped: 4

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
arc                   randconfig-001-20251231    gcc-11.5.0
arc                   randconfig-002-20251231    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251231    gcc-12.5.0
arm                   randconfig-002-20251231    clang-22
arm                   randconfig-003-20251231    gcc-8.5.0
arm                   randconfig-004-20251231    clang-19
arm                           sama5_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251231    clang-22
arm64                 randconfig-002-20251231    clang-19
arm64                 randconfig-003-20251231    gcc-8.5.0
arm64                 randconfig-004-20251231    gcc-13.4.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251231    gcc-14.3.0
csky                  randconfig-002-20251231    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251231    clang-22
hexagon               randconfig-002-20251231    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260101    gcc-14
i386        buildonly-randconfig-002-20260101    gcc-14
i386        buildonly-randconfig-003-20260101    gcc-14
i386        buildonly-randconfig-004-20251231    gcc-14
i386        buildonly-randconfig-004-20260101    gcc-14
i386        buildonly-randconfig-005-20260101    clang-20
i386        buildonly-randconfig-006-20260101    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260101    gcc-12
i386                  randconfig-002-20260101    clang-20
i386                  randconfig-003-20260101    clang-20
i386                  randconfig-004-20260101    clang-20
i386                  randconfig-005-20260101    gcc-14
i386                  randconfig-006-20260101    gcc-14
i386                  randconfig-007-20260101    gcc-14
i386                  randconfig-011-20251231    gcc-14
i386                  randconfig-012-20251231    clang-20
i386                  randconfig-013-20251231    gcc-13
i386                  randconfig-014-20251231    gcc-14
i386                  randconfig-015-20251231    gcc-13
i386                  randconfig-016-20251231    clang-20
i386                  randconfig-017-20251231    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251231    gcc-12.5.0
loongarch             randconfig-002-20251231    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                  decstation_64_defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251231    gcc-8.5.0
nios2                 randconfig-002-20251231    gcc-10.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251231    gcc-8.5.0
parisc                randconfig-002-20251231    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251231    gcc-8.5.0
powerpc               randconfig-002-20251231    clang-22
powerpc64             randconfig-001-20251231    clang-16
powerpc64             randconfig-002-20251231    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260101    clang-22
s390                  randconfig-002-20260101    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20260101    gcc-15.1.0
sh                    randconfig-002-20260101    gcc-15.1.0
sh                          rsk7264_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251231    gcc-11.5.0
sparc                 randconfig-001-20260101    gcc-11.5.0
sparc                 randconfig-002-20251231    gcc-13.4.0
sparc                 randconfig-002-20260101    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260101    clang-22
sparc64               randconfig-002-20251231    clang-20
sparc64               randconfig-002-20260101    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260101    clang-18
um                    randconfig-002-20260101    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251231    gcc-14
x86_64      buildonly-randconfig-002-20251231    gcc-14
x86_64      buildonly-randconfig-003-20251231    gcc-14
x86_64      buildonly-randconfig-005-20251231    gcc-14
x86_64      buildonly-randconfig-006-20251231    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251231    gcc-13
x86_64                randconfig-001-20260101    clang-20
x86_64                randconfig-002-20260101    clang-20
x86_64                randconfig-003-20251231    clang-20
x86_64                randconfig-003-20260101    clang-20
x86_64                randconfig-004-20251231    clang-20
x86_64                randconfig-004-20260101    clang-20
x86_64                randconfig-005-20260101    gcc-14
x86_64                randconfig-006-20260101    gcc-14
x86_64                randconfig-011-20251231    clang-20
x86_64                randconfig-012-20251231    gcc-14
x86_64                randconfig-013-20251231    gcc-14
x86_64                randconfig-014-20251231    gcc-12
x86_64                randconfig-015-20251231    gcc-14
x86_64                randconfig-016-20251231    gcc-14
x86_64                randconfig-071-20251231    clang-20
x86_64                randconfig-071-20260101    gcc-14
x86_64                randconfig-072-20260101    gcc-14
x86_64                randconfig-073-20260101    clang-20
x86_64                randconfig-074-20260101    clang-20
x86_64                randconfig-075-20260101    gcc-14
x86_64                randconfig-076-20260101    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20260101    gcc-12.5.0
xtensa                randconfig-002-20260101    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
