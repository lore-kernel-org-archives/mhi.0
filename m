Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49113750BD
	for <mhi@lists.linux.dev>; Tue,  3 Mar 2026 02:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504862; cv=none; b=aDmB1TrBY9wQoGR+LUh+rvud/YZkr6MiSDig6W1W3DjnYNaU+/Yu2Rbe+hT3alYGegDqfmvBXQ13lraWN1xFB7nD3U8PKKhbuqcclYvc118rM6nroeErBeKdlf70Ie83r8y/HNWZo1fksRbNUSAaBlBxX3OngLJsVVAnerIW10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504862; c=relaxed/simple;
	bh=PmdcofRx3Hb6FrbmtlUBaI2BGZMBwTDb0nji/bspcWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hKDJEppTzgwKcIYO4p/juJTVb10KrLtZQNZn9kEzye9KVqujdWcMusj2l/cupxEW8m3ZA63xcI6tof6cXdrO3EhEmKuLYi1CAEtawdS+4zqdPGPU8gFFho3KAm2aCXIuAFc0jQUpcv3Lcm8OjGa2dMz5aJstv53HzQ3nh8ftONA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grvn7sv1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grvn7sv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772504860; x=1804040860;
  h=date:from:to:cc:subject:message-id;
  bh=PmdcofRx3Hb6FrbmtlUBaI2BGZMBwTDb0nji/bspcWs=;
  b=grvn7sv1wbN8nbHZnbYEMFhwCAKDNHPou3LzZR9iSW17ro7kP0xah2hN
   rzGSSvNtp5jaeCYNb8JEwDYXa6f9K7So9pnUcnNZ77RIs+jQd9l/DvNr1
   INRLlVSkGiPuuRVL/txXlkVEKJlyerldWyBwZ8QSRdIag25LmgwhSnbhm
   NPH1PEsoxMaS88LOtvxEijGcKP/auIGUn6L5jTj6g/LdC5XfZPpavxTW6
   tLQaGZbBmsiyH8raVrWxTpVPBG6qJrU7EyDwkExJF32+xO6OwakRwyDU8
   pRPTYZ2KCNgEVS3FeVDwzMyzN3Yfe5sB9SJFe62RQeYUzwBeUhszbC06e
   Q==;
X-CSE-ConnectionGUID: wHgxnMZKTf+cqc2KXFGMLQ==
X-CSE-MsgGUID: 7V3oLKhfSum/ea7lH+FiOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72556817"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="72556817"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:27:39 -0800
X-CSE-ConnectionGUID: S3GHgfCDTjGBEBopZaLWTg==
X-CSE-MsgGUID: TOz1mC7ARhSHleJr6lu23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="240860060"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2026 18:27:37 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxFTx-000000001eP-3Ck9;
	Tue, 03 Mar 2026 02:27:33 +0000
Date: Tue, 03 Mar 2026 10:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 6a7084102bb9659f699005c420eb59eade6d3b4f
Message-ID: <202603031010.CFFNadtb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: 6a7084102bb9659f699005c420eb59eade6d3b4f  bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem

elapsed time: 1111m

configs tested: 65
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    clang-16
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    clang-16
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon      allmodconfig    gcc-15.2.0
hexagon       allnoconfig    clang-23
i386         allmodconfig    clang-20
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    clang-20
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    clang-16
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    clang-19
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390         allmodconfig    clang-19
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    clang-19
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
um           allyesconfig    gcc-15.2.0
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
