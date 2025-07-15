Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CAC1F416A
	for <mhi@lists.linux.dev>; Tue, 15 Jul 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752590990; cv=none; b=VDw1Oj/QWzmBBfyWWRZPXOXW41wuIPiwSB5QYcnUZYqcubLkUKdK8jmRqZt3BwTYMWrj9g0vl94Zyfr0AVrCOaYdXLd9G5LvWmtfqiVWK3n84+jVUFNSYvTpjBfWfwz4z8xvELkuNOJV3v/UfBzfQ4nOmIiGNu45UTnTo7vqOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752590990; c=relaxed/simple;
	bh=KwW3Ct+eYQAN7duoTjUPdigF52dVr0dEmIwj3cGLFWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4Zl5NmYAAUdX1KoaiE6SN8O520l5UxL2790UX5U+CHtHokxRWIcCWa5psNlN81uVUrgqIshKRBpZDWV4e7hWgGqin65b95tTxQul7imVSh17YjVRToU9wzvQ1QmYlYrNcW1LeJFozk9JR9DvA5dgotI50RTN1SvYdnieiveT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DV3FuCcu; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DV3FuCcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=y8FmBktC9WSRYxvxolkGYL5S4AI0gxd1QPXCyRbb+Bw=;
	b=DV3FuCcum96CB6OJl3oa/EcvfiVGdVsWmvSySDMjIyTZCnpMC4bboVdDK+mD72
	GtTSSKWuSnsg+whFjBRn8GL29NJh9i/eTQ4cD8j1VMxO6p5BvyrgKhq8LkBu0ksv
	MNbGlbHEC2XQO11n4cIfhSj3hQLoS3vZBSMdzm35evdjk=
Received: from [IPV6:240e:b8f:919b:3100:7981:39b4:a847:709a] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH7fhVanZoxSGjFA--.45568S2;
	Tue, 15 Jul 2025 22:48:54 +0800 (CST)
Message-ID: <7da900a6-04cd-41f7-afc8-5570eb7639e1@163.com>
Date: Tue, 15 Jul 2025 22:48:53 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250714193214.GA2415073@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250714193214.GA2415073@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAH7fhVanZoxSGjFA--.45568S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFW7tw18Gry7Cr1DXFW5ZFb_yoW5Xr1xpa
	yrtasIkFZ5Jr97Gw12vw1jqF4SkwnYy345G3s5tryUJw45u39xGr4xtrZY9F93WrWxW3ya
	vrZ8WwnrZFyq9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URa0QUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQwWLo2h2Y3mQSAAAsy



On 2025/7/15 03:32, Bjorn Helgaas wrote:
> On Sun, Jul 13, 2025 at 12:05:18AM +0800, Hans Zhang wrote:
>> On 2025/7/12 17:35, Manivannan Sadhasivam wrote:
>> ...
> 
>>>> IMO the "someday" goal should be that we get rid of aspm_policy
>>>> and enable all the available power saving states by default.  We
>>>> have sysfs knobs that administrators can use if necessary, and
>>>> drivers or quirks can disable states if they need to work around
>>>> hardware defects.
>>>
>>> Yeah, I think the default should be powersave and let the users
>>> disable it for performance if they want.
>>
>> Perhaps I don't think so. At present, our company's testing team has
>> tested quite a few NVMe SSDS. As far as I can remember, the SSDS
>> from two companies have encountered problems and will hang directly
>> when turned on. We have set CONFIG_PCIEASPM_POWERSAVE=y by default.
>> When encountering SSDS from these two companies, we had to add
>> "pcie_aspm.policy=default" in the cmdline, and then the boot worked
>> normally. Currently, we do not have a PCIe protocol analyzer to
>> analyze such issues. The current approach is to modify the cmdline.
>> So I can't prove whether it's a problem with the Root Port of our
>> SOC or the SSD device.
> 
> Have you reported these?

Dear Bjorn,

I haven't reported it. Because we don't have a PCIe protocol analyzer to 
analyze this situation, it's not certain whether it's a problem with our 
SOC Root Port or the NVMe SSD. If I have time later, I will conduct a 
comparison test on the RK3588.

> 
>> Here I agree with Bjorn's statement that sometimes the EP is not
>> necessarily very standard and there are no hardware issues.
>> Personally, I think the default is default or performance. When
>> users need to save power, they should then decide whether to
>> configure it as powersave or powersupersave.  Sometimes, if the EP
>> device connected by the customer is perfect, they can turn it on to
>> save power. But if the EP is not perfect, at least they will
>> immediately know what caused the problem.
> 
> We should discover device defects as early as possible so we can add
> quirks for them.  Defaulting to ASPM being partly disabled means it
> gets much less testing and users end up passing around "fixes" like
> booting with "pcie_aspm.policy=default" or similar.  I do not want
> users to trip over a device that doesn't work and have to look for
> workarounds on the web.
> 
> I also think it's somewhat irresponsible of us to consume more power
> than necessary.  But as Mani said, this would be a big change and
> might have to be done with a BIOS date check or something to try to
> avoid regressions.
> 

Ok. I understand your purpose now.

Best regards,
Hans

