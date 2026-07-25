Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E828541A
	for <mhi@lists.linux.dev>; Sat, 25 Jul 2026 05:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956651; cv=none; b=EP38UlzhW/zBJZTSQz7jDdHCXb2YdL+gGrRpw/g1CKx+K/TK8wPcSO5vbJ4lkiedyFRGN5kZm/j0Y9EEapVbPmWTfPOP12GluGz+eeVqWzk2Pd1FE00xO1Uny40Kj+OlaUUoyfFGZutxF9qDWonArRAe5JpBm+f1jYsiJwnnonE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956651; c=relaxed/simple;
	bh=sJRDha2YBRkh8IKWEEF35TIoJpJhe7C3q0nHvVrZGJo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KGzLULLLk57SHAndaQ4lw1bqcLhuZkkQ18zxHSZ7W1FxvxH9jLQ72ZsI6EQ0UtfRlHj3+X4eQlr3oHe68YBmRCC5EaLik8bQ7uDF4XiQNfzWsGUCK29ZN3CKZVVWd4k8Zh2nLtBDZjzORVGIwWCmpL3C24f5s7aTF0mDCwRjTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7UycnnL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7UycnnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784956648; x=1816492648;
  h=date:from:to:cc:subject:message-id;
  bh=sJRDha2YBRkh8IKWEEF35TIoJpJhe7C3q0nHvVrZGJo=;
  b=R7UycnnL8YrsheZRS/Okpt7rcEqea6pOhrNBT02SFqTdJaDVas39qMYN
   TmznQJUUbtqHOdWieNUA4qLa1XSAINLDPF8MFu90hIaCn1+3J4sC6IGEB
   Dq5UYJNEwVQ+TT7SXAeDqzizGex+hFUIl1Q60F4epJ1YUw4+VBgq4Ibb9
   k0t5Is5A8ECaw3KKBTP4p5XsSK6F9dl3b8FAW5fyliQxuc+kDprCCfT8S
   O8b0t1mKWQnkwshLMLN7Q3SE8gdciWKJu07JliG9t4Lfh+tKAr0V1gPGI
   03QAYbYvEY45qMRxg+qFm1nNalkBrbByjNyxjy6vpl4LyPIr6oJTMGi4b
   A==;
X-CSE-ConnectionGUID: dXg2Mo87RKSk3GvinZ6bDw==
X-CSE-MsgGUID: En2J77xQQj2C2nNcsqJedA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="108412581"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="108412581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 22:17:28 -0700
X-CSE-ConnectionGUID: tVnjfCB0SzC1h0QfTHQyeg==
X-CSE-MsgGUID: cNAsGE2jQh+aYZ+mW+FeZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="257126489"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2026 22:17:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnUlJ-00000000bV0-0RzA;
	Sat, 25 Jul 2026 05:17:25 +0000
Date: Sat, 25 Jul 2026 13:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next] BUILD SUCCESS
 a2501fd06150de7183bd5a5033503eba03672d1f
Message-ID: <202607251336.MACKymdS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
branch HEAD: a2501fd06150de7183bd5a5033503eba03672d1f  bus: mhi: Clean up some kernel-doc warnings

elapsed time: 825m

configs tested: 17
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
sh                       defconfig    gcc-16.1.0
sh              ecovec24_defconfig    gcc-16.1.0
sparc      randconfig-002-20260725    gcc-8.5.0
sparc64    randconfig-002-20260725    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
