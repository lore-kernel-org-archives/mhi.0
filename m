Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0FF1DF25F
	for <mhi@lists.linux.dev>; Fri, 19 Dec 2025 04:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766117277; cv=none; b=ed3UtezKHNftrx/q7qqP+WlgQo4UCuOw6grAAfhbZQn7r/KB3xZw4wNDHF+PqC8OlAwry5QjXA+KcUr8o6gPQGv+vp+zm8Dnw1Zd7RM0XaxQ+4K7ZlBmGPyUExgmlfo5O/9YqyOmxRcH7xkuSRtdGu1p6DACMdeMtPTYVgOKc2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766117277; c=relaxed/simple;
	bh=ndJkVxgNUBxZdfgEAj3b0WNmC8WoTke22OKhK08+A7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LVnKGzar26N0a8AaYAn9v6eSeKH1h9AZ4pnWh7H7tmo10JY5sLCSkHHN3QeAphte72z4EI7WZiR89+hU8zRjeDYlTaT/nM9YczDD3Qtewx1ZQxKUxkXs+RmW2m1BqPucJSeJB+GzOhjdPVAP1d7zTjjnpY4+Tl1gCLWQllNonA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPuBrXV1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWcUMiue; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPuBrXV1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWcUMiue"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2O1Dj3655384
	for <mhi@lists.linux.dev>; Fri, 19 Dec 2025 04:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOSLrpH0gIhFN13YT18Ivt2Fdi5Blj9RKsfFkY7U8Mc=; b=lPuBrXV19R9jCqb+
	2rtUMaeCAM46iu7aU06X+MA/WweGyMsfF+YslLrEtIPwmxARyoiqPT4QEWZYJae/
	DinRviQrZ8GE0QC1prnDpf6ysFm/BG+0oTF5pP3gT+iV9WjsNK4oNf5y/SzyZy3V
	gW9dry2fqLeYvnF3f+/LgxIQbpe/mBmgLW7huTQJzMM9rnSE2kwoakWL2ZRsNqan
	89GFjQKYk8Z2D5ZTevk2Vr7qenQhcqvgKw8FXI+8nVSoLrvsuuc9SLNbd3cWGdAl
	ctuj85aelBQS2Ww9Wbzdc5WJAeNozvtZUqk4IaJ5AEEpnQTc44S9BV1VS0Anmf0/
	UbqmyA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c155f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 19 Dec 2025 04:07:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so1586985a12.2
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 20:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766117274; x=1766722074; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZOSLrpH0gIhFN13YT18Ivt2Fdi5Blj9RKsfFkY7U8Mc=;
        b=QWcUMiueeaxwZjcrUxI31mHiaRmUTsopTay0uoE31iZpHsZbtp3xo0rBAeR5GFazuK
         WCRP6lffZyKR58DGB0QTseDrP4i1PycMY+f0ZPaqul6bP45EbIvoqrkMIZ5uA7ue8qli
         7Au2wRHFX1l8om6gI9KpqeAAaLDBFpqMzSxgH24Ggl8Wgr9MGu2HFs8K4qSkrtWPSL5F
         gWqlNScl//MvAj4r6NR/SpjI//JjHYqrX2BQnwEyVQLPyiYXg8ggH1jU0OVlI/jcFAUs
         8ktK9LM5p3xC1hvKt/Ei5lTRdMRudCadP+q1p53NRIIkxapVuNzCTh88ybkfAjUckb6i
         903w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766117274; x=1766722074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOSLrpH0gIhFN13YT18Ivt2Fdi5Blj9RKsfFkY7U8Mc=;
        b=YyQPIIL/CN6dLr0AbxQnHKTtftraZEc3Q4cH6HKX5LbaMwxFu2xyJf2dvQCzlufiPl
         ydiTY5r67HyuJt5SwDRLrULBTJgSu8Fuwc0Y4cpKUe/yfKItFdEB39Z9LRnY6aSADZWy
         Z9v+1+zxP28AOIjjQlcwyn7xBIDD2uaUXyT2kRANDbD9oJ+8Fvwdfb3T+RAqmrSyfS92
         B1gMHZCxVpCGdJQsY8/eKkmeQI7oSm3vNglQglKr0CfU4aJrEP+NccMl4ytvoEi0vaf8
         jqtr5E6/PuaktIUW7iWeIXfE7nVhilpgvrf/7yjd574Miko9YsOGhp830Y4PwhVYHJyk
         MDBg==
X-Forwarded-Encrypted: i=1; AJvYcCV6VjMMyxB5fEleDJWQTGQOCzmjogaVuVmzpMs2xdpVQFEmuWSoO0naNnYrenWelj/mDHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhdalybV+aRX5kSAhdEmeCfIpHSAiKPWTAFv9qtL372QtTbu0A
	vW6yvrmU4/Pwbb+10OXDvKx86z1O4Ah+vRGzw331H7HMm/4Uh5Of7VgASALNfCB5TuYSArygSU3
	9kwyrQjAi/TIJv0tEw9IQpwC0h/lBeApnHdGEWVa1D1RHuv9j2UJ6ysQ=
X-Gm-Gg: AY/fxX5K+LvaQiCJmtPPRJbMLqdMWLqQeX91g4KVWv3RDv9AXx6faWf/ZEgplT+9uTe
	4fRraDZLt3142oavHmwJ13t3oukjL+tJE2jQBzKMd0sx2kgYqeGS1iitOLwoaQZwFOsByWldj/Y
	q+QG47RsnkGgjle+D3qsrTTWwGJr783S61S83IoaVDxFUM02uVwdEyRheQEDZTChnQlgxg23vOa
	KS3b5oh6B79DaEb9vEqFRp/aiJ3/B3P3jdXwh/r1RkG3+Mw9u7y7UBoJIzGLEiypKXlZOOCPUIC
	BzcY7C+e+RWRjrG+cgOMtXjpbYsyVvkTb18iqQO5WkNZ6vrQ6ufst4qS6ONJAOZX56q/y3q9bFl
	42yXT056B5B6q2eiTtINRMvQFr4e5WavufSYGVwllindF5AJ2LLCt5e/2
X-Received: by 2002:a05:7022:e803:b0:11b:36f8:c9f1 with SMTP id a92af1059eb24-1217230253cmr1763322c88.36.1766117273426;
        Thu, 18 Dec 2025 20:07:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqkk44twSUCzkrLQ8Ga/BCjAF+FC+Q+Mt8L8qG5L4UArf0ZLcsxqXPVsF8N1/OcOp5kWp19w==
X-Received: by 2002:a05:7022:e803:b0:11b:36f8:c9f1 with SMTP id a92af1059eb24-1217230253cmr1763290c88.36.1766117272554;
        Thu, 18 Dec 2025 20:07:52 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm3985610c88.13.2025.12.18.20.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:07:52 -0800 (PST)
Date: Thu, 18 Dec 2025 20:07:50 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUTPlgTEDdH5kwkb@hu-qianyu-lv.qualcomm.com>
References: <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
 <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
 <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
 <aUP1TOq09gzmUGai@hu-qianyu-lv.qualcomm.com>
 <u5scdkfwygizo4rsuuciwsygkgl5danzsobbpytz7recuekfz4@yclft32plmoc>
 <hiamkja7wmhhwnx4jxuzq35gmwgiak5ekbijs5etex3zz6ijra@oravyeywzg5n>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hiamkja7wmhhwnx4jxuzq35gmwgiak5ekbijs5etex3zz6ijra@oravyeywzg5n>
X-Proofpoint-GUID: UXdH6dX5nkySD-2l-bwniI9afTTrQxvw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAzMSBTYWx0ZWRfX1w9f/L6MYnig
 PPEIjRzl5WwDqIO/Da1q6GXFIWPl2USLZ3Qgyd3DUNs4Ew9ltpWh2rAA0aJV+sBerFNWGMlGFGX
 1Nc3RP8jdpt7fgPWegIZ+HeUlM0vD1UmahmnNrQk389SeZoBqIckp8ccPir4V29tQo78Bs4HbEp
 7fiwh2FSFXFDESU2O0YAUwnd3bXZgRq4npwpgWl6qftmfkTGpqeQ0QWBhBrysSyaX4EZVtgSF0r
 YatS5yyAAAvQJHHM6e/1ndng5i6tmoPCau8RetidT/IlHcaYA8/7tuQYqCWncdSbcWBKMp+55PT
 ydX3Z1WVEb13NzAhxoc7mxaZq+WH4gocKq5W2DjtLHN1Zm4vXQhws0wzEPEIW0EgDjZZyj+IX5g
 JriaPB57+3+ZMfljbc7S80TEkJQ1j6s5jXe3+plVuEU96lUcb/ZPPppbDz4Ygdi+1VVetKnvzrR
 Q9L7UOdo7xjSWz8C6Sw==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=6944cf9a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HzDvWt4TOZ89CmuCxU8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: UXdH6dX5nkySD-2l-bwniI9afTTrQxvw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190031

On Thu, Dec 18, 2025 at 07:18:00AM -0600, Bjorn Andersson wrote:
> On Thu, Dec 18, 2025 at 06:12:37PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Dec 18, 2025 at 04:36:28AM -0800, Qiang Yu wrote:
> > > On Thu, Dec 18, 2025 at 04:51:18PM +0530, Manivannan Sadhasivam wrote:
> > > > On Thu, Dec 18, 2025 at 05:21:54PM +0800, Baochen Qiang wrote:
> > > > > 
> > > > > 
> > > > > On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> > > > > > 
> > > > > > 
> > > > > > On 12/18/2025 4:04 PM, Qiang Yu wrote:
> > > > > >> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> > > > > >>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > > > > >>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > > > > >>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > > > > >>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > > > > >>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > > > > >>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > > > > >>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > > > > >>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > > > > >>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > > > > >>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > > > > >>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > > > > >>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > > > > >>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
> > > > > >>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > > > > >>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > > > > >>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > > > > >>>>>>>>>>>>>>> authentication requirement.
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
> > > > > >>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
> > > > > >>>>>>>>>>>>>>> - Remaining: WLAN FW segments
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
> > > > > >>>>>>>>>>>>>>> headers in a single binary:
> > > > > >>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
> > > > > >>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> Download behavior:
> > > > > >>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > > > > >>>>>>>>>>>>>>>           2. Full image via BHIe
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > > > > >>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > > > > >>>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > > > > >>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
> > > > > >>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
> > > > > >>>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>>> What is standard about it?
> > > > > >>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
> > > > > >>>>>>>>>>>>> header and WLAN FW segment.
> > > > > >>>>>>>>>>>>>
> > > > > >>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
> > > > > >>>>>>>>>>>>> required for TME-L image authentication, how about using 
> > > > > >>>>>>>>>>>>> tme_supported_image?
> > > > > >>>>>>>>>>>>
> > > > > >>>>>>>>>>>> Just elf_image?
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> Is it too generic for this specific use case. Current image format also
> > > > > >>>>>>>>>>> contains elf header.
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>> upload_elf_image?
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > > > > >>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
> > > > > >>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > > > > >>>>>>>>> used previously.
> > > > > >>>>>>>>
> > > > > >>>>>>>> What kind of ELF image was used previously? Could you please explain
> > > > > >>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
> > > > > >>>>>>>>
> > > > > >>>>>>>
> > > > > >>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > > > > >>>>>>> that was a non-standard ELF image and the new one is going to be spec
> > > > > >>>>>>> conformant.
> > > > > >>>>>>>
> > > > > >>>>>> Previous image format:
> > > > > >>>>>> ELF header + SBL segments + WLAN FW segments
> > > > > >>>>>>
> > > > > >>>>>> The TME-L supported image format:
> > > > > >>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > > > > >>>>>
> > > > > >>>>> What is the Second ELF header in this context? ELF files usually have
> > > > > >>>>> only one header. Are we repeating the same ELF header or is some kind of
> > > > > >>>>> an embedded ELF-in-ELF.
> > > > > >>>>
> > > > > >>>> The "Second ELF header" refers to a separate, complete ELF file embedded
> > > > > >>>> within the FBC image, not a duplicate header. The TME-L supported format
> > > > > >>>> contains:
> > > > > >>>>
> > > > > >>>> FBC Image Structure:
> > > > > >>>> ┌─────────────────────────────────────┐
> > > > > >>>> │  Complete ELF File #1 (SBL)        │
> > > > > >>>> │  ┌─────────────────────────────┐   │
> > > > > >>>> │  │ ELF Header                  │   │ ← First ELF header
> > > > > >>>> │  │ Program Headers             │   │
> > > > > >>>> │  │ SBL Segments                │   │
> > > > > >>>> │  └─────────────────────────────┘   │
> > > > > >>>> ├─────────────────────────────────────┤
> > > > > >>>> │  Complete ELF File #2 (WLAN FW)    │
> > > > > >>>> │  ┌─────────────────────────────┐   │
> > > > > >>>> │  │ ELF Header                  │   │ ← Second ELF header
> > > > > >>>> │  │ Program Headers             │   │
> > > > > >>>> │  │ WLAN FW Segments            │   │
> > > > > >>>> │  └─────────────────────────────┘   │
> > > > > >>>> └─────────────────────────────────────┘
> > > > > >>>>>
> > > > > >>>>>>
> > > > > >>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > > > > >>>>>
> > > > > >>>>> pointer?
> > > > > >>>>
> > > > > >>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > > > > >>>> ELF excutable file, I can not point out a specfic sentence or phase that
> > > > > >>>> tell us the previous image format is standard. But at least there is an
> > > > > >>>> example we can refer to: Figure A-4. Executable File Example. And I can
> > > > > >>>> also use readelf cmd to parse the image.
> > > > > >>>>
> > > > > >>>>>
> > > > > >>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
> > > > > >>>>>> because we need separate elf header for SBL and WL FW for TME-L
> > > > > >>>>>> authentication.
> > > > > >>>>>>
> > > > > >>>>>> So the commit message stating "Currently, the FBC image is a non-standard
> > > > > >>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
> > > > > >>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
> > > > > >>>>>>
> > > > > >>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
> > > > > >>>>>> separate_elf_header and tme_supported_image are more accurate.
> > > > > >>>>>
> > > > > >>>>> Please define, what is the supported image.
> > > > > >>>>
> > > > > >>>> The supported image refers to an image format that TME-L can authenticate.
> > > > > >>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > > > > >>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > > > > >>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > > > > >>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > > > > >>>> TME-L.
> > > > > >>>>
> > > > > >>>
> > > > > >>> So what makes it different here is that you are now sending the two FWs
> > > > > >>> separately as standalone ELF image to the device for authentication by TME-L,
> > > > > >>> but those are combined in a single image file in the host. But what makes you to
> > > > > >>> combine two images in the first place? Why can't they be separate ELF files?
> > > > > >>>
> > > > > >>> I think you can avoid the hassle if you could just have separate ELF images for
> > > > > >>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
> > > > > >>>
> > > > > >> Yes, they are two separate images combined into a single file. I'm not
> > > > > >> sure of the specific reasons for this design choice, so I can't comment
> > > > > >> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
> > > > > >> I don't know whether they're willing to change.
> > > > > >>
> > > > > >> Baochen, do you have any comment on this?
> > > > > > 
> > > > > > Hmm, sorry, no idea :(
> > > > > 
> > > > > I mean I don't know the reason behind the design choice.
> > > > > 
> > > > 
> > > > Ok, then I guess we should try to get rid of the flag and just check for the
> > > > WLAN FW ELF header during runtime:
> > > > 
> > > > 	/*
> > > > 	 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> > > > 	 * file. Hence, check for the existence of the second ELF header after
> > > > 	 * SBL. If present, load the second image separately.
> > > > 	 */
> > > > 	if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> > > > 		fw_data += mhi_cntrl->sbl_size
> > > > 		fw_sz -= mhi_cntrl->sbl_size;
> > > > 	}
> > > >
> > > Hmmm, for the old format image, since the data at `fw_data + mhi_cntrl->sbl_size`
> > > is raw WLAN FW data, there's a possibility that the raw binary data could
> > > accidentally contain the ELF magic number at that offset, even though it's
> > > not actually an ELF file. This could lead to false positive detection and
> > > incorrect parsing.
> > > 
> > 
> > Really? How can the WLAN FW segment have the ELF magic at the start of the
> > segment? Then it becomes a separate ELF file.
> > 
> 
> But isn't this new format 2 concatenated ELF files? If so there
> shouldn't be any data at this position? It should be the end of the
> "file"?
> 
> The only way I can see that there would accidentally be a ELF header
> here would be if we're still in the middle of the first ELF - but that
> doesn't seem like the place to look for the second ELF.
>
For old format image, we're in the middle of the ELF. Look at the data at
offset 0x80000(512 KB), it is raw data of WLAN FW.

Old format image(WCN7850):
00000000: 7f45 4c46 0101 0100 0000 0000 0000 0000  .ELF............
00000010: 0200 2800 0100 0000 0073 7a01 3400 0000  ..(......sz.4...
00000020: 0000 0000 0000 0000 3400 2000 1a00 0000  ........4. .....
...
0007fff0: 240d 0000 380d 0000 3c0d 0000 500d 0000  $...8...<...P...
00080000: 540d 0000 a80f 0000 ac0f 0000 b00f 0000  T...............
00080010: b40f 0000 b80f 0000 bc0f 0000 c00f 0000  ................

For new format image, there is an ELF header at offset 0x80000(512 KB).

New format image(QCC2072):
00000000: 7f45 4c46 0101 0100 0000 0000 0000 0000  .ELF............
00000010: 0200 2800 0100 0000 00b0 8101 3400 0000  ..(.........4...
00000020: 0000 0000 0000 0000 3400 2000 0700 0000  ........4. .....
...
0007fff0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00080000: 7f45 4c46 0101 0100 0000 0000 0000 0000  .ELF............
00080010: 0200 a400 0100 0000 50f7 4f01 3400 0000  ........P.O.4...

If we know that it is an ELF image, then it must have ELF MAGIC at offset
512 KB. But we can't say if we find ELF MAGIC, it must be an ELF image,
although the possibility is very high that it is.

- Qiang Yu
> Regards,
> Bjorn
> 
> > - Mani
> > 
> > -- 
> > மணிவண்ணன் சதாசிவம்
> > 
