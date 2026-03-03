Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895C38C2C4
	for <mhi@lists.linux.dev>; Tue,  3 Mar 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528548; cv=none; b=pcsRJgvCJ3tIGiMDozynVOt0gUITyp406yzyKO7FLtU3Q8lZfjYvEu1kMrlSSrkGFcQcjODkLxrxedtv6tmtXvvFl+oJJO/vBUwvuIZ4m0gn4uNOf1w4sZ7hTIjNYu5Lhd2/eU1QAT4hhISCopbwvzRcsMVNEW9njx16uktPBGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528548; c=relaxed/simple;
	bh=2f6yMK46tPJaTveXsb0Gf1R1SLcm5dpehHbEx9p98Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQ3oZTC6pxhNha/lK0oNtsfZVuveYbieMSbKJzHsJy+LKIh8PpocDy35oKSTb9GuQ6jSTa1ro6oOU4yuAOM2+ssL3FKkSxb/kajlNnkOKYxZvWg0jxsqzMg8GIXMhC1C1VOuDMilwC31aY5ZPHREw7RAzHNVQt23aB93G73TMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TH/djS3G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrUU1KE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TH/djS3G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrUU1KE9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235bNkC2996045
	for <mhi@lists.linux.dev>; Tue, 3 Mar 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APytyPy8g8LI3V1UZPcKWFEdvHQQgjkqWH1jGroneSw=; b=TH/djS3GwCUsziui
	/uq3T8a/yWrM5DSqu6CRyl1KSpSjjsGZqCdDKFRnzVkaxRD644Xj8P54cqQhOYYn
	YdsI90Twx3dUGZUggK2tYU+7+8gWp8E9Pav4efow+Q/kxlaQ/DXHdKGzrWIaDaL8
	jMWpzzGblYQ807AXbkk20ZoZJtxSSNMvFXNvtEXMTtZAK2SIK0OYNPKuxE9SMm7z
	nBiBxG9M4+QzWeFwPQamS6f3uaqviSqLvfPq/lV4/am1waZsEWXZHYlnvqbR/4cb
	dzcLM25+JxrFJVQgj4/FYh3ZMNo4ZLg1QrF3s660UHfmUonaqvMmB7ufbYWgw3xE
	p0uZrQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6ua95u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 09:02:26 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f2793a34dso59487748b6e.0
        for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 01:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772528545; x=1773133345; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APytyPy8g8LI3V1UZPcKWFEdvHQQgjkqWH1jGroneSw=;
        b=hrUU1KE9pp9FfhD4y/b3e4Ek0YGqWdkBx9RAmxzP+K6GNWPCKi6XRLHT05Bw7IGegj
         +nWIVYlZUEl8e17ZKrQj8W2E4HYICxrUubgzydC38rgjOj1Z56NANfiv0CFXC0Auc40N
         dePyq9yT5VJEck4PWM4SQ/YwCfgZMQtiVIH6drSGANeXL2OTQEunUZ00imWTaV2OiiR6
         gQfQq5Ha2Kt1fcDFR6lDVodx8VPBJyX0pu6YtNLiwx9x7IQQqNTyl9N+bM9PIAM5sFO2
         JTlKxncOF3bJvhJ/Y8CzksDYh6c9Onyk3I3CPtPkalj3qPtlS0pc5ZMCs6fAnX8A+TpD
         oUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528545; x=1773133345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APytyPy8g8LI3V1UZPcKWFEdvHQQgjkqWH1jGroneSw=;
        b=LMLFTi/R0LLXayaPMcaL/xTSoauTK2MU07Nb6zmA3Ucp59qt+KhLMqx5iAcY04Wj+E
         GPuEE8KhY0OcY4C1HgEDVquKtBwo+elDYOiEtxxN4GwcctuMPeJHN4eu7W+bfuG0ZtAd
         yQfnsqFbDw7NVRjbM9J/83sH1NCIsxfQRSTAbBeYswNhWdihaX/JxBo2mvLUBl/KD4r0
         mzkP7kliMB09xZBbzftha6jyI1XnJ49VOLbrZejzkY+s9ppN/dLW227FnxanE70PFo4I
         61vHMXaFshh9SroZoMGMxbyj8PpjpW6vMvVAMyrRsqii4eQGHgtmbjgAcbvb4PrLb8Z2
         T4qg==
X-Gm-Message-State: AOJu0YxBLv5zA1LmgLGzQEmq2FpMmLNUYA80wxe8NpBnqWl2D990omtx
	/zxUqvCfjv5ItN/K1f2NU8uZzCAme1+YI3QyQY9n4JOLhG+OFv/6kf0cNEODgm/XOg8LGnNTlRC
	kXK4zuO3YxOx7LHswT5LYX17XhJVA0jFp9XjqJhhie5Ovy7Gom1+FaGLu8LFUBhvDSA==
X-Gm-Gg: ATEYQzy7ZImNR4dYpVBDK9kvSpATEEdDv0OMxy4VRGm0evP6/ncJcwB2sqjaLUtFbPj
	nsrztF7ltjIW67Saq+rjOwMpdkLbCuKYhWmbI2yAMWIGyKPH5JMyySXwhfFQtyhrt5pruAOlT8k
	B4VAllOaW0TX7e9KtcD22Vl+fcEKJkHUICcLskwW6XOpk/b695TU8Fl8G7oxyQFDHnMhW97j4ut
	qwSpqDrgP5T1eH9MYAn9uN2uXm0rdw6uSz/s9qbw/Jx1QZnq4K4M2LKARfrQ33+AUr2qshaMj8o
	K8iK/UbKQ10nYuyVNa6Rb5LrJJXGecDswSaxRuyuLOk6B4U9ZKeVAzQgSo+mvQr2rwWu/+Cb1Yg
	XlAXdHrOPh9YKdo8x9bsmQr1P0akXUOiERn2wIxP1fSS4tfbOMr9xmfDXtNA8fU8TyHLx
X-Received: by 2002:a05:6808:309d:b0:455:d3f2:4bf9 with SMTP id 5614622812f47-464beb3fb23mr8864479b6e.30.1772528545217;
        Tue, 03 Mar 2026 01:02:25 -0800 (PST)
X-Received: by 2002:a05:6808:309d:b0:455:d3f2:4bf9 with SMTP id 5614622812f47-464beb3fb23mr8864466b6e.30.1772528544862;
        Tue, 03 Mar 2026 01:02:24 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb604f5esm9288908b6e.18.2026.03.03.01.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:02:24 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 01:02:14 -0800
Subject: [PATCH v2 2/2] bus: mhi: host: pci_generic: Add
 pm_runtime_forbid() in remove callback
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-b4-async_power_on-v2-2-d3db81eb457d@oss.qualcomm.com>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
In-Reply-To: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772528541; l=899;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=2f6yMK46tPJaTveXsb0Gf1R1SLcm5dpehHbEx9p98Vg=;
 b=ZTtVRJGYucS8HZEcniSuF0NvGdpFa9q7fcuuyWNKHjRiDNH1Q2QefDCtzZaUm39NQRWr/12QC
 6qark6kI3cACWaCs66a+AH05UiR5rEUG5FVMDgOFokxv+IQQnd8w/BK
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfX+uqtLUSSIQ8w
 5hExDzrR4OXERzeHoR7ejgC6kEiYkZchD48+d5jRTJLfd7gFgFBtZylwmDUeWupl04YQc3ZlGjG
 nyhXBzO9nGEaZMbvwzKO+SFFfxNYnN9OSNVYZbbyyimvmfreQ2sxoT5wipjLgJPcx5akvpNBZLL
 XjQK+Q2kkuRij951ErtCO8RHMFKsYdv3LJha+LsA59DLqVddfIj6l9266pvsK7fqqnR1a7CvB5m
 K3NbUO4lhMr+mX5IeEhYwE5r/t9kPZ4dXgSNXy7YZSR3tdNRy4j+RQ0HPDIQtCAEiLbpBAw75Kf
 YIW7sFjkVA7ToRfmOnYKGZOaHOgzhWEtVT1fAiQLzZl4yfvDOpkkzgbvxNPWHTfcYgrN/ThclEa
 f1BAErIjAxrd20Z9PUsp+mmP8jcKk5uqX5Ki66Rv5f85y9YXNFIae4ELkrKzEBhjzvcLuzvD33q
 zXFid8ViXitfZr+KaMQ==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a6a3a2 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5YqorbGh3H_VX0Y9zHsA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: mmxgfAMghcNQ23O5Yv_HwRMQFwdQksJy
X-Proofpoint-GUID: mmxgfAMghcNQ23O5Yv_HwRMQFwdQksJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066

Add pm_runtime_forbid() to balance the pm_runtime_allow() call made
during probe. Without this, the device remains in runtime PM allowed
state after driver removal.

Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0395a8ea52b0e874209ca56cd20ed04419038cdb..b6b21d0f3388d61b771062b8077f836a6bf8f9f8 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1459,6 +1459,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_soc_reset(mhi_cntrl);
 
 	mhi_unregister_controller(mhi_cntrl);
+	pm_runtime_forbid(&pdev->dev);
 }
 
 static void mhi_pci_shutdown(struct pci_dev *pdev)

-- 
2.34.1

