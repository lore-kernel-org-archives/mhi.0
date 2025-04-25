Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E728BA85
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 15:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596662; cv=none; b=du0NFpepyJVYxofumJyur05SB6YX1NqE/wmvoph+68zdmw4yoflCYUQyX38rqP1ETF1rmF3wCNe8h3OsWAXE1J++kZxuSYrnbmLbIcd6XJMzH85VQQa7fXyzqm3tCWYNkG8M5hG62RehCEjMZN/RSNe3QnK+rfrFRNbw3E0y4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596662; c=relaxed/simple;
	bh=GrbOWzhD8A9EcQ9/oMNEwl0tUg9WzmBru/yKPO/Wkt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlpDYcG7biIAqqx4fJjL17W84h1aql3dw0+LzBDZrQHvyER4TGLaujOASMWKGveXX8kq/L7w0jxi0U+Ry0AyUCtYtDcTbTSdwUVmSfbFnVY+p0ttt5m4QFdL9JtHybOgUKE4j2kBXGmLfeXNkkS5s3WrFZT8qyYS40/QCWl8qr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDzmufj9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDzmufj9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739be717eddso1954535b3a.2
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745596659; x=1746201459; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=;
        b=iDzmufj9sIQ2i4+WaKH/7Tm5h0AwrRJvUGR8Uys29S8XHTVv2Ld2irNmQVq0TChwAB
         tBIeGmhajlpQYHSjhBnc3aH39D9C17PXoAkvgLoY8qsHqHLqPK4uhs0o63zZvxdZMoLR
         nfdmg6Hn4pOnH4OKK+2PFgqD9ZJ9078ThO7d2Varw5IunosEl0zaXmG7X1G9GIW6gjlH
         Gl8nAN2B48Nb0Ekw67bl5+q5rIXTc7moDFtOxKzaqPkDVaXRBtDgTPcLmNcIRjVjeTVd
         kypGn+I0LLmEGbflQCjil6ubawNqBzZV1dybciHKvfA69ZS/t6iTUkexQcjvdtZfRrld
         l6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745596659; x=1746201459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utSRlvWwaJPUba2da6V5YeBrAL7QiUQpMkQtkrVxrps=;
        b=LkIDGHzD5842MFBPsUl1zkBBeB7N72DWUSEJouTv7TboQpFydUYs+9UR/XGyEe9qps
         Z7/K0opdylCILt6FbxLmTbDMu36lTEdUr8aryRb4Afb590IE/rhw2bW2l6o1ZRqDZlz6
         WseZqZHdY6Kum2+hpcfcIV4zzWokZb/XDEiiTaX21H4nnpcWJIeyJmhnWGJPBNt7AsDg
         /7do81H9ZM53LNspufmT9WjxpL/ysJUzpNft6mGwZ2ULSMh3JIjSN0dn/tu2jqxb/1mP
         JMzCYlEzvhUOPL8xjoYrWfyjSH5ZH5aHHeZX50L+xSFIXejFXXv48tcdv2Xih/IowkQH
         +D5w==
X-Forwarded-Encrypted: i=1; AJvYcCWPupk3yhSdPaH6oREKRQcwICXWTjK0UVkQWzXaw/jDg3p9LcD0rCh+bvlp4N/xxmOmm6c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAx1ytMbKiOz/7ra6nwS1hVdQUsHWEDaywptTi3EDeMRMBsQck
	dZEm/z1K2ZVmkKI6I/CtEx/vkjodAHiLSwYIyVLum6nFp8JC8oZhfuXBnnsQjA==
X-Gm-Gg: ASbGncvNNPd7fNG8LXh/55IG0zMv54qDxAON+oKNL1g0m6E32W1GUZmzFbfDduL4RJK
	CitimLJf1BpIAAa0UfGX9sHLV/sGgApQPTl7DMw8ANaRWYcqHZAzGXH7jRjKH1gzBIc2G5Ihz1r
	RG6qLxeU1UYdYTD9vMpsd+6aT4NMflCdqTCMVNqIjGrOoACjqHfL2Ip/INlWcOGNI2ysjg3N0Vc
	QSh3Cp2HjMQQ5iJF61FtrqBXEqJJ720Klu5d5LJNebKs9Jyeuu1MelEW6tADI+ieb945FwrtF/8
	2FvbLGp7617ijbNXPfiHNUPfd+cahRblm0xurXK/mLMXPSk7Ld+4
X-Google-Smtp-Source: AGHT+IEv9WTyD1hNXstYJB7wgOh80HyepKndFk0b9Nsc+PbCz+wAO+jxkDebi/3q0xjNfV/24gj4Tg==
X-Received: by 2002:a05:6a00:b93:b0:736:3be3:3d77 with SMTP id d2e1a72fcca58-73fd8b6be23mr3721308b3a.16.1745596659476;
        Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
Received: from thinkpad ([120.56.201.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912c94sm3344436b3a.3.2025.04.25.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:57:39 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:27:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com, 
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
Message-ID: <7njsbucxngxc2eninh57oexywiqsyysrbesyige5zwr4pmxf7t@rw6657lheg4j>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>

On Thu, Mar 13, 2025 at 05:10:09PM +0530, Krishna Chaitanya Chundru wrote:
> If the driver wants to move to higher data rate/speed than the current data
> rate then the controller driver may need to change certain votes so that
> link may come up at requested data rate/speed like QCOM PCIe controllers
> need to change their RPMh (Resource Power Manager-hardened) state. Once
> link retraining is done controller drivers needs to adjust their votes
> based on the final data rate.
> 
> Some controllers also may need to update their bandwidth voting like
> ICC bw votings etc.
> 
> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
> the link re-train. There is no explicit locking mechanisms as these are
> called by a single client endpoint driver.
> 
> In case of PCIe switch, if there is a request to change target speed for a
> downstream port then no need to call these function ops as these are
> outside the scope of the controller drivers.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>  include/linux/pci.h       | 13 +++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 0a5e7efbce2c..b1d660359553 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  			  bool use_lt)
>  {
> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
> +	bool is_rootport = pci_is_root_bus(port->bus);

s/rootport/rootbus

>  	struct pci_bus *bus = port->subordinate;
>  	u16 target_speed;
>  	int ret;
> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  
>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>  
> +	/*
> +	 * The controller driver may need to be scaled for targeted speed

s/controller/host bridge

> +	 * otherwise link might not come up at requested speed.
> +	 */
> +	if (is_rootport && host->ops->pre_scale_bus_bw) {
> +		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>  
> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>  	    !list_empty(&bus->devices))
>  		ret = -EAGAIN;
>  
> +	if (is_rootport && host->ops->post_scale_bus_bw)
> +		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> +
>  	return ret;
>  }
>  
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 47b31ad724fa..9ae199c1e698 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -804,6 +804,19 @@ struct pci_ops {
>  	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>  	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>  	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
> +	/*
> +	 * Callback to the drivers to update ICC bw votes, clock frequencies etc for

s/drivers/host bridge drivers/

> +	 * the link re-train to come up in targeted speed. These are called by a single
> +	 * client endpoint driver, so there is no need for explicit locking mechanisms.

You need to mention that these ops are meant to be called by devices attached
to the root port.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
