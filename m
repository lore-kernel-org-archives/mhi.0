Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389431;
	b=Kh9EmQ21OvwwNX7cyKKPJq4El4b2VJH4cd7MBUSlIhSlg6FjczfLijgS1ZvjtjQZGgQt
	 SIPid2KhsCWoRl+9lwKIaHTlxGZTqKglNkBmeodcUgYV94kZEGi48nM3BTFCdvV4fIb+f
	 /ae9aT5csSR8yaRqOdId3aO65xHoLXbsBx6ikzebQ0awedQtlEve41TlbHETZz1bGik/1
	 51mRZX1uy4/5+j0x/BChU54lZbzwN3Zbz0sGPDz8YtXA5MCCqEgHbf1+wN4OVcRIlsQ18
	 GbDw+HCaPUbIlpo7HX+sQ2rtNGSnU6Hzh0fyBKBFo3NYIAunjIHwmMKv2vROEazXGng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
	b=buBeVO7iAblZEmsM8nPu4cAxM35aQzIStrs9QSZPhlHQbjyEebj4BW+FeUf8Lc+OtZUf
	 fS6BPIyh7Fb+vJrSM7GSZSrXXtprOqeIjTM4M7SVWh0C6E7vQ0BWNqDMz035sp29UGfuA
	 v72jhvi1yb3Yqo/0n3Gx8sNCJxdbwUaEaCNTD8KtJhiomALXV5pvDi00D2ox6UqUhY0fk
	 Cea6Mgw5Wl4X5EIXOXNXRLp6GKJvwrF+vFAJV1thmes39j+A1MItqLlRfB0lTySdaQ/r5
	 PFwOGTBVn2xR41S1PPfYBFczspbMzw79N4ucSl9EjxW698l0LCgnx7u8AWPyZ5JVJwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mg/YKwDX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAOApAjJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C1606A321
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 19:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456C1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mg/YKwDX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAOApAjJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIi1B63776994
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=; b=mg/YKwDXjNT4sPSS
	zHJ/KjhTajfRCuh8o7XnjdPQKkn8VSnYjnIsnbyIEhg94zmXDIKiOPQJlUhTlE6K
	2JhR6X/Cbjws4VEztAiUqalx0ofpe/DOi9JcvImPuxNn2IO3nP6Hieu+c+OJGwWp
	PS7i2yXjr2YyK2VM27vAVwD62WF0pyNU+YfYk5fgyOH6Eke8mCha8F7yF+OHx2TB
	bDNO4IgKFiJv0cG2kfQES8MJs8kXeOfxaeiDG3qtoZ/U5I8+iB0BAx40hUEl06bt
	NdF8TYkbdzHL91dV2SH917+kOcWvaie72JboesjUDflH4Kc7SBlu9ozhsfGd+cJT
	GfmSzg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s9r5vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 19:43:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-193b5eb133eso1217661c88.1
        for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793389422; x=1793994222; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=CAOApAjJXd4IM+2Yze9muGfgGk+N6PAcR7HVZsGSq7y8v0dl9s4m6kdBgi8186N4fd
         JtEphou9glRuD9DFkKGzFRjOTUjEutfH81DthQL1XZ6YP9GWXmcIji/MEck+QvDH5afl
         6zXpgL5KKs2wpbwxIMu2HY1HSBJD7vKBIEmNCZ1LsNWJSTOFeNw/oLPVwl0pSpwzOQPY
         gyoEhROh/qe0JgbIVst72X23GhDfjhpuxq5Vy+nQE0mkuN76qyAaQIEkbGsF2ByRousb
         6UBMIWPwrU7PmHZD6nKZkjLBUxY/4J7sgrLSCoLe6gxLPQ6LNCZrf3f02Sc9xs7QAoj9
         vHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389422; x=1793994222;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGx6qJiXLm21UoHQs+MxjhyCVQP4Uyn4ufhGO58Vffk=;
        b=bG/n+afPbk1CxoCqPvF95QsQ/3jP6DqQMXFhD5jlQ7n5FuQ0b6XBW6KpKf+tr3Udd+
         ZXyyDoyoVqyQPlvtjEBWZeepToaOEJ5UhW/OWGkDB60eum46LYgkrGJVdn8h5sMPCKGB
         nClDgeQwfYfk3T06+FxlmIWftNp47ESg2cHElqqWuvms6ucPj0L775aBpvImTOSOCNuL
         cquqb/IkDqxm6ABf4KJ4vahKc4R6KLdoQrvpNd61rCTedGAxy7R6vXaPhgvCSLeMdAZ3
         G/78hh6PYYgwypNMzf+VaBJA9YCb6nOfzoVHvsb3Nwr2hDD79R+mTYvbW48hZh87jOzM
         /4mg==
X-Forwarded-Encrypted: i=1; AKwUvBzX5IGWS5FiuLp/ZYaVfWXkXj277Na6JfTpdkZjkrIGeY5fareG1c/4vExcwgYTqd4ZmJw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKVQmS+8iaqLizRdNZ9ny1Yitx5+yd+Y4aSWllCv8OPdsZVljip
	ZynH6zFRx+f6eb3WjngLlQ9BDVNrVH5wCL27y6fwvsuboSB70ZvVt6+d58WaBBveLRpBhl95Dtt
	ceeqWZpSf3gvL+eqR5HRXhV8sB8dZVdnoJe5L6HSkSLQqikAxoTBfG8Q=
X-Gm-Gg: AYBFou1FeHpnfxB7WA95siIDqurvNdnFg8+ZgZ8oU9URRGn5kndcG51oQ4Lk4Wq5J6G
	bjuaPD3l5hocCZXJjDqiBzsutRY7LP6tvLDstrbLPvHYCtZjEn7kdUm+PdTiBPCLIfl2dk9iqEf
	CsteCYTVUBRpzZUiYcsSbfOcdYheYZ9TiFpAbr/NT4vTKh+oZH0EPI7Ypz1tE9CJXn1kbwZg8vF
	/jsfncZgBXspr76lE3eQoTh0FTuxfVPFuDBI2O6OWzo5n6XTW501J0N9+jVxjTHosQsBk4Qzhdq
	4S9Gpqrp2vmn+ygvgYVcXT86rFqeRuA5PeHRoJlty6KRrFfWIPHNoEdEgDAkNpnZn0Wxk8Evn5E
	WaeVrSTJxQzQDjOiEVJ3NdLRGAeeEqKDdE/kiCTFSfZyBiusjDrJwxUSgj0eslIo69lNG8YYm2S
	wAqVZWXkH562U0nwC6zgh9Ip4=
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358378c88.23.1793389422493;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:701b:2052:20b0:18e:5292:2670 with SMTP id a92af1059eb24-1ac5d88cae8mr4358362c88.23.1793389422005;
        Fri, 30 Oct 2026 12:43:42 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm10965340eec.26.2026.10.30.12.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 12:43:41 -0700 (PDT)
Message-ID: <0f57c001-4c0a-4b35-8864-d83ed51d0abe@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:43:40 -0600
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
Subject: Re: [PATCH v9 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-2-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bPyDs/+Z c=1 sm=1 tr=0 ts=6ae4f36f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lJNEF0nvcUjEJBKM1O0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Dr_GpWpK2YXLdELH8ywtSjMIG2__-7Kh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX2sQZ3Oz5Sxv4
 EE3CT0G/3ZTRGB/TNzq+Jw65lDnXIfY+17kZt8zEn4q+Xkes8liz5LvU5cPAqfK1/4cq0Qkek2X
 64pgVDF7OR7wEdKpeIhnFzv14y/0aSF7KGw4kPflGgeJeayaYO97B4f1AhKoiM16elrFWmczdG1
 Z1WQJtml3HcJcD1LzsP34nTQPnZw9gZSwknIR/leKI4Bz1ilLQZODmAgvLvwb1jumIjyOnvVW2r
 p2vlcUkDUHovOqmUkar7ovKM+yTBaVGgfZ2cyKeLHyKula8SP6bjmni70RSuMGt9TKY+6gSkDQ1
 O/7FyqZmGy5FFv1foEEuGAql76YiyOieB6+ztM77WCCgkPJsS2VcQR4pTAYWzXlGe/21JEludFX
 TqgqWXzGksc3H/Z4604cUFSkVqfRQxbezV4ButxiCYL+AFc73L9vPiNmscAmokkjIsfdJJdXlZ0
 eeq6pnNJzTb1dmOoXaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX3g0zmVrkatWg
 l/eXV6p6qFfZdKGxFxmEE64jhB0AGk2liTdoygfOWY8UzVOxSXXMNP7pek8bpHrDTHpDv7UqnHo
 fDb2MzseYTke0xqDN9w5mFSykDSNWNM=
X-Proofpoint-GUID: Dr_GpWpK2YXLdELH8ywtSjMIG2__-7Kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300078

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/host/clients/sahara/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..75c0cf6010e1506fe661cfd110112bbb37465880 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + *
> + */

You've been told multiple times (on v4 and v8) not to touch copyright, 
yet here we are on v9 and you continue to do so.

I'm stopping my review here. Between public and private versions this is 
the 15th version? The 20th? I've looked at the majority of them and I 
see you continue to make the same basic mistakes over and over. It does 
not appear to be worth my time to continue to point out the same basic 
issues version after version, and thus I think I've concluded there is 
no point in continuing with this series as is.

For the entire series: Nacked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

To proceed, I think someone else needs to take over ownership of this 
series and address the open comments.

