Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0850334EEE4
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883721; cv=none; b=F20s2ehIrwlkpzf+XjnAbreJ5QUy/tpHBBYPkaIk5ys1D5XeGuPwkNmlq/9++NQ5sIme1NR9WB/1ozi10t8SXVM6CQ0MlioW7mtp3Od8VNCsq/j7s2haKch7kwjvBhe5S8XN+ye+fLpcGeNFsq5IIpDaBPevXJR7+qyjJqmqGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883721; c=relaxed/simple;
	bh=iEUuY3wGzLZPYjI71MhbAplsXD6EpLcgQaZDOkmWUSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JDU6MOvJ6//3Y8hta5/sIzzQstFwM9AcUfv7xCsukQPN5295TiHCFHd9mtVjdUIffbB97Sy2/Qmcbkb4dBUJ8lmbPwn++8pr2nMa8rCkJqcQFJJ8jVaaz/TWf3l1MOSnVNtzszQfrB0fepA09nxjVelMnSo4pAQACjhw7VPUDvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gO/2Ic+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc9kucPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gO/2Ic+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc9kucPU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6274deC13360614
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3nSo4d6ACuGW4wqzMO4zRi
	XyX4asXwy79TGsDWMoSMg=; b=gO/2Ic+eCuuNyNBG6DX1wOiSmYhR6xZgc4gt1E
	DaV6icbdmVaBU53eRaly/OugAwkhW3uxzKFQYnq2fiptFFG/VcM6D3srnVkcJSYX
	gBVliCPckTeNeRVEmQSchBC39sL99aWZgo/pbgl+yYEXYLAdC3VXksxuW1swmekm
	Yk60xbw1zcamgZSxCEr2rWzY5FUBiggl3iaOPSa9cbudrpRwuy/l3H1YiBNGsQ+6
	v3jggVMHxNx/QIgUvbGdaV0WAwnOZTUMZvrsGDT5H1t2DMGUyI6dT2qN+D6WB4Gn
	OV9BkMZs6mBjD4zEho6V42lChR8gjI7izDjNXkC6YR6SUAMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6f8jsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:41:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae3e462daeso35398505ad.0
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883718; x=1773488518; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nSo4d6ACuGW4wqzMO4zRiXyX4asXwy79TGsDWMoSMg=;
        b=Lc9kucPUuMYye77Z93FqRfu5d5mUE3z3o/EjSbTS1SnEFCchuiFOiZBcn/IktiM/p9
         PkrGRNICEbOT10Dp5ovy11pBdO3RZ7R3dEEBQpG2lu9c+099/BDW4aNzlqhbWsiDhpHz
         TnOAZivU58mLYuMQV0SsL27qpUuQU6rxVcwQ77IjzucQvoNdwCiY8oILwXEQJ2Lpvdbz
         vAoBuy+ryE5yhqNzMZbdGPbq4aBqB4bW4iLrzArFzU2SkH6lWBqnCdHeVTRAe3ULCYJB
         P9T3eXRkHM3Z3ciJFJ25sAqUzwxtN4ewySpEfN+pUqjZzu2tYbLA43hdeiEQS9U1+fup
         gkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883718; x=1773488518;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nSo4d6ACuGW4wqzMO4zRiXyX4asXwy79TGsDWMoSMg=;
        b=Nzl5h+MbnmgqyeYHD/Iear+VSDVBxs3kH/ntXxxYLjtNGGXq7pAb2gAcD6x99q6Vhl
         +Dx6WlUBM/2h9XdClbZL005zo2BaS0WAJjninxte8R/7p86se8LRY/9ysTOL+udiuFLh
         /30wp7PRTz4SaemnKu0pt0i+JH4D4mgMR1NGD94wvVv25EaQhgq0+F79jAc2Mx5Sl5W1
         CaRrlJ7LMU1KKOsZ8TY5MTa04qZ/FWhhl1y80ADKY6fBw2JTvMQ1SeShoWvXGNc5+qmZ
         BYAwE+1u07h7sxSDYfwNx3qy0z/GD2PTncoNvuTaYWXUyITh5+zAMKBbkyoYPvUVGKBF
         ULTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKIeKQXo24Plqn/vrUMqC13toBoyyfFDjwH6RvTHlW8QuJO55ZkgGcH6zMecbSL6uoibg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcTEh4jHd+Kk4hSeQ+Umvlf6ayWq+d7npjr7pUXf669NDrUPLY
	w8yUetpzNgZGwW0HgKEcXiTOqh1C6vCnCD31LjKTFzUwjsMPJT0+gqw+/LHJIVkRHh4/gCPUxr9
	OB0P8gxtJLLJ2TetDtQkATXPlTE9BdSkkfWvB72TYEPSvgTuvvr9FE/0YIVt+Mqo=
X-Gm-Gg: ATEYQzzOttlpux5CFFEcptXlVUWH1sWajxHIqJ7HY+Sp2CSXJIEXYAFqh2T3tDCCtG1
	KTRXt9J1f2VWqbjk1bZheXKOWG/bW4+orZ5n6hkl/Gowi8f51aXCrC+hLA0uq045M/yaosLUA3R
	VYtDXF4D8CLstVGrAKgyxcmxmwPKSANpKCigbTlHqqHH0rXmUYd6R2ruH2nLbfXTvTAOPqmsC4y
	v+xwoQe9txn7LSotUh/6UuDjcSihjwhzkR59fCri8a+MolWdo9FbnEj6jWvGuhZgh4vAvpF2zGA
	hchHs3HxPjK6YDCkxyjCKKGrOXiFSHRwGR6asGIhVPYSD75u/+xdYmsObElEz+vmYmBbndKmt3J
	e5E5XjsiBvPt9J7iBRom6mX1UQEuzPwu/8bLfOWC5A610HSXkq14=
X-Received: by 2002:a17:902:f54e:b0:2ae:478f:2eb with SMTP id d9443c01a7336-2ae822f1f5cmr53494995ad.0.1772883717871;
        Sat, 07 Mar 2026 03:41:57 -0800 (PST)
X-Received: by 2002:a17:902:f54e:b0:2ae:478f:2eb with SMTP id d9443c01a7336-2ae822f1f5cmr53494825ad.0.1772883717343;
        Sat, 07 Mar 2026 03:41:57 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:41:57 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Qualcomm Sahara protocol enhancements.
Date: Sat, 07 Mar 2026 17:11:21 +0530
Message-Id: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEOrGkC/x2N0Q6CIBiFX6VxHQxQwLrqPZpzRJgs9Td+sprz3
 UNvzvad7XxnIehj8EjOh4VEPwcMMGaQxwNxnR0fnoZ7ZiK51LzghqLtbLTNFCGBg74Z/aeZJdV
 aVqo0pnCtIXk8Rd+G7y6+1pm7gAnib/+ZxdZuSsUrqQQXJ6mZFJorVVJBnwE7iJ7dbEr2Aojs9
 ba9g2FgOUi9rusfnSP4zbgAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=5313;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=iEUuY3wGzLZPYjI71MhbAplsXD6EpLcgQaZDOkmWUSw=;
 b=RUj880u9mPXD5GTS+6SFf3uYgx5efxLyyzY/IPlSOkM8aMj1QCmRl3FN7mc9O/HuO1+NeVhwc
 +H4dMSpBWp/Bq7gM/RyR41jlCsZ4cZx8Jwl+8eq7RQ/sbo+knoIKUG/
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: m-veoYkYwsFMmp7YCaoNW9--gq86zSCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX07WMgpH6vQt+
 d3OujMDzZehhjfF/0R5zsHyuQyznD7tN3L75bA3TvlFkZlc1/LGH2ohVcHJVGJkNYMhl8m/DCvh
 lB3yoW9lMYs9y+ALfN/BjjHoC/eR564+4b33p4lDeoKDZtYB/hc2Sxp/B4AXOLHZMdE7Q00c1I8
 qBcLYsREN5Ut7cJWZ+v+kImCOYKPZJeImT7PubxStsQ/uvTEiEQUB5OBkOGdB4OyEjS+Fq1u0js
 sPPHjgLGOxG7gnNmmoWQ8s+bV4d2NzG0UMFMqz5FPJ4S3G4Pwv0eHjBWJDUICT0T3rWoYgNrtTd
 HDq6OuttV+Sjy4F1gYXA3HQGmZVWwNDmYE2ZU4KIy459evHP7vdL7JLHqgWbAravpQ7qm3t2xpp
 NTdO30PD5RIsprf5fuN6jx/nLtbhLRTfK6NFYwvRcnwUaHNFIHKAVwDNs1qSyRDOYHUgl5IRloj
 3i6ofu22ZPx7nszntdQ==
X-Proofpoint-GUID: m-veoYkYwsFMmp7YCaoNW9--gq86zSCK
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69ac0f07 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lG-yCPvlEGbsawO-O7cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

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
      bus: mhi: Add QDU100 firmware image table
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
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c    |  574 ++++++++-
 {drivers/accel/qaic => include/linux}/sahara.h     |    0
 12 files changed, 1844 insertions(+), 43 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260307-sahara_protocol_new_v2-662854773cf7

Best regards,
-- 
Kishore Batta <kishore.batta@oss.qualcomm.com>

