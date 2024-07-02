Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726DD158853
	for <mhi@lists.linux.dev>; Tue,  2 Jul 2024 23:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963743; cv=none; b=t12OpLS7voOzhzagoEJ5YESf2TfnnMoNXfPbTmuq/OHqdgbhIn3AyeUXYJ71S/tMMnAs67BeqKMsnYBWh3NGAeHS/7T4fTywiBYXOp/PEsopfdUJp73jciB31eOZb9HBLWEGot3B4lDSv5EThNuae+2/ojAcxQZgIsdnKV2D5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963743; c=relaxed/simple;
	bh=wNVMX72DclE1amO/p1WJC65KMoFcnQaxay2+PSut3Qg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NMGIded9c3eF8gE3PTanKw3ohuVZGzyqSnQYv2AX6TjN3ILWj3hnj9ez5ycC9YQrxBprcx83kehYyqnPMtentc0Lse+WDV33yxwORIE9wL+v1+G5Eq/4zZGni0WgKyM1AJn4ulHRRZYMnWPXe9Yr2kW3jlXuzkyDFgtlY2XDsVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yo5a5rCu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo5a5rCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719963742; x=1751499742;
  h=date:from:to:cc:subject:message-id;
  bh=wNVMX72DclE1amO/p1WJC65KMoFcnQaxay2+PSut3Qg=;
  b=Yo5a5rCulCyfcHj4d374+QIz26y9pQmxTkJT2UGecuMW7Fav8GA1Eaob
   hgWbyjthcSyHiHSba06vfARxDUvxaTxAhphmUqIWOBDT1jqFmvbueSw8w
   P+bOF9EiXC2mb4j7PXn8Kuj1L/Dxb8qY9fQBpmgMy6y4VDtZvM1YDUfX+
   9+m+CPVrZhcEZZWMZqLKOS69LKEfqoxD9jGuI3dATm5eNduN25v85PwFK
   /+4k9Q7KsDd+W/uJYGfYw/qW31RkOgvbRHPDqTYDSd0AG6cIER/D9+ZUe
   wAUZeb6zfLwCymmEmMlpTKnvgAl5HjpXQ7f012A0FvDLQSVMUJZuSm34d
   Q==;
X-CSE-ConnectionGUID: CZ1rO+x7SZO+wytfhdK7vQ==
X-CSE-MsgGUID: efHPxPxjQceKGBjqdsa9jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="42594561"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="42594561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 16:42:19 -0700
X-CSE-ConnectionGUID: 6lbG7Ee+TrCmX7WJY8dR7A==
X-CSE-MsgGUID: ywciaATcRYeYIIPD0/0fKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="83610808"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2024 16:42:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOn8Z-000Owa-1R;
	Tue, 02 Jul 2024 23:42:15 +0000
Date: Wed, 03 Jul 2024 07:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 f08d4bdad612dcff6827f8cd2b20f13413c392d3
Message-ID: <202407030727.jDDFtnP1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: f08d4bdad612dcff6827f8cd2b20f13413c392d3  bus: mhi: host: pci_generic: Use unique 'mhi_pci_dev_info' for product families

elapsed time: 1783m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arm                              alldefconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-13.2.0
arm                       versatile_defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-001-20240703   clang-18
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-002-20240703   clang-18
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-003-20240703   clang-18
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-004-20240703   clang-18
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-005-20240703   clang-18
i386         buildonly-randconfig-006-20240702   gcc-13
i386         buildonly-randconfig-006-20240703   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-001-20240703   clang-18
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-002-20240703   clang-18
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-003-20240703   clang-18
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-004-20240703   clang-18
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-005-20240703   clang-18
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-006-20240703   clang-18
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-011-20240703   clang-18
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-012-20240703   clang-18
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-013-20240703   clang-18
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-014-20240703   clang-18
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-015-20240703   clang-18
i386                  randconfig-016-20240702   gcc-13
i386                  randconfig-016-20240703   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                         amcore_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                  or1klitex_defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                     tqm8560_defconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                                defconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
