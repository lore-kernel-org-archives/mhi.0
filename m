Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705411B0F23
	for <mhi@lists.linux.dev>; Thu, 16 Oct 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760621497; cv=none; b=r5VzO8yh5aZjwzYjkFV4KNREVzzeEh5vZ0hbwkHodNjqG6mNx7SjDxdiofesHIjp2G9nToRHkG4QHp/qGZss+WiA31JeYkmAwzehJUwE2HDI8qv1QVDwL12QsE66xG6ZGs9kUSOSF/znKJIJRjnb3X3dc/2F95jZdSQfdq2Hqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760621497; c=relaxed/simple;
	bh=fHr+jFAoSHz+jM2/4oQt3SCXBLoU2/CxpTZ9DoiY5bs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SikwfWchbn4+DfbLvn5A3++jgIUV77RSyleBwF2kCDsdX+METnPPjUwNIHVX0wniqddQdEyj3XHaHdJPVmLwoNR34l9CCusrOxPc6/sZDsGpP8zpbz7X3+K33vHL/DvqV40FJdaoV+iNc+a+Xbk8C4DG1XuK6yGs8TD3OgvSekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M36GTUGY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M36GTUGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760621495; x=1792157495;
  h=date:from:to:cc:subject:message-id;
  bh=fHr+jFAoSHz+jM2/4oQt3SCXBLoU2/CxpTZ9DoiY5bs=;
  b=M36GTUGYLOExUO6CYQsge7NW4zwHnvCRVpSlX9Vtylejqeqw4aYvo2US
   XbiKw6nuojIrNtTGcte6tgNDieKnNslOPGhwU7yWOh//tE2l82t/TV8Sp
   a6cA3N/W+YgUaZbdS2enZDyqACKRX2fZ7/Y6S7fh4ECiEnxCAIGnAqYpc
   jWLNaoCjI//816O1BG7/jrRIFO9os4WkXqE4zwaOj2WhTyFsPqULhrYPJ
   WLnzQZb/2uPLizqxkfILJVswV9sORG7slneZrrMGoy67Ry6lDmDg//ri7
   TGhMd5YfGZkFJpqpweHzZynp73kKIEzBEG2XKyBN7c2xWf/mXXi0QWV7U
   Q==;
X-CSE-ConnectionGUID: b7ErqvD9RZWR6bp29u8qmg==
X-CSE-MsgGUID: 0+OwAoXOToG7suKdo1nQ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62852946"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62852946"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 06:31:34 -0700
X-CSE-ConnectionGUID: JC2p9VxJS4+9KedU49jZYw==
X-CSE-MsgGUID: nAJu1tKxSDqzGCBBx9gicA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181665410"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Oct 2025 06:31:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9O4p-0004r8-0J;
	Thu, 16 Oct 2025 13:31:31 +0000
Date: Thu, 16 Oct 2025 21:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 6eaee77923ddf04beedb832c06f983679586361c
Message-ID: <202510162151.JcacMp6d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 6eaee77923ddf04beedb832c06f983679586361c  bus: mhi: host: pci_generic: Add Telit FE990B40 modem support

elapsed time: 1452m

configs tested: 260
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20251015    gcc-8.5.0
arc                   randconfig-001-20251016    clang-22
arc                   randconfig-002-20251015    gcc-8.5.0
arc                   randconfig-002-20251016    clang-22
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa3xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20251015    clang-22
arm                   randconfig-001-20251016    clang-22
arm                   randconfig-002-20251015    clang-22
arm                   randconfig-002-20251016    clang-22
arm                   randconfig-003-20251015    gcc-8.5.0
arm                   randconfig-003-20251016    clang-22
arm                   randconfig-004-20251015    clang-22
arm                   randconfig-004-20251016    clang-22
arm                       spear13xx_defconfig    gcc-15.1.0
arm                           sunxi_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251015    clang-22
arm64                 randconfig-001-20251016    clang-22
arm64                 randconfig-002-20251015    gcc-13.4.0
arm64                 randconfig-002-20251016    clang-22
arm64                 randconfig-003-20251015    clang-22
arm64                 randconfig-003-20251016    clang-22
arm64                 randconfig-004-20251015    clang-22
arm64                 randconfig-004-20251016    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251015    gcc-15.1.0
csky                  randconfig-001-20251016    clang-22
csky                  randconfig-002-20251015    gcc-9.5.0
csky                  randconfig-002-20251016    clang-22
hexagon                          alldefconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251015    clang-22
hexagon               randconfig-001-20251016    clang-22
hexagon               randconfig-002-20251015    clang-19
hexagon               randconfig-002-20251016    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251015    gcc-13
i386        buildonly-randconfig-001-20251016    clang-20
i386        buildonly-randconfig-002-20251015    gcc-14
i386        buildonly-randconfig-002-20251016    clang-20
i386        buildonly-randconfig-003-20251015    clang-20
i386        buildonly-randconfig-003-20251016    clang-20
i386        buildonly-randconfig-004-20251015    clang-20
i386        buildonly-randconfig-004-20251016    clang-20
i386        buildonly-randconfig-005-20251015    clang-20
i386        buildonly-randconfig-005-20251016    clang-20
i386        buildonly-randconfig-006-20251015    clang-20
i386        buildonly-randconfig-006-20251016    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251016    clang-20
i386                  randconfig-002-20251016    clang-20
i386                  randconfig-003-20251016    clang-20
i386                  randconfig-004-20251016    clang-20
i386                  randconfig-005-20251016    clang-20
i386                  randconfig-006-20251016    clang-20
i386                  randconfig-007-20251016    clang-20
i386                  randconfig-011-20251016    gcc-14
i386                  randconfig-012-20251016    gcc-14
i386                  randconfig-013-20251016    gcc-14
i386                  randconfig-014-20251016    gcc-14
i386                  randconfig-015-20251016    gcc-14
i386                  randconfig-016-20251016    gcc-14
i386                  randconfig-017-20251016    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251015    gcc-15.1.0
loongarch             randconfig-001-20251016    clang-22
loongarch             randconfig-002-20251015    gcc-15.1.0
loongarch             randconfig-002-20251016    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                          sun3x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251015    gcc-8.5.0
nios2                 randconfig-001-20251016    clang-22
nios2                 randconfig-002-20251015    gcc-8.5.0
nios2                 randconfig-002-20251016    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251015    gcc-9.5.0
parisc                randconfig-001-20251016    clang-22
parisc                randconfig-002-20251015    gcc-8.5.0
parisc                randconfig-002-20251016    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                   bluestone_defconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251015    gcc-15.1.0
powerpc               randconfig-001-20251016    clang-22
powerpc               randconfig-002-20251015    gcc-12.5.0
powerpc               randconfig-002-20251016    clang-22
powerpc               randconfig-003-20251015    clang-22
powerpc               randconfig-003-20251016    clang-22
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251015    clang-22
powerpc64             randconfig-002-20251015    clang-22
powerpc64             randconfig-002-20251016    clang-22
powerpc64             randconfig-003-20251015    gcc-13.4.0
powerpc64             randconfig-003-20251016    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251015    gcc-10.5.0
riscv                 randconfig-001-20251016    gcc-10.5.0
riscv                 randconfig-002-20251015    clang-22
riscv                 randconfig-002-20251016    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251015    gcc-12.5.0
s390                  randconfig-001-20251016    gcc-10.5.0
s390                  randconfig-002-20251015    clang-22
s390                  randconfig-002-20251016    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20251015    gcc-11.5.0
sh                    randconfig-001-20251016    gcc-10.5.0
sh                    randconfig-002-20251015    gcc-11.5.0
sh                    randconfig-002-20251016    gcc-10.5.0
sh                             sh03_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251015    gcc-8.5.0
sparc                 randconfig-001-20251016    gcc-10.5.0
sparc                 randconfig-002-20251015    gcc-13.4.0
sparc                 randconfig-002-20251016    gcc-10.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251015    clang-22
sparc64               randconfig-001-20251016    gcc-10.5.0
sparc64               randconfig-002-20251015    gcc-11.5.0
sparc64               randconfig-002-20251016    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251015    clang-22
um                    randconfig-001-20251016    gcc-10.5.0
um                    randconfig-002-20251015    clang-22
um                    randconfig-002-20251016    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
um                           x86_64_defconfig    gcc-15.1.0
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251015    clang-20
x86_64      buildonly-randconfig-001-20251016    gcc-12
x86_64      buildonly-randconfig-002-20251015    gcc-14
x86_64      buildonly-randconfig-002-20251016    gcc-12
x86_64      buildonly-randconfig-003-20251015    clang-20
x86_64      buildonly-randconfig-003-20251016    gcc-12
x86_64      buildonly-randconfig-004-20251015    clang-20
x86_64      buildonly-randconfig-004-20251016    gcc-12
x86_64      buildonly-randconfig-005-20251015    gcc-14
x86_64      buildonly-randconfig-005-20251016    gcc-12
x86_64      buildonly-randconfig-006-20251015    gcc-13
x86_64      buildonly-randconfig-006-20251016    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251016    clang-20
x86_64                randconfig-002-20251016    clang-20
x86_64                randconfig-003-20251016    clang-20
x86_64                randconfig-004-20251016    clang-20
x86_64                randconfig-005-20251016    clang-20
x86_64                randconfig-006-20251016    clang-20
x86_64                randconfig-007-20251016    clang-20
x86_64                randconfig-008-20251016    clang-20
x86_64                randconfig-071-20251016    gcc-14
x86_64                randconfig-072-20251016    gcc-14
x86_64                randconfig-073-20251016    gcc-14
x86_64                randconfig-074-20251016    gcc-14
x86_64                randconfig-075-20251016    gcc-14
x86_64                randconfig-076-20251016    gcc-14
x86_64                randconfig-077-20251016    gcc-14
x86_64                randconfig-078-20251016    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251015    gcc-9.5.0
xtensa                randconfig-001-20251016    gcc-10.5.0
xtensa                randconfig-002-20251015    gcc-15.1.0
xtensa                randconfig-002-20251016    gcc-10.5.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
