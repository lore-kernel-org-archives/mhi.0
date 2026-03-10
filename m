Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35563D565D
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127336; cv=none; b=Hz3bnHEmHgT7QzGJ1HEm6LCXff6/jrD2onZcUa97LO888bqe1IkAa3ok4qwUN/rCQr6+Xn7Pnzud5lFX0HNMSjRtv6lpFlOoJ6Q7iN6AlluWWfzh+FZcXep8N82xfpzkTojaYHvYUnresArU/i5GtYnLX1EdSKpH60qXSbINiQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127336; c=relaxed/simple;
	bh=3wPl/p7STummudz4gDu/8803TKuECDOrkGo5XhXfE5g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DrzqX3lOyrqGvn//cVEBhydZo+uCM2zcLbhpO9+mZrvqiE+ew7zRp7Gsz9Rk/QanDrc2MUsNgr3shWw2+LVDggjwtdDQGUpTicNHNh9J7DV/dJIsCnGRUwBP0ltuv1qzKKkNxF/Qjua60vU7hSkUDO6lvVUgyDykuifMw5be9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpDvCTbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEntnymp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpDvCTbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEntnymp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EIne2362835
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dol8ejvArCi8fxJhixn/pT
	rEdqItoDa+4yoar+GweDQ=; b=CpDvCTbWVfzzjjBdjvtU53eHfiepBYmAXeAOYL
	SlNq1R/EA2OsMbEXSX3wyqBsSYEnGenOYiH2PbawJoGoRajGz7rdIDbXFTbeM1q+
	vwPJimy7a7hcawJWEw/mZx/yuVolH/K5EiDY99dPhloTYLkjVi9R99WLwApko6TT
	9sKznzJJPt0dITRhDYqpITefatXi2YiVDN1lgWfqmavTe7pLcRJ0Rub+L7+r1eNC
	j7Lu0+72PYX8zf3NZK1/4mYsiDxdbDMhZf+yOA1oUIW+lWk9FEu0ejVbOEYXTcVm
	cRc6AA4I5fgaGfp1JPgmHlQ9D2529ha0m+ciLiMZnZuviRdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032b20a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae49120e74so85338305ad.3
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127333; x=1773732133; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dol8ejvArCi8fxJhixn/pTrEdqItoDa+4yoar+GweDQ=;
        b=dEntnympbvnDSJOAy2yzsHMkFOsBBSw9LFP+H5FPZ4B6jsLtELv4KMFIQraVetEyxS
         fSyUcK6VLmZmJziaEaFZAYECYZ55IbVxSTCZFXK/td0UJQd8xVqvPbaSI/NQ+kSxDasa
         JWMkOb76cS8UCAOkRSiR85vLasal6fejLzyTgvTjEvRkSTMjHHHejjFEM/LGWqUUkYYT
         q+I198IJHTpBV81QOODAfM6x4OrkeS8kGV7clQr46ml+ZTrBIdPe+Bvals6ggP1iTNg+
         LxxuVR7qD3evNSNY7QNuiPLoQiS4GYJdE3qyebB8REqn7AUNucuywXvdTCtUKglWrydw
         CMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127333; x=1773732133;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dol8ejvArCi8fxJhixn/pTrEdqItoDa+4yoar+GweDQ=;
        b=neduEVUUnYVkKpUEtH1k7z3PXzioBo6bLE5nNvQ5MnyF+lhFIvCl1ULPPWcafTjQ/X
         14Ou/Vxz7Tbxyrv03l8NgRzQjFMpAQ/QVGKiETMNk+zZ32SuU4CVLpqeHmlbWqXIFP9N
         i/KrbjCPhMC1hSWzTbzaq2bX1g4eaLRtOypMSYrkeDL8jjVUdr37zpDJChb6Duz2TUEv
         pJa5j4d10nG5HmGw47b1B8FxlmDc2McDBGWdARdp0+y3N6KN1SZ433hKzBmo1If7iC/2
         reWruuAfYhfau106pDELxx3Qqo6d32cnrxK5yluEZy4x/wCiUSiRZZedD32/449Hx2ZF
         1X0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0oP0unfJpc8v73VOGc5cYMC2r1rieZHU4qSztUv2plQ4BJjYO/CGEQvj0DmNL5Vh3igw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1vlVWi76zUCSG4vuRdeareiGHDCs4yP66tDk+5Oji42Xmh0zq
	12KPy3iUSn1u/Q3DdrRLq9H8KYriRMuZl/CyP2vxOafNCUVK5C5rjTPQM1heaUd9DH6eH5nj4tu
	hoacO0JwgFYYZcLNJaInXhlRb0Yod3Q4RdanBeqnumxMBTpvDytpZcbE8E/FHQW8=
X-Gm-Gg: ATEYQzyM8xL8AC2ASZyQOmLrCJUpy8dVTnKvpBuw8M4SW15mEMjdLGn67GWLUFHNowU
	14vvoZk85OwBBk9zezPDerynXHFkJY36hV0Jh9gAXhIJQl/fjazUaAnYzZR8VJjUgnxx6GlOtgT
	VyJi8hp0iCJKNsBQH5ERPZ8K/RXq4TSDSozzyj//C7yOo25wo3CYnStsF/TChtY6DQlzblxZqpF
	W8e2Wm1ojIz0cOV0OMOimt7u3xDHNmrb2K3GNXWKVAe0AtIH2N4+cLTAZ1+a7eGi/gCa2YbSmmN
	gccAX/GjSaQozMRQDO+qw2alrxhUfNFnpKNKt9MPJ0mlkffEiq82kGRZyMZ1zY+i4zz/OFCDl0T
	E2+cMyO657uzxYJ7jpM01iwEsaA1oTiw1+53+qPofh/WQXai7jqY=
X-Received: by 2002:a17:902:e544:b0:2ae:7edc:91be with SMTP id d9443c01a7336-2ae824eb08dmr124767315ad.27.1773127333096;
        Tue, 10 Mar 2026 00:22:13 -0700 (PDT)
X-Received: by 2002:a17:902:e544:b0:2ae:7edc:91be with SMTP id d9443c01a7336-2ae824eb08dmr124766975ad.27.1773127332571;
        Tue, 10 Mar 2026 00:22:12 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:12 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v3 0/9] Qualcomm Sahara protocol enhancements.
Date: Tue, 10 Mar 2026 12:51:57 +0530
Message-Id: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJXGr2kC/32O0QqDIBSGXyW8nqGn1NrV3mOMMLMlq2zq2kb07
 rNgd2Nw+OE7cL7/LMhrZ7RHx2RBTs/GGztGyA4JUp0crxqbJjICApxkRGAvO+lkNTkbrLJ9Nep
 nNQPmHAqWC5GpVqB4PDndmtcuPl8id8YH6957z0y37aZkpABGCS2Bp0A5YSzHFN+M76zTaS1Dk
 CfrfXp/yF7ZYUhjoE03w1fx96s4BEPZKJEXNdOl+mFb1/UD2azRvwYBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=5595;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=3wPl/p7STummudz4gDu/8803TKuECDOrkGo5XhXfE5g=;
 b=R+X2+4O6wl1uLwElI8uYBmMvkmi1hAd9Y17iMHYN8I3mG2QBTSAitqo0MBz7M1syDKRvRkM11
 bwLkwUA+HyIBLtVHaZSlIZHOcLvVHly/oznnoUyOzifKC8zILniRruO
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MCBTYWx0ZWRfX07d8oF0QfeH2
 g9Q3249MJpKGPu8DcB/z7D167obtgXFiJ96GvNiEk6SzPf0beeuIDTItsvJSqSUy8wnbu0aJGxT
 1ewrHy6wcAMsqN72L+xgZ9UlkOWHjjbTz3jeCtJMeUl1jSOMJDhRCfOgF6uPskqO6U8rBbevwW6
 JO7O1e7ykXmsiTI/da2nA/xsa3W585bNXLBdN6dTFiQUR0ITfX3drsDz4ONIHvR5gTfOBoVvvi2
 0Wsv2U3jt1jrcuB2u5omV4f5cZ+/iQzTN5YX6iOPmNycOKqiz02sKY0KmWZGpKss3bLLpvFz8LB
 lOIoV40WDmfDcDnCSPwxLsdhW+9xaB+1/FwswnLJAEWmrVZREvC+yoOgWa8NEGKlIe4AKf33jLG
 pM4uFba3/aQ+VZGDobzL3tZaK+T9MsCTnxDlNvdor9qrnj9OTPDulrChgLh7MOAdNnucxHf/8uY
 ZDEC8i8tWIu6KNiK8hA==
X-Proofpoint-ORIG-GUID: PdTXHQYnTngYCgzmak4GzIiswr32zhIB
X-Proofpoint-GUID: PdTXHQYnTngYCgzmak4GzIiswr32zhIB
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afc6a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100060

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
      drivers/bus/mhi.
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
Kishore Batta (9):
      Add documentation for Sahara protocol.
      bus: mhi: Move sahara protocol driver under drivers/bus/mhi
      bus: mhi: Match devices exposing the protocol on the SAHARA channel
      bus: mhi: Centralize firmware image table selection at probe time
      bus: mhi: Add QDU100 variant and image_id firmware fallback
      bus: mhi: Load DDR training data using per-device serial number
      bus: mhi: Capture DDR training data using command mode
      bus: mhi: Expose DDR training data via controller sysfs
      Documentation: ABI: Add sysfs ABI documentation for DDR training data

 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    |   19 +
 Documentation/sahara/index.rst                     |   14 +
 Documentation/sahara/sahara_protocol.rst           | 1241 ++++++++++++++++++++
 drivers/accel/qaic/Kconfig                         |    1 +
 drivers/accel/qaic/Makefile                        |    3 +-
 drivers/accel/qaic/qaic_drv.c                      |   11 +-
 drivers/bus/mhi/Kconfig                            |    1 +
 drivers/bus/mhi/Makefile                           |    3 +
 drivers/bus/mhi/sahara/Kconfig                     |   18 +
 drivers/bus/mhi/sahara/Makefile                    |    2 +
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c    |  601 +++++++++-
 {drivers/accel/qaic => include/linux}/sahara.h     |    0
 12 files changed, 1869 insertions(+), 45 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

