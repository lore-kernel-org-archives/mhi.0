Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093045;
	b=IgSbl5qk3MZ2ltbkxFdxOEZpP5U6f2la9FzhWRN0cU3iL34eAMcHy7ZXxlU9+qTZMYPK
	 1FeySGCDrMgkXODc4cdigPr1AOH5c/mUZNvSrxcAD2mpweqYG9HkwbMTf6RnqwRNIeWnL
	 EjKh3U9xKxTkJGll276RnL8dYD51XSJ6uCAKv5DmPnz257atWSf4vMzvX2sS8XlKwShtt
	 YHvPlxa3URzhFRzvE1fxM8+QZUa9omBmfpQGIbK5nBkUV/JOjeRFmzsf5kWP5SEktalmc
	 Xb+jAzaB4TTDIksKukzJwzwlAXa2Fq0dOpnJn2Wkt+sKasCf19qwNz7F0CxQhvTirLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
	b=f8YFVRXuuWmFQYW36aKAc/m8q3TCoFQ3Z7m6gfPaT0bU0cRYiNBSWZO02kmiWnLbzV/5
	 rKIf0yiXXAb49GBCVUkc0lffRnHp0X5k7wb2tC4opaN0JEH+unqLAGIXz1pwZmw+yZspX
	 NupUgD4WjBSS3djlzbpjhT2F+0L3PLq17rK/t+6rYoMZWMznwpWU2FM/BVONHuybRrdjq
	 9D8chDDWz9YZxdwQl6jEAlZMHgwXbAbdH9b8QfrefkISolpDLUDgjQLKHrlrlS/47pH4+
	 wH9DsE3cGWaME7rjoSuFpz7O8j9BYAybMCR3lB4cd5dHErxN0rvka9CYvjErnHK0aMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2RrgOvV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yu6sq7c+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51960A2618
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E51960A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T2RrgOvV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yu6sq7c+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjv6i705604
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=; b=T2RrgOvVuOTW9t82
	RDghEz4T/OgQ2GDeQg2fFnuDa2QeN+pVEUS/iCeCoaaprHAGyfDbtMQJ2jPkHUir
	Tkiv3HArF9zA2KrU7fVHpybkD2ccg186XxOnk44LldeaXvzyZ0vHEmFgtXnzC37g
	J+Fmxb0Q4YWkS1edChI7+LpyyhMe2fBi3zkmBx+fPKmmqFREu6iWjc+ddjstIQoq
	O9LKPKTrfU8C+8mBmdcKDdbYo7mK6BkvSvW6+Id9LTjEIIWKJOw3RiBc/ylOmyrO
	fTKnXJcdQ5qB/3lka0v8rM1uSdQjvGLjU8tVY6mwOkAV/U7M0QfLknB6pd2NZp10
	ia51QA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x708w42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso2884392eec.0
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093043; x=1795697843; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
        b=Yu6sq7c+nGebEdN+QBLmfWEWhLUzDKHT6j8pvtVgm7DizCo/PWULZneVIm+ZEDn87s
         U+CUsxtjsEjstCg9Fp91Fj9tA3IV5GKdY1nOWugeZNs2JMPubylEWjAcUkVtU/ZsgPgZ
         fIXE7LU1A7RHpYxeYJSeNS0xN0J+fBy3NA+Slu7FEhuYNWZsoct4Qvd33/6r42YiTVdi
         Khl2egDFO+E1Bafg4E0+eDjn3W9dAPe9ZmrVyTG4t28iYAA9vcJW4DAlTdzE4SOOftL6
         Ku6Q82kHx7fdXAUEdWKMBoYLlrsdcPtq0VYq66UXe9c8h8ACRLzd1y0V0DpY71VUUv38
         72EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093043; x=1795697843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYTjNuCInASEB6Lz8kHz2CJ01DpWO+fOmi6HLNNHX9g=;
        b=C6gWiMRoa+mtLpi7uGM3YQ56jKlRcfnPGwPm91YB1wsMc6rR4y1LLhGgTw/9/yuZG6
         3LKc+IwIhZa3vGaYhIQgvDghtt48WJEMoYVqDWWbSMEXEK6xMO5LMs/D5RCFCiu4BjLE
         fw+IHiWC3vsk6HDBeSdqZkl0ve7xf/jazk7srV/H5NzEA8JnEcXWFoWM1AWGFmolWTMN
         MJaeZgr198LVdP5cqTArrCykcjUddGWnH2ySA0CUc8supH27QN456LIQHeGsCpgp6FGj
         jccSFhD0tq/IfoY3fQbpIoapVvdMjgzRO1TUA0SrHShOyKKsMdoMLtO2b0iZ96z8oAFi
         mHoA==
X-Forwarded-Encrypted: i=1; AL+hErFBKO87yc1xe53X3dx1xg5H0CeDQuShzX8HJv2stbbBrT7oGPPN3BWiWJTUym7WtRS7ZYA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9AVW536LEpGrx8xlJagZFuFvVFHYzI9pe5maI1X+yl2A3B0Etm
	xfVCXPWA8EJA1YptXWG/eBuBBfQbWqH2AMvCDQ65YISnPwAtY2+vtfHNf0K617b6OyTwKBTgJBe
	Cry+oanGxa/3Ky5H3Esjc/ELVCM1FU5VWvGiP+8mQdBqXK1xkhA9Hk0g=
X-Gm-Gg: AZFdTZeRmfUXql0+KstSmNDHhDO9ladVk8BXn01I8qChG3W0dTbvNLWZcuSq1dLiiyp
	6ZC8eW/tHMruQPMElq/2MTsBuwqrOPZPE/fBI2KJBKAI3YCcPGs/SgaNkYZto5mojEJTlOXh0IF
	gdrMxww9P3PYaQQ1dnIoguB01l0ke1J8ELzUsAtTp4cOEGvAp1KcvmKXJjkFFMDXdHBpGAt+ter
	rpuh6IJtShYcX3r0aN9pbQrsm+IqjbGoTvAc5Bb163OmKPlIm5+Lq3yxZeCtcKAqnkCPPbAKwWG
	3IY+Wd3A4CJQkgY0mYFyFtUvZaK4Pf9eUPZt2X96sTcveUSG+yoZOn+GnzMcxp4VGVtZtcX+pSG
	cB2hmmNtXpqpLudGsM9vDUdLt2bp1lqrFkQ8yjokAAwXWGApmsFU6SaSDqDJji5bFGUr8lYEfRh
	G8yRr1ZaHj
X-Received: by 2002:a05:7301:4704:b0:385:1099:3c35 with SMTP id 5a478bee46e88-38510993d02mr276466eec.6.1795093042912;
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
X-Received: by 2002:a05:7301:4704:b0:385:1099:3c35 with SMTP id 5a478bee46e88-38510993d02mr276420eec.6.1795093042295;
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:22 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:37 +0530
Subject: [PATCH v6 5/7] wifi: ath11k: Add support for MHI bandwidth scaling
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
Message-Id: <20261119-bwscale-v6-5-9a9a715fcb46@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=2825;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=00qFRlBmsgrZNkzmQzVjR73weDySzBF2Lznxsr3nfCw=;
 b=eW8KJul8rlT/Nq7A3LzC4zMCz5ZGXtbeojL0vF4Mp+zKbic1EFw/5W1/iOI5YZykazkzrIuFn
 H0n/2H+BN9kBkMCsNA/TntLydE3c0n6AosN5s9QJAgvUFxAD+TgcoHJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: ePQOsxEex_O0kfxDnLpbb-7UMYzAgl1O
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afef233 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7uZxxMFRC7_hs3sx8zEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX52H27eMl0v8U
 L1z1E/jJhUmrKDr5FYn5LSFtVBQ1/uPnunnzPIv2zIKFMtW8MCNr/5h4YSSRvXO7YnlbGtU5UXG
 qz5Jcj1xfIhd1DTPLbO4imyRE8vWTI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX06Lmyelnl1vt
 t+AtxG6It8rpGbCL47a+GdjnpZHKAlk0Di4aLbveCaUko//Y6BKpMLokZrFFZbw/jmXgu4oGGvD
 tD+MoMDenCboGiN2kvrc4bz4JlCghP171jG60Jyb+jNL5bFfINMSuKuEY517SsYJ3Oh+OmU47XS
 TBT2rs6alvVS0j+YacnURxtF6TNgfFA4qS0Kojg5/2lRVEglX1k5GI1njJ/t5gfug65FKA0BciY
 zg+GFDH9bZRfhA7oaDyYoDZMwwv26nKDaBtNps2JQg1GjiWdbDkrREDocgCcsJi6Qw8rfAOkS87
 wFFi9s4G0/DG7og4So+0+facX+0lfd4sJdErT0e91tkAXPabQmfvyiVD9m8khcgLQb/0IshnJHF
 DR6H0HOKyEFrV8OCDr4IeiuxgHLIIRZ77IK4h8FDdrJpODAxNdGJZgwJnOXIFUblf6OlGTPm81c
 v5JEkl0o7SidrrICnig==
X-Proofpoint-GUID: ePQOsxEex_O0kfxDnLpbb-7UMYzAgl1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190051

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
 drivers/net/wireless/ath/ath11k/mhi.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index a6c9ff112c68..65637fba92d1 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -20,6 +20,7 @@
 #define MHI_TIMEOUT_DEFAULT_MS	20000
 #define RDDM_DUMP_SIZE	0x420000
 #define MHI_CB_INVALID	0xff
+#define MHI_BW_SCALE_CHAN_DB 126
 
 static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
 	{
@@ -71,6 +72,18 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
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
 
 static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
@@ -311,6 +324,21 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
 	writel(val, addr);
 }
 
+static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
+				  struct mhi_link_info *link_info)
+{
+	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
+	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
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
 static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 {
 	struct device_node *np;
@@ -387,6 +415,7 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
 	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
 	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
 	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
+	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
 
 	switch (ab->hw_rev) {
 	case ATH11K_HW_QCN9074_HW10:

-- 
2.34.1

