Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093051;
	b=njhvW2Xrl5ldVDIViem1uNR/iKlyUMPkPraOhnfVoyy0sQEEBphYfZOwZyS27R6hMAPV
	 Dgjxlq+5SCZdmDHzQt+hQtM1Kv7EDUcC0jw+CJnRstT+qIjs9giOGHdg+bhv5AedrilcM
	 h+865dPolPj3ioaw98Gkt3tkODVs2fZQv5jhZwSHlOO5HXgwIYzx9GtqUepJuLEuyJyyV
	 g9SwIQLqez/oSvoncwtibIvc/ZBldnjCw5Nw+X5udCFOeTwXUDyiCKlJZIMpSwyUQIj0h
	 fFTo0txVb/I9/LJbBikcC2TdNne6az0rak0NwVbrXHhRcfl6k+lc69H2v34E/2O+qMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
	b=4yqf7xj/uDrIQo2yv7PJPqBzAXvoUxWFhVa8IZqzgCdjoS6/RIyisHzwBWwoBWnGOg4M
	 MvqBXfM997SCcslfPzXugg6W2EF+FuRo0vG0vSL8vWnKWm6UI3/pIOTAEXPQqinAZEmS5
	 ISaw5OgdsqPUroJQmy+RZE9qqCssyL8FOSs6I0uLDgb5nn/ofeJp3rhbhTp2Fb2mYwTAq
	 h92o6NgYBGpQjTwoTSd2NqQXzu4Ns/TeeVl8m1CXFMtL3iClEGqu3fXfwAD0kwmvj2PWu
	 KoabsnJSzECO6Gg9MFergkb+waPBrNPpMx74n9nOK5vKRKiCB/PN6ts5zZ5hCL3zg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyyxNgcB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJUchojl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2185606A33F
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2185606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyyxNgcB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJUchojl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkU9o085308
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=; b=lyyxNgcBYDgj9KbE
	qmrx/XYf+tSkmtbyWk2R5fDOlviDxyoc05zZdzmgl3+DWButP928RJE5AItYT+cM
	s4cFX+ar6EkcxU4ajGkcXdbQvBRETTlCVv4XAmwU+YJ+HzYAo4lwDU5vRQ89MbjI
	yeoGY6hxQEuvqD8yUAbiXCUyFjftFeqAf1uFcbzKRKuSjcMCX+zFhp/9lKM7SRE+
	MvKbDyg9JLhmzg8mxzSHa8BEt9XWZyYOMVh16bIgqr6dWiRaVtLqh5X1gB0izFfA
	TnCxesXlUN18Ppwqq8CQDl38cf6LEFvMhAmwXPcwZHuXFE6xnDkCc+gF9y7oCxFY
	O5ZfCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2savq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3837afac185so4027744eec.1
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093048; x=1795697848; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
        b=TJUchojlSfVyaXjcmyJfS8ch27+6sdKrjvom1eGdUzv9dnN0vEDliK2KZvYYUmk+UG
         JM0iFiASQGrtV4U6+uLZLeNui7a56kERZZrZK4XYdZvy/rxoacjoz8NPYUL+ES4qiquL
         CFg8eST8vDGNK/e9wwcmCpPLIZKskcBNtQnzxW39jNR11ilXUo0mzSiX6lbgCBDoPTqJ
         Us+2EEfaqpZx64bMQq1P9l7jdc9yvDq3ytvkdIExgTy05qVOhzNRWSIxVEUOGCqMMcCK
         TF/g/18FZTxlrHvB4Yw3yAzFwcV3mH/FqJ9f7IghXj8zPGW3NvdQmLNVuU1Bz940ZIER
         Or/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093048; x=1795697848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tTgIxDS6XJO6n2Okvt3qag/PelJr+pY0yiNiIOw5fs=;
        b=f7iWMM56Dxn0sCs4fsYuRJX8Nisul6tQm9ghBGaPsBV9S2R2OaP8mIhqXciEpvhG5L
         sIgMg0XwvMopRnKib1pdNOUsRKDygvaZ10musPKunQ8JIn5aG/q5bo7ezJoEpOufziw0
         4RNhSZ64PssGFzlBK7MSZStzLNULine+OVH6IQZ4UaXrkxANNPaeCkpT4G1H0GUshu8U
         GWk84OUnAKNgpB7cFjWozU+wWLrKzZV/0BFVivM2Dv8ZDyL8YypdoY6fzDPAPT4sjX1t
         0WLBCFEUTAowK8vkN84R/xgeSA+Cq18Eu2AZ3T0ux+G2AHoqo31c4tij0Iyu6OkZLifj
         5kOg==
X-Forwarded-Encrypted: i=1; AL+hErGbPkqcwYlCvU/Y2itQA7L+mdEfUl0Ury784zuifypNaIVzPQ24LN+Xtah+Skthr72DA4o=@lists.linux.dev
X-Gm-Message-State: APuU4Z+91pNyLyQPFI7zAZdmOlr/8SRtEmOuUH9gbQlnnMSRL2Rn8chZ
	8EUV0ghrTaYbha5miCfVrgKibaoo4o/scGV8qyrwsjzdenbF/uhlsYXG6kIhHoFl6yN1HOPFBiG
	Ghh3pp3FI8NBcnQ39Py0f2srK4Huts12OB3JGYHJfJVdB4xlTr3W26Qo=
X-Gm-Gg: AZFdTZdIj4Cfh0k0zqMhEnLCXNahdz6LBUcTipTD0015wqSvgQV3rX9TMpGvwmA/e/W
	zT84Sz78SomdbApC78wsaUUr95U48IzRHCJ2FtR20WQ8ANnkX5RwQUT4Ga/4V4C0D5EwFq6Dzan
	0PdcZeq18VO6zx2tYAZl/3mDp9vQuIEiuDOehxGKJfLWSa+N4lXuOvqoT3e7NWdDAUnO+mY2u+p
	DgLrWnouuRtKXJlD2Tch/y3jbEUFgg8b67Gl3/egi+jsuXGqyXL7rbfRZXTmbp68PDDkr4Jyhqv
	QyDs61RjG6KFxBKqcBkTTmbhk7lo4L5iFM9fHAGQ9n8v23jTz62ROp3sNWhsQFbEH9qwgaqyuX+
	euC1L/6WCZy7VmleepX+a8nF91pSOHjMtLBK80kqvNAbyKtcjIhr0Ct946VXMy0dTexf+IlOWCI
	eAAGgnFuiw
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr6041420eec.15.1795093048279;
        Thu, 19 Nov 2026 04:57:28 -0800 (PST)
X-Received: by 2002:a05:7301:6f8a:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38280c30d3amr6041394eec.15.1795093047773;
        Thu, 19 Nov 2026 04:57:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:38 +0530
Subject: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth scaling
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=3223;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yAllDll9YCBe68xUUxCszpos4lvTFYNXK5z/BwyDl/c=;
 b=+k1xuH+OKoHdW1RPtGLjE1H45txjZLkvtl/v7yQ80cCbYV1mjZYC938l9WQ1zSE8XTI68IedX
 Cs+qfOOnDbNCo9/sL+ruhb2wxcVo6/Bui29ICuhdCaqKSD6tDrSweoj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: r8P0SASRx6Rwvs51nh1Qz0dvKpnxWjLW
X-Proofpoint-ORIG-GUID: r8P0SASRx6Rwvs51nh1Qz0dvKpnxWjLW
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afef239 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eVNgtL86jhWfyD6ZVDoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX/mZcvwYNrXdM
 Uws73jDUb6qNgWkic/VxbUfeatSWgcjZmvt3Ecs/0dmxo9XpCp+ec0S07UnJG0dlup+XBEoUj/a
 nyRuMqHy1zub5ArMNX+WzFL/017cebI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX4pL8I9xL77iI
 S3de+enmpbCmK+AmcMVRUi9+DEa/Q1uR5uA/po/UY4IX1jxf/QhYLYHiH+3d90lR5o+JyeEDXYF
 VUZmYbcyd9E2R4l3+6WyyPyaKZrH5DnAcJe/wckPy/GF+s5VA9tAbDzlEEo6rUc9HoWGuZSiTG7
 Dl9I20Dl2H1We3ljn3AzOiofISn0gr+gj5Hl1o4ikNgFvGlpmBt/xzKVUFhfLxsEbh/g3PSXc6t
 6HrQ8v3xclPjIjhlyABUBXDMxQQPvSnDKPr2WmWwzZrBY7L0g0h0gNgLDfIAY1HHpktAZL2N98p
 ppxnLP4ASyYPiycrPJ4vudGqIer72PXiFhPxred2gUgXiLVKcGGLaOAmD02mhS4mVm75hE59wHa
 yH+XUdMKsnuA/+TIhb8ePAewiv+LzzNF5KDGfwcII2gThCm6DQmo1XdNZm76n26UA5jEHn+ES7G
 +7Q2KLJ6OMtZ6M/MESQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

Add support for MHI bandwidth scaling, which reduces power consumption
if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements: with high bandwidth data the endpoint requests
higher data rates, and with less bandwidth it requests lower data rates
to reduce power. The endpoint initiates this through the MHI protocol.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mhi.c       | 16 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/mhi.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 12 ++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
index ee87f00bc5de..16d3f299c47b 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/mhi.c
@@ -184,6 +184,21 @@ static void ath12k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath12k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath12k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 {
 	struct ath12k_base *ab = ab_pci->ab;
@@ -261,6 +276,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath12k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath12k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath12k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath12k_mhi_op_bw_scale;
 
 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/mhi.h b/drivers/net/wireless/ath/ath12k/mhi.h
index 367432676385..7187394458c1 100644
--- a/drivers/net/wireless/ath/ath12k/mhi.h
+++ b/drivers/net/wireless/ath/ath12k/mhi.h
@@ -17,6 +17,8 @@
 #define MHICTRL					0x38
 #define MHICTRL_RESET_MASK			0x2
 
+#define MHI_BW_SCALE_CHAN_DB			126
+
 enum ath12k_mhi_state {
 	ATH12K_MHI_INIT,
 	ATH12K_MHI_DEINIT,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
index 988affafcfd1..c482f0e04742 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
@@ -120,6 +120,18 @@ static struct mhi_event_config ath12k_wifi7_mhi_events_wcn7850[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.doorbell = MHI_BW_SCALE_CHAN_DB,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 const struct mhi_controller_config ath12k_wifi7_mhi_config_wcn7850 = {

-- 
2.34.1

