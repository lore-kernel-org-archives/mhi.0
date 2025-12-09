Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4EF2F12D3
	for <mhi@lists.linux.dev>; Tue,  9 Dec 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321039; cv=none; b=Oj0N0dxL6XbbQv3hiWdDdH/FQli8blZZiruYvgmmTWKpa7Z0cYyONVEsI/wOgTGWFSY6AeztCMmTv1vtwwth1Cwhg9c98cOJ9wfmCVX9L2VGTja56/J5fhFKw+EJkOzlfhN9FaI+8IAwFwLK7m9FN6tYH0xP+lmpQo4+qD4DVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321039; c=relaxed/simple;
	bh=tUrAhEfuvOGitKxqW7+VuuLs16VhU2OeQDiwz0C2xWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/S1rKvVjEh4SpvMOQEFiAJAkPZ9khJ2VsOrFA8o4HTaW+kVc9j1iSbcYI5xmDS080iYrvdU5O4WhDBdjwddC8FG/69vFkGQzuhCbpwUUmB/Pw/0YcocLM0Gqexw09aM24mg0X+UZeDCZ40AkHnLHsI6B9JwPE++z/k4GenScw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTnYlmAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsiHCJzv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTnYlmAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsiHCJzv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MluoR1228538
	for <mhi@lists.linux.dev>; Tue, 9 Dec 2025 22:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gTi/HbaSCDQj+It6YM8JvIu5
	/JY9GRNhF6nMiaOmeo0=; b=gTnYlmAHtZYxbRci7EUx1kuA9agVZbaTMIQbp9c8
	cuIv12XfrFG2lL3FkYwFldjyTkHMVKY+mNG+WVXgJ5FCmIImN0gAtmf9kP4UZPfu
	rA77x+OkWXIX2K123qCMrmIS4kEVsqxQSNmWaIAMm8osUcymBUULFNEK+ty9y6xd
	PcSYPg2Wai3q4jZr0kUmE7ZwbSWeeVZuAId1dhn6ayM22CG/H8TfyKQ6u0YchM+q
	jaNdNcvMnCASWgSSIMFvlIPT+8BWFUfat2s55APwxhwRP/C/euHf1R453pyFjD0F
	IPiwwZX00VU3xK7k14YAtcTIQ/NxyKz90qF1LMiV78GWfw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9c9v5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 22:57:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559836d04dfso256670e0c.0
        for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 14:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321035; x=1765925835; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gTi/HbaSCDQj+It6YM8JvIu5/JY9GRNhF6nMiaOmeo0=;
        b=ZsiHCJzvXywQW4f+Wj7bAlP4YU4acfhBDC8Gf5aNFAiFmK410/9PgmZ4mt28N3Jy44
         OE3dPOjNFvQIcID/32laEe6XL1/aJ/RuCWjQ3GihamV5xScd9QZ6b3cQNGeW06FXpkGO
         IHy0DsyuZgExECKlN8ujKqcWjA3W2KkWpsrayAJ/Lyk/CXpA6zQidL+P3xWGI9P6YVXp
         nAkSIO/eM0hpKXeIWBDGi4EaToc6mBkRaIqpo+aFwWNw60fJ02TLmGDdlG+VTPQbTi+2
         z02YT5cOVbJn+Hlk9jrRiGlLQhTy6hV9ZSq/+AaCaNzitrJZzT8IcgkwYH7h4rfhlfem
         eLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321035; x=1765925835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTi/HbaSCDQj+It6YM8JvIu5/JY9GRNhF6nMiaOmeo0=;
        b=mx1psdaQ3uDZkmsczxaIpLOnDGamGmMiOV89cgkFvogr98JTy7kIfjCUBBm3K5cqIo
         IwSbWj5XCTO9cv1tRR2a2xdegfP7fFUPLdFrQymSm5sPiFqXvBNlU1kJzmw68e8+Qcrq
         qWn3zivda2uGjwPhK6CTrfViMCG+QlgLq2HsMTB8b+qb8fb/3Zl9fM+ixGOJm38nXQmI
         DaCdgHiBbAH8LcXKXx5b+rv8R9RzoSBT1qbKovaVCFPuYl1Gy61xWjnjCiWT82LJDF/g
         MZVf1aPNpHlAtPPtmIxCWZG43vA9j2eftH3ztGYvNaVG8AjQDS8nEi/FjV1HIPMZblVp
         V87w==
X-Forwarded-Encrypted: i=1; AJvYcCWdM+x9TQCV1FNqeW7EsqdjciNSGBhHK0LqQpwPZri1cShTSdzDckAV9FX6iRcdEPvq41I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwKZiJN0QjLVqRVkRTfmBo/66htp5nY1HqQhJhdz02/HNmqj1n
	G5WsAf6+XMiMtOQkLJgd1gwUvE//0+9zKjTbV+FSEvrO9wwU78MZplxiz+yRUPopdC9CCNMaeBT
	a/Ku5UnxXAs0PQ0zDH+0jX5WfvZEkYpQL2bqlUhSZvc5aYMo9M8FHeJeqxkxEF4A=
X-Gm-Gg: ASbGncsKeTgTSapE+CyttNqgWfQVm+LiyBg24ru2YTY0dySoiqK6DcwPvPsoBfQZhr5
	zgU7mAjEV34Acyhvk+G6tMvUNKojIDYbe5U0ZiDDWnMLW6DtTZdyiKxAHEUrJKjY5q79WBSIONu
	JP+oVvJtJWHmXzCczt28dl0aXp05jx69sKnVpVqzSCYXG49TidasDV/qr6KDcC1fWNcCBFE2fdT
	XPqJCZSUAKlUulSaVJL+eoKik9B7wA0R2OuYDSwKvE9VHqDJvv9cv1Tu1DtpmSMd7VKs01wvhfh
	QFZr6QD2p7PgjgQplvjL0RSLCnqt1cobXPt3BGEWdQ0CR9DL9GWsIssejZGaatCZU1htvlOh+0Z
	mW4V6dmoQRtVt4iRZrM2a8fSXva7bKsMpYJ3SFczqr195Yuj61RnRQr7m737WELiy6cNo+A3YEy
	tF69InlPJVoqqDKffcHmtYCOo=
X-Received: by 2002:a05:6122:3c55:b0:55a:63c3:f7a7 with SMTP id 71dfb90a1353d-55fcfc39eacmr201368e0c.14.1765321035516;
        Tue, 09 Dec 2025 14:57:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLTue9KfSafrxEqopdfH8AlXZLzdETcu8UBWka+tZ7aCoHmVYLikkj85I8jL+d9/bZQCLcKw==
X-Received: by 2002:a05:6122:3c55:b0:55a:63c3:f7a7 with SMTP id 71dfb90a1353d-55fcfc39eacmr201363e0c.14.1765321034952;
        Tue, 09 Dec 2025 14:57:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e7065591dsm50287651fa.43.2025.12.09.14.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:57:13 -0800 (PST)
Date: Wed, 10 Dec 2025 00:57:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MCBTYWx0ZWRfX6SSLUyDCZAql
 sTZZKfrj4FnNt1I2eR0pH42rmf7LV1UIPJIPhSTNFVSWQIUhIGdIXCQCtaoWf39Hvver99jyonW
 mv8IIQ7cefTqfzmuFGO2v66n7GoIolvykUO1sDD8MtXsTAR37Tl0H4wDplUE2eQitgwFqBW9RS6
 vn/ZQyVozjHRx64UKSPY3GD0k9l2PUzsZ9hyuuF58FoTzosSZtmCZecQrgW4UiRNlwgBFEEcAQ8
 c7nZ70WvqyXPLMkj4XK2OfagNw4g+S21OfFnHE89gPOu8SaEuHusXt+FGWcoeCDclc0QTVScEke
 YKNGGar5fFpt/IbiLy0Tz41Dq0OLLchMhIOCHjm0i5ehJND2i4tunVKQrEzYQfWIGw4S02J6E9r
 kTPVjSnOQ9VOZdA29SX9YUobVWWXFA==
X-Proofpoint-ORIG-GUID: Oupc2UXNb5SZNqsl1UifuNX_Cq0_4vCW
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=6938a94c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=JRxmXwspk78XPmVcSsIA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Oupc2UXNb5SZNqsl1UifuNX_Cq0_4vCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090180

On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > 
> > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > authentication requirement.
> > > 
> > > Current image format contains two sections in a single binary:
> > > - First 512KB: ELF header + SBL segments
> > > - Remaining: WLAN FW segments
> > > 
> > > The TME-L supported image format contains two sections with two elf
> > > headers in a single binary:
> > > - First 512KB: First ELF header + SBL segments
> > > - Remaining: Second ELF header + WLAN FW segments
> > > 
> > > Download behavior:
> > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > >           2. Full image via BHIe
> > > 
> > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > 
> > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > download over BHIe as it is loaded in BHI phase.
> > 
> > What is standard about it?
> 
> The TME-L requires standard elf image format which includes single EFL
> header and WLAN FW segment.
> 
> The "standard_elf_image" seems misleading. Since the new image format is
> required for TME-L image authentication, how about using 
> tme_supported_image?

Just elf_image?

> 
> > 
> > > 
> > > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > ---
> > > Changes in v3:
> > > - Reword commit message.
> > > - Reword comments of standard_elf_image flag
> > > - Add reviewed-by tag.
> > > - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> > > 
> > > Changes in v2:
> > > - V1 patch is paused because of no user. WLAN team plan to add support for
> > >   new WLAN chip that requires this patch, so send v2.
> > > - Change author and SOB with new mail address.
> > > - Reword commit message.
> > > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > > ---
> > >  drivers/bus/mhi/host/boot.c | 7 +++++++
> > >  include/linux/mhi.h         | 4 ++++
> > >  2 files changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
> > > --- a/drivers/bus/mhi/host/boot.c
> > > +++ b/drivers/bus/mhi/host/boot.c
> > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > >  	 * device transitioning into MHI READY state
> > >  	 */
> > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > +		if (mhi_cntrl->standard_elf_image) {
> > > +			fw_data += mhi_cntrl->sbl_size;
> > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > +		}
> > > +
> > >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> > >  		if (ret) {
> > >  			release_firmware(firmware);
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -360,6 +360,9 @@ struct mhi_controller_config {
> > >   * @bounce_buf: Use of bounce buffer
> > >   * @fbc_download: MHI host needs to do complete image transfer (optional)
> > >   * @wake_set: Device wakeup set flag
> > > + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> > > + *                      image need to be skipped when loading WLAN FW over
> > > + *                      BHIe interface (optional)
> > 
> > How does the description correlate to the name of the flag?
> 
> The description can be updated as:
> 
>  * @tme_supported_image: Flag indicating FBC image format supports TME-L
>  *                      (Trust Management Engine Lite) authentication.
>  *                      When set, skip first 512KB when loading WLAN FW
>  *                      over BHIe interface (optional)
> > 
> > >   * @irq_flags: irq flags passed to request_irq (optional)
> > >   * @mru: the default MRU for the MHI device
> > >   *
> > > @@ -445,6 +448,7 @@ struct mhi_controller {
> > >  	bool bounce_buf;
> > >  	bool fbc_download;
> > >  	bool wake_set;
> > > +	bool standard_elf_image;
> > 
> > This flag is never set, making it a dead API. If there are other patches
> > setting up the flag, please include them into them in the same series.
> 
> Let me discuss with Baochen about whether he can include the patch in his
> series that actually sets this flag for QCC2072 device.

Otherwise it's a dead API which is generally not allowed.

> 
> - Qiang Yu
> > 
> > >  	unsigned long irq_flags;
> > >  	u32 mru;
> > >  };
> > > 
> > > ---
> > > base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> > > change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> > > 
> > > Best regards,
> > > -- 
> > > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
