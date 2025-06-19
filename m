Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867BF253959
	for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318965; cv=none; b=e8pF0/HDEeSIHMNPI+hAir7EVRTkYs0HBA0AY1NuIExBnw0xxTGe9PQwrwh44Pj1aH81HzylH0MLjmyPpyD0S0XTYdEROmpgK1B014kE4xz/QnNq9ndMANWeea/Ov3Hrxth9fzHAPEaA3sKlCksQHNkQBXm/NQ0D8d0B9Nzno38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318965; c=relaxed/simple;
	bh=s2OolJwIz9awxR2iz/43VMdB6EucvrqWeFm1XgBiIFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUvNL2cpeetgO4MDXT2kLK7DUuTUeLtVaFtphuLWgkOnqP0I20CoWftj8Vxztq0zrRJ30BFuJzBxyWiBIoFSjyw8FaLAJClb33/SwX//4eIhFpbezaSpciln+sEHzM1dp5zB9ZaqtD8pNPbsR/al1awGR6PhuwWh5gbYYenK2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0tykLMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0tykLMp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J2FBFW007549
	for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 07:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bK9StFic/Lakke1sCoMHiU5FEA33sLFtfn5W9fGOiA=; b=C0tykLMpxgecwn3B
	rM1LOimHab64qUEI9q17fhye2dcs2/A3fRVQtcKasDTXdMtM1y4V8W5xWKvgppMx
	d5qfSHq0Iq6P7+sHTAOqbNqnXEJ3iX8GDHaEme2KYcKwj0isr1yxKmzOSyDZ/AGg
	4p9BNtD0q7o0aKauSQP+VGM1zSe1df1QWWUBo6ZCErrj8JzyCdFbnrDrxYpsHYSY
	tN2iHVIgcq1/PHdwHguErK9d7bREa/cpu2arR3fDb2Atw8nzJQLAMz7rmTOY6p7v
	ohMt8tCmYwINKZKrdOlq2N9Bm4N8dySQsJFwA/Majvhotg5MV4BBum464kkzqbN9
	pd/RWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krrv1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 07:42:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23536f7c2d7so11448165ad.2
        for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 00:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750318958; x=1750923758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bK9StFic/Lakke1sCoMHiU5FEA33sLFtfn5W9fGOiA=;
        b=tXV5bmCi/dMaAWaI/MqeyENDHMVRMtXnt2pX+RJZ8zPEAjO0mnXZ4VNTSbrt67D6Xa
         jkK11AQ8LfxEToTgDEtoFLO09+sNm9VO5ufIZAb0J3pGD+hqQg1iz7Eo4npY5WXaioIU
         nzJNCyL+o6qt7huMTejTquHsAgJS7Lr4288XX1nsbf40I9vcLoK+nCvabC2WuNU3mDit
         mk7mJpoixXJSGrnN/hisasTiZuUFpyUCKT5gD6bWlXy2gRAb9w+zWVQYuMtAHIYnHumY
         IJOF+Z+6wheb3b6CRWAeDy1I/Gyg9HkjPgoqlFKNy77Hwe9GaNpHEYPdAG2ElH9F+dei
         kszQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5FiiN63gubZODNq95ShWfHsYtd9Ipej0/1oUdJSecIm3MGjNgNd3yYl1EC855/mKc5HM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW5xpnRTC2L2vukjU300hYZ5dSWq9at3XmI/zPPaahIwxpPs75
	te3hDx1NHPHVmdiw7PV7N3511aWxQm5ye9p/xp7bopGEGmjCx6jwvliNn+9oUSwmahGxIBZGmtM
	uw+jWaP5q+zJ6YPFvPyNmdHxMr4AI31arhfg4BNMW50MR7XTrGflneeM=
X-Gm-Gg: ASbGncupAsADKikc/aHPx/oCzh/QB3SpNL4SYHpY9Ms0ZxNnlC5LI0ZoouiJrerkbKJ
	bLw0hV5PxFnFNpopwXoj0vl326KApo5w7boMcAgrHbK+RL+mY09OeO1EdwpOA3pvXJNeZYDevDX
	/ubC5r2CLFpnfDSFJdWNXSDSbfXdIrEyS++jiarGUjBArPmtzmnKxnRDtOSJetSlZQfeXz3zkEk
	NoPDyf5kbsMmKH/93YLaNPXA9dKyNpJBDMYUljca8qXYtTiPaXSzoIDlLt8BwyM1H+54O3UQG19
	xA941ou9JT+AL9Wxv91Kda9eQbToJ0TXm+cyZDivpjRtYgXkomRT/naqikaIEDhKMKg0+Q==
X-Received: by 2002:a17:903:124a:b0:235:f3e6:467f with SMTP id d9443c01a7336-2366b3138e6mr328987555ad.2.1750318957478;
        Thu, 19 Jun 2025 00:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1K+tjlLOlBKZW+h28YggU3a33tgf21Wr5iYIUaMwfntpyd+JHMLZw4bqejg0TjXcSB6QJHA==
X-Received: by 2002:a17:903:124a:b0:235:f3e6:467f with SMTP id d9443c01a7336-2366b3138e6mr328987155ad.2.1750318957019;
        Thu, 19 Jun 2025 00:42:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a2f4c23sm1431417a91.29.2025.06.19.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:42:36 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:42:34 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        can.guo@oss.qualcomm.com, Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aFO/ahs3LwUvKpAB@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
 <9ab8e8f8-e176-44ab-b8e5-0c27e5eff30b@quicinc.com>
 <q3uxu5cki7c3nkv65kozibiz7ofjcm3clelog3oaqcya32kph4@ntvsqbshmeuw>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q3uxu5cki7c3nkv65kozibiz7ofjcm3clelog3oaqcya32kph4@ntvsqbshmeuw>
X-Proofpoint-GUID: -OyN1htR_oU9dJHp15AIMypWDoiDUFh1
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6853bf6e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=z0rqCJazpnJsISlW-HgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2NCBTYWx0ZWRfX1Z4+uX/yw5lG
 OVMMRcgDvMJV6tijU+ym6E+mvwIfSNbOJE5DJEVxlxK6wbZfej+m7kzY7GOBMK4DCsmsjztHfCz
 LpxACbgk2sAdGGXAhQM9cF4eKc6+8cpk73w/pb/3nNQ9T8JTNxBcoP9czI94hdtFIki8ugpC4bN
 zLRsJ4CLlmGKVoJz2kaZm9IzCLGkrij5NcnlCQixHfD6W0ctFUr+6am1q/1wVuLE8xsD9LR9wqs
 gqOwXjVcBFrlrMogvS4rP+JJGZ+tpAgLZRO/fWavmHk8IIdAgtFfWZfEdbeT70mG+HK5Z5L9y+Q
 1x5oY85sNgvs16e8Q2hj/OqhABusTDvgRInd6qRgPIc3UCfDLJAE9DvXrD8ve7WuDVrL6Lvz3Vq
 kC+9y5JWgC0eKqRfS902qn/xgaBO6DnCOVEMnQYvdqngMlOYVzvEo2qEno5psXTZOfNqJbKL
X-Proofpoint-ORIG-GUID: -OyN1htR_oU9dJHp15AIMypWDoiDUFh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190064

On Tue, Jun 17, 2025 at 02:53:02PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jun 06, 2025 at 09:58:06AM +0800, Baochen Qiang wrote:
> > 
> > 
> > On 6/6/2025 1:04 AM, Manivannan Sadhasivam wrote:
> > > On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > >> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > >>
> > >> Currently, the FBC image is a non-standard ELF file that contains a single
> > >> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > >> unable to process this non-standard ELF format and therefore require
> > >> special handling during image loading.
> > >>
> > > 
> > > What are those "some devices"? Why are they not able to process this format
> > > which is used across the rest of the Qcom devices?
> > > 
> > >> Add standard_elf_image flag to determine whether the device can process
> > >> the non-standard ELF format. If this flag is set, a standard ELF image
> > >> must be loaded, meaning the first 512 KB of the FBC image should be
> > >> skipped when loading the AMSS image over the BHIe interface.
> > > 
> > > Please explain what is present in the first 512KiB and why skipping that is
> > > required.
> > > 
> > >> Note that
> > >> this flag does not affect the SBL image download process.
> > >>
> > >> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > >> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > >> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > >> ---
> > >> Changes in v2:
> > >> - V1 patch is paused because of no user. WLAN team plan to add support for
> > >>   new WLAN chip that requires this patch, so send v2.
> > >> - Change author and SOB with new mail address.
> > >> - Reword commit message.
> > >> - Place standard_elf_image flag after wake_set in struct mhi_controller
> > >> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > >> ---
> > >>  drivers/bus/mhi/host/boot.c | 7 +++++++
> > >>  include/linux/mhi.h         | 4 ++++
> > >>  2 files changed, 11 insertions(+)
> > >>
> > >> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > >> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > >> --- a/drivers/bus/mhi/host/boot.c
> > >> +++ b/drivers/bus/mhi/host/boot.c
> > >> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > >>  	 * device transitioning into MHI READY state
> > >>  	 */
> > >>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > >> +		dev_dbg(dev, "standard_elf_image:%s\n",
> > >> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > 
> > > This print is just a noise even for debug.
> > > 
> > >> +		if (mhi_cntrl->standard_elf_image) {
> > >> +			fw_data += mhi_cntrl->sbl_size;
> > >> +			fw_sz -= mhi_cntrl->sbl_size;
> > > 
> > > Is it possible to detect the image type during runtime instead of using a flag?
> > > Also, the flag is currently unused. So it should come along an user.
> > 
> > The flag would be used when a new WLAN device getting upstream. So either we merge this
> > patch alone, or we get it grouped within the WLAN patches. Kindly share your thoughts?
> > 
> 
> For the reason I mentioned in my previous reply, I don't think we should rely on
> the flag unless the WLAN device is shipped with *only* the new FW. If that is
> the case, then please send this patch when the ath driver support shows up. I
> do not want to merge a patch with an unused interface.
>

I discussed with Wlan FW team. For a specific model of wlan chip, only one
format image will be released.

- Qiang Yu

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
