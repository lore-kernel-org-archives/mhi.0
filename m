Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5E421EF8
	for <mhi@lists.linux.dev>; Wed,  1 Jul 2026 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902272; cv=none; b=FM+YE1P6EupELhFtvGbmenwjj55fsFKB9nvjqoAKbQiptfwnPpWPpwU/WrRjT83H5jNn6gV0Y6SK02IorIh0+ZHtyPx7LrlqUFLvUKwqOGNb6J+36waSBnD3kOTJXnOAGSdqprUpSzIgiu3BulzSee/0Le0v4Eh704nIEeJ8Bw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902272; c=relaxed/simple;
	bh=vy+N8rR/U3qscov4uu/VMgbY2M3N108yYGXpT3iP1dI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pYlGTiud16IE1dx/9UF8LnAMTM2xkeNEVbfohZlaP8Xb8QRUUresYr5+HUtjzFrmIuh+rGKBSnLEov6jc3rbAorOyC3/Aoce6Zn0xJTSA282qQEWRaSEvCeERX+stWVzo3vQULCW22UI7SA47uOSgq9mRJ8KGDp6REOyZZEyVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DABVRlaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4ycg8bD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DABVRlaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4ycg8bD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9DDx754017
	for <mhi@lists.linux.dev>; Wed, 1 Jul 2026 10:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qoHqC950ogxUMx6e6GrPOq
	aJXyx0r3zT5fgO4h24QqQ=; b=DABVRlaG3BOKP2ZjtYjL9MvR+gJMBxCrF8BUr/
	c9VH/lQ0+xT6XPrvo8VgEC8AbDRBAhoMY9u1ua43Q0XNmrJSZ2XAGQFcwtmBSZMn
	K+ZvQ94yMuY4HYFL5OTWuzD2KsTsFMFd6a/7uGO7EbU/N8AtF5QaPZItb+AFCfT3
	/8+huTQfYuH6406Mlzc5Rvpsw4mUI5STGT/03CVPotLPWQsY0xdfVS2tMuRDYNHH
	4Hi/cH9klZ/phkoRxEfs/hvHQS6DOPYlqJn+qYzNEArHZaVg+F+d0m3OweG5MtV+
	JZ4hXF9POXSyfW1zX0EpMXGW7gnS0/9m45QFvNc3m6Tcsadg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy27p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 10:37:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d4f23eb37so957153a91.0
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902268; x=1783507068; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoHqC950ogxUMx6e6GrPOqaJXyx0r3zT5fgO4h24QqQ=;
        b=I4ycg8bD0aabds89bhr0rWpFUB2SLcYf37Jd4yM7Gx0gukAZ+w0AZEZlrpgP8j8Sz+
         Pz9ZBHYAIuJpeX3Bp87MbSqFsd/WFHUVzrz9qETvkhpLIWzlNa041+JRtcCuh+HJUmke
         ou2YLjOnHvSW6YTuPrKzOMsJb1wdayn0y5GNXqfEmT+6GmOMsRwi6DD628SdtUAswwWY
         TExut83FLxrwMY2IQD3dkFgozggHR4lXK9weT4Ex2XIbm0uN/QuT/xobflWC8ssqBNrl
         r9XOKPUyoJUc2rV2/F1DLDx0kBr88i3dQ8jmFkobVW67qqfe6lKaULRKH8Q3+R9H5d/x
         +HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902268; x=1783507068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoHqC950ogxUMx6e6GrPOqaJXyx0r3zT5fgO4h24QqQ=;
        b=dx1EL5W2DuKLnQ3sgMnnDM0HepVE2mqi0u/B1JF6SQi8aju34lZe1F2VK0LUeBivaE
         ffXEWShuj6jt59+0Jad4SJL6VXHPBFr7A7yvOX/DVvLNfHBRBwBZyqZBaJAsfvBrCl7c
         mt2HsD8NRhJ19dd8j4Zyd3lHkWWDLgS/Rx796/VG5yytLk8RdWhkV/D/J9WSLcWdNHDV
         ZmiQKcY3yHSRada3hAIw8cOu3d9x2dgCwwfh7j5yHR9N2mjvQpqrcHQWN1WQA61V2MPi
         3HbStfTIdZUpAVOCYIN75JmWUqgX11dL9lT2PMuommo6VwlOs7+9kE065yCsDxAwW3MS
         ekHg==
X-Forwarded-Encrypted: i=1; AHgh+RrSd2+JraJ/sQ7l1JZDVQ9nuqhHwk/VKhg54eaLntz57D7ZcU45fy6plFbSnYe2xfj8OuE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvce4cXdB2i57Vb6VtlYVUZpGi+iTE1vqMEL8FjV9rVDWW6O6I
	SGjWRbxYmkjaLT7u3CDgscIYueciZ+KUWr4QugxkESisQ7o/tyUhBuPWXUbwmur5PeSrd2kkMQH
	ScJfUluodQh7SuA/CXuCR9vg/u2n0hMQTxYACrfoIcbJqfUtFAipjf2s=
X-Gm-Gg: AfdE7ckGsDX3RefMNeQNgje9YDQhjnVaGWalSJX9xOqbSRgHGsQmuDFw24Ov2XuZZFR
	q2MzLQDXOBVcpnGXt/2F7iDHtiuJjrLbsCY9HQ2aCcIRMS0iwQ4YnsB2l+sdBcvZ+Zd5NvuD/qN
	8hgPwcS+wl1h4pBi/3PNJ7rDk098rz1/vsAdzh4IMcG/TBHRATLIzlM+eTZeRlgwtnC4isRgqPG
	5EnEJwyHygpUOWB5Ryrv9IGR1/Yyx9bG5NAg0xCfLCOdG08M7j6yBoUe7N6PDonIfhBsijQqAG0
	j6IuV9goT5sWL8yNmyKjPBdSDLKf29HnwESV3FEzWZTXdvJOkQ85Tf4SKakkdK134VS1A+GMvnp
	5a0h08/lBP77azYfIhZeRy4WQoKT5Cv8eGjey0Jt6
X-Received: by 2002:a17:90b:35d1:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-380aa184bcfmr1270480a91.19.1782902268254;
        Wed, 01 Jul 2026 03:37:48 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:37f:ce2e:32ea with SMTP id 98e67ed59e1d1-380aa184bcfmr1270450a91.19.1782902267757;
        Wed, 01 Jul 2026 03:37:47 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:47 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v6 0/7] Qualcomm Sahara protocol enhancements
Date: Wed, 01 Jul 2026 16:07:34 +0530
Message-Id: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7tRGoC/33Q22rEIBAG4FdZvK5hNB7iXvU9SgkTNY10N241T
 VuWvHvNQule1IIM/APzzeCVZJ+Cz+R4uJLk15BDnEtQDwdiJ5xfPA2uZMKBK2hB04wTJuwvKS7
 RxlM/+49+5VQp3kmhdWtHTcrwJfkxfN7gp+eSp5CXmL5ue1a2d3dSQsclA2a4ajhTIKWgjL6GP
 MXkmwGXBR9jzs3bO55sPJ+bUsjOrfyH+Peq8oBy46wW3SC9sRWtvdMYVLW2aMYIj2IAJ9FVNHG
 vmaomiiY0Om1a6LTiFU3+aoKpqiaLptAPI4D0Yvjr37Zt+wZo4bhx8AEAAA==
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=6830;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vy+N8rR/U3qscov4uu/VMgbY2M3N108yYGXpT3iP1dI=;
 b=ikt7MflyMLirUid2ofbzcKYtIKTCIMEFBHlq8QGgBLAIzEvneHdRYEHTDka40K5f1qslKFZIi
 5Aae5ntG34tB7ttQ2xfesFlbOyFmO08H/35HV/LmzUepNkrPKBLvDr4
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: WAfN_J3W4e-AIxx8KQj4VPk7Os7w35tr
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44edfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LaHGMCMnodEAC_t7lLYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX8S30CreyvLFJ
 d9liycZRYXMuejr18GzGOm0vxFl1YSxxm2Bim9c1bEJO0fZ/o1trsO1xcKXYOaCc3mDcLAf3MIB
 ShQ/QWNt/b+QYVU3wbw5Uce51Y2oicTjPN/QFgZywLqSd9fcN+fM79LZIsSSMmj1VxFVabdf+3z
 Uv9R9F5gfMCA9ccdodtsFmNfZo0zd5FTILyxCHxPomgNSWHjnNbZd3HamjpPJwTMkP4LsryyN/w
 qK6GEvS64e3VGf6kODFz/OZLCPUxofX2/Vz4hdZ/C4LeZHCVUwnJmyyRB/SPYJqCEwmmEantfiG
 basWFS1kWoRmkOyk7YWoevcP/VPaFe9p69WXotClEhNiV6HUsKLTBa65nkZDNMlS7v0hgJUm+s2
 Lq3Qu9DLRLQMIB2A23iNoVnud7wQCukxKm246b+O+Cw/gLldqX9IdgQwVRbAQj/Nej/XrYU0jeF
 oH09jKHmzF9pa1muhdg==
X-Proofpoint-ORIG-GUID: WAfN_J3W4e-AIxx8KQj4VPk7Os7w35tr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXzb/rYc0QOLgi
 5RcWvknyUq73sXkQh6WMgvodd+RdS/DIs6R3W4/+icM3gnE86u67BMp47GYD8uNptggk/YveU+n
 C/O3ymeqysTaMnN99M6o8DbZrPOMJm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111

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
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
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
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/host/Makefile                      |    1 +
 drivers/bus/mhi/host/clients/Kconfig               |    5 +
 drivers/bus/mhi/host/clients/Makefile              |    1 +
 drivers/bus/mhi/host/clients/sahara/Kconfig        |   15 +
 drivers/bus/mhi/host/clients/sahara/Makefile       |    2 +
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c  |  516 ++++++--
 drivers/bus/mhi/host/pci_generic.c                 |   45 +
 include/linux/mhi.h                                |   17 +
 17 files changed, 1856 insertions(+), 92 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

