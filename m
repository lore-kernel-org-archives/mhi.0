Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E54208D0
	for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911517; cv=none; b=Y4xWfmRfMwhnFPu352LflUaFrWKtx4Uu7Tyo8GQQQRWvQGTrsZTIbe/PMQyeTduOoAJ9pHbmENTf2QWtr8QZuVYc2FWeG5nguBOZxRg4xc9Tvg/q5zKnro05GMgmRgOsYYx6yG7ONkCbzOt+OW1HRQcueofL7pysXhcZt6sMWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911517; c=relaxed/simple;
	bh=I+3HK+rzmSqmU/qhNkj7MN8hSIQ8TsvJfaz6qXkCFKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EX33oAaE9Wv7RtiSmNSxl2y0lKCCzyh3HkMBGtGqj9N2BONel3YyTDk/DvoCc3rhmFH7D2iYkwUKgYirCY3Fim0h9cQK+XN2pthDlYPbgolmcQbIs7Mja1UvuUDT5MLd9Ibd+NYIlK/BsJy8f4oRPkSPVGVZTcmseV5/KE1ALUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ax5CnJ3p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8pTPphD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ax5CnJ3p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8pTPphD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRjvx1339800
	for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 15:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jNIQL3IR6L/g6fCcKQxO3ab9CjE6vLb1z+JStGO11LY=; b=Ax5CnJ3pFulxwKBi
	P97kN3f5mxNlXsKJ1F5IDTyIq1YpcGMlLnTUy8jx9wb43MzG8fBh41ClSg8JYz6l
	RYm+bp2cMaYvv+6Td1xPc7ZPNMYuQiErJoNeF3J6T6ZhpS19lOWCxHO1/IDFuNKl
	Psi8Wgfd7+q/IPaNatoFeZN+AwXwExV/Suc/atXFJ4lQoHFi10sGC+/H8eqBmptr
	1ECfWLpmO+nYG1mPLeOxy1s/Ogqfn4dXxDr/jtU3VIzpb2LGw+JOCIGwpBx9BkOd
	SG2l10qoXQQPeTYaPTep38g+RO6kEdizZZR1OPhF/AbsRymJLlW/biYSUbXXMlQQ
	uVvGWQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wjb8n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 15:51:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso2594748eec.0
        for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770911515; x=1771516315; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNIQL3IR6L/g6fCcKQxO3ab9CjE6vLb1z+JStGO11LY=;
        b=X8pTPphDZKngkkFFxnuK8lW7dK2mqx1p0ZhAKIVqiL/fowJ+nF5J3IOdz6P+P9S1E4
         xEg1DvfXlW3IyMYVjtbuxbp5WA2UfQ7DrffX/UgkvuQ3mFfUOL9SHpBcPw2KKw7bvTej
         GODGY1sxsiBvj+j+QrLn2kZANR8S0wOHEsNUVG5T7HoRv2e0h1C1YLF/G8x2IHqOSUMT
         iRIgyb/nZO+86epOj+uIKse3K06TJtln8EHU/LQR7a1sXVf6NZnZwUWTkDJonMPNlvf3
         5+IGhWT0vZik+QcNqVVRHtG8MNMPbHQGKj0GznquCKFVr1KW+JByp3A9cVwsviAoRCNc
         wjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911515; x=1771516315;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNIQL3IR6L/g6fCcKQxO3ab9CjE6vLb1z+JStGO11LY=;
        b=uT/h1PDSb+mkfQXGv2MOUHMig7QaiQlLBWEAEOa4TneJ0HUjcWsF1CfKtAALRDc3mY
         QVAu0LRztiXjzJdDKoHh+10RuBB7tukAFvZ001Tc0eil0wCJ9IYtQoMvGFnLFnxbwF65
         Z+14ee/beVbxBoo9Nq4490srKHEpMgF0eJa/ACwtzQ0jStQP3NiWdfqJNKK/hUs8CYpF
         JN2gnswvsuvRFAp0diBCatk04eSmgq0hlCwpBkTQgQmZKnRT7cbpozUEusAIDIZEdUrC
         fsBo4dGK6v34ropc72kXx82f0JJBDLTz9/aKMqjRizifN9X3Sfx3isAL4nepyinwoBxZ
         M3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUvNwck+YPGNN2CfT+xGWXNUtmltmhEAGYLZH8UdNYOSUptRWLlg4t8j5Em4c+H24oaDoM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxL1gyCQojVl5pzcR/TJmHUOLSw2ChYsHpbWLZwqJfLX4oJqRaB
	Efgd3OazLFdpMFvnRLtkkGnnovaq6++FtrT47J2dH3Bni/5qxrti/1L7EgxXY8jggL7bN7iy6HE
	9pcZipyHE2pbp9giRAlPCzogCKBM/wMKIkFySO7MrzgLp7L8Sg3+vcTE=
X-Gm-Gg: AZuq6aIzmQ5fu+s+z8Ptjuil7qqk+Nwvf+cxMxs+aTr2hjh8RszEcrvNidnkcbXUrbi
	PLPARBMs31xcPTiTjyPZRakVgPkyxZw9snI6+Rc1Qw9HEoyFz3GEZr3sf76xuN+JBOD4YX7sMoL
	7wmLq+fFkXhuMLh4aTCWpQZzcqY7Peq6O2mzfMG/Jony7Lh2IxY7n5xa/l3oe2DG8CQBbfiKeo6
	2uy2zsSvbQkZCFIb/6OnTcEa0mZFuuyHvK+bEtCMUbP+68UgaZY0RtAPRJ/5veTFdqFIH2AW3BQ
	mIevAU/Sry3TU0zUm6e8SLSq21I1TWP92x8+VvV+Sx1y8MHbjXLX9Zn1xZGUY3JZwd9218xEVuN
	TlVaOJ9sxKTKSa7ClKymW/QCsWmPc9cV/lo7XD5r7H3adhrlarsgL6CyxibGqvyL39sx+u0LOYG
	a972btQHbEqwgQ2A==
X-Received: by 2002:a05:7301:678b:b0:2ba:9cfb:2744 with SMTP id 5a478bee46e88-2baa8077336mr1166367eec.30.1770911514522;
        Thu, 12 Feb 2026 07:51:54 -0800 (PST)
X-Received: by 2002:a05:7301:678b:b0:2ba:9cfb:2744 with SMTP id 5a478bee46e88-2baa8077336mr1166348eec.30.1770911513619;
        Thu, 12 Feb 2026 07:51:53 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dba2aadsm3726033eec.1.2026.02.12.07.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:51:53 -0800 (PST)
Message-ID: <5afc9deb-e6c8-4224-b96d-5e8a2ebf7de3@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 07:51:51 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Networking for Linux 7.0
To: Jakub Kicinski <kuba@kernel.org>, mhi@lists.linux.dev
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260211173015.327542-1-pabeni@redhat.com>
 <76e6b68c-393e-48d4-9ee5-9e8d511ab308@oss.qualcomm.com>
 <20260211154008.24db40a7@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260211154008.24db40a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698df71b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=qNABUOcEAAAA:8 a=6jdU60nbdyzYgp056TkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=Ytm653ucTKQjCvbzLygB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyMSBTYWx0ZWRfX3SqPBYZ3eZuN
 xap/QnmgeGCN+JxzghpQ336P2W31Me7YqaJDHPw/U4sg49nh0RG4SUaaqcWcH8vgxeto9RuJN2n
 hmZ3xz5pa8hCtoEj0CyRtnXdMEkQYjR/4fcrqerBzz38runjuCY5YTswhsq9UyrOjPL+7C6EBED
 pBow5eywUlOa5TAX9b3cF5K8ms1RTmprz0FKaw5hqTMUlVqyrVaycM6FvZIejblTwZHrwUW6oRF
 ESz25YQN3T3wOp+zs0xqUH2p7WMbCJ75cuZpBOO0u2ctr61rET8of6w0XxwRCT7lvIetqRmJ/o+
 bYXYU7cmJqp5d/yjwvik5wNm2BGuYMi2EzPJyBfrp9I4rWIzXM7DPaNtEIz2eze41X7b6cVhhtE
 6HCJxQpOMKPY4P4WoinwElAFM95JxPNElRspS7nfnlJJnpNYBUgeKWtOVEGmfgbqEcXBAC/UgdA
 SkBINah4SeS9XjJc9OA==
X-Proofpoint-ORIG-GUID: 1nC35EH3sMQl0rjNVygBnteh2agzEcrN
X-Proofpoint-GUID: 1nC35EH3sMQl0rjNVygBnteh2agzEcrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120121

On 2/11/2026 3:40 PM, Jakub Kicinski wrote:
> On Wed, 11 Feb 2026 15:07:18 -0800 Jeff Johnson wrote:
>> On 2/11/2026 9:30 AM, Paolo Abeni wrote:
>>> Hi Linus!
>>>
>>> I'm not aware of any conflicts with other trees, even if this includes some
>>> changes to printk for the sake of netconsole.  
>>
>> There is one conflict between the refactored ath12k driver and the char-misc
>> tree. This was correctly addressed in linux-next:
>> https://lore.kernel.org/linux-next/aXD6X23btw8s-RZP@sirena.org.uk/
> 
> Will there be an effort at some point to improve how the MHI "bus"
> is structured? Maybe this is not a great example but we keep seeing
> patches that touch a driver + the bus. Clearly indicating IMHO that
> there's no proper abstraction / separation between the bus and its
> users..

+ MHI list to comment on this
