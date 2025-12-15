Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B091E7C03
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765782605; cv=none; b=fPv8NHp1NQDQNV68ZRQEshtMwSGjYZnFHhWAKLAc+aLK+YXj8ULpTTacDiSpdrk2PakT4AxaFra06zhAjMW8P2EZLUAvfpW182kP45B+p27r090tSO4m2xXv883mwRQA3jmL8qS1w4PBDOElVceZBU1J5La5Xs6EL92zyE+ZBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765782605; c=relaxed/simple;
	bh=FQjh4k3jyqVA7PBtuXbHS2kerI/YfgH7J0362Jxma1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNjX0pgKXH0mJC2whsWtYOKCKHd8TispsR+xhwR3u9EziAuxddAMPtTmo2lKXpQRWqWzVabBRPdS/vDu/JHqO+2g/NPrLxvK8nXtl6Fax5hoaPbrzdKT5j/GKEr1MLQq/sWkX1Ion9IzK+1T23IU4rZ28CgFpMmcMa1i+lBGQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9FjePqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Alp05Fwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9FjePqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Alp05Fwl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BENP2c02883500
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 07:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xgNTXZ+zJiuxpHyRxeOIDEib
	JBU942iwPmUc9j5aWDQ=; b=Z9FjePqjDIW0FQVjbMf9QjcR61KvoG2DKQm8xPlc
	jEsD6TCGDNl7y9wk6tlj8FNXlwCsPvFzSxeRkOaY/IWm5mNBFmBTTHfXjrPq/YTr
	vxZlk+fL0GHdAKu55EkzA3u+V0aU4CwDL+oGrzysejov4iVz4Ta+EpS9PiGYlOk9
	7GQLqOK/FCa+q7HoR8i94OQwz87E/jZu6oytPVW0lWj8IkLpxgonNwEQnvrQ1COo
	MYIljtzH/JEkmm2Ojvzo09iSF2eY6cQUPm6eK6IT8c8z2u/sKCby29iQhyhjSu63
	f3DvS18BeDF94B572hIHct4PninEG+YUyPmT635f2lKcqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t3h9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 07:10:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so7049841a91.0
        for <mhi@lists.linux.dev>; Sun, 14 Dec 2025 23:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765782602; x=1766387402; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xgNTXZ+zJiuxpHyRxeOIDEibJBU942iwPmUc9j5aWDQ=;
        b=Alp05FwljDkMfzDpavB136bfO4m5RCTi0ax9SnpGxVQnZhh4qhfeMoMux51P+x6pTq
         CEbNCrfiRXflTKWEd4A4V7AdBEb53p3B5iy8vMvlF2rUFSZlFhTJlc5GvHtzrqv15eu1
         GwpmC2ehVz7LmrF34jDgqt/5Wu+e/Hvm0b9Iaum0Z1y/QTZVN5CUoHm8j5DB6JMvdPAW
         Ow/0WoRargrPTwGbfyLd1fHfqyC6g5TGCTE1RYzuvZmJ4eB/xkgcoLKML1OEQ2XswXV2
         +m9xsh/SVibx18P3x3+wIItZOMSOBsGZg0Ngb4lG/XA4Eo2BHUJkyPD72QeeWKtaRYCc
         Py/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765782602; x=1766387402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgNTXZ+zJiuxpHyRxeOIDEibJBU942iwPmUc9j5aWDQ=;
        b=dVatcPa4D7EA937SVXfYcdDQWIVwJlAMZv+bZJ8HA1cyghPxRBWhF9i+ADj9Z6YnyP
         aBpArX/3fot9o8Q/qY2VzM9wwP06XSsajGJ/trIMIXJF16h9AG5H9lE759Oqe4QzXd4y
         wAyrUgo+NKurtX++tmalG661YgL5sbqRiwHQ0aLV1UheohW+nw2h3WNw04dDgxm0iPrK
         RxNyh90H17V8Z8cimEmM4xdxagjsT/XmtZ+vDmfwNs7mH5Gb8wwD8BL003FfR+fbBZJQ
         AgID1/6fkYORzZamgCYxqatuctwFvRlQiK/4zH9Oqx5PYgYDvFkDbmNz5NtAbdVkcEIT
         PdJA==
X-Forwarded-Encrypted: i=1; AJvYcCXBuXi/oxC0lsmANl6l4Z3yBAX49y4mEmHr3FBBB67f40wldV02QJOdWig5RQdofxiYUfs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSgqbfLd/8+k+jy7ImFkUeTUM2mxTOWU5e3xX9yY9RCE8PMPX6
	9s+eojH0cQVvhEuFBvVTbrW03vEDjDf2PVHqHlr8RZNvLbtiCKa1phej94v3Ef6TL/4FVlmiOAG
	wgK2iThUNZ7Gvy+la8wEH7dVewjgdo32QijZ1IS6Tur6mpv8Vnq/AFxo=
X-Gm-Gg: AY/fxX5SEy2eFtA8NpAiKHqJea8saDEAZSjtr9macz4mziFKe1O7Rt1tVgMfctM6bhd
	fp746zJ1HLIM4l/naLgFludxi2IyvgkfRKQdpUnNeB/I7ISMm4hAOdDroEHPojPWjHAH24o5cy4
	LjlpcZhS2dVOfD9Pp/o8pu/fBCJRomJZZEFxAf4/IP6SdfgPLkx2gNuvBD+dVb//XMBSKf5ENhB
	gYr9HbCosYjySDpyvzxMkUobv8uL2ruOxv/rnjMc9ef105SxsVAZ7GziC4FMppwdEpAC6a1CMnD
	gdH+OYOfHJHMTBua9hq1EDPAuMCf+qGO77hW0xfFzI7fgopw8duXRSRgNhf75ne0xWi5iAGfK/2
	W5JftAeR9SEZN1IEdxoLkNRhXMQgSEZ76a6heCD2N7rhG+Hfx22ZtPAuD
X-Received: by 2002:a05:7022:a8c:b0:119:e56b:9581 with SMTP id a92af1059eb24-11f34bd90efmr8355595c88.6.1765782601382;
        Sun, 14 Dec 2025 23:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiYxyp1HunA9yKmRCZRrNyzmwwJf6Q4hj1m/mbGfVJpyDYOC7fCyNkpCJfzvyxoW5C7EdZEw==
X-Received: by 2002:a05:7022:a8c:b0:119:e56b:9581 with SMTP id a92af1059eb24-11f34bd90efmr8355576c88.6.1765782600668;
        Sun, 14 Dec 2025 23:10:00 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm40191402c88.8.2025.12.14.23.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 23:10:00 -0800 (PST)
Date: Sun, 14 Dec 2025 23:09:58 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA2MiBTYWx0ZWRfX2aqcWAxjCHhl
 sWhZ2ti0ID68/qo4BPm1I/5P+WjwNQm1M3uNP0AbAje/E7MCxXX3KglDGcruzVraSphyvoNOhg9
 iZkzktm3OOv0x+f51mCuHk6mUdmUIcuwMyKxrTGOtwoKUa4SckO5rUD2UAoZEZWxMdQJgkQWlUn
 3wV4zhZvYZn/NMF91pkBoB0NYFWv7WZXzbcQglcPFXbjdzx+PdOcS8ovH9FsCW+0k/5tgyeVy5s
 Dq2txOIv5d4zrz24CQiA0fvNy5IjvayhwZl50F4zw8WTdafyKgGNZVB/mdDe/YuXcEbHI4bhUDW
 tv661nulPxRBYha5PgKle2MkIgwL5NhUtVTCwidR5aoDY1Vwx8pR08F+Ju3pVunqpgtUOwj3MP3
 fh/YtJu3f24V2/T+PKfimQ0C3JYDeA==
X-Proofpoint-GUID: GzX99020ZlTHWc1xWtsbvNgNi5HC6h36
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693fb44a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=A0mC-r1KfrI2UX7ef1wA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: GzX99020ZlTHWc1xWtsbvNgNi5HC6h36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_07,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150062

On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > 
> > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > authentication requirement.
> > > > > > > > > 
> > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > 
> > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > headers in a single binary:
> > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > 
> > > > > > > > > Download behavior:
> > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > >           2. Full image via BHIe
> > > > > > > > > 
> > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > 
> > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > 
> > > > > > > > What is standard about it?
> > > > > > > 
> > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > header and WLAN FW segment.
> > > > > > > 
> > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > required for TME-L image authentication, how about using 
> > > > > > > tme_supported_image?
> > > > > > 
> > > > > > Just elf_image?
> > > > > 
> > > > > Is it too generic for this specific use case. Current image format also
> > > > > contains elf header.
> > > > 
> > > > upload_elf_image?
> > > > 
> > > 
> > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > used previously.
> > 
> > What kind of ELF image was used previously? Could you please explain
> > what do 'First ELF header' vs 'Second ELF header' mean here?
> > 
> 
> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> that was a non-standard ELF image and the new one is going to be spec
> conformant.
>
Previous image format:
ELF header + SBL segments + WLAN FW segments

The TME-L supported image format:
First ELF header + SBL segments + Second ELF header + WLAN FW segments

As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
is also standard elf image. But it doesn't meet the requirement of TME-L
because we need separate elf header for SBL and WL FW for TME-L
authentication.

So the commit message stating "Currently, the FBC image is a non-standard
ELF file that contains a single ELF header, followed by segments for SBL,
and WLAN FW" is not correct and standard_elf_image is not accurate.

Can we avoid saying anything about standard in commit message? Flags eg.
separate_elf_header and tme_supported_image are more accurate.

- Qiang Yu
