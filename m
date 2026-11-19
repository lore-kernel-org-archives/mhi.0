Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093018;
	b=kkg0jaGVoH4RpjyMfCdVcaWztvIp+fICvQYuBxvEqb90HJWoPP1BBmY8+ojZnkzjcsJS
	 8OsKdkJ62lywBjNKGZYt1XaR09mTssgjmLkiHCEGJ6PGXLCvl+6ONWJCbfUhh3FgVw3Ar
	 ookMwNVzw1hCbh6AOPylADUJ1hgOjb9UcScLLxVIVksvcZIwu23xMCTo4lHarKpIjycyB
	 xd8tEBTevVENJbKGHoIaPZ/RTXcH4md/bZMsuQnp+gjwenLXQP8LCwRHDJYhgA4SLW+LA
	 /d9u+/FVhoXlHWejuDd4diN6fIs/vrGTbQ2B5QXc3nZaDygyugXd+6eQy3rC9E6/WCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7UUr3XN27pzO9qr9ag8ZevkfZdqCw2bsfUtTHzErF/Y=;
	b=2EbIJRdJvhRvn23k0+NojFT9RHa53C+WzeUWlnHpZzzOFx8bI8iZLeabulsntNJ6WB/4
	 DdAJpS4jqqXyBr9R7bpH/qUq/CVVO0OxSnA2V8UdJhfvQ0iNp2a5Dx9RmncBxxmHazq/W
	 lPgZQfhWydUgtkXP9NzhxZWGzhqMbastJx5UvJ5YOL61d2dE+ihNmFumpLjMKlEZhA4or
	 r4stDMMq7mUY+lzOXi4icZcT3gT2SjObTmnZ86hjCXd+he077aVWgn5ItoX6vM0Ao9iIS
	 QiyPvs5zcJgU39pXcxn7Qri2xEFrmfG+SBaw6ryJYsSE0AXm2YsHKR8tUSjQDgNMU5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIZblRxw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhNSy5RL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E348606A326
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E348606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIZblRxw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhNSy5RL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkBu82331732
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7UUr3XN27pzO9qr9ag8Zev
	kfZdqCw2bsfUtTHzErF/Y=; b=fIZblRxw+YcbxmWXxefDMZ1IdOlvw+Oq5LrSRS
	UV0ELhvK3g8yiaZCO16jmILsOD7v1KiJ5Cz+1goYH+Hism7jOua9/65uq0oWWzR7
	gAX3+YSgl4d8eWnUy84vbNIrnAdSeE3tkYe4VTpz0a4PKXJPpgjJGvScFovx8+XJ
	mSlgUlba+axpCkevFm6iTZQvx1LtTNUMPscxqfLNNIOF+NxQmdIkRmY6RA5mV1Yv
	ogMSuPD5hWqVbszDimYUNgdpdDg/veoDrQv/bsgeBt2ua/rfU6M6GpMDzmzK1Dd2
	xIxusONtuMyxCb3bz/fkRkodMff5uyPzuICwd6tVBc4FlFgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdctvdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:56:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so692687eec.1
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093015; x=1795697815; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7UUr3XN27pzO9qr9ag8ZevkfZdqCw2bsfUtTHzErF/Y=;
        b=NhNSy5RLbnFx+4fmh3CbGZB8Fk25y/2bRKaNtUSRrdLOiuFd4OGhybwxovgNO2i6aD
         04atdyEGSPrHbkChmRfc1PWCR3an0G8RY1rgrKKrTkLJVpfJHCzkgXtTfXyDeGpM7TpT
         xsy+Z38S1hSqmloFXBzk5A82FASouM0JjxSMQg1taMe/KxCnm64OGx9H3BCZ7LVi5+ld
         +B+03m9h41lSXrNBW5i/KiZj3Jz2dCLNDpgFwSO8L+uYwVMyInl4WKA6yMbJfot+pSWE
         PlSkW7lwzIlpMtAwOOWp7B1nCeN3avcbeRhRlCVcFyVLYKhD15Uy+ASt9Esx1qxUYKA0
         1jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093015; x=1795697815;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UUr3XN27pzO9qr9ag8ZevkfZdqCw2bsfUtTHzErF/Y=;
        b=LWvofte2UrEwEZiZJmoXrWxVHDAEwJkMlNtqFUkHLs+CsVcfAFn3cvgh92VphaohDv
         xmGTHTIfjQfdcrL9OWn4XFpUzdgrgpSz/Jm8BuY6wIIGhz8KEhtD+dCO1Gl2W07OX+kX
         W9mry1oNHu+nZ52scaKPiLJqJ9aZRFo0fnBxqHAbBYZaQoZjQDTQ1Flrpj0wi4rO5zAy
         gA300h9Hq0RuV5GWzXW9vLYrUjZWfDnIAhfxvDgSHRaLrzDsmxUghS+7AtNXlliKg66I
         eubRCI2jQm1/6LgZIiMfJYzcLnWSMe2ntuLKNOU6p8BR50blKwrsK0cDYs9CkGPPz4DB
         rV9A==
X-Forwarded-Encrypted: i=1; AL+hErEQFbe1983mZbc+Wr/FrsBoGJYBYtmH9yzhNlggi66qdWHaLcCJFA5N5qXD/vqNdWsk0A8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8tbxE/HRD99lUTHvr++ZKe/0HaM6K5qhzhdXoj8myZOLRvbkSF
	Ymp2H1BJRL35Tm1fU15CTRndO9Bx33DWuhCpyTJwlwAm9rsF0LveFtUOW7As0sbWSWWxkJOJu2q
	B8/QhWXyS48LOGMDE4DhOvDLyZPFwpZhdJyfl8jg3y6Vi+EfliGaH3PJjyyrCXpQ=
X-Gm-Gg: AZFdTZfHXnsbSNzMTZuXpcBVnRkuaJY1gPpTlZg9b6gfRadgpfTGTGopb01ZBg0+W9u
	OStMTfFZ+MxsIZSfBCZw79nHcIGG4VVUeGJmSHGXC54lN0Bj+FM1ieG2cbzVyyOHZT8tioilOkS
	OFij/sO0PyXvD3vYTmNmq70ai7dg40H2fGs4UvzVCd4CU6VebhtVcgdZc9fO+MjWdDFDdsN0JR6
	i/OZ3UI9MtNBAgZCP/9f1WnkkP67oAtakfi0rxifFFtAIBA8ObXO1Ee0h11SBeXV6B/5LLkaeXO
	BCjQl5C4T7sMur3mVHa38YVjTKI7rpesN4vYnxoKh3BEIBukaWldBGAJima1bCW3Bu6mEaPgnEl
	HC9Wkhy1Li6p16rjy+eWEqG661y7ar49a8LaHW+PMbQJvZiXeWufrdo4xQ4+pwd9KnI+QwEDNOF
	3eKx/+DnVe
X-Received: by 2002:a05:7301:710e:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3827db0e75bmr5822772eec.2.1795093014714;
        Thu, 19 Nov 2026 04:56:54 -0800 (PST)
X-Received: by 2002:a05:7301:710e:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3827db0e75bmr5822743eec.2.1795093014062;
        Thu, 19 Nov 2026 04:56:54 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:53 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v6 0/7] bus: mhi: host: Add support for mhi bus bw
Date: Thu, 19 Nov 2026 18:26:32 +0530
Message-Id: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAHy/moC/22QzW6DMBCEXwX53EXYxjbklPeoqsiYJXHLX7xAG
 kW8ew2JemkvK412/M2sH4wweCR2SB4s4OLJD30U+i1h7mL7M4Kvo2YiEzoruITqRs62CLmUpsy
 U1dwqFt1jwMZ/76T3j6emufpEN23PX46A1zlGTE8b65DI7hGHZA8wWQGj82Bp7CDiYJGQga5qI
 3LFTa7x+IWhxzYdwnlj/iHknMNE7jT5uLr3DhYBHHQjVGNEWZhKHgei9Drb1g1dl8bBtroXT9M
 Q7vs/LGpv9zq5/D15UVuZGq0pTaEraf5Brev6A+HTLd1UAQAA
X-Change-ID: 20260813-bwscale-4337905a61a5
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Val Packett <val@packett.cool>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=8369;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=VLNJ2kNApRFQWIrk83A8PXfiyUmEUbUCCAi05AM4yws=;
 b=6+3aQtRYO/NDo5yufRI/VM5N4TNOxJx1y33gBzQsDLWAW9C5IdDC8tcdJIlGDVAMqzDn+aI0V
 IhBUI4LzZ7ED9/GfjEdz4FnSLbr5HtMRG5ccl3AuIfRT0RAoQMUceL7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 01R2PRMzKcOQxfiDXPg80txYPAtrPQcx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX1xAfJqIJKpVT
 oua7Rp4ftKm5h5a/bc2Ft1fBRFzGa0BXzhuc8WWrWhG5YJPQ1O39ybQN4TRb9qJc/b8OCvbNrjl
 I9k1C2N0VO+x4fRjYASGdYMiKm2vXa8=
X-Proofpoint-GUID: 01R2PRMzKcOQxfiDXPg80txYPAtrPQcx
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afef217 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=1XWaLZrsAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=NufY4J3AAAAA:8
 a=JfrnYn6hAAAA:8 a=oSm90M4pHhn_kxORmmIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=TPcZfFuj8SYsoCJAFAiX:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX1PNPKkUhuCtN
 vbXDTXq5OFIGBv5S8gnaVoGEsu0Pvdf/viX6IELd/AZQvO0+Tbc134PEfIqBaxzlMqbuEb5Q0ta
 Jzk0/RW1acXKmpu84X6q7HINkNAaNhaSc5xvv3MmIMmuCIunQ4oEGz4H68HvjW55GOFqBxxIVVv
 oTuX6rHF0UMjW6xmxFcv0d1kBZ1dW6RHfmRzOShQMccBSpfoAAuWOxDyWlyzxy5y6hk82hAI9RT
 e3KtESlFnvqrPwjGOdEh57XeQXSB6zIBdfs5NZzg1W/6xvqVTs+oW7ckinMEnLHEjV4IeqsKAH2
 w/RIlhzWzwS8XFxGVRDbbFOZqsCfPINgDVC5b00hTwGytDHdeRx2M1oTM9fWNCuFpUP3uHcolMY
 jEyhtGXYAIoeOowqh4Y+rzr2wMjREmE65YKpk7wRHLPWxHCAx2pqYiGHCFFyFvMglLKGXNTp7NQ
 cBZv/hv3ogs7r7cyTJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power
consumption. MHI bandwidth scaling is advertised in devices that contain
the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host in the form
of an event. After the host performs the bandwidth switch, it sends an
acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver, it is responsibility of the controller driver to do actual bw
scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

This series depends on the PCI/ASPM patches[1] that are currently under review
and not yet merged upstream. The ASPM patches provide the infrastructure
(disable_aspm_for_retrain flag and related functionality) that this MHI bandwidth
scaling series builds upon. While the ASPM patches are still being reviewed, we
are sending this series now to enable early review and feedback on the MHI
bandwidth scaling implementation. Once the ASPM patches are merged, this series
can be applied on top without any conflicts.

This series also depends on the mhi read capability patch[2], this patch
is not merged as there is no user to use it, we can apply it along with
this series.

To: Bjorn Helgaas <bhelgaas@google.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Jingoo Han <jingoohan1@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kw@linux.com>
To: Rob Herring <robh@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: mhi@lists.linux.dev
Cc: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Cc: qiang.yu@oss.qualcomm.com

Link [1]: https://lore.kernel.org/all/20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org/ 
Link [2]: https://lore.kernel.org/all/20260411-tsc_timesync-v2-1-6f25f72987b3@oss.qualcomm.com/#t

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v6:
- Restore ASPM after link retraining with pci_force_enable_link_state(),
  as a plain enable does not re-enable states disabled by
  pci_disable_link_state() (Val)
- Include link width in the OPP lookup: key is now (per-lane rate * width,
  LNKCTL2 target link speed).
- Fix pcie_set_target_speed() using a stale list cursor as the downstream
  device when the bus has no function 0.
- Use the unlocked ASPM helpers, as callers do not hold pci_bus_sem.
- Move the BW scale doorbell into mhi_event_config and drop the
  get_misc_doorbell() callback (Mani)
- Add MHI bandwidth scaling support for ath12k (WCN7850).
- Move the BW scale doorbell into mhi_event_config and drop the
  get_misc_doorbell() callback (Mani).
- Couple of nits (Mani).
- Link to v5: https://patch.msgid.link/20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com

Changes in v5:
- remove pre/post_link_speed_change (Bjorn)
- Use opp directly in pci directly to scale bw votes (Mani).
- Use disable aspm on link retrain field in host bridge (Mani).
- In case bw scale failure, remove workqueue etc (Mani).
- couple of nits in mhi & pci (Mani).
- Link to v4: https://lore.kernel.org/r/20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com

Changes in v4:
- Remove leftover type case, change the function names to pre/post_link_speed_change(Ilpo Järvinen)
- Add check's for capability read and convert le32 to cpu (Jeffrey Hugo)
- Add macros for GENMASK & BIT() (Ilpo Järvinen)
- Link to v3: https://lore.kernel.org/r/20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com

Changes in v3:
- Move update speed logic to pwrctrl driver (Mani)
- Move pre_bus_bw & post_bus_bw to bridge as these are bridge driver specific ops,
it feels to me we need to add these in the host bridge driver similar to recently
added one reset_slot.
- Remove dwc level wrapper (Mani)
- Enable ASPM only if they are enabled already (Mani)
- Change the name of mhi_get_capability_offset to mhi_find_capability() (Bjorn)
- Fix comments in the code, subjects etc (Mani & Bjorn)
- Link to v2: https://lore.kernel.org/r/20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com

Changes in v2:
- Update the comments.
- Split the icc bw patch as sepertate one (Bjorn)
- update the aspm disablement comment (Bjorn)
- Use FIELD_GET & FIELD_PREP instead of hard macros and couple of nits
  suggested by (Ilpo Järvinen)
- Create a new function to change lnkcntrl2speed to enum pci_bus_speed (Jeff)
- Link to v1: https://lore.kernel.org/r/20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      PCI/bwctrl: Set host bridge OPP and optionally disable ASPM around link retraining
      PCI: Export pci_set_target_speed()
      PCI: Add pci_lnkctl2_bus_speed() to convert lnkctl2speed to pci_bus_speed
      bus: mhi: host: Add support for Bandwidth scale
      wifi: ath12k: Add support for MHI bandwidth scaling
      PCI: qcom: Enable ASPM disabling during link retraining

Miaoqing Pan (1):
      wifi: ath11k: Add support for MHI bandwidth scaling

 drivers/bus/mhi/common.h                    |  13 ++++
 drivers/bus/mhi/host/init.c                 |  90 +++++++++++++++++++++-
 drivers/bus/mhi/host/internal.h             |   7 +-
 drivers/bus/mhi/host/main.c                 | 114 +++++++++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c                   |  10 ++-
 drivers/bus/mhi/host/trace.h                |   7 ++
 drivers/net/wireless/ath/ath11k/mhi.c       |  29 +++++++
 drivers/net/wireless/ath/ath12k/mhi.c       |  16 ++++
 drivers/net/wireless/ath/ath12k/mhi.h       |   2 +
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c |  12 +++
 drivers/pci/controller/dwc/pcie-qcom.c      |   2 +
 drivers/pci/pci.c                           |  15 ++++
 drivers/pci/pcie/bwctrl.c                   |  66 +++++++++++++++-
 include/linux/mhi.h                         |  11 +++
 include/linux/pci.h                         |   2 +
 15 files changed, 388 insertions(+), 8 deletions(-)
---
base-commit: 6a8f5b35d182229795bf2e75de1feff722da3dab
change-id: 20260813-bwscale-4337905a61a5
prerequisite-message-id: 20260708-pci-aspm-fix-v3-0-6bd72451746e@kernel.org
prerequisite-patch-id: 88006da4a3c4d94facb6ff3cb8e47269fb3e5636
prerequisite-patch-id: e9132f8e053568f4259ae33a5f0dfa7d14f6bb43
prerequisite-patch-id: 034cbc5c4004f7384122e454edaf10118495bb1c
prerequisite-patch-id: 3f415cab42569c0fd8d88d3de9775a57b719f82e
prerequisite-patch-id: ba94f33f11b19e08820dee482209dd1ba0d57523
prerequisite-patch-id: 060f698bfdb0e16c64735abd90e21f699f975ece
prerequisite-patch-id: 0451e6b0527b17f006d6649158abef8ae9010170
prerequisite-patch-id: c7e7e403930415790a6075778b9c4851629f54d5
prerequisite-message-id: 20260411-tsc_timesync-v2-1-6f25f72987b3@oss.qualcomm.com
prerequisite-patch-id: 898bad65110d5bb8a51ebadebc00d21b0c0eddee
prerequisite-patch-id: 927a45a5a418489c14481413149cd37840019354
prerequisite-patch-id: 927b714345dfaeecc74ab17645bd73c62a0ed51d
prerequisite-patch-id: 607cbbae4ab145955ba10db4c0eb2ec507c476c2
prerequisite-patch-id: 3eeed070306fd8e1dd9a2edc11eaa91ea3cc9115
prerequisite-patch-id: 77a89f3deee3b2a415c008fa533f3faab7e709ad

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

