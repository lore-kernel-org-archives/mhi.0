Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985F2376E0
	for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750304667; cv=none; b=IfzuyuWW57LGm35lAEWOGvaOZIAB91wgIJARTL0mk20wc4zel3X8SCxVQ4L4IrJOrL90b1LVNoyUDwexvc0vGMKCPwLlikghkjAovEU7OCAmiWjcTJEard7RpXcsFPfuIM23vMNjSBg9wdCpLopnE0pZ7rCzERd2mqfrt7EaW2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750304667; c=relaxed/simple;
	bh=r9bEY7GBNI+f4W0qFdTtSzPy54h3PUtuOsmYJA0PBfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRX25q/dAKq5gZCifjADUNd99+o8b+uqjHpFF6OSGQudPxlxZglHC7pnRMn6vLSijn8c8ONTfI7tRzMEmUZQGNl1owK00hVnXRsuHCeVTL9LvoqepRfw+opkgaETkT8cSqwjEh081+C6c1dYjKboOXAappcnlHP8OvgcMhD7LZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJ9j6xfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJ9j6xfg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IH9O7N010361
	for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 03:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+scRbnc9DB9ul454aKhxI5Nurcon1EsQyC5VkFAXI5w=; b=RJ9j6xfgHY5b9Mrv
	AJxFlkf/IWk7MbgbpcseY8v70tAiKpKhVqEc3AUYV1uoUzfCNxwPnxUmWXZQE5Ax
	YjvqJovDSjVrpKPlXyFWdZv5awQLqjul+bV+xh+KiwZeEBs3YW6FKm6AeM0YLMRK
	h54cmSE+wA0pkovDODCTRDQO4oGJz86fQKOL44qoJkGkCS7AKAS+iA9Gx50Vxub3
	16lOfnQwkrQIDeik0buZs3O9628vyHMQGMDgWWjhzJ+pxfNN9ULB7TJwRKXHdtLb
	YwKsPJgs00K6DL/MgNJ9rz/NBVP+p+uUiH/YGDbesRzps7yS0veRODSHto1qi7o5
	hmbQXQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca6geu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Jun 2025 03:44:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31c9a9dcc3so453848a12.2
        for <mhi@lists.linux.dev>; Wed, 18 Jun 2025 20:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750304658; x=1750909458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+scRbnc9DB9ul454aKhxI5Nurcon1EsQyC5VkFAXI5w=;
        b=mkhLlsIHnUA2p6EoV2ntXOvJ8F4ibnoq+vD7sD7RfQ8+TChzLc2Pgntm1oojwMxpYf
         R5d5s9KtPTw3IJVeAjBk3pGgFjsnxOJ5j+zD1U5ozFzxwC9JiWDwZMiuYIQgnRWB8qIN
         nAsag7CY6UYLgY6WnBFc4YJ5ZL08p8LdwpEcA9yfH/5AxfqDYFhkvfRfFCWc9GTM1BbV
         0OfG+BXylG1Y2L6WQd+xU8D+1yGWKcTr0TwbOwFDnHKQbXSISgg+sH+tQvNFGV1AMONb
         PQiJuW0PvgLvjzmQAuPgaqEccYrAqSkM6FzP5KzbEpt5Uar0Gl7TartDq1YMFVBoRfux
         UQww==
X-Forwarded-Encrypted: i=1; AJvYcCX00BzL3G/LT5l4ak7f/ml7aqgOngjNe4BrY6ehccHTWuuAts9RfkO3+HxAKRMjHGxBjT0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp+BePFYQ7LBpGhaE1RUuVZVIfZCm2k2w8mH3d0oUcOH4kHq7J
	5isYxXX3+bzJ7qLQfWdNIs4X327O4FkcSqQigQSH4PwjT1jwHXG3EzxQrUkbwJWWx09WxfTYUHn
	kv9ypGly0aS4lGsZKM13OvOPdCpmI3vx32zSpn4m5nFjLh3OxMqzeADk=
X-Gm-Gg: ASbGncuydEWbfQuXx4aW6Zlp17khGxvqR5Ia6TYvocPpj7Y5V++xF3PQzrGIOtamhal
	LCZK4lDh6TDLhIDDNhPbiIl7AF+NXQ/xp+aYo+ikPChAR4d9CIjB4Gp/44p52Iv8y7VTBZKpR0U
	oHb7NCyTvPpK4T2l64IYv7l5s7SZG2g3LbyLkPR7HwG0Btp0wtsYtzhx6dh0ICvavnGwZYypUDM
	E4gROwIMnpbXvt+hzYv2XTvZ6k7D/9uAkFNcfZK3TQws8u5+ktCcrFOjtJNu2rJy3HOfzPfEc6c
	6KodniY0yDUe8WqV+yvRL9wiALvZAOUNIIkXpe7bqSAoibo1Ey7U/38fwNOeWCRNmv5JnA==
X-Received: by 2002:a05:6a20:6f89:b0:21f:a8fd:6938 with SMTP id adf61e73a8af0-21fbd57b5bcmr36360066637.36.1750304657715;
        Wed, 18 Jun 2025 20:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsdAGHVir91RhaZ0NNhcSSvKvJF/rY80yQk7blyq3sFyZzlQKRDY1UhTZGX3iQt/XLrErE3Q==
X-Received: by 2002:a05:6a20:6f89:b0:21f:a8fd:6938 with SMTP id adf61e73a8af0-21fbd57b5bcmr36360025637.36.1750304657260;
        Wed, 18 Jun 2025 20:44:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm4556579b3a.57.2025.06.18.20.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:44:16 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:44:15 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aFOHjw8WZRqI6xVp@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
 <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
 <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
X-Proofpoint-GUID: tsjuEnEFzh-sFRIuJgojFMy_mxq8Bvn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDAzMSBTYWx0ZWRfX9FAiAXab6far
 kGRNE+bU8mltoyHquCR7Uf8xnB3F4Lq7gcEbcsQ7qqK8aNb5NC/sMfedWJYgrs/I96V3nIFNvYo
 9P94EoSXGahMmG0moAKxojv70vyHf+Du/xClQQo3eQrWSs/WvXSbniHOYvHIPefXP+IZcYLEk2b
 UqOLLzePtHeBGWhIfmgtgH+IvdrQmNTfUegVqicDdNoMzbYNDhLavh92cFVAYwhNNhR8+gry/cJ
 rgt+LgQLb+On1r9Z6hbYmRh73A2/431F6D1lityqiwN60Oriq6cxuaJyqChNWxjLZlTekjL8N+D
 zhPd3CZ/zLOZzFVGlgVzLYl7iJ2HTGz4VXXakyNCoH0Bnz5oYvb1KuOLAWrEmKU8IsNS0gOyHQE
 PEvkFIB0WWhjMuyh99q+3si6vBnfq7c4RCT9vceEWz+6Jb3S45bt24dOVWB8/ykkbvK2trIo
X-Proofpoint-ORIG-GUID: tsjuEnEFzh-sFRIuJgojFMy_mxq8Bvn-
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68538792 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=y1Uosm5IMMVjWa0GvE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190031

On Tue, Jun 17, 2025 at 02:49:30PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jun 06, 2025 at 12:53:33AM -0700, Qiang Yu wrote:
> > On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > 
> > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > > > unable to process this non-standard ELF format and therefore require
> > > > special handling during image loading.
> > > > 
> > > 
> > > What are those "some devices"? Why are they not able to process this format
> > 
> > Eg. QCC2072
> 
> Is it a new kind of WLAN chipset using the ath12k driver?

Yes

> 
> > 
> > > which is used across the rest of the Qcom devices?
> > 
> > These devices include TME-L (Trust Management Engine Lite).
> > Currently, the FBC image is a non-standard ELF file containing an ELF
> > header followed by segments for SBL and WLAN firmware. The ELF header and
> > SBL segment within the first 512KB are loaded via BHI, while the full FBC
> > image is loaded via BHIe.
> > 
> > Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
> > processed, as it does not conform to the standard ELF format. 
> 
> Okay. These information should be part of the patch description.

OK, will add it in commit message.

> 
> > > 
> > > > Add standard_elf_image flag to determine whether the device can process
> > > > the non-standard ELF format. If this flag is set, a standard ELF image
> > > > must be loaded, meaning the first 512 KB of the FBC image should be
> > > > skipped when loading the AMSS image over the BHIe interface.
> > > 
> > > Please explain what is present in the first 512KiB and why skipping that is
> > > required.
> > 
> > ELF header and SBL segment are in the first 512KiB.
> > 
> > New FBC image format adds second ELF header in the start of WLAN FW
> > segment on top of current format. After loading SBL, second ELF header
> > and WLAN FW segment is loaded using BHIe.
> > > 
> > > > Note that
> > > > this flag does not affect the SBL image download process.
> > > > 
> > > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
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
> > > > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > > > --- a/drivers/bus/mhi/host/boot.c
> > > > +++ b/drivers/bus/mhi/host/boot.c
> > > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > > >  	 * device transitioning into MHI READY state
> > > >  	 */
> > > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > 
> > > This print is just a noise even for debug.
> > 
> > Will drop it.
> > 
> > > 
> > > > +		if (mhi_cntrl->standard_elf_image) {
> > > > +			fw_data += mhi_cntrl->sbl_size;
> > > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > 
> > > Is it possible to detect the image type during runtime instead of using a flag?
> > > Also, the flag is currently unused. So it should come along an user.
> > 
> > Perhaps we can check the second ELF Magic Number, but I don't think it's
> > safe to determine the format by doing such check. Using a flag is simple
> > and safe.
> 
> Why do you think it is not safe? IMO, relying on a flag is the not so safe
> option. What would happen if an user has used old FW? The driver would blindly
> assume that the FW is always of the new format, but the user is not aware of it.
> It may lead to weird FW crash that would be difficult to debug.
>

It's possible that the WL firmware segment could contain the sequence 0x7f
'E' 'L' 'F', which might lead to a false detection of the second ELF
header.

- Qiang Yu

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 
