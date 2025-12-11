Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A48620A5F3
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765445839; cv=none; b=pHQyZFNbsgOGonUUID+MZgjRdq+q6ilJl6VrQY3Djg+vVWU/n6YlOINXzdMbCE2lo2qZXVlg/rc5y/uxsQA0GDtYxQgq/4cV9uAL/xFPylaAtDsy9wu8bUpKPXlyJV0rhZaGmRs7N/OAKSrqsROcZECk+4kLumYJMr0afI8mvT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765445839; c=relaxed/simple;
	bh=PHXZRy132+0kdUmgP4WNqlEDkUkkpa+M06sbGqLu7eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq0dlqYFCDJ1I5HiyIj7zwoSkq3YfPIX9miKPo6XlSoscd3QhjVspQSPZ54tMK1V/h8ZSLo7n0V4haM0h8NRPZbEYsPUCg/SE7OZ7lA6AMR/bHo5EHOnn++c8c2kY5scFT+rnbyDWzQpoeJrjIBQwKjIju4ppchcTNWzIO5JJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfj+xzEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebI7SQc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xfj+xzEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebI7SQc0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZU5W803415
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 09:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+m5RAWgcbogYlmas1+liRKgy
	Psin28MMijXTFpb2bns=; b=Xfj+xzELhp0GdU92e8Vvg+Dqug5t0sSZuyzkGQik
	EBcbODVKSFGCr8CL7YUNmMljRvnLZau2O3jrMfXP+2Jgp08YKG/E+W2/yC00w/mu
	N2VF7CBQHKe91FzoxJmH5ew9ASK1APmuOmlX0x8CMlupQu62uPlS9AcWf7S20CX5
	dgQZP8sfkH+fyezCjVwkfxbtqNIlcNCMqjasVEA85RhU1Ek8NO++yRiAxydfsPwq
	UC66ql0V/VM5H5s148SFkazp6vGrTTrOOqc4XHZ6Mp5tT5s7kmYrTW/1SwvlJAbh
	at0ddUUaxpd1OOhHEx9eafzE4/GdeowCjDrfnaqvp1Wztg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aym581bkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 09:37:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso1625078a12.0
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 01:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765445835; x=1766050635; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m5RAWgcbogYlmas1+liRKgyPsin28MMijXTFpb2bns=;
        b=ebI7SQc0+MN2A+eMKdCPWwYV1Qn9NVdHrfSsbBmTeQLQm6yHYwJoAGgeVF+/nenfbw
         M9gapzC9WStqUS6hg1nr/3b3hbWMF7vRWgfPzEphmLGZXD4fvB+9gMGhanzhfkRxWyxo
         lsO9UHehaWeT9279mY39NnwdCz81RSl+uy0cWqlxTnaQoWRGRyqVvRQyI/s/kDQ0tudd
         /eJs6UillHFQiAb3fT+c9CX4MKwipnZ5Ex78fZbfmR6fAMv4/4WWVJzXFr9DSvXUTJyd
         RF20qbdFMkm3x2waku1/XUt1Lo5XtF3unDrwIKpYLSyDf11TK9RCZbD1Lbt0YmCk3Zxo
         wq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765445835; x=1766050635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m5RAWgcbogYlmas1+liRKgyPsin28MMijXTFpb2bns=;
        b=opzswvTlxBipDuMkjrSvD2COIjHH+7uIQyPQ1P383iTtmwFucQAPpVfkiilVNQa3n2
         k29QmzEoJ76/nLfVwI9drmF4Wby/BAWR4Xe2KQlgmho5f1SAo6lVWfkyS9B1XCfV1XT+
         aZr/nvvNJRGR9F6iIywwsR090EUcAlTuxVhw8Vs884ChO1TG28BVeIGgY/GbaLnNFbi6
         lciNvxPIuv3GTScRj0OgorzaTI1EhEThJzot1F+0XD8g2cF+9U8UEkMur4MJNkS30dv2
         e9u4ghhZixSHM6qe8NRZm9R/YRWzL/ULgHhdQRpdFyHXkFf25IlfFtmKSUNux8CM05pE
         HbbA==
X-Forwarded-Encrypted: i=1; AJvYcCUaBiJFzvoQfalsxaWTKoi/Uv3SOF6T6kyPQAb5hDPDb8Tc71VId7sRFdH4RgLxWnlE4n4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnDxJLQW0nPsVHChMQj1xPr3KzA8PZGRny7r7L0nOqTe+ROC/X
	jNRMtllRGB3S9m+jLHTZtG+48s5I0X2iFKJPKeg9fttSmA6MYTwtmH7BBOLDKStacMZ11M4zS9b
	0F/sWMFiKN63Q1jzYttjM+hXabrMsVrpo6x2YemHw0AFeCxZccXY8tVw=
X-Gm-Gg: AY/fxX6mHOICESoZSJLufjd1w2rlENZpFanKpuZKue+J1hAVvyeZGa7j5tCJO+Yp7e1
	ebbkKEuv324R58vqzk9RsAz+qNqWft20k3oywe1+JJ2/LOQjFIP2c2itv1XabkGhxNnvi9Clcrq
	yLuZJSVjO6xXnWa7ct9UkXLi0not5i8Mi/TpVkkhgOc6Hm22E0xhSmsOhut0OHf3Au1a8s9vpwJ
	JsrkcvKDhHJA0ItpUzYa5TIvH10gaUliHUQEKz7jBVv0Auyeq3M2XUOW84W5hZpuTRfqh76IYlE
	Qmlh416QlhEhBWQQctWVFCkkRLBPyD9cZZnhhP+GXGViw+upHvbzlHE184dzNbEKsAJl+i9ahT1
	eyPbJbBwpdCjMUIt18AHnXj28+G/9k+o1xXXMFo+qNfWp1Dy6GqQSFGQL
X-Received: by 2002:a05:7300:691b:b0:2a9:573a:4a74 with SMTP id 5a478bee46e88-2ac0540a366mr5017700eec.9.1765445835235;
        Thu, 11 Dec 2025 01:37:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDmzknQK46ADGMzLVSbLcpWpdQLCZHlF7yDgfWUZnMsYnsyWkUC6As4lwmUjWcGVVISWoLXA==
X-Received: by 2002:a05:7300:691b:b0:2a9:573a:4a74 with SMTP id 5a478bee46e88-2ac0540a366mr5017677eec.9.1765445834632;
        Thu, 11 Dec 2025 01:37:14 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac18f5c2dbsm6078083eec.0.2025.12.11.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 01:37:13 -0800 (PST)
Date: Thu, 11 Dec 2025 01:37:12 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
X-Proofpoint-GUID: R1aay3jL8Vt0Io3BMSSIkue6y6IHFp9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3MiBTYWx0ZWRfX7ndfO05OSKkd
 VlkcDEgHqSnc9hdYG9y53Fc1Oeyy7Mmk0onsGxWtwNnux2Uk+OEGoj7Ab39uAtqvF01a4e7I0Gi
 qCsghsUIvQ2DdQPqOi/PBx8g0TfBpaAdJYrTn0TE6vu3srRjEtoaRa/0Yd2ZAE7CGN3nYytDb2Y
 Ug0aCgNYrmEFSPupu0BfkobHwNxCiy1G3/WRJbrNHT4A4k0z/Rq9SFosCYVyeZ3qFNoSbgoZYYK
 tlIZs0+t8MI9or0eqUKr6CgVphUrv3DZr2NV/V3WA3W8mq29cH5aoxcPivqk4gp5qR7yjYIkG3s
 qrRgC5AVdIJKF8gC/hb86fBFWUSxY+u8D2JTmRch4Sq6p0S1eoIHSJh1KOb0eQh7rPiPufTRdc9
 IjHY16GrKYHAHGxr4hy1W1BfiyUYqA==
X-Authority-Analysis: v=2.4 cv=FYU6BZ+6 c=1 sm=1 tr=0 ts=693a90cc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=DsdYmJs--EhVD9mPpCUA:9 a=CjuIK1q_8ugA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R1aay3jL8Vt0Io3BMSSIkue6y6IHFp9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110072

On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > 
> > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > authentication requirement.
> > > > 
> > > > Current image format contains two sections in a single binary:
> > > > - First 512KB: ELF header + SBL segments
> > > > - Remaining: WLAN FW segments
> > > > 
> > > > The TME-L supported image format contains two sections with two elf
> > > > headers in a single binary:
> > > > - First 512KB: First ELF header + SBL segments
> > > > - Remaining: Second ELF header + WLAN FW segments
> > > > 
> > > > Download behavior:
> > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > >           2. Full image via BHIe
> > > > 
> > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > 
> > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > download over BHIe as it is loaded in BHI phase.
> > > 
> > > What is standard about it?
> > 
> > The TME-L requires standard elf image format which includes single EFL
> > header and WLAN FW segment.
> > 
> > The "standard_elf_image" seems misleading. Since the new image format is
> > required for TME-L image authentication, how about using 
> > tme_supported_image?
> 
> Just elf_image?

Is it too generic for this specific use case. Current image format also
contains elf header.

- Qiang Yu
> 
> > 
> > > 
> > > > 
> > > > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > > Changes in v3:
> > > > - Reword commit message.
> > > > - Reword comments of standard_elf_image flag
> > > > - Add reviewed-by tag.
> > > > - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> > > > 
> > > > Changes in v2:
> > > > - V1 patch is paused because of no user. WLAN team plan to add support for
> > > >   new WLAN chip that requires this patch, so send v2.
> > > > - Change author and SOB with new mail address.
> > > > - Reword commit message.
> > > > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > > > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > > > ---
> > > >  drivers/bus/mhi/host/boot.c | 7 +++++++
> > > >  include/linux/mhi.h         | 4 ++++
> > > >  2 files changed, 11 insertions(+)
> > > > 
> > > > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > > > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
> > > > --- a/drivers/bus/mhi/host/boot.c
> > > > +++ b/drivers/bus/mhi/host/boot.c
> > > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > > >  	 * device transitioning into MHI READY state
> > > >  	 */
> > > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > > +		if (mhi_cntrl->standard_elf_image) {
> > > > +			fw_data += mhi_cntrl->sbl_size;
> > > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > > +		}
> > > > +
> > > >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> > > >  		if (ret) {
> > > >  			release_firmware(firmware);
> > > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > > index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
> > > > --- a/include/linux/mhi.h
> > > > +++ b/include/linux/mhi.h
> > > > @@ -360,6 +360,9 @@ struct mhi_controller_config {
> > > >   * @bounce_buf: Use of bounce buffer
> > > >   * @fbc_download: MHI host needs to do complete image transfer (optional)
> > > >   * @wake_set: Device wakeup set flag
> > > > + * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
> > > > + *                      image need to be skipped when loading WLAN FW over
> > > > + *                      BHIe interface (optional)
> > > 
> > > How does the description correlate to the name of the flag?
> > 
> > The description can be updated as:
> > 
> >  * @tme_supported_image: Flag indicating FBC image format supports TME-L
> >  *                      (Trust Management Engine Lite) authentication.
> >  *                      When set, skip first 512KB when loading WLAN FW
> >  *                      over BHIe interface (optional)
> > > 
> > > >   * @irq_flags: irq flags passed to request_irq (optional)
> > > >   * @mru: the default MRU for the MHI device
> > > >   *
> > > > @@ -445,6 +448,7 @@ struct mhi_controller {
> > > >  	bool bounce_buf;
> > > >  	bool fbc_download;
> > > >  	bool wake_set;
> > > > +	bool standard_elf_image;
> > > 
> > > This flag is never set, making it a dead API. If there are other patches
> > > setting up the flag, please include them into them in the same series.
> > 
> > Let me discuss with Baochen about whether he can include the patch in his
> > series that actually sets this flag for QCC2072 device.
> 
> Otherwise it's a dead API which is generally not allowed.
> 
> > 
> > - Qiang Yu
> > > 
> > > >  	unsigned long irq_flags;
> > > >  	u32 mru;
> > > >  };
> > > > 
> > > > ---
> > > > base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> > > > change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> > > > 
> > > > Best regards,
> > > > -- 
> > > > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
