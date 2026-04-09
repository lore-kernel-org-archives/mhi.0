Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2627829B8D3
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 20:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766186; cv=none; b=YLE/6JzT6zPfNZuxb3Qq/cF0aP98kFRdWAKQ+aSUWUuyXhbhvHv4He+T0p0cOOtPMCmwmYnrPRdaQETZiH1D02V+zIzaxyW2sTp5tSkYjb65x5dF03cG15Papml5g+etVgbhneB8TQ0/yHEnG/uvkO//yr9APlgcL/G/3a2rztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766186; c=relaxed/simple;
	bh=yBJ/NxVaCYwQ0igYQAFkgqv2zp6NSa5HyfEfoQwiFGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCCpHl2iUDn1vokNYc6emK4RjTJAbYH54yR5+38yTvwrBfnq3P4MEY/aWfJFxLdDuxpXZVTIY8p/aVpCp3a+o5/C3mOLBHKv7+f6WXOubF9NIy+0ANmHKThrD60XdLIZUo2foblP3oP1gKgYz+SW6qxAnZRNLMHfE70V5/Oia44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVMVhu6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cviMgK8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVMVhu6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cviMgK8H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JXxVA2866534
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 20:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=; b=SVMVhu6MyGcYZmHE
	B5pO1E/XFaKr6Dz9LBq4FW5XRQOCd4wPVNxtuhjXDYrD71Z1k0AcvzgmbDv0I/Rq
	5eSj04rDG58BVbn57k8aY0URYm0Ni7SS5nDX+WONNvBQJDuUcEg9x+lcWB7YSxbo
	vJKOjlaa+o5daZamgV1LNdush0ZK72uVmvBwWWbeC2XOpC1dpJG/JPOAD5/7FCSO
	ut24fZ8n2TlM27z4+rqedyhAd6KR8FN/0pDaTOod3ZApu1oniXiaYUMS+3K/yHzi
	0he3Hq9q5bzEIDRqv7ezGIJl5p3Splt+2qdc65QBE6Txp2+2wQo3hvzcZaKR4Nex
	sgxjLg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayhprf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 20:23:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so1684532eec.1
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775766183; x=1776370983; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=;
        b=cviMgK8HLHs2OHw5BhCv0qYUSvjJbOQapA14M/Edbyj8u330LHYv9p/boxJJGkeGeA
         B2r1SFhc6Wri2tAeuy42CqHsrlHwO0gEOQ9Gi29fourcjjiR3NgkkBRMCf4BlMQolqfS
         Ucc/6xPm5DQ+QR0JZiyJRQXQyeaih3xwHNZF8bbY4sy9dV7Bf9p83q755VWGWr6JEXQq
         Png1LABwNeofQq5VIqgH+dYml2PRsaBjkT/WPlN7fWWDJ1ou0qTATI06ak5SPNmiy8uh
         TpDqNzwhfH3npiTnzauBRvNmNOAX99O8eSfOtoQRCVmM/6BwmNeRQftiy5ZP7bKzz4ax
         AOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766183; x=1776370983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=;
        b=ltkUiam4fKrVYQ7ZfY1K0LWId5qU0lJlAcJp7ZXwKjOxYfSA/BM3uPPX1uYsFAe7RB
         xU7TqstWvzm64qpwddrIv0EMcq7viw47ZO258s0KiktMBbQKe62wonb17C6O9pcQMe6i
         nVv6bcWG4+yVptQITC7IgNkZBxTXkbzNsLNnB3oodZBvJDXx1sxyuYlDA+TQjV/+N2IG
         AC99iLotE+3hPvqCuHt23EK/pwRlTys6/uBEM+m2ktxIj2lME9wO/te5Jh5h2yDQIs1H
         ALVRaZWr45HffpQ+Gp9j/h2Uimll9xxgvb9fZt6P8kqadelFP3034FN5FnqbUofB84mn
         X1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVWm5RCXZzirZ0VVict4iG3ZydQ841tupKyPmRBEOMtC74ZtsWF3Y3r3t1ydHitKQQaphg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCij9HMLOZkYIml3OuFh7whSPz6EILdZf492Ok/R6P9T4y4qy9
	u/hFdgYhRc/ibT91tYBfRp1XZyn6XUSmMoMsnMHi5zUzQg6pEH1YehiZPv/6c0Fms4JXJ9Ghsvg
	YbNrw580YJyrnxk6kTIh2c7cBN+W8+D1/amLBjZvvC6iFD4C8tUIE9uUMZyB5fiM=
X-Gm-Gg: AeBDieuWU7EReYSr8UsXVr10IidBGP4ROR2vpe9lVstwJn9skF591YyQ+2CkGhgRbuu
	2NtkPXvyOtpg7e9qHwru22ACoaVbzFFkCOSDm/h48qiQSSr8GcrinHJcBQ2jHoqXe/SmmD9oHYb
	haQM+G05tHbWLlKzxAhCG4oLaVTH+A/TXUNMWxYW5CPRHx1mvDZ8xaeq/EQBjiNCCat06DrG1wc
	8YyKtkE/F64/M2YVl234JRfMjbpqTLJmM4I7OlXnOpXpxmjH+08DAQFyWYkClKJmzUFeJfq7NM1
	ypzvHzVTmpNZlOigPKYa7CF+JRlBeoHWP6+U84zYsZklOElST56VkHaWqTodoGPNo2jt5EMo+Ca
	azhRZuba1XUNdxNxbepsJiS2GIJiXGqjTvDCV6V9K0bDTEhWNfCZroYd1bX1dLUFcyWBeTaQ8mB
	0=
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id 5a478bee46e88-2d5897690bbmr312300eec.22.1775766183120;
        Thu, 09 Apr 2026 13:23:03 -0700 (PDT)
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id 5a478bee46e88-2d5897690bbmr312275eec.22.1775766182573;
        Thu, 09 Apr 2026 13:23:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562ac344csm1137899eec.25.2026.04.09.13.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:23:02 -0700 (PDT)
Message-ID: <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:23:00 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d80aa8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3E-APKfXKu7q0kj6aHwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4NyBTYWx0ZWRfX/lTE1Nvy1+gY
 /JHCQm2Q6KgGn+JBH6TWI8ZClAEwVTENc2jYhf/dvqRsreJuoeCjvzBLAj6CsxuKUBJ3JDZbEMP
 aJT9zh3P5t6X0o/AmDQEs1msCGO0TaRk8zhSm9Jam04MebYVWkZx/285fQFFvrjmYLS/u9RR7NC
 JlI3HJnvwZOXHnhqDb5CKKnmQ04X4ntgkZ7siG+vjnTGzGepurlau++gSSnyd3BwPTVhH5FQZrT
 L2QoHdhkOK+9jSME8OLhd9PhAibUpY+iLE6spUA2RivlFt68+OLd6Xe1YgjgsvMsnEKrzSnYCI/
 TrS33UITt3RUcBB8DE+WfDL8BWICpYcurobNTeYxmtaIxgDzG0U+xlLib0FlXFCg01ui/zN/23G
 c2qWemkIv8j9tyPsK5busiyq9Pl48lQD1zTy16r2bbJh+pfM617yJaAwGaKebzN4+ZWC+sbPZyt
 PlSKYda9JANTBkBTpiQ==
X-Proofpoint-GUID: UZhOiO1mLx6LD0cwkLuRjQiBv_Q87qRB
X-Proofpoint-ORIG-GUID: UZhOiO1mLx6LD0cwkLuRjQiBv_Q87qRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090187

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
> channel rather than a QAIC specific channel name. As a result, the sahara

"Sahara"

> driver does not currently bind to such devices and never probes.
> 
> Extend the MHI device ID match table to also match the SAHARA channel
> name. This allows the Sahara protocol driver to bind to devices that
> expose the protocol directly on a standard sahara MHI channel.

"Sahara"

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>   
>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>   	{ .chan = "QAIC_SAHARA", },
> +	{ .chan = "SAHARA"},

This doesn't work and breaks bisect. At this point Sahara will bind to 
QDU100, ath12k, or something else but not know how to drive one of those 
devices.

Just add this when you add QDU100 support, which looks to be patch 5.

>   	{},
>   };
> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>   
>   static struct mhi_driver sahara_mhi_driver = {
>   	.id_table = sahara_mhi_match_table,
> 

