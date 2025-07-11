Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C848E288C89
	for <mhi@lists.linux.dev>; Fri, 11 Jul 2025 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752231328; cv=none; b=SD6ba/jts5ZqNtpqZ3yEs2+quG7XaOTH9XJwe9cR2jLUZeBfWIE9VEqULkh0bB6o6wUnALfYuk3dRlqjod05gw2b8a142SRrB27kk08lzUOh9+bbFOTP2d8vn43fQklWZpfb5sMNshmQS8I52bOKEnCLlZI7uPRQMl8Z8Y8junA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752231328; c=relaxed/simple;
	bh=2xu+OXOLKfoKa+DHjFfwab+SE6ntpEh2pVa/29N5gAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWAlqgU2Fdx8gI7Z2o3lS2FwePanQL8PEG+3RQd2lXfrzz25nUoLgFE4JARhH08XMLe0unXmxI+YsFBjEXQr3bkrRp8NGnxwrDEFtY81EijoQgl2jKEJ47I9uaIOgX2yt59EV7zy8Zzr065z4nECXGWu/5XaFZofsSrwZGwSAT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bz+QdSKw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bz+QdSKw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAnJdi018429
	for <mhi@lists.linux.dev>; Fri, 11 Jul 2025 10:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBto8+nkBzC3SIB5+AQtnfGYPNuUEuMvL0M4sbENf7M=; b=Bz+QdSKwQl5wal/U
	gbg+0WNw8MtXdTa6Uj7kikkL6LG93PVtd1ukrhBBNo+7sDT8LDNirMEIL8DpW4l2
	yhwwHsETVlCt7X6wCyeE+hfmdhGU9ur//FySrA3jehGFrSYHOtPL+fXo8rSaHq1l
	VJNcEuAPbd9W0KONfQMPj1D6fX2Tk7oAOjrntUj6IXeWm8WMFdt2CKpBfxP/1Bo0
	5c+v8w1pNWFWASpvoftVHdLNHFRbYUmvTVSaYwbXtK8tdTQ3E7N0P98WEVO5F+2d
	xB3GTzJhrD6lMeyiTNyHVAMMROAPUbrPt4jvHM0rRiwD24R7bgS8OAMZmfXVVRMt
	AsSTDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf3277p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 11 Jul 2025 10:55:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-236725af87fso32214775ad.3
        for <mhi@lists.linux.dev>; Fri, 11 Jul 2025 03:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752231314; x=1752836114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBto8+nkBzC3SIB5+AQtnfGYPNuUEuMvL0M4sbENf7M=;
        b=ISo9sY9G5DGTmy6JOE+DqG7JRxH2DldepE+gZGm7GKWSGortT0InVo1Ldepoi/u6u0
         URYGGEDBbryIJxIwe1POHIr1TPlXDDnfn7yFuGRtKzFOrOXtcPOiFmg3sBRbQejPND8/
         YX31YPKmLwkSchbjRh9XVvNd80h5XJS+PyqrCwBvCTs65GxoIixVW667V4QdGBzcoCPR
         eVHemmhXsNH6lRj3j462lGuR2Q1UoL8xHzRcTn/1xCebfdyO5jyxw4SzXyehyIIIQj7P
         jiG02MZHDdns/y+OYGCOYpxifdyDr4YCWEdjeGz6/GIYi9ZPR/kUtLkOF/mRjsq8iQAL
         OPKw==
X-Forwarded-Encrypted: i=1; AJvYcCXVIjrSQWzgpaEfHIRavUAXHphrleXq3pF1xAQCco8su0wTnisrKlN3zmF+q/8o6R76DAA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYRFFWnkwQWpi984sIsxzfgp8xzOXab/IvbXGSz5eRnhI4Njhy
	KWs3DPi9+ufNS08BzjfudwdL2uiKWHQVUtY+Nxx8NvIZPvDdf6fB3qGcGplJlM/eD8EyeY96cIn
	IGfPRD6QvELVM86JOCvJRHUx4YtHUs33ssnCz+NmkdcB3tpIUHEciovQ=
X-Gm-Gg: ASbGncsglaugy35VxCgKGW9J2H/htRlVC6t8Ubm4efOdJ16RekJfvz8yEJ7+nm6zy59
	R75DaLcDWtfY1A0+oERzQASXxVDcNugfR9wiNY0qawf6t4F67RkixmOLbvUgnpyJZFSAkxqYkXv
	dWQCEGCiGX8x6z19vMaqXnqZ2lbUBIXV+dvhroNgAPw54Zx/wsqaW/QpdCit59OkYVZrKNyY7Ti
	u80+Go2T4eZBYEtLJkUvqGd/2B5CmzJpe/qpvj74JpvJ9VDAi9bCTzr15KhGKlXCAtx/XrlHlT9
	CQ++SBDoZJahd5Zs4yitqckQ/P4P4xUdBeEJMlHns1DKGxX/cJDS6X3NYCwVk5W0PcMi
X-Received: by 2002:a17:903:19cb:b0:23d:da20:1685 with SMTP id d9443c01a7336-23dede2d1fbmr41332505ad.4.1752231314421;
        Fri, 11 Jul 2025 03:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO7zVGoYd5Gn585ClIUPh1ymONaAtRPnkgGM+Z60hbp5/SJEPrqzqHuoCurum2APuuK+XViA==
X-Received: by 2002:a17:903:19cb:b0:23d:da20:1685 with SMTP id d9443c01a7336-23dede2d1fbmr41332125ad.4.1752231313936;
        Fri, 11 Jul 2025 03:55:13 -0700 (PDT)
Received: from [10.92.212.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aef8fsm50345125ad.76.2025.07.11.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:55:13 -0700 (PDT)
Message-ID: <35f057fd-9aa0-4de1-a6cc-0d17ffb99e23@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 16:25:07 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
 <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
 <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
 <2a18cf9e-1dd2-4e09-81f4-eb1d07324c8e@oss.qualcomm.com>
 <irnkdlrmlozp7joydgnawfuivl2nnuxsb2t4osgxzbtyrfzd3n@7dhzjcd42aiw>
 <c7d4288d-4d0e-a3c2-83d2-c3f1b282d4ac@linux.intel.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <c7d4288d-4d0e-a3c2-83d2-c3f1b282d4ac@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3NyBTYWx0ZWRfX+f6WvpPq/pbo
 6D47P5Qo1AaTzsWEdM61VvQ4fTZdiAqBhTH+yG2r+3bgXYciMrxOmLKRPVganxV5MHSquVwX/+u
 uV1zWJbDmZSGPMk6LEMIYzlh5FwslgTug1sSv9T4Mxwy1YjE+kzgTWt3dWfbBw7ZmiYM08KukIL
 epNh/z7TmC8mE2dujTuKZQccxiGLDLZn/eKdAVupVyfhfijcvpGJMaFnCAe5b4Ekus0jI6137Dy
 BqeizU+A0qorrxH4ugySDzI1vk+9q3FZlDDU/f08Ckydk/233fGJp8vZipNg4Kyc3PfgEwQ+nsP
 7yG+TL0c0MOe9dx/xAaGVxbiYLzO7DW3YGBm0AK5F2nOHggZ2sKZf0RFcFGqQ488SEJh3p9X7QS
 E88+3Kzx1BK8OHS8K5ZqX8TCGMZR+pO+K6SyR1WRDezunvPQN6neEE/Cp7ViaaLtX5alqrqu
X-Proofpoint-GUID: J8bEBA86o4Pr8Rfi2tyOeh5F3pQj99th
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=6870ed9d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=9wcXyvJq732FR575IagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: J8bEBA86o4Pr8Rfi2tyOeh5F3pQj99th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110077



On 7/11/2025 2:51 PM, Ilpo Järvinen wrote:
> On Fri, 11 Jul 2025, Manivannan Sadhasivam wrote:
> 
>> On Wed, Jul 09, 2025 at 06:01:22PM GMT, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/9/2025 2:40 PM, Ilpo Järvinen wrote:
>>>> On Tue, 8 Jul 2025, Manivannan Sadhasivam wrote:
>>>>
>>>>> On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru wrote:
>>>>>> ASPM states are not being enabled back with pci_enable_link_state() when
>>>>>> they are disabled by pci_disable_link_state(). This is because of the
>>>>>> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
>>>>>> flag is being properly cleared when ASPM is controlled by sysfs.
>>>>>>
>>>>>
>>>>> A comment in pcie_config_aspm_link() says:
>>>>>
>>>>>    /* Enable only the states that were not explicitly disabled */
>>>>>
>>>>> But the function is called from both aspm_attr_store_common() and
>>>>> __pci_enable_link_state(). So I don't know if this is behavior is intentional
>>>>> or wrong.
>>>>
>>>> Hi,
>>>>
>>>> I think it's intentional. Whether the behavior is useful is another good
>>>> question but the current behavior aligns with the explanation in the
>>>> comment.
>>>>
>>>> My understanding of the situation is:
>>>>
>>>> pci_disable_link_state() and pci_enable_link_state() are not symmetric
>>>> despite the names, never have been (this is one of those many quirks ASPM
>>>> driver has which should be eventually cleaned up, IMO).
>>>>
>>>> It might be appropriate to rename pci_enable_link_state() to
>>>> pci_set_default_link_state() to match the name to its functionality (and
>>>> the function comment):
>>>>
>>>>    * pci_enable_link_state - Clear and set the default device link state
>>>>
>>>> Note: "the default ... link state".
>>>>
>>>>
>>>> I've already raised this concern earlier! As you see, my comment are
>>>> not getting addressed. I'd like to see the author does one of these:
>>>
>>> I replied to your comment on v3 patch[1], and I feel instead of having
>>> new function() we can use same API to our purpose.
> 
> It's not about what "feels" something. One should clearly write down why
> such conversion is correct/acceptable when it comes to existing callers
> if changing an existing API. The note should be such that it remains a
> permanent record for future (in the changelog).
> 
> I don't have answer to what are the expectations or intent of the existing
> callers. Convincing a patch is fine is responsibility of the one who is
> submitting the patch, not reviewer's.
> 
> Unfortunately, it is usually quite hard to figure out for existing drivers
> we're not familiar with. I'm not saying your "feel" is necessarily wrong,
> but the existing callers need to be properly investigated if you choose
> that path, not just handwaved over. It likely boils down if the
> ->aspm_default and controlling it are useful features to have in the ASPM
> driver as your patch would take away that ability.
> 
>> You replied to Ilpo, but never got an agreement. Please try to close the
>> discussions before posting next rev. If reviewers forgot to reply to your query,
>> feel free to ping them in the same thread itself.
>>
>>>> 1) Renames pci_enable_link_state() to pci_set_default_link_state()
>>>>
>>>> 1b) If pci_enable_link_state() is still needed after that, a new function
>>>> is added to symmetrically pair with pci_disable_link_state().
>>>>
>>>> or alternatively,
>>>>
>>>> 2) Changelog justifies very clearly why this change is okay with the
>>>> existing callers. (And obviously the function comment should be altered to
>>>> match the functionality in that case too).
>>>>
>>>> If approach 2 is chosen, it should be very carefully reviewed when it
>>>> comes to the callers.
>>>>
>>> I am in favor of approach 2 which you suggested, but lets wait for other
>>> reviewers feedback on this. Based up on the response i will make
>>> necessary changes in v5.
>>>
>>
>> I would go for (1). It is always going to be a problem to change a legacy API
>> like this. We might end up causing regressions. So it is safe to rename to
>> reflect the purpose and try to come up with a new API that does what you want.
>> If callers want to migrate to the new API, they can also do it in the future.
> 
> That's my recommendation as well.
I will take this as learning, we will go with approach (1) as both of
you are having valid points.

llpo,
In the previous patch you said you have some patches on can you send me
those or shall I proceed with patches from myside.

- Krishna Chaitanya.
> 
