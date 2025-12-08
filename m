Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2301B326946
	for <mhi@lists.linux.dev>; Mon,  8 Dec 2025 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175736; cv=none; b=rFtvfIyoiWieFWPhtxiuqtr/bJ1brczhA9Gbkk0Z8GU5nH3I+BHvIxC5rDJn8ufuylSgrIlnomafczchboqgYe1BfbAfBGyUilpU5Vn0wMPapFKRg32/lCwRLEknSCxOQrkZbJ/Y6Vf6fXGH2kcYqr5BvEMow5/ebhOo3FGo/q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175736; c=relaxed/simple;
	bh=4aPqhsv8fgZ/nP6SNgBnA8yF1zLWWofBWCz9+Gi96kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/H15xPRyGRkA9iuREss6xEJZK0OfjAURjZP5Qwhzx6F/QWgYOdEE9hNtgUSINt7JaHwzkhqxklfH+7Y7MPp1U50+HqBm7Q9E1LUhctWuevovEmia8INnGevnK0VfABM96L0ly9sHCpwVmiU0PsR3+z1W+Jrm0QCBb/KLebjzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0RuuZZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAjTmWbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0RuuZZn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAjTmWbE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7Mwl013103839
	for <mhi@lists.linux.dev>; Mon, 8 Dec 2025 06:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sgY4r96KHSWlXrmYnq4CGYti
	rmFBKi7k5rnRPBiDo2c=; b=T0RuuZZnBZjAOsW4TsCeiWA4OhZOU9U7HUnxEMWE
	c1r/pQw9oamC6j0+0PpVdONHIK7r3AhmiQKNpA0bXRNXraEcyq78GFN8M4X+0un9
	BGEwctJrUulh/isTAHyk7WzDAy6M3EFmzDpgyw0hSk07lJ79NzbPEfoILhPpcbTl
	Y7mgb2ayfH42CErSApQoKKBjt9jzwwocgs2rKulIDPJLnP/7DiS/B1bgOAq3VeED
	57IoeoDKVDkuTPWh7VwtF3xVBVgHIMxZW0gtRFNz6W0KkFUkgotToeWQXqmsOFA7
	11PBDkpF0ppR3cK1doEW+smcOC1LdRX8RYVDMALcUMQaig==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e3ttk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 08 Dec 2025 06:35:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b62da7602a0so4296008a12.2
        for <mhi@lists.linux.dev>; Sun, 07 Dec 2025 22:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765175730; x=1765780530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgY4r96KHSWlXrmYnq4CGYtirmFBKi7k5rnRPBiDo2c=;
        b=aAjTmWbEGiOwmNrnjy6HkDdXwqM+9ZlZpmUS9YulJWSLWqvDSxOOKOuG+nndpp8369
         pO6m39eDCDEpmxkKobX7fiPOr+25TsqAqT7XMr4FnwrzO51LkwmEfsQAQhfwgJ2b53Ed
         UfTM8/WglYHo8AHMcbIZlrTE6c/eV7sH26j0Bvl7tFSyBYFZogmudsaqOD/ozI/bxxK3
         pT23JyS2trB+9m9R2QrIlSnhlJNzHZUesC6ATEGsvuuba2yDDfJTqJoRGJhQCfCL2mka
         UKhdUQofdKbkSaQKLptQGXWfGGsKa9kFdIgFV42Wtbi4WX8cmr2jxqwmww8AQ60GJ0Gl
         peiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765175730; x=1765780530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgY4r96KHSWlXrmYnq4CGYtirmFBKi7k5rnRPBiDo2c=;
        b=DBvHDvUv7HMw4gIrwqltYeGUcJM5s7Qia40LxozQ5Y/G5tLxweCpOqUqvshxD27JT6
         tP/jGf8fFmfXXgvYzX79TvH5hpVXKpMN0BSkDNuzhY5S1KUoWKYSm52CLqaB/65clTJ8
         9iHq9QZWJstwBsV05pyXtrQUb1uyYV+3tf9HHikV4SbB4kZOwFdhZy9Nabbk1csvPVEH
         DbI9kW0mmg+6nSN+mdphulC6uO4+r29otH7DGAhZFW2Dk9XJL740w9zjf9WiVy0lR0Rh
         JlEglApkw97SIb5UNuper7qzITvG259Kd3i05PFnxZ2ejBmxACBtJpzhE62643MFWDPV
         yy3g==
X-Forwarded-Encrypted: i=1; AJvYcCUKJcjEnNqeTY+0ujdrgGfO3wyjpSRStBxZ6fi228fMyJHynd+PA1oRcjYiMnV+0RwwHYk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3mELH8PBHHYLvazaf7+iUaHMocWdbQlxUwGywYXKwbkuKrEUA
	wPjDUpAdoMMvjztv7gYbsxhPh9sj9MtEmTqeww4il87Q1pO35e9TUE/jSeJhNOe89SqNbLweihP
	KPtvJFRxuwUnAFsGITSlVHBxecAkmJzldsQW2gFFxWVOCoBO1CtchHAc=
X-Gm-Gg: ASbGncuKLILGYHNIFzUp/JXwYBYkXbweijDq7JgXo7gQnHfPX3xlNyzoGS1rHAHp5bl
	khcafCoSmGBecbye7FYJ2RL1yNJPxHuTulifIZv5XXX77gPNcLTWwgDHPetSU4TRxZU90y19ePF
	UjXRlQwI0wu+u7ec5nSQJdYnUBFu+MLdzC3ulQ8Lxjm4ql5X8RmeLDSmlguzslyghczPEAqgJ2L
	+P/vfVuVqqGTyPSYs38JWA9SsqAObChBGhveeKLRqd4urMtQxarhBqFiWPAw/J9c+G2Kt4UECqz
	R15R9t2HzHAokn7UFYi7LG9Apq61BGtISq4lq5u8wVHhLpQU3owFbhOCr5espe0SbT4Izco+jRc
	REFUI0DnaWxGPyEfpF4C1qBFbQurQXLijagBc/XuUAy8m/TOkFkI4fFT5
X-Received: by 2002:a05:7301:fd0e:b0:2a7:769:ca03 with SMTP id 5a478bee46e88-2abc721bcafmr2677205eec.37.1765175729978;
        Sun, 07 Dec 2025 22:35:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJYV1colEXg1BO2zZejBrgIwZQQ8XKnZJznpGPugorXc4s98m8gCQwDF+wdRZqC53Cyq0hGw==
X-Received: by 2002:a05:7301:fd0e:b0:2a7:769:ca03 with SMTP id 5a478bee46e88-2abc721bcafmr2677196eec.37.1765175729318;
        Sun, 07 Dec 2025 22:35:29 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm33007217eec.3.2025.12.07.22.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 22:35:28 -0800 (PST)
Date: Sun, 7 Dec 2025 22:35:26 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1NCBTYWx0ZWRfX5T3N+gB9LsXY
 D74htpLbEGU4lDaO4iSkr3i94fpJEKgwGx1hQqDOu0BmvLr3Dvl2JRgaeAUeB/cJjW/jwrBQTis
 Kczk3DW1ocRx4H0oFyc1oEZXtNLkMYFnJCOib4zBZCjyWd7GnLSE2ZI6tyPV/f6pa9+XqWp9Rw9
 a0yvy1HmRRdPiimiEMZ9wXBFk3Fmk9tkCa4z1YoxuCPv7mSLPEwwabJCVExKnE5qI3UXxhicsg4
 dnyWn3mVQc2ZQuTEOOaUGfbIGeaNFhjNQ2HBc9TZ9hF3dz7xVe+6/rhiSGLXbka0D8oPXF2sz1M
 NkmyqZZ8oKLz83nV7Rt9FHe3k14imW2yrZtcQj9V3IJ/Su/5k/vgDhg2b/4DCXRfvzEQs7YjuCd
 /2tX9NAMlCNnLZgjrvCZMbptO3pRwA==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=693671b2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=zkLumzht3HFOWJu72j0A:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Mvqx0kx7NEgoFeL_fHdY5bfTEUZV8KIn
X-Proofpoint-ORIG-GUID: Mvqx0kx7NEgoFeL_fHdY5bfTEUZV8KIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080054

On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image is a non-standard ELF file that contains a single
> > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > authentication requirement.
> > 
> > Current image format contains two sections in a single binary:
> > - First 512KB: ELF header + SBL segments
> > - Remaining: WLAN FW segments
> > 
> > The TME-L supported image format contains two sections with two elf
> > headers in a single binary:
> > - First 512KB: First ELF header + SBL segments
> > - Remaining: Second ELF header + WLAN FW segments
> > 
> > Download behavior:
> > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> >           2. Full image via BHIe
> > 
> > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > 
> > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > download over BHIe as it is loaded in BHI phase.
> 
> What is standard about it?

The TME-L requires standard elf image format which includes single EFL
header and WLAN FW segment.

The "standard_elf_image" seems misleading. Since the new image format is
required for TME-L image authentication, how about using 
tme_supported_image?

> 
> > 
> > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Reword commit message.
> > - Reword comments of standard_elf_image flag
> > - Add reviewed-by tag.
> > - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> > 
> > Changes in v2:
> > - V1 patch is paused because of no user. WLAN team plan to add support for
> >   new WLAN chip that requires this patch, so send v2.
> > - Change author and SOB with new mail address.
> > - Reword commit message.
> > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > ---
> >  drivers/bus/mhi/host/boot.c | 7 +++++++
> >  include/linux/mhi.h         | 4 ++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > +		if (mhi_cntrl->standard_elf_image) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> > +		}
> > +
> >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> >  		if (ret) {
> >  			release_firmware(firmware);
> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> > --- a/include/linux/mhi.h
> > +++ b/include/linux/mhi.h
> > @@ -360,6 +360,9 @@ struct mhi_controller_config {
> >   * @bounce_buf: Use of bounce buffer
> >   * @fbc_download: MHI host needs to do complete image transfer (optional)
> >   * @wake_set: Device wakeup set flag
> > + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> > + *                      image need to be skipped when loading WLAN FW over
> > + *                      BHIe interface (optional)
> 
> How does the description correlate to the name of the flag?

The description can be updated as:

 * @tme_supported_image: Flag indicating FBC image format supports TME-L
 *                      (Trust Management Engine Lite) authentication.
 *                      When set, skip first 512KB when loading WLAN FW
 *                      over BHIe interface (optional)
> 
> >   * @irq_flags: irq flags passed to request_irq (optional)
> >   * @mru: the default MRU for the MHI device
> >   *
> > @@ -445,6 +448,7 @@ struct mhi_controller {
> >  	bool bounce_buf;
> >  	bool fbc_download;
> >  	bool wake_set;
> > +	bool standard_elf_image;
> 
> This flag is never set, making it a dead API. If there are other patches
> setting up the flag, please include them into them in the same series.

Let me discuss with Baochen about whether he can include the patch in his
series that actually sets this flag for QCC2072 device.

- Qiang Yu
> 
> >  	unsigned long irq_flags;
> >  	u32 mru;
> >  };
> > 
> > ---
> > base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> > change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> > 
> > Best regards,
> > -- 
> > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> 
> -- 
> With best wishes
> Dmitry
