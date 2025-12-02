Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCE26E14C
	for <mhi@lists.linux.dev>; Tue,  2 Dec 2025 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764642801; cv=none; b=Zosd9OphCzH133NxqXPKiM5eCGLN3GXgzqxSHdBHdwWAGnQvvIFCsfCC1TiGMBnP8dNaiS5ki6RjpVdATjl0lfDKiE7wB4YJozJbSK9MH/jJlXzjoDKltA8I7yMJGbcQE+EYH8u9Tevb1s0NIVBIci5oBwKunHrlRKtx79TT574=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764642801; c=relaxed/simple;
	bh=muJQ+1r0QQmNOLxX+7cBSj7Mx/OcSdX8YbyCqQVs9rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dii7uVUG9FpuffFMEq7mtwB2Vol+ouOoylFGlhNsBll4goJx+ZaPUiY2xbxVcGGb5JSNBXahIvJ63AAGvdz9PqAtG6w6bvdfHX/cOWj5Ty26KlbriD0YMaVg89kV+3JAI0w8H6GyfU6U/DeHgT8QNIJJkTnW4U0zk+EzMo5/JyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6hVeWmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5wjCloc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6hVeWmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5wjCloc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KrpQS671285
	for <mhi@lists.linux.dev>; Tue, 2 Dec 2025 02:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KTijip4odIAsQDTRQpeTza
	c7lXDEkG3pMy4B7yLYuGQ=; b=X6hVeWmADgsHsI9A89xMqY6SuUG4LcaMEhf+Eo
	O66GFv62ABHn70LvBs4IIo04e73iC0NfhmsVU4klXlcZRFz1jh2hl0XdTAqoqt7R
	g0SGKPpi6/+p7cVc9XlRbkE/b1FziFXkLjVrxvD4AVTpqcXeMXzs7/WORka29j60
	F/Lg6g+D62jf0CHoWBBjJcpkUei2XFSIr3GzL1nbAfntrZSnbqh0q+rpM0cmRWPz
	DqfE4y2zm+yzYvkkZH2gfA+8clhqmn39ED4Wr+XE2LkUFs9wLo0eiCgEdZMnFVzn
	l12N4Pt+4qv15x8q05ulYDYNfhVoR1D4KA9S6lv7xCH9JCVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asjf2gu0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 02 Dec 2025 02:33:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so3826787a12.2
        for <mhi@lists.linux.dev>; Mon, 01 Dec 2025 18:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764642798; x=1765247598; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTijip4odIAsQDTRQpeTzac7lXDEkG3pMy4B7yLYuGQ=;
        b=O5wjClocNVmdCY6WMSh72NSXCGe+H0BAc1VG4OF2cOUQ1g0+XJMilXfrHLkvIors+q
         ymCTcJW/yhINYx6jCyjs7wjVcKZUQM24k6YYk3+Rqx3OcpgjRzb0ijouN2fazaGJEK9S
         yZ1oHn+ajlqF0eQKo25Nn1kKD7o9aI4kZf+0SHUzqifnJF7KXZQZ1SD+Y7MdvOhhrj2O
         lZJIm78vLllJVk8BWZHkfcksH3Bo55Nw7KZJE48jQBsrXbUoNgp65CTYiKVEx1w4WVNY
         fP3Hj6WkN5n/3/0QWt0A2PcJBDJIkTr9+n2OF6o4oP6+PiKBRh1XPsJI/WRAJ1HBL5qD
         dr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764642798; x=1765247598;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTijip4odIAsQDTRQpeTzac7lXDEkG3pMy4B7yLYuGQ=;
        b=K02yjzZzh35XpjB5b/kPc2w9udIQN01oN6Vs/hUdn3zzPk/O8g7i9ntpzLsRxgfxja
         dIf/k9tORB/ECkWbbFfVEHrK54z6bCansraO4O9qAWRFJd+eOQE6dgqDYqOY7jqCgLGo
         Cs570/RXn5/IZ/TuPraaO+0OvWGRidYpvc5ILPj/7mfnTEkrOIF082a7+604Dq0LG1+H
         43ddwKdRAeXsE3XTH3LzkGkRdBqdj0tItHP5fSF3s48Y6USO70zaRDW6xafrk8qCFT7p
         4vTktLpvZZnAmw8eB67pgPUBpg5oaO5X2TFbTxOleE3RvV/2XaWkaLY72f9dg2nDvKiY
         4wbQ==
X-Gm-Message-State: AOJu0YyHUG0UIn9fCCaUu/gaq5BsIMC6dXXFsQucb4RrHalPY+ekD0ff
	HyDkK50mXjL9Xg3lq8ldzNuodPmenKFRDCuZ9+9oNYn8OF8dFGc2ksOxopgWLJezlXYTVTN0TWJ
	sBDOU57PL455s+rmbOURcewJLT14OTkl91L8AddzkW8uTc5r9z8AcQ/20vBp0v7U=
X-Gm-Gg: ASbGnct3E9PHeE5wpffuwF3qvp/IrQd9VxsrxnDrLtOujm+f7JtrZfax5UDor3jJx4b
	Tz5BpPieLdjo+1EAv1qnJIHPLu7b3w+df2lbY1H6eC/SxFDzJAtqfFanrazdeSED0vTb26PVvcg
	NO7NfZc9Ed7vlgUUbECOE/wOM30dAyhI6CEuTEpFVmf7itsPbFoI4164JLVXuuuK+HFM9KItQgZ
	HVA+j6/d/Oq3aPc6rsCOmGAQ7kaxK5XA0qGyDcny32Wu/Wbia2JxV5m7CPKAoV5nKMBjT73rrXK
	AaplpIgrLjnNZLPpY5BE75iwJ+oVHeUZLda6WlHzDSsJOQ8/nOaglvADd6CvN6eJNHCcWwwj/jU
	2lPDM2UClLGvFjeyDoZmfcexao+GVmlFvQ1CH6YV5yRvq2iTJJzPmtRS4
X-Received: by 2002:a05:7300:ae92:b0:2a7:760:2b61 with SMTP id 5a478bee46e88-2a7194ab603mr19898986eec.3.1764642798302;
        Mon, 01 Dec 2025 18:33:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECMGXnL0AHMY9I1eGzuJxu4m2asMxGfzmaW60LkPzoARZXzsTG707HvUXzvvHz1oK0QGHIoQ==
X-Received: by 2002:a05:7300:ae92:b0:2a7:760:2b61 with SMTP id 5a478bee46e88-2a7194ab603mr19898970eec.3.1764642797650;
        Mon, 01 Dec 2025 18:33:17 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965aafd17sm52768196eec.3.2025.12.01.18.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 18:33:17 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 01 Dec 2025 18:33:15 -0800
Subject: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOpPLmkC/1XMSw7CIBSF4a0YxtIU+lAcuQ9jCMKlJeUltNWk6
 d4lDkycnOQbnH9DGZKBjC6HDSVYTTbBFzTHA5Kj8ANgo4oRrWlHCGX4ZYXnxokBuA1C8TyZyDt
 CJ6yU1NAy9ThDg8o/JtDm/W3f7sU6BYfnMYH4Feu+bnCehVciKQ5W/5WXGEOa8UoxwVICO/VtC
 4zBNeRcPRdhZXCuKoP2/QMEmDaSyQAAAA==
X-Change-ID: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764642797; l=3934;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wH1dZTo85yimVKrLWZd4l4Debs3ziUoS+U4lkPxWGoM=;
 b=JRi0mchOpwPPtSWHPPgDr8ledGnNtJ06wmEZnFANXwSvPzPnUzh9ngAjHkvuylXSPDPsZ7F0e
 iDuAl7SFikCBTpxS6wqszudk2D9yvTxH4/3I+rBC+YYDsiPn9KEQhAO
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: _5jB7EN2TaTF9Ua8lxDbQbylx4UcvvPL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAxOCBTYWx0ZWRfX5SoLPuZVwHCC
 5kM5l5vl9E4LXLFZmI3/Ro5tq5OrxcZkaLSCk1518H2IGMRVdqMtt1NoFg1FBVrhZIWFEANgSbj
 CZqUCmxSOZiZuBg5Ev14ggtBJYhBK7s0/KLfTGFMeM4yK7t/VV/pKyWdJtVFtljkqkS55rQvRw7
 JPg93DBEjb18yVCnP0ZvhZuaF+lcRiUm8EPZKFKgphbkDtlKiJuqA0Ivn6rg+HuTg4kG8aMw9t1
 fs14Dq+dvxoXpr2oH8n5x56cEaPRx6Ffrgxz2NipvWFRfAZWQuOnvGOHjuTTglFatLCQQhrjzV3
 D//3CohglOVFLRjKRZ/12Ioq6GXBE4EOdBgJykmkcG5KDfG5YM+1xJ3xzm1C8oJxZ+gzA2J19rv
 b0kaeIjTouCpTMCBxsi+N5IC//KRaQ==
X-Authority-Analysis: v=2.4 cv=cejfb3DM c=1 sm=1 tr=0 ts=692e4fef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4E9LQ-3TQiUVIzkRWkYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _5jB7EN2TaTF9Ua8lxDbQbylx4UcvvPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020018

From: Mayank Rana <mayank.rana@oss.qualcomm.com>

Currently, the FBC image is a non-standard ELF file that contains a single
ELF header, followed by segments for SBL, and WLAN FW. However, TME-L
(Trust Management Engine Lite) supported devices (eg. QCC2072) requires
separate ELF headers for SBL and WLAN FW segments due to TME-L image
authentication requirement.

Current image format contains two sections in a single binary:
- First 512KB: ELF header + SBL segments
- Remaining: WLAN FW segments

The TME-L supported image format contains two sections with two elf
headers in a single binary:
- First 512KB: First ELF header + SBL segments
- Remaining: Second ELF header + WLAN FW segments

Download behavior:
- Legacy: 1. First 512KB via BHI (ELF header + SBL)
          2. Full image via BHIe

- TME-L: 1. First 512KB via BHI (First ELF header + SBL)
         2. Remaining via BHIe (Second ELF header + WLAN FW segments)

Add standard_elf_image flag to mhi_controller_config to indicate TME-L
supported image format. When set, MHI skips the first 512KB during WLAN FW
download over BHIe as it is loaded in BHI phase.

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v3:
- Reword commit message.
- Reword comments of standard_elf_image flag
- Add reviewed-by tag.
- Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/

Changes in v2:
- V1 patch is paused because of no user. WLAN team plan to add support for
  new WLAN chip that requires this patch, so send v2.
- Change author and SOB with new mail address.
- Reword commit message.
- Place standard_elf_image flag after wake_set in struct mhi_controller
- Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
---
 drivers/bus/mhi/host/boot.c | 7 +++++++
 include/linux/mhi.h         | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 205d83ac069f15a19ab2d66a63692e5d60334d4c..64fb7a257d3529167eddf1153d34cc6b25735809 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (fw_load_type == MHI_FW_LOAD_FBC) {
+		dev_dbg(dev, "standard_elf_image:%s\n",
+			(mhi_cntrl->standard_elf_image ? "True" : "False"));
+		if (mhi_cntrl->standard_elf_image) {
+			fw_data += mhi_cntrl->sbl_size;
+			fw_sz -= mhi_cntrl->sbl_size;
+		}
+
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index dd372b0123a6da5107b807ff8fe940c567eb2030..a13106bb234d22e3876dff3c0d46f3dee1d9e05c 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -360,6 +360,9 @@ struct mhi_controller_config {
  * @bounce_buf: Use of bounce buffer
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @wake_set: Device wakeup set flag
+ * @standard_elf_image: Flag to determine whether the first 512 KB of the FBC
+ *                      image need to be skipped when loading WLAN FW over
+ *                      BHIe interface (optional)
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
  *
@@ -445,6 +448,7 @@ struct mhi_controller {
 	bool bounce_buf;
 	bool fbc_download;
 	bool wake_set;
+	bool standard_elf_image;
 	unsigned long irq_flags;
 	u32 mru;
 };

---
base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>

