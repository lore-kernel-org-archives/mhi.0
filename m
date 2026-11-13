Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595371;
	b=AtH/s00lqkEkY62zXqciJ2+XwGjTQXopvfvxi4TvW+qLt16aI7C5RcqA70qLPvbQ4CMT
	 04AvFYA+p5aZjkTL+YgGZPsUna6toq8A67oOoaI9li0+m2bbTJsXVMU9H52VMgS3AQa39
	 SZvjZd4SHdSi+U6HTNJUXhj6okwB/3X9IpD5sGlN9zUjpRA8cJrulWNdwyCm8fTUQjXhm
	 BggtcrxFINNMKujdMKuU6C8O5MUfituaFniFXQAIfuweDrNnsg4OpQ4r4Cas0ZK9XTEP7
	 Mu0RODOsxK4irr/1xVb2xoS81YtlMpHZ52zuGy79sOQPkAn7JoJsJAu1jitxyjb/2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
	b=KPB/vWw3m3oTX/Fkmqb62UzWpXtWDer2yI3ActMtWJ0h9OeMTVQRekqBrpxSkkF4vKJf
	 hcovSllxaEezoSBzyEUh0dwhXM5SUZwW6taegTvrq21lJd3mPTbaWUpSbMMHzHH88V0Mo
	 qkQCbWsrCdZ9DnTY/BXxxLl7CC2oBZxpLv3xenBFdtI2zPAUl/+I5BlVy0H8YeGxs7eDQ
	 k53WN0R4fIoHLcMRfyLH1DygU9nbvrlxgB5/TVjEvuI/EZhl4D+n8GfQq8B2HaCi1M9KL
	 HO66AD0iylacPiqrf/znEDLBoVN/F13QWRrwLMbC5om8oddkAMD5uWEK3Vo90yDuqzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTuBpkyG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkc2mNWD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A796C606A668
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A796C606A668
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oTuBpkyG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nkc2mNWD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR3fD075749
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 18:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=; b=oTuBpkyGyai6ayDd
	THPqtJfQxsHOeVWMJ0sV5Ce+zlRb8MVEhhSH/OV0tf30/MF7V94MyP5Af83c1+FS
	aa2QObsgCrPSzCbgNu87Im+/v/+vYSdV2BmC2UhjuDwgGxRQfd7LS9zj5KfaASLr
	z2L1GDM/86mecLZlq2vdx95ch4EQ26+vm3wKAtyvXzKP5pPkrs0nBWe4lAjtmbE0
	tS59IRGqOAraIPU+lRJ0v6vjuHPEsvptuve9ivAbDkE9fRXT4icB5rtEN2yMxwhN
	YbKlmj0OtL2DxeJAMe3jktToLzexdkmadYe947dLh8PXBeloaFGXGdzNBuFwxDAs
	qXj4MA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu26h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 18:42:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1584686eec.1
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 10:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595369; x=1795200169; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
        b=Nkc2mNWDcdZmtA7k9ndlg/umdDqp+k6jv5UiHxDQcCQkvhvehNYI2Nx1MieR6kJuj/
         Fs9nORwQQcjc8z3m2//MJGGkzwp3GNpIWmOwDBzbqCoyJkNx8++JKBcJHWiPKhAnVPQI
         +fGGNB1IE6mbDU71MXAcoi9slVUIk8FlRb6uFPEXOfNEpP5+QCyYKUKzqwyI3fej9+GP
         5Q8dzAsepVofCzlorMMCEXXN0JKD+m7jiV4oko4igW24ID723LMKPRY19OB28S7cLrsf
         DULHztHPns8hmpW2xI3w5XyCdKoy/SJO701BxIHJYXJDOGtlG6v/dyiN4HDeNxicm1Fx
         EkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595369; x=1795200169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtQv9fBBqzLZu4dFjeLGNnk+sYfH2oM5wagtmKDZJQM=;
        b=a0Y+H/tG0emoXyqTPrtlaP04icQicy0/xFucv63MfgxfdX+uTsaXMjEpt06P5vR4El
         qV8Sot/lgqhdRmJPAt/2TLomRXUMRjzyQUbKZA87lT0HvEvw/EoBIX8Vuv5cXIGYog53
         L4+RJhzH/HIYvOnGLisi19Bnwt+PnW/qrK6k48Xbq0qDy+W8JeA8nURP2kU1FHbjNT0E
         n7o7AazUjh9gg/mYImKTMT0EmfTvpRb0gnDWJMSno4uhzMV2BnhPCMPeDlltwlvQxYLa
         Qu9tgbH48fYkJsMSQdmUsvJFnPo0fQ7PKsmVK8MxXZUYboXZnOAgGomiys60FowxTxYk
         7laA==
X-Gm-Message-State: APuU4Z/egNcL4E3w+iLjQuMxuoacCHpVl8rKP1UixrkmMp5s7KlDh3gw
	0uCfAe5oSpYAfJMYbtYDcsO5t0CitCe6tepBhVd/6RBtVz1xX3DyrVLY9ALwo7aMMLCD0yipBSv
	X8lAF8+sgx8kut1XJu1oyblpKCepmLrSLK4z1Zc9S9ryMXdwWOoUFs04=
X-Gm-Gg: AYBFou3YjyBKbmCnHCq3pnXOSnWpnjyLdCOoGBSMm9r5EopfPzseB+5YRSClTX2eChA
	FGBHQbL3oQXPFdCK7k2bQoukVjrIsvcXvk0H/pCZHyNyDW2Q7nDCrk3mJdznO2xXn2qSBfuxwPi
	qPBewzQMIkGndfow5G45MWp4fHGK0iIFEDZr4qY9qFPIhOmba9mHhfi+IF11T2Y1THIBEWLRdow
	syml5iwGkDRICFprQLT2jRK8/CpTOEcqrbqun+OhtUxAnxeYZaFfWRhWCvE3nlGwYRchhZjjyLW
	PREeASwUKkZJlutk0n17Bf/PRRLZXIwPAr+s+8s4losrA7D+glSuVAjDZOOG7PFOt5dyQSjLyqt
	GR4FuTYDXsjZd+a8vranU51VSljbfYaw4LOnfwHQWwQ9uijNv83aQjlG2Rbe+Y4RGRwTwPNqWbF
	oNRJvZS+CvSyLamYc1KnqpKm4=
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2812416c88.27.1794595369091;
        Fri, 13 Nov 2026 10:42:49 -0800 (PST)
X-Received: by 2002:a05:7022:5e08:b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1b503115942mr2812394c88.27.1794595368577;
        Fri, 13 Nov 2026 10:42:48 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm6327679c88.10.2026.11.13.10.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:42:48 -0800 (PST)
Message-ID: <826c1746-137b-4a5a-968e-8e0449a25e78@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:42:46 -0700
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
Subject: Re: [PATCH] bus: mhi: host: Only expose controller sysfs attributes
 on the controller device
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org, bbhatt@codeaurora.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111115659.11943-1-slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261111115659.11943-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3aUDBqr4f2P-zwbWq16EkFQhR36tW_0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX78UXB5xgU9o0
 tF0SDgY4T0ZbLm/mNqF/Edj8gIvDxEkxat6RX2+4KDceYvQfahycxQvIe+wtFXdJdz+qHqwt8E7
 VprV35JyzNmxh54RvWfROaxnOGRZ0zP5kUZZoJ1vYZPS2K0hXhyfnDKgsRleT01O2SXRBN/upKn
 /l4lga6UskheTk7dTRhpcc6tpYFNpGJjsQynoTKou8UvjH2h3oPCiJndymONRsM7eOO9mXi1GzN
 oDaHbXoXeLt0TUYpVVIpwS5TZXWvpRg+PzHSj3vW25Wtn8d3HX55dUX0hqmqg0OgVK7KBTmFBup
 qMrTgT7LNegxzTmnB8z0C5U0KeCODL3ERLVRjqxy+M0GTfJfz6Fe5BuL1eGd4teu/hSS1kQHpBY
 0gWeIQptySE9XAhNTpXA3sM3RY0OhWKG1MN6AB99pMpFggc53J7UF+m1Og/VuVzLvqV3l27BQdc
 zv0dPdvXlEV8QyA47IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NCBTYWx0ZWRfX7myyUqodJU1g
 AHiEaVKxJuzsMnqyNZey6gMUHACyfzXpC9rrM7ZziisOPyZ6UtznU63quGLWWY/DWV11M3QhwAV
 /O5G9W3I+tmLH/gjynW0y02ig3lWLWU=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75a29 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=48XoENhhM4yzJEw9bqUA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 3aUDBqr4f2P-zwbWq16EkFQhR36tW_0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130074

On 11/11/2026 4:56 AM, Slark Xiao wrote:
> The serial_number, oem_pk_hash and soc_reset attributes are registered
> through mhi_bus_type.dev_groups, so the driver core creates them for
> every device on the MHI bus.  MHI client devices (the per-channel
> devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
> each of them ends up with its own copies of these files even though
> they all operate on the same mhi_controller:
> 
>    $ ls /sys/bus/mhi/devices/mhi0_DUN/
>    driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent
> 
> This is wrong for several reasons:
> 
>    - The attributes describe the controller, not the channel.  Their
>      callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
>      or issue a controller-wide SoC reset, so writing soc_reset through
>      mhi0_DUN resets the whole device while looking like a per-channel
>      operation.
>    - oem_pk_hash reports failures with dev_err(dev, ...), so a single
>      failing controller produces one log line per registered channel
>      device instead of one.
>    - Userspace has no way to tell which copy is authoritative.
> 
> Move the attributes off the bus and attach them to the controller
> device only.  mhi_register_controller() now installs the group via
> mhi_dev->dev.groups before device_add(), while the channel devices
> created by mhi_create_devices() are left untouched.  No functional
> change for the controller device; the files stay at the paths listed
> in Documentation/ABI/stable/sysfs-bus-mhi.
> 
> Note that trigger_edl was already handled this way, through an explicit
> sysfs_create_file() on the controller kobject, which is why it never
> appeared on the channel devices.
I agree with the rationale, but this does appear to change uAPI. Are you 
sure no one is using these on the channel devices?

-Jeff
