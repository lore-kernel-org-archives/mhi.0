Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438252F6184
	for <mhi@lists.linux.dev>; Fri, 12 Dec 2025 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567452; cv=none; b=hdGKLV995752jW1ZeaoPfpoUs1rW+eQCcVfEaRMByO/tf6EC+H6J0JePAFWSOK+NUZdBPuY+TEzLmhDNLJp1Ga34Jx3rBdcl7AA99pSV+Cfc972fFJAP+4bHOIxMRzPA+Nlh7O953ssnEbPCIAbD5hIcwldVXUBwwRaaVkxan6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567452; c=relaxed/simple;
	bh=JG1eh83VUAe7ybg++FT/8uvvYfh/CW0gtMmTomvJSzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WosEeoKPlt/3nAWk4VBVjXAzFD4wTJ8B3EU633vZpypKa4q/IZAjYl37unpWlf3H07EInhaAxTCzMcLHsve7Yq5VBHMwONRFfijd37d62q8uW3cRceUG59ApK/Vdgm5Ap1NvvRvtVUQeLDmqXtIp1d9zgVnpyQgSyuBnkvaow04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/32L1dH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Spu1HkI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/32L1dH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Spu1HkI3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC68fJl3660854
	for <mhi@lists.linux.dev>; Fri, 12 Dec 2025 19:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vBp4N59DWuvcPKDmqy9j4p8p
	DX+N9x/9WBdOnhLgvWE=; b=D/32L1dH4m9neKbw5f6ssy5tTOCuY0cWPnr8yTMe
	1Ad4JtI6oQQAdozrv2N5FxIyvDw7zWC28hsrsadWbObiZZdn/C/p2O+1u/bs+d+Z
	V6O1pq7euHAWFEbV40u+3igDlFZVDU04Hus5L0KSXAaN7aA2QMBxj8jwq4ymQ6io
	mGILGhrUITHEQEF1KLVMZw7xXyNL93+2eHR7YSUSWLmmT+3JD7dKThpEhYDTi/Sv
	LtmmOkxeaYRaWYoQGeclxW26yEMIhh+jFy40XHznHRhrECuxMe4utqXSu9KbWVQr
	oFPVfFvaxgJ5laBoQiEVbrthVBGi8J/4/NmZBtguMQt1ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0dh6sknf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 12 Dec 2025 19:24:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e2342803so362317085a.3
        for <mhi@lists.linux.dev>; Fri, 12 Dec 2025 11:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765567449; x=1766172249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vBp4N59DWuvcPKDmqy9j4p8pDX+N9x/9WBdOnhLgvWE=;
        b=Spu1HkI3IfcLWuws2fZsVJjbGbJyPtzbW3sVLtn9VZKmXQJreKLbJwm+2I3DZVosis
         cgW1swDVIjudz/kQp8HT7kfho5TRmEL7aABMaMvTyaSXrMWSnjjGdsbEuT6YjtdHlVfr
         8JLUDzI8cLmAgNevOAoIju5u/OgluYO2u1hCjwTiwxOGcp7fdcA5Tfp92LtgLOigEhqY
         mc7W0rWB/c1Qi+4v4QdAoWX9R3zB4gExkTO7McguA4xTla5xC/u5Trp9NkOZNvkfeays
         pnJQ0ifLxAjrppCROVellxSrb6tGEbmcs+L2bcflFTFiP/5PKxOvtemCeFlY8anVve3M
         psyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765567449; x=1766172249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBp4N59DWuvcPKDmqy9j4p8pDX+N9x/9WBdOnhLgvWE=;
        b=omHKxmQyAu0xVWK461Ibjk5fBZl1mGheNOSPffP7HjPXnIzkY9d2BOk4Nn6FZzRV2x
         geL2Q77HLNPRKJWoGgxZOVHwdsk4aYt4OiHFOV4Pk1ExUIxhW+OZxqe39i8Gy+Oa3HYY
         J1ZRsdcBhdRFxJ9B0Gl7XFmLGn+wsDtusRr1rQggtHPC2KG9f1/iTDBeuXSeS7Zt2Pq5
         lV8VWA6/zErsMTlWw3z1tkUQmbEdFE/8S0IImrJIyMG+ppXu8NCq+tbUmlI1Usn+KgIC
         jLoXoheHVnUrUj27j10jypM/ookQXD9qAGzxDPZ+IDjZbYLyNV007yTvvP4UNGd3At8L
         z6pA==
X-Forwarded-Encrypted: i=1; AJvYcCWLdwUxD4+MEthn8UEE+kunVEOa76T8vybWSX1Pg/Gol3BPvG2pcSeo5xRrZFUOesssdlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGP6sjWU43C2B6Ixz3U6KqxlhCOIKLAJ6QXfTc6jwi6MedVLkH
	/68kj0q4iF5VqQ6RpPPg5XounicQqyWDkYMi1ruU7fCnBQTmnAQhm52Lc65DKJzmx/Z94wESNDz
	Uw/fd8TzMmVthYB2xZFGM6hRvd9STUfMqfvZoNb+iTeBjHQgZ6ysO/Dw=
X-Gm-Gg: AY/fxX7UoGIMulUB0VNarT4xkkSKUb+Uy7UfJ/PTm4YGz5TO6ww6GPq1inkUkujJODq
	dTaXVp8avli0tBi+aDIoOhWGsQQ+Z+WmlWvtPvfmkUNYyZj2FYYNRWnsSL6Pvw1H4aZEIf3SwSp
	9YS+WBLzfMNj4gzxVolEmWhLH8ZMNudCsF+/1Pc2PUowv4ZMN527rgffjj9WXdQHVu6q0cFHvlS
	IDhw17MwDhj7MP163RnGZ3TNEXb0KaPbuLCgkpIZsMEZZoQaQidWxcxVWH7Cc00YjeDPX1LjPGM
	kUollwXeQPXUO4jUzc//k0seIigCOiLe1jWK/fxc+bRCrwp5Rey91ucbviUmGT30pbWUWUE7oP0
	mXI8pbawIKrmAT40gBEKhPR7pC3g/Gv4ew+mspJ9WAzObR6WzjKutp8j1PSj+CU5frnWGZjAfZ9
	8yAYF7GYn48ypXUsEbRCFW4F8=
X-Received: by 2002:ac8:58d2:0:b0:4ee:1527:cae0 with SMTP id d75a77b69052e-4f1d0048d32mr46128771cf.0.1765567449177;
        Fri, 12 Dec 2025 11:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTJjOdVOPhskva7CZnbnHt8qfv/aCr1BjJUJSHUdpDdO/WG88gAWBuhj+BZoTb59VZcIV75A==
X-Received: by 2002:ac8:58d2:0:b0:4ee:1527:cae0 with SMTP id d75a77b69052e-4f1d0048d32mr46128391cf.0.1765567448763;
        Fri, 12 Dec 2025 11:24:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f379dfsm2187122e87.9.2025.12.12.11.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 11:24:08 -0800 (PST)
Date: Fri, 12 Dec 2025 21:24:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
X-Authority-Analysis: v=2.4 cv=eZ0wvrEH c=1 sm=1 tr=0 ts=693c6bda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mAA5u-Xvzpc1fc_J9KQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nlpzQV1oKmg1RDECUtyLmomhcGfCdzP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDE1NSBTYWx0ZWRfX23/ohsvmzExZ
 zIK94iuwFy5oFPrGqWZnRXolJQ93mxJWpKPkz2g8peJ4m8+jnPpJu6rROchbjDOBCoJVQNInab2
 mH4Of5LgRIbCGw7J72fwfTkptcagraFrnK/wS9IyM1/AkENHNIBmDTQhD/NYK+mHi4SUxVJZ3/v
 xfPsr4q6QcMnFNNxm6wn10o1pOPiRR1C45UyGyCLNrCTU0gM67fzF69hjSMk0RZaX1gegaxJ+SL
 GC//o21Rw+3H47uyIryTfDaRflAdSS32V09t4ITZOVpYgA3LwaNoSGB+z5fEcIWPpFi8dNrd96I
 dwchjae1JCDNvsyFuTE89fNZIeGE9hWxqOqfVen0Je8/t2hnow3QHYp/YkSXPmZVeN/UC1Fde/q
 vNeWpPFtEyZowvHtAtHxORYiV+GIDg==
X-Proofpoint-ORIG-GUID: nlpzQV1oKmg1RDECUtyLmomhcGfCdzP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_05,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120155

On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > 
> > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > authentication requirement.
> > > > > > > 
> > > > > > > Current image format contains two sections in a single binary:
> > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > - Remaining: WLAN FW segments
> > > > > > > 
> > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > headers in a single binary:
> > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > 
> > > > > > > Download behavior:
> > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > >           2. Full image via BHIe
> > > > > > > 
> > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > 
> > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > 
> > > > > > What is standard about it?
> > > > > 
> > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > header and WLAN FW segment.
> > > > > 
> > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > required for TME-L image authentication, how about using 
> > > > > tme_supported_image?
> > > > 
> > > > Just elf_image?
> > > 
> > > Is it too generic for this specific use case. Current image format also
> > > contains elf header.
> > 
> > upload_elf_image?
> > 
> 
> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> defines that an ELF executable can have only one ELF header. So I'd prefer
> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> used previously.

What kind of ELF image was used previously? Could you please explain
what do 'First ELF header' vs 'Second ELF header' mean here?

-- 
With best wishes
Dmitry
