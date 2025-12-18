Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEACC191
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061395; cv=none; b=CxxUmM2F+gGvqXIonTluZEmMQmGKJjqUIUPDRbuIoljPh4nD9emHDqp+jlibRURVOa43/MQlqLplJThjUCcdV9fGAIZb4ORIgHHiX5QlP7tQ30qzdlYVANvne1CBSVZ4YcgukY812mioaZN6e4gBoyexpaN+/A7M/BJKySIS7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061395; c=relaxed/simple;
	bh=N6Fwu/02jHGWILxP/x075uFHRVTsVFTEP+T4nuGJIyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0SNkeKtcWh+Mh2ej1WcFKZChwglI9z0pMsV+jGVgc/4cGYzDsfOLx7qiJ2S0u4It+vJ1q/OQ8Kw8STBWr17rVB+g68atCeI+jIkAp9VbAa7lVv3qYrAY+G+fE7Laeu37dNZdnOyjXELFdhJmq5yZmrmCVLmY2KEgMVm9C8+3RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuAFF9Tb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTK1cIP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuAFF9Tb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTK1cIP7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB5LWt1334757
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 12:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWStINO8VjIt2tkQ9MDDp1GNmAfTbmSuVdib2TxwRHA=; b=TuAFF9TbBl9yIRlF
	S3QmHcdPSuOCcK+EVV2ctOkArzrqx5l07acmcA0KLvMgSHzQ4On0ohcQgvi/dJvs
	fzaMMoycMUQkqZynecIYVx8xFIyZQOJBsMEmSejWMc6DxvB6BO4yuJR6qLSMeEpw
	c6kA/6Z7vem5FKjLYDIo1+PzbgSKdYQrB2W1Pge4zK3d4hCdBhtQgpGnveU4z6QV
	h7eLma6sop7WDi85bL2N5X3GjlXgI0oGy+cD00yQc9WaA5WBRTLcBalrG+aAOmEE
	tI77Zrc55ZcTFWnBMIX921ElQ2gGFvric9jjHRHVyVKdFsbDZnc1bjNpjh/XCbsG
	WzaCUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec08s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 12:36:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b609c0f6522so999870a12.3
        for <mhi@lists.linux.dev>; Thu, 18 Dec 2025 04:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766061392; x=1766666192; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bWStINO8VjIt2tkQ9MDDp1GNmAfTbmSuVdib2TxwRHA=;
        b=XTK1cIP7i1gQp3o5ZAMVKEcN5QtQ2u28s+1bnTUUrtnLjNKuQDXcezL3KV4hsugQr0
         MFVWgKCMbGGrAC/PrjWzRCPuotsNeqtlNQoR7t/Qr0DyhO+nHmguhptvd2XvtAbL7Pfr
         rV//krZUxzDK8WSAn2UV5unw8XXkfY4R0DLmG0Bn0MD4aOxpQ1UPzokSY1Xdz0fahdAE
         Vv8nTJua0kxjc0s87pSfWyFGtQhNffKXcfjYejbg+K7TfBKKhH6IbZaaHFi2x/54iXyS
         +cwKbYF9d7tDP5bDicIj70ybeYchtD+Hw9OTsXyU3gP70iyHxLxgkUeHckZVjnJ07jxF
         68Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061392; x=1766666192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWStINO8VjIt2tkQ9MDDp1GNmAfTbmSuVdib2TxwRHA=;
        b=oxpF8wx8IHFuwGYn72nbWpjfAIrU3PqxoWyFd0UALjUVd9nXKBQl4Vy5FZv/8Lh6oz
         H8BOjXL3oJ8LPTwWICSckN5RyY+Y5ra414U0ulS8zUw7N3ipwFy00350EaY6MKW5u9lv
         U/3Q6/r5NkHkPrQWYR/s4GdkY3SF7JyI7ppkjnY0P3Z00LI3IMhkOQBqsr1dq0JPKptS
         QDjF84x2J+XmZSyduD3UlRYdo5P+pTcVWbWMII0ATPVUoe+V5OixZqaDVylg3drLECgO
         399G8zBLQGQlS56S7YLK45d2znpezNzQctXFTZizn/TigNyfKygK++fPCOvO528OsF4/
         mcaA==
X-Forwarded-Encrypted: i=1; AJvYcCUepIj1ABfjz93LlCeFgZm5r+Y5o2P5FrNXfVIRvINLv4+iBANzV9SXE9OZL9W8uVoBg/M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIGH08nGKTRP3h+SaVutQBK2pFe+PjN5DGBr5asoLwJteEamea
	YtzGqeV99t1PNYcunj/M7pLEVHehGEywDHlSlX8dzses89B1yxRDRpRODN++69nd2Rj/yTE5yoT
	X/eFHx9x5T9uGVTVdVNYRlOksk+guwX434HB2QL5+/8Slq4wfNFcui9g=
X-Gm-Gg: AY/fxX5CZEWmslXHpvjmVMv+yv1u0gkHTRenef9qRmlQCsZ6B4nwha/kssGcNCrdldJ
	fh2FWrhcFQgGMIjOdF/f7Ec7ZMZrjAC4anB0w6KA7A/eHBvtTw40JFTuXh6Rrn4+vg/M95gmSZk
	Jg7QCTNl40fLqbVMchCZw8HFb5X0vwFhI/1ntUW9BGDBC/Z9kynoRq9Gdm/TLuKIzbhZBdojXgw
	PVXrpCj/STurGVLuDKX7dKg0ZE7egoAixc4T+CJOpOZrAP4u216BNu3eNn4pMPVYeiIPavWLNyL
	c/RIz/ATL1hIV9bi8dFxc3JCS74HgDib+976rGcv1d2SJWcZTyI8B3K1TYaBlLjbMRYBMy+OvCg
	xg5VriJjocRwiqsHc2xLBs3DPLA/ZC9KYENP3cT9TrsbS1YSvp1il1gKa
X-Received: by 2002:a05:7300:511:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2ae4f618aa2mr8420756eec.36.1766061392218;
        Thu, 18 Dec 2025 04:36:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+og9GRk2PIzggAQXSMRM0jx1IQRNbD2oL7bNLCMah3e2fNFBiifZMT/Vg56MpTdLwjFGKVA==
X-Received: by 2002:a05:7300:511:b0:2ae:4f61:892e with SMTP id 5a478bee46e88-2ae4f618aa2mr8420685eec.36.1766061391019;
        Thu, 18 Dec 2025 04:36:31 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d83esm4850017eec.5.2025.12.18.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:36:30 -0800 (PST)
Date: Thu, 18 Dec 2025 04:36:28 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUP1TOq09gzmUGai@hu-qianyu-lv.qualcomm.com>
References: <gc2phr73ai2or5auu6rju2qbszrulk74rnft52ldmu4b4tot5r@xfoclkhrlfl3>
 <gcyjhnn33xcuiqfmiqt7diijncovp3smcnncyvfsnwo45v5z3m@plbtdjbxksgr>
 <aT+0RqCybM730hPY@hu-qianyu-lv.qualcomm.com>
 <7nhlxp6gxk2tkuzh2rogywp6ko4n5nkh6ih2uly3zsskmi7wpp@7weahfg6gksm>
 <aUEXwbuTEvV7Y6I/@hu-qianyu-lv.qualcomm.com>
 <gpfcofdq3yhudisyhgu5r7rjwc66bxdjvbj7vyyrgby77uxs5u@mfkxgck3ll6y>
 <aUO1k06T3YUGX7kV@hu-qianyu-lv.qualcomm.com>
 <84b14cdf-8549-4a00-8dcc-bb5bd1918cfe@oss.qualcomm.com>
 <3427ac3e-671e-4c5b-99aa-69eb7927df8c@oss.qualcomm.com>
 <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <chdnee7wgjv7mgnikistr5pgee2i3unah2dw2ypbllbfzkqjlr@iizwiggs6ux3>
X-Proofpoint-ORIG-GUID: P35OEsB__9hj9Ojes-fbC3GC-R6om2iA
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=6943f551 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o9eNwZ9_oFxu2MQNvlIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNCBTYWx0ZWRfXxDpdNLeFII26
 UTYF4Nkfd1B+AoDcnFmUy9C4KE33QU+7iujBTYxvEWl76tYTCfjnz7+w85tXGKqhhUlm/CCOgOm
 AUTDgEB68CMxQrGloOdxUHe/JbXC7hwqoAdbtvYIuYTNypGFKQHcA80y6IfLXqIzipoJ5sA7ybb
 E6iNwKIJ2h48sc+pi97EL6S32CAWGBQNNlV+w9m5Op9WRsGyC/hgo19FlG+ikiKhLHzdSJLerMB
 o3rSuNvk6Vr7G0n1qpmkwXL8qS0EQIPuP2FsUoMw0f6rAudZ2bD223OWgG+HhAO+FQR0ZGcNjoK
 QyldJ2eojz/oY6dfL/QWVOF5aHBNWDxVN23jAiEBD6pkNKeFsCO3Hn3Zg1nHE5we9hJd3XoJN6O
 6elRPMLqK52m8etDtRL1+dFpo0QEbw==
X-Proofpoint-GUID: P35OEsB__9hj9Ojes-fbC3GC-R6om2iA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180104

On Thu, Dec 18, 2025 at 04:51:18PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 18, 2025 at 05:21:54PM +0800, Baochen Qiang wrote:
> > 
> > 
> > On 12/18/2025 5:13 PM, Baochen Qiang wrote:
> > > 
> > > 
> > > On 12/18/2025 4:04 PM, Qiang Yu wrote:
> > >> On Thu, Dec 18, 2025 at 10:25:08AM +0530, Manivannan Sadhasivam wrote:
> > >>> On Tue, Dec 16, 2025 at 12:26:41AM -0800, Qiang Yu wrote:
> > >>>> On Mon, Dec 15, 2025 at 08:41:32PM +0200, Dmitry Baryshkov wrote:
> > >>>>> On Sun, Dec 14, 2025 at 11:09:58PM -0800, Qiang Yu wrote:
> > >>>>>> On Sat, Dec 13, 2025 at 11:21:11AM +0900, Manivannan Sadhasivam wrote:
> > >>>>>>> On Fri, Dec 12, 2025 at 09:24:06PM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>> On Fri, Dec 12, 2025 at 10:07:01AM +0900, Manivannan Sadhasivam wrote:
> > >>>>>>>>> On Thu, Dec 11, 2025 at 03:57:54PM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>>>> On Thu, Dec 11, 2025 at 01:37:12AM -0800, Qiang Yu wrote:
> > >>>>>>>>>>> On Wed, Dec 10, 2025 at 12:57:11AM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>>>>>> On Sun, Dec 07, 2025 at 10:35:26PM -0800, Qiang Yu wrote:
> > >>>>>>>>>>>>> On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> > >>>>>>>>>>>>>> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> > >>>>>>>>>>>>>>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Currently, the FBC image is a non-standard ELF file that contains a single
> > >>>>>>>>>>>>>>> ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
> > >>>>>>>>>>>>>>> (Trust Management Engine Lite) supported devices (eg. QCC2072) requires
> > >>>>>>>>>>>>>>> separate ELF headers for SBL and WLAN FW segments due to TME-L image
> > >>>>>>>>>>>>>>> authentication requirement.
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Current image format contains two sections in a single binary:
> > >>>>>>>>>>>>>>> - First 512KB: ELF header + SBL segments
> > >>>>>>>>>>>>>>> - Remaining: WLAN FW segments
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> The TME-L supported image format contains two sections with two elf
> > >>>>>>>>>>>>>>> headers in a single binary:
> > >>>>>>>>>>>>>>> - First 512KB: First ELF header + SBL segments
> > >>>>>>>>>>>>>>> - Remaining: Second ELF header + WLAN FW segments
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Download behavior:
> > >>>>>>>>>>>>>>> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
> > >>>>>>>>>>>>>>>           2. Full image via BHIe
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> - TME-L: 1. First 512KB via BHI (First ELF header + SBL)
> > >>>>>>>>>>>>>>>          2. Remaining via BHIe (Second ELF header + WLAN FW segments)
> > >>>>>>>>>>>>>>>
> > >>>>>>>>>>>>>>> Add standard_elf_image flag to mhi_controller_config to indicate TME-L
> > >>>>>>>>>>>>>>> supported image format. When set, MHI skips the first 512KB during WLAN FW
> > >>>>>>>>>>>>>>> download over BHIe as it is loaded in BHI phase.
> > >>>>>>>>>>>>>>
> > >>>>>>>>>>>>>> What is standard about it?
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> The TME-L requires standard elf image format which includes single EFL
> > >>>>>>>>>>>>> header and WLAN FW segment.
> > >>>>>>>>>>>>>
> > >>>>>>>>>>>>> The "standard_elf_image" seems misleading. Since the new image format is
> > >>>>>>>>>>>>> required for TME-L image authentication, how about using 
> > >>>>>>>>>>>>> tme_supported_image?
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Just elf_image?
> > >>>>>>>>>>>
> > >>>>>>>>>>> Is it too generic for this specific use case. Current image format also
> > >>>>>>>>>>> contains elf header.
> > >>>>>>>>>>
> > >>>>>>>>>> upload_elf_image?
> > >>>>>>>>>>
> > >>>>>>>>>
> > >>>>>>>>> Nope. What does 'upload' even mean here? The 'TIS and ELF' spec v1.2 clearly
> > >>>>>>>>> defines that an ELF executable can have only one ELF header. So I'd prefer
> > >>>>>>>>> 'standard_elf_image' to differentiate it from the non-spec-conformant ELF image
> > >>>>>>>>> used previously.
> > >>>>>>>>
> > >>>>>>>> What kind of ELF image was used previously? Could you please explain
> > >>>>>>>> what do 'First ELF header' vs 'Second ELF header' mean here?
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> I don't have the details of it, but Qiang should be able to explain. But AFAIC,
> > >>>>>>> that was a non-standard ELF image and the new one is going to be spec
> > >>>>>>> conformant.
> > >>>>>>>
> > >>>>>> Previous image format:
> > >>>>>> ELF header + SBL segments + WLAN FW segments
> > >>>>>>
> > >>>>>> The TME-L supported image format:
> > >>>>>> First ELF header + SBL segments + Second ELF header + WLAN FW segments
> > >>>>>
> > >>>>> What is the Second ELF header in this context? ELF files usually have
> > >>>>> only one header. Are we repeating the same ELF header or is some kind of
> > >>>>> an embedded ELF-in-ELF.
> > >>>>
> > >>>> The "Second ELF header" refers to a separate, complete ELF file embedded
> > >>>> within the FBC image, not a duplicate header. The TME-L supported format
> > >>>> contains:
> > >>>>
> > >>>> FBC Image Structure:
> > >>>> ┌─────────────────────────────────────┐
> > >>>> │  Complete ELF File #1 (SBL)        │
> > >>>> │  ┌─────────────────────────────┐   │
> > >>>> │  │ ELF Header                  │   │ ← First ELF header
> > >>>> │  │ Program Headers             │   │
> > >>>> │  │ SBL Segments                │   │
> > >>>> │  └─────────────────────────────┘   │
> > >>>> ├─────────────────────────────────────┤
> > >>>> │  Complete ELF File #2 (WLAN FW)    │
> > >>>> │  ┌─────────────────────────────┐   │
> > >>>> │  │ ELF Header                  │   │ ← Second ELF header
> > >>>> │  │ Program Headers             │   │
> > >>>> │  │ WLAN FW Segments            │   │
> > >>>> │  └─────────────────────────────┘   │
> > >>>> └─────────────────────────────────────┘
> > >>>>>
> > >>>>>>
> > >>>>>> As per 'TIS and ELF' spec v1.2 Mani mentioned, the previous image format
> > >>>>>
> > >>>>> pointer?
> > >>>>
> > >>>> The entire 'TIS and ELF' spec v1.2 document descibes the structure of the
> > >>>> ELF excutable file, I can not point out a specfic sentence or phase that
> > >>>> tell us the previous image format is standard. But at least there is an
> > >>>> example we can refer to: Figure A-4. Executable File Example. And I can
> > >>>> also use readelf cmd to parse the image.
> > >>>>
> > >>>>>
> > >>>>>> is also standard elf image. But it doesn't meet the requirement of TME-L
> > >>>>>> because we need separate elf header for SBL and WL FW for TME-L
> > >>>>>> authentication.
> > >>>>>>
> > >>>>>> So the commit message stating "Currently, the FBC image is a non-standard
> > >>>>>> ELF file that contains a single ELF header, followed by segments for SBL,
> > >>>>>> and WLAN FW" is not correct and standard_elf_image is not accurate.
> > >>>>>>
> > >>>>>> Can we avoid saying anything about standard in commit message? Flags eg.
> > >>>>>> separate_elf_header and tme_supported_image are more accurate.
> > >>>>>
> > >>>>> Please define, what is the supported image.
> > >>>>
> > >>>> The supported image refers to an image format that TME-L can authenticate.
> > >>>> Both SBL and WLAN FW should be in ELF format. After powering on, SBL (ELF
> > >>>> format, ELF header + SBL segment, first 512 KB) is loaded over BHI and
> > >>>> authenticated by TME-L. After entering SBL, WLAN FW (ELF format, skip
> > >>>> first 512KB of fbc image) is loaded over BHIe and also authenticated by
> > >>>> TME-L.
> > >>>>
> > >>>
> > >>> So what makes it different here is that you are now sending the two FWs
> > >>> separately as standalone ELF image to the device for authentication by TME-L,
> > >>> but those are combined in a single image file in the host. But what makes you to
> > >>> combine two images in the first place? Why can't they be separate ELF files?
> > >>>
> > >>> I think you can avoid the hassle if you could just have separate ELF images for
> > >>> SBL and WLAN FW and say that the TME-L just expects individual ELF image.
> > >>>
> > >> Yes, they are two separate images combined into a single file. I'm not
> > >> sure of the specific reasons for this design choice, so I can't comment
> > >> on it. The WLAN team provides a single file for both SBL and WLAN FW, and
> > >> I don't know whether they're willing to change.
> > >>
> > >> Baochen, do you have any comment on this?
> > > 
> > > Hmm, sorry, no idea :(
> > 
> > I mean I don't know the reason behind the design choice.
> > 
> 
> Ok, then I guess we should try to get rid of the flag and just check for the
> WLAN FW ELF header during runtime:
> 
> 	/*
> 	 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> 	 * file. Hence, check for the existence of the second ELF header after
> 	 * SBL. If present, load the second image separately.
> 	 */
> 	if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> 		fw_data += mhi_cntrl->sbl_size
> 		fw_sz -= mhi_cntrl->sbl_size;
> 	}
>
Hmmm, for the old format image, since the data at `fw_data + mhi_cntrl->sbl_size`
is raw WLAN FW data, there's a possibility that the raw binary data could
accidentally contain the ELF magic number at that offset, even though it's
not actually an ELF file. This could lead to false positive detection and
incorrect parsing.

Maybe we can caculate the image size by using the info in ELF header? The
old format image size should larger than 512K.

- Qiang Yu
