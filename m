Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AA277026
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647820; cv=none; b=GNKDLF406yg+T+oMtIZYs6+DF71O8ei7haKis1KDzMtRwPb+fvYNtoEMy2GTUHiav7UqNFXhQ3zMOPbRfxvp9LpB1+ivCcNOELTS0U9U5CFYZjQlkImyIS8Zsv8Rj35Zybdp+VKRZxy1gYLAC6PLnQJhA6ENHherboyCMg80DYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647820; c=relaxed/simple;
	bh=T0NWxEeit0FkTClv+OgVI5h2belfjblWs7pI02lhyuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmx/1VuprFkv3K/+KfM3EoTgFki6ggWHsSl9x27FZTy/5aKcBFJ2bBDAxPgsx0Tagh0VYUTRKqc1mFO3QPavvbupq4MpcXTUDvQjMeoosz6+RlwUu6IlCa3CfyafMlyRT2UjSkbJQO2aAgdPz6zuZm4tHY+kOEXk8r8JAdqL7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cofpnuv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cofpnuv/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9YqIm014902
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRVHI8/PRu42Vqh4HuSgclK2SbkQHWxggBlquWyWIxQ=; b=Cofpnuv/SbPbPmum
	mOg/azUhsuV9+yaOnOWWnXp43mis01mYqJ/AuFutf9LrYHERSJD6HZqK+FAIIoc+
	0dsW3IVCzIBrX4xqZEx4iwcFNvOUcUmmlUTwkCaY7KeK3vydbcj9gVFPr7LoLMMm
	8PpTb8iyq5gKfYDwoooQrOfoAcssj6cxlpjQiJlHwjP/A8TxnyJQLzJxm4VWaorP
	fR8m3uLyoh9mctfKKm0vpL+QTCElfnLatCKGL/NNDkCS8yFsEXB1Gxvfh5zghEA2
	aV9MChn3tpJsjz/mAF+Jpaw2uT05ew/JKG8UtKqVGS74hAMZEElrkd1wQZ6ZhDCm
	y4v1UA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsuuf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:43:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso2674350a12.0
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 02:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647816; x=1748252616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRVHI8/PRu42Vqh4HuSgclK2SbkQHWxggBlquWyWIxQ=;
        b=fsUX7SPX4Um8Mxv0gZwx0YybNklb5bwuHFo5oOCPdlxJg1buz+5Rz0yAEzUEwWDa7K
         GWSdcHEwt5iGkHb3Mj+kd3jJFJO55jaEsO6l4L9kVo2u9r5840iSKPEScTP/Y65+XBtJ
         7MmwTj1tPjZsmOXTpOpRNXRPKlPELdkeailNOTMIbo7XLdOIoiyy1TrvaYXj70Af9zgx
         vFIfh/lmkb9mauG4XKMBqitV+7fMkiudwTMAD/YqChCdlmbcsYoEUL/7plSGBvlFMsCw
         +ko5HdYnyVl0RlM8VN8clYx1Ytq+hG2S+ad681g3wuCpJLj+tSXgom4NKQEUv1O7ssQZ
         EWFA==
X-Forwarded-Encrypted: i=1; AJvYcCXK9MRaQwupYzssoxz/qjagUNpYKiKrkOuzJ7bkVhk/8t8VNmI7Se0O2+Fqzu21T7TLTRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTwh8yQOlvwxw1wFj1CA3sYaach1DpdOhWl4L3UXeNlkYV0dBw
	Lsh+GBRKMty/A56KJF81BgKk8lxLm2wBdXQAiUlIQGwdznDbAH46a1t/b5hfRMq/xdyU+PauQjz
	wJm3kf46/UDFZ7UEQjcNyuoC095YpgELg3ADYzDGmbJnY1jBA9XT7zLI=
X-Gm-Gg: ASbGncv7dHHDGYaXqoIAcR/GKMCaphj/z6a+YL1L5NqYZhkgmYqoiw8fzZgLoFVAqFt
	w/Xhw7B5WJviuNd1FQDz92wEn2wSCSuXNJPeUs2b5cHkTk6IjD4Aj36+xN7HiUnX6XHkmx/5o9L
	aqLqQkr8C6Wvc+SRmcxP+xZTVtrVgKxke1ArdfOu7dhJ+qPUGIWDDgMUmwlpisJC/EzhhU3UHfV
	XLVa8ZjZ0/V6e/bW6BjWR56EaPd+7JuUxcs3gUjqIlM9KPUhv5in7qlIjlGKNjg+qUM1Eq78hCK
	in9m3OqTiD6Y5QEIOsszLDr5oP3TP7czCSiOBRLGcTZByO8=
X-Received: by 2002:a05:6a20:258e:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-2162189eedemr17085549637.16.1747647815834;
        Mon, 19 May 2025 02:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBn3YQuItzmOTeDJuwyBkkScPtNvgmsDQnEm68ODCFtCJxD6yFeqm20eMNewUKrXrunStz3Q==
X-Received: by 2002:a05:6a20:258e:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-2162189eedemr17085507637.16.1747647815410;
        Mon, 19 May 2025 02:43:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:24 +0530
Subject: [PATCH v3 11/11] wifi: ath11k: Add support for MHI bandwidth
 scaling
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-11-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=3170;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=iRU0Yv6S7aDJfgJ0sXHZ6i8h1thDD71OEAeHK48lWWg=;
 b=pXC6t6KaeeBZiubaUAqowVVgtQcd663spifrqVy/Jik6wxRwizcXUr66OHogqm7b7P17DWCKX
 VrPMhEfEqf+B12YjfPKGzQBoQhF857+WH09MfRydBuondK7ulCXpE33
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: T2u0D08SGrOh9fjQPSHKsvF06qDxlI79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX8VGZW9UAh4jO
 1QgVWoO9XPjD2WrEUijNvMEX1b8awO7ycasRqoWgJZwRNllTHfFMo9kBNyIdPgHcwx2IRED72g0
 m6ZOMrJOagfa2MEhq3sotEPxK7Y1+geH38iau1UaKc0fanAeylfNcXALUnDngmahhBcQPB3lKIF
 +cUNrdR1Zav393yhw+BBcESAd7x+rtd+uXHDVLwS+q++kmtchjjUgDiIwtZ1zCzoaQHVLjhckRT
 52Avr6QghYkoNK8sL26A7KrEKILa645+kvnXDwBLVLrYcBIOnyNUUPeXMcoKYSw/HZL/tE2KHQ1
 MdBZK9FdslwcHSahHcmI7T3z3iAZR2bJRAY1g5/tSmnIGmyyUWAFj6heNNvZJUvpdc6u1r4tYS/
 rwFJY//6vjAvkMZ236EhXk4PD2Wf36Vw3SMymJiS8NXDS5rZzR2APdMkr3FscH+hWPao3WCs
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682afd49 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=262QNBeyodYRG1lUGOYA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: T2u0D08SGrOh9fjQPSHKsvF06qDxlI79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

From: Miaoqing Pan <quic_miaoqing@quicinc.com>

Add support for MHI bandwidth scaling, which will reduce power consumption
if WLAN operates with lower bandwidth. This feature is only enabled for
QCA6390.

Bandwidth scaling is initiated by the endpoint firmware based upon the
bandwidth requirements, if there is high bandwidth data endpoint requests
for higher data rates or if there is less bandwidth they request for lower
data rates to reduce power. Endpoint initiates this through MHI protocol.

Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index fc77eac83e953148b96cad096d26b32222157b24..8057031d654d794f9e882a975f99083c193e492c 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -20,6 +20,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 #define MHI_CB_INVALID	0xff
+#define MHI_BW_SCALE_CHAN_DB 126
 
 static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -73,6 +74,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
 		.client_managed = false,
 		.offload_channel = false,
 	},
+	{
+		.num_elements = 8,
+		.irq_moderation_ms = 0,
+		.irq = 1,
+		.mode = MHI_DB_BRST_DISABLE,
+		.data_type = MHI_ER_BW_SCALE,
+		.priority = 2,
+		.hardware_event = false,
+		.client_managed = false,
+		.offload_channel = false,
+	},
 };
 
 static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
@@ -313,6 +325,33 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
+					   enum mhi_er_data_type type)
+{
+	if (type == MHI_ER_BW_SCALE)
+		return MHI_BW_SCALE_CHAN_DB;
+
+	return -EINVAL;
+}
+
+static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
+	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
+	struct pci_dev *pdev;
+
+	if (!pci_dev)
+		return -EINVAL;
+
+	pdev = pci_upstream_bridge(pci_dev);
+	if (!pdev)
+		return -ENODEV;
+
+	return pcie_set_target_speed(pdev, speed, true);
+}
+
 static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 {
 	struct device_node *np;
@@ -389,6 +428,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
+	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
 
 	switch (ab->hw_rev) {
 	case ATH11K_HW_QCN9074_HW10:

-- 
2.34.1

