Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2664196C7C
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766543108; cv=none; b=uQBgakKuCoamyvYgoWblVt7AZEGtgxgjvFuo2NJQiZWiiNpNdPcjk2z/zhrbp8ikR7L5NYQmxmUYlbj1wzi3xDWmC3m8v2f2uyYUDn5qUWFYQ3nVhFPEuX3rGVhPAMTUqNY2ys36ZtIR52a27RhdrLl31t6x9lFFLzg92E6d9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766543108; c=relaxed/simple;
	bh=hst4wFxqsCrh+b4bJmNnrs0Z5Hu9R9f5g9FYyaOTeVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpTZfiKmoND3kY4L6re0j6ohueCxIAdxG52EI+OGqPJKuQDpWieMaUPOftiQIXy2Gmautie63+9UyzJuAO90Bi+Xk/pEqbXcRxAkk9eYU3v1TemFH2q2B5Xk2csxUJQdR1CaQP1esg8z/JLyyaqydt3vqa4gfN8I+wewP5L4FCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxVNoHtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiarPPTT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxVNoHtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiarPPTT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXeFL1206442
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 02:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uzEDmz3ozssJ2zkIMpJ8MaNwc+js4SxBPDQhvJmCx0=; b=bxVNoHtgZjiOM/xv
	2nq4+1MrBt3l2BwfSNRn6yDDWTvLtRf1+aFDKULbeXsf/U4u39+mIDWi8gtssT3D
	93yeEUk0ddBS+vq2si50ggS/5JqO8ucJgipt138jAf0drXNVrolUqQAxjJ0VCuzd
	Bh6MAXxydkqwk/FqiNLctovFLGnzjd7lqPH4gy/b52rhaU/ThEASyn8a9m5qlI/P
	A8/Lv7SUJiwplsKS0A89HtC4QHcEmiz62sJHthZBrCZfuDTpfeqjkL76c1DF/70a
	Sl3VSsSTayZUeGgje1NtuB5BM+UUuUFLnFJEnOdJcLeZRnrTlFx2i9oBAz72fvY4
	jQ57WQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0p9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 02:25:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b993eb2701bso5710054a12.0
        for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 18:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766543105; x=1767147905; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uzEDmz3ozssJ2zkIMpJ8MaNwc+js4SxBPDQhvJmCx0=;
        b=UiarPPTTK+8jfgpgCTqwOtdnFwxYLeeryvtpUORlq6rOpvh0nwEzJwDFEnUWnRRR9B
         RGNRGn4tn9IXYbnfs7k4PzopFKEDg52AJ0PEwEydNM8cZn2nA8eAFO46SFMsNGMYLKS1
         aGnFD4Hr2x8+HGIEp7SRJykGtx9lMtY0+0DYxVs3DtNHW2j1w/1azs4FsELzUbKiCBtX
         IkwV7wLEcVD6hNVt8mK22Q6kHxNcFqnAa6XmPejnB26VuwpRqiwfmZlRjsvdK/l203AE
         uME2a91ysu47MEublyaAEX1Wm0FhWAb4FjlhvPzGE9BpwNZkWzFVDZaeHK4cCUGIBk4z
         J/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766543105; x=1767147905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uzEDmz3ozssJ2zkIMpJ8MaNwc+js4SxBPDQhvJmCx0=;
        b=jtPQO2rjWN85JA0BDlZuIGGKDUx75Rp4Uic/y6IbExzTCtTbB9JrU99V0pbzDfV1xX
         XuCofYG7SxD7zIWErArV3vvdeVGJU64lCWi4xPkubGX1OJ9HvmIS30oRRQcNhaWuxL2u
         FBxlsSDw+hMal4GAyTDGvRNAyIISAxKv7DVdg8/+nWxCT75DGN/n14qHAXfb2ChPVpyZ
         /abx/Fox0ms8aWSj4krnhaYMd57w91pBdgMXGAz4oS0ah9Ayufp43umTbdIaCkdeWTft
         PswcF6Tm7axLGT7tTwBlZbSqmAtpl9uXfZ0PvtCzNb5rFTcw0XKu4EPSveTXVxNGoUIU
         4Urg==
X-Gm-Message-State: AOJu0YzOk/srKnQ2MoOUf7QTVC1FpWfc5+/CB0fXKcsvcPLFG6lq5CGH
	S8nNCffDQ2a6FOG2EYZAZodO//DviYe8Mt31L55NE8oCawwJUVQoazz4L+qqFo7sPw4S65eS5xH
	O7h1HQnRSIc+6nmVSMM/RyEHTv2Uyz7XSvzSV4YzFoeHMLIBV4aclLIY=
X-Gm-Gg: AY/fxX4xlChfg5lgHvzLtuIeCX2mjVMIQzLLiJisSdnL0th87joUH36szYOs8tPSlBI
	QBQz36qBiMJU0RMv5xjwY835VMZwya835vD40Qmf5GkFMQp+YVZ1SHBE1zoohtqAxj/ojF9AUoE
	b2OzrY3lNtZVxOpZ1MFRcd9tn6UlGl2fe0YIH4bA5ngXmtjyAnlSM5Wy6kqZBhbB3rIf9m5QeRs
	prsLUsVxdu+WirwoGokWngXLeY1qCpyNJQEORRkFRebpR/U9ZF4aWL2B/mh1DDNQJekOQfgBCtW
	XxDEkjkecUpLpYbJ9+L8weuCA3HOYT4ATvnyufh8xFxK/KnTj23ypST8aNY6aNn19u11hJIOELG
	GRUDsigVOGdv6DLTgTy8ehjV73qykHCycKmRQxv4e92dRjfwQRoxO+eqK
X-Received: by 2002:a05:7300:c01c:20b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b05ec6db1amr11885646eec.23.1766543104668;
        Tue, 23 Dec 2025 18:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC8lB+FDWwtrIyPSqkUk9SczALY9wWT4LlLWhbex/v4tm0ttNNbg1GDPzYbodhq+x95Z/YbQ==
X-Received: by 2002:a05:7300:c01c:20b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b05ec6db1amr11885637eec.23.1766543104082;
        Tue, 23 Dec 2025 18:25:04 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm42080302eec.6.2025.12.23.18.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 18:25:03 -0800 (PST)
Date: Tue, 23 Dec 2025 18:25:01 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v4] mhi: host: Add support for dual ELF image format
Message-ID: <aUtO/UOSjQM8gNab@hu-qianyu-lv.qualcomm.com>
References: <20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com>
 <a5obqgu6swi7eq2j2n2655twn4aw2muzkrr5txmbg2qdfzs36y@7v6maj5pdw6c>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5obqgu6swi7eq2j2n2655twn4aw2muzkrr5txmbg2qdfzs36y@7v6maj5pdw6c>
X-Proofpoint-ORIG-GUID: rEYKZOBYq3PT_pFAnjdD6XQAZCl-Ceyh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAxOCBTYWx0ZWRfX/XM6DJWyRGdC
 3iH6fEGF9ZIe05CXNwmmr52YHjz0MPcVRXDfUiFVxxq1O8Of28JPYfV3InpUYar7pZ0fXPzVsUL
 dkdiI+2AnuwZib8jYv1Piejf14hnJn0d6BqjNUl52PLLmDkeDAYmNvKJrSOmpeLrSx1Yur4mlML
 QBq9alFS3RQS9aPArOT3fCOCjOX7+RLtLxcIW8x2hUGTKHTB4/2Ec+4+GV0ta4KkjOQ76flrieq
 T3XVJUZ/R1wd56Vjt6gEF4Nq75Xy1ppD0zEIl1knT9JVA8pGx94IvkHh9czip9KFsqQy2RiX1AZ
 ELMmgdJ/oBNwWmHoy+qpqC2P+lPl71jG6uK8kLRSqgaYS3zy0Z3SeVJ+tjD/KpnEyZv95+M5tk+
 vdzfTz4qomVpwJTEzbSzBiDjtm6bEdQsSbYRyJQkDkUB+pfhe+VdmZG2DL4KeyZl+cNTuLCqVU7
 Dp3W6xoVW/oFWaKdyjA==
X-Proofpoint-GUID: rEYKZOBYq3PT_pFAnjdD6XQAZCl-Ceyh
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b4f01 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=tLrtqS7ol-idi3BtBVwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240018

On Tue, Dec 23, 2025 at 04:45:50PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Dec 23, 2025 at 01:16:46AM -0800, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image contains a single ELF header followed by segments
> > for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
> > supported devices (e.g., QCC2072) require separate ELF headers for SBL and
> > WLAN FW segments due to TME-L image authentication requirements.
> > 
> > Current image format contains two sections in a single binary:
> > - First 512KB: ELF header + SBL segments
> > - Remaining: WLAN FW segments (raw data)
> > 
> > The TME-L supported image format contains two complete ELF files in a
> > single binary:
> > - First 512KB: Complete SBL ELF file (ELF header + SBL segments)
> > - Remaining: Complete WLAN FW ELF file (ELF header + WLAN FW segments)
> > 
> > Download behavior:
> > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> >           2. Full image via BHIe
> > 
> > - TME-L: 1. First 512KB via BHI (SBL ELF file)
> >          2. Remaining via BHIe (WLAN FW ELF file only)
> > 
> > Add runtime detection to automatically identify the image format by
> > checking for the presence of a second ELF header at the 512KB boundary.
> > When detected, MHI skips the first 512KB during WLAN FW download over BHIe
> > as it is loaded in BHI phase.
> > 
> > Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> This version is not anyway close to the previous one. So all the tags from
> Mayank and Baochen are irrelevant.

Ohk, let me remove invalid tags and post patch v5.

- Qiang Yu
> 
> - Mani
> 
> > ---
> > Changes in v4:
> > - Detect image format runtime by checking second ELF header instead of using a flag.
> > - Link to v3: https://lore.kernel.org/r/20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com
> > 
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
> >  drivers/bus/mhi/host/boot.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > index 205d83ac069f15a19ab2d66a63692e5d60334d4c..6ba0f16854d3a839e987f19d782600467b5f9836 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +
> > +		/*
> > +		 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> > +		 * file. Hence, check for the existence of the second ELF header after
> > +		 * SBL. If present, load the second image separately.
> > +		 */
> > +		if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> > +		}
> > +
> >  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> >  		if (ret) {
> >  			release_firmware(firmware);
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
> மணிவண்ணன் சதாசிவம்
