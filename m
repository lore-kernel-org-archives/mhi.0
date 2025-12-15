Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7B18C02E
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824099; cv=none; b=LAohRpvx194AQatKFsXIN5d7qORktU5Jhl/kKEeWXfh2XxyW1WDTOArWCcaLqwO8mbZbv2PR7pYE9/6x9d8sgHNGpv75iIpEyd5upaS0XfKI8oM1Clz6/sfxP7hAuwImg64xE7vLADPQE52K85aH/SDB6OekaYFPxUF6nbL38Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824099; c=relaxed/simple;
	bh=OnQEYOmrkAYIJx4r/S6mafxdFYSSWUV0jdT9M9qY+/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+GaXTZ1VhEACb+2XqwPAXGHvKewJzWEoL3NPpAxhmY9bWgz8ctRZnwWFE2a8yD3TAqt91JSjfFKe396lV0b/yOccM1JGDsJY2GJZRcTXmq17bwKK7Qq0VXfTKCTDS9oSG17UGd2S0wcp4zGek4elzulscBOYz3CbqG+lZ6WUfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaD8om7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knVjkstq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaD8om7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knVjkstq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFI0NBf1682298
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 18:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pNEJUMGRY+3vQEybSGpQ4Gzk
	ywOIMauWbmtCCqmv+r4=; b=PaD8om7vXM1qWDymFOpc28CGyqhXVHxBnnrW/u1W
	TTHnNlWA0uS4nhVV7wcAZFPE0RQCIjsXaK/brRDgh+LTH7N/x6aozO60/r3I+L7E
	z264PNY2aW6KEE/FL+/7fhS4GMQ9xY60nP6yUyuJJnBvouEfC5WYiPk1JB01NFo8
	evMLH78VPRulaEqlEQ3lhQv0ySnqclSeVJnk5qbxLAwjrHtn4Gap0vBzmfOcPkm3
	rikMfMaiZp7afH4WzjS2fzbjS526mraAGyVOYN7iKWFl3tup+5k4eS1EBdabdpKF
	yUsAC2jy1EeUczMK70NLzq3zoyknTWAvujNDtniGCh8qiA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2q7tg3je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 18:41:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso144603021cf.2
        for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765824096; x=1766428896; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNEJUMGRY+3vQEybSGpQ4GzkywOIMauWbmtCCqmv+r4=;
        b=knVjkstqPAN8ID1rt/uEk8sDg04ebYak+E/LHLdXCfwn7Fge5IcchJt9aub/x4fH/h
         zH/nK4AiVFEYlYvKw8KMjDeFlpb7mHHzvpeej7+WW/1Lf2s2DdmmsYLB02aegLdEysLU
         jnaQDtfkB7unnqJHmXvGVOhHoXFt5aFOnImFdQ7sfvkSBXJ3FTiNMG3OVFMUevNbIunT
         9HU+ce86+0uSKtaXjjw0WEqbQNBYOFveoczPDqziRDFIcWfhYlW/LoyKkArbqJSb0Gss
         X5MTvDmrJMQl23mOSH2pT5ZEzZZUkJIaci50vIoK6ROKCrOs6oed4zePTHzQxGaDAe+J
         THbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765824096; x=1766428896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNEJUMGRY+3vQEybSGpQ4GzkywOIMauWbmtCCqmv+r4=;
        b=denUxcykE0WXCYYO/xaZY9VfO1SoNIA8cx/fVwR6prgaXukJ8dkgbt1Yqze7OnU3ae
         cs2PUuaIuX2gNvaxW6F60QGL686IYvaAZIDtIzyHhNPxNiHdHlfFHX1a4GOkVJkeMOXz
         aIx7HxDAp6pTf+LYmRE8LpKSQ0ym3mSErx6RsXQeA2q4L10Ma2cZ4k/ZqrzyvhvtLiba
         V6Ar5lbzfYAtO66bCJn74vTdjQCbQTVI+te0b7uyML121BDrzOdmvrPWerCZW+7AaIjB
         YRw12MAPj28QIXYq/6APASXrZJ0uV+zsUcVuX0mV2Phaj9AqvdGOZoBb8BJwWnH8gVj/
         AwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrPbpmmEGEUvx2SZzgtBkemnCYEhU6NbpPQf0fXD/NHKcuBcppq4elEOf72TVvnlE9umA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQZl/td2RebpdfRBGfQ5/NmRRk+79xfID0Q1R11mxZUOPlDwvl
	a32AeeJ94Z9Kopq/RCURBUR9Y654+SY+sfPR6PtCInirH/G6M99+/F63Sw/GHbPCqMrdnBfZsdX
	CQxDagdJfbeH/fECJZVG08+CuP1wgiLNH7S2fv2tM6PHuhHIR+zmTY3M=
X-Gm-Gg: AY/fxX5BNP3DWfBszyBnZFmXX1pQWYzMSpW+3CamxdvQAc6aDTTPeqQjNQqZ5JyUxua
	cRADTrhLycW4fi/dscaaUEJZbmWeIuMyX9X8GjBwV50JDtj1p4iNclU4CvIXfuVVCsNglRLo5Lj
	noX+yc1qkTPudIXOcJNSvqzQUyc1OgR5NJ/kar9tiuVzfQGS3CaDigRfdiQMvaT4I+sVIyaPhfb
	z5sUqFf6rF2fBgY0/BpvP4/UfmDVnf6FfpXAflMlukZyPsFYYrrmjwvjdRv+DGjX6Ggxc/tOFCY
	wX9mTjEYCsHl2uQPlzIKQrPHxFWFsQnHRujrBDOsTY8xQoVJAFbN9FLga6vADm2Y7t0ZJ0nDqfN
	RhWudfJZMWBTuv9uDdt1H9r03fTvZBWTrawUcbIYgBS/r9I8hnbFe2q0eQdFOStrQPCow4wGP8C
	B7RbmiikU3EQzMeL2yVS5hhfM=
X-Received: by 2002:ac8:7f88:0:b0:4ec:f156:883d with SMTP id d75a77b69052e-4f1d05a7f79mr154991371cf.43.1765824095726;
        Mon, 15 Dec 2025 10:41:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAJgHuhNdLAt/gPPl4X5ZBBDYldHvbw1d8BwxWkgZDQVIbgX1pv/raya4y8NzSNm1vVd9i8g==
X-Received: by 2002:ac8:7f88:0:b0:4ec:f156:883d with SMTP id d75a77b69052e-4f1d05a7f79mr154991081cf.43.1765824095247;
        Mon, 15 Dec 2025 10:41:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da5f6cfsm30311e87.85.2025.12.15.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 10:41:34 -0800 (PST)
Date: Mon, 15 Dec 2025 20:41:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
 <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
 <be72nummuhhqh3oiid7fx2amzaolgdsyfr2q2guzh27kyv5nes@x4a25lsvclio>
 <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-GUID: tug9mEgsnbheyfClFrIhHLDT3ie5zWt1
X-Proofpoint-ORIG-GUID: tug9mEgsnbheyfClFrIhHLDT3ie5zWt1
X-Authority-Analysis: v=2.4 cv=Qo1THFyd c=1 sm=1 tr=0 ts=69405660 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=g5dMWhOOQPDu3jAcnNsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE2MiBTYWx0ZWRfX9m9Whthd9+dg
 4mfHggd4MRMSzEg2/CpMsG2q70v3duRMRxacJ+yIf6PonkmYAe/QOMs7F8OlxzhuzzjDyUWG0+I
 X+cnMJRx3YYV2jLHI7QXqI/Yo3Fz2hRlmEUc0YcUrE4zyOdbTbzPsYNmWeHw3sPkU6VzWCWdCAB
 EfRB5vw8ssd4NwkHZYYSeGoYb5OP7QpY2fc0dLUXsyf5hyhRhrSTPBMpZblp3wM/HkxXlJ6udU1
 Va2eTMVhGBEJJluM9ic/0nJlZn8V4tw8+BEDuWAAAr3Lmz8mPCyHhs8WpNNTESiHHGY70oZZ2o5
 RjiMhIWjriH8CxrmZFr4hYYWQpAAUNKGDOugLR9XoRmCuPy57TRcRPLqzLlPVvwwhqDJ/DQYg6f
 9HKSQETzrMWlBInMn5VBhefHQ3o7EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150162

On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > > On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > > > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > > > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > > > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > > > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > > > > > > 
> > > > > > > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > > > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > > > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > > > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > > > > > > authentication requirement.
> > > > > > > > > > 
> > > > > > > > > > Current image format contains two sections in a single binary:
> > > > > > > > > > - First 512KB: ELF header + SBL segments
> > > > > > > > > > - Remaining: WLAN FW segments
> > > > > > > > > > 
> > > > > > > > > > The TME-L supported image format contains two sections with two elf
> > > > > > > > > > headers in a single binary:
> > > > > > > > > > - First 512KB: First ELF header + SBL segments
> > > > > > > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > > > > > > 
> > > > > > > > > > Download behavior:
> > > > > > > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > > > > > >           2. Full image via BHIe
> > > > > > > > > > 
> > > > > > > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > > > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > > > > > > 
> > > > > > > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > > > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > > > > > > download over BHIe as it is loaded in BHI phase.
> > > > > > > > > 
> > > > > > > > > What is standard about it?
> > > > > > > > 
> > > > > > > > The TME-L requires standard elf image format which includes single EFL
> > > > > > > > header and WLAN FW segment.
> > > > > > > > 
> > > > > > > > The "standard_elf_image" seems misleading. Since the new image format is
> > > > > > > > required for TME-L image authentication, how about using 
> > > > > > > > tme_supported_image?
> > > > > > > 
> > > > > > > Just elf_image?
> > > > > > 
> > > > > > Is it too generic for this specific use case. Current image format also
> > > > > > contains elf header.
> > > > > 
> > > > > upload_elf_image?
> > > > > 
> > > > 
> > > > Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > used previously.
> > > 
> > > What kind of ELF image was used previously? Could you please explain
> > > what do 'First ELF header' vs 'Second ELF header' mean here?
> > > 
> > 
> > I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > that was a non-standard ELF image and the new one is going to be spec
> > conformant.
> >
> Previous image format:
> ELF header + SBL segments + WLAN FW segments
> 
> The TME-L supported image format:
> First ELF header + SBL segments + Second ELF header + WLAN FW segments

What is the Second ELF header in this context? ELF files usually have
only one header. Are we repeating the same ELF header or is some kind of
an embedded ELF-in-ELF.

> 
> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format

pointer?

> is also standard elf image. But it doesn't meet the requirement of TME-L
> because we need separate elf header for SBL and WL FW for TME-L
> authentication.
> 
> So the commit message stating "Currently, the FBC image is a non-standard
> ELF file that contains a single ELF header, followed by segments for SBL,
> and WLAN FW" is not correct and standard_elf_image is not accurate.
> 
> Can we avoid saying anything about standard in commit message? Flags eg.
> separate_elf_header and tme_supported_image are more accurate.

Please define, what is the supported image.

> 
> - Qiang Yu

-- 
With best wishes
Dmitry
