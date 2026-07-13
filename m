Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357CC368D4C
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927210; cv=none; b=kfKyfme/3HNoSs42dJckzloa/xsH6fScnEsIA5yyPgvoY7ynT2usCa5Qb4QIW1Wr/Nxo61t3dodwnjMx7nOsjyYjn+4s/2TjSkbsUl8UdDHUTVvHWEHYvY8s1MeYXUOzseFk+KldW5AF1ixvErkQxONu8iLrTcNov053Hwv2DBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927210; c=relaxed/simple;
	bh=ymGVgCO6OEArl2cJNNpQKOHAWyU+qbKaglywmHSbgp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkbFksdgxgz1JA8fkPpqQGIRsrZTmDc/9/8bVLLv4tbNcyckakj0gWeZZexpl2KatprVUGmgEmRplllMmwH2SpLUO0D8JzTpepKR5t4isofD2PPgrK2cX8GeRWYIiQ2sf5ek9poSLV+IYtfAwepV6TUJLPogFRyAG/0Ky2XJTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuZVA2il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fK5ST6cb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuZVA2il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fK5ST6cb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6OcUv605123
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CCDChNA9Xvl37VAmNthtfzvgdA8yOF5Co/p3kft3pP4=; b=EuZVA2ilIJ7W9Zfq
	0SzjCDO/PcAiEsx2dRJnLfsG75isPyitJGsGwVki7RRBBvH3J6JhjaDnrfuGG/l9
	0xp1RN3OBZ6pM9pqbQGEC4oI17VutZUaKtKlZnQz8s+xho4wW42C1X3Fly/Dn7Nq
	oZGxU2E/BLHMTMF9auRqg2vehrPYQUFCDaKsOFArerxEKzFt5npuI4l4+lUYlnqq
	f65nxCgn6L7AEiNocbfcDp40Xema3Q3auYRoZa5tdp13VtQREGjM1bOAF7xAZ/4j
	EjizrQfJHdl+CW+1nUwLkFXIjUQQ8vjSu5EFXGpU+GrBXQAzQDF/EpjU7MLiyvBo
	QLBRsw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehmxq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 07:20:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38869800848so4745214a91.0
        for <mhi@lists.linux.dev>; Mon, 13 Jul 2026 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927206; x=1784532006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CCDChNA9Xvl37VAmNthtfzvgdA8yOF5Co/p3kft3pP4=;
        b=fK5ST6cbMSXoRNzyheJZk3dx4sdOVU3uWlygvNV+GjuPgMm7SrIoRYi2B5y693fohp
         Q76OYeNw7gemF7NG1USxSxAwBxk7B2oieKRWTjS3dgMRbAGp4MevZInIMrGoqut0mZhU
         HOyye9EpJJJ57h1pxk25hRv7hPxkuI+Qli2KwJS7o8T+kENFS9b5Sjl37mcgLlfa6gjn
         CMLjoaCrcvEzCRNTxyxPnB5i2lc/huoCTkpaqrvCVvmUrREPoJYILDOa6/woECLFuaQe
         ijGVqzulKeStIVAKF6E4iXXZNxqPWBRJe0h6lS0EplztkIQolYEti+nPQqoDvarJdji8
         hGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927206; x=1784532006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CCDChNA9Xvl37VAmNthtfzvgdA8yOF5Co/p3kft3pP4=;
        b=neZbnGJf6y6aThRVll1sGFkQf1juKDql3YldjcTovljO7nmM5KxUEDVRE3NREaa8wr
         ZwJhYNu+uFI1QBExKxin+3wR9n40a7iF8rJ3srm9U8gKDbeB7qJkeDtIAunLf7xPlf4G
         rKmm/b/Y9jeH2/BhNV+ye2d8bUqkTystf3nixpFDUqZE6PGQfT2ITifRErre/zk6Yf9u
         QATuyZ5ItB4thn1lvmq+Rh+VF1Kbltu2TKJ/aYJHyReSvwX4d3TO0j6n+OAKcdVG7Mq7
         Xze07bbVpYGjNQQ3aoFBoqO0K6P6aR2CBr05ggv2TDN1Z2xkVVLdW7k7gduaQqjvDxSm
         2RFg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3BkR3KzfhfKwVYbRLPoM8ZPNIbzrX7bZIykHGaaKAYMReBB60jslc+rwKXpI+5GnaeSg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq/OBNRaYv1Ggp6tzfGwAbWBvmVncDR8JnwH+f/jx5PdJlSTNL
	MXrU5LV8iG9+Sns82r1EWZHRxg+unMIxdMDkNYKPdiyMX4HBjsI7tSYmo4HmiAhzjDCa9JxsLJi
	YYuE3mKwHuF9BroPaas9nKZe3Hyp3NvOzlqzRKf9n2pi8huzVEI8Gzmk=
X-Gm-Gg: AfdE7cmxrE9XQh9m8FnTR2sExcRq+qcMCiGBhljxNMGNnG9W/RXPTPRNGyv7gwulmIH
	LeLo/M44vrEsUhUwVcctgAibcKDeJJ/M/mmne/JwstSAZ3AMmTSNdM2bhVMMFDmhhgSmDt4mG/N
	HFPkz/nW4BToqIzGa+W3wqVsFuniBUJS8W1aKs+2vNs3My9H7FEGwdLZfERGa4arW5Xb1mY+b0b
	LgvI4JaR8GX7Au/5dn41IauFZ87Rs5dgrvmKILbkE4ePY/nc4XgIzZUp/QriT/hYdT1AR2eowjI
	C0bWh4GKv4qb+1WIIExzKrc+gL4I4HPXS916WoqYiT6q+A37AettU98t0o6poMO/UfFhhNA+91y
	SpXZVX3Xhs4gYpAPiyVblIOJbH+W5SfwuSueZJ5LvuL8=
X-Received: by 2002:a17:90b:4c02:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-38dc74c4b29mr7787323a91.4.1783927205731;
        Mon, 13 Jul 2026 00:20:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4c02:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-38dc74c4b29mr7787302a91.4.1783927205229;
        Mon, 13 Jul 2026 00:20:05 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a583a16c2sm6071162a91.13.2026.07.13.00.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:20:04 -0700 (PDT)
Message-ID: <05af9d4f-ac6a-4a7d-bb7a-41fd50fc9935@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:50:00 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
 <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX9AFlreNP2VEA
 Rl84D5D3xvIgEtu/bKpYZ+UAEBkencQ1vhn8RlRM44h1l/64UMMbEvC4kmhgRryZrOESZo3HNcs
 gh6Aq86uwQh57/a1CMHSrDRuQ3SBmXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX7zFNoGMwekpA
 V7l3U/xNNZOtHq8x4ZAQyrnR+dvZyZ9IPI2SeeAwTsoLtYt3JWT/8G222dWgukOft8P0yFGYMPg
 Eqtn+rA32EmQtIRN0kkGapPfibXJ1ROethFYGusDmjjhVFzTVGZh+VL4I+HHfx3ICtCJKUW0AZs
 cP1h3BVcnTRUjBQczgDuXb/RLNNH+AAqklN76Ot/i1pzkKVv7Z8ouV47nhrTKhyx/tPIwV2Ekjw
 SUJVUdMcoWBsaQGzng0qtqEaHOtggYquXt+uv7ecJn+bpiZhB67LLwmr0U+1LbVRDmo2nE3swrT
 DvS2njuuhWHlMv1H8tT5me3Vdw9b/OilliE/FwsfyIDxGhMBZcp66PYsEBrJfU8ntIn7I0hEq/q
 p74pxC7S1q36ET2N07bx34vVglnPEVqyG2Mw/FNZViljzqk38PqMZzFq60hVx7LZs6+HzhMiXG/
 Jvy3uqdtg5wrrmKtPog==
X-Proofpoint-GUID: 8HZUw4rtKANlnXfxQwXMx19cXz5QWJxi
X-Proofpoint-ORIG-GUID: 8HZUw4rtKANlnXfxQwXMx19cXz5QWJxi
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a5491a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=s-wG5dvStlP9jbJ101gA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130074


On 7/8/2026 10:16 AM, Randy Dunlap wrote:
> On 7/1/26 3:37 AM, Kishore Batta wrote:
>> +The packet flow sequence is as follows :
>> +
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
>> +
>> +2. The host sends a hello response packet with a success status and sets the
>> +   mode to image transfer pending after it receives the hello packet and
>> +   validates the protocol version running on the target.
>> +
>> +3. After the target receives the hello response, it initiates the data
>> +   transfer by requesting the size of DDR training/calibration data.
>> +
>> +4. The host sends back the DDR training/calibration data to the target.
>> +
>> +5. The target decodes the training data and does not find valid DDR
>> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
>> +
>> +6. The host sends DONE after receives END_IMAGE_TX.
>> +
>> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
>> +   not received all images.
>> +
>> +8. The target executes DDR training process to generate valid DDR calibration
>> +   data and prepares to push back to host.
>> +
>> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
>> +   to the host.
>> +
>> +10. The host sends a hello response packet with a success status and sets the
>> +    mode to COMMAND_MODE.
>> +
>> +11. The target sends CMD_READY to the host.
>> +
>> +12. The host receives CMD_READY and starts to get command IDs to be executed.
>> +
>> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
>> +
>> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
>> +
>> +15. The target sends RAW_DATA with the payload which contains DDR calibration
>> +    data to host.
>> +
>> +16. The host saves training data in the kernel buffer and exposes to userspace
>> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
>> +    IMAGE_TX_PENDING to continue booting.
>> +
>> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
>> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
>> +    repeat the packet flow for image transfer to get all booting-required
>> +    images.
>> +
>> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
>> +    packet with a success status to the host.
>> +
>> +19. The host sends DONE after it receives END_IMAGE_TX.
>> +
>> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
>> +    it has received all images. The process has been completed after the host
>> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
>> +
>> +Subsequent boot scenario with valid DDR calibration data
>> +--------------------------------------------------------
>> +
>> +The below firgure shows the subsequent boot scenario with valid DDR calibration
>> +data process being loaded from host to target.
>> +
>> +.. code-block:: text
>> +
>> +                        Host                       Target
>> +                          |          HELLO            |
>> +                          |   (mode = image transfer) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          |   (mode = image transfer) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |         READ_DATA         |
>> +                          |   (img ID:34, 0, offset,  |
>> +                          | size of DDR training data)|
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         RAW_DATA          |
>> +                          |(size of DDR training data)|
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          | Subsequent boot scenario  |
>> +                          | (valid calibration data)  |
>> +                          | DDR driver configures DDR |
>> +                          | using valid calibration   |
>> +                          | data                      |
>> +                          |                           |
>> +                          |                           |
>> +                          |          HELLO            |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          | Boot/Load rest of the     |
>> +                          |    images....             |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          |(mode = IMAGE_TX_COMPLETE) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +
>> +The packet flow is as follows :
>> +
> s/as follows :/as follows:/
> in 2 places.


ACK. I'll remove the extra space before the colon in both places in the 
next version.


>
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
