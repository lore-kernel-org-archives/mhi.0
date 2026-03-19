Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73EA34DCC8
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901949; cv=none; b=Q7vMFjd4VUtoJw4nap3EYrBgtbqlx+MlutBS/W5l+u2u4hh90BkizNCKtF9QUoS690OMrziRwZHotRkgDJ+O5xeiQMcRh4bgGD5NuyM4vPEU6mkEG/BsynmBhu7NPcwtaPPYF2LzzF7fMNv7LmB5aKT2sDCEVqWVJI93lrcLFe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901949; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hI4YSmlOq5iSNRYu0Sw0uTc93e0A3kDBoRETRZYYukeFAlIIGGsZleVfPoX9+Mh8atpgv5/pT4NJXoT9ZkVTw2B+ctIhhay/vB9MHx1SG2f9/d6rCOE2qgU2ybB1mTBWetzUIt3vm3kFQdpsijLl+OMfmrPs5Qz4lvclgYFgAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjdYOj6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krI4vv0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjdYOj6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krI4vv0b"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XaVN1701872
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=XjdYOj6ZySs+ffOQ
	nIXhwt5OeOeWVukqAGGFaWFnkYi1qnr565OZs+NKGzUFqDEEMmFMAPrgo4nld+DW
	Ip9FlKU2r1dwY1+JHnFUeDSH1RF9RnqLCKQfLnhYNSfW7F79oYWtJ5S/GvurHkRQ
	Br9J39bODzuBspngARD1uc53SXDHWMGl7sEGOeX7vRsccZs9uYSQva52f6XysenQ
	Of6izH1A8FoqhEg1sFg39oPMc9xKwg4JVW6eU5OWbqGpP7AMcMGgculpSra5MXcY
	3JRWd30EVQF3SI4d/t9bsIwgr830exrO5qD65OmraYUqzUgeO1N1rC8L915SIl4G
	RwUmsQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgabmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b059511554so45936605ad.0
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901946; x=1774506746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=krI4vv0bZBYFvpb5mcY450TOyn4pKMd9KHol5ok1MLNNHxAVejQDvtk6Zx95tY+bKH
         S2iExVEgY/xWWvl06yVAx+5un334RKcIjbzQuxdT/OV6OMmbixtfbYahEtirLzeMGEBZ
         /YRb1CqyhW+iiQkJwSZhKi/lzdZveTwSsCOaLvok1ZWSsBvQ6+EV62madeMLk+cbnDbn
         3nmXmdc1bwyIgkBYR87p5r2sHWqSwuzgEIAO7GGRK6GRZ8+fqmf4LIIHzvn0+6rakYCJ
         5vfki/hp0M/NIbu4xztFlU5wuprxE2PVZZA4bTnoVZxpSg4NrU6ZXmwCtZVF+US566lb
         2arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901946; x=1774506746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=g4tKv6UBHI7bmJ3RvjtGrFJNyWJ3PxrLIqpvIo5Eek4VHcgrDOrnVaul32nojHn8CQ
         sxi1PTLb++1k8MlBthMpA4ptTzYi3X2J45mjpA3c2BqevR9a6u92DxqWpEMaT3YWuNoB
         8p9LySOvbAYEXA/8UdFkj0RI78hm4JeJCj3vPn35JZ3I+UzWNqetg7YhqycbyM/CGQgp
         98u8z46wWviUQF8Jl9bEpgvWxAKukp6QIn6aMLJeCteb/xPfLhW3YIBenIJPAS/z9KO5
         c5nt+UNj0nRdd4Wnl4x5xyGkij9JDZf/5w8V3subfSwfXRjUjn1EHfF5x5xBtXIttDQO
         fOxw==
X-Forwarded-Encrypted: i=1; AJvYcCXJa3RYm/QKekuUuDNZ2htiaAjmoWoiuOu7YuLt6Qn4dHt0DpmsiTF1iT2XfTcH6/5fS+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZc/ee6TLosEwK6BETuAcMAnANAqWYD5Eepm0Y6taPMu5BisIZ
	H0Z6ab/7WN9d8YJrNoS6cqvuAnEraMKwYf5aN2gZbNX5GmzQBRmIyzXtVMqcrsGP+kemA5t+fw/
	LMm3C+iS+eHuaVLX/yTVIih3q9YpC/L/9hK7ljXFuAaEYXYtBl7pqCb8=
X-Gm-Gg: ATEYQzzl7q/V33NW6Ov8jlOOdBG056xuXEyvjE9TL6Ox8qpt6O5TjfNpFYu9g0UALOS
	7N+xWBxxDwO0NmYq03465reDdXmlF4kG4Rb6YmlY5ugJidKH8FEGaEDUzTI3L4Sq8RRgZbrSPKb
	dHTBJ1wpzHD47WkBo8P33aDhdDpoOZr+FJ4RgiRTD+wk+1cL0+OxbsQYYkFJb/SBYba9+CpQoKx
	K1Ki6A54/ikif9S3yQ7BTSbahxk7ZCo1hQSmiApZcajhBbTiI9qi4TmV3j7Pg8nPPjFYxCyZRM6
	HU/LaFZ6Kx3oE5/7en8kXZlNkwvdYGOtQMNZd77cRfL4iB5V2ogrb+xAvLaJskgfr1Ig1PvA3E7
	Hmpvowu42C6awZICaVNZvcrsf5ytxsvbbBEM7g1zJujZ98qeA3Uk=
X-Received: by 2002:a17:903:2a8b:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b06e3236d0mr66217335ad.3.1773901946587;
        Wed, 18 Mar 2026 23:32:26 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b06e3236d0mr66216985ad.3.1773901946126;
        Wed, 18 Mar 2026 23:32:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:25 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:49 +0530
Subject: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=oDJdabj+nevZsLKRAXC74rtzAHVO/YwH4bO6LZREstgcBsTlP0qNzP0ID0HAYGXuCGebsRFDN
 Qk9A9oeSuz4B1G+ilAYFW3ypjpCNAaWqO0Yl/9a3wvCY/fV+jBI0yuO
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX9xIKEE1HMkF6
 FuAjxnOoERTxk9ZuKDWuiqf+aznDPw6GBmb1uOK5KCEMSGzUolodoTFx1krrCJkbxXb91FL70Xz
 ySxeCS5i2/cfAs44OlBKudh+egzL1ShDy+Alm6DxlMCoL3js2287Zfl9rz7gqOfQ32W/HV3YLvH
 pS3/GUo1DRnPI2RHPSF4yZMy+5CLBSW/vx0KFvKGNZUdrbqMahnpDdmLzz7spmVX/HPZhzLY1Cx
 z/ypQe3LUR112JwyNEymCjNF8XiuE54Qi8RFMGyyGo7Tv5S1aLLxRBWrJ7WrkxcNhpjI2ty02c5
 GPyCrVUWu8O8I+AaHLErtuFHIF8CFOUX2Tf85vuBeyqmoNu+DSi+LrxnZKAUo3z2dkEN7zbn3Be
 q6+uzJZSre8n7usHCHOBvTz5OjtaziCX9V3Erl+tYBng+EBG86tbTLQFjtS6uelWaU0B6L5XhCb
 PeEQSjeT4w3AeBqCLHg==
X-Proofpoint-ORIG-GUID: i9JJsNLsL89mYCVEKfhZRmLVeUX0cxmh
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb987b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: i9JJsNLsL89mYCVEKfhZRmLVeUX0cxmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

Add ABI documentation for the DDR training data sysfs attribute exposed by
the sahara MHI driver.

The documented sysfs node provides read-only access to the DDR training
data captured during sahara command mode and exposed via the MHI
controller device. This allows userspace to read the training data and
manage it as needed outside the kernel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.

-- 
2.34.1

