Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705E486B9B
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628927; cv=none; b=AFPoiSpdMx5tlqtj6wlRso1APVESOXwjKmid+hQBrNHZ7T/+YTBFTUlffQETZA8IECwffj+/GkfZOFVanGhaENcbIy22MwSe8ll9HK0SGOZuutebGccp7QihX6gy6j8sk3HgSxDAd73yrLaDRvrYoXedcd0DX/4sNdwD1+BP+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628927; c=relaxed/simple;
	bh=mquGpw2Jeks3u4pZSzMvUe6ezLRM/XKipJPSpWcGRsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cd+8ECOEsok3EtEvErNHzPNue8YnbJj/fqM2ppnFN9OnSUVbZBAIwn3lvFqneHvoiWBA9wm99UTRkrj4l0i8phtMbUJjllzmy+OChYE1k128OJ4UpmIAB7N4Zj0M63qepVhPjeAV23n2UrO4kOVSIJOhNGGb/0pqTiU6TtWyc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZV2OAd4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LY8x16PV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV2OAd4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LY8x16PV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60s861375593
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyEv4YRY+fDKmX+R2j/i0iuRIUl+0Tgi8q01fbNyyJE=; b=ZV2OAd4RrB2ongbN
	cmi2DHPJGVauNJrzFQ5h00OkHa8XHpOTJ22gZtjb70F2qsxVMV26wu2N6fPG/OCz
	z6O7DNzqm2un7iCZ9Th7Hai0El/aMi2Ium7K2e/oVdxrS1XTdtseCzKdm63zcQfU
	iNC24871sqEuxpn/3ce7QZecM9C2kfbJonXuS71uHQqJ+sqEfFH8haRT7CCtd6kl
	dDPdJhEg3K+I/onEKAkWOT1ivAN0HsvgrnAVwGv3L6VQDWqXY5B3FBlaDx42iCfJ
	vXJyRmGX6wPAaheTnx8ZyKEFbjFXfpVElvKCjRWT8GPOfVooBl6l5QpRkyi3h0Dd
	GRncWA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atw47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c5a1a0b54eso1169729b6e.0
        for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628924; x=1790233724; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyEv4YRY+fDKmX+R2j/i0iuRIUl+0Tgi8q01fbNyyJE=;
        b=LY8x16PVA0j5w8o2Bwq4jwPMVQ/sMLbhoLA82Dzz4VuacGimOSwtVl3THiUjqPNwEJ
         ZFpmZ58VRRbWnoadtLktd5Q1VVDcZhAymuLr6UWGlLpm1oWij6UGj41cs5BJYOutoeB+
         IrUQBbzeFfu29QQr9WUCgKDyYQtRlPCwKBpZWedzG7k+o2wi9oXhlqvwg9AaRzKr9m96
         k7VwT85CesISgZIP3QP/Cd6SeyN5ruZFp0m8GA7xwuDuSkaKSGkJGcBVK+LDheUG3iPf
         dSxKa4XMsWwb3Wnt7tG8YYEsAOicaYr/9V7fQtg6fdYdtDw5m6kQAhF5Dl4yqFrzqg75
         3oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628924; x=1790233724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyEv4YRY+fDKmX+R2j/i0iuRIUl+0Tgi8q01fbNyyJE=;
        b=Wld+3ROGDe4xXQF7dWTm5iBIy6PT6EmrdgvLymDLXSPniMiYn0o/keLgxGz/Rm6Ae4
         JWMC9Gmlhttx7VjmJLVhHmjbC776vO2SP9Si9sEfbH+4ovFOQBOa7fgZS/p4ayjse/Fu
         tNma+/GHTsoNuzbDFRcRkmbYaMBp0SD6MFBJdfqbcKjp1kQMBsACgYStQGfq9c7gkdQv
         iyFia9ONB5D3HbFSyFvGWTmRsQMl5wNQxciZoRFW8sOL9AsdXLx+zpfBS6O3ygmHAkMw
         Xjb1Y5y13wLD8bHScchQzfjl1/DcyrR2GtYEzkM7T6jzh3WdTzaH7/j+Z1EPnLMoX+Tx
         CDyA==
X-Gm-Message-State: AFuF++kQjhv08lh8XSfN2ZHzSUrCRnNkEOA+SBhGPpERtZ7xO0ErNm5x
	3SH+7GCXbaFBLIk1mqrQnXn10Rpzig8n0Nu6ncqQctclOLm2W2p+kltLYn4Q97XMrzhkFFOMixP
	QMmQ08hkFN+YfRJoDECpP3YVnz9jxw/cTRpp6vC1E5YLpVrEHWa7NkHs=
X-Gm-Gg: AYBFou2ddPjSJLL740XMuZqL9noykLoDXJjhb4qucAPrpuLMDtXIyM4SDpiIJCY+6rX
	iOi8wVlQKENUKzJaHooElJ1SS5+LqYZQQk8+QJmo00BHqgQQjkOVUry1HzJdnRQs8M7WPwtGDKp
	nogJRn3kIEjxpgMRYOJAwDJ2A5nUWDWaGSfCLxEXo6fDid193Zht03uQC3vWKHgj83ktM2qHrB9
	0jeS6LtJq/Lcbpj8w8LlwlQPBNcw1aKAdXrmKv2umKCsnhUa+i7+CSqLn53pPT0Pop6nVW/W0gU
	8wr+2ql+vat46+y/VmJSIRnj7zFb5DCDWZw5Vd1ueYu2r1xVZlsW5G3RKydxO/XJs2VcGBMcvpv
	gyEHpmUJlrdBN4SYbRTDlYiAxFlOXlVlEvGY=
X-Received: by 2002:a05:6808:4f11:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4ca46878257mr7083030b6e.0.1789628923856;
        Thu, 17 Sep 2026 00:08:43 -0700 (PDT)
X-Received: by 2002:a05:6808:4f11:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4ca46878257mr7083009b6e.0.1789628923419;
        Thu, 17 Sep 2026 00:08:43 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:43 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:05 +0530
Subject: [PATCH v3 4/6] bus: mhi: pci_generic: Add support for 64 bit
 register read & write
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-4-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=1521;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mquGpw2Jeks3u4pZSzMvUe6ezLRM/XKipJPSpWcGRsY=;
 b=RTgaytB4AD/U8vad/HkXDKJIftkQ19zqM3nTTYNeWMINkQvbsInXOFtlDCi9TfEv6a0cZ1aSc
 +ms9OBxP7SKBF/JBbNgy4kWhzfzA0eYbgun+9opB+BS0yexgvE5FBfn
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: oa3q8G9HJ4km6oFCo898QJ07pnaIjdI0
X-Proofpoint-ORIG-GUID: oa3q8G9HJ4km6oFCo898QJ07pnaIjdI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXyXb/kt8Jg75F
 fIEb3T/3NHiHOzQWxZ0HaYoL3vhRAs/ymhIuDT8RZouxX5gmJHJXx/918GzGnmSLitDIQSg8Qak
 RVGRbjJOMd3tn5dtn/q5U+L2P86jFMac1PxdI5enZryox4wLlbn6g5LXx7zWeqLtebbHcF7HfV3
 LMn9lIYjLOiGM2vvUBe0ChkTU/0MCyyaacQZHjME9ayPIEwDYpQv4Zc1CNbPKqlVrsWOqbD7Ked
 /2FoFKslR8eZxETmEon7ICg8xdDPddX6BysYLmNI7wFLJCJ0e90S+AQsm4dc70RjrYivhmA6SZF
 7i5a1YR2f/anJInMJaQVqJR9GIxV+HASdOcRoaQESqXfX6Ai3TZRnzQrk+HvCeovrQ7wfpjnkj9
 U3I4DPNNyQ4iHQH3Tl5ibWsk4RwOdlN4EvWeX6X6AHXeJlQRt7LnPwifVzFYH9uDqZ+ZXaULGwG
 3mwdzBwBfZYOe9OHYuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX5oUDFmV1XNKW
 PjjqqTEn3KTWr8x7oWjzFdPFtReXzKyH2URq4xyclAaGLC7nCacpeHRGIdXobhmgbLliPqdx2nO
 jbPtZIuvl8zAnnGeUDDgjDB0mWGookA=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab91fc cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

Add support for reading and writing 64 bit mhi pcie registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index f47867ced1d6..0aa5cee49bdc 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1101,6 +1101,27 @@ struct mhi_pci_device {
 	bool reset_on_remove;
 };
 
+#ifdef readq
+static int mhi_pci_read_reg64(struct mhi_controller *mhi_cntrl,
+			      void __iomem *addr, u64 *out)
+{
+	*out = readq(addr);
+	return 0;
+}
+#else
+#define mhi_pci_read_reg64 NULL
+#endif
+
+#ifdef writeq
+static void mhi_pci_write_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *addr, u64 val)
+{
+	writeq(val, addr);
+}
+#else
+#define mhi_pci_write_reg64 NULL
+#endif
+
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
 			    void __iomem *addr, u32 *out)
 {
@@ -1406,6 +1427,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
+	mhi_cntrl->read_reg64 = mhi_pci_read_reg64;
+	mhi_cntrl->write_reg64 = mhi_pci_write_reg64;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;

-- 
2.34.1

