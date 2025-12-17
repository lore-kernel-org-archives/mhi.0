Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1702C08C2
	for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995525; cv=none; b=hqpMbN8KlXijI4IwC7mWTtuu3SkvkXhRD2eV1ATO60oCy9r0n8l+kNVVjx45y1pfrk1nsfkhZ2vMdbPss9lfLGpz/I26nU3OhkyiQzSMVkM0WZ4FlXlgk66nvr5VFebVROFsXsiKDWuG4ue/aoe+ZIbPwJVFZ9ZZsWt/n2kzXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995525; c=relaxed/simple;
	bh=KPCoPks2Y2/j+fWOc0DjbN2flfAgVDX5MiFdzCmlPxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhYk1LNV18D35x8a19hJkeGUQk5TNBnboPbDNRZFTM1qHCFW/FD1CcmfdTPIL1oUug7IZ3m/f/t2lgGeVXuuPGjBw3pX1SOs8mv6gLtJDbymoWLQrXs7hFuR3H7VGd2MiPX7LAYOhIHvyxzIwNVM2GJzGq+UnWu+u4BTIzCJCkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX0FTlGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlXf8Lm1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX0FTlGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlXf8Lm1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHHMtFf3981381
	for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 18:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=; b=XX0FTlGhGcl0GgQl
	ByTU7cTPlDPk/BXambHGMBBrAFNZaJfIcs6xA6ew4ZJ9tR7UJQS+gqePcy3CuHsP
	vAotqv37mohmAfVk+eAvIYj7rZG2V0YacO0NNdP0m9w3yE0WWFoEoPEvo6maf4xs
	6DWw+J4IIVBayH2jAWjYTnjijGyHuVPMpR0JkPMA9P0/h03K2SoFh/RKObvRsWpV
	eE00BccsGUxbyFdW7MIQrXSXW3cfy70VmIAoj7vErrMdAHU142riKXQR00XrVdgA
	bnC0PryPEaCZPZzqHVwAwn49yCO1jVtKSjP0r7hhODK19mvYysQxYak3xA0We1cb
	FKeYhQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v785p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 18:18:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso12689723a12.0
        for <mhi@lists.linux.dev>; Wed, 17 Dec 2025 10:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765995517; x=1766600317; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
        b=FlXf8Lm1i3bQvnH+iC5DaIO7aqe9c4N0mLZox5qJ66cdEihzB0gqe+5SkNFp49PhCu
         A5OKGMStA5zG7xCQgdGlA31sgsFmJukNbl/QvRUKkDDahz/sittyrdxYsK3QSrU3mDfb
         gKA/mVFO2FSmOcy6q7G0BFOyN7t4VkE3ew1FgdD6RVNF4YzDkrQX0Owom/QVMu+/yw3K
         ykyTj+m7/aL6DjE3FqgsByM0d0GFg8eurlpwsiud/K/RhUfqJqSCGufRtr4r5LOqk+n4
         JkBYA3JWj9j8RUM5G90CvV1iG1Oi0/jyNmXTkTHFQxYJchZCjy6zc3a8kTq3WTtCnT2S
         N21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995517; x=1766600317;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
        b=HqcFEc0UGhmhL3b5f9de/sm5zRVDpkDmATXOdMgjQdZ+B/wIBvfNeBeb9GSkvTE/7U
         mLGaRxHykiSi2wSrm3TQdEUBTA7TqxZyI5Zax7ymUDGXECAhpiL2vcYWJ74HTQ2oE57O
         E10dnORTTxkO6x9e3MNNhaCdnQEGM7FrNrahoPbrO2ClfBy901zTuFfPOjuqgrWz+JjC
         V5pcX6W7apZsblwhaG1CbfwU8iQ5oAmRyqQsyQ1ryD+BdMxOYEniiMksLamuFUsFFNYP
         epfi+PBAoZrmEeTb0O20ZXeCei6vw+Sai0nZY/dc+LuPhHrUQYpe8tvxdu0nWoB9gZKD
         //Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVL5NdwZ70YNqwIYkjhWtu8EYZCwUcn2rIkYPuMs8AmE2K+Nfahcd1GsvP16cxpOziUyn8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/do8l1u5iADnSgWU5LcOFjTSB4ZtlXpSVCu8YJSlTBPdJGIUX
	E2fCcjM1TKQwCvrkCF1gfps63ENoSymKii5ZnzkZ57FUzgkxbRzHc7sn1EKY84V+lHFrprls4+0
	tpWLGmhDL9L1FTJShpOlXk1zOTkVSLpveHegw2H6UfH898I/NyXKYsUw=
X-Gm-Gg: AY/fxX7T2PkxbEAivjBi9VwUOZ0+8Q0a7/v1GAZ9EuvbcbUnsqdxO4tv1OlVvc/YNw7
	J/jqaO9dQ59bjy6DQ9DoTuwQ2kvAnfaDkC49BthSBP3U5EUmmfqu8zQ4e7wAV4NemZYdKWDnXkC
	I3B1t2dwohPFMUF7aJl/XHUHQyNkD/sbxoj/Z4T4uYN3U7f9ovA+b79HtIrJW163ykc8ZZPgRCQ
	93ae+gQefYGzwoSobdyhd/yl3dgHbtb5uSFWbYM/vMvcgiitPJLPCM4YK19rl0fxEb727vloX4M
	398hN0pPBMExgFogZmTLG+sD9IGL6NuFqN+TWaDZgEMelv1kBj1b/DB2R77ai3cYdMoqOCQDwKF
	HdYee3q6FDWUEE0+F6Au1SvdFyVaD1ASadRck4iWR7d8o/ZIMtmc/pUceTKjgcxyVSit8Bg==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id 5a478bee46e88-2ac303958camr10594087eec.39.1765995517144;
        Wed, 17 Dec 2025 10:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6ScF6p2dbGaIAlfPTuofAf2/eZTtk6ONOKBGl/Qm27pAQp9ttnZa9kTtvsKTJrPW0AuH8SQ==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id 5a478bee46e88-2ac303958camr10594041eec.39.1765995516561;
        Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a93616sm517453c88.14.2025.12.17.10.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Message-ID: <5e568034-20a3-4ed5-a8e0-c010e5aa7b82@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:18:34 -0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
 <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J_tkhSXYfNiEy2o0Y5Jpu_LIPtN1XUbP
X-Proofpoint-GUID: J_tkhSXYfNiEy2o0Y5Jpu_LIPtN1XUbP
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=6942f3fe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE0NSBTYWx0ZWRfX+jccZryfMJps
 oYz9oxbl5IsWDcEPCMst+GyXY7XQJPNNGg1jbo0POxE1lxSyyTENnfG0k4SKpmL3d/E/D5CcgDW
 MyFMCHHk0zhXLYrs1Fk5rZz8gKPJdgybW9FAmZEvGslrc5oJvkmFmili522E3GevrwoYSkKdntt
 yj5VKep4n6TTDIZwDhM4ddmvuixZQ1/4lP7/pOjD2zsYUeqZuuAl47wtlJmH4mOk6xXFRaE3ZMh
 GuQKbMtHs3WMnH1DdkWTXSFafYMmJ0RjR8O2aWRRGMosNwQNii1hmF6UtVSz38Q6bAlZn9eIQoZ
 lEK/4+Id15pZqGzBvTupZT87UzEvmKyWvsmpsvvPEwO2jijzl/j0LjF8uGiZ0JANMm/UHhDM1CA
 bTjr9OvkfYkQW2gPJEaTpvQKdVXF3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170145

On 12/17/2025 9:16 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Cc: stable@vger.kernel.org
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...

