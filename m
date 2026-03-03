Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B238C2B9
	for <mhi@lists.linux.dev>; Tue,  3 Mar 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528547; cv=none; b=E8YUX7XCtN2VCHuP6uSHdASQ0aTjmDLPdZ09RjBj0v3jqAFnZGDJUWtrKNoVug5CuezWFIvBakJMQ0TVjFAdIvv8g6il7+Bt5h4J/FT2NWALtQ0rahBPY3s8gFQoXtWw++49Sx+nlprxTNFdXd7IGALH3PmmoEPYVZZ4rKWL3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528547; c=relaxed/simple;
	bh=3jdrSYFufk9+/Tbwq5b4Vodf1OshkwsP1bTuXFhDNRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJlTj+qOCOu4UjM63mjoOtFxlPmX5MUi1SFe/Ogv5KpCgCoadulgsGmiwS3v0uaPkOKeWYv3qIuktAXT6IiDsYCLE/q6GGfyhbCvyRx0hnHpH0EeErDE4QD/yqSM0FHO5NUGTRCan+1VHKmbPzc0D+F033Xq1mO4Y5qLGm1qqtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcwYZn+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6nimn9V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcwYZn+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6nimn9V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235ucvk1675679
	for <mhi@lists.linux.dev>; Tue, 3 Mar 2026 09:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwkqWBcaGIcUUwHXOe0Z6D5tTbeWNwMj+0dLnxLa3R8=; b=kcwYZn+ZRp3y9Ft2
	RQ2KtTc46XCgeqHYtFT1dV87DUKjXDPqZ5TrAO/hnWZkjbEDV/dH2UNFqKbIA8VQ
	NDikCAN+fG8UqX2vattjhUGsNC1D2b7U4geogp6+rh5opIXfNM9pz1ydO+V0mPyp
	9Y/Z0A+UU+PtxDe0nYaAwtuvQ80dEocusSM037wqKKr1j3etpyQHDh8syDnSTKVN
	qyM9CQg0cxatTLSNaAxWQjijNzreulox9rVgrSFDfsOGj9iaIL3CPYJry6cxfn71
	8pB8nNuc1DvBkiPV5r/5WJ/XNKoVFuicOVo9CjtAcp2W9oXe0DiQickv3hSImN1m
	Vempag==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsa3hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 09:02:25 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-464a0af43deso29432136b6e.3
        for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772528544; x=1773133344; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwkqWBcaGIcUUwHXOe0Z6D5tTbeWNwMj+0dLnxLa3R8=;
        b=R6nimn9Vc9OPa2j37JAoIA2C/H/PcGqM6C0Q4F+mzbs60GKOqxIODXazu1PnUeqJVs
         KXzWtr7jos0Tc6Y2zezXCAtGjNcd9pWsKIGuIGDuLgMc6faNOw/4MBhA5XLHbG6Jq3rL
         Lno74FxBCZweFhUBn0Vt5mM9xoiZnle/qI+Z0YcSnVLJDRIywaYY0+4b3QEN3eiwU6nK
         S81lszy6zEn2/YACIvt35FgwAA+wkyUY9yyU4nptp0k3BmqskBGDFS+9xe6rixzmP24W
         +KjqD0wjSuqM59ak9XENHQyc/NeUYH1VWc4+64teIeEcgJVUjO+xXt1OEeHMlsN7QOVp
         THzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528544; x=1773133344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwkqWBcaGIcUUwHXOe0Z6D5tTbeWNwMj+0dLnxLa3R8=;
        b=fTIgotSHd8jAzU6fF6kyTutCeVnWd6VBmm2uPCZL9chb5Z4EcZxsX9VzOwJowqVSwN
         u29RF3Gy8E6S2Hg1cxrThZuBJAfAWXDJN9mSjpabse358x9d4eUhq/ap2E3MRU02kjmf
         RzDlI909p3HNukZOlRd9etC79cSy8D3sUF5BNOZXGNjA4acoA33e9Di/rjr/gjwQWXU0
         necl5bgMxrQX+xQWXnAGsSdtAzGGc6wQn/6I6V5MP2vL1A4RlzUyJQBEHSxqqZJHTR/p
         jGGYIOVfA+rUL5ZfhuOHpglhpXSqt0/Gnv+BsAj0yPENPFi5DRUbrSZX8NtObPR4zutG
         +Tig==
X-Gm-Message-State: AOJu0YwEfqgZQz5bU/Znl07/MthfvmOyoBWG0Io1rLeMk2SvojvCmlF3
	VB8PHf+z9TAGQOKSpFDFLEoXbuZiynKk30ZstIOAVP55t4PIYvJ1gqGbTvZ8+2huWQhOBgITdsI
	5BtnNAmwI9Zx+ynfvGCJl+cmsOVuBZFGi/muTIVAJe1h5HnwOwJzIpo6c43T+7OArCQ==
X-Gm-Gg: ATEYQzyDxUGXuKh0kAM7ukQeF7E2zO2aQHdLAM3NNZcjjAqvcy/SkjS/UFwqKKGWPNe
	qg1n8EdVvZVUfRmB918/5aQ87WI1kIBitv3bwnRDyhcCdsrBgcD4EOrRy4ONFdI+O4bnN1QrUTn
	wh+UZCB6HoW10/GLnFRXIud3se5BqMDqA9fTdZud+iniocr/GeQl2R0JKX350GrVCxSXSGo6JW/
	AgHR/JWN3GCNp/MnOSJIkE0zP70vMwZcbrW0pYmwmQZNxX+AX9ImDgE1X7Uxbk4WVdvc4mMLhRQ
	uCUBnnZvS3THqrGpDZB0iblA44h8N/xCC3LbUeBZPC9zqmbtsXoUhbphPQ2QATQG7o0h52Qai+E
	gqdM0QGmWKciVx6mvCmpDbcHzYBlBhPy/lghi8PbEaGuhEfFriycnbe4TM5n/FEpPFNlJ
X-Received: by 2002:a05:6808:2894:b0:45e:f07a:fd0 with SMTP id 5614622812f47-464be921981mr6049627b6e.6.1772528544283;
        Tue, 03 Mar 2026 01:02:24 -0800 (PST)
X-Received: by 2002:a05:6808:2894:b0:45e:f07a:fd0 with SMTP id 5614622812f47-464be921981mr6049608b6e.6.1772528543849;
        Tue, 03 Mar 2026 01:02:23 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb604f5esm9288908b6e.18.2026.03.03.01.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:02:22 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 01:02:13 -0800
Subject: [PATCH v2 1/2] bus: mhi: host: pci_generic: Switch to async power
 up to avoid boot delays
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-b4-async_power_on-v2-1-d3db81eb457d@oss.qualcomm.com>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
In-Reply-To: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772528541; l=1362;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=3jdrSYFufk9+/Tbwq5b4Vodf1OshkwsP1bTuXFhDNRo=;
 b=X/rlUdXBoLu+hAOze8ikgPO4qyNqDrZJcCS1nj63JaJ3DTc0/gu4BxxQkxD9GFoRSBQADLd/q
 j+Fl1Imy8hPDLMIPr3P1RQytOeOcw7ZIvK0RRMEOtcc1ej8nIOGmqKA
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: jKD41jVytardor2cljaZBH5UGLroo8Jo
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6a3a1 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yFp2A1wA7JFfkWW7:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xQtohAntiWRCc_MJuAAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: jKD41jVytardor2cljaZBH5UGLroo8Jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfX/Gs8ZJlWQBBo
 TlV+VYk8Y9xtbTh16QCNYxVolaeIssSW6ZvqWmS6uC1zAm8Bg9QsqLxqk0WHm6W+AnDU3oTrY0Y
 rrmXqCLB8f1dulOWKFvS1E6GW3fGZgFJSo3Ix5jJ8xc8DrJ51FIjl01XPaJjqzK47VGU+cZ+l9H
 Z2uxw3k+Lf6nVt+xRPOj0P/67u5IZVLJ5Y1F1Wp3IHNrzaWVo7dc3DHaBZL45e5DIQw6fPYyeSr
 FQW0mEJWWTcOAfN+a1e5waRgKv0dQxOVsiBgWSC+LxOtvJ09PN6uLbYqjqEOCndcweGiI4xOTQT
 lWAZkZnd3S3NuH9sSdrExXk8Gan329pMrDm1aCtOl1uDf8YCNGDVVanoBDBNNisEBBKF0FE61sT
 J7ta1NqmiYSN9uDQOLr+OBZ36seXPn7iETzI5YIcK+5/ygvPVnQ90X5oqooSVFURzNiMLHwaXLx
 y2Xz8BWThWu449+82Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066

Some modem devices can take significant time (up to 20 secs for sdx75) to
enter mission mode during initialization. Currently, mhi_sync_power_up()
waits for this entire process to complete, blocking other driver probes
and delaying system boot.

Switch to mhi_async_power_up() so probe can return immediately while MHI
initialization continues in the background. This eliminates lengthy boot
delays and allows other drivers to probe in parallel, improving overall
system boot performance.

Fixes: 5571519009d0 ("bus: mhi: host: pci_generic: Add SDX75 based modem support")
Cc: stable@vger.kernel.org
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830ea9ef30acab748b07f04e47f3d90..0395a8ea52b0e874209ca56cd20ed04419038cdb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1405,7 +1405,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unregister;
 	}
 
-	err = mhi_sync_power_up(mhi_cntrl);
+	err = mhi_async_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
 		goto err_unprepare;

-- 
2.34.1

