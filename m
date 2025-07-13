Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607F8F58
	for <mhi@lists.linux.dev>; Sun, 13 Jul 2025 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752424702; cv=none; b=Z5v1ABhWO5lMsuV/WNalTWZA8ZuhCugSP/HqaucD76LCPE5TGqdqnemojF8P7FFh50CjqKxtY+iL9s4rahRfbr8qLIwLKDavUpZgTrsP9vDIqAqTnmHCzsYIG1P2ii1HyUjGKUef3xlVJ2THrNXvD5OTb3BNDRI9/pFgFsDQfBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752424702; c=relaxed/simple;
	bh=r9omAfQ62jAfsMfQ/qPf0fsbgkNejo1Y09cKhAXRXJ0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qWA3NR9VJU/u8vzWw5Y3wyhK8J1FKJB8MQPs1B4HGhT1djikOunji+/0AgOWROscbZMAaWAcjVyyXmOMh0a3BrIuUpI2rYoPf4aDfLcRyLyzQSzU6uveg1epSzglFUqMbPdubXXUF3EuOxHWMs0EWNVwT9zGE5idDmoybyN7Sbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oefpw/Z6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oefpw/Z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752424701; x=1783960701;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=r9omAfQ62jAfsMfQ/qPf0fsbgkNejo1Y09cKhAXRXJ0=;
  b=Oefpw/Z6hNYi7jOC2NTdOKJFI3daQSlYDGUWVx7kgL7RZwDzI4vOY6dO
   9+wUbWau3x40ZKYsYlJk9LqlTCq9prSra6I13fT+vwOBeuchO81LxkZYA
   uEurAk2fAs+fBO20FAJCnf5LV9SwWX4MDmc5QCNhU0UARwFRy74Zom779
   8uPln66+sEq3LqmjotocJLK3ZYneB0svLD7i+Aw4FpXKIa55IXWYsPb8x
   a9f148WS+U6RxPJBTx29SEc+y9ltSh4sbh6qE10XBJXz8BS8gEtl6mRPD
   Y56Zo2xEoLrVGuq3nYufExKzqyW1+ms1guZv0IYVTq7HTEXt4sBj+aVG/
   Q==;
X-CSE-ConnectionGUID: vKIfUYoSQYie3+h8zEHgQg==
X-CSE-MsgGUID: 94w/QUcLSZibnNYUP3Yjog==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53854143"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="53854143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:38:20 -0700
X-CSE-ConnectionGUID: Is+ut3sfT++qm9bRIX89+A==
X-CSE-MsgGUID: DAa15wyZRYCmBidYqDsthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="193961296"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 09:38:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 13 Jul 2025 19:38:09 +0300 (EEST)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
    Manivannan Sadhasivam <mani@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
In-Reply-To: <20250711230013.GA2309106@bhelgaas>
Message-ID: <84f1ddef-b4a1-958f-96f1-c84f2fe0baf3@linux.intel.com>
References: <20250711230013.GA2309106@bhelgaas>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1407827006-1752423401=:951"
Content-ID: <47e4c48a-96af-e668-6d87-dc9de7a75f73@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1407827006-1752423401=:951
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5ac44928-7118-d9fe-5985-2f62ffbf9046@linux.intel.com>

On Fri, 11 Jul 2025, Bjorn Helgaas wrote:

> On Fri, Jul 11, 2025 at 04:38:48PM +0300, Ilpo J=E4rvinen wrote:
>=20
> > +++ b/include/linux/pci.h
> > @@ -1826,8 +1826,8 @@ static inline int pcie_set_target_speed(struct pc=
i_dev *port,
> >  #ifdef CONFIG_PCIEASPM
> >  int pci_disable_link_state(struct pci_dev *pdev, int state);
> >  int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
> > -int pci_enable_link_state(struct pci_dev *pdev, int state);
>=20
> AFAICT there's no caller of this at all.  Why do we keep it?

It was added to match the disable side despite not having users. I don't=20
oppose dropping the unused one.

> > -int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>=20
> We only have two callers of this (pcie-qcom.c and vmd.c, both in
> drivers/pci/), so it's not clear to me that it needs to be in
> include/linux/pci.h.
>
> I'm a little dubious about it in the first place since I don't think
> drivers should be enabling ASPM states on their own, but pcie-qcom.c
> and vmd.c are PCIe controller drivers, not PCI device drivers, so I
> guess we can live with them for now.

There seem to be some drivers which have issues if certain ASPM states are=
=20
enabled during some phase of operation, so they'd want to disable ASPM=20
for a while and re-enable it after past the danger zone, which is why I=20
had to create the symmetric pair for disabling states in a series trying=20
to remove custom ASPM code from other drivers (these patches are extracted=
=20
from that series). Currently those drivers mess with LNKCTL directly.

(The driver changes we not finished because it seemed I'd have needed to=20
add some ops to allow writing HW specific registers of ASPM state change=20
which the ASPM driver could invoke to infor the driver about state=20
changes.)

> IMO the "someday" goal should be that we get rid of aspm_policy and
> enable all the available power saving states by default.  We have
> sysfs knobs that administrators can use if necessary, and drivers or
> quirks can disable states if they need to work around hardware
> defects.
>
> I think the compiled-in aspm_policy default and the module parameters
> are basically chicken switches that only exist because aspm.c and some
> devices aren't robust enough.

There's also too much custom code in drivers currently.

--=20
 i.
--8323328-1407827006-1752423401=:951--
