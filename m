Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192682;
	b=3IjY4UplObs4qhATcAXuzmpsnTgpPgUVTvT3CNmi7m3flSJlOnMBwL7FeT5iJmTwmQR7
	 NiUh3YhozzF+t+OvZK443lSMqiAAGexz9Zb7QWerfgZu904AfwV0JS7vrGp9RifcnGJl6
	 2IRpA/bT+JjVBZ7+gf7WXKzq6s3/2AJRl99qVd2z49lkQkwbKTgLJcu8FMzshJeWOzOmJ
	 QTdsDnr+PTRToTryRKJ1taOgSPIegIsE6bNBZscsPi6DE0GrLsgXxQV5Znr7Dzzs0+16D
	 vNjLr+CRK57xnYTclb2d2gYzGjhXtCPKtc9VF6Af7cosCqB2hh0sZmApS6f6baH3Opg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
	b=jf5ul6c501+pgCetTc6cBCufTt12vkIeaUDOGjl6zYQV/0sJ50YqyIlNBv1AT//uPErR
	 SpzL2jsk5TfH4mSsbzrDORSajZA1rev76h2HQjvxX0+IjXzm8DdKts3dyVD2uzyqKedGP
	 phXERaT5FY1dnQhsYfYrhYc/ZjUPh4IjAmnxYev4i/KSD2HQXWib8Bi1j85P9edAREP8+
	 TmHGapoylphf1sTk5m+fAW8VnZ0N4IbwdCTUfHE2hVnU7wZL3YVK7d5pWwJdgqungdyFg
	 twW2xpWvnet7ks2Y8x6IFRXvbcYWYtKn6JjIAU7jkL0NV4bGlGXEHTO6Cc6LvLxzcrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cbQYfoMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEqYY7uF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D4E606A332
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 16:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D4E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cbQYfoMD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEqYY7uF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfYAx048957
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 16:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=; b=cbQYfoMD+GQcpZxS
	rlIZUpYIQlvhma7yPSBFhusrwy8tDbW15fXjjcVtShKcjv08z11Myobh1Amm2iMS
	OxH9HEne4TC45tin2r5NnRXXFFtRmu5YEn5FkwlNwi/Ad3rGV6qY33TnA1wA6aca
	kUxEBmnsiwM8ngBh5Xuopo6kqMJbsVS+q5at+DkRFvzI/TuYF77Y+bzP3WaWYhh2
	q+k3Qz3Hoq91G5zRM11QpnEvZeNNwugxVJeEd7UOZl2jiOPXL5ll5xu6KOAF/9H7
	784d5VxLHEWI7pRR8MC5p76aIPEEQ01eAIkccVDIgXMkx6dpc9FsO+tHA6xFMmKo
	TAzFtA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4hccf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 16:38:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f03a137f6aso10719165ad.3
        for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 08:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795192680; x=1795797480; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
        b=cEqYY7uFj4Urwwnt1L1Imutq09knH8eQ921MdeBmcSWbsLZao/D+8izY5S5iyuRrHy
         gSGV9tjWsENQR+EOlBlU6jV2ryhSDsHIK96tRbzSjSbtf6sXH0lFMNR0PpzzidAdGGvO
         0pcxqWIb0dp/vRFDApzcUZaGE6aEvqA0+RzQQIP+8gxyfk+baBKHQ6U3bV8EfhSxpwkX
         5z7WVErCm9A521sw5GqUMAZLme+r1tGFsebutL59+azBg4Rr4RvGoqyFm09axs40pQID
         QGK2gc3BfbxxOsHhFq69etsJYSuWQr21PdCFwwpFjxakHzTDjGi8xcxxIhEH0/hHu8sC
         0nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192680; x=1795797480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDpYwW1DYGsVFWX+47qcqYA+wzSCLFnlOQLlV1DniZo=;
        b=r4QocnKu6LFlrkWVFvOH+q8ICceKldrFiT82yUmwJiMQoAI0a4zbZHv/dAyQn/tPP2
         cjYNBiGJfm4QyQlAoP3cj0Hino0JHaqSw6vr+gsbp4jXdF/jkYs7axcViZgg2LpsZ+Og
         ehnvkfL5QuoVnqGVNbOsGQotT/0LHT/x0o5v4IR06fKPb9NKJJL2ofFrQM8neeyZlXjJ
         KHXFCckXbOXpdQOrmmDOjfvRBdjLsAscyxFzobRnqVP+kV78DY+OJIVUWSuxymdOVFEB
         rynboElxMtCkHvfXfmL8FLyAmjINkEe5zENI5kFWhnQNuE1H8J+6iFeH4KnvidDmEQkC
         5+VQ==
X-Gm-Message-State: APuU4Z/PPRiPsWPb6RUmeyXUt0ddV8pxZYMRSSUjN21HWEf2BUY23Tma
	0WH/QrlHoK4HC3rsrJ3eoHO66XkqUkflvnQqHRyBbpAbP5qFer4E9H1BvaJJPvfk9DyRys8l3D2
	o1atUZ9SeoGDtr1zVpUvXV2p8bV5DlcUr555/nhTy4c6BBRcKT5QNNpw=
X-Gm-Gg: AZFdTZdb2jQ86uQ4j/rF0evn5VMzSImxGBNaNnoSQP8YLYEtDbmsc1ZsfN8OVzk4GgB
	eM1YzBGGe72U0lDIMW7WB+7xPUkdqGTYyjQYhzXOl7rN3fN1lk1sGYc0txrjoJLk/YH8L9OZMbg
	/jOf50z8q+qgdFle9/CVCm1INgu+0mEx1xs4TyODOVPWsrrn1P4WcKJkYYV7FEoX23XZjo0q2Bx
	y7UUDrDjZQR3z1ZJ6mmH1yzLBqxZJVBqbRZiRHi9onzg8Yn9DXd1B6BYwJvegrGl/O39B5RVdA0
	wI3qdgyxTt3/wUzt8ZSW2BiPJ0WcV09q5/c/okA63EMAzyXU58fOmC4TvDAJ6B0Lm6h5oJYIq4D
	A3W8yE/OGa+LuzNZJAcKp7dxbV4KDWIi3KyYOzMesCDfj7mmYKkNMQvCYFP34zAz2hrkjeNXFAp
	tPxSGSHPJoWhXfCKJpCZzmK4E=
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr41583235ad.57.1795192679572;
        Fri, 20 Nov 2026 08:37:59 -0800 (PST)
X-Received: by 2002:a17:902:ea0c:b0:2ef:f3fc:e610 with SMTP id d9443c01a7336-2f03f1cf406mr41582965ad.57.1795192679031;
        Fri, 20 Nov 2026 08:37:59 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm16472455ad.76.2026.11.20.08.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:37:58 -0800 (PST)
Message-ID: <088d0be9-5d45-4454-b160-efff83e7a647@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:37:57 -0700
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: Haipeng Lin <jimmie.lin@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, daleyo@gmail.com,
        Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
 <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
 <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EftYrFaAMvf6r7gjtQ97213bGTUDzeIo
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b007768 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=nOnPFlOobFz2IApT-gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX3ToGyRJd6SqS
 qHFh53KqdzrNVxXIeErFSjFbHVVxYnHR34LlOyClxbFgdlED0GZeCgWnImPqYytmvJCNG3B+EsG
 TLxU0qT9Z98WzC+G/Va4xEDxaMByLiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX5Zy9+YYmFTjQ
 ASAN7yEWYdJ1Wsv0phnzo1+eZBEjkTUAw2b1ZDN1blTfWQioJ2nDiO6ZTDay5CgjPgrmbHc6GsZ
 O/WT1whNNT/T+03tanc/LDETTe+MW54AT/CQi6Wg+7eGRIglV9xLx79C0LqIoyP4OaRM1c7KUY9
 zIYrf5n3osmh+mDDEEKhbgcssua/zWx0CzaMzT4BRslf9S4SMz0tWu6OCT2+/GoR9bJ0imHayGq
 CU7tYiea8CCcZ3mTEz3cEaCM/nCimB6H8nehGHfufzO3tGhvfNzn4JQ1Sg9aRWn/DIVZrPZ14Hy
 tyEp/XakrcLsPI8pQJDpL2q93XNc/aCm8br5R8cgSidfWiesaPbei7t/ba84mBYeCknmzXTeqAW
 ea5QAkMKPj3UWWwxC+7yRTX3LT9Y3GzBhnHdizJS52LaRi/L/xjr7mHPPyAlitSCmolGNzFTl3A
 3pKKjZZGzpEocl86PbQ==
X-Proofpoint-GUID: EftYrFaAMvf6r7gjtQ97213bGTUDzeIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200066

On 11/16/2026 8:08 PM, Haipeng Lin wrote:
> On 11/13/26 1:53 PM, Jeff Hugo wrote:
>> On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
>>> From: Haipeng Lin <jimmie.lin@gmail.com>
> [...]>> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
>>> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
>>> This modem carries the generic subsystem ID, so select an MBIM
>>> configuration by machine compatible instead.
>> I'd like it if we could query the hardware to determine if it is in this mode as maybe one of these systems has a SDX65 dongle attached where this workaround does not apply.  However, I am failing to identify such a mechanism so what you have proposed seem to be the best solution so far.
>>
>> Unless someone identifies a better idea, this seems reasonable given the situation.
>>
>> -Jeff
> 
> Hi Jeff,
> 
> Thank you for your reply. I tried to look for a hardware hint since we
> have to select the channel layout before opening a channel (so that
> can't be the way to select MBIM, I think). The oem_pk_hash on this SP11
> SDX65 is non-zero (12 words) so it could potentially tell this module
> apart from a dongle, but using it would mean reading BHI before the
> controller is registered plus adding a table of hashes in the driver.
> 
> I can try the hash route if preferred. The machine match is simpler
> although it wouldn't cover the situation e.g., a SDX65 dongle is attach-
> ed via PCIe tunneling/USB4 you mentioned...
No, I don't think that is better. The pk_hash is just what firmware 
signature the device will accept as valid, but does not directly relate 
to the capabilities of the firmware or hardware. Trying to tie this 
workaround to that feels like an abuse of the meaning of that register, 
which I would be concerned would lead to some horribly broken corner case.

Without additional data, I think you move forward with what you have but 
it is really up to Mani if he'd accept this or would like something 
different.

-Jeff
