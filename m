Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869425103F
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661418; cv=none; b=q8hM5AY8LC/LFBVQ844XOUSxE+L4Jm1S6dkWDIDxb6NGQ/VBNhkGJw9RRleSVjzOdzN7A6yEmEs4fzym0ppI/8vVtdlaWlCv0O351GNMb9LqlaHThYki1Gx4UIXc+GqMlYiIfaX6MkTkJnZnLE7pWVuYYN4dez++UnHUgMO1M/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661418; c=relaxed/simple;
	bh=jn8+LqZ4HK4vBVVQqZdDv+ihoDP6BFDKfhN7yPeNEac=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fnx+5VP6WRDUxtm80UP4+c9pXb1iJZIWozHOI+m8pWThdkP8oq8UvKXdsKag0dPepQM99Wto+MdkLmi5A19qqycEzT7wn/wlGe+oRD6zlXVWgyZnV4oEDmc637JCaVnCyYLxsFMhR4w6mYu3yTMRrmAJJPoUZYr33DdqhGTkXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYdYTA9J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYdYTA9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747661416; x=1779197416;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=jn8+LqZ4HK4vBVVQqZdDv+ihoDP6BFDKfhN7yPeNEac=;
  b=NYdYTA9Jm81lct7mENF5T9XhRGktBa+xCo5ePleWb7pxqPLHzXsH7X6C
   4A4PaJZe/LKvl7d8gq2mQZiI0k7NEtJv4DS4DUJgM27iXqssJxxq3JdUn
   59tu3ArE6d799lXylokSTveTMhCQ3ntLX94O1HJc5p5AIZ1WNjLYAtQ4K
   50LqhXsWy+TEeohcZ/ZgTvjJsw33NIMUHV0ih734bfIIc3JwiT0llt+d5
   QIs59nuLh8p89udvsgrs21ouIhzjwkAS7o7rbSOk2bkK1zQ9D0OE3Fw9n
   /ntbpY8oZwZyzFybjq0LhwkJRvyTapEk6vtPYtnvotfbeKgcF3MBMmhE4
   g==;
X-CSE-ConnectionGUID: SVg2/E6NSKu5LYGn67SUXQ==
X-CSE-MsgGUID: mW8DUH/BQruILcRkzOF8lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49625768"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49625768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:30:16 -0700
X-CSE-ConnectionGUID: /UHagtsZQ2C0NZ93j31Igw==
X-CSE-MsgGUID: ZOmbe/ZFRBOhjbuGEFihvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="162659044"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:30:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 16:30:06 +0300 (EEST)
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/11] PCI: Export pci_set_target_speed()
In-Reply-To: <20250519-mhi_bw_up-v3-9-3acd4a17bbb5@oss.qualcomm.com>
Message-ID: <bfba6d6a-1880-a824-6418-f0f6ef6ff6f4@linux.intel.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com> <20250519-mhi_bw_up-v3-9-3acd4a17bbb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2092066973-1747661290=:928"
Content-ID: <ff8a6aeb-140a-fed4-c46c-3edcece60150@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2092066973-1747661290=:928
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <fef147ed-603d-e261-927f-91ab601d3a5f@linux.intel.com>

On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:

> Export pci_set_target_speed() so that other kernel drivers can use it
> to change the PCIe data rate.
>=20
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/pci/pcie/bwctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 3525bc0cd10f1dd7794abbe84ccb10e2c53a10af..02c544c6186b8c6b87730d1c9=
24f07858571d2ae 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum =
pci_bus_speed speed_req,
> =20
>  =09return ret;
>  }
> +EXPORT_SYMBOL_GPL(pcie_set_target_speed);

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.
--8323328-2092066973-1747661290=:928--
