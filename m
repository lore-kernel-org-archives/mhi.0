Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223168;
	b=w1s8xDOYrsU9kYIp8eHbWKE+za11VHAGqAa8WRVvi+DCrgPFq6Y+fNp7Dbm5fUkut08a
	 WQUoNB5Q+Hy32Qc6kIEmU9Z7FERLNoFh5YL/ZMJSNT6HWujG81QL3A09DEx81jsVt13LG
	 xt5tm/oSRGJNdD+rFskf9OPzsnN1yUROZ5vSgbSktQDI8DXaV2A2ISkpKUukl2zkeRz7F
	 J6SS7W/tTbubprRipReC2ZWW1cJly9qaiNbX3DsT6HMAQALramdYspi3UP/84fGUcJUyf
	 C29vHv4IqpBtvR7B21BbOdf6vD1zAHe0dFz88GzPRwc7FFlDmmiEdzDtlySJDluZ7Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
	b=2nHz3CCsNMdJlbm9KxSh1DrKo5/S8oZ8wMaagTmyTmVkgMhc45Ra1RWY1K+IQvh2uRJD
	 duDdPhnyrlw4EnPCV97CFRZ6hreT4nHV4tmnuc0rOWwQlKdtMI1ihUn+v8Gz3mp2+bKx0
	 1MM4mMhTOn9M8M+05xc+gbKD/2OB8TUdDZpBNEoxpjyP4kiTofkGBTRnXET+Iljc6UQGB
	 oZr6b9PPOaNQc3nGvmgB8oIoZ5QAwRq1Slbrc9tPQNREYsmWPOAptvQfPRngna9PBMt+M
	 tBXGNLW2qHWhu1sNXxzegHUB62SPLiwn3ARPEyskXnZJSSirpBPLtBA4WmMuhcbQhpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsOGuWIt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JsKfu0Rr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3E606A322
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 21:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF3E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jsOGuWIt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JsKfu0Rr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPeRn2431678
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 21:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=; b=jsOGuWIt+kH55A/v
	1NNo+qrfpvISreJ9xXX34fAdfvyQMy3IVE/nwrZ7zBouTaL4O6MNz7/rD0uImM1o
	oaEzYk3qdlqlBkSzqQVFyfQ9pWYG5HezU32fn7xhQec0sET/Z9LvMMaovzMojFuY
	vIcYnYPgP8oysRCgmf9RU4Cq0FFcZqo9zdhNJK+cAK8Y29YhPVAMsQCCFZcenmF5
	bB2I5T/qQXNWWLuiqLgmrb8JHK3wXyWdZPb1rf/GdKO38s4chNd614BQjxWjspUU
	HarJ2nio9JkZiASdTpczxzfEOGLWPmC/AmHlXrev9a2zGTCRk01eB+IHy9zNou3c
	nQakHg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7u41b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 21:32:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2561467eec.1
        for <mhi@lists.linux.dev>; Wed, 28 Oct 2026 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793223166; x=1793827966; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
        b=JsKfu0RrQTd5N3J5bGs/fGrkdELchWJQzww2x57QrW49fKTwQunb+CkbKxWc2cPYCR
         PzPf5OLItw+l589TvmM3Cp26esZyqtesEijXzmfkxfYB9w2QM+wo/c7jbTDqIs2t+zjn
         ByquwbwMw5Vea60LeQgrlM7jGlAagVMPPcHusLocncJc50GmACgsp3NdAQry8wnLhI4U
         2DDMLQD7MA9FGY7HCuB5PuSTXixO/xf4lFWykuE86vDo4RP8tNMVBfv6cKp9NFZaLUI6
         +l+W4Qv3iF5sxA4W1/EjKBt7ZVI7sLguIHNe4DO5OfUwxMAePAynb6iqjaqw+Gh+PTwW
         As5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793223166; x=1793827966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roGi78ys1k2Uv1LUZCj5d2Fe7dlBCtFSPtg4j7Hfqp0=;
        b=mfRXaVTsUpkxq8KywPcjDC273dQh8S4VQvpW3+iGwJ0pdW7MCCg1Iyk+lA3XEXz91r
         20HXL1kLCFXuPszyrXFcPCNo6tQVKEUrmRw1m8dD+bTvWC9Nm4tWUCWydHEG2jDCi6pe
         mGG4N1P43rp6VNGbsaDrKHS86x4spnsS2kXRKVesGONPrfBWOp+BEY1sXhuDN2LRf8h/
         a+Hg4vgepnaHvLntJTvPt78Zo6QblwhTwwU54Ssrpovf/XGdB4yHya4Vrze8ZTHNDtdH
         YQ22sWZxi757AAf1d002LbM2MVh+7uJ7TQsoLGj6jr0ov/aesjhydr6RQhAtBNFxaF5u
         8lHw==
X-Forwarded-Encrypted: i=1; AKwUvByLR1CPSJZMwVDbghaMm9lsIrjRoDX2wikjEOJTlM4KOTeXdhWEvThLQWDFLSkeroBFddo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKaLfn3b81NPXKnWGdDmuMk07zFbuIFVGLMHm46bDDoLX6fIVUG
	5DlTEGe3zXZpXZUxKwugK5jG+Vp7zjr1mBsa5G5LTtwaoIssgBnz+5ND/FRTYiehDl+M0WSCHOH
	8rnfnb+MNZT5pUfGbg3+cjC7IQGGRVB7mWv9DibgXzkC/mIkjlwOGjoU=
X-Gm-Gg: AYBFou0ZI+jTt+xmv3JK5a0j14TThp0qwQPFzngy9mobGujYnO3qT69PfwcQpI2rCRU
	6puEiHYZZ9p2d5pzhFEMKfa3fiOKVZjBMj+YhR0oPxUaqKRkM0DlInacLoPxGDMwkj/IhnLaLsl
	uafxipFM4EHsykTQpccyBjhpw4PTHfao0EaTKDeW9pgyXqLTaNo8J5G9Ovm+0MuW2cIOI7mhzZR
	UyLqR4Oy/r8mWigyUIUQ0e8v2X5XI2QqMu8m09dzRsB07L++7JKzqNLOF33IrX960rHxyODhMq3
	BH35HATfJJr5NuTbDGiD/Kjo+mWZ7I3G6oc5Bl7Ry8MsWfopGqkvLTjr+HaM6UypgLb9buu3f+h
	k1478tOJkiamitNkzTSpqef/AGfbXX74yDjSr21i1ymDgIg+Xg4L2AOwAQzeOIz+hwGJ+j3EPGs
	vU4LZpatSDB7DDfB/aIQy34TA=
X-Received: by 2002:a05:7300:6028:b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a2014b7d9mr4548076eec.15.1793223165870;
        Wed, 28 Oct 2026 14:32:45 -0700 (PDT)
X-Received: by 2002:a05:7300:6028:b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a2014b7d9mr4548041eec.15.1793223165251;
        Wed, 28 Oct 2026 14:32:45 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a26d59f0fsm7520287eec.6.2026.10.28.14.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:32:44 -0700 (PDT)
Message-ID: <a34090f0-1843-4e04-a3f0-a53a62b1c1fd@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:32:43 -0600
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
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com
Cc: loic.poulain@oss.qualcomm.com, val@packett.cool, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261021105434.29897-1-slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261021105434.29897-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae269ff cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=hbk5_eJ7lmwJhVnmj34A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: zXShiyASSFfZwfa-KFbrkHZgktr4EbFK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfXw/eKzguwcK0Y
 vSSUddLaGem1F71AmHUyNTuOvxzmfllX4CKkDronYdqZUl1G8aEtYDcLjBifb+Y401akpm9tTmh
 iugBaYQv0ICdi+OFsg6XBVSh1QfbPMg=
X-Proofpoint-ORIG-GUID: zXShiyASSFfZwfa-KFbrkHZgktr4EbFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NSBTYWx0ZWRfXy1U62FSTsszb
 f1oF9Q1AWLOCfUwyz1gkJxn4nwy88BCyV4O7kcviHdAn0zdfhjR7Cc+t9LJh/8aqNFPM6H0Wg0E
 RAObDLF5wiP0/XYtarm5SMlSgGyzTn4qHTp090qXJTwCmy1Of76Hd2ldI5coFhbg6HWyDUkQReZ
 7SIzEo/BmB9lBF8ZaH7GG9hz0wbuiFY9OwawarmjVmRH9CcuNHxJWGNQLmCw/kqHzZUVTMdbZLn
 C1p03G4acyNq5i0TCYhA33vbZoi0TrpGMAU5rOqcfPlNAxIQc6sWiE5kpMUlMB5IeYUOl6AWz4E
 9XjFbSYosdE7qeCI1oPLEjL4nbN35sPft3UYrr+WGi7dXoCWdykBPI9RSqelDyyEI4gn86Fk1Bx
 0U/uDRhWHkM6L6dMOj/d9fktzeNsBGz+2SW496TSzd8Gfs89kMoQ+8OSGn3BPmiSaS9Axu51Vro
 emaspyWtbIPVPBiMUJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280085

On 10/21/2026 4:54 AM, Slark Xiao wrote:
> For some MHI devices in some specific scenarios, the default value
> of autosuspend_delay_ms may not be enough to handle the last wake
> event, potentially leading to device timeout or link drop issues.
> This can lead to a runtime resume failure and a subsequent system
> error:
> 
>    [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>    [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -22
>    [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
>    ...
>    [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed
> 
> Following Qualcomm's recommended settings from Windows and their
> suggestion during case discussions, update the default autosuspend
> delay to 5000ms for MHI devices.
> 
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
