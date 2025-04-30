Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747C1EB5B;
	Wed, 30 Apr 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023373; cv=none; b=nj+u/UzJnWxhTxsWmgcvCbfnTp2Mn5vOw6Z207SlFd2YoQ8DFiJ6Imqvf1LnQXLstkwqIKXxMTBzbdTblm9/Um7r++XHSypp3nHQZkgOQ+SWFRypeI0VrRuAv5b2xyW8fQX4fT0QYDuSm3E48cQuItT7rxEQ89duWJWLQnn6lwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023373; c=relaxed/simple;
	bh=McTwb9pq+/vbqEqNIWzbMZewBCRlkfKpTurFpG+gIdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzj+3VIlWnY88fpYNgFrVQO2/OJ0xS2FTW1PR9moPDMfzZaXaKGrru+mA7Rtj064oC5GJ08ouubZuqeIwWR11liLAnLHdsoquB9GCu+fwUWCnUFEbHDgapT1erkJLwknezsCNo16/xXn/OhsSBhFpjNY+4a9nCrwgXqHER1SU8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=by+6MnU+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="by+6MnU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746023371; x=1777559371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=McTwb9pq+/vbqEqNIWzbMZewBCRlkfKpTurFpG+gIdk=;
  b=by+6MnU+WPnxFLGOnzVLlEcXpykgJNkWBvNhVNwk9sv+2AnFoTt8HWw0
   KFNr+qBTrDdvQqZM/mebzHoRvH4bI/DCk9t4ZcwaXEocLZV/yUaIRtDwJ
   ffen21EEZkF8irK9OVG+KJXcqtcVYZ6HQHZMBZpzY3tG4jyGbkvwXtC7e
   1ie+ohLyn4Vyi5TZCAI3yomgBrMsWuCn10hkd/7g3LGlk3D4VRm7f7y+U
   UF52WbS0TmvCVIircj9EYItaMykHPPdjirxx2aoDWJFcM5mVJCCVuQ0pu
   GV14e/Crm5j3qJPEMfYg+DZ5Spg9ma5zDM00lDkYHOjcylc9TjNuiMauw
   w==;
X-CSE-ConnectionGUID: ZWN3rD+BTGKjFeB3WB/H6g==
X-CSE-MsgGUID: CyrQ89OLRkueToeLr3frEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47698502"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47698502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 07:29:31 -0700
X-CSE-ConnectionGUID: /vGbO1UYRdKeO1UzaAIs1g==
X-CSE-MsgGUID: q4UKBdEtQ/SYH4H1q429Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138968832"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Apr 2025 07:29:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA8R9-0003WT-16;
	Wed, 30 Apr 2025 14:29:23 +0000
Date: Wed, 30 Apr 2025 22:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Matthew Leung <quic_mattleun@quicinc.com>,
	Yan Zhen <yanzhen@vivo.com>, Kunwu Chan <chentao@kylinos.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Troy Hanson <quic_thanson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel@collabora.com,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sumit Garg <sumit.garg@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH v3] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <202504302208.7JSH4wb6-lkp@intel.com>
References: <20250429122351.108684-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429122351.108684-1-usama.anjum@collabora.com>

Hi Muhammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on next-20250430]
[cannot apply to mani-mhi/mhi-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus staging/staging-testing staging/staging-next staging/staging-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Muhammad-Usama-Anjum/bus-mhi-host-don-t-free-bhie-tables-during-suspend-hibernation/20250429-202649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/20250429122351.108684-1-usama.anjum%40collabora.com
patch subject: [PATCH v3] bus: mhi: host: don't free bhie tables during suspend/hibernation
config: arm-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504302208.7JSH4wb6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504302208.7JSH4wb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504302208.7JSH4wb6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pm.c:1246:6: warning: no previous prototype for 'mhi_power_down_unprepare_keep_dev' [-Wmissing-prototypes]
    1246 | void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mhi_power_down_unprepare_keep_dev +1246 drivers/bus/mhi/host/pm.c

  1245	
> 1246	void mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
  1247	{
  1248		mhi_cntrl->bhi = NULL;
  1249		mhi_cntrl->bhie = NULL;
  1250	
  1251		mhi_deinit_dev_ctxt(mhi_cntrl);
  1252	}
  1253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
