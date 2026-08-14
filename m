Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1136D9EC
	for <mhi@lists.linux.dev>; Fri, 14 Aug 2026 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737893; cv=none; b=jsAbKI0iO9ieqvr0jIKzrTEOr7dVWgPTnUIzh1dubBqdSYfHFhaaVMa+nUHLdOpLt/Ot2Gi+iPmh1m6P1s7AF1BXoMplV04j6QbTxvpWgPJ9rTa0KYyicR7WEUD8v8fuQDZdTd4DZMqzRyoMhdQBvF8kzsrgLn959Lq6w3UWj6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737893; c=relaxed/simple;
	bh=PqxbGeU3AlFbbuLO4Qx6KTlR3cHdsKgstwuszsbi9Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdSJE+tgT5Qzlm4EYzv/70F5l2U8ZFID1Gaz41tBT/viekpbrisiopFaj5gy0xI9E+tjv0Kmy7GfIPIBUXiE/azhLwXQlwgtPyGIvqwplGVlhheQcQ0hcyx5yTYUK82AEt91w37yBnMN68ei7ss6mWiL2NNkNEg6Y5Kwtft3nsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxs8rgvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/cZyjJM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxs8rgvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/cZyjJM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJhJp02251369
	for <mhi@lists.linux.dev>; Fri, 14 Aug 2026 20:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Fpve06qOwXKVqrVK9hpQZq9j0jlXptVgQg8F0HgyqI=; b=fxs8rgvD+8Kcn6uY
	XzVeo66PlA7orGXZMh99e3n+QdW3etGUNe/PEN2w6kv6HmBf4XMj/Km5lvXyzE/t
	Bj5k1aH9uJAMn2sRVHKYjIjofflTxSOcCpy5nUyHyQzgAZRoEXPSVxct+lcxO5Fc
	JJDsEz+pF8poeKM8/vD2WnWcB9gC6kRMo3wCG4udnFFMvSmkxKFcfO/ZfzN9ScHh
	527FKd6HwiO/97fEMhkNkIoEHA7Y2UOU4FnmtiUvw6ncFeZxf/sK8T6kzxdGyy6Y
	v8SKdBsjWsYvVrhmpyaql9jveu7T+bnYAPX3g4oqYO/P7hBZ7YGuK0irb8QeZUUY
	7FxAQg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g26450wrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 14 Aug 2026 20:04:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso1741608a91.2
        for <mhi@lists.linux.dev>; Fri, 14 Aug 2026 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786737889; x=1787342689; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Fpve06qOwXKVqrVK9hpQZq9j0jlXptVgQg8F0HgyqI=;
        b=X/cZyjJMtWTmBP/mGV60pHhC+RqoPeiuwNmAckQkuzKRQl8PkVG2ZdiN/jjQrbsjn/
         VGBuxgsjckLBMtp1nEfZimvy3UuaoL2/1O2hReZiRPk12EDPRFxi5CzlZB+QniI/BMcm
         Ot6zUoIyCBzXGNj24IyGNe78ePJ3dEBuQvOt0w/Rbobs+kuGjkAGAFJXs3y5yC1YCNCe
         AZx5jmajFSs4Z4Jm+TlT06NW4g0DgsIAOIcD0IWVIl6BLeB7nlBcqcRqVS5aaI6YQIpx
         AFL8w/Dri7lH6jjOToily0wEkqGvvx84fjko91iGnSsVFTKr3JwfI8fZZQ3tabtynnvZ
         7hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737889; x=1787342689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Fpve06qOwXKVqrVK9hpQZq9j0jlXptVgQg8F0HgyqI=;
        b=cGnGBivSAv6ocIIXcSYLfA+iBwq7q/6J1KFlZLVVg+9cXMcvYvsrymrF4eaEPfaaMm
         mUW807CjBPMLIIZD9HwbYv8S3i4Jd5kKMCIxu4Saag4sMezvP/2CL3IcIve3fXZrYi5z
         /CGxoNfoQJTHrf9oQpf6v2xgMLGkxDZdBg72y50cb8/tvoetCGh8z+cBX446m1H2chLq
         2RyLPWmd37h5z0oAOjkB7P0LtHlA68WyuuPY+7SdKgdE0pBfUAgjWqg/01OI8DU/fb85
         B4VEHioIOqLFJKlp9nWvI4roDm/K3jOR1u32qMdqCgwamQcjhIdLwypXM58bhOeHwBEj
         XvRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmOns2bgz3VnVCQ4HSRRr9d3KkJICR9CU/z9+7q9Payv7C4TKoAjZgDHjITH67AlBAEdU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyY909RPhtL+DcfwxfFYw619LWt1Km4rSWheknK5OIEU8oNf0d8
	Ff8b/LoUQiY0kzuhXqx6VUx3Z+1WgFMPOyMw1YjU9Y7HV/Sgc76dvRR+rLygmTouAI/b+5w1RN2
	qybcvDqUzGUXvLCSnqfXlVcPEG3LsNoPJpNoP0khtG6ZAlPYlG4kryhc=
X-Gm-Gg: AR+sD117cXD52rOn8F3Gx4T39gVxaQG6lujz3AIQLmuf9bOdNMnbenGHoSnT2bb7TgR
	1X55HH8xCDjkj7dT5n1abTAe3PJPieSfXlHwP8t3Sk2lrO1xTIz6f+1Q0w+gtCh+2cmH+LU7gnb
	uyel2REvR0bbRZIz2CWZada53fZ/OMf+jJXAkzjoEPFz/xtRXEUsDF3UHePDUBfNRnJkN+fzn6/
	xb6ym15gj6bJGrQM7Ofuk4/pMvI/A6kPsj7LnPCO1pXRJDNvg2F5t1tBHy5k0gK/Zjfj0QyoOkf
	yDlzgQZQetVFOybSdW/cxHIPOzCujAftEN/TlmtTvHajxcJR4CHeY6uRW4QUphkgfn49HFdVqcN
	rk2A5F7dr0e+u9hGD5N6jXTPGjHp9pbLt8v+vyzbn1B8CScmtXqwVxQ==
X-Received: by 2002:a17:90b:3147:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3933b6f1c52mr8883185a91.1.1786737889196;
        Fri, 14 Aug 2026 13:04:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3147:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3933b6f1c52mr8883117a91.1.1786737888649;
        Fri, 14 Aug 2026 13:04:48 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bda546sm8071670eec.6.2026.08.14.13.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 13:04:48 -0700 (PDT)
Message-ID: <369f1fa7-1849-4164-8b72-c27b00329b06@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 14:04:46 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Fix runtime PM imbalance for
 no_m3 devices
To: Alexandra Lu <alexandra.lu@nokia.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260807143353.1932381-1-alexandra.lu@nokia.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260807143353.1932381-1-alexandra.lu@nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DdArOrxJu2PUJ7JU6a9uue4nNWaY028n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE1NCBTYWx0ZWRfX0pEW1enHeFbC
 VqF7EKCwbTHvX/HUK9jfkIjIDKx2qPWa6xTzUfeExXvpZGYu4y8w41LidefJB9t+GJBGHdiCG1a
 3aLDyE1MsIixZ6RoU4GNrPg0HclfH/Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE1NCBTYWx0ZWRfX7Ag0NDJ/Y5gv
 isdKwrLMcqarZatOCNt1TIwARv51PPj8ERYvBRGGj8GnQ8/B8q51+beR4vF58bhpfUkzz6BO4zn
 T59txxdpIrgRRCOv0+CRHT2spky1UH5BhR3xAdffVKBdNtOB+IMeFlr8W58Gp1olTBFlGxhjNxP
 lMUq63bNYhsLyXpDmux0jW28V2kAj6s9BOGwTkvRv8g15prVe4UTR7SbFnotukVs0W32UhpJHCh
 7WL3SE0RPh2KKaaWrn76zFyUh5BhD9O5ku+cIdLi5rafoaDq0Lu74Lt7UL4BX5i0r61nFeGU3rK
 LAjS1MEKvVti7DpF4/UioM22zkgXVfEeIRActn9ChIIRpdK3S+CtCMc5h619NnMfdCbH7oASSj+
 tR4cowsrEpTSVUB3ophw60BKr1fIODNm+Q3odoqkSkbfC0c5CmoJX500E1P05FcPaT/JkzGv3Qd
 1TducXbeliSouDtxNgw==
X-Proofpoint-ORIG-GUID: DdArOrxJu2PUJ7JU6a9uue4nNWaY028n
X-Authority-Analysis: v=2.4 cv=OamoyBTY c=1 sm=1 tr=0 ts=6a7f74e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9qxNCY_qAAAA:8 a=EUspDBNiAAAA:8 a=y6RN0brJjB4wVIL3e4AA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140154

On 8/7/2026 8:33 AM, Alexandra Lu wrote:
> mhi_pci_probe() drops the runtime PM reference taken by local_pci_probe()
> only when the device supports both PME from D3hot and M3, but
> mhi_pci_remove() re-takes it based on PME capability alone, without
> checking no_m3.
> 
> For a device that is PME capable and has no_m3 set, probe therefore never
> drops the reference while remove takes an extra one, leaving the runtime
> PM usage count one higher after every bind/unbind cycle.  That is benign
> for the device being removed, since the PCI core resumes it to D0 on
> unbind regardless, but the struct device outlives the binding, so the
> count accumulates across repeated cycles and can end up preventing
> runtime suspend altogether.
> 
> Cache no_m3 in the driver's private data, as is already done for
> reset_on_remove, and gate the removal side on it as well.  Unlike
> reset_on_remove it is cached for virtual functions too, because the probe
> side gate tests info->no_m3 for physical and virtual functions alike.
> 
> QDU100 is currently the only device that sets no_m3.
> 
> Fixes: 0494cf9793b7 ("bus: mhi: host: pci_generic: Disable runtime PM for QDU100")
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Alexandra Lu <alexandra.lu@nokia.com>

Seems sane to me.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
