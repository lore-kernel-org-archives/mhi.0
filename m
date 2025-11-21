Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4984222597
	for <mhi@lists.linux.dev>; Fri, 21 Nov 2025 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763710468; cv=none; b=mehuBTVy5gyOlw4Rqz2Nbbgv2QTUvnMQQsri/2zoSsCtwL8ik/csXxbssgSNnMzshd7XqJSwu46LjSV0A80V7+V9jdvboG1F8hVvRTf8d7hVHmOOmuex4QIAp0U/9Aj+Nr1IXxfMr+wAHGhGATNyrM9daSFdDfq7AdW5r2yZIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763710468; c=relaxed/simple;
	bh=2NyxUsk6rO47iGHRaplF2P1wC+t0YoNkdMt69Lx3YWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a1eswOoCfOOoJskLOsFt9PsRZgIjb5bq2Uwl+JfJq0SwhsQZqv+av+IoiSe/4m7GqciVJAkHabI9DZQ1ojoDVy2oJdF2JvNirvLBxxM4cb4AgqHumj4cBB+8pIh0Tl5JPHpLlz4pyja8rDeuL1oLc+kYr8lGYLSHgC3zITEhavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ce1gvv97; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ce1gvv97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763710467; x=1795246467;
  h=date:from:to:cc:subject:message-id;
  bh=2NyxUsk6rO47iGHRaplF2P1wC+t0YoNkdMt69Lx3YWA=;
  b=ce1gvv976v9t/47DUX1pV1CC3lCQAFM5ccp9wqhvSZGSuUsXkm0WCbF2
   5Npl/ko+5KdHCJTnNwn9DP2Xfjnf8+bMqiAqklgUWtumk5y/NQRlh8LSv
   fd4aNgQwE6lehiCVDwTcyviWDx73TvD4Wtzo3iGZi47vcjMT55NzZzxPV
   up1NxFP3veOdn+xpxTMTugUqMJFGo71QDSVonEB8uu8vibOqC0oWqEDuM
   Oxupod+dkeEuRZ/1Hm5of9FQrGYJYj7+vAo2J5XWJfbrjRNVoGoP+2FVp
   Xc/1Ewd5a3wd3OEnOyI2GSo+Yl1fhjaDbXOYivER+2m+BSrD+jH0cTshQ
   w==;
X-CSE-ConnectionGUID: OsUqp4ulS3ah/674nXepvw==
X-CSE-MsgGUID: M9b5P6JKTKaGDQ4ZhtsNAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77160302"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="77160302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:34:26 -0800
X-CSE-ConnectionGUID: X4PwxlEKRvWQbRDTjRRpZw==
X-CSE-MsgGUID: UD9H02vhTNaFRjihwJVegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="190909758"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Nov 2025 23:34:25 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMLew-00054p-1G;
	Fri, 21 Nov 2025 07:34:22 +0000
Date: Fri, 21 Nov 2025 15:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 ac35e04f8000aaaf98635792464647e7a6f3422e
Message-ID: <202511211518.370eZJnE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: ac35e04f8000aaaf98635792464647e7a6f3422e  bus: mhi: host: pci_generic: Add Foxconn T99W760 modem

elapsed time: 1486m

configs tested: 127
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-15.1.0
alpha                             allnoconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                  randconfig-6001-20251120    gcc-10.5.0
arc                  randconfig-6002-20251120    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                          moxart_defconfig    gcc-15.1.0
arm                  randconfig-6001-20251120    gcc-15.1.0
arm                  randconfig-6002-20251120    clang-22
arm                  randconfig-6003-20251120    clang-22
arm                  randconfig-6004-20251120    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251121    gcc-8.5.0
arm64                 randconfig-002-20251121    clang-22
arm64                 randconfig-003-20251121    gcc-8.5.0
arm64                 randconfig-004-20251121    gcc-10.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251121    gcc-14.3.0
csky                  randconfig-002-20251121    gcc-11.5.0
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251121    clang-22
hexagon               randconfig-002-20251121    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251121    gcc-14
i386        buildonly-randconfig-002-20251121    gcc-14
i386        buildonly-randconfig-003-20251121    clang-20
i386        buildonly-randconfig-004-20251121    clang-20
i386        buildonly-randconfig-005-20251121    clang-20
i386        buildonly-randconfig-006-20251121    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251121    gcc-14
i386                  randconfig-002-20251121    clang-20
i386                  randconfig-003-20251121    gcc-14
i386                  randconfig-004-20251121    clang-20
i386                  randconfig-005-20251121    clang-20
i386                  randconfig-006-20251121    gcc-14
i386                  randconfig-007-20251121    gcc-14
i386                  randconfig-011-20251121    clang-20
i386                  randconfig-012-20251121    clang-20
i386                  randconfig-013-20251121    clang-20
i386                  randconfig-014-20251121    clang-20
i386                  randconfig-015-20251121    clang-20
i386                  randconfig-016-20251121    gcc-14
i386                  randconfig-017-20251121    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251121    gcc-15.1.0
loongarch             randconfig-002-20251121    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251121    gcc-11.5.0
nios2                 randconfig-002-20251121    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251121    gcc-12.5.0
parisc                randconfig-002-20251121    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                     kmeter1_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251121    clang-18
powerpc               randconfig-002-20251121    gcc-11.5.0
powerpc64             randconfig-001-20251121    gcc-8.5.0
powerpc64             randconfig-002-20251121    clang-20
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                randconfig-6001-20251120    clang-22
riscv                randconfig-6002-20251120    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                 randconfig-6001-20251120    clang-22
s390                 randconfig-6002-20251120    clang-17
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          lboxre2_defconfig    gcc-15.1.0
sh                   randconfig-6001-20251120    gcc-15.1.0
sh                   randconfig-6002-20251120    gcc-15.1.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251121    gcc-13.4.0
sparc                 randconfig-002-20251121    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251121    clang-22
sparc64               randconfig-002-20251121    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251121    clang-22
um                    randconfig-002-20251121    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251121    gcc-14
x86_64      buildonly-randconfig-002-20251121    gcc-14
x86_64      buildonly-randconfig-003-20251121    gcc-14
x86_64      buildonly-randconfig-004-20251121    clang-20
x86_64      buildonly-randconfig-005-20251121    gcc-14
x86_64      buildonly-randconfig-006-20251121    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251121    gcc-14
x86_64                randconfig-002-20251121    clang-20
x86_64                randconfig-003-20251121    clang-20
x86_64                randconfig-004-20251121    gcc-14
x86_64                randconfig-012-20251121    gcc-14
x86_64                randconfig-013-20251121    gcc-14
x86_64                randconfig-014-20251121    gcc-14
x86_64                randconfig-071-20251121    gcc-14
x86_64                randconfig-072-20251121    gcc-14
x86_64                randconfig-073-20251121    gcc-12
x86_64                randconfig-074-20251121    clang-20
x86_64                randconfig-075-20251121    gcc-14
x86_64                randconfig-076-20251121    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251121    gcc-11.5.0
xtensa                randconfig-002-20251121    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
