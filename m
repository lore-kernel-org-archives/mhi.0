Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB9C1D88AC
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 03:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637015; cv=none; b=OGxKmC+5+a+iN7/ENXCWaYKXHndmrVS60GYb+0+MsZKkVjwTZvs4zzlnTw7R+BeKES7rAU3d3BTq9NRCg7bVTG9ePD+sGwNn3wJhKwhgpiUEsrs4EcsF0d2vSs+qDZBhISbkFuym/mq57ckIj2W3tfVI1mqJxv3LEzVGSsoG79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637015; c=relaxed/simple;
	bh=5uBxKQcRMq7FuUbLA04O+2zy9ZBIDYXotnLF7dcFbFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtEafoTFqN922UEFM2WGAq9efrqj6d/s0HkvDSZ7FQrvGj4HU/0E9aZt17wXgRnDsPJnKBCpsblNsnSs/bq9onnLUmi7LLA6DXsVmj9r3bIlbuRtIZCxLmVWROZVtyqp0Vkx+lQMXIIQxH8E8FMWKqYGeRtQ+Q+uTjlmhMVUlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njHT6tqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njHT6tqO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDPkE007841
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 03:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G77P3BAiQ9+JrIzTbcmKzyn82sbdg2M/vOIxw3VV4ec=; b=njHT6tqO0EHmcmux
	KDBWMbGIrbwUvGnj5uFNYPrNvqLM/rB6/s3cxutv7adJaINKRR4scDwInhAMBMZL
	YspqgDZiD4GGFFQ5FwyddnvNLSwOyv/2bnAfwl1dUwf13YCW7ifG7NH2A+tormxp
	LQC+NUGyoSjpgx1NqBPr+yFxiig9UwchmT41eXmZymJYkVxjjAFr4Dp9GV1In6In
	+z2/Zgz013RLwpyINmQtCDSKa3hBMp3POFgf9WrHgulJDfU0e6rOw4AZjgz3+STz
	DHfUT7CQX9ukZ56AVEMMoZlPqadcQYYpjC+ckFRReLp1U04irItrTqyCfmfWr3oH
	9pDdYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5thq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 16 Jul 2025 03:36:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23494a515e3so53886825ad.2
        for <mhi@lists.linux.dev>; Tue, 15 Jul 2025 20:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637011; x=1753241811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G77P3BAiQ9+JrIzTbcmKzyn82sbdg2M/vOIxw3VV4ec=;
        b=isyr7/PDFYJogi92x7b9/ago+Q11yDbZ60mHGLkrsn5u+sAIYenKvHvlN3OSwvRZFx
         0mw/bhMcY4sVfT2z+jWNhM1MMX1mZEH7AuxDMn7f4rQQJ3Fp6I39Ury0RVrmmZFXh7HW
         IrpZh2YMTPle1l0ydPdAHKc2hywi6tFdQZQ8JYvWIHM5y2cnmngk2T29bsny0B5M+6IM
         UPpJybi2V5v3S0cgIblmuIckrkGolVZWfXukNjPOnGs3ygO51x34v0ZSR86nV5Q7wxl+
         Rh5Sob4JOIf1CbwyS0Ui/jK3O9h2vbHlRYZUzUVPI2RQ6AHBLqSox+n+Pha6t3ePUQv4
         kloQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIwhrZ+6tJEZCX0kzo6WNJmdRBjKFGH1dKA2UrIN79DmMb1bbEmpr/ZuQ5zpvDGIo85MM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6NTPknBRgEdSRrUbwnjO5voY7Lel+DsTcwxi0iZBJxrVU3m53
	OM2uEQdLeo1mIJ4BPEuNq1uzsxPcawLottFYR4x1nqKbs+nm0VaLN19odh7ApEbLMYim7z/E21z
	tzziuQGoJ3thGbTVzPfqwgUrBAyLPHYarLztO68vwY86OxOIIT4XpMdI=
X-Gm-Gg: ASbGnctFgh6QnqYurgAQcgYee2o7EsvpCR8Y9dwgY/S3mPKs5pCv2Ye58SkBrb50JYw
	Jcig6aoRvVzdq83ClLAG+ua1HDBMGgFdnziUiBS9Wv6XEQN/A/z/qLc+NQMqWUxmg2L9cNOy2yF
	cHypnW2C417+OPus2jqcW1E/ktOvgwzxXIxPksKsFwEI0jjJQUNoiLMVbnhMBUc3k0plnUFD/0U
	OdJy4xdRyw4zkzREUc9/ELXwCkuQrmj6O88M7BYJZG3yvHvsks/awuEhtL+QcsuZ+xB1LOH9K64
	SCOscez/mGP7vxPcxfNJKHw0t5kwRh5nh3oYf3xNO9qc/bGe4jMFdTyG1fcQwecOQa2br2AhEmx
	MSSytn+vDNE9Yq/fXYtNJnfiLqTUgzKcC
X-Received: by 2002:a17:902:e74a:b0:223:653e:eb09 with SMTP id d9443c01a7336-23e24f363demr19174475ad.7.1752637011348;
        Tue, 15 Jul 2025 20:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ZtNZV8XXqxRue5LR/rmeqC3k8eKrkmqjtuyqxnAf1b6vc2jc5Wwz/7sBQDCUzZ7rGc91qg==
X-Received: by 2002:a17:902:e74a:b0:223:653e:eb09 with SMTP id d9443c01a7336-23e24f363demr19174085ad.7.1752637010830;
        Tue, 15 Jul 2025 20:36:50 -0700 (PDT)
Received: from [10.133.33.219] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4289274sm116045285ad.43.2025.07.15.20.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 20:36:50 -0700 (PDT)
Message-ID: <bb1a5f3a-5ac0-434b-8da4-e43c996cfa30@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 11:36:45 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] bus: mhi: keep dma buffers through
 suspend/hibernation cycles
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Yan Zhen <yanzhen@vivo.com>, Sujeev Dias <sdias@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel@collabora.com
References: <20250715132509.2643305-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250715132509.2643305-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68771e54 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8
 a=hUY_jMkgKMZyhPis8EMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: kgFduFzlPvaAGmei4efBsvEHGC2cjwiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAzMCBTYWx0ZWRfXwV0FC0J6AMUS
 68GWbdLJNkIBibOVoenoX7Jo6I9XMrAMktCXHf9nSGsLnwpbuwmEiqc/ttZE3W0BNBu8KMxZU+i
 OGzfHI2eaFNOdjlOG8zOciKBS/6t4XioRNRJPvByoQMIfXkem/cTZM7644U/bMpqmBAJKHhJvOi
 KkOxG6oVtNzLzyUI2QDuQ8BmwUr3OuKJauGobiofOctpmA7oUSQ/quyVgDu2f0EhuRgo8GQKLVp
 RnZdMUQ0vYsqKJ4rsYKz11SheESBhRVECiPxAP1HeDDEP33wG3lCbVvDCKcTcIuPKX8pD0LbKae
 VU8WBtWiREP0wm+/1YM1BrD29WgMWR5nlUMleZiv/x8/X9ncdzwUIxl7WMMi5w19onPPIiJOlgR
 HISPvMkg0xeD76qWLROo4+82Rm7Xs4WXnVyFeIgWqlY3gjZld1KEbozUhetWx+CvXkusudmp
X-Proofpoint-ORIG-GUID: kgFduFzlPvaAGmei4efBsvEHGC2cjwiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=807 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160030



On 7/15/2025 9:25 PM, Muhammad Usama Anjum wrote:
> When there is memory pressure during resume and no DMA memory is
> available, the ath11k driver fails to resume. The driver currently
> frees its DMA memory during suspend or hibernate, and attempts to
> re-allocate it during resume. However, if the DMA memory has been
> consumed by other software in the meantime, these allocations can
> fail, leading to critical failures in the WiFi driver. It has been
> reported [1].
> 
> Although I have recently fixed several instances [2] [3] to ensure
> DMA memory is not freed once allocated, we continue to receive
> reports of new failures.
> 
> In this series, 3 more such cases are being fixed. There are still
> some cases which I'm trying to fix. They can be discussed separately.
> 
> [1] https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
> [2] https://lore.kernel.org/all/20250428080242.466901-1-usama.anjum@collabora.com
> [3] https://lore.kernel.org/all/20250516184952.878726-1-usama.anjum@collabora.com
> 
> Muhammad Usama Anjum (3):
>   bus: mhi: host: keep bhi buffer through suspend cycle
>   bus: mhi: host: keep bhie buffer through suspend cycle
>   bus: mhi: keep device context through suspend cycles
> 
>  drivers/bus/mhi/host/boot.c     | 44 ++++++++++++++++++++-------------
>  drivers/bus/mhi/host/init.c     | 41 ++++++++++++++++++++++++++----
>  drivers/bus/mhi/host/internal.h |  2 ++
>  include/linux/mhi.h             |  2 ++
>  4 files changed, 67 insertions(+), 22 deletions(-)
> 

changelog missing

