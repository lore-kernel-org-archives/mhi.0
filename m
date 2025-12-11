Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93926B08F
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440498; cv=none; b=em8A5Gs50ZIXtXpwjPSlC2wXbFBzhLJ29LDRw3o9CS/7xvMlabaNfQZh9brT1Y3lkkM0bBafBFRkKl+AYM5iuQAGmPjBmzVS2HaFpZeuBhMgqnKBymBDXN4c9nWCFnKkfF+HBGjpNFaSEf8cucVR20GZrx0M3nIqk/pPAT11T2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440498; c=relaxed/simple;
	bh=hLaP/rRnDWhv9osvquE39GRTiumvprN4V5xd/SF1WuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tds0eublszUHKnY5Mmg25gLT3IBDzPXyRb7U3tdPXJR/zoHLOrTB6hlyjZnmxUMhulEwjcs8fZRIK2UxiBRPLMOI0Yt7xPagEzgd1RxeKHL0PtVEDrhuyAE19lC5hiCqErw7v2eFTJsiUd4W1TF70VqBXKPMz9Tg7k/OeF/0aqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=olOjqX+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5Wlq0po; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="olOjqX+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c5Wlq0po"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALROMc3701206
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ImStdCUl9v/lFzBzrTEFzPiSnZ8dfVBQSUixUFSZIjM=; b=olOjqX+r6bn4F//n
	AWfj76fT19jbMwfdq+A4hP8QE/tCRgc93qRwIf/HHgM7/iUdBJH2sH2R/K4pePz7
	dEVaDzAO7x8AC9hmMA1ezPNxV+yROj+aiohkOYZYNkq+tktLL7fhlr5lHsAtyTrm
	1hh0leYAmnDdmjjHguA31I+SvWGLRdOwepVjuwZktg1VyUjge7X2u/YyFqAs/oDG
	8B9rtQ1xPUsJhj3rR0dTfaCUynhBx1e0aWSfFcHYieAiV12MK0tgqhvpIsx6EozX
	L0DvOVbiGIYJQC65jpKdO7MUJrki7HSFSqkXKfxVTuLF1GZLsf76nVTSwl1tWCTT
	ikpk5g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1j41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f046e16d50so1177055b3a.3
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440495; x=1766045295; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImStdCUl9v/lFzBzrTEFzPiSnZ8dfVBQSUixUFSZIjM=;
        b=c5Wlq0po8H2ym0HCt3PhXLn02+uJAANJpty7NgglTKOxYNvGl6ph84wgMNGTQFIIXE
         HCufPJT5sBF87CEAHA1xePgvs5fNQgUpOxu/nR0dAgqWrOAW2kbOQcflA0/ZnE8FL9sv
         CTjwXSNgptcnzPbq5pW6Fx9XR/Lo7BUa7fiV6Qk6Is/xKJuwhTgZwdc/6PO3ImDyjhSz
         GNzk+DFBAynS0hLKUgikdsOLF3zwAEL0DMzYC07Sf338bXfDs+c5E1AIoKSDEqnUucmV
         V45NlFtJ/dF9buYCyInCUuQ3YxvZqxb1FVL1gA0UY4Oz1KIVqp0aHxVv6y+SAWl5h0XI
         9ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440495; x=1766045295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImStdCUl9v/lFzBzrTEFzPiSnZ8dfVBQSUixUFSZIjM=;
        b=fBPu1CnoTpbVg6djmphY0endswJuXuXnhQm+2XNqp5Z57OWdCwRaNyB/YwtH4f5T/6
         03etrsr9dfrxqT8Fe+h+wzJmeD0B1t5l2UjnDq8puOYy5OEVHplS1NdYSUevyIpeW1at
         cAnyPt31zYd2aDb7dmH54/MJ3d1pjjfO4MbFVzzOnpkUjjzxwTZeTCx7UgnLL/Omd48G
         sPIDR2jpMRZPxwrAc0s1+xlH1U4UU2fNyU5pHpeGtT7zLt7BiF84S5jHa/9CEMUd6IaM
         irf/FpB82wl7PMOAFp//MDvWFiI8wrh8bWLYF7VvYAz8NfU/GNo4Sj0CCsIwNYreWdTQ
         J6sQ==
X-Gm-Message-State: AOJu0YwpcRD8fkS4eLs0Rs0pbdy5dl81UjuEVDTr2WG7/Th9/vnC6gKt
	GRuo6yJ0jIDM8o17Ol/S0yse/oXa70fceU3avrDX7hV8VrrSPdGD/TCbwnDtKsx+7WPuKJQDfZE
	pqhsjD9Qv9gU0dkoaGcHOALiZG0R+9khBvKs+BqQm0JjlVvTwaq5lgyE=
X-Gm-Gg: AY/fxX7UwtOQ3SpM2aGpjAyYsHvsjDAlsGpGTMgAJQNzAYdt5Vy5oSGGO/g76HYWGS2
	27VzO+5xHuJhsIk77V+hOzs6Ut61rJReocp74W4/T/1QAQkVaE/VpINy1hBHH8ywrj/r4ECshn0
	yOgIl7TcGovW3lG4Za7Ptlth/XgtxfXtTgNQQU/ivTV+tblgHiNuGC/HmwUdqLJQOmGFS5ZYPjZ
	nYpiVr1wpVZZKWVmg/NrsM7jBVn/tBnjd4wH3o+BrOQhndO/WHHcUnczSvK2/0a4v6DjprJX4Q/
	dPu9inqJe23MS37/7yciVBpKkkttDlUJKEwjeOuGkfAONtFbR5SBQtKMffsrQku4128HZoVLHuG
	7vYuHJqP85z/ahPjBDG6rEDXOgj4x3F4f+Q==
X-Received: by 2002:a05:6a00:1a8d:b0:7b8:d607:41a3 with SMTP id d2e1a72fcca58-7f22dac06e5mr5622557b3a.13.1765440494775;
        Thu, 11 Dec 2025 00:08:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlrPwfKh3HROdgsMqlLzKbw9DtY9zM+Aqjuc41a9ui3a+yx6HrhJ4ykGZ3B3q0XkDcWNWOvg==
X-Received: by 2002:a05:6a00:1a8d:b0:7b8:d607:41a3 with SMTP id d2e1a72fcca58-7f22dac06e5mr5622527b3a.13.1765440494258;
        Thu, 11 Dec 2025 00:08:14 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:08:13 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:41 +0530
Subject: [PATCH 09/11] bus: mhi: host: Get total descriptor count
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-9-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-GUID: QmstW_IV2yRqstzR5d_u9vdf3AA7zfTY
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a7bef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kBv2GRQmL64bnbioCYQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX9aYGbHjpAdhu
 cr5KsKPUFsqSObWKjb6yat2zhg6VqCckJA6MkBipW7Xt0ipPcqYU+pTj904Qfg7NVbuJKM+NLv/
 PwdpZAseadq68yTBRSAOnynKX5rxjltbAbB9JTyYUFLgm+9BzlAcgse+bA0oGzIPOcPkBWCBSb6
 LrIkUNOgGFlkDtrBp8SbqLHJRrzyix94B5n5L5DcBSAmbjHK97WVnIqHSuaejiWxYgEKL6MKHr9
 CvjafGvD6jCj41l531MgeOXjcSrMNfbe+dGk5/22qFyQZBpEUd4s41mrbDPLHe8Iax4WW1AVby2
 ZIs0VPaDMYVznvZ31N2M1xwi2FAA2NC8045pcmOCAFk3ZIJhbhc3Zt6aXcm5uHOCGdrHaYmZpH3
 1oEBaCzDYtcozDW3frMqOKrvXybdpg==
X-Proofpoint-ORIG-GUID: QmstW_IV2yRqstzR5d_u9vdf3AA7zfTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Introduce a new API to retrieve the length of a transfer ring.
This API allows clients to query the ring length.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 11 +++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 9772fb13400c..6be15297829d 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -345,6 +345,17 @@ int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
 }
 EXPORT_SYMBOL_GPL(mhi_get_free_desc_count);
 
+int mhi_get_total_descriptors(struct mhi_device *mhi_dev,
+			      enum dma_data_direction dir)
+{
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
+				    mhi_dev->ul_chan : mhi_dev->dl_chan;
+	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
+
+	return tre_ring->elements;
+}
+EXPORT_SYMBOL(mhi_get_total_descriptors);
+
 void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
 {
 	struct mhi_driver *mhi_drv;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 66fd83bed306..013bc2d82196 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -620,6 +620,15 @@ void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
 int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
 				enum dma_data_direction dir);
 
+/**
+ * mhi_get_total_descriptors - Get total transfer ring length
+ * Get # of TD available to queue buffers
+ * @mhi_dev: Device associated with the channels
+ * @dir: Direction of the channel
+ */
+int mhi_get_total_descriptors(struct mhi_device *mhi_dev,
+			      enum dma_data_direction dir);
+
 /**
  * mhi_prepare_for_power_up - Do pre-initialization before power up.
  *                            This is optional, call this before power up if

-- 
2.34.1

