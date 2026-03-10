Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F53E8C44
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127371; cv=none; b=CjtyyaZkIUFIhIsSZBuezRfSG7g+45GUH1h60iell7smwNa3EHVr08KHcRxs+hmwqJsL5Er4HfGPooLNK5BeWTeZGYpRL1PrUFL99C7mF/nh1DLuY+mVTL3a7Y6ge2/V0QRVJXODFHfol9w1jIOVxyRzR7XbVVHGAyVRYdSPv3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127371; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jo8WH8To+1pTei3e6VdoWsP5Cii9eb1gaVUxVW1/Mt4GmjzV10FswbEZ37kDtie0eJY06stxLAlj4CzKQtA/jLFuKIYB5mnBH4kb3eXh4SXQJAnmpScySBKdWV0LZXwU5t9OZi62GliuhSIoyj6f7cXRn7opP7EL0ZU0EoOd+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSQUoMBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J88orb82; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSQUoMBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J88orb82"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VKLQ2021368
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=OSQUoMBakbHD4hGg
	hdEEZESxYnrKgEiNiGZF9XYy6J7UY0NiX8arF6UUes3B04tI4z439vt9YTljux8Z
	uhRy3tfLRjLA0tZOLflDX0Rc20zO8/pYDIqD59X01yk/zY51ov6dATB6WQREYciM
	WsntOdOthV9ni3EuJyVt4J56Tkn7jUVCnjq32UDMeJXRkvgkopgC/tmJ9IWVG+Wf
	tJpi5uGyx4GjJgYSMVF8BACx48dl4pqe7ZtCtdcfZltevIiy23eXyS0pNknN7M/M
	hkxcAWT93Cdo9L7FBQjBZrZRRwnN4Lg4xeLfcK7GmWysLZy21XJo8Y4n+G/pBhM3
	aa6Shw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w85fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4f27033cso92324715ad.3
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127369; x=1773732169; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=J88orb82heHOhHZyLUHn993DrpQ6zVgK4BhwZLyh289SypHn0km/1ePSZ1ReB5TtqK
         lLiYZhFOHk1VGeljWEuPZU2u4GrccGM1vnJW9xZu+Yg/kk9bG15iPg2rqsVWgDBpWc40
         8udtw+qWEG6GvkvStq/x/xw3la0HMNea8p8utDk28m7Y7GM9Djcq5sWPUsFOuDmnxa1k
         IJpyEZKOq/LhLpsqTe2Ql5eM+OOhSoQMyf9Xi0SH1AITME55nNgBM8UIfUExxE9DE8tP
         f5y6cOHZprjEWxNfbz7+6WWqFbp0lWZmLiK1ErcCkfyimkRX9HZAtSk+kMc9Qzm4Q1Zb
         Bb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127369; x=1773732169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=tDUSrNP9IKPtfrSK2bTXs5aXHGqz8o9Qgtjp0wt2PytWy0iaVhBhSiTd6yyb81w8Ha
         1lF73UbYJkATLe+uo2gfViXc24hr0MKTAl/tBsaErtYKHCUFPuWNHKi3yMDRCAZQxgrI
         SHV0GOVibSYc8/FZQQ+XEGKv9L+Jec6WOCQHRfVcEZKN2nYV7TQYe5hjofElq/1j8CjH
         c2Pk4ZJR7GlWHNiKjAXocV58oezdaO6pFiTP24eVLPMinMrFBal4aW7s6iPxgIFsRs40
         UE61hiWQ0Xy8e81YDn0yqLO1CccpXwppyKPPewTEVMXasmNfRxfOvgjjidnJk2U8AaEi
         D9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCULnnvQX3q6EISnKvwkahwyOW4LnO7zWueSEVIsRGU+YgbDY7T5NIL+vRsFAkSnXDU9se8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1un1Hqbem78dyhkFnqa/9eg8kEcWaujFSQ/OilkggzbAuK3d4
	f/Iqs31iFhMOXLJTGEek8TJQhB0yUguVN+nwHc5nVeSH/0KDJzbADuphk4KpdtCEgd7gKnSXYrc
	1VS1dKn77VP8Dqrb5CfCqD4DR2WTnvEeGyfeKoeBav0aeqi1viks0Sbc=
X-Gm-Gg: ATEYQzzdozKJTMK41a+7YZLPnBFDAeWuAVWeDAd5t+VAThlohZ9SeHOJToWqRZYpFEg
	pdlkw8gNRMSaQ0yZPiNMK3Af2M23AalZbb3exXpLyU9HP8TbD9WvKJUC2jnZw1a0QFLVdGHcOB7
	+1CWsWVTWgE35BGcpmteH4Q3n89sAmf8s89gkcKd6w8i2bgCwAfciPv/eI308DDorvvTVUYjets
	Z/tfMioVAYB+8qBY5Yu7PKVWRthEccKW/5NWGS9lIT/dMbu4H+jDIonDREduAmA3dV53EPFGe6n
	opHh/KhNtbQ1vZbej8wquwIWEEZerjbcgEcmt8ENBCcMWmkxbQj6ULxncWP5ktDpaAAGsNipXIY
	ecs3+mcKELlW7lmRiNlnJh8tUNIIl+oljQFctPPTSymU+XTChAUY=
X-Received: by 2002:a17:902:cf05:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2ae829d3f2emr149862875ad.8.1773127369011;
        Tue, 10 Mar 2026 00:22:49 -0700 (PDT)
X-Received: by 2002:a17:902:cf05:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2ae829d3f2emr149862565ad.8.1773127368570;
        Tue, 10 Mar 2026 00:22:48 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:48 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:06 +0530
Subject: [PATCH v3 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-9-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=A2ngy+Vh6mGbywAacQ1WhpnAXl4OfWSksXvxmtXi88x0yTGDf+9jd2T6SE6lkrsx9nv4dwTSR
 O/grnwx19PsAypGENZxaAsrKGNdaoKkokxmqVFwm6mmcVFtenk5b9bW
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX1mSS6s/dgsQ0
 yz1JaOemKf9DqmqDEP0mBp6hKLCKkltZYU1JW4sAwQdjJ4eX9vhhTJ+fx9ralXC5H4jLMN6chBT
 HCgokkkkbxyypmGtM4SuMrvgkDVXpUmVzAKrzGXGhGpJjotSsZz3NbJhapnZ587A91Uf5F7h8BW
 jFKQ7rtG/6NkvZKwBxp2CP874AVXU9Nsi5Wz7lPwZigjLKyak/GCPGUWoO2oBV9+17RQkGSn8K2
 JWu79wj2jF0EeTyvrHMAuEDcELj0/MS3aHDTzyZom5hEx1uJ/DMQskvmfCDOhZ0GsSJ96xBdPy4
 y0NdmnRfFDcvXG/hSnGEodtyqOH6OEQ116hG/ZVsOtq7h3d5HE1AaqdjBjarM+fLTg8Tmr/EWjO
 Bb76R5bvl3xo4NblKOCvOHRBV6c4sgEw98thiPCyf3OrlZ+WLwdjl178IVWrk74S7+fA2zKmDIo
 IhwXUvjKMZpeoJZ8mlA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afc6c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: auOD1xbieLRh0lqzeKeB5AxAlS2Uz7Yy
X-Proofpoint-GUID: auOD1xbieLRh0lqzeKeB5AxAlS2Uz7Yy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

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

