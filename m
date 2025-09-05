Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E28266591
	for <mhi@lists.linux.dev>; Fri,  5 Sep 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757051078; cv=none; b=WMlCgxizskyZn3BgJJQz8c86Xfg6ZSLHGnTxxYA7zpmHMlE9vuL9CObWtxAyVodvukXOUIePxiHJqMHzKTGvTk81G0ZIqxFlGPXkojLV7/bGCmqguX6M9x4oXplZOy2caS+fn6ZJBjwfW/YUudkj2jJ66yYZB0BijcsqNDA4J/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757051078; c=relaxed/simple;
	bh=l2K9hkdSGW3vzFGYLomASCSKhDoFegz/q+JLfFhJDQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tag0xlfmrShP2rNSP+PF3zmGfplmSEgt+TneeGvZLgpvB860RZpgm+fS+rIh8h1E+xmZVazUHLm1ApHdUtgSiIYaP2bW1PpVaCxg4K8sX94s4VAaBRwoO+wc4YnfHMWyOpVYlqEVyY85WMmKpQp9RPwmutqXe2jhZ129tKqSaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL9N0aeC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL9N0aeC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JAUEx012111
	for <mhi@lists.linux.dev>; Fri, 5 Sep 2025 05:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ms0JkJGzKTaaIXjP6AglLat7tx0edPS44Ql4Yb4cQWI=; b=eL9N0aeCzJytClEt
	7mGIZwOjR9emg1aa1/VwbQnpG+J8btAILZ0e3PjSBt0c7kuW9JAJBL3/DmGVGP4V
	MEB3ljw3IPuhbd+1tNwxSJ+PU2ayX38C3mjKppS/HnsdzAuBPIo2XKDeD/ebaGa/
	OtxCYPbqMDtP4vl8TXnbKRKOrgxFnaU8OyygOcC0krmelkTamdsqDgEE/Ui8R0JC
	ywHDOQ3kblQRqOhz2DbKQtX7u28PE72npt3jqv/GIxndap0dmW0Eiq91gyzMlvm7
	NmVWv56zdWrzvxzbgfjvDmiHXuCH0UyqBmZHTN4zHnOF20e4OdkV7Fb7HLijpUJM
	W2wypA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj6bhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 05 Sep 2025 05:44:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24e04a4f706so1641715ad.2
        for <mhi@lists.linux.dev>; Thu, 04 Sep 2025 22:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757051076; x=1757655876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ms0JkJGzKTaaIXjP6AglLat7tx0edPS44Ql4Yb4cQWI=;
        b=YrByrdGJkAYG8VFag/14TaDbcbS4ir/kbM3FlCvnARAIf0ZlDobtJtQA/ASBBHD0bH
         JdMhqAD8ShS1rwECRzl5yxIUu3Xau41V59NbuvJQ6vNBuy1D+2JRRUNYnVFaBhY+N4jB
         lZYLJaPwwjbkYWCJQgPf5ubP+n4Zke8DPZFwdvq3nkbmKlomc5FM5nuRgj6AHoYOE6lB
         fHpZupC+OzQisjZmcIEjRLzMYLyNXRq/DPV3eIMAxF/R7ljZZ4v86ECa/t7xU2uRhKRv
         p7Fd3tTL+DgMblfI6AVrESPIOjGY//w1v0iZYHMz4RMkH6fHYKhNM1QOoEhAL71/y/Lf
         u3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7F209PIvoFIgI26stKVejrybuTEnO4a9KVrDcuLF5ryX+7I2v3wywP75uI31TmokX5AQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh6q7fA6jF4vp6wrU4eaAMgrCccEkCHRnxSXdBMPuHhJKTnxvK
	SjDKNEllMAqEGxzdycOAUBnZFfAD39G3L+jq6kamie0bOIzXFlA2nsrhqLSDaadjkmaVYA1qHl6
	/2+RUdpkk6bEM8aTfZUCBLKETtxBx4Rqy42x/LMbbZbomPlrPjUw4LyY=
X-Gm-Gg: ASbGncsZ9LJb7kZ8o1fC7LAIk51LX+aAVgp36hEi7QlOhvfTICJ/PcVGeLLX5TWajYq
	XsJawlKnCMpRisWpxGA7eIbsIg2OeMepN6jinls249mt5SWCxyGsXI2seZHYECfQf4cabcDMw7c
	QptAiAMyOtag84vdzJTNK9/U0mWfMoVF4Scd+DvjGEFEgGqr/FkEl0JUrKwU7KYXbCo5GnLxj26
	3ZypcCVpR1yy8pdNYWwpwuMNO7yYl3UQlGQ9dgiGQf04FoZADihQhbpaPYf0sxYLUqM1gWC674r
	ikKMYKEmdMBrnMzwZCbINTdOmio/k85MFzoA7nEOPMtG+fyuW7OVtiKX/FoJadyK/PKtg0JeZA=
	=
X-Received: by 2002:a17:903:19eb:b0:24c:c8fe:e273 with SMTP id d9443c01a7336-24cc8fee5d8mr71914495ad.7.1757051075757;
        Thu, 04 Sep 2025 22:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRJUcOuTKyrOxFLUCjdl9XJd/rnpeZLAb9neaQ8aeqiBCGunSyzzjqZ5ctTOwZOmAqKHh8Lw==
X-Received: by 2002:a17:903:19eb:b0:24c:c8fe:e273 with SMTP id d9443c01a7336-24cc8fee5d8mr71914135ad.7.1757051075247;
        Thu, 04 Sep 2025 22:44:35 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24d17d6b694sm9499055ad.136.2025.09.04.22.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 22:44:34 -0700 (PDT)
Message-ID: <e825026d-f365-4e95-bb1f-3eec5f0a8305@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:14:31 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Fix potential kernel panic by calling dev_err
To: Adam Xue <zxue@semtech.com>, mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        quic_yabdulra@quicinc.com, chentao@kylinos.cn,
        quic_mattleun@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: imocanu@semtech.com
References: <20250904183405.32986-1-zxue@semtech.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250904183405.32986-1-zxue@semtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfX4o3cFn+PUzR9
 OIDHgfpoxylSe9+0ghZMklQ1uhnFI7Go/rn3CXFNcB+qEWBojxbkMfmWvbxwEGuus25uLoTnfyg
 cj6DtRZv4ZXLVnIIuUCBgRk3hSRFVRM+3VhrBq6YL/MpyEXsIMoE4VwTIGtyWi3AnLHoj9IBlNF
 +rTwA/p5n4s5xsWsVEMmsUMYQzJPDSi2v4+5VK0N7WkKytJ+cxLYs+aGX3QMsyfFwn2fFEHywWD
 dWAe74Co1mOGouTvCxJsKNnSy/+Pj7XMGYD2kTGRXtzBrLQHFGgtj2QAol+UjOUWpv0s7RfPiff
 7hKPsxZ93tn7WQSYtWxdb0FSCtYQzGZfoDDXvo1RGxGo6g7jN2mVLMBZHpkKo/0FFbM7WpPalvE
 1dlasj43
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68ba78c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=SfXQzQb2AAAA:8 a=EUspDBNiAAAA:8
 a=7zsGc3PXLyXOka2lzKcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=187EmVsF5pRpP46aC3wK:22
X-Proofpoint-GUID: Qmo6ocfKCzBCwtDJwMCC_2eYLXiTEOPL
X-Proofpoint-ORIG-GUID: Qmo6ocfKCzBCwtDJwMCC_2eYLXiTEOPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117



On 9/5/2025 12:04 AM, Adam Xue wrote:
> In mhi_init_irq_setup, the device pointer used for dev_err was not initialized.
>   Use the pointer from mhi_cntrl instead.
> 
Don't we need fixes tag.
> Signed-off-by: Adam Xue <zxue@semtech.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/init.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 7f72aab38ce9..099be8dd1900 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -194,7 +194,6 @@ static void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
>   static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   {
>   	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>   	int i, ret;
>   
> @@ -221,7 +220,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   			continue;
>   
>   		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> -			dev_err(dev, "irq %d not available for event ring\n",
> +			dev_err(mhi_cntrl->cntrl_dev, "irq %d not available for event ring\n",
>   				mhi_event->irq);
>   			ret = -EINVAL;
>   			goto error_request;
> @@ -232,7 +231,7 @@ static int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>   				  irq_flags,
>   				  "mhi", mhi_event);
>   		if (ret) {
> -			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> +			dev_err(mhi_cntrl->cntrl_dev, "Error requesting irq:%d for ev:%d\n",
>   				mhi_cntrl->irq[mhi_event->irq], i);
>   			goto error_request;
>   		}
