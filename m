Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D57A369D4A
	for <mhi@lists.linux.dev>; Wed,  2 Sep 2026 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325213; cv=none; b=IIy4v8YFLVunr5neVdE70NTYs10Npt/Vi/QvhRalQ3sFoSq7/yV/s81Mu75crendFW73b46MrZ5NGLfl72AHnSgttVLZWMwUEbPGHRHj0gJ17xUUMHIk5CK2RB9H7FPP6bJ3E6u5d1rR/0bWojSctZJp7msKyvxwD27j8y1O9VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325213; c=relaxed/simple;
	bh=ix8Jt+hM1Cyp6m5izLCaQAzM7nA2N4MeyGqMXpmFjng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7tMkhyDpvQqw9ZSkXQaBi7mucEAwTcdNBityG3HCtlrbEwB1mZy2OfXkK/2JJrJVviopsh7BPsZAV0WLpf6x7aDkEpCP8LuhvKtm1zEf0a1wHa8nJ6tfODC0uk9CTetB+Wt9zBb6d6XBTb4nb+SWjEbWJvgbi1FKQ0kIzqnJGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFf5Fk2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdhLmlhc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFf5Fk2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdhLmlhc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KT9mK3108191
	for <mhi@lists.linux.dev>; Wed, 2 Sep 2026 05:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=; b=GFf5Fk2rMsztuFcz
	rFmQPBTUWjFkRyhhCNt//wTiHOe8no+ew81UVhl6HD5kiqdRZLffl9GwRWbKN+OG
	/vTbnP5izCxS6drAj+WagZ6tFSD4s2AeF+qu0SGmXIGZjMaUYqSeMO/GpbOYhLP/
	Op4SJHWfjrbpGQpaBkHZ587N01DNiaZEEsDWuFrrm9aVxy4pRUZ5Vi4eLXVO7UTU
	I5SnVcDRPIV/vDVMJP6o+iibdEH/dhoBKLhEh56YfpXwlQrcerIuA39uuRLyzWw6
	gikWwFGy/JI0FycFr4N5/namFdwUVYlom2KQsKY8Ly9ytf0BP166LvtTy262jOjI
	vp6YCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpaq2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 02 Sep 2026 05:00:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1270680a91.2
        for <mhi@lists.linux.dev>; Tue, 01 Sep 2026 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325211; x=1788930011; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=;
        b=HdhLmlhchXyFdlFplRQHcbBONkedM3WHnJ2G5UqVASKugOwPpkvHL8knJrZSSmv6SU
         4deHeq38BptuuL3U5YGyeabMmurMbWCyzNA8MK820km+7yuKjA1zlzNUXYqM5iLUdjoS
         Yr1qroeGbSat4dAzrBlRlsmtehLXJCZeb0RN96e67cHQKlZQ7euCT3t7LofMIS/fVGnM
         BUlYfO+P/a+m2MtzZoMI9HpqPX5sXQ+CdKfHXk3FftYEeNqprIfTvk9qlHnshcUCF4Wk
         0bH/z6t5U/x5O+5O/oBTagCqRvPWiD6Q+McsQI6URZDCeftHYmfr8huFXVVt1V6vpxC3
         A9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325211; x=1788930011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=;
        b=pUxVLA+/7o5EAlrqSyXVY6hR7EDspts8HSZBK5vkLuUqfLxh8mLKbXkajZyVOqZNGK
         8fhuShkLy1y9oBMWXlvA4s4mL4HrguQLx5ebsDJU2aTZpZzKu+WLF1g02VQ0wEW95KB+
         6WbIhDTMgVRE3U+EJ26SCxfuC13f270NLSgwTQcZeADi9FqXqe9xMtazlaQKMielGkw7
         S8LBVPbydb3bqj1vFu4UFCF4yEw+sivwv+i+30aX1sik7/MN1WiaOEURtM+beXBBNkNu
         A29181pdZZuW9+Ae6KOG/3/cbNZdkqF/sVYIIuzFTrIZV7cdAew5VC3ax2bafCEpnTxs
         4dwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRe1yO9eCn1jt5XtDvtBETh1AM1eFuDsCrGRC4vKSiqW1e3kHmpdmthHYy65sWqm3/kiQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kGQ6Jy+wgOqb8db2l+jQ/qEECDLSqJ2DR+pvg+6vVahD9hsewZ
	gpnFI4nf6nBr71Djh1VCRPTatMq6esQsHCJ2nYx7hJNs7B4dF0UXtcOf7Y5OWVamNDj7T2b7Af6
	bHI0AXcJu+ESv+X8VvPoxUBE4mncCkis1L1yn/yNnXCBMiM+zPOEY8ZE=
X-Gm-Gg: AYBFou1ktM37ynXYyX5UiInSrxBLoDBSAoBnnPu8zoC2yv/7XoPyHVoJyoe3iftk+V0
	e/5i0TPcgP9O9KXEqGhqehDtgIM+/cGtsKl34OTWCIVQOQFLF+/UqQrKNRgy+Y7utxIN/aaxJSX
	490tiplwRDmAfPzB9WoxLqvn06deBcLVxH4tbrLZ4hNW/Dp+2Xw7zhZ0WlvL6s8oB0CfOEYQ4Jt
	BenCkbIoRy/DWkTDMBTMNALLa/xc5BE3AQdJwgrd2KqkWxiLaKMtuNazX89jGXXNmO+xQAo6U/5
	CXXauQeAjaISwzDnezXSjBePXCZSdwd2IRaXPPnYWdGgGMHKxH50zdburjoFLSOQ1MK/+FrE5PJ
	7E3sJMPhuUxhhqYv4zClKhFr+4dbs187X
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr3407247a91.11.1788325210731;
        Tue, 01 Sep 2026 22:00:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr3407173a91.11.1788325210150;
        Tue, 01 Sep 2026 22:00:10 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1a82sm2988817eec.10.2026.09.01.22.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:00:09 -0700 (PDT)
Message-ID: <50c5aa2c-32a8-42be-9947-f18994071863@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:30:03 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] bus: mhi: host: Add support for Bandwidth scale
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-4-6dea79786b37@oss.qualcomm.com>
 <tm33xb3nrq7v6ezoewvn34rteg47pmow27kda5mdmoufsckw7t@tzssd2mqm5zt>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tm33xb3nrq7v6ezoewvn34rteg47pmow27kda5mdmoufsckw7t@tzssd2mqm5zt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97ad5b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=H7oXqyE-OcRDxyOYSJ4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HUrBT-4Fk9RFgRyarBDintk7Kxcq6NQd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX1p3R8t4kFlgF
 CydrM8CYEnDsvyhU8dffyyuqAss6PcJW5asRiTbv+W68tMJkcl/ZuF5Pyko1wdygcXvDVk4CHFL
 9XtT5r8JMR9UT//uAYBeLhNFIurruDg=
X-Proofpoint-ORIG-GUID: HUrBT-4Fk9RFgRyarBDintk7Kxcq6NQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfXweKvvP2KlIcw
 FYnybGG5oeqDcrnIfjWh4PW2TH1oS01UQlHlwE57HXgViu1hBIONRtXbfwGTt56IiqLCNuom06O
 jOSt2kHrtlvPtylYinnHb7c51ZR6q2UpEfOUTKgjUuQESNrGSnPNiHqg84x47oYinPp05KDhdke
 PQl2O6UUyIloOT56xsu9TTAmx6lXMO4m2WqpHVOSRR60YsnWMSrdsZaW57CzCNAPgPcUek3BdF/
 fB2kvmDMh1dKO3JpdoguazuRmqNALzMvayjsn6jxImggbrTxH2zGbRfth06qnFAREdYcUGcVdKy
 E+nkfMfG+Vgt4uwLFcNXOygG6fliE5zNPQZKBxGbkPEi6ssmzDmkENpcgCE2mR2Jimx6u+zOaFp
 9FKHx54AW+t/ySjN3iF/dUuWos+HkuuP3Z8KKvbYDn68XgfG6RawVa+iuBTcpEOLP0Dff6JxdNT
 FrOWzmLIySxh2oeWmTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020042



On 9/1/2026 1:36 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 19, 2026 at 06:55:55PM +0530, Krishna Chaitanya Chundru wrote:
>> As per MHI spec v1.2, sec 14, MHI supports bandwidth scaling to reduce
>> power consumption. MHI bandwidth scaling is advertised by devices that
>> contain the bandwidth scaling capability registers. If enabled, the device
>> aggregates bandwidth requirements and sends them to the host through
>> dedicated mhi event ring. After the host performs the bandwidth switch,
>> it sends an acknowledgment by ringing a doorbell.
>>
>> if the host supports bandwidth scaling events, then it must set
>> BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
>> doorbell that will be used by the host to communicate the bandwidth
>> scaling status and BW_CFG.ER_INDEX to the index for the event ring
>> to which the device should send bandwidth scaling request in the
>> bandwidth scaling capability register.
>>
>> As part of mmio init check if the bw scale capability is present or not,
>> if present advertise host supports bw scale by setting all the required
>> fields.
>>
>> MHI layer will only forward the bw scaling request to the controller
>> driver since MHI doesn't have any idea about transport layer used by
>> the controller, it is responsibility of the controller driver to do actual
>> bw scaling and then pass status to the MHI. MHI will response back to the
>> device based up on the status of the bw scale received.
>>
>> Add a new get_misc_doorbell() to get doorbell for misc capabilities to
>> use the doorbell with mhi events like MHI BW scale etc.
>>
>> Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
>> which will called by the mhi controller driver can sleep.
>>
>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/bus/mhi/common.h        |  13 +++++
>>  drivers/bus/mhi/host/init.c     |  93 +++++++++++++++++++++++++++++++--
>>  drivers/bus/mhi/host/internal.h |   6 ++-
>>  drivers/bus/mhi/host/main.c     | 113 +++++++++++++++++++++++++++++++++++++++-
>>  drivers/bus/mhi/host/pm.c       |  10 +++-
>>  drivers/bus/mhi/host/trace.h    |   7 +++
>>  include/linux/mhi.h             |  13 +++++
>>  7 files changed, 247 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>> index 4c316f3d5a68..267260901a41 100644
>> --- a/drivers/bus/mhi/common.h
>> +++ b/drivers/bus/mhi/common.h
>> @@ -215,6 +215,19 @@
>>  #define MHI_CAP_ID_MAX_TRB_LEN		0x5
>>  #define MHI_CAP_ID_MAX			0x6
>>  
>> +/* MHI Bandwidth scaling offsets */
>> +#define MHI_BW_SCALE_CFG_OFFSET		0x4
>> +#define MHI_BW_SCALE_CAP_ID		(3)
>> +#define MHI_BW_SCALE_DB_CHAN_ID		GENMASK(31, 25)
>> +#define MHI_BW_SCALE_ENABLED		BIT(24)
>> +#define MHI_BW_SCALE_ER_INDEX		GENMASK(23, 19)
>> +
>> +#define MHI_TRE_GET_EV_BW_REQ_SEQ(tre)	FIELD_GET(GENMASK(15, 8), (MHI_TRE_GET_DWORD(tre, 0)))
>> +
>> +#define MHI_BW_SCALE_RESULT(status, seq)	(FIELD_PREP(GENMASK(11, 8), status) | \
>> +						FIELD_PREP(GENMASK(7, 0), seq))
>> +#define MHI_BW_SCALE_NACK			0xF
> 0xf
>
>> +
>>  enum mhi_pkt_type {
>>  	MHI_PKT_TYPE_INVALID = 0x0,
>>  	MHI_PKT_TYPE_NOOP_CMD = 0x1,
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 32db4aa4bbe8..d0975b6c2df0 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -497,10 +497,66 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
>>  	return 0;
>>  }
>>  
>> +static int mhi_get_er_index(struct mhi_controller *mhi_cntrl,
>> +			    enum mhi_er_data_type type)
>> +{
>> +	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>> +	int i;
>> +
>> +	/* Find event ring for requested type */
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>> +		if (mhi_event->data_type == type)
>> +			return mhi_event->er_index;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
>> +			     int bw_scale_db)
>> +{
>> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	struct mhi_event *mhi_event;
>> +	u32 bw_cfg_offset, val;
>> +	int er_index, i;
>> +
>> +	bw_cfg_offset = mhi_find_capability(mhi_cntrl, MHI_BW_SCALE_CAP_ID);
>> +	if (!bw_cfg_offset)
>> +		return 0;
>> +
>> +	er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
>> +	if (er_index < 0)
>> +		return er_index;
>> +
>> +	/* Initialize BW scale event ring resources */
>> +	mhi_event = mhi_cntrl->mhi_event;
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>> +		if (mhi_event->data_type == MHI_ER_BW_SCALE) {
>> +			INIT_WORK(&mhi_event->work, mhi_process_ev_work);
>> +			mutex_init(&mhi_event->mutex);
> Why do you need mutex only for this event and not for other events?
For other events we are using spinlocks, we can't use spinlock for this event
as pci framework is using mutex locks internally as part of
pcie_set_target_speed()
>> +			break;
>> +		}
>> +	}
>> +
>> +	bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
>> +
>> +	/* Advertise host support */
>> +	val = FIELD_PREP(MHI_BW_SCALE_DB_CHAN_ID, bw_scale_db) |
>> +			 FIELD_PREP(MHI_BW_SCALE_ER_INDEX, er_index) |
>> +			 MHI_BW_SCALE_ENABLED;
>> +
>> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
>> +
>> +	dev_dbg(dev, "Bandwidth scaling setup complete with event ring: %d\n",
>> +		er_index);
>> +
>> +	return 0;
>> +}
>> +
>>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  {
>> -	u32 val;
>> -	int i, ret;
>> +	u32 val, chdb_offset;
>> +	int i, ret, doorbell = 0;
>>  	struct mhi_chan *mhi_chan;
>>  	struct mhi_event *mhi_event;
>>  	void __iomem *base = mhi_cntrl->regs;
>> @@ -581,6 +637,8 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  		return -ERANGE;
>>  	}
>>  
>> +	chdb_offset = val;
>> +
>>  	/* Setup wake db */
>>  	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
>>  	mhi_cntrl->wake_set = false;
>> @@ -634,6 +692,17 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  		return ret;
>>  	}
>>  
>> +	if (mhi_cntrl->get_misc_doorbell)
>> +		doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
> Why can't you add the doorbell number to 'mhi_event_config'?
ack.
>> +
>> +	if (doorbell > 0) {
>> +		ret = mhi_init_bw_scale(mhi_cntrl, doorbell);
>> +		if (!ret)
>> +			mhi_cntrl->bw_scale_db = base + chdb_offset + (8 * doorbell);
>> +		else
>> +			dev_warn(dev, "Failed to setup bandwidth scaling: %d\n", ret);
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -778,6 +847,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>>  		case MHI_ER_CTRL:
>>  			mhi_event->process_event = mhi_process_ctrl_ev_ring;
>>  			break;
>> +		case MHI_ER_BW_SCALE:
>> +			mhi_event->process_event = mhi_process_bw_scale_ev_ring;
>> +			break;
>>  		default:
>>  			dev_err(dev, "Event Ring type not supported\n");
>>  			goto error_ev_cfg;
>> @@ -1001,10 +1073,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>>  
>>  		mhi_event->mhi_cntrl = mhi_cntrl;
>>  		spin_lock_init(&mhi_event->lock);
>> -		if (mhi_event->data_type == MHI_ER_CTRL)
>> +		if (mhi_event->data_type == MHI_ER_CTRL) {
>>  			tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
>>  				     (ulong)mhi_event);
>> -		else
>> +		} else if (mhi_event->data_type == MHI_ER_BW_SCALE) {
>> +		/* BW scale resources will be initialized in mhi_init_mmio() if capability exists */
> But you are just skipping the tasklet here. Provide an apt reason for that.
we are using workqueue, for bw scale, as we cannot use mutex in tasklet. I
will add a comment there.

- Krishna Chaitanya.
>
> - Mani
>

