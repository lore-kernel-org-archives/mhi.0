Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9503925E;
	Wed,  7 Jun 2023 20:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686169295; x=1717705295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ptcJdaHahJRD2fNGZZ0WMUGd3tX28UXr2OYz7pD6acg=;
  b=UbF3L7kdCDbOyNyJo2/su9/yvA8JIKMnLd+nVgBdwVM3x905XtATpdUX
   I1v+Z1UkLPUEgFhsaYSw1LEzW1VwumeDhgl6VL38nTmaQ/ZyWT3slPvbh
   7RzGm9h0Gr+OnO8c7yAOdDQI+43xLuMBZunxzgII1hG2NE5+9a+k2zggl
   R8+llK9Sxha9kN1Sf1sly3PWkA8lIAtac3azTfvdwm1SPNa5e0Ntay5vE
   RtsCZK9K+vaJdKyXMZIuMdMVnYDbXA0cZALx8Eojz0cGHHiOr51WAOG3f
   zU8vm63Arr6vVAqiIdnOr3qL1I2HR7AQ5O0vDxljU25flL8j6xJ1o0/Py
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="357109031"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="357109031"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739418877"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="739418877"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Jun 2023 13:20:40 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ze4-0006tD-2X;
	Wed, 07 Jun 2023 20:20:40 +0000
Date: Thu, 8 Jun 2023 04:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>, mani@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lpieralisi@kernel.org, kw@linux.com,
	kishon@kernel.org, bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] PCI: endpoint: Remove redundant dev_err().
Message-ID: <202306080418.i64hTj5T-lkp@intel.com>
References: <20230607093514.104012-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607093514.104012-1-yang.lee@linux.alibaba.com>

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230607]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Li/PCI-endpoint-Remove-redundant-dev_err/20230607-173708
base:   next-20230607
patch link:    https://lore.kernel.org/r/20230607093514.104012-1-yang.lee%40linux.alibaba.com
patch subject: [PATCH -next] PCI: endpoint: Remove redundant dev_err().
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306080418.i64hTj5T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git checkout next-20230607
        b4 shazam https://lore.kernel.org/r/20230607093514.104012-1-yang.lee@linux.alibaba.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080418.i64hTj5T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-mhi.c: In function 'pci_epf_mhi_bind':
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:347:24: warning: unused variable 'dev' [-Wunused-variable]
     347 |         struct device *dev = &epf->dev;
         |                        ^~~


vim +/dev +347 drivers/pci/endpoint/functions/pci-epf-mhi.c

7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  341  
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  342  static int pci_epf_mhi_bind(struct pci_epf *epf)
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  343  {
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  344  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  345  	struct pci_epc *epc = epf->epc;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  346  	struct platform_device *pdev = to_platform_device(epc->dev.parent);
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02 @347  	struct device *dev = &epf->dev;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  348  	struct resource *res;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  349  	int ret;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  350  
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  351  	/* Get MMIO base address from Endpoint controller */
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  352  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mmio");
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  353  	epf_mhi->mmio_phys = res->start;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  354  	epf_mhi->mmio_size = resource_size(res);
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  355  
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  356  	epf_mhi->mmio = ioremap(epf_mhi->mmio_phys, epf_mhi->mmio_size);
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  357  	if (IS_ERR(epf_mhi->mmio))
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  358  		return PTR_ERR(epf_mhi->mmio);
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  359  
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  360  	ret = platform_get_irq_byname(pdev, "doorbell");
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  361  	if (ret < 0) {
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  362  		iounmap(epf_mhi->mmio);
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  363  		return ret;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  364  	}
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  365  
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  366  	epf_mhi->irq = ret;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  367  
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  368  	return 0;
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  369  }
7db424a84d96b0 Manivannan Sadhasivam 2023-06-02  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
