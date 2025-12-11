Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAC2C08D9
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461480; cv=none; b=ut+/DNA7bjqhgxc+KBC/9QlX9ctVHqYckYQAB35xafbqv3mmKVH+U8urXGO865/BDky++VlxWK4O73HujU5BJJJodlvjfxdbmirmeVnWM2ejmcssmzg7iHOqCz9kYgfJRn7tezTg+xy5c3apg2PzPtXzudkNojhtok5DSGWgDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461480; c=relaxed/simple;
	bh=E6J+s1ir76ZerayYtD2w5yzzIIMkc//ceWObfnwy+dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLcCkHXw3m+IItt39IJutSPVz8g3Ce3ueOtomGIIuINH3x1FgeU0y+HHDp+09m5KnxHP4KTxChjRN+ygemPi5BCzEyEL1zfcoGoHAA6Wgk2JPxja5JORCn4bFBuZ68HYROSFdEgESNtsIVd8ZWLDL3L3synVPxhvcRi1fpxFNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFDvx6Pq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aA4xXRWO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFDvx6Pq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aA4xXRWO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBAXmCE932625
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 13:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NHaQjXZedbPB0BE6Tg53rJFg
	jUM0ap8QHGxUzTRk9Ic=; b=JFDvx6PqHb9tSQ8q9ZcmLQwG3Aw4CDhb+4mVTNCR
	X4S7yeLKl1JxDs2qnP+IdrAvpK6iKV9v/ukE0Ziu9r6QOc/Z+/TnJTCp4otWeVH9
	8U4oxW4mAYokAuA/mwp6DfY8V0XHqVZ9yvA9NpyWkabcYCzJXwOjGPlqSbYUup8J
	H/nV8LrQyToI0PA+AcD+sfvmSxHSDmESTTwhRvfp0K7WiBvnMZrz+ODUrhQIY61c
	n7WhgA9r1hC3XF0KLz7nz2oI/wTiulKBZsi96wDKEOvdO6kEBUeIe4HnYFllMvrW
	19TPYOCLMFOCMLTo5O7RsAmI5IlJLP2KgXLKiVt0kp93hA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aym5825jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 13:57:57 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55b09eaea3fso133442e0c.0
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 05:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765461477; x=1766066277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHaQjXZedbPB0BE6Tg53rJFgjUM0ap8QHGxUzTRk9Ic=;
        b=aA4xXRWO6Ta0UsN1vv5nD0Obpk+gmX8GLQu5rJGPQyZwdMtbLkhGqfqGwh+OFYLTMj
         7YjvHYcMRB3qYghqHWRifJhaQZiY663DLHC51+WF6oqKYVHbxGk6i0R7BasyHuS0K7JB
         FUAQzu1I6wqeCu2hHH+5KbwrdFKiN6iRx+afnsN6RtyVrqLDn+N/rUMXoZOBaljrjXYI
         qXpfRJ6PD/+PsDuI8qiwPIu0fDKsmImNvw4wsIsFER9RQYFgQHhjresm30Q743YGPwKd
         FacVU64AJUDmWTbqJ1228P1Uulb7kkVM3RQJLuXhEMcGcbAy0MG75/8cAY1ErwJAyi6A
         AdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461477; x=1766066277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHaQjXZedbPB0BE6Tg53rJFgjUM0ap8QHGxUzTRk9Ic=;
        b=toyt+jaCZcmgZ9L1xzXhJ8Cj8qf+6UgpiQiGMqz8AmTiZKLFrPEPxAl1XXBjlnaPre
         pqPiio6vGPcBtnMtBPoGxu2lFnkIe3rdzL+MSpS5g2ehC4CUEk6Pesehfgt9DPzeCvUj
         GDnlJITdubjvws0KJOgfh+lw4DQc6ZaN7EsOVCv93O5pJ7Iaew40SDz34KSY+JSWz0WM
         O1mOp3Ux/Z3VwEGtn05SJfsNZ5HsupXR4qfolxa2W5JFT2+MB0jmVvKwig7+RfjX3V1+
         AWwIFnaqpHuuoJaodxpDxW/oxhrs5HKMKeQx58w0rQfEhWz/ODWkZpW5G9CcOH17vEd3
         Rp8A==
X-Forwarded-Encrypted: i=1; AJvYcCVMPEdluItdDz2DArKzyUawRScpF2dFDK/pcHoh1/HPpfJDCwB4vNgV+KKXpm2+zXC2OnM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/xtNP+pO/KatRxTX9GwtvRT8ZLo5HoYYGFtGXBglyBlOkJQXz
	wLaNZLxzcfBFD+p3KZKGMq2Fy6AvJ8KvqQf7oK55poeO4mztlXQafUE3wK9IvDq3qnJzMGehqMj
	+qlvIWbMxUi9PEdJozRVz/2CnrZ/GItopOJ7VQimolH91K4cea2Mrt3w=
X-Gm-Gg: AY/fxX6UKq7cyKRBRlb67TEqNlo/F3pCOJM/Mb2S7yYvTP8V9/MjoS48qURB3XKBJ4w
	jkwqOtFUvYnzNwNMPrs0jjeHGXZfQGX4gOKAbE2XKvcjHNXj28MsdpD+h1CBszxMdTX6gz56leV
	5wLR/j/lztWm0iN48qI9d7cODydGvLJjQnF/nXFp7XpJ8OBnISDwdZ38KazGUu8pz3Df2FbJISH
	UckkwWcm+uAxhhDkL6mxgj3cLJo6g0niXajrx73UpVqa8Y07QppKaKQ76tGk+qt8m5O+MHvXdIl
	DjprRsfI0QU8zrdAVKYoNCeOYPSr+mUJUlDFyXFTuZoLj4QR/8/rUAnbS3kf3YtpukIdgTR5vny
	cj+D2DwOIh9q9We5Os8a+/EQY6aIQpylhRvzWBeNolHkzK3fjTNOW33qzzXHLNyGuoe+UIJtKly
	A255UryEdwBrrvGxv78oDOqgY=
X-Received: by 2002:a05:6122:1307:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55fcfc0039emr2042621e0c.13.1765461477198;
        Thu, 11 Dec 2025 05:57:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRokDGKOZnfhAu7AfSnM3zMB7Xzcnq3nI/slMvscPdYN0YVpU88J9PSA9sdv2VGHSGWJh6lw==
X-Received: by 2002:a05:6122:1307:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55fcfc0039emr2042607e0c.13.1765461476788;
        Thu, 11 Dec 2025 05:57:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca7dc98sm6602941fa.37.2025.12.11.05.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 05:57:56 -0800 (PST)
Date: Thu, 11 Dec 2025 15:57:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <ge3qbeyg6oue7jeury33fqkevwvwmm2bucum45w4uyh4ldy6re@pbfshzcpeqep>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <z5osod5v6ykmook2cwz76vaww7vnlrh7csx4zebahcaspqr4w5@6an2hopq574o>
 <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTqQyPJaV+KrIMOj@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-GUID: K--dCCnDGJ0HzIJwbYD3ycL0fca0kgsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMCBTYWx0ZWRfX2FXhzJe63IyA
 Wql8jIdZkugRGgrn9Nb3YAHZH9iVqa+X763OoAo92tJvZkyPoAQXrEWUxsOL3qt5yva+NqbhpgD
 pfOhfRkMELevcG9GTW4EkLAo8nlD/EPe8hwOwSC1LoG+KPnE542CRUU6N72rDFdhxEYARugfSAw
 wFr2HGVyPxCjzH9F+8c2BXxPZEVFT/lNJlIybDr2jrzVT5+tafEe5AgPVfRasUouSjDQyAb5Xpm
 hxyiauKab4smSoCLmHbKdo/nTaW+MmvbJKLLKUg/9tI1dSxLz5xDZt0TK78PUXFn5Bk8KZPXpJz
 2l3xGKBvBl31MeTL7Zk2rdV3jeKQ3jIW1BwvvLahtZsNbpmOSgqSMdq74m2IUi9ALlSij2xvRIj
 1DzAvKeFVCqlXdZ9BFBCbCXQ2sRUiA==
X-Authority-Analysis: v=2.4 cv=FYU6BZ+6 c=1 sm=1 tr=0 ts=693acde5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eBkKlvPrDTbhV-cBLhQA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: K--dCCnDGJ0HzIJwbYD3ycL0fca0kgsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110110

On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > 
> > > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > authentication requirement.
> > > > > 
> > > > > Current image format contains two sections in a single binary:
> > > > > - First 512KB: ELF header + SBL segments
> > > > > - Remaining: WLAN FW segments
> > > > > 
> > > > > The TME-L supported image format contains two sections with two elf
> > > > > headers in a single binary:
> > > > > - First 512KB: First ELF header + SBL segments
> > > > > - Remaining: Second ELF header + WLAN FW segments
> > > > > 
> > > > > Download behavior:
> > > > > - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > >           2. Full image via BHIe
> > > > > 
> > > > > - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > >          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > 
> > > > > Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > download over BHIe as it is loaded in BHI phase.
> > > > 
> > > > What is standard about it?
> > > 
> > > The TME-L requires standard elf image format which includes single EFL
> > > header and WLAN FW segment.
> > > 
> > > The "standard_elf_image" seems misleading. Since the new image format is
> > > required for TME-L image authentication, how about using 
> > > tme_supported_image?
> > 
> > Just elf_image?
> 
> Is it too generic for this specific use case. Current image format also
> contains elf header.

upload_elf_image?

-- 
With best wishes
Dmitry
