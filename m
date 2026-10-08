Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED45289E13
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439891; cv=none; b=IEhysWkXw0dCdCnMFLhnKRM8gp0jpie6R8y/WwRYYeiajTWhpdqJw1KI7VmUTWjVLV2lPm+BMk6TlEq2fuYz3b6rvGQxpR5k6bRsqSP8fc5K2TLorhBexmrj8IONsAsUZUG4hJrUMGDgOaFKxBiz9H8R7E57I2INGb7euK20/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439891; c=relaxed/simple;
	bh=B6ay5wHsujiN7Kv8sVpCqPhillOaFvyBEoB4mWKnvkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f8td/lWmmSle2apj888fbRF2tZuH9erBSy7mwiIDFBVtvgjV6jRiVeNjRr9ixgtk56QQLQVjk7CuR3HueB2mehW/O9LHdPvADoY9LTuTGQawPgh09rfR+HvzFKs2OJ4+xpL3km+9KMdCY131/BSXdjEG94o1A0ozo8u2TTgSq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbldskUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlFzZ9XC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbldskUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlFzZ9XC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CgIn2272224
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bT/V/nt6qbgKzgYIifLz9HPk01hR9BcAcWPYqg8Rbkg=; b=AbldskULusxGjnFU
	W4wFl6s7oVQesNJvkIlbP+jRW/UerLNVssx4obMOROqmJggK6jMmGMoSSZtX1PPG
	+DGZSR8M+4LICz0c2RJFYEi51Bt7+JjsUOLmdtRjFM2xq+CLBig8QH6vq0QNd4/Y
	7XxQEorS7OJJCuvkfWk4Gx22XPlyKftuUx5cnDV/pkAxz8V48JVCiLPYvNgkiziD
	WYXJd4PFCVg482TAF8a24hCXwxNdkEvHhVzqpbJkLn8+6LbftKNV9ab+1rAGOP/2
	DRr++iRQZ6clagujx6bJMXBa1hwwyI14YYwWJ598is73xO09YNANYozKe3/Lzjzz
	yRIY9A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe41da5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:11:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso5409560a91.2
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439888; x=1792044688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bT/V/nt6qbgKzgYIifLz9HPk01hR9BcAcWPYqg8Rbkg=;
        b=YlFzZ9XCaYLMfFdON7RZhuaaL8KwiOn+Lfcc557h2Q1GdXquzr6cc0Zmv7B7UXds+I
         6uFoivxyf+nuF2LGhXw6QkcIBXKwytDM1jOLskPpoAfbWPrFlz6Q8ElQYxMUUiZltp+p
         3o58LGLCYqrN2TC7afejrL5FqjFrSCsdfFoVCKXCnZPbJLoY44+i/7pP+2paQ7VDnJ62
         DP2+9VQbx6loWX5PmgCA4Z9C8XM0GRoufrmHpIqBgXk2JIClM2irhrBihGYNbPjxC19x
         c3hpUux7eaR+kA4cXHQ8xc2qL2eLc9qDI4imaEbBqLUPkWNf3ok7VadpEm/lIGBNtL2T
         FJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439888; x=1792044688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT/V/nt6qbgKzgYIifLz9HPk01hR9BcAcWPYqg8Rbkg=;
        b=xtzNZLRuZq/DU9XxvU3iYV00mIJjQpk1Comxh2LBt7I/dZTgiufrXVhYo5KEyGBFIJ
         V0uz8/uxzyZjlONwaU9DIMeYVKOuhUBh5XNDEC0BlkpigohhPycyNPd63E2Y36ZNtd3N
         JDLQqbPiHGbAX68EDn1uvUVNiAcipHsqKcFAEIyfoBfA7bfFFjZpoHzdwtIjAEP1Ezva
         jq+8/caf1Ks/cjxjEa6DlQum7TlT2pGDstYYbyyMjmafmZu2iux9+vT11XKUpWXz3FNv
         VRo3Xsi/4z55qHyePXXqiRJ6l8/ZwwTc2hyQOdzg7cR6dKdJbcj+51sjwpKNlF82wyVz
         sASA==
X-Forwarded-Encrypted: i=1; AKwUvBwiR9V0EdtIgQ6ELQ9Uhs3IdQV8DeoB/ExnMXyPN5V15ufBZkvcXi4wn3KRq+6/wQV+Gjc=@lists.linux.dev
X-Gm-Message-State: AFq9FYItJxR7Vnn5pTaMfNvd4P4P5PPTW6W7gU5eyW+LKDs/K18GFFIE
	DXg+QNPTzSgVZnbQCosZbGtV34ocAPZnof+SO7Iyx1Op+2vZFvDmifWF8olulFMV8myv0Vwz4wH
	NWfSfCpQ7IcF88yodaP+h2RAOL4erNq3aOseU6MyjvGDivnhDnAoWPxo=
X-Gm-Gg: AYBFou09IvYPocSuXhdoMHomUSFq91OSD3meiR7eqPBkw2c6ra4Yiyebzw3GJgb+pT8
	NjCJYhPGQCVB58iYkp5w65vbThRsFxM4q6JLLAtkritPv9L+wXWNWu1wI9b71ujWkIA62jbM/cf
	L/7hDVnHBxCqWiPyybcOzx1Sso0d932YctTCohosLyNpdUh9Tv/+8Z+p5eGKviBKVbcHgPdb+DO
	WKz+roVZ5YM9YdvJy0UVPNer5xwY9gQF9me3JpfffgSLoc2r+XJ7QK3TrV58PDjPOcGDe4RAHfv
	FlBrS76fqcxvdVt/5qZo9WlVqfNflALT8oBo3K0qBmHsuDnnUniLbkoCvzeN4QfeaIIO+N8IX43
	j4KV7ufceVZyhm0lJCDl696bScPhenu8=
X-Received: by 2002:a17:90b:134b:b0:3a7:933a:3195 with SMTP id 98e67ed59e1d1-3a8a072a7d1mr4161140a91.7.1791439887907;
        Wed, 07 Oct 2026 23:11:27 -0700 (PDT)
X-Received: by 2002:a17:90b:134b:b0:3a7:933a:3195 with SMTP id 98e67ed59e1d1-3a8a072a7d1mr4161120a91.7.1791439887434;
        Wed, 07 Oct 2026 23:11:27 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79582sm3405917a91.5.2026.10.07.23.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:11:27 -0700 (PDT)
Message-ID: <add116b0-07b6-4723-baaa-ed4d813cb961@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:22 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] bus: mhi: Add QDU100 Sahara variant and firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-4-3a78362c4741@oss.qualcomm.com>
 <n45ii7ekxeefuxw2ydwzsx7lqlfczbgg6obrzmzpytl2fin7j5@vbhmrptcjvcb>
 <a05e7dcc-7d8b-4db0-bd51-754184afb7c1@oss.qualcomm.com>
 <wbez5pvslz2opnjd2mih7b4noce2oghbdi3ncxyrpg7u7vocas@zj4zzxh53myv>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <wbez5pvslz2opnjd2mih7b4noce2oghbdi3ncxyrpg7u7vocas@zj4zzxh53myv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: khP0iwBK_ZXPUVn4zxyJ5w0qzcK5qdPM
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac73410 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vwFko8lV0G9a4cWME2oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX0iMgAWKSJVQd
 84rk2OL/J/Djjjdx8JuhX/gDeVx6Uc27jnZ0weubyO/OMkHa9KAiAWKeu+HYTrlEN2RO13PC4g4
 nRcW+Pm3cAcof2pXuSbnzO7KBaVzVGA=
X-Proofpoint-ORIG-GUID: khP0iwBK_ZXPUVn4zxyJ5w0qzcK5qdPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXw1cTZoak2S4V
 fF8VbSe+s+fJ6QM7VC1P7W2Ilo26k1M3vAM1zsOSmrLo01IVYAakGb68Bm6nw6GGpQvF1oCCKYY
 AVy4Qi/MnOpk5zYCSJcB3Yca3SnT8arBzFQkp0Da4GNK0kRgxgya50egp6NWixyER7GGRz8KhR3
 LjWCSwhNxxXHuaGZLueOt0htKMphZZsTWQ2vykLW1UTeKhz17Q428LohNcRHdWT95Zu1RewLdOj
 pC9ADiB5mspfF2Kg3kZrPidPPLycoOK5qzd4wk7bZPJEOlNzngh5o9BhhdUgdu3d5Bulbz/mQIT
 Jwd7ARIf0kTx4rSy+Y8j9EDZTVMAt5uSKzB0BfQkv8Eqxmk/9B4tqtxxwitp5pElXJPh5CvEpwm
 NH4s+F8mWXwcAjXGapCfJKbwY8DQHfyceKrtfRvINU6poU4NAwLLPO/3EKgPQwsTSA5cO0YcPxQ
 m4SOjAIRqdzGh6t9Siw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/13/2026 10:41 PM, Manivannan Sadhasivam wrote:
> On Mon, Jul 13, 2026 at 12:55:52PM +0530, Kishore Batta wrote:
>> On 7/9/2026 11:49 AM, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 01, 2026 at 04:07:38PM +0530, Kishore Batta wrote:
>>>> The Sahara driver currently selects a firmware image table based on the
>>>> attached device, but it does not recognize QDU100 devices that expose the
>>>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>>>> QDU100 devices with the correct firmware namespace during image transfer.
>>>>
>>>> Extend the probe time variant selection to match the SAHARA MHI channel and
>>>> associate it with the QDU100 firmware folder. Add a firmware lookup
>>>> fallback for cases where an image does not have an explicit entry in the
>>>> device's firmware table. This allows required images to be provisioned by
>>>> the platform.
>>>>
>>>> This change only affects devices matched on the SAHARA MHI channel and
>>>> does not change behavior for existing AIC100 and AIC200 devices.
>>>>
>>>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/host/clients/sahara/sahara.c | 27 +++++++++++++++--
>>>>    drivers/bus/mhi/host/pci_generic.c           | 45 ++++++++++++++++++++++++++++
>>>>    2 files changed, 70 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>>>> index e339c67e236af271645ca81cc517efd9eead87e4..9adbd84859073d8024ba2a5fcfa33897439d6759 100644
>>>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>>>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>>>> @@ -189,6 +189,7 @@ static bool is_streaming(struct sahara_context *context)
>>>>    static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>>>    {
>>>> +	char *fw_path;
>>>>    	int ret;
>>>>    	if (image_id == context->active_image_id)
>>>> @@ -201,8 +202,28 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>>>    	}
>>>>    	if (image_id >= context->table_size || !context->image_table[image_id]) {
>>>> -		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
>>>> -		return -EINVAL;
>>>> +		if (!context->fw_folder) {
>>>> +			dev_err(&context->mhi_dev->dev,
>>>> +				"Request for unknown image: %u (no fw folder)\n", image_id);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/%u",
>>>> +				    context->fw_folder, image_id);
>>>> +		if (!fw_path)
>>>> +			return -ENOMEM;
>>>> +
>>>> +		ret = firmware_request_nowarn(&context->firmware,
>>>> +					      fw_path,
>>>> +					      &context->mhi_dev->dev);
>>>> +		kfree(fw_path);
>>>> +		if (ret) {
>>>> +			dev_err(&context->mhi_dev->dev,
>>>> +				"request for unknown image: %d\n", image_id);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +		context->active_image_id = image_id;
>>>> +		return 0;
>>>>    	}
>>>>    	/*
>>>> @@ -870,8 +891,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>>>    static const struct mhi_device_id sahara_mhi_match_table[] = {
>>>>    	{ .chan = "QAIC_SAHARA", },
>>>> +	{ .chan = "SAHARA"},
>>>>    	{},
>>>>    };
>>>> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>>> This change should belong to a separate patch.
>> There was a review comment from Jeff(v4, patch 3) to move to this change to
>> the patch which adds QDU100 support so that it doesn't break bisect. Please
>> let me know if i need to move it to a separate patch altogether ?
>>
> Since it is a new device support for Sahara, bisect is not really a problem. But
> I do see a value in keeping everything in a single patch.
>
> - Mani
Sure. I am keeping this change in the same patch.
