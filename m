Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3599E4399EA
	for <mhi@lists.linux.dev>; Tue, 15 Sep 2026 05:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449179; cv=none; b=nbK2iV05rb3vdQf54b8fWSUTPfG9bM87PGOOrAOdPGP5mqxHcS4NxhMG5O+AALbU55Hzfbvb+s1OfPnJA0wUqsAEJyQeLMOgYmTPEelMb8RbkGmfhDIL2bHFcszyIaSwRyYiOdWYKgf8Wk1X6TUbrjUSZ/N619g7GvMCIJwSvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449179; c=relaxed/simple;
	bh=HR0XZdX2D2u0KtgeE0YOCG/CJ6cueEc3ds4iCmzG/eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doIsl4ezxPLdvpJr0mnqbnd8vRxZE+4k7Rqc+qrMvyUJPumqr+JB8fkHW9M532O7fl9Mu/cfDWddykKPGW/aVm1T7MGeKzlUuSvCTt0q4tc8JKvd2irI7jRM9hydkjhhEH4jhWmYv15spIpSJ/fTt8V7B03K1AW9LNbjns5aUqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrc8YUBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJ2TwoX4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrc8YUBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJ2TwoX4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nXLc2992772
	for <mhi@lists.linux.dev>; Tue, 15 Sep 2026 05:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=; b=Xrc8YUBFaFOaEj4t
	eaSSluzyDy4Kjc/R0pTBTIurYcdivL3+qYhjfqgvcdnL7iSQVsCooUvpEP6yQCMp
	5arVoy0Sg4B357ZP0uaYorQbwZqI9DJylO/Af0xxxQ6OJ5j46ot8HG+LkrVZaWKF
	87uSe84azaKe+At9VdKwcrvW71XHhW1SDjKW9uwNvCg/3h7ZFkXfXf5ZQxIr2XA0
	5ZFuogG5/nF4KoknYIV7F2MQ3jOMte292TQkoTPRsKbzR59TkjQy5VXR9dKvb7ef
	uzauQVo/++BcC8rTCpE+IlowMtxlA9qg30IapXBK1VuWBDmFu5zJJJA+ibCZ9hvc
	AfVAvw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevvdt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 15 Sep 2026 05:12:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso7499811a91.2
        for <mhi@lists.linux.dev>; Mon, 14 Sep 2026 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789449175; x=1790053975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=;
        b=FJ2TwoX45rYWvZeBRhs8XL1argfVISbgwXXGB7KbxBgxyf6RDF5ueNdd3fplvuFORm
         SYgEah2QLWWNxElPAtXWnjHtW5GWjRByzFhBpDKfaJmSij3FyfskoI8d3TLU6aLd5ssR
         gGg+E/WTj9/B8QKFvy1sBtovl2f75Hst7dPydFbRtNR53U/0sQfNSzeU443iKyyNb0f5
         rdrYpDg4mZ1KLSlG8MemovlnKOhfnqMZeUdIzxrKCeEUi81yY/VtCmlkbFNYrkqIM4Ny
         iwf+Ru4X4MVRIXv2v+r0McNjYEqktepgZGx7ZDK5JfUJgw3wvsB9EDEZoFaQAcb4aFgA
         7ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449175; x=1790053975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=;
        b=QkwxHETeJhLNMgtjX26nmXaHRWqKvBH3RJBgZGO5o/ovHbhZYZiVwNJx2EiRo9DGNE
         ekW5zXMvIMJGAfAp3nptB+t674Psq+ULLUhxs08qeARuWO4kCBKlwkAMdvAhUmne8ZnS
         TmwBsSuSKz5XeoW8DmSF89h1Rg282uK5TkbuKf+czuwoRvkiZEJDdsA+MbGXRTpy1SfE
         paq3EI5t+JzdY80FG/zX18WUcGp9zHCpEcIFVFi0L/w40flaJ55i2cxbHxgTI4OloGxz
         NAO4zAg4E8jhauhJ1jK7d7EwCTKr5qYD7UfTYizp3BhIM4zo5e4SDK1j5j0AGK2CNcsP
         6Shw==
X-Forwarded-Encrypted: i=1; AKwUvBwrIiusmNCMqRe8tiFFfgg5HAv9UjFMYNDojVroLjJz47f+lNvt5LIZW/w74YuPsuch7zU=@lists.linux.dev
X-Gm-Message-State: AFuF++n1lQ/1Azmcv96FFudAcFEU/KHbueYBucK5anbQ8eyVT1592Cey
	kvFStQNzQHbHExAFK6wx8QA8lZWEs182Cd1EZcR5dHhmpTVA2saSbKYyWD+X390fwcKfx3IraQD
	J/2M/FMKIghgRaq9cT1MkPKhKXHT4IzJS/x4+Kbs11x5O0UbhMWV5JshSi3jxoL0=
X-Gm-Gg: AYBFou2yvzkbQ4GPOY1KX2Zs5yV1jX2xIu0m+gtvoPMJJxmlY8qS+xOwOaMKGSRQBnm
	y8dloiGzismXUCE9RhaHVdGHDfPGAl6VyBHZ0ho1i64ufIHlRaa8m1KLYDxe0YIPyExJbSDFtBq
	757iNYE5ij7wIkkqLq1R1LSscqPVvXwi7BBBAlD8NPVYHjYeohUTHrDqy+IRwvSuKH8rSNyjE3n
	+iip4Xeqgk3+kWOxaDZ2NzR/28R6jFVsVD6lcicVzHxCCjUc+PtsxejHQx6bFXw3viCszUJusmK
	3Dt4e4Gxx4xqDZbr0Yvbg8qG7EfuGzrQyAtE2tLmKVfI1oomgF5JRKSPQP8gUnRqgEmDOiaGzst
	1n0DWaMRen/SuyKY2iBWIdEytZww=
X-Received: by 2002:a17:90b:4b10:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dec0f738cmr10877537a91.22.1789449174880;
        Mon, 14 Sep 2026 22:12:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4b10:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dec0f738cmr10877396a91.22.1789449173407;
        Mon, 14 Sep 2026 22:12:53 -0700 (PDT)
Received: from [10.218.7.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d1381c2sm3755853c88.10.2026.09.14.22.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 22:12:47 -0700 (PDT)
Message-ID: <90fcc9ff-4ba6-4e16-a322-17ad8e4a51e7@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:42:39 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: epf-mhi: Add batched DMA read support
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
 <20260803-dma_multi_sg-v2-4-c12bb05e42d6@oss.qualcomm.com>
 <anTARsISvCPUA9_v@SMW015318>
 <szx7jctqp4h6yhgvhwmiqfjtsemwlu3iardtntp4nfc22u3bfi@ux5ioixmfdnh>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <szx7jctqp4h6yhgvhwmiqfjtsemwlu3iardtntp4nfc22u3bfi@ux5ioixmfdnh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wrnf0aPUiaiDSupWyu8zR3DNLzss1CpQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3MSBTYWx0ZWRfXzr66kBnNZ1YY
 cs7H9OKhCyJk2cAElfv/lg90UlU8l+TN1qI5M1zgBAP6QRV3hNMEn12SlsY5itANWF2EbKITPHY
 VOz3yjr2v2ity8Eop0cAcbsM2h5gauM=
X-Proofpoint-GUID: wrnf0aPUiaiDSupWyu8zR3DNLzss1CpQ
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa8d3d7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Z1hDqqN1xTHES3mYk24A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3MSBTYWx0ZWRfXz9B4vMMpIe0r
 p25NP+ACIpgzx/SToiCWIFLKuZdGxr8rnDU+LDcPvR3ST+dj0nSzp1EhH2N4v94WP4bYGUQ0jMH
 gU9u0TDUG2VSOfhkJ5mwWtfsQzRai03FR2Byjtd6H/xVAcxRbPpbQi7VvNeG90tTeruDw0KZGpQ
 5GL1t9WsDqjMSm30HuQntr0AD/993FP9ssyWexhBsWhKwmhANQO94pb5PQ31v29zMBmqmxThMMg
 xXVCCSjfKZKMZjB1osSs7H0yInu8+CEL1VGYln36j8fcS2coObXPC6ozI0lZ60QIkjfQr2hqjAm
 W0M6rYLk5W751/PqPG5WlVbboplTuzXGAQ7KFj1PcIw2vuUnSHRBN/DDshawK5xQLt4wzizl4y3
 FzRNe35jXPM2M6qpGxjN+3BFDt1jWDsKaOaQ7aAVyxRjRVehNT889g2x5yAGcPX6tgrXjyUYbfX
 mQGAZ74aXHCd8rhYJOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150071



On 8/14/2026 8:22 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 06, 2026 at 12:11:34PM -0500, Frank Li wrote:
>
> [...]
>
>>> +       config.direction = DMA_DEV_TO_MEM;
>>> +       ret = dmaengine_slave_config(chan, &config);
>>> +       if (ret) {
>>> +               dev_err(dev, "Failed to configure DMA channel for %u-buffer batch read: %d\n",
>>> +                       num_buffers, ret);
>>> +               goto err_unmap;
>>> +       }
>>> +
>>> +       desc = dmaengine_prep_dma_sg(chan, dst_sg, num_buffers,
>>> +                                    src_sg, num_buffers,
>>> +                                    DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
>> Although both side memory address, but as previous discussion, which is not
>> memcpy, still memory to IO space transfer.
>>
> I agree, it is peripheral DMA nevertheless.
>
>> Maybe enhence device_prep_peripheral_dma_vec(). Actually eDMA still split
>> it to small trunk and linked together.
>>
> By enhance you mean keeping the semantics of device_prep_peripheral_dma_vec()
> API? I don't know how it helps because we would most likely end up with two
> vector arguments and duplicating scatter-gather lists.
Frank can you comment on this.
> - Mani
>

