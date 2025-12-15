Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6022271A6D
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765822924; cv=none; b=sBlp12/4+NWeTnelDLnn7ou5P9jAM/8oA6XVUN4teNg47hfd0WlycEbRRY6IZg1EWWhZ60XDq9GYewoT7EsM7pfKT1jxTX1j9oVgCqcqOYaSTvUHbJTf6VjRfwM3o4wk3iTn7ov0Ri/jXIA7DsXmiwFsf4BOpbwdDxvE3yQ+MTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765822924; c=relaxed/simple;
	bh=xG3rqT5IIQ5bzBoJUuUHBqYT8edTrD6XGgn/HAns4Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NaHwjlP38f1BtU0/EgiRe/vnJfgEe/KBCAdRCNctgKvr/G+xN+U/lQAYnx1zyyAsWoLPNwlk18lG0YV2Q3tslmVbgqL6Nh8NG+RCCZ22IOo1iglM/9HJwFGOA3+dYMWUiqe66DHqP8Tk0jd/jcYqoALtb4tSKvBZDks3fv8tr8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLwTOGwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHKRxntI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLwTOGwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHKRxntI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFGiG631268546
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 18:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgYpRbpYnwy/0cl1HyCSrvRsRcv6hN75FyqEZ+oAjDg=; b=oLwTOGwFVjoTHlep
	61++Pf6TeUbCPGVxdKmkDLM8NM+q2MPhlr5HIog++259kqyUOprBD+7WP1WEauEG
	B5nnXbidJwNtaJhpgduWKhV9FuMifBaMi4JuVTriHunvxJnjIx+v3EvkXGi96B4d
	LQwONL39vhIHDtxnSFIieoh7EvxH+OsSkWzot+jXSuNrUQV4OFLMhZcafCqVBmVk
	wJxFeyUS6i93I1WDsx18wh7GM6Kg16sdFVDVy8QS0ZDw9oiasFdXAM1+P4ZNUu9R
	73uNbnghagnPOIOMQJEPHgWziVvbRcgytgxKp9P5p/s+h7lo+BZ5l9bwErCLWTUH
	sdvtLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2p46g8gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 18:22:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba9c366057so10071076b3a.1
        for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 10:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765822920; x=1766427720; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgYpRbpYnwy/0cl1HyCSrvRsRcv6hN75FyqEZ+oAjDg=;
        b=hHKRxntIN9RV62yMS21EkIPokSUUvCLTzItt5sN/P5f7lqgIc4bMv+HeumB3U0+NNx
         tZpNZRJlsnvsJGvicbAZ3Jex+m3KQ0MivbGfsTwZUUl8CnUNyDptvnmz5Wjis1/HXH3I
         5ORv5VxE3KthENMDnu+dV0XAkvKrxgIEFKuys8gP0vHpU6CS1hQDtsEyuEuLpD9fuKtk
         mgWB86MVR62QIpDW5peOgxosd2hPx5hdOSX2ZUFg69po6Y7/Ktj+dMTAImTatv6by7ax
         /waOs1ci3BnViKlscnTWlxOwqgktlV/nxPGEDEsYY+pTcPk8CyYIcfGi1Cb5mgOH5/79
         GE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765822920; x=1766427720;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgYpRbpYnwy/0cl1HyCSrvRsRcv6hN75FyqEZ+oAjDg=;
        b=iAYUKHYz/z911RiFO1uZ/nw/Gx07fdSbWZQZlnQ/53mo0bn/ucXTeyjdcfmogyRWxE
         edAVnn/CJoBfE1HgS9hV0d/y1gp1F06dc23pqhiReg3UAQtB6PcPBrb/D6zX991RyWjJ
         VfFSVzCcYGaj/9AMpUrz9AQq6cNWJQZWHV4bc3d83VvjY2EMJLu/DmJDvOOebD5WQLgy
         rCtPqsUrgTg1YnpsThz23VgJTViHKAf1ppAu1MKJA98e2uT9cfx9sNJjyepCeiN6TUHw
         tVCngQwEvMf1bHZYL7sHkUmu7h3rjhcQ8ZSzjQKStDz+8U2Q7XrdFJbESpZcfRHeXhnZ
         z2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHjOlYwNi+9VF+pGs0DTBhBxbUAZfqcyB1kCrzXNUfLMb4C3WAafi647R42ksvuyECuY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1etpVsckVXs/4Bp7j6NeBoc3wymXWH4T8luplWEDabgoygnDu
	u3XJX6YlDZmLSvZlNTO9rmQMEeCJtYu5XWT5GmYWW9ZoVxcyhoWnEA2jK/YMXNJ4D7sri5xRxWN
	u8huB31SLCwq2AuCfPsrNN6RILP/4vs8LF7hvIhCBwKqlPgCwYKetXGo=
X-Gm-Gg: AY/fxX5pG5TxwHV+17Wp5TB09hsTLz3RPZqkWO+KARvVYc1SskE+FasnFk3wnmy3krd
	8WiVhiF0Z2gvzlNFv9xXfBHflyxKeCNcr5OlfyVHZwRezczLOWa39PbLRcnQsueLFo01N64mie6
	PRd8UPwusUUH777fu2QqlN+QIZEQ8mNs44j95SGjtKQ7NvtrVwao/i67rX4W6MXcbPQfKD8RLTM
	PCh5MF+MP1CuGS5TkmVjAiA8LfILDZo7ZsyfWOz2jAE9SimAzGL8Bdk7k37I//BT1bQyqx2LcAS
	xArV2taZP3Zc0XaTuQd1Va7xso/S/Frh9EG5qVZHyAQ10/gtEc+z4sgY6L1462k1lUsn3ZkbIJS
	kgikQ+i5o+V9ljyBUgcCu6fc8n/bMPQImvTjpmUeLaTQ5KbCeXZqZih779XpexU/usWTk6RFeaE
	cj
X-Received: by 2002:a05:6a00:2:b0:7f7:3c0f:5785 with SMTP id d2e1a72fcca58-7f73c0f57d8mr6920480b3a.2.1765822920568;
        Mon, 15 Dec 2025 10:22:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCex8IyC6kthFfyJ0iaAQmLqbQSxWTKJHI97ovOAoGrbI3tTx1cdk+ymXiVPJx4fH/oJFJuA==
X-Received: by 2002:a05:6a00:2:b0:7f7:3c0f:5785 with SMTP id d2e1a72fcca58-7f73c0f57d8mr6920464b3a.2.1765822920039;
        Mon, 15 Dec 2025 10:22:00 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c237ee5fsm13246289b3a.4.2025.12.15.10.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 10:21:59 -0800 (PST)
Message-ID: <6b115125-17f9-4eec-b10c-0722eabe517e@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 10:21:58 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wWnOrRurwusG3E9yY3lCUlyMM2KJNFPr
X-Proofpoint-GUID: wWnOrRurwusG3E9yY3lCUlyMM2KJNFPr
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=694051c9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s_66Iy6SLP6N_h4NTPAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE1OSBTYWx0ZWRfX/hPUgYt/j+db
 tCd2xOlgkJMZBTpPuHVt6EgGC9Zvo1T8zrWaGaKST8UT0jQ0uaohjfU9O57mrFcIZab7PE9PEqU
 K8qXzWNmNL+HpRO5rUOCz4IF1BUsM0jSKBW60ATbivCyWj12B09FHq1+qBdEuYl0XW0dRqz1PgS
 r8EqWKxRdJQHLA9HW50AeeZg9JzsgknI1ho5BykecjhMjFjs8x25jxTY4MLnItZiyYIIdBuxmL6
 AYHfn2FirLMBxzrGS8xpZhIBLjp3fvKaUh1xzHKpCGlC9jKGLnNRYLGS2aRSVADZijsX0kryHhn
 i6eneaKzy8N+qf+7Hvjq5DwOe4ZA9fkN/xbvZO3CMJn8xPnv73WsEnjxYs3DIyeyFleKNYdUl/C
 qZFelw5UmVRqPz7613zljWKFh64x/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150159

On 12/7/2025 10:35 PM, Qiang Yu wrote:
> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
...
>>> @@ -445,6 +448,7 @@ struct mhi_controller {
>>>  	bool bounce_buf;
>>>  	bool fbc_download;
>>>  	bool wake_set;
>>> +	bool standard_elf_image;
>>
>> This flag is never set, making it a dead API. If there are other patches
>> setting up the flag, please include them into them in the same series.
> 
> Let me discuss with Baochen about whether he can include the patch in his
> series that actually sets this flag for QCC2072 device.

The QCC2072 patchset under internal review is already 19 patches, all of which
are specific to the ath12k driver and hence would go through ath.git.

I'd prefer to not bury this patch in that series.

Would you be happy with a commit text note that indicates this functionality
will be used in an upcoming series that adds support for QCC2072 to the ath12k
driver?

/jeff
