Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AFB28468B
	for <mhi@lists.linux.dev>; Fri,  6 Jun 2025 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196420; cv=none; b=lCJwWT2zz414TTedUtBAmw38M/3rcIhTV5hahOnhU4wOQtWpoamTq8xP1Estn4RL4dDfRbX3FbCKeV4JcmItg6fImuzMwvucMI6d9h765lDnepVsNGSzJS6HbQMRCEuBYXhmO06FJk1PiT0m4a0Zo85SfoTPWxUptj9QKT89WCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196420; c=relaxed/simple;
	bh=VedvAdrk0UYsIcSq4+g2X7qKC0IU3ySa5DfrStg1g9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCFUELtuB2PonVt3PMU9jPDCQGPXDdEgyOycWHbcpeBmT88AH2kthNfgPEk0gfF6bebHhdrLWoJwfEwrv7g3FT8lUQdTI767iOLck4b0B0QEY9tiWIAkqFUlN5O01Xrb0x83oPHQV9nLtU+nDmXBwws7rc9C+eT3QVTM0s4eFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkPPhlPM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkPPhlPM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5560KwpV013926
	for <mhi@lists.linux.dev>; Fri, 6 Jun 2025 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4DWEQmRQ+i2IbBTLmrZiOQE2x9PEkpFgFS9oq7Dy+s=; b=XkPPhlPMJLXyi9f7
	me975QOOnekEnZz2gXeNhHC6aD8F8ZC+x7ecr9nYsKCq4da+xPOTmPHNYN7wY70g
	1wZ38ximQacLDP/AfPlNKXbyLxe+gkcydwv0SYSkggW+822jOl+t9oD3jK5NptyT
	s6nBZPOE1qY/CmrivCjDo6cB+V0eYZayeGgWdo1fM+hhmsmdSY9ZjCzPU5d8TkGw
	v7VZlSGvzCJZ6v37C6UzsB5D1w0MdtqTpdfP4GS+zQueg5a6QFI19QD+qWYY3Gdc
	J1yO6ERnbyhWZvwb/EZwrhUAjv7I0Cxxzv0FepzW7D8TPbGyBfAigPon0SI6QXCG
	HT//lA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 473nphrvtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 06 Jun 2025 07:53:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d66fa6so16519235ad.0
        for <mhi@lists.linux.dev>; Fri, 06 Jun 2025 00:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196416; x=1749801216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4DWEQmRQ+i2IbBTLmrZiOQE2x9PEkpFgFS9oq7Dy+s=;
        b=IhCtkYpXeucXth+jTbWiu1m1iTbiP33w+av8T4gTgzqTVzZsYKqdUEPqhGh6VrYZVv
         bofZF8rpJMoewIEozWNXQV9QwMJaoxxNjrkqRKAIpQ8bdIwrfv3W8BH6n2PZelrD/Vjo
         jcGkjLYBTV2Gk9lfzWo0QvPSC5y31nHkZyRQm5Eaqiu0fgPkDmL48gQmZUzphRzXq6bb
         OOOX5y7/qcHVycKK2VV7I3MR3tKp/yrndhQ5x8RkvOEAXX+Nb6KdUa0hB0rVqCstLDhp
         2LyFID0P/Ve6QH5ak+s6xHcetT+3h7JR9weBrv2xM8QZCMSPUhWFi3RDia2T0XaiDMHe
         zDlw==
X-Forwarded-Encrypted: i=1; AJvYcCVi4d+ex+4+qFND8OZT4m2KYR9pHwKCifcv/kCMMjynzEtiRi9S1qo+IJlLJkSwa8sjqqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwovLRPSceG7bPjaux4GkCD/DqWOHw06iAiEuB0ztl687Kz4O1e
	CvY/bv7DQ9OKRjL5Dgnk7S85YKseJGhr13F2qP7uTW2Bzlmit4QvqOxiZUQuO3HNgBqnLtwdBVs
	5j6I19rDz21ou3/urGiZuhH2extqQV3i1V7QCyOPiLpVuGVjl0DEdOm0=
X-Gm-Gg: ASbGncsvgto2JKVlzGUCg1Iu6mUFcwonYhXKxEK7lqsQ+0Q1klMCQUDJ9uOCVjuNZye
	RMg2NMhAmpHC3NzLU/LpLcrGnYacrOpPXHefDGVh0Ijc0U1ecWmyumd/fBySxkVqbI36/CpQLHL
	WodwB0QpIe2TfVb5HpJY+ACJdl4a0bkpKkVhDLxDAisyaBgQBvtPMQmMNT2pYGAxxTzUiyjYbPx
	O/8xOsya1IQateTSWGxv5iZuq0AMAv4qeUPOG8NYZU+fJbIfI96GQcFYvZYTE1N9b7dRDig+4rd
	E6TSG8D6b3lq4TVvw0bEeL1gHiWagAHxfGg/pcj7SpMZPbK5MMOfQ6+EoC0=
X-Received: by 2002:a17:902:dad1:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23601d16effmr33765545ad.27.1749196415979;
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmLeNT0jN4KGfW+N/v1tEX9Oe0BlAkplrf6kG+pT3ie2tPkD3R+nDj5hUiv2s54Auns9oNpA==
X-Received: by 2002:a17:902:dad1:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23601d16effmr33765305ad.27.1749196415603;
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fe704sm7056245ad.138.2025.06.06.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
Date: Fri, 6 Jun 2025 00:53:33 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
X-Proofpoint-ORIG-GUID: J3nJuF0LWF2OZrnYybk9OpnH3l2Fm8sK
X-Authority-Analysis: v=2.4 cv=N8QpF39B c=1 sm=1 tr=0 ts=68429e81 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3eKJ-SLyz9EkZku_pjEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3MiBTYWx0ZWRfX/Rxc4CbNq7Ig
 xedalfChHXu7utM1op42F11nDaaZ+Wc+3bp8iahrq5X2DAlmOegACPiNc0aKYnxR5a3JMqayK2H
 8Y/hx0kDCUBaRWetSdSqRaUGKkQq9wp3UGVZ4NTYZ8ruVKiFDhJOc47q/cALZDhyUDI85Wu5T4T
 qLdIbM+UcyJTF9RwAWo3Mk6gog1mjs0leN+QyoMwmUZzSjI00eluwCaeBTFl+7a2hY4eOHhmWkv
 idT08mYq+q9YLMB7QDkzS7zouMtSCdUnAvef68bt2WTo+NPzJ+2hj7KDMY2PRVftKymIVEdsUWU
 rJ2fwp6baShBYbIUb1L5T89RD0ImJm6MNrJy5JEebidb5hZa80YeVWXm1MDRczZ3A0kVu0wTIL5
 DqtDBESLpalTvJbyGt50KFixtyfqtJSShux21C2yKOMJ5fdkEM0Omc6+H0F3605UBXkRXQIx
X-Proofpoint-GUID: J3nJuF0LWF2OZrnYybk9OpnH3l2Fm8sK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060072

On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image is a non-standard ELF file that contains a single
> > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > unable to process this non-standard ELF format and therefore require
> > special handling during image loading.
> > 
> 
> What are those "some devices"? Why are they not able to process this format

Eg. QCC2072

> which is used across the rest of the Qcom devices?

These devices include TME-L (Trust Management Engine Lite).
Currently, the FBC image is a non-standard ELF file containing an ELF
header followed by segments for SBL and WLAN firmware. The ELF header and
SBL segment within the first 512KB are loaded via BHI, while the full FBC
image is loaded via BHIe.

Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
processed, as it does not conform to the standard ELF format. 
> 
> > Add standard_elf_image flag to determine whether the device can process
> > the non-standard ELF format. If this flag is set, a standard ELF image
> > must be loaded, meaning the first 512 KB of the FBC image should be
> > skipped when loading the AMSS image over the BHIe interface.
> 
> Please explain what is present in the first 512KiB and why skipping that is
> required.

ELF header and SBL segment are in the first 512KiB.

New FBC image format adds second ELF header in the start of WLAN FW
segment on top of current format. After loading SBL, second ELF header
and WLAN FW segment is loaded using BHIe.
> 
> > Note that
> > this flag does not affect the SBL image download process.
> > 
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
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
> > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> 
> This print is just a noise even for debug.

Will drop it.

> 
> > +		if (mhi_cntrl->standard_elf_image) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> 
> Is it possible to detect the image type during runtime instead of using a flag?
> Also, the flag is currently unused. So it should come along an user.

Perhaps we can check the second ELF Magic Number, but I don't think it's
safe to determine the format by doing such check. Using a flag is simple
and safe.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
