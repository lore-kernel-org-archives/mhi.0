Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27218A6A8
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020349; cv=none; b=an/y4P9VbJlkerayrTTw6XM4zZKBZ1bBMtk/v6DLi+qWGgSab9G+bsR0yvBon6KZTbay5slNzP+lkVUEMjRJSvt/UigioihzJI8Umk6e8O4MK7BrfkiGPXv5Cumei2d/xleI1Yr1O7E0xU3rKxL6K++Jc49NxSGl7LAWDyf6aRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020349; c=relaxed/simple;
	bh=Y4TyTIsFo5TNWzPCic1t9bDHpmxhm37tqGiar4U6sp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjQmvfZhEWStsYbyvsVFB0tkCtbI56TnON90Pj2jgaRrQ2Me5igGFWK/LH9C3MNYYVeDJH4tyVgXrE0Kb4i/ksEnnNQqVEyJrqv6u/oKykv2Ecl1DQRMIqufz+6ICeFiNnjwHQUj+n71Iw/0JqiHpx62RbYbNYi+YvWosfIQQMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K8nbjL5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpBU+J24; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K8nbjL5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpBU+J24"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJAua03353853
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 01:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQpcDrWvWGuGEEGm5cPAadKFMEAEj3hk/I/dFPvJL+o=; b=K8nbjL5BaLTF6Pvz
	XwttAHkLtTP9/R6MUyUVRbMUqI9oLJGztQqiXx443lhr7THY1g9pHs5IduJdJeND
	mCq6WDnj0wRnAQNL8s+1CpTXFC+g0qdlEW5j4jKqbQtrJ5nOnOPLnTcdah/LAqgO
	OQWPwThyNHkNKkB+uM9mtx5/gU6lH7Y41FTYpW2/pr6Purna6lVKjdfrPEOar8hs
	u32Qgo2yLwT7MKgSNJqPZn6Hm8/kRHU3NIq8gRgq7efcdWgpbFAJ5ScbD0tfN5po
	5SfNQiSZ/Gk54wAZSYJjZaCQxuqCQRpbuOiQ61OI0HKI66F+LS4wF9m/TENu/iiZ
	AsZsgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u795mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 01:12:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ceab125so2567901cf.1
        for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 17:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766020346; x=1766625146; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cQpcDrWvWGuGEEGm5cPAadKFMEAEj3hk/I/dFPvJL+o=;
        b=BpBU+J24VOge4/nyhWwszRQKbZrmOe0SYLyreEtlRrad6Sf35+fcC0FueS+TjWK9IT
         m7KgcG3KOcT+aZh5CT/9qNaRl4Xc/TKre4yaAbfqplSEvjSk/LFc9pre+NmVdO143568
         fGdTvRkvOFVzewXNpCHDfceX6oKDLAkg3Ii5nM4u4squQGVZ495BZfjdMN4XhfG7V1u5
         YCtdvexwpmPKrLS15H2iXNuoWFjqlPsNdBEYKwzBayd7j94wZynZZE1XbhqLoBC+r2Xl
         KHdKzp1eWoDszsFWWqtvQBWgrbRRqbYXIfSJRmKUKuqrRx0RxFM7ppcrzjU1L8oQI4cj
         g87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766020346; x=1766625146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQpcDrWvWGuGEEGm5cPAadKFMEAEj3hk/I/dFPvJL+o=;
        b=I3pxkSUqKarttD5+tEQZbtKguUthQH2w3qZg+gY8Fl3D6xBK4XGf12tzcNmWqyTBmv
         UPmeLbJ6xQ4lQbqXWmSXs9jXOQFHcNXTy0tDMoHrFlF4HTJ1IvqyZO7HsDVI/AiRe1b6
         8jfzf9CZdB5T/AvRuAmGT/AvnPFITFvw07bmFaQrkbMVp5P+bKMcMJ4mNQSseXwWjDjD
         V0X0Kn/e0RR2rrLHbMW/weXfaEnqKh2IYFLQKFUXN2cqvGpJ6IBxQD/5rLdX3/vO8C1g
         U/ugduXLeRQEKFv3fqQbkCu+im7pEGv71q0WeSPnK2xduaUmHsvnx1MVDIwtG0166Lwd
         yj9w==
X-Forwarded-Encrypted: i=1; AJvYcCVU6IKA4i8PyQCGt1uTwyN3cuElP3NwAAExtZ7b/mFReYXK4ufJdLI8eDjegWCXz/Y38LQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtp+PSaXpsiAaqHcntxf09e9/ShifdwNqYWXvfoXreWQ5YVKTx
	i+j+ymLfD06Bm/MCcX7K5QfDoix9ZJyppBFT4gyoFf5qMevhieEnVCcssq68aHxaYELFDKmsNkN
	+SLOkZ8fDi0OdsOskoG5yYVpIuuxtMLV4vQCbMHOtFHygLiXLcbKzICA=
X-Gm-Gg: AY/fxX7iwPuWqBXCx+MMKtu+Xrc40smYGuaAxdiMZLwyiYEWg1xn2l14sblYEdc2nqe
	fhquQYyX4sC42hMbY7IGjbdPXycXjwkUAjXU6RDvg9GYL6bZyOVx18pdU1q4oxMKBBDuT7H74oq
	trnnORRNWUhyWzeWizONZFMFQY9TQJKXfYy6tFBJzN803an0ISD1+U4RVtQghVHn5iBvqUT/AGR
	h+TpNWET8KVPLksPEOOm5y7RZQM4PzsgbdGmW6cPkXlj2ORbVShSWWvPDWWYwSvun/KxMirHfbg
	6Q7SVzbdX6abarrYRQrdqwXK1+wE36BXpvEeaiCCcsUlvFQ35527GA8aW4OiDxWLyrfP8BHce0r
	tX4v87H5fnQ2qW291zVvOci3ZEZLDaPLhh/vv7y1vOsHw/Kx7aGreLtKm+6+AzY5HcuI6l51hzk
	uXNzXquDVwwubgBk+tlYYnRQs=
X-Received: by 2002:a05:622a:1b9f:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f1d059d2d6mr275458711cf.52.1766020346352;
        Wed, 17 Dec 2025 17:12:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHojaV5KkWTCATeCWAuTEmXYbTlomD6gCquL7HOFNZEfq+N9uEgyZmbPbOPEKInOA4ewBCR5A==
X-Received: by 2002:a05:622a:1b9f:b0:4ee:1f09:4c35 with SMTP id d75a77b69052e-4f1d059d2d6mr275458431cf.52.1766020345909;
        Wed, 17 Dec 2025 17:12:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a13506cdcsm394406e87.92.2025.12.17.17.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:12:25 -0800 (PST)
Date: Thu, 18 Dec 2025 03:12:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <6276nut6ro5xh2pt734k4z2z3lpxmkffjjh6wwpvwuy2lldowc@soojtr77xe4z>
References: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-GUID: ps_FLG5b2lUwV8JzCL-B0aHDzridKvTr
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=694354fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lSwTuEAEjFTJ6uFEpMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ps_FLG5b2lUwV8JzCL-B0aHDzridKvTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX9IkTWYFmNEJl
 Tc+L41Q0I8BjnqD8EWLWdkxHZOKDpK36xbRNJXWGWeb9/2TK3k3tDXqFVgjSOBdTyqasM6uwwrl
 m5f7Dx9ZGh9psqsPwZg8NFN/uhNB1ECcAgpPQtsUxA52e05ihSVfgonPN6/qY+YEUldh/iwOj4e
 X5pJftOGoagzcQh1cChqsJ25w38P7ZtbrCma7eXoryj8FjmmD7ZKkt/MNywinRSWri6/a/i/gce
 MBv9EMEhIzQjr5DtXLKowf/z/yWjpL8BF1wWsXhDvCt84S3mZu6PSRp76vrFEPqd4JMSOnOMe3h
 K1LK80Re7uB8ucsUnpoMOk4AX2WKeUhqHvrIyYCBFijVGW2zkLl8zU9dar0LpOXpYB0GaKMdmNT
 VRH3680hHzBL1lyi3B0y8iKdgQMhNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180007

On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > > > 
> > > > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > > > authentication requirement.
> > > > > > > > > > > > 
> > > > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > > > 
> > > > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > > > headers in a single binary:
> > > > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > > > 
> > > > > > > > > > > > Download behavior:
> > > > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > > > 
> > > > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > > > 
> > > > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > > > 
> > > > > > > > > > > What is standard about it?
> > > > > > > > > > 
> > > > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > > > header and WLAN FW segment.
> > > > > > > > > > 
> > > > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > > > tme_supported_image?
> > > > > > > > > 
> > > > > > > > > Just elf_image?
> > > > > > > > 
> > > > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > > > contains elf header.
> > > > > > > 
> > > > > > > upload_elf_image?
> > > > > > > 
> > > > > > 
> > > > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > > used previously.
> > > > > 
> > > > > What kind of ELF image was used previously? Could you please explain
> > > > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > > 
> > > > 
> > > > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > that was a non-standard ELF image and the new one is going to be spec
> > > > conformant.
> > > >
> > > Previous image format:
> > > ELF header + SBL segments + WLAN FW segments
> > > 
> > > The TME-L supported image format:
> > > First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > 
> > What is the Second ELF header in this context? ELF files usually have
> > only one header. Are we repeating the same ELF header or is some kind of
> > an embedded ELF-in-ELF.
> 
> The "Second ELF header" refers to a separate, complete ELF file embedded
> within the FBC image, not a duplicate header. The TME-L supported format
> contains:
> 
> FBC Image Structure:
> ┌─────────────────────────────────────┐
> │  Complete ELF File #1 (SBL)        │
> │  ┌─────────────────────────────┐   │
> │  │ ELF Header                  │   │ ← First ELF header
> │  │ Program Headers             │   │
> │  │ SBL Segments                │   │
> │  └─────────────────────────────┘   │
> ├─────────────────────────────────────┤
> │  Complete ELF File #2 (WLAN FW)    │
> │  ┌─────────────────────────────┐   │
> │  │ ELF Header                  │   │ ← Second ELF header
> │  │ Program Headers             │   │
> │  │ WLAN FW Segments            │   │
> │  └─────────────────────────────┘   │
> └─────────────────────────────────────┘

okay. This should have been at the beginning of the thread.

So, if I understand correclty, beforehand WLAN was a raw data and now
it's wrapped in ELF file. If I'm correct, then this might be a
definitive name - .raw_wlan_data or .elf_wrapped_wlan_data (up to you).

Or is it that previously you were skipping the ELF header and just
sending the subset of the contents of the included ELF file?


> > 
> > > 
> > > As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > 
> > pointer?
> 
> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> ELF excutable file, I can not point out a specfic sentence or phase that
> tell us the previous image format is standard. But at least there is an
> example we can refer to: Figure A-4. Executable File Example. And I can
> also use readelf cmd to parse the image.
> 
> > 
> > > is also standard elf image. But it doesn't meet the requirement of TME-L
> > > because we need separate elf header for SBL and WL FW for TME-L
> > > authentication.
> > > 
> > > So the commit message stating "Currently, the FBC image is a non-standard
> > > ELF file that contains a single ELF header, followed by segments for SBL,
> > > and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > 
> > > Can we avoid saying anything about standard in commit message? Flags eg.
> > > separate_elf_header and tme_supported_image are more accurate.
> > 
> > Please define, what is the supported image.
> 
> The supported image refers to an image format that TME-L can authenticate.
> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> TME-L.
> 
> - Qiang Yu
> > 
> > > 
> > > - Qiang Yu
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
