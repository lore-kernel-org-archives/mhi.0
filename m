Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A512D39A070
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881148; cv=none; b=E1pvmraHv8oOEsFE/ruUvimoMmHAd1okLdjfKHuTXoPfqIplUChgqlmIleraggSwvTFdEmocEXmVvTKC6aIC0p0AW2queOCKvGrFjfxLe8W+XkdZLxjIirOACHeGgtVCoU/lNzmqRGylNguhPSBwKrRSq30aSXC1ip9JW6fROd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881148; c=relaxed/simple;
	bh=rrKEbuNDjPAq4STCm2KriONXpsF5cCQEo9OyC6ZSkxU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lCfpsBZT3EvCKZOUK6468Kr64LbrR7IMQUCP7berHr2GLximnoSuDi+8helayuRN41KOfZgCC/homWgpomq1PX0EbhCmPxf1W+tJJnf7AZTo0t2ypcsdr3oxiq0UOT6CUUR0L5WeZJjqnLfnWyLVvSVHl3gYRoQChk0E2P3sPrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKYZwFi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz1G7hD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKYZwFi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz1G7hD3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8LtTQ3908692
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hm90XuSXOD/PEj13akjejZ
	9JjMmz/a4/47/QbvQQN84=; b=YKYZwFi9CecwqhxgzbRXHS3jHBHdl4WOFgiwqK
	aAndH9KLMY5kDzLETrWZk5i/z5INOGnAegeRildglOtYyFlUuH8AVX6TTt86bxOd
	iI329Jl3ihLBeQBAdi8/tvz+9ve10Jc5A5H4SIGeuc26M4x/fF9kz9mZyd3xsCG9
	S/aas/ST4ksaRDjySjySvPvirY6Z5dbFW0LqRGhdrC/kB+Fl1mQIA2X4DWNosZxB
	5DDKxa25ZBwiwX4n1IgRo+bOyhhipYVMr7JbmKJvQI9GWc1ZXg4+IEKhNhH5BZCd
	kq7PWtitmeR7eeuweNdRiQSlklfBpKL0i1wvqrd/gHB91PYA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtkcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 08:45:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3349388a91.2
        for <mhi@lists.linux.dev>; Tue, 13 Oct 2026 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881144; x=1792485944; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hm90XuSXOD/PEj13akjejZ9JjMmz/a4/47/QbvQQN84=;
        b=Pz1G7hD38mxqaMZpjOsMRuFhPcN1szQCG+cj3kIFIkcO4zAWoPf5O+R8S6QHeEMmEF
         5HtFujRQcOBwBEKZo7kP5QfP4/nwrwpsxtvQIFMQz1yp+DjXx9bTDEyObo9L6Wd5l8xc
         iH2FQ2MMaEUAzhQB0/nU9uBThV4NOH6TVNVinIIzDUk+q2naPb6t82rmGZLEINXbbDOo
         VSRugnQGn0Uz7CSbipoR/FGGTiyLUpk430mKRqfKJw59GHvIf89/uDpw20HNpsjVNDY4
         tjtIFoNuz92KSC5V9pkTU5Y/u/Z1wOreXHbbkkois1NRrXxlXNTnXTXQXGI4aJkj6G3i
         P0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881144; x=1792485944;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hm90XuSXOD/PEj13akjejZ9JjMmz/a4/47/QbvQQN84=;
        b=lWPjuPjl8sUWshgYrze19Fdz86XrL0SHCpYdYS6JWKpeCG3cDMIr7F3w0ZjUheJQA1
         Ah+rTuQ6h/LliEnG6/kI0qQawLm+6bTjpGEuiBGH2p0oGHJjycGYxghN1cuNQmm1vKqv
         e6Jr/zP8XpGdsfL4dChJj/b+JGCJ/RVaohXzsLah5mnZQd9QSQGnVi/MH2WHAnZlebEH
         xkwT+iCPvTP7ayFi4CoWJh1Qhj9SCZy6ObfHP0Thxp2x2wKoYJQvuL9jrhkALBiDqYBE
         wfmNXBobJBLsrgRMz3CON0FNf6/WzNpCq+cOdjuzv10IosJWlDcR6OD8QtwYo5DedtzH
         ASUg==
X-Forwarded-Encrypted: i=1; AKwUvByYn7ozi45v2wLrO1qo/zdVvPhUnDIDTcOediMshDCcIbOPjrqV+ApTS3d6ovcy9zMSSvg=@lists.linux.dev
X-Gm-Message-State: AFq9FYL8IAtH5ml1xjd7jZmkgT71NywcBMQIexVWl6qUV3ZPInpdTATa
	+OcQ+hu2cOXSY6tNQeMnhD1E/dUhFCa/vi5q6WyyncP9FZIbDXGblTxuMxcjeQdsuGel0+vIY7O
	XxqaoqsR1vNJPabOStwE5QJMFPSKKOeY6r4McSIqN5HtYLIslCxq4svY=
X-Gm-Gg: AYBFou1hJ4FqxN7Ha7NpuwRRmqkXGtfTObGqoNFykqfpTqW8PafuQWJZZAcl5sEcvWM
	o2DeGCb41dmGYvDiEoYY0O6OLlilkpF7oS2mNkCGg3c/5X+2EXKYKwmgOZdu/FdXsX4Vu9ZPoSY
	g0wbmW+LTdqaGQ2HdB5YPiQQQGopyfgE8uVpFUP3MsGFsWVMGvOsbMTvw1qHJT0At4ytAOTa/Bp
	cQTekMid3tVEhb7Imre8mAiLWDCUeH8sDfHXeqVW/ffc4SuznYoDa2muV02E2ipiTaFXhxjW851
	2uDRJ9YcwWXu+/0H+fxZe1E1HU4yALXktroFWfALsagoSk6AeX3wyyOAF+xP7t0ZWTnWIDysxFI
	gwWBn9JQ0xS6OSpq9Rvcd4H/aqohi
X-Received: by 2002:a17:90b:48c1:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ab3a79c42amr9217789a91.43.1791881144254;
        Tue, 13 Oct 2026 01:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:48c1:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ab3a79c42amr9217757a91.43.1791881143688;
        Tue, 13 Oct 2026 01:45:43 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:45:43 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v9 0/7] Qualcomm Sahara protocol enhancements
Date: Tue, 13 Oct 2026 14:15:31 +0530
Message-Id: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvvzWoC/33Q20oDMRAG4FcpuXaXyeQwiVe+h0jJJqm7aJuar
 KtS+u5mC9peGCEM/APzZZgTKzFPsbD7zYnluExlSoca7N2G+dEdnmM3hZoZAmoQQF1xo8tue8x
 pTj69bg/xY7tgpzUaJYmE3xGrw8ccd9PnBX58qnmcypzy1+Wfha/dlVRgUHHgFnWPXINSsuPdy
 1TGlGM/uHl2D6mU/u3dvfq03/e1sJVb8If4d6v6oEMbPEkzqGh9QxM3GoemJqpmrYxODhCUCw1
 N3mq2qcmqSXKBrABDGhuaumqS66amqqZdHHYAKsqhdTd91Qh4U9NVE46M0OglSd7Q6FfjAKap0
 Xo3CEhmCBWTDc3caBybmqla5GiFDYjW/bXb+Xz+BmUHfnbaAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=7797;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=rrKEbuNDjPAq4STCm2KriONXpsF5cCQEo9OyC6ZSkxU=;
 b=Y9oWS8XdzV++hBjq5f4GLgWvgDXLVF58H6pXOC8+FOQHE95pl1ws1xC1/GapAMPhDhBWzz8ni
 bAU1170HubdC5AtF96L6SnfcW5e+pdQvhTlwxT9qsY87sWokzun8o45
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX55sUzT/zTf3e
 XU3ZhzgsU8gmkZoBo3tILvtLKa+q58lzFiVqp0SG/p9IqA/frygh7eH3TivAWrjxNSWX3D95r5u
 9hjK8EUGg0TBlG1uhlT9n8Qt0kxyCnHm6xp8CJpR5SGHgU1ARj23C11gKPqZvGJjcdSHnczbFsU
 Gw3D62WULkrPj5LPYRRvN4oMTL/uzJxcOHkY/B1A1RAVOh+oUrM7QKCA1c61iVud7dZHFzWKQul
 endfJSOekJPqS5KvI5P+zSNBDdwouM7Vgf+l6BdjOdfKQJDpWIIMVRUig7i9F3QdaVddNofJT/E
 s39AHK8zI/GEPlSSD68/1A0yQPVIpctd6XB4M7I2PAasKkmwKkIzCVtx61m6SMVPQnXvnot6ibe
 oSzNxMGN92/0IvL0WNgk4J2XZg/4k38DbivcD/IBYYR8tJWe6MKfkDz0Fp2uB/N5MQutDtdp4sw
 kDNShh5LvGdMJMtdS6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX3dUfYOFn6Z3D
 0TRpcmM95ujTWION603ehTx3u/HtoXmVcQN234Loq5pZPwghaGRfMaNbmmZWS9E4oVuJDiLbJr7
 dd4ChRVI29OxZIw3QI+HjeySijcA4Cw=
X-Proofpoint-ORIG-GUID: Zli49h-a_s1da2enqyS66h7cdrTgXM4D
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acdefb9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TZsl4NGrXgOhBUOoEegA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Zli49h-a_s1da2enqyS66h7cdrTgXM4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

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
Changes in v9:
- Removed the unnecessary linux/mod_devicetable.h include from the Sahara driver.
- Link to v8: https://lore.kernel.org/r/20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com

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
 .../qaic => bus/mhi/host/clients/sahara}/sahara.c  |  514 ++++++--
 drivers/bus/mhi/host/pci_generic.c                 |   41 +
 include/linux/mhi.h                                |   17 +
 16 files changed, 1851 insertions(+), 92 deletions(-)
---
base-commit: 0b1883ca75c0005ab5ca52c7bc1a26329bc39746
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

