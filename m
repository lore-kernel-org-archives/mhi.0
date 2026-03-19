Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01D1DDC2B
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901909; cv=none; b=shkw3dYZiE1Mpw3VdyfrWr/m83KWZiIx91eWcHeL4ouBzIMwqNeDfHOMkYz9zvabbSdWZkpprgaVwyZyQyF3FrjSaMO6Yacb8PFH5XTNoZcqi66AcJAWMKwAHSf+1ioDfENrevBmAEn4T4xZlj7iiky0l7mSh9ong31FnsWVKRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901909; c=relaxed/simple;
	bh=eYzkZ3XRoWualdOLvHSF4ej1vq1IaANvIq+gf8oCGpw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rmgzTTdO2GO9UQameI5fSJDjmyClh2AsqKPAnfikQyz7f9RWCXooAymNnM39W31c+Ya4Bc33cOQJQtD1+XDitRq/YeE0/BiIJicUGL8PX63DkD+rdBV8353mrCjx/KutrtU+tyI7DpIM2Fy2sQf+lxIODNeGkXmUJ9FsG7nYiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=firpyqFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXo058xK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="firpyqFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXo058xK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XaVE1701872
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4gHVFKmZF26QFBdmoRuyj1
	Gtmi6IBytdod9bWmmIVOM=; b=firpyqFS/aujfGShxzNEgMg4KFaL59ToVcaAwh
	7C9Oa9z7pyx1aUeSGEVyCJZlX6rxgjnx5TQNaN7zLVCpHep2bIEGpxvvpKr38iZM
	47ppjhomVGsIXUnir9w0vv1/chBUztEWSfjb7ODsjbPA4jEx3acXtIjCPF8aGdVv
	0giRNjFxfAoYOFOnjWBGsl6T1CiGrnQBrDEtiyCWSzQ/JW0CV/C4W8Ciq+pVo+zY
	OQgvRZGDUC5hWvqL2uQ87b/33AqEQZVMMu8g8AYcSFyZ8umP/mp/AGFPa1Flak4b
	3t8znMFPMwxvZjc2c03Q42hfQ8LdIjzAHkLTFyLcsPk3nGrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgabhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:31:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b064884a7cso31172615ad.3
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901907; x=1774506707; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gHVFKmZF26QFBdmoRuyj1Gtmi6IBytdod9bWmmIVOM=;
        b=RXo058xKx39ER93PvI3iwumSRllRAwo20c1ycq97z9h4dQ49mPisJsQNEamtPWpeRc
         IApbrgd/n52aj00kXlXJCPYJot3cCxH47iBWOOsg6ga9+EVEj7uFkQQ+1R/PxLwZvJLr
         R0diMtZdKFtOf+5dPzPFMyzSY/XC1+LYyQYeH5bCixr/zAol3crbKL/GHD5SdxnI+J0J
         /Cl0J6zz1d/hTKthwEoch5trmnmKn8ydSZlLxBPTS7sQ29v3heeBqcQTeEnShKKYM/Jo
         3nLNHcIqYU6h0jH5t+xa5Q5tHgQzT+iYRtdx1hYmzR/kXUGkiT98rLQx/6Wvd0Jcl0c4
         EB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901907; x=1774506707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gHVFKmZF26QFBdmoRuyj1Gtmi6IBytdod9bWmmIVOM=;
        b=JVgZEaWy+V182NgPLc3wbVrfYIRC4mIo3W9k/K1yyvD5s8LedsP9+QVUAnAZDM6ZJJ
         fkG/o1tnO+wgESLeJpyMopcwhSkxHDgANiGkOKXOl5+Sb/TUBss2YVIT6KBOtz8j3q6S
         hwVusiPpli+kyLFfzVgaSTbUPq9VkizMFmbSEZraOofhEBqjDGtmhrB22aTaDZs+1H3h
         JbShx8k7bsXfP1taahtjNqb00VlWobmMTGjLzVq8qhF3/n4sSDNymdV8WKRXY1JlCoBa
         WobnCi7bVQUMvPJa5Ysqhgnl4PNZkUU+FBkBVQVmonrug4BDwFH7TLBcUQqVqyayBDAM
         Sb9w==
X-Forwarded-Encrypted: i=1; AJvYcCVjIIXfqz+5w+RivIVHn7gFukjmI49g7W9ll4Isp7R9RL6K/rq/Cz5QEiDAC+xfI1G1NjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVmivuTR3RdBU9d2EenhTichtRAz1K1mo1NB4QXVVFFM5puu13
	vO3zLtIrNbBF4n9IJoeN+euC6fVl9fitTZCr3Gs92KO0PuBleljq5gjqGbXZZkRz6fM0Wk/wpyv
	DDnMB43ko6UBd5sgUaklEaQsMTvpqMWOAe4qtuXesELJHmGJGEZaiaw0=
X-Gm-Gg: ATEYQzwyVey9rErg2PH+0q+DrzJmsXkByLCWY42U9DF5t1wGXRSvsBCeqw8xcSc9eBW
	6X69MNlYgkJiee2nujI7JTlP7bLRhIWoDfLCydejLh83AU30je7U71OuryU0WFeh6KIKKBirvMI
	KW7f/szAG2dGR+PVHLjHVIKq72zQx59vmm6/tyDnWRRaYZAX5JRGXKhhJ2+sfAtxcWhg9ELjRvh
	O1SzIXM2hxghQ+3ceVDz9xRpiEmBhMkocE9G/2oOgYfyJD1+9UL0LoDDDOWk20d47NmvqCvc2GE
	urWTSC8aIrn5d0G2bfn308uXzhjS0Y/9faMgF5r5GxvRObjDRk2wiIwAqgX25wbssqGEU/qb+if
	16DfzP5ISXyN5SKVE1QG0Fpu3lX8wDyJFbUNnwIkc31G99+WKQ1U=
X-Received: by 2002:a17:903:11c7:b0:2ae:483f:b23c with SMTP id d9443c01a7336-2b06e40408emr60424065ad.36.1773901907013;
        Wed, 18 Mar 2026 23:31:47 -0700 (PDT)
X-Received: by 2002:a17:903:11c7:b0:2ae:483f:b23c with SMTP id d9443c01a7336-2b06e40408emr60423875ad.36.1773901906445;
        Wed, 18 Mar 2026 23:31:46 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:31:46 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v4 0/9] Qualcomm Sahara protocol enhancements.
Date: Thu, 19 Mar 2026 12:01:40 +0530
Message-Id: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEyYu2kC/33O22rDMAwG4Fcpvp6DrfgQ96rvUUpQHHUxa+PWz
 rKWknefUxjsYh0IwS/QJz1YphQos+3mwRLNIYc4lqDeNswPOL4TD33JDAQYUQvLMw6YsL2kOEU
 fT+1IX+0M3BhotLK29kfLyvIl0THcnvD+UPIQ8hTT/Xlnlut0JbVoQEshHZgKpBFaKy75R8hDT
 FR1OE24izlX1088+Xg+V6WxlZvhh/j3q1KCg+u9VU2nyfkXWv1Lk+KlVhfNOUWoOtFr7P/QlmX
 5Bkk7gVtUAQAA
X-Change-ID: 20260307-sahara_protocol_new_v2-662854773cf7
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=5830;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=eYzkZ3XRoWualdOLvHSF4ej1vq1IaANvIq+gf8oCGpw=;
 b=PWgBBhIxmBKr9lbh/++fnvWRXX8OMtVafmqbTE8ToPCX3FklnIt8Bnn3E/DHUl97pB/l9RKhu
 B8C1X35ATdtDVHW7b+M1L16M1gcwnXGNwslJvZGBkEJGxaA4XUwvRuG
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXwMuqn7xSr6Tw
 6D/oBMZRHoUAOT9XcBzMe0An31RgsIbmaUsaMNuBIbekdXoxELYJEcwkVRY7SHXTpFQwW7434RB
 IZkV3TA/Wu1QtzUJOYoM3U3h7jVmuHrNrmOBZjWRFMGZY7ng0YcC03Z83+XxcrOO2ZkcfkI9Md2
 OXSFg2nh48Nd1kvoTHD4iiS97LsarcihWqkALnN+SMRKXPYGnd2ZNwWILmI5eVvXD5giwt9mcxD
 hXxG9zWEmZQ7nbTWyIA82wkKTSY5jLa8afvWoT2XAtXqLfkasUkoGhj0jDqSuZBi2n6pV6p07V7
 6zQWeHumqfXEyBgd0OfU+BH4zqEoMEBYe5e1d+FXn/ao3orsDz+6B1ODEEvcAqqoWW64FnzUmrE
 ZfeKjT6Y5fTX+7/OOlvxTMKVV9udR+0/FFKICYB2uGsq9T+S6xL+Pgk3aCwHNaYS+htI6JQPtON
 eU4VhXcIlGC/1fEXIEw==
X-Proofpoint-ORIG-GUID: F15_vH8MgDtUwZF4TalhZ_mC-yuMkdPQ
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb9853 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: F15_vH8MgDtUwZF4TalhZ_mC-yuMkdPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

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

