Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE79372691
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829094; cv=none; b=Umjce+KxonkbN7hlKzApTRYG4llvnakDJ+ZFdJNP/GpvxFTp6G8C/BVEi9h3hl6a9eduBS3IuIZOdY8ZncRJ3rOQ1+UQB8sr+5HoIYFjIT90MHwjyzHj0j6UjSJruwAhgG63Ym1kcuFmzxZVk5hU1CgbKj5BScpMUI6znWFFklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829094; c=relaxed/simple;
	bh=qQxpGCkmBrmToTnrtmzbPTnehdVr0DjcnfRo6PenOlw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l2R7Tkrd99hpJvNKg29nryT11SuqdJBjZqaTcKe7rypiyswed0jIswfpc9YuRqRn1Dl4VNG+s73luICDvV8FdvlhvbMphrzdwwT46k6qxueNS3YWrTyUhsO/Up9DiejSG93OBVEQ6Zq1XKtJahg8RtNhOTHHlzFKUB3f2ku2DCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OknDlfrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeN7Pdvq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OknDlfrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeN7Pdvq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHvNgs2477935
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sTqXbDBaN0X4bkIx38SwJs
	II48e9h6LTI2mEy3hMK1Q=; b=OknDlfrlObentLs+cznOacfmAGE93PVTWIMoMq
	EIaOnYHhtgmlPL7eT7yl/zjnIANRhnrabjNXfpdmP+bYqLPHVuXoQm9QqnTGxUU5
	fFYilA3YmAcd318LFmb4+RPpu0ltnDMPhBYFVlFrCRZPTKq2sjNKWkliTnOvHcfZ
	0aaa8iLD31bvsDUg3wGItFjKFQqLd47+jdbHtIAc8rJnv0VPjzBAOiI4pSRXcUaL
	uwvrT3O6/rSTfwwCmdYDDK00PiixNDdp9bBk99URUFAiNUT5fJ3aNSVwYxM+ZXej
	NxW8sL9rvP90Haqt1HCQIU/0BrFKiJWN4OaVIwMzO3cdkATA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc28tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso3440917eec.1
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829092; x=1792433892; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sTqXbDBaN0X4bkIx38SwJsII48e9h6LTI2mEy3hMK1Q=;
        b=FeN7Pdvqg0jDLJTGeR8NELtd0GrMhpB9z776vgGFBoR78kvHw6X2rv8dFF0PeERr79
         43hBvRMx46SZPvptyrye5E+YP3MeSltR0BC1m9ftLXdy+R0Dhi9tFBaqD0onESTdH1fc
         +dgm8cu9HwgeGXjsqTB1kaK4Y1CBzEf6PEBo8VF2OilFkWvo5B8r8U2LxgLSzGp4A+HZ
         vp08HpTGD1SoGxTFdUSnCezZ7rdtMoeN6Ccp+dYPPGttAR37QNOYvLPoF3ihichlxLI9
         aip/Ufpvn9DmKyM4X/0NKKslHe0aZ+X/HDlaAwxlIukwJ9BKV8AxShV/I0e4zl7Zy1oJ
         F3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829092; x=1792433892;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTqXbDBaN0X4bkIx38SwJsII48e9h6LTI2mEy3hMK1Q=;
        b=ZHxADDuPTFF/r0TcVLK7d3q6YSCowh6pzEND0e/AhXSTXcUtoaiHCNnrOoKWPGijmU
         QvQ0xduSjH02Ueh05GFQX1uyiAvfenB1z1ftA6yn/aTOG2F8nN5I9JnwJ2FxXifKFhBG
         d8aBDHwouGs07AhaPfUIzuIznixozvFtXm4KFOJm/HDmg/HkguzFNFISumwI4meag/61
         knvbdXFqS32Q469mmncU8JYZs9TCttXzMq5mIcNHYKKxLJUYQZOKDRFYyypFgvMevhyG
         Hba/00ncUamXtfJIYiROEKYGVs4GbcTs4nW9ncpuP+40Azs3W+Js8hUadWf3JWGlonkK
         Wg9g==
X-Forwarded-Encrypted: i=1; AKwUvByZ4cX6mX3Z/dnAwLZFBJHFsHibjoHHMQsg9thvVcxyKsBf/G+EzLB6I6+bVznAjmqfsOk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJi7Cb1v94FV/YQA8lR3dXDOtncHJxzB5lkHxEvfA6vmYYHrDN9
	qZhxuTKpqUbLma6bHP7IHDgW0Q84O4lXRtdDASVFQUVmk+EEJaxLZwMhsEvf6m79ioZt+bnBXBs
	QOq2Fsjg/XvEQvwZ5Q62bBvLbYwzEYxm5Z448z/92fy03fvog1q41Xg4=
X-Gm-Gg: AYBFou3LNVYOOq6jpk/qbKmomApLyWSv7ydaMuCXwxSy4EUCCYRKYYsGmB/3qn9mZXD
	9QUEzcPjWkwX9MPQ4RSQelvGtnEQ2Aj/LiqpSPm/VOUMEC5Z01qDBBJ1Zth+IAgbKxsgj+OGTpf
	6ffjud7SK4mTvdMYlN97tgODrsHGYhLtygFYoLQlYYbN8fAhd5BkCLPvTKqZ5jQJuy2K1BmNtH8
	e3ouZ/7af2CEdNAVEUpKbpz2AmLsz2oTYicQxvZaB0lvcQPBf2fourbE2EdCelMZWpy5vLBwABp
	EqyJgsVAuhx+iKcEVUFfBK22jfB7DfXdRBXAthPyu4lKUEwHAknI8+Nsn0KQuSbxyvR8kkjcoDR
	Bc7UUGbNwXZFzLi20t1ZXQCnp+VDg
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr5464326eec.22.1791829091666;
        Mon, 12 Oct 2026 11:18:11 -0700 (PDT)
X-Received: by 2002:a05:7301:71a4:b0:35a:4ad6:d215 with SMTP id 5a478bee46e88-35a4ae61ed4mr5464273eec.22.1791829090664;
        Mon, 12 Oct 2026 11:18:10 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:10 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v8 0/7] Qualcomm Sahara protocol enhancements
Date: Mon, 12 Oct 2026 23:47:58 +0530
Message-Id: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYkzWoC/33Q20oDMRAG4FcpuXaXyXGSXvkeIiWbpG6w3dRkX
 ZXSdzdb0PbCCMPAH8g3w5xJCTmGQrabM8lhiSWmqQb9sCFutNNL6KKvmTBgCjhgV+xos92dcpq
 TS4fdFD52C+uUYloKRO72SOrnUw77+HmFn55rHmOZU/66zlno+rqSEjSTFKhhqmdUgZSio91rL
 GPKoR/sPNvHVEr/9m4PLh2PfW1k5Rb2Q/y7VS3omPEOhR5kMK6h8TuNQlPjVTNGBCsG8NL6hib
 uNdPURNUEWo+Gg0bFGpq8aYKqpiarpmwY9gAyiKF1N3XTEGhTU1XjFjVXzAkUtKHhr0YBdFPD9
 W7gGerBV0z8oV0ul29sE9kZjAIAAA==
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=7588;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=qQxpGCkmBrmToTnrtmzbPTnehdVr0DjcnfRo6PenOlw=;
 b=OCH5LUoUMuR+rabisWG4JgRmhP8Hx4wi2B0l45JwGA8FIu29L7ZCuZvTgPSL+iTUqOvpx7SS9
 uyCpYvJ70mVAQATZc5q08wd2WiFYnKOQ82nvqzRa24GxAGiSbYIVBqr
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX2Ca47PnfSbMs
 6MBfRuzKI0PW1ocJ/W0W1+sTDiBJ47fDpf1M7/QwvEiU3Y1hlv8fADI3pgtLLm4WwrfFENtWp2h
 xcWiRMT3HUD2pjwwIFaY1Azd4MVzzyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX+tVjPp+5b1fJ
 0TtBezGSG/9b7E+r5sY73xRrn+mjfUihXSD5WEGKDnDs47gkzDjEqyl5GUmoUAlQcal+yVEGemG
 DLM3NjNgLqg0otkzpJ4zClMJIM8XnWqAm4V7T/sYzJ9TtWMH4DJErFUSL02ZauZJyASf5ykfbic
 1FsS+hOhCvOOVy5+wLdyr9Kib8yKsLDyQx7RsTrXY719ms8mvnFFetnOWxLfJrCjIW/64cdDpqN
 LzHYn2pyjwY2Q25kr+CjT1E6rO+f4bvjkgZgbJslcxosN9JfEaELF7aroDdx1UN+eASLLnGtsz8
 Pt+k3fsrQr6nrzZgQ3lhgwEqhNXDzBlrzXlFxzNPvC1fqqLSERzichyxDIfUh99Z5WVJZsVMmV0
 xSanuVc5r/NK+qq7j+YulT0W9E/iSROmSKhj5qfuDMpR54aI7Ax8VrPebjdWgNKrWpSQ6TjaOLt
 s3hRYEkrBrZlnWQDhDg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acd2464 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TZsl4NGrXgOhBUOoEegA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Utd2RcKybZYrWx3oNG1kBM0XbyV1TW_d
X-Proofpoint-GUID: Utd2RcKybZYrWx3oNG1kBM0XbyV1TW_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072

Hi All,

This series reworks the Sahara protocol driver to make it reusable for
multiple MHI based devices and adds support for capturing, restoring and
exposing DDR training data using the Sahara command mode.

The Sahara protocol is transported over the MHI bus and is used by multiple
flashless devices to transfer firmware images, retrieve memory dumps and
exchange command mode data during early boot. However, the current
implementation lives under the QAIC accelerator driver and contains
device-specific assumptions that limit reuse.

Some MHI devices (for example, QDU100) expose the sahara protocol directly
on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
data with the host. The existing driver does not bind to such devices and
ignores Sahara command mode packets, causing training data to be dropped.

This series addresses these issues by relocating the Sahara driver to the
MHI subsystem, centralizing device specific configuration and adding command
mode handling for DDR training data.

Overview of the changes in this series -
1. Move Sahara under the MHI subsystem:
   a. Relocate the sahara protocol driver from QAIC accelerator tree to
      drivers/bus/mhi/host/clients directory.
   b. Register Sahara as an independent MHI protocol driver.

2. Generalize device matching and configuration
   a. Allow the driver to bind to devices exposing the protocol on a
      SAHARA MHI channel.
   b. Centralize firmware image table selection at probe time using a variant
      table, instead of scattered conditionals.
   c. Preserve existing behavior on AIC devices.

3. Add QDU100 firmware image table support
   a. Add a QDU100 image table and select it based on the matched MHI channel.
   b. No separate client driver or registration mechanism is required.

4. Add Sahara command mode support for DDR training.
   a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
   b. Query supported commands and retrieve DDR training data from the device.
   c. Allocate receive buffers based on the reported payload size and copy
      raw data from the MHI DL.
   d. Store training data in controller-scoped memory using devres so it
      survives sahara channel teardown.

5. Expose DDR training data to userspace
   a. Add a read-only binary sysfs attribute under the MHI controller device.
   b. The attribute reads directly from controller-scoped storage and remains
      available after the Sahara channel device is removed.
   c. Cleanup is handled automatically via device-managed resources.

6. Document the sysfs ABI
   a. Add ABI documentation describing the DDR training data sysfs node.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
Changes in v8:
- Rebased the series onto the current mhi-next branch so that it applies
  cleanly.
- Resolved conflicts with the MHI host client loopback driver and retained
  the existing Sahara functionality without functional changes.

Changes in v7:
- Addressed review feedback by correcting documentation punctuation and
  removing an unrelated formatting-only change.
- Passed the QDU100 Sahara firmware mapping through struct mhi_pci_dev_info
  instead of selecting it with a device-specific conditional in PCI probe.
- Clarified the userspace persistence filename for captured DDR training data:
  qcom/<fw_folder>/mdmddr_0x<serial_no>.mbn.
- Link to v6: https://lore.kernel.org/r/20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com

Changes in v6:
- Used BIN_ATTR_RO() instead of struct bin_attribute.
- Link to v5: https://lore.kernel.org/r/20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com

Changes in v5:
- Sahara protocol documentation is moved to Documentation/mhi/ directory.
- Sahara driver is now moved to drivers/bus/mhi/host/clients/ directory.
- Squashed v4 patch 3 with v4 patch 5.
- Squashed v4 patch 9 with v4 patch 8.
- Firmware image tables are now moved to respective MHI controller files.
- Removed redundant if-else conditions when loading DDR training data image.
- Corrected commit subjects and messages.
- Removed Sahara variant structure and introduced mhi_sahara_fw_table structure.
- Link to v4: https://lore.kernel.org/r/20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com

Changes in v4:
- Updated the series based on review feedback.
- Link to v3: https://lore.kernel.org/r/20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com
- Link to v3: https://lore.kernel.org/r/20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com

Changes in v3:
- Dropped the explicit image table entry for the boot critical image ID and
  added a generic image ID based firmware lookup fallback.
- Link to v2: https://lore.kernel.org/r/20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com

Changes in v2:
- Rebased onto latest linux-next tip.
- Reworked commit messages to clearly start with the problem being solved and
  end with a technical description of the change.
- Moved the Sahara driver to drivers/bus/mhi instead of drivers/soc/qcom,
  reflecting that its an MHI protocol driver rather than a SoC specific driver.
- Removed client side image table registration and consolidated firmware
  selection directly in the sahara driver using a probe-time variant
  mechanism.
- Ensured each patch is self-contained and does not break the build or runtime
  behavior at any intermediate point.
- Simplified state handling and lifetime management to avoid duplicated state
  tracking and ad-hoc cleanup.
- Updated sysfs handling to use controller-scoped devres and avoid one-shot
  reads or manual teardown.
- Link to v1: https://lore.kernel.org/r/20250825101926.2160554-1-kishore.batta@oss.qualcomm.com

---
Kishore Batta (7):
      Add documentation for Sahara protocol
      bus: mhi: Move Sahara protocol driver under MHI host client drivers
      bus: mhi: Centralize Sahara firmware image table selection at probe time
      bus: mhi: Add QDU100 Sahara variant and firmware fallback
      bus: mhi: Load DDR training data using device serial number
      bus: mhi: Capture DDR training data via command mode
      bus: mhi: Expose DDR training data via controller sysfs

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/mhi/index.rst                        |    1 +
 Documentation/mhi/sahara_protocol.rst              | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/mhi_controller.c                |   61 +
 drivers/accel/qaic/qaic_drv.c                      |    9 -
 drivers/accel/qaic/sahara.h                        |   10 -
 drivers/bus/mhi/host/Makefile                      |    2 +-
 drivers/bus/mhi/host/clients/Kconfig               |    6 +
 drivers/bus/mhi/host/clients/Makefile              |    1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig        |   15 +
 drivers/bus/mhi/host/clients/sahara/Makefile       |    2 +
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c  |  515 ++++++--
 drivers/bus/mhi/host/pci_generic.c                 |   41 +
 include/linux/mhi.h                                |   17 +
 16 files changed, 1852 insertions(+), 92 deletions(-)
---
base-commit: 0b1883ca75c0005ab5ca52c7bc1a26329bc39746
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

