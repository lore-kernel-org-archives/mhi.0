Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD83F9F3B
	for <mhi@lists.linux.dev>; Mon, 29 Jun 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726285; cv=none; b=gwwa/iG43SUepk0tKB5156r3gEh9ikeyaET4DEpVrM2B3/U8DEZg4uglMvJjNMfeM2W9XRt4QEHhBG/ThQlhzCSFFsHe+QDLzOMkrmaOJcJWt/QCWt15PqQza87tHihGspsXiUMNZIfenwLRXyA9C1FsW5/2zYPqmNxyoLPvxTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726285; c=relaxed/simple;
	bh=MjjXrkMnUwdq0FJ4Cu9/oZ/NIF4VGt0nFl1suBh70b4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0l+EAuriG1X0gmeMMDj1VX0GfElhoMW5j/Dy2pO9hwljRXegpjlNzE4eixpHchP0MP4S4v0GaAS6ISpZ4ecLPHRRy7iwJVRpkBTzdDKTqCdhXHKH3x0xsM8fX6VkVhmi/VtuufzT34CuzFyBvpYezg1fY95G6ZLeC2hwQCSeYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nq0dTQhO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLvw3uS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nq0dTQhO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLvw3uS2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rLfI2115401
	for <mhi@lists.linux.dev>; Mon, 29 Jun 2026 09:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=; b=Nq0dTQhObC4rViq8
	hHEZ1cCiH0k/XJAfNPJgmIX1a/lj4zi3R2RIn2uCc6bDwNWPmxVgpitUNAQtfPoA
	soN48DtvuBi0duKZozhcNkj3/BKV7Nkfu1Oapfs4FK8Wy5IDtQIdRmqiJWhfxFT+
	21BuaT7nZAYyZ1B8DNrxj323ONG2jt8M+lfHNwJhSO4y4T+Ya+725vXDoc+vxqGL
	1jor/PekNcFzoYt+9d6kK5+SPfQcA1t6O+jq8pFIbmvIynVwDdRPn15bFFLvBqNG
	+SYJdAEhTC0zFWxP50x/mgdQzXMZKSMVYhHlq6I/zbBpnWM/XyJrukNHo79Aqifg
	xqgepA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f2734dv9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 29 Jun 2026 09:44:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847950bb95cso193152b3a.1
        for <mhi@lists.linux.dev>; Mon, 29 Jun 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782726281; x=1783331081; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=;
        b=XLvw3uS2ltXduT0uVuwLou1Y+cc0kmmrickYwwwWAy/9mpzetzgXyM5185Gx66OEk7
         Szre/UMA+Q1XxjzJYWOHm7zWppy2P7ZEX227WPHHxr1nvsru0TkEz4CIErjtLHNTekWv
         vRJCo0MPBz9m3iaIBikMHebBRb1UlE84BIwyOOZ6psDPf4VchyWy9S+X+8gRMttGWzba
         zfLpbTiq2J3UGgOaEBmZO6txNh5wwaWykPee+lMevKXAjLa78WmKUATLb0hRO1aX9Drp
         2mkxCFhYFTj2EBr+InjxC9h61VPoBxVDEzYt58NK7dtNKn9zL1BoXdJBWfja7XT+L1V+
         J6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782726281; x=1783331081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29xDUNTed4jXAy3Mgxyo8ge5rsxJ/2Bn9rzkJN7OPjI=;
        b=Ao36kjQo2BddaJ0W1cmbPj2q9FPNGP89J2HUQ3XUvpq1eSCJx4wYoERJieevWuBzwI
         STLw/2gJkSIH20ubcRMUmzGGsWCoh+w8L6oGc+X+CXWMT0Rh0KhTOBuomokxFrdZ9YLM
         wrjhoajLPzV30Qsk093rZAxlHQrd7bE0LilHGqdkJBn2XvYDmMC6gz9kdrTKN9ccNgbe
         /nRn3DVRGmNJ/4cKrzB/MNv+9+po412ya15jQL29rRoMdbL8D7O011i7+DLmpk2id25c
         HK43d99KMpANayY859BuSHDG8RpIr1Vicy3/NouR7IacnbrN9lsq1ErvNn/YoLaXCcAZ
         HmVg==
X-Forwarded-Encrypted: i=1; AHgh+RrJYDpvuDJ4mIiBuGtokw+fVEA3K7tGVlJRDwX2ZkdDzo0vEEHSiQpOfL4/jsn8vHRjZnc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6KcAU9TYDZ3JxO6l1C4w+CuZV4T/ncuc0jfnixD4krvXrYZHE
	HJ6vfqtalTPrvFPByoONKYp1sKp6BCymW3viKZVpJ0tn6wAzsVMz6sNLJ7Rhe4mAqPnaVUwbDSY
	PIXmwkehZWPhLP4u1eYUrne6Kd4w1IITzxrYdcpUh34NKArufD5Xv3MY=
X-Gm-Gg: AfdE7ckQsAwdB7O90/emtPtaVBz9//q4AyRgZonPvbqZVZBDEKYY9jX28uFrDv17fPJ
	mg3WZ8gW1ivVC+v86ujGwA8dm6j7p/lRElQvStbMTiLcsn6Ak8bQfZVtGgiGblmq7SfwO15uGLG
	bsrn6tSkQnbMZn6NY43Oc/cwxLhUrXM5ML1Qi2TMtXoO4c432TF2wNhaf4Ebsk3AfQW7/Qrxch4
	uo8IRTybpBv0ajntIL7TMf8q0cMqASGBc68aE2FRb4a1b4ttKwnyv/coOuO8pHuTtJfdqs0uIbA
	5WpRkjbghoSP9MRu3KapMbMGIm0FWNSs/R2Eng/lcSE6T7ZloQ34XZ/tEJnjQwUzB/z9mtME34B
	MXsnBUdpx27/aYe+F1+sOpHZiv5I+Fd5Ua9pXl6Y3owHE6kzG9Hz09KJXmmYTNtYggSYbEGH5o7
	eKfhJErQ==
X-Received: by 2002:a05:6a00:2d8d:b0:847:9692:5cb4 with SMTP id d2e1a72fcca58-84796926134mr348458b3a.53.1782726281027;
        Mon, 29 Jun 2026 02:44:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8d:b0:847:9692:5cb4 with SMTP id d2e1a72fcca58-84796926134mr348440b3a.53.1782726280533;
        Mon, 29 Jun 2026 02:44:40 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847833efe03sm1741991b3a.44.2026.06.29.02.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:44:39 -0700 (PDT)
Message-ID: <b2f3eb30-ff30-423b-aa8e-3cdf47aa600f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 17:44:35 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] Add device-specific reset for Qualcomm devices
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
        alex@shazbot.org, jjohnson@kernel.org, linux-pci@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260623183115.1585273-1-jtornosm@redhat.com>
 <4cdfb71b-2ef8-4985-8294-c4a29e37faa3@oss.qualcomm.com>
 <l3pcelhxn46p4smkkg5yob5enf4d4garp2p6macopnq5h2gwyf@zbbn65k4tz2q>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <l3pcelhxn46p4smkkg5yob5enf4d4garp2p6macopnq5h2gwyf@zbbn65k4tz2q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J5KcEeVusMAGtpy-gQto1HTBsh66W4av
X-Proofpoint-ORIG-GUID: J5KcEeVusMAGtpy-gQto1HTBsh66W4av
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3OCBTYWx0ZWRfX+tF5+1Pta48G
 eRppX2QyGoVUpd96B1omMI0BLKLSFGPNZPUZnPQjvqsyH5S5gXTzZwv4j3m33FJ61HnGYvp3cb7
 sfb/5qDZiVeTepi5JMIbemrD+0y4+0k=
X-Authority-Analysis: v=2.4 cv=HYokiCE8 c=1 sm=1 tr=0 ts=6a423e8a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=RRcNAnSy7hG7cj1Ejq8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3OCBTYWx0ZWRfX0U+B3BjEHqC+
 ynRqtISPZt/7h19Q0zNxRr9Gcz6PzJ5RNstWCIzR7s5lxo/WGCag4jmlJ9UPKtBk/A5HU/ZA2jp
 qA/wQ0oFVVbl6jo++JUG1YFZYctH9Lsl1/F0EGrksSjJ+XalI7byrSP0cLYM9Y29KMn0/4Zh7Mn
 RbFjALocoQBdHgW4sVV8sByWijQYwTt+/k9XFqrcMZ/f3zGkgDrcnguneOGxMtHB22TB0ko8xOq
 p1rg9TXonk9uXfF2UVNzgp3UHs9t1VW9gVDokKXpr35qn4k243SOgRTSWGVhQfyC1j5j4vYYK0v
 bVkXp8FTG0DX2HpaCFqi5UOPEpojcXLwso8ujcTI421fxheaUKz9njRikFLWuVHAXiBW1Rjhrf6
 tPwY2kopMOCviK7LYfzdEri1RCLqaeJHNRDrFLarROYnhViazjafIp0ZiGCewGpo6gCBkzAjYOo
 ZQMA5kPdkgb4eYDnZbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290078



On 6/25/2026 9:03 PM, Manivannan Sadhasivam wrote:
> On Wed, Jun 24, 2026 at 03:47:12PM +0800, Baochen Qiang wrote:
>>
>>
>> On 6/24/2026 2:31 AM, Jose Ignacio Tornos Martinez wrote:
>>> Some Qualcomm PCIe devices (WCN6855/WCN7850 WiFi cards, SDX62/SDX65 modems)
>>> lack working reset methods for VFIO passthrough scenarios. These devices
>>> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
>>> broken bus reset.
>>>
>>> The problem manifests in VFIO passthrough scenarios:
>>>
>>> - WCN6855 (17cb:1103) and WCN7850 (17cb:1107) WiFi devices:
>>>   Normal VM operation works fine, including clean shutdown/reboot.
>>>   However, when the VM terminates uncleanly (crash, force-off), VFIO
>>>   attempts to reset the device before it can be assigned to another VM.
>>>   Without a working reset method, the device remains in an undefined state,
>>>   preventing reuse.
>>>
>>> - SDX62/SDX65 (17cb:0308) 5G modems: Never successfully initialize even
>>>   on first VM assignment without proper reset capability.
>>>
>>> Add device-specific reset methods using BAR-space hardware reset registers
>>> that exist in these devices:
>>>
>>> - WCN6855/WCN7850 WiFi devices use SoC global reset via BAR0 (sequence from
>>>   ath11k/ath12k driver: ath11k_pci_soc_global_reset(), ath11k_pci_sw_reset(),
>>>   ath11k_mhi_set_mhictrl_reset()):
>>>   - Write/clear reset bit at offset 0x3008
>>>   - Wait for PCIe link recovery (up to 5 seconds)
>>>   - Clear MHI controller SYSERR status at offset 0x38
>>>
>>> - SDX62/SDX65 modem devices use MHI SoC reset via BAR0 (sequence from MHI
>>>   driver: mhi_soc_reset(), mhi_pci_reset_prepare()):
>>>   - Write reset request to offset 0xb0
>>>   - Wait 2 seconds for reset completion
>>>
>>> These are true hardware reset mechanisms (not power management or firmware
>>> error recovery), providing proper device reset for VFIO scenarios.
>>>
>>> Testing was performed on desktop platforms with M.2 WiFi and modem cards
>>> using M.2-to-PCIe adapters, including extensive force-reset cycling to
>>> verify stability.
>>>
>>> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
>>> ---
>>> v10:
>>>   - Complete redesign based on maintainer feedback (Manivannan Sadhasivam,
>>>     Alex Williamson): use actual hardware reset registers from
>>>     device drivers instead of D3hot power cycling
>>> v9: https://lore.kernel.org/all/20260612142638.1243895-1-jtornosm@redhat.com/
>>>
>>>  drivers/pci/quirks.c | 118 +++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 118 insertions(+)
>>>
>>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>>> index 431c021d7414..8ad3f214e520 100644
>>> --- a/drivers/pci/quirks.c
>>> +++ b/drivers/pci/quirks.c
>>> @@ -4240,6 +4240,121 @@ static int reset_hinic_vf_dev(struct pci_dev *pdev, bool probe)
>>>  	return 0;
>>>  }
>>>  
>>> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET	0x3008
>>> +#define QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET_V	BIT(0)
>>> +#define QUALCOMM_WIFI_MHISTATUS			0x48
>>> +#define QUALCOMM_WIFI_MHICTRL			0x38
>>> +#define QUALCOMM_WIFI_MHICTRL_RESET_MASK	0x2
>>> +
>>> +/*
>>> + * Qualcomm WiFi device-specific reset using SoC global reset via BAR0
>>> + * registers.
>>> + */
>>> +static int reset_qualcomm_wifi(struct pci_dev *pdev, bool probe)
>>> +{
>>> +	bool link_recovered = false;
>>> +	unsigned long timeout;
>>> +	void __iomem *bar;
>>> +	u32 val;
>>> +	u16 cmd;
>>> +
>>> +	if (probe)
>>> +		return 0;
>>> +
>>> +	if (pdev->current_state != PCI_D0)
>>> +		return -EINVAL;
>>> +
>>> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>>> +	pci_write_config_word(pdev, PCI_COMMAND, cmd | PCI_COMMAND_MEMORY);
>>> +
>>> +	bar = pci_iomap(pdev, 0, 0);
>>> +	if (!bar) {
>>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	val = ioread32(bar + QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET);
>>
>> QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET is beyond the first 4K bar area hence requires MHI
>> wakeup before accessing, see [1]. the wakeup callback for WCN6855 is
>> ath11k_pci_bus_wake_up() which calls mhi_device_get_sync(). Not sure how this can be done
>> here. Maybe Mani can provide some hints?
>>
> 
> I don't think the device needs to be waken up before
> QUALCOMM_WIFI_PCIE_SOC_GLOBAL_RESET. ath11k driver wakes up the device for
> accessing the MHI interface I believe. Since this callback is not touching MHI,
> there is no need to wakeup the device, AFAIK.

MHI register space is constitute with 3 segments, with mhi offset always being 0, bhi
offset 0x100 and bhie offset 0x224 (the latter two offsets are for WCN7850, but I think
also apply to other devices). That said the whole MHI register space does not go beyond
the first 4K region, hence wakeup is not for accessing MHI interface.

> 
> - Mani
> 

