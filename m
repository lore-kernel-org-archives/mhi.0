Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FAE36E486
	for <mhi@lists.linux.dev>; Mon,  2 Mar 2026 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458893; cv=none; b=hwZ9/I7YryUG4Gk9Ce+E4y61R+QPioWQVUZ/NByeiHBOhB1bYLKgG5R0pVF0h7kGC37wtVUxenlhDL8my5ushzNT9048K/L99tqdSkthGQ8lSKvYYSp3kMHTzDSrvwtvdmXprUkvoI5BbOvfyiUYoVWkt+KXWD3SWjsQ3bCcnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458893; c=relaxed/simple;
	bh=BeJmXbNjoTu7+hHdqxvNZAqQtEzTchLcnDzAK50yUcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZINbP+GY7RTJRubJfB+NMhoJM8NzOFYzzxfP+KkFVNuR5MK9Qk7k8L0pvSDCSnolt1BPawwul4AxhQOa+uyrObXyhUfok9m0an+2FPwQQ6cTlI2sqzaDcmSKdwUZsyV4mqvSX7wXuXmhdEtSW4b66XBN6adG+A7luP9gzGgpFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh7RFisp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCbd/+9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh7RFisp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCbd/+9p"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294ee33753104
	for <mhi@lists.linux.dev>; Mon, 2 Mar 2026 13:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3FvuMRTJ9t5Oa3prM87UIj2ZcMgQFfKYy0B
	Eopqkflc=; b=kh7RFispu0Iu1Fv1+SHRLwEdXJTooXZHWkzTJNjOC2F04tuAY50
	fjXDRPg+RwH+WdHTXUqSmgu3FqvewLehBkK2uQGvShNK9dLNm3kLXUqjSa6Q5kz6
	H3NsH6jPLAAvW5ENVxOCzBopCvpmN4QfV0D9PFRo464Zaqo8PvwQDYVqiAIi/bn5
	0Z786QymS6rQXB2Xh4GofXseLiSKgv3841q3cHXu6bVuTnpKOU38TqmOkW0jz5sw
	hfDc2mm/eiu1EuWGVvLbMNDxD987SvGoin2DZJf3ER6oUq0c/amlS1o8o4zQr5ow
	jmqMF4sxqn8FIEgIv9oJRaN9yw4cjNAaRbw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8x5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 13:41:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f2120583so2567583a12.3
        for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 05:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772458891; x=1773063691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FvuMRTJ9t5Oa3prM87UIj2ZcMgQFfKYy0BEopqkflc=;
        b=DCbd/+9p0hs+JV7yVElsv8miTDF2pXk61xzzMsI8o8UWXIfSJGp4N4KRlUNlX9INUp
         Ljoqi8fsK7xQ3UWjqhm1bD+B8KkT/pevmKlsQnlA2CdcsM+9ubRgH3PDX7SH84Gj0IXS
         u1YWcj2EKo3WZVFkjK1q5o0rNXJVrFRjFjfz8Kyk5ZDyL/Oq4UzlJYY57ujh25VjFssD
         UcAzg654d7JNTCjjLKktAcuDpvQD5Hm/8tZBlYtBgL/byoKwHNqzQ7fW5HVHiAVXXotS
         R04YPzZk8zV2Fz7e0BxyT3GU8EcU9YTBYuEKrA0PLpW3UqevRyD8PLyno2DXN/L0sy7t
         DpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772458891; x=1773063691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FvuMRTJ9t5Oa3prM87UIj2ZcMgQFfKYy0BEopqkflc=;
        b=F1c0V8nBiQPU6FqsPyFGOXl5CX+Bs/VdEwRFcj1aTUQyt98BJEPok1ArRxYLlITe3X
         WQ1ejuSKUr6hXSnxe1qFo6orsohfepTkviOXKOisET6uvZLAZUTP7RSoC+ln+r77CINc
         puIiV3QCCJY8BKWsL7pv2XOJnpmv0MAIxeLg4M+REud7tnmBSrZ93srkb+jzM4KO91Uo
         LSiEp76mPcglNJwTdADYzcYgE5va7rD8IRAAFt2QsqJTBC+dP5P7AoHEUEsoPVg78e7X
         rzcYcLMPfaVUCoVdjDrXatizVeC0ooaLeYNNyOshzeAd+HRfRc7UZA8g44ARgb5yGK1b
         64pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqe3qh4YUgeq7qOubWA1MAEumC97a4bTi1odcD6l+rsxiDXi2NhTNI8W16pnTYvbDe1Ak=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9ycP5hnijzOkyVCnF/hS81My3WZbV8j7KvJd44GgfxYmcE8gM
	4dJXSkHxm/hB0cLMDyFAXmNVadFugh1HOlIoOzZVYUqPF255cZIHGEOkgtzd/LzmohzdYwHWDw1
	rsm7OGTH8ol7P5XHUoC5m1sF4IOAk4t25rZLLBOGtmmOOmzlA76FKmvQ=
X-Gm-Gg: ATEYQzzezHZgdalpWaaaqrOraISA7mywI2KkMW2OCI7+iG9NdNuNRMnGMNE5JWBWrxy
	vgIlQbC0iWWp+U3XcjIRrOmyjxskmbEggVgTlfs34TXWUrtd7sQBqTrcTkn6J60xffxKOktguXU
	kdkwR4pfEPE77UWX5ILYvPzv94+/65ehljOkljsSfPO/1g8RdkXojY/at8hCDRod0rJEvKFmLeE
	d2sOcZ/KeRRCae9RZpT0Rrgr66ykMJR6HAEAd1ZGUDOqTyQCTPvEtT+0sRRnbDZ1ANgNPepDPRB
	CenT1ITK5SoMzDQXBX6n/Kv1BHTi1cbWPnmvLFDseP0tAE3KrKB40uog2yWfAcsr6FbG8Ag1J6A
	tw0agtTp0ZXIMk98bVGlSCrR3+KLHR6LqoofcoBE6ig==
X-Received: by 2002:a05:6a21:4982:b0:395:d4e4:2bde with SMTP id adf61e73a8af0-395d4e432bdmr6390685637.30.1772458890616;
        Mon, 02 Mar 2026 05:41:30 -0800 (PST)
X-Received: by 2002:a05:6a21:4982:b0:395:d4e4:2bde with SMTP id adf61e73a8af0-395d4e432bdmr6390658637.30.1772458889986;
        Mon, 02 Mar 2026 05:41:29 -0800 (PST)
Received: from work ([2401:4900:88da:227d:c631:5c3c:695f:8a61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa632ddesm12292498a12.13.2026.03.02.05.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:41:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org
Cc: qiang.yu@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Resume the device before executing mhi_pci_remove()
Date: Mon,  2 Mar 2026 19:11:16 +0530
Message-ID: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PVbCXC9J7vF2ynCyCZeQXaDxsx4mpDON
X-Proofpoint-GUID: PVbCXC9J7vF2ynCyCZeQXaDxsx4mpDON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNCBTYWx0ZWRfXwaN0chzCxPmr
 dXdK5EBP+dNuYK2rj/ZahM/jxbm9SpHmoSsQMjBz5kdQ0KPgs42BDNGsHh187V8sz7xH3O81BG4
 qWkCzmnKovTpmDksVuMH1hPoi08DdT1rqr0KDlKSOy7btZJkh+FebBNA8WeDHgpRk6GtnLXLKX2
 fKCeCgQmu8gBpSzC6IGQWr3oOwn4RGkc6wzbCjwsB5P50+Q0LupS0J7X8AgbPZeM5q1ygfrdn6K
 uKNIO9s81T+n4+QFzVR6B9GpcmHHpP1eLBdvQ4RwSFG6TZvQGO/Evm1emQCnNG1lxZAuXg5D6RT
 qMf+aAlAaHyl97vYgg16LZ2C9IUfJHdqf8tF4rpiqC0aoFiOe0uZeeQZ8FIc33xKHZ/if7j0Zei
 6hcrG3MITCCtQBnyoSHS/jQ2FTkSw1j1y+YpDMyhO9PsEcaHvLfuCeEZMfGIRqAFcIGpLqR20if
 tz7aRaC2TBTuINcr3cA==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a5938b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8Mze1DJ7461ulW_4NyAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020114

mhi_pci_remove() carries out device specific operations that requires the
device to be active. But pm_runtime_get_noresume() called at the end of the
remove() will not guarantee that.

So use pm_runtime_get_sync() and call it at the start of remove().

Cc: <stable@vger.kernel.org> # 5.13
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830..fe3aefa15966 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	/* balancing probe put_noidle */
+	if (pci_pme_capable(pdev, PCI_D3hot))
+		pm_runtime_get_sync(&pdev->dev);
+
 	pci_disable_sriov(pdev);
 
 	if (pdev->is_physfn)
@@ -1451,10 +1455,6 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
-	/* balancing probe put_noidle */
-	if (pci_pme_capable(pdev, PCI_D3hot))
-		pm_runtime_get_noresume(&pdev->dev);
-
 	if (mhi_pdev->reset_on_remove)
 		mhi_soc_reset(mhi_cntrl);
 
-- 
2.51.0

