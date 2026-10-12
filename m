Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E34AF9EF
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820326; cv=none; b=r26akCy9EKsOIWp0AXCr2NwN/Nq8ORYZF0lQFHZUsrSEEnbyPREcrNAE/2DNvB63FuCkzpG2pVXF3XF3+gPJ+AO3oRDXCle708x4pL07o95h2iEs2UbBcOXwqT+jpIydHIzy8FWGNiAk+1FyZ0dhnXjlWGazFF4ol1o/EFyO0Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820326; c=relaxed/simple;
	bh=rDUsmAKaW53e2xFZB7InZp5C7UT+A3H7f2BG66Ilem0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j2VISwcKGxYAQEKYECAqtarXvwHMm2NQleX7NZZPrMKY6Rkm91bL7ILLD45H365H34rcK7M8g735cQ2rAefSI7SUa8C1CaoWbC+u77GEAr6JTx8zdAP1alM93BGiS1qnKGRT0ziWWkDv4N8X3YzGSm9D2qTtlr/PGPffMmI/CF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxkVlV/m; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxkVlV/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820324; x=1823356324;
  h=date:from:to:cc:subject:message-id;
  bh=rDUsmAKaW53e2xFZB7InZp5C7UT+A3H7f2BG66Ilem0=;
  b=nxkVlV/mcrlFdB8gk/6Jw76hPa5tyfDviWxMN5WArLwGWXOp2yZGQQZO
   dyqEju+nQJgJYi8QzHqWnIebgHKKc49hiraGZSacEpZyQB5cLkcEGvZ9/
   wSpwU1rFNEwEKHUxhUpHZLYWXaj8slelcVggoSuyzSpJ4sYUPgi5U5esj
   wyaYPppl3VfIuXdIHmpAyvsQ0SoXAeJkVZtUZyiFZEIDAicfsRfImOu/d
   OuyV1rQEJ+ajgVXmya+2xWrel3k+l2TjhqePJCQy8XDldkeUzmn0Huuha
   kMk0vOovVC2lTd7LOwfHzyYXWk1U4IGAYXQi21oAbTnOMA9zZ3ajlbCj1
   Q==;
X-CSE-ConnectionGUID: 1nGLTxjwSmWP9WAlooSL6g==
X-CSE-MsgGUID: mjZ/cMUFR1G9w+qpdzb4wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="422636"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="422636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:52:03 -0700
X-CSE-ConnectionGUID: 3M+cuA+9RMKAzCIR5eveSQ==
X-CSE-MsgGUID: DsTM+Cl3SYO39fpJLW6QTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1250194"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Oct 2026 08:52:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGIJj-00000000Bjt-1TRC;
	Mon, 12 Oct 2026 15:51:59 +0000
Date: Mon, 12 Oct 2026 23:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 0b1883ca75c0005ab5ca52c7bc1a26329bc39746
Message-ID: <202610122316.JAHkbRK2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 0b1883ca75c0005ab5ca52c7bc1a26329bc39746  bus: mhi: ep: clients: Add loopback driver for data path testing

elapsed time: 1156m

configs tested: 417
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2106-20261011    clang-24   cocci
alpha                randconfig-r2111-20261012    gcc-8.5.0  cocci
alpha                randconfig-r2202-20261011    gcc-16.1.0 smatch
alpha                randconfig-r2202-20261012    gcc-15.2.0 smatch
alpha                randconfig-r2300-20261012    clang-19   sparse
alpha                randconfig-r2304-20261011    clang-24   sparse
alpha                randconfig-r2305-20261011    clang-24   sparse
alpha                randconfig-r2311-20261012    clang-22   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20261012    gcc-8.5.0
arc                   randconfig-1001-20261012    gcc-8.5.0
arc                   randconfig-2000-20261011    gcc-8.5.0
arc                   randconfig-2000-20261012    gcc-16.1.0
arc                   randconfig-2001-20261011    gcc-8.5.0
arc                   randconfig-2001-20261012    gcc-16.1.0
arc                  randconfig-r2200-20261012    gcc-16.1.0 smatch
arc                  randconfig-r2304-20261012    clang-19   sparse
arc                  randconfig-r2306-20261011    gcc-8.5.0  sparse
arc                  randconfig-r2311-20261011    clang-24   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                   randconfig-1000-20261012    gcc-8.5.0
arm                   randconfig-1001-20261012    gcc-8.5.0
arm                   randconfig-1002-20261012    gcc-8.5.0
arm                   randconfig-1003-20261012    gcc-8.5.0
arm                   randconfig-2000-20261011    gcc-8.5.0
arm                   randconfig-2000-20261012    gcc-16.1.0
arm                   randconfig-2001-20261011    gcc-8.5.0
arm                   randconfig-2001-20261012    gcc-16.1.0
arm                  randconfig-r2101-20261012    gcc-15.2.0 cocci
arm                  randconfig-r2107-20261011    gcc-8.5.0  cocci
arm                  randconfig-r2201-20261011    gcc-13.4.0 smatch
arm                  randconfig-r2308-20261011    clang-24   sparse
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261012    clang-24
arm64                 randconfig-1001-20261012    clang-24
arm64                 randconfig-1002-20261012    clang-24
arm64                 randconfig-1003-20261012    clang-24
arm64                 randconfig-2000-20261011    clang-24
arm64                 randconfig-2000-20261011    gcc-16.1.0
arm64                 randconfig-2000-20261012    gcc-16.1.0
arm64                 randconfig-2001-20261011    gcc-12.5.0
arm64                 randconfig-2001-20261011    gcc-16.1.0
arm64                 randconfig-2001-20261012    gcc-16.1.0
arm64                randconfig-r2108-20261012    clang-24   cocci
arm64                randconfig-r2109-20261012    gcc-11.5.0 cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261012    clang-24
csky                  randconfig-1001-20261012    clang-24
csky                  randconfig-2000-20261011    gcc-16.1.0
csky                  randconfig-2000-20261011    gcc-9.5.0
csky                  randconfig-2000-20261012    gcc-16.1.0
csky                  randconfig-2001-20261011    gcc-16.1.0
csky                  randconfig-2001-20261012    gcc-16.1.0
csky                 randconfig-r2108-20261011    gcc-8.5.0  cocci
csky                 randconfig-r2108-20261012    gcc-15.2.0 cocci
csky                 randconfig-r2201-20261011    gcc-11.5.0 smatch
csky                 randconfig-r2202-20261011    gcc-9.5.0  smatch
csky                 randconfig-r2202-20261012    gcc-16.1.0 smatch
csky                 randconfig-r2303-20261011    gcc-12.5.0 sparse
csky                 randconfig-r2304-20261011    gcc-16.1.0 sparse
csky                 randconfig-r2309-20261011    gcc-8.5.0  sparse
csky                 randconfig-r2309-20261012    clang-22   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261012    clang-17
hexagon               randconfig-1001-20261012    clang-17
hexagon               randconfig-2000-20261011    clang-19
hexagon               randconfig-2000-20261011    gcc-16.1.0
hexagon               randconfig-2000-20261012    gcc-16.1.0
hexagon               randconfig-2001-20261011    clang-17
hexagon               randconfig-2001-20261011    gcc-16.1.0
hexagon               randconfig-2001-20261012    gcc-16.1.0
hexagon              randconfig-r2104-20261011    clang-24   cocci
hexagon              randconfig-r2107-20261012    gcc-8.5.0  cocci
hexagon              randconfig-r2109-20261012    clang-24   cocci
hexagon              randconfig-r2302-20261011    clang-21   sparse
hexagon              randconfig-r2302-20261012    clang-17   sparse
hexagon              randconfig-r2304-20261012    clang-17   sparse
hexagon              randconfig-r2309-20261011    clang-24   sparse
hexagon              randconfig-r2310-20261011    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261012    clang-22
i386        buildonly-randconfig-1001-20261012    clang-22
i386        buildonly-randconfig-1002-20261012    clang-22
i386        buildonly-randconfig-1003-20261012    clang-22
i386        buildonly-randconfig-1004-20261012    clang-22
i386        buildonly-randconfig-1005-20261012    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261012    gcc-14
i386                  randconfig-1001-20261012    gcc-14
i386                  randconfig-1002-20261012    gcc-14
i386                  randconfig-1003-20261012    gcc-14
i386                  randconfig-1004-20261012    gcc-14
i386                  randconfig-1005-20261012    gcc-14
i386                  randconfig-1006-20261012    gcc-14
i386                  randconfig-1007-20261012    clang-22
i386                  randconfig-1008-20261012    clang-22
i386                  randconfig-1009-20261012    clang-22
i386                  randconfig-1010-20261012    clang-22
i386                  randconfig-1011-20261012    clang-22
i386                  randconfig-1012-20261012    clang-22
i386                  randconfig-1013-20261012    clang-22
i386                  randconfig-2000-20261011    gcc-8.5.0
i386                  randconfig-2000-20261012    gcc-16.1.0
i386                  randconfig-2001-20261011    gcc-8.5.0
i386                  randconfig-2001-20261012    gcc-16.1.0
i386                  randconfig-2100-20261011    gcc-14     cocci
i386                  randconfig-2100-20261012    clang-22   cocci
i386                  randconfig-2101-20261011    gcc-14     cocci
i386                  randconfig-2101-20261012    clang-22   cocci
i386                  randconfig-2102-20261011    gcc-14     cocci
i386                  randconfig-2102-20261012    clang-22   cocci
i386                  randconfig-2103-20261011    gcc-14     cocci
i386                  randconfig-2103-20261012    clang-22   cocci
i386                  randconfig-2104-20261011    gcc-14     cocci
i386                  randconfig-2104-20261012    clang-22   cocci
i386                  randconfig-2105-20261011    gcc-14     cocci
i386                  randconfig-2105-20261012    clang-22   cocci
i386                  randconfig-2200-20261011    clang-22   smatch
i386                  randconfig-2200-20261012    clang-22   smatch
i386                  randconfig-2300-20261011    gcc-14     sparse
i386                  randconfig-2301-20261011    gcc-14     sparse
i386                  randconfig-2302-20261011    gcc-14     sparse
i386                 randconfig-r2100-20261012    gcc-11.5.0 cocci
i386                 randconfig-r2104-20261012    gcc-8.5.0  cocci
i386                 randconfig-r2106-20261011    gcc-8.5.0  cocci
i386                 randconfig-r2109-20261012    gcc-15.2.0 cocci
i386                 randconfig-r2301-20261011    clang-22   sparse
i386                 randconfig-r2302-20261011    gcc-16.1.0 sparse
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261012    clang-17
loongarch             randconfig-1001-20261012    clang-17
loongarch             randconfig-2000-20261011    gcc-14.3.0
loongarch             randconfig-2000-20261011    gcc-8.5.0
loongarch             randconfig-2000-20261012    gcc-11.5.0
loongarch             randconfig-2001-20261011    clang-24
loongarch             randconfig-2001-20261011    gcc-8.5.0
loongarch             randconfig-2001-20261012    gcc-11.5.0
loongarch            randconfig-r2100-20261012    gcc-15.2.0 cocci
loongarch            randconfig-r2202-20261011    clang-24   smatch
loongarch            randconfig-r2301-20261011    gcc-16.1.0 sparse
loongarch            randconfig-r2303-20261011    gcc-16.1.0 sparse
loongarch            randconfig-r2307-20261011    clang-24   sparse
loongarch            randconfig-r2308-20261011    clang-24   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5329evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2111-20261011    gcc-8.5.0  cocci
m68k                 randconfig-r2201-20261012    gcc-13.4.0 smatch
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2308-20261011    gcc-8.5.0  sparse
microblaze           randconfig-r2309-20261011    clang-24   sparse
microblaze           randconfig-r2310-20261012    clang-22   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                            ip27_defconfig    gcc-16.1.0
mips                 randconfig-r2106-20261012    gcc-8.5.0  cocci
mips                 randconfig-r2300-20261012    clang-17   sparse
mips                 randconfig-r2305-20261012    clang-17   sparse
mips                 randconfig-r2306-20261012    clang-22   sparse
mips                 randconfig-r2307-20261011    gcc-8.5.0  sparse
mips                 randconfig-r2311-20261011    gcc-13.4.0 sparse
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261012    clang-17
nios2                 randconfig-1001-20261012    clang-17
nios2                 randconfig-2000-20261011    gcc-8.5.0
nios2                 randconfig-2000-20261011    gcc-9.5.0
nios2                 randconfig-2000-20261012    gcc-11.5.0
nios2                 randconfig-2001-20261011    gcc-8.5.0
nios2                 randconfig-2001-20261012    gcc-11.5.0
nios2                randconfig-r2102-20261012    gcc-11.5.0 cocci
nios2                randconfig-r2110-20261012    gcc-8.5.0  cocci
nios2                randconfig-r2111-20261012    gcc-15.2.0 cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20261012    clang-24   cocci
openrisc             randconfig-r2103-20261012    clang-24   cocci
openrisc             randconfig-r2105-20261012    gcc-15.2.0 cocci
openrisc             randconfig-r2306-20261011    gcc-8.5.0  sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261012    gcc-8.5.0
parisc                randconfig-1001-20261012    gcc-8.5.0
parisc                randconfig-2000-20261011    gcc-11.5.0
parisc                randconfig-2000-20261011    gcc-8.5.0
parisc                randconfig-2000-20261012    gcc-11.5.0
parisc                randconfig-2001-20261011    gcc-8.5.0
parisc                randconfig-2001-20261012    gcc-11.5.0
parisc               randconfig-r2100-20261011    gcc-8.5.0  cocci
parisc               randconfig-r2102-20261012    gcc-15.2.0 cocci
parisc               randconfig-r2105-20261011    gcc-8.5.0  cocci
parisc               randconfig-r2300-20261011    gcc-16.1.0 sparse
parisc               randconfig-r2301-20261012    clang-19   sparse
parisc               randconfig-r2311-20261011    gcc-8.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     amigaone_defconfig    gcc-16.1.0
powerpc                       ep88xc_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261012    gcc-8.5.0
powerpc               randconfig-1001-20261012    gcc-8.5.0
powerpc               randconfig-2000-20261011    clang-22
powerpc               randconfig-2000-20261011    gcc-8.5.0
powerpc               randconfig-2000-20261012    gcc-14
powerpc               randconfig-2001-20261011    clang-22
powerpc               randconfig-2001-20261011    gcc-8.5.0
powerpc               randconfig-2001-20261012    gcc-14
powerpc              randconfig-r2101-20261011    gcc-8.5.0  cocci
powerpc              randconfig-r2103-20261012    gcc-11.5.0 cocci
powerpc              randconfig-r2106-20261012    gcc-15.2.0 cocci
powerpc              randconfig-r2111-20261011    clang-24   cocci
powerpc              randconfig-r2300-20261011    gcc-8.5.0  sparse
powerpc              randconfig-r2302-20261012    clang-19   sparse
powerpc              randconfig-r2305-20261011    gcc-16.1.0 sparse
powerpc              randconfig-r2305-20261012    clang-19   sparse
powerpc              randconfig-r2306-20261011    clang-24   sparse
powerpc64             randconfig-1000-20261012    gcc-8.5.0
powerpc64             randconfig-1001-20261012    gcc-8.5.0
powerpc64             randconfig-2000-20261011    clang-22
powerpc64             randconfig-2000-20261011    gcc-8.5.0
powerpc64             randconfig-2000-20261012    gcc-14
powerpc64             randconfig-2001-20261011    clang-22
powerpc64             randconfig-2001-20261011    gcc-12.5.0
powerpc64             randconfig-2001-20261012    gcc-14
powerpc64            randconfig-r2104-20261012    gcc-15.2.0 cocci
powerpc64            randconfig-r2200-20261011    gcc-8.5.0  smatch
powerpc64            randconfig-r2302-20261011    clang-24   sparse
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261012    clang-24
riscv                 randconfig-1001-20261012    clang-24
riscv                 randconfig-2000-20261011    gcc-13.4.0
riscv                 randconfig-2000-20261012    gcc-14.3.0
riscv                 randconfig-2001-20261011    gcc-13.4.0
riscv                 randconfig-2001-20261012    gcc-14.3.0
riscv                randconfig-r2103-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2107-20261011    clang-24   cocci
riscv                randconfig-r2110-20261012    gcc-15.2.0 cocci
riscv                randconfig-r2301-20261011    clang-24   sparse
riscv                randconfig-r2303-20261012    clang-19   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261012    clang-24
s390                  randconfig-1001-20261012    clang-24
s390                  randconfig-2000-20261011    gcc-13.4.0
s390                  randconfig-2000-20261012    gcc-14.3.0
s390                  randconfig-2001-20261011    gcc-13.4.0
s390                  randconfig-2001-20261012    gcc-14.3.0
s390                 randconfig-r2201-20261012    clang-17   smatch
s390                 randconfig-r2310-20261011    gcc-8.5.0  sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261012    clang-24
sh                    randconfig-1001-20261012    clang-24
sh                    randconfig-2000-20261011    gcc-13.4.0
sh                    randconfig-2000-20261012    gcc-14.3.0
sh                    randconfig-2001-20261011    gcc-13.4.0
sh                    randconfig-2001-20261012    gcc-14.3.0
sh                   randconfig-r2101-20261012    gcc-11.5.0 cocci
sh                   randconfig-r2107-20261012    gcc-15.2.0 cocci
sh                   randconfig-r2110-20261011    gcc-8.5.0  cocci
sh                   randconfig-r2303-20261011    clang-24   sparse
sh                           rsk7201_defconfig    gcc-16.1.0
sh                           rsk7203_defconfig    gcc-16.1.0
sh                           sdk7780_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261012    clang-20
sparc                 randconfig-1001-20261012    clang-20
sparc                 randconfig-2000-20261011    gcc-8.5.0
sparc                 randconfig-2000-20261012    gcc-8.5.0
sparc                 randconfig-2001-20261011    gcc-8.5.0
sparc                 randconfig-2001-20261012    gcc-8.5.0
sparc                randconfig-r2105-20261011    clang-24   cocci
sparc                randconfig-r2105-20261012    gcc-8.5.0  cocci
sparc                randconfig-r2200-20261011    gcc-8.5.0  smatch
sparc                randconfig-r2200-20261012    gcc-11.5.0 smatch
sparc                randconfig-r2201-20261011    gcc-14.3.0 smatch
sparc                randconfig-r2300-20261011    clang-24   sparse
sparc                randconfig-r2303-20261012    clang-17   sparse
sparc                randconfig-r2307-20261011    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261012    clang-20
sparc64               randconfig-1001-20261012    clang-20
sparc64               randconfig-2000-20261011    gcc-8.5.0
sparc64               randconfig-2000-20261012    gcc-8.5.0
sparc64               randconfig-2001-20261011    gcc-8.5.0
sparc64               randconfig-2001-20261012    gcc-8.5.0
sparc64              randconfig-r2100-20261012    clang-24   cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261012    clang-20
um                    randconfig-1001-20261012    clang-20
um                    randconfig-2000-20261011    gcc-8.5.0
um                    randconfig-2000-20261012    gcc-8.5.0
um                    randconfig-2001-20261011    gcc-8.5.0
um                    randconfig-2001-20261012    gcc-8.5.0
um                   randconfig-r2102-20261012    clang-24   cocci
um                   randconfig-r2301-20261012    clang-17   sparse
um                   randconfig-r2305-20261011    clang-17   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261012    clang-22
x86_64      buildonly-randconfig-1001-20261012    clang-22
x86_64      buildonly-randconfig-1002-20261012    clang-22
x86_64      buildonly-randconfig-1003-20261012    clang-22
x86_64      buildonly-randconfig-1004-20261012    clang-22
x86_64      buildonly-randconfig-1005-20261012    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261012    clang-22
x86_64                randconfig-1001-20261012    clang-22
x86_64                randconfig-1002-20261012    clang-22
x86_64                randconfig-1003-20261012    clang-22
x86_64                randconfig-1004-20261012    clang-22
x86_64                randconfig-1005-20261012    clang-22
x86_64                randconfig-1006-20261012    clang-22
x86_64                randconfig-1007-20261012    clang-22
x86_64                randconfig-1008-20261012    clang-22
x86_64                randconfig-1009-20261012    clang-22
x86_64                randconfig-1010-20261012    clang-22
x86_64                randconfig-1011-20261012    clang-22
x86_64                randconfig-1012-20261012    gcc-14
x86_64                randconfig-1013-20261012    gcc-14
x86_64                randconfig-1014-20261012    gcc-14
x86_64                randconfig-1015-20261012    gcc-14
x86_64                randconfig-1016-20261012    gcc-14
x86_64                randconfig-1017-20261012    gcc-14
x86_64                randconfig-2000-20261011    clang-22
x86_64                randconfig-2000-20261012    gcc-14
x86_64                randconfig-2001-20261011    clang-22
x86_64                randconfig-2001-20261012    gcc-14
x86_64                randconfig-2100-20261011    gcc-14     cocci
x86_64                randconfig-2100-20261012    clang-22   cocci
x86_64                randconfig-2101-20261011    gcc-14     cocci
x86_64                randconfig-2101-20261012    clang-22   cocci
x86_64                randconfig-2102-20261011    gcc-14     cocci
x86_64                randconfig-2102-20261012    clang-22   cocci
x86_64                randconfig-2103-20261011    gcc-14     cocci
x86_64                randconfig-2103-20261012    clang-22   cocci
x86_64                randconfig-2104-20261011    gcc-14     cocci
x86_64                randconfig-2104-20261012    clang-22   cocci
x86_64                randconfig-2105-20261011    gcc-14     cocci
x86_64                randconfig-2105-20261012    clang-22   cocci
x86_64                randconfig-2200-20261011    clang-22   smatch
x86_64                randconfig-2200-20261012    gcc-14     smatch
x86_64                randconfig-2300-20261011    gcc-14     sparse
x86_64                randconfig-2301-20261011    gcc-14     sparse
x86_64                randconfig-2302-20261011    gcc-14     sparse
x86_64               randconfig-r2108-20261012    gcc-11.5.0 cocci
x86_64               randconfig-r2109-20261011    gcc-8.5.0  cocci
x86_64               randconfig-r2307-20261012    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261012    clang-20
xtensa                randconfig-1001-20261012    clang-20
xtensa                randconfig-2000-20261011    gcc-8.5.0
xtensa                randconfig-2000-20261012    gcc-8.5.0
xtensa                randconfig-2001-20261011    gcc-8.5.0
xtensa                randconfig-2001-20261012    gcc-8.5.0
xtensa               randconfig-r2102-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2103-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2104-20261011    gcc-8.5.0  cocci
xtensa               randconfig-r2110-20261011    clang-24   cocci
xtensa               randconfig-r2200-20261012    gcc-8.5.0  smatch
xtensa               randconfig-r2308-20261012    clang-22   sparse
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
