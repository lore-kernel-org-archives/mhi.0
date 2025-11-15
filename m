Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D125280CE0
	for <mhi@lists.linux.dev>; Sat, 15 Nov 2025 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763200248; cv=none; b=BJog1b1DeCNBWxEoVcRdZy3yhUJxgSSfrVYoaxEhtC3UTR4nBRVUsxWRKupXkxJLyx7afhuYG7g1ZWEa1hvniXYWuu+ALKVmSDgPsD+oQZcsO1melHgLERjNYjejeS4S7Z7E8iwMWaZALRujzDQq0yguGg2JwLAUZM+JogvgwX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763200248; c=relaxed/simple;
	bh=OVQgIr4muZS3gLHHBuR+KeKOVzC+oh+WcnkHRcQVCoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DUgTeaE88o0V9ENw4Cfp2J4OFjVmpkCQJY8AR1+kIR8suf0x3LkiXgbqWAI4P1XTdfBwgwLzyFeVAJhANINFXeazmbnkzIE6JDsevyC63yIX2LSwLXei+HQMADrOcImWA6d+n+DStCSx7GDxmJpGeJuVi+AdYQI3eRQsuf6rKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUYTSiz2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUYTSiz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763200247; x=1794736247;
  h=date:from:to:cc:subject:message-id;
  bh=OVQgIr4muZS3gLHHBuR+KeKOVzC+oh+WcnkHRcQVCoY=;
  b=gUYTSiz2RbsNwOluPQ8dmY+6jL3wm7Spc17aNzzFSNFkyIJYbaUHe0Ca
   qXtnl+8liq84LefY8nT31NptC0F3AlFVSyNQRZbHWcQRbNJCR+2TPaShh
   s5JBk7NmY5KIqnxJTpSL5cT8htWsG2txIh8ehIOnfzjucmaGlbzz0zHGB
   m8s9Agt10/76yi7X7CBp96Yq4yjkcwBWLjEDS6SDST6jEHlAhAAM1I7jQ
   tHdKgw5zZ6iW9cPWD/w1q9F8zMOj6QsLORABoCuwvfvrEOBwmJjwom8gf
   fywDZelb3ICTAZeDEpkDXiegMo2Q7vPEwN6wNr/t1pA+8pqDAOar4O7zT
   A==;
X-CSE-ConnectionGUID: Cy1/325ARnuBGrEqvcgwFw==
X-CSE-MsgGUID: urk38nkaQMGnNUFgz3HmsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65313921"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="65313921"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 01:50:47 -0800
X-CSE-ConnectionGUID: RFVzyHSxSGiKMXBFpOTAtg==
X-CSE-MsgGUID: pEwMI2+OQC6V60a+pL+BTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="190782769"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Nov 2025 01:50:46 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKCvb-0007rT-1F;
	Sat, 15 Nov 2025 09:50:43 +0000
Date: Sat, 15 Nov 2025 17:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 9e24bdfecdb071a3a42fb74be1ab503c958e2740
Message-ID: <202511151715.p0oQpJlL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 9e24bdfecdb071a3a42fb74be1ab503c958e2740  bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users

elapsed time: 7291m

configs tested: 58
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc         randconfig-001-20251111    gcc-11.5.0
arc         randconfig-002-20251111    gcc-12.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251111    clang-22
arm         randconfig-002-20251111    clang-17
arm         randconfig-003-20251111    clang-22
arm         randconfig-004-20251111    gcc-10.5.0
arm64                   allnoconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon                allyesconfig    clang-22
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze             allmodconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251110    gcc-11.5.0
nios2       randconfig-002-20251110    gcc-10.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc      randconfig-001-20251111    gcc-9.5.0
parisc      randconfig-002-20251111    gcc-8.5.0
powerpc                 allnoconfig    gcc-15.1.0
powerpc     randconfig-001-20251111    gcc-8.5.0
powerpc     randconfig-002-20251111    clang-22
powerpc64   randconfig-002-20251111    gcc-12.5.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251110    clang-22
riscv       randconfig-002-20251110    gcc-8.5.0
s390                    allnoconfig    clang-22
s390        randconfig-001-20251110    gcc-8.5.0
s390        randconfig-002-20251110    gcc-8.5.0
sh                      allnoconfig    gcc-15.1.0
sh          randconfig-001-20251110    gcc-15.1.0
sh          randconfig-002-20251110    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                        kexec    clang-20
x86_64                     rhel-9.4    clang-20
x86_64                 rhel-9.4-bpf    gcc-14
x86_64                rhel-9.4-func    clang-20
x86_64          rhel-9.4-kselftests    clang-20
x86_64               rhel-9.4-kunit    gcc-14
x86_64                 rhel-9.4-ltp    gcc-14
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
