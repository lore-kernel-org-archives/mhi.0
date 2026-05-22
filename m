Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0961738734D
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444069; cv=none; b=IQBDGYIrQ6gQsrvcV9ziuIDfJ/EH043rCvbp+qBh9EeqNaVFPW9MewhFVBw8tN/lTIa9lU71c2E5qIE/fZewtEWaU9MI+xGEpEPI7pDmy3lJ/SV2ucFyBeKMxO3ubP5rKB/cCn5rLk0TIMS7iWPe6kxJDSEtxD9LejEETX1trEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444069; c=relaxed/simple;
	bh=UBj9I2ZVbQBtANcm1Eq+93YFWtxJuvyInNBweC3+uv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VfwJLUInuHWOWz11mUBtu76Yo/TGvxqQ59iMdkJ5OLJbmwweCRh4DzYP1G8IrivLdLmRO4meeY4sCYc1BunO1aZyjhG+jei1qcX2hfF+PLhy5bja0XzP+L3QJ6c6jAl4foT+sqnDsR1FrCiKCWvt+8xNfxPbLEnCau6ryddMEzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMMVqtwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLtuoNPG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMMVqtwj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLtuoNPG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8VGj63532135
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=; b=DMMVqtwjFUO5A5ba
	PHXzJrQrW4s5dtoZxgR7e7xc12CAp2Oy8N8Bu3nWnTUq4D7z4ueSCSwOMEt6J6dD
	DGCS1vxxT3Tib9zmxfd0MqOjRP5eH3aBdloXsnXT9iKYvSLZn+iD64amHlA8wJ8J
	SehF/RkyLz71llNTdyhXDbqcdoX9dUZgLvLewrciT9iIQM+1UKwFv/KR7lIB5pOg
	neAzKnI5KVnD2g3fq9+/XgSbcfzd4RZ1hroGzJBj8xONyNiGA0gEM2mUatzUtZ6n
	zXVd2DU9llaqbnAEOK1cTg1EmxMndtF5+/G7Fckskq0e4WM4ghJvZCl+en1SVJrW
	HPFEYg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvgxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:01:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82c477290bso3844858a12.3
        for <mhi@lists.linux.dev>; Fri, 22 May 2026 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444067; x=1780048867; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=;
        b=jLtuoNPGHp3aNjk3FIFrS2cfJ4AAL5OwizXWyGhqHG7DqtAjh/iu9cEY3TTk+vPwq4
         FwblSwDZCOU5AH6QOeEIu7z9Hq2mH3/DhxSDCYZ4iArBgAe8WHjd7MlCo73qBLv1B36Y
         R7nOgDBm4HNuTijj7MFwhPk07e7Dvq4y3vMLy/MdPJRS+IG5RmyTVuJU3B/bHoFZrjiw
         1iSveH8tCcxt9vXfNXtuOziQd6wyhwKhU2DysGHSI+j3ea8Aqey8vMU9unnFdtCoerx7
         EnJZPESimde8107PTjwBA8De6YnKFCX6cRI/jQGwIGz4TIuaqPQ7ObMCxqR8h9RO086X
         KoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444067; x=1780048867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bd+nfDwDIbDnF5mLnuaN9+Mk0Lao6hQ83OhFSeujfCQ=;
        b=U3KvdQcE8HgAofgDvOiCro7pwAfsqB/ymoD0YgKRL2CUgtiz76VnFY8w1usdmw5vqF
         Q0RE2OTHsAhDKtoujZEjFvqmz886JgmJRqigclBbzOaKcq/SG4IqC+N57UyL7PSEQPYR
         ClSftQqX2Yl1qKGjsJ7dpeE1PnLpKBsobA1MWycWNUhvQoPKha3/6+zF4Q8j0yeDhZ0s
         WFutrseYt6CSkQWkbg8R3D5sQChoXT8gzuoI816X0R/naOR9a1CCbcLikmWfB9qYO52k
         dMXe6w1K66R4wuSJdJarsFCeeBmGpXgHNYiV9C7pDBL1Pw85tHexSudDgwJykIbRZ8Q2
         4RnQ==
X-Gm-Message-State: AOJu0YxkNv1IDabgjY1s0Ono2bd6qglAKGDsDKOQQBF0lLn+0jvSfW3g
	4RlxGzHmHostrFoq2aSOzHuCCICCQOF68MT4kADUFaKzRAb1bQWlsGlNDVOOrmpbFbJsBwVpan6
	9E6s6hTGBx1U6Yni76e361oxYK0xmSxn8xUIMD6syjFeQ2yXcTwqMIeA=
X-Gm-Gg: Acq92OGNLvwaJlf+lbburlos2CWIuqVaqi43/Xtyc1HeM5E0t7Iw8WOBmW8h1yptTjK
	qAJ8jIXycONYeWfrbbLWJgqc0rfQU4jWNKObtuxqiEkwmS7Sk7CMKmSbMWxGQMQSmm4ShpGQpXX
	oEZUJYQ1IcmcgQCiXhMuDAAPwu0jjtl+JUSvF+hy5hdOpAjZrnomWTjVT6zC3WfnIPuNEZZa0X5
	NPdtWrU7acyFpDYAYhDDWmDRzzO34IRlntVygKKfov4DAfC+VQXFZSGZW7H6EjwYbZ8bZo3453T
	AVaIbEi0B0qEu9CTDLiosFUXLQFND73fLInt82sRB7GaT8omp37XkLJxrdDnh39TVLx+2eXEAgr
	gQe8pBzsPRxDC5gFxJJF5sTgnRus8lrggUTG4IX8xKyWd0WFfkdRqZTwN
X-Received: by 2002:a05:6a00:3e04:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-8415f66c854mr3352519b3a.30.1779444066263;
        Fri, 22 May 2026 03:01:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e04:b0:82a:7471:eb90 with SMTP id d2e1a72fcca58-8415f66c854mr3352459b3a.30.1779444065675;
        Fri, 22 May 2026 03:01:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:01:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:30:33 +0530
Subject: [PATCH v2 2/6] bus: mhi: Drop controller runtime PM callback
 indirection
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=7368;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UBj9I2ZVbQBtANcm1Eq+93YFWtxJuvyInNBweC3+uv4=;
 b=guQyGJqG4mutdLlQ1ChKaWEf2g1AbTVPnm7d7mM85MeEF+AFm5bB3tofJI+ZSZEhBZZl45OeD
 YNohaHam4p7DV60pWefjYxjri5JSGcRQkh5MsvyEpd1J63k03Al+5Aa
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102963 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GfE3bLbzyHi1VA9kviUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: -mlpLsrIq5jaROgMmJkL2kUbR90qwaEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX5MYlAzQ3sFBH
 3FdptmDxNFUb/wcLMGZzIajw082TudUr3otcDben87DBJDpa+LbEG8I//B2idCEQLClxj1HPOoq
 ecVJYNqhZhLzRvO+TArFBPb33PGEnaAHAlwVE6i5U9XOmFPH88UZrZRUtmw+XW1oVvvwZqyo32j
 bWe0QhmArYCn/14hSFsot98hhK37STWW38YkA6ch7hCt+5VuoV1m1baXAJs4LLDsPB8A49fncQe
 fpEdPls8xNafQDcbQF9v184LUcesVRpLzVM2f7039jXkUL0sHRf+H0tOSUzaWFh5+0Z+V95mxag
 rjmqPf9ZuSOiDEMkBquMZoL1GMNbr/Hjso0ZixRkIlKtqK9bRxGOka1OosURB19T8SbvdEMZfxJ
 T8cYi3kk1UhjRNSQaaQ3a8nQ2f7skGyciaNbV+MlqCv6xTaySLfKp1yhRa1dFzQt/diZDCx8vdE
 3jrc/BWh6bFmA4vz8Cg==
X-Proofpoint-GUID: -mlpLsrIq5jaROgMmJkL2kUbR90qwaEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220099

The MHI controller interface exposes runtime_get and runtime_put callbacks
to abstract runtime PM handling from the MHI core. This indirection is
unnecessary since the MHI core can directly use the generic pm_runtime_*
APIs, and the existing implementations are either no-ops or trivial
wrappers around those same APIs.

Remove the runtime_get and runtime_put function pointers from struct
mhi_controller and update all users in the MHI host stack to call the
standard runtime PM helpers directly.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c   | 11 -----------
 drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
 include/linux/mhi.h                   |  4 ----
 5 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 4d787f77ce41..68cabfd2df2d 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -776,15 +776,6 @@ static void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 	writel_relaxed(val, addr);
 }
 
-static int mhi_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	return 0;
-}
-
-static void mhi_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-}
-
 static void mhi_status_cb(struct mhi_controller *mhi_cntrl, enum mhi_callback reason)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(mhi_cntrl->cntrl_dev));
@@ -845,8 +836,6 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 	mhi_cntrl->iova_start = 0;
 	mhi_cntrl->iova_stop = PHYS_ADDR_MAX - 1;
 	mhi_cntrl->status_cb = mhi_status_cb;
-	mhi_cntrl->runtime_get = mhi_runtime_get;
-	mhi_cntrl->runtime_put = mhi_runtime_put;
 	mhi_cntrl->read_reg = mhi_read_reg;
 	mhi_cntrl->write_reg = mhi_write_reg;
 	mhi_cntrl->regs = mhi_bar;
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 750da3dbb4c6..cbd2b442df83 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1220,23 +1220,6 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
-static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	/* The runtime_get() MHI callback means:
-	 *    Do whatever is requested to leave M3.
-	 */
-	return pm_runtime_get(mhi_cntrl->cntrl_dev);
-}
-
-static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-	/* The runtime_put() MHI callback means:
-	 *    Device can be moved in M3 state.
-	 */
-	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
-	pm_runtime_put(mhi_cntrl->cntrl_dev);
-}
-
 static void mhi_pci_recovery_work(struct work_struct *work)
 {
 	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
@@ -1324,7 +1307,7 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
 	}
 
 	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
-	mhi_cntrl->runtime_get(mhi_cntrl);
+	pm_runtime_get(mhi_cntrl->cntrl_dev);
 
 	ret = mhi_get_channel_doorbell_offset(mhi_cntrl, &val);
 	if (ret)
@@ -1338,7 +1321,8 @@ static int mhi_pci_generic_edl_trigger(struct mhi_controller *mhi_cntrl)
 	mhi_soc_reset(mhi_cntrl);
 
 err_get_chdb:
-	mhi_cntrl->runtime_put(mhi_cntrl);
+	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
+	pm_runtime_put(mhi_cntrl->cntrl_dev);
 	mhi_device_put(mhi_cntrl->mhi_dev);
 
 	return ret;
@@ -1385,8 +1369,6 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
-	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
-	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index f994233df2bb..db163a708064 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -226,14 +226,6 @@ static int ath11k_mhi_get_msi(struct ath11k_pci *ab_pci)
 	return 0;
 }
 
-static int ath11k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	return 0;
-}
-
-static void ath11k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-}
 
 static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
 {
@@ -380,8 +372,6 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-	mhi_ctrl->runtime_get = ath11k_mhi_op_runtime_get;
-	mhi_ctrl->runtime_put = ath11k_mhi_op_runtime_put;
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..9122837e5206 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -100,15 +100,6 @@ static int ath12k_mhi_get_msi(struct ath12k_pci *ab_pci)
 	return 0;
 }
 
-static int ath12k_mhi_op_runtime_get(struct mhi_controller *mhi_cntrl)
-{
-	return 0;
-}
-
-static void ath12k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
-{
-}
-
 static char *ath12k_mhi_op_callback_to_str(enum mhi_callback reason)
 {
 	switch (reason) {
@@ -256,8 +247,6 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->sbl_size = SZ_512K;
 	mhi_ctrl->seg_len = SZ_512K;
 	mhi_ctrl->fbc_download = true;
-	mhi_ctrl->runtime_get = ath12k_mhi_op_runtime_get;
-	mhi_ctrl->runtime_put = ath12k_mhi_op_runtime_put;
 	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index fb3ba639f4f8..46ac60d01846 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -361,8 +361,6 @@ struct mhi_controller_config {
  * @wake_get: CB function to assert device wake (optional)
  * @wake_put: CB function to de-assert device wake (optional)
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
- * @runtime_get: CB function to controller runtime resume (required)
- * @runtime_put: CB function to decrement pm usage (required)
  * @map_single: CB function to create TRE buffer
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
@@ -441,8 +439,6 @@ struct mhi_controller {
 	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
-	int (*runtime_get)(struct mhi_controller *mhi_cntrl);
-	void (*runtime_put)(struct mhi_controller *mhi_cntrl);
 	int (*map_single)(struct mhi_controller *mhi_cntrl,
 			  struct mhi_buf_info *buf);
 	void (*unmap_single)(struct mhi_controller *mhi_cntrl,

-- 
2.34.1

