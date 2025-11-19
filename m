Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5291833E352
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544102; cv=none; b=Z4qZ8EzSZzCM5W/JQK8/g82gGzoSBmVuEV2L2vIP09O2Z6fJI5z7v0gvXznLKlnHFRrBeMONjxrrTeB4NOf3r+13zJ58rj73h85Uh67IiNTcyEUVAfJ++B2IVTf/yvAROp9NFdu9GepsB85Tf/8eOZ+xfSpXPlAD1O4XTS7UbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544102; c=relaxed/simple;
	bh=ZfYhmBz3xGG8TUF+q0CBzEzR+jURigJ0Wq12vttxGXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skUP1tuM714hwI65On7xJHRn0omtCamzVLz1ZNejcSH7rT+IMjyF8xls5VkPlwBHIFyR38F5eqm8pILVmsnVfIcDf/iSBZSk01UP2rclFMul43QRfhf6hXM0j9iuo6irthB2FdCgkgwgxAr1HHGWDZJvFs5iD8TKciVkTJt/3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS1JNsBo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLSWMgEU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS1JNsBo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLSWMgEU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ4YTwZ887244
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsasINejjR8g08Tdd6hEVHUhnhzo91JEEiJc6r9moRw=; b=jS1JNsBoI95sKzs4
	MqiTEZpwFEAIEUJbcbyRp97rjhf731FPMzj748RnXZfFmAX/bE35dx/tSG4hi4BN
	urT0yhlsAn8LgWFuU6QKTMN6uMPgvJmRUGNI3yflOtM3AgG3lQ+36sWm0QnjWuLH
	ToB/iSKBbhS2jA7NeiqJDSAuRyVqJKF9rrAW1fNs4EKKnutxSM5GUHrI5bmnInDU
	ok0pdU8mJNaCsn+5XzlnrRfF8gwMGu+NwPXMipwrNQcmJS9V2kBAeA4XwdE2fL90
	W2M7wbXU3acHCgEkAq3ZnH08ylfEljdLGu1mR491YAN+pvNsy3XDCOx3fVqWz+CG
	D8Nk0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6yq8t65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:21:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b227a71fc6so205329185a.0
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763544097; x=1764148897; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MsasINejjR8g08Tdd6hEVHUhnhzo91JEEiJc6r9moRw=;
        b=WLSWMgEUkrfdKtoYQvIk1rJkDT4CwHaDL4hP9/i+81KEAeOEEQuDY6U0qahM5HfCtg
         Mcmubch9juF+/WXZYvXJ7u8pqaB9kcRLhHgF8QVNg9furHRB5CY1zqUDl6uVqYjMlWNN
         KsO8iu2oRUZY7dcBr5WSZ6x3/mJ8Gi9OrchfMcaF2mtwHP6QoGYfkk2AtvOcC4yMrNaz
         IiKWYXc77+kR8u+E8m4fHo2eFxyzVcV4VsKd4OIQNcGIwI5MxsykVnwItI5lg3bato0T
         ME+BIRnkaEW7lUNry49wfYIVF7ik2g/fc66ZXl2SB8NIvsGWP1PKSnVqtWbyzoAInEb8
         futQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544097; x=1764148897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsasINejjR8g08Tdd6hEVHUhnhzo91JEEiJc6r9moRw=;
        b=NfFNMNxUSrgi9tI0Qjo1lNFBUOiOiM+v5NlpUVp9hKOB/lXulWwqPWzKpBqq4vxcBR
         xXYeVZ+492B+f0eAp0qsSXfBApHO2t/vW1kke0lOiBSerBQWemkZOBW/vt/Qsq7pSpml
         QI53NF6gQCLv8hmqI9IoEjroDpdq1PptgxF7YndzyFYQT7VGk3WslmgaChL+OH4XESqX
         1th3DfRf+2lPZw7eRB0Whck4M8m0/5DV0TVWycqAU8klsSa67frvge+tU73eKDszCqgW
         f8AbeuztSnAl35pQ3/BHaf6hV4PYhvKtZEKBGWKRTu4Iwa/C6RGrJPFjLoiOYC2wShYV
         rxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFBhbtKt7zq9EA6dcI8D0x/SbBdA4EA/z4O5pwOMNnEr1GB/27vvRWsz4BvUdgGebxNZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTdcazeDJAYoIVXdAT8YTbyE5fqzflgWqHzAp9df2d0kKNQu8R
	6tZN8jnZVp3CVuSfJjeiSaHlOErpNr++ttbqHI5wcrzzokyj19tzxndQsvcpTOsTSPhcwIo1ZWI
	/OH7N2Mn/s53gMrvIw9Sv26zC4kUSep16daLxdJumFc/yQyPqgAnyRLwA5sHeoA0=
X-Gm-Gg: ASbGnctsNuskdURNIzav+BjSbb82PdU/VfetJUsqNRNY83Mn7Zx5aCpUQmDr/ViaM0v
	fyOrLb+eMycgEMX/K8ivYElPlGB5pCNj/cb3BXzquKp6uoy9tDmRq7XhrGWm3IDIctY0TZ7ZVUr
	wHiSTfs/r27886/N4b/QBqqyj/SE8riVb4jzPROYg6vMD/fYDQpPx7B1yxxr0Ev1EpY6J0hms3l
	1q8cJFBYYgcDkYk/EBS4i8STbB0xZ11doNV+L1ehJVcrqptCZ4wWZfTSTSDl2RLYRY6tfVD8A9P
	v/b9a6bXjNiAQlSMD/Hu2tJlkQ1sMbbvrEz9kr9dN13gw97YWCe7sTvRc/gZ2coD2g3MNo4Xdhb
	RibGWL0/UI2Uh//GjT4H9zjEC7VOtIy/8E2XFC3Pcq/r0Ign4nRhXkT9g9e21kvYLqIY=
X-Received: by 2002:a05:620a:318d:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8b2c3130cc8mr1747633285a.3.1763544097060;
        Wed, 19 Nov 2025 01:21:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsLJdReja/OXKbrpHJO47YoHvi536cH4Y8e7+wYlA7NU9eLvsGh1wk56IakY9aXYXxXYXOlQ==
X-Received: by 2002:a05:620a:318d:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8b2c3130cc8mr1747631285a.3.1763544096559;
        Wed, 19 Nov 2025 01:21:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d7335sm14545720a12.4.2025.11.19.01.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:21:36 -0800 (PST)
Message-ID: <8adcb880-a2d3-4987-88c8-c3441963fc53@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 10:21:33 +0100
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760
 modem
To: Slark Xiao <slark_xiao@163.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251119084537.34303-1-slark_xiao@163.com>
 <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
 <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -HxKI8c6IIhhBKbCYeJM3uIXjy_93Z2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MyBTYWx0ZWRfXw9q6/MYRrZSR
 dNn7cbVy7oHfmczhi1+uwpY2NipTHBODi8Ri/JMZF4+xognNOTlxxZTTSVucN7QmbzwwvdoXXRy
 ofX7getdKdKZMa5XIrsW08NO+KUHrviduREdL/xB9R2JOvuICrBB0W+kptTxsPXJCo7Q9P2jrT6
 81ZDRDymxlR2PWZDLiajh5guHWyaFkl1y6MTk4/k1CpW3WmxnaFVrVTm5dFg2bBZQ553Bs/GY3Z
 vezjzQRrqVlkAyFU2tqdgkWj8hCPz2q2EwktxNBn/tc9xmXsfvQBf/+5Nk85jOTlT+FG8RTbjRm
 JOMfq/WrsvOpnuuFvwNCPA3vqJi+wogl+21r0YziHUPISeoFdc+quiw7HrYQCnL5Y4rm7EgNFz/
 /q3FnK5sERgfeKOvK5RLBPzRXe92Cg==
X-Authority-Analysis: v=2.4 cv=Ut1u9uwB c=1 sm=1 tr=0 ts=691d8c21 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8
 a=G7VRq2ROR16SoJa6LKcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -HxKI8c6IIhhBKbCYeJM3uIXjy_93Z2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190073

On 11/19/25 10:12 AM, Slark Xiao wrote:
> 
> At 2025-11-19 17:05:17, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> wrote:
>> On Wed, Nov 19, 2025 at 04:45:37PM +0800, Slark Xiao wrote:
>>> T99W760 modem is based on Qualcomm SDX35 chipset.
>>> It use the same channel settings with Foxconn SDX61.
>>> edl file has been committed to linux-firmware.
>>>
>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>> ---
>>> v2: Add net and MHI maintainer together
>>> ---
>>>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>
>> Note: only 1/2 made it to linux-arm-msm. Is it intentional or was there
>> any kind of an error while sending the patches?
>>
>> -- 
>> With best wishes
>> Dmitry
> Both patches have cc linux-arm-msm@vger.kernel.org.
> And now I can find both patches in:
> patchwork.kernel.org/project/linux-arm-msm/list/

It seems like they're there, but not part of the same thread

Please try using the b4 tool:

https://b4.docs.kernel.org/

which will help avoid such issues

Konrad
