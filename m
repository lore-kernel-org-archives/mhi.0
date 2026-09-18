Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D124D6C3C
	for <mhi@lists.linux.dev>; Fri, 18 Sep 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728748; cv=none; b=gp5syUKncxdbHrTeBOt3KreVpbe1mICslt46ktJc+6FhWbN9Zg3tdCCTsNBirBKE8fyr5yDww3llgucYGvowR7cMIGKBjVQgWcEed6xyC+UiWTZQrHUXYtoFkXSuab9gOxF1wiJtucb4DQd72y7enDBBjir7TSUTxo+xakqFiPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728748; c=relaxed/simple;
	bh=KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6q3DAL6MLHaY29UD9yHvfxsfh17r4W8MoCSposYwL46vAFwJwQI7GFdG4IXTvHcF+RMmWsS+5rAUYi4X538XY480gZb989xPvjFmBtHKJvfVsqgXQqjR3vQwwmEvFe//teyBzzeaDdvgYYX40Q0+ki/umvzrx6sockudOP6Kl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNyehHMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fai03fsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNyehHMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fai03fsI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9ddxB3801902
	for <mhi@lists.linux.dev>; Fri, 18 Sep 2026 10:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=; b=LNyehHMmb+JfDwnk
	sBDEIrsc97u5Id9GEQVz82GsTG1DwAl5yduCOUaw0ROZDq2FkAyDN8aRnHadQMeg
	b2HH3DztU9KKK4bbVrUCTGdz/yjeHECsZvLwpQXp7LTGcIP7NJMAaao0B4ZsvzMH
	IIPC+RIYbULQlaQU17BNBAZKZmdBx3APYpoF5KrUX9p0CcNg6S6ECrxMbVEHUupz
	XAmkBPTjJa6N3xJvcBBWdyubmXmnenonutrStYGlbpLXX9mgpiJnt1A08ee7vqm4
	36Dwh7XZv80y4vjjbDI5dXxtn7gpC1zJ2XHfc5BPj40/w6KUAkju5YGuVeiX9kEA
	j/UpmA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 18 Sep 2026 10:52:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so821621a12.3
        for <mhi@lists.linux.dev>; Fri, 18 Sep 2026 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728744; x=1790333544; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=;
        b=fai03fsI1DvriRb7PzFf7YanwOiq5VCwX4mbm03WLja+YdBO1mz4AizhC+7aN1xdZv
         /FmgGuu3dhru+skPA/lKn3bJe/tqteqQTzqbXYLbKUL4tk1o8gJqaCUXfXRNuqZy2Kj4
         7eN6VnjpQMdV0JORmNVhPaJp5E8T3Oog71J3jqjvX2Lk0SKT3PCs6Ml19NwR9Cs1wplQ
         cIOSviszaH26vrPy4Re4nsv25GVuZisoPXjRzaGqRZVSpo9qsjmF3yBLZePZlqkzVvCY
         hGNePRSaqTiN3r+wlj+OhKTn3JqN0F0LHv5HDjrW2ThMPtQGldzPu4/qwEqOXjLgBQc8
         1qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728744; x=1790333544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmN1ZuicIl3zQnKA23ZR6JOVKKX7TbTIEnZT1K3ikZI=;
        b=03WHQrTaOuqE6V74odKiOw+xuLGpY/O+OGlF+t7UsE7fdKabx/k+I/HWgYeEKSJg+2
         KVniR0Oy+7kwrWVNgFnRlnUXSPsmHDhbrs7T4xdMTQgYIEDuikYVNIwSC2i1H7dHQqgq
         oNs/p/DYcFQsTF3r7Zas3KaX5yrdlkp8hW0z1fWITbiO/ZltdOgPkVpGgHpCBKmDQDET
         u2qHVlMa1a4ErfaonmmZPmYF621rJpihoRwIqfePA0dQfVnTmBg1/9TGqUjTsvCn3aox
         m9pKDl4X6F8CXF7P2iyHpI3Q0mxmvNG70zUYK0R4eX3fPAxekP7IANk9z7sPxE5n1RqA
         ySnA==
X-Forwarded-Encrypted: i=1; AKwUvBzZF9s2x0F3hIH3JsKVPabRxbUHKxWQ4WFjksXvgc+lsnONMC4rJJZQZdxleoNgsmnQ+Og=@lists.linux.dev
X-Gm-Message-State: AFuF++m65Bw/pizcbAxpheSDwXygwyhgC65BH1/30QABfNI5Rw+n1keN
	YSxdsgkDbBB5XiQvBLE9M493JxQvxcnklQ+8FGvDqvvz6OW3CsKyWtpH1djQ+uGMHnfcbJGC7ZX
	/VYi0fOg9AHU2ECrSjJvB8KaWTuiqCZffRBU8N2xnaX3YBxlaEliMAok=
X-Gm-Gg: AYBFou3NZ3yuz8PKQ03tnX5fBTBoaIsH3g4HrbJTjBY1hAl5zihf/Me9vKNn5BMVoS/
	7/HulCtV1X9o5kWc2eMLYYeWxTtMTiWNYoyWMyjN1ubTcYD8HAPc+PexrjeQa5XEPljNjXO4ovq
	HVqHkRZv4uoI4r0beUcsekfIwWmwxpNvfDKbJzMnfRgwGU76soteMVGhKJ2V/BrHZXrvmzMDily
	+z9K8EoxiSQbdlcqXr1aR5NrHMMXuqkM3XIMVNjeHNRAaliHR5G2DcKE3K+d17zidhXMz0N75ut
	Z+YhbLcBquz+D/BZo+oOgV9i1CD794QP4fmJUzPu76MKC9RF7sfSGiMHzbZVebgWH3DZWiDrUsd
	zITUCXXBqb+aM8zN0pq3I3ISbtAgEOQTjBA==
X-Received: by 2002:a05:6a20:6f09:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3dd8c3f26a2mr4358676637.2.1789728743860;
        Fri, 18 Sep 2026 03:52:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f09:b0:3d0:abdb:de03 with SMTP id adf61e73a8af0-3dd8c3f26a2mr4358630637.2.1789728743466;
        Fri, 18 Sep 2026 03:52:23 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287b023bsm4369596eec.23.2026.09.18.03.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:52:23 -0700 (PDT)
Message-ID: <6e314a3f-c73c-461b-86c7-472ef02e440a@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:22:16 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Vivek Pernamitta
 <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
 <20260917074804.08818813@kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260917074804.08818813@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE1MSBTYWx0ZWRfXy/60+ah9mH5B
 qndgzjzHptWjhGdKePRMiSohnAmvsin+leWR2b0M1oi9UmQJ7IWEf7mIeuDq4Fui4wUFSOROiNd
 NAV4Ku9/3KCOeW5qkQzoNHde/Y2WGgiRpvtqTX2P3TU0CWINF863TxwE74hHS60wil11mRCt1J4
 CNyjn9DJTflVjCbecw6kbRn3Kn44WA7WKXEECOpWhHaJnboptu0cO9QCQezM1T8bE6FywdGPMU3
 XuginaZj+vQziKa4R7VLVJbKT/Ozw4FV+XLy1uoycyM12/EKhnX29dlsZmzGaBanPsOkeMCrysG
 GBLvovDVgALpKeqLr8mmMnMPrbDrANw2IDfozNoHxh0sRm5UmVLoEEIbq8pIg1w8Dndc/tezS/H
 EL2nbzQd3gM2lpresyuOm8hhgy7gJo1/Heyd1aRxHe0OIclsbxEXis+YtaxhP5Oun012fVkx5ha
 SnsMhW6sy5QZcqpjtKQ==
X-Proofpoint-GUID: Sohz7aye71CNAXUiXWZcgO_rVTP85vpY
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad17e9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=BgRFT2qS3vt3802lDrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE1MSBTYWx0ZWRfX8cwbSH14dHe8
 Hf20w8QAgqW29aNCjUmlXAGV5ejcD75eEL0DR1/abNIB18O6WaQk/D9k/D3eMOmPTF0dfrodLHJ
 dfj/ehN4zwAQeqSfKjd77+6WRy3Skhs=
X-Proofpoint-ORIG-GUID: Sohz7aye71CNAXUiXWZcgO_rVTP85vpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180151



On 9/17/2026 8:18 PM, Jakub Kicinski wrote:
> On Thu, 17 Sep 2026 12:38:01 +0530 Krishna Chaitanya Chundru wrote:
>> Subject: [PATCH v3 0/6] bus: mhi: host: mhi_phc: Add support for PHC over MHI
> The MHI "bus" is the worst abstraction I've seen. You're turning it
> into "qualcomms corner of the kernel". The PHC drivers belong in
> drivers/ptp/
>
> Carry this until told otherwise:
>
> Nacked-by: Jakub Kicinski <kuba@kernel.org>
Thanks for the feedback.

We agree that the PHC driver does not belong under the MHI bus.
In the next revision, we'll move the PHC driver to drivers/ptp 

Since the concern raised by the NAK is being addressed by moving the
driver out of drivers/bus/mhi, I'll drop the Nacked-by tag in the next
revision.

- Krishna Chaitanya.

