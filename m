Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59032AAC6
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444052; cv=none; b=LM/3vho7KBRu1JZGCwSIhNkfENSsG9VMz17OdSwTg+lMOvVSCfefX01O71/mTf69vWobQozOKPtB8CGTXie6TQTAfwGDf02Itxglm9zQTDWZOEyAk/+TVNBL8w+9nn/r8qaZsjR0hgZshR5MftBVT2nqEo6lOMPR2sNBLjaw7XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444052; c=relaxed/simple;
	bh=+1xqvOBtTjhR467f4KD24eV71y2gTMox1bK7uo2F8/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZLnSUrykPz6KXUIpM07sEAMGlkprTRzcVleExD6R1jm3Dkf8a8kaw5V9KwZKXAc7/IE02bnwUmTK/QuDHFOZYfqnDxSa134wFaIdeg+vg/hhU1sRAcxpClV/EFw/z0bPa/RyamoNkCxLUh7Hhdo+I6M13liFxCnEfWNLOgbkp/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/ENIXqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tvb0iho0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/ENIXqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tvb0iho0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8RZP42765100
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iuCxH5D+n2gNFhyOX5Y2of
	7w5Zcuoea+gH2Rlo6K2Go=; b=l/ENIXqkelqIqqwXddP6me3HQDLOS3HeQ6XeQX
	LwNoPTpsDBSv5zrl2ik0fG6gITJ4e+6ClFp+6iaJWWX4u6U4ii/68Z2rW9B7WZ22
	DFV/3IE1SXnSCUPZr3wiPDyH6bTDoVwEP7BjuW9mvpDpX8eLVcQ0ea/75QxDWDyn
	y19PwfJPx3RnVZvQxlxqFVCmDKC8VyrwzrytSsASaY+XKk7VtX8m6VjM1/lLT9rp
	c0pRLs7bh7cboj4U11RSyJOAIzkKgsD+x5KmXnN3deEvJkr7+5ZiNC8/L+R/nLlZ
	Uksb8TOeK7tqFoBFRRjmEs6rgmX5aNIiu3Jo+2/oKV+ddFbg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7veah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 22 May 2026 10:00:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so9236462b3a.0
        for <mhi@lists.linux.dev>; Fri, 22 May 2026 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444049; x=1780048849; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=;
        b=Tvb0iho0B1tJ2UdVUdrE3z3P1Stbv2hisOikJ8NtHlpN4PQ7iPj6Ehm5kkDbwmZzms
         ehrB3VdCu1VYM8iDBg1YOcvXD3a6Ti8K9Sb2c4tAzZUeSpSobu9rtuYubAY+Uk1pIlpl
         X1b2shbvjqaXoAicSJm25KD25wB4tq8buHl8IR0wKEzmxt0byoUx2QNEgr8icVq5bZrV
         Gre3vmm3YH5S0F9RVghmfwOBssmtojpa4X/QMVV1diAKix0deCMw8uGQcfmBqSvo86Yr
         JfNBM2jBudezZM4zHPjkM9Gx0pOFkHNL5L2KhYgECSv+tyiWOS2t7BjUhfaZGy/d0G+1
         0YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444049; x=1780048849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuCxH5D+n2gNFhyOX5Y2of7w5Zcuoea+gH2Rlo6K2Go=;
        b=MM7copI12E095jmUtvXbuDd5Hr0p8bVq1q8i1xOzyjH0ecb2g240mcttAybVH4c4q8
         Sqn69Y+/1d0hbSookKgwoTy5AI0KIbAcT2sGqiNkUe5m143J0iQTF38jtlnr6aMRWXJb
         INRRPqneoVcPx6jAv3Z1YpV3hwP4ixf1pzDzMc5S5wPmYAhXAQKNx9z3PTf1cr1GRCel
         DP+AIHu7CJuuyiHwJCTsGSoSh6QkM2JcjNxhjakuzdVEKKznENYh8MAqawI4ADcyldfw
         QkxDZdQil1zzvYvdqvtRWNtGBstxJZBfhuG5NZkCnCBs4qUG8snc2W3boi7lmJUmScRx
         TgBg==
X-Gm-Message-State: AOJu0YxKUW1HKxCSiZAoZhrq7MmKLGMaYuTOB8nKOhYUoIwNOtgZcKxA
	zbyx9r+4y05r+moXFB228hM7Dqll4gZGSSftDOoggM9XXg20o7P6Hx95LvFxqXdXfFZJ74dYK/n
	oGYX3YNRwd1Rbx+4fDt4Q0oDQWr0nCGHi4GuECWyM3re9nwVP1kKHrjs=
X-Gm-Gg: Acq92OEAIUBeg8B2Esy1Dx5lBXGTnSt/NzhS4hqPlDavzbqcoAh71tO/B8yyF3s/Q+f
	cQOb0G8Sd7HxEOXqRVn48Ay0yt8qiBBJNwpgrzzVxV7pclC4PF4p1aLQJy3IGqXlNxMD7Qb9rUe
	pP66KIjvvdr+sU/oa82CPmx4mr8JWPr9Pcb+6hTz+d2+RFdl82+IjMSWoz1P3rrKSlxa6yzLt1N
	Y5ubwlQkJMEFYMuBcA1YOJpHmHD+IVnsV5YvdftaVc6/LCc2EJgt9IAFlD54bgoTEcbWZRUlwep
	MizPbatTIHOuCoTNT+n4n7TDCMVJtdRL/IwFBMA2Hkaa2QM25idAJGZ6xPMIHGtARg+w6/UiOds
	G07MpqgTKYPKFQ6iezeAXrYyQwk9CqnzGSo6tuxV4U5u7A1vj7UO2WNM7
X-Received: by 2002:a05:6a00:3e01:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8415f5dcf42mr2983256b3a.30.1779444048706;
        Fri, 22 May 2026 03:00:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e01:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8415f5dcf42mr2983208b3a.30.1779444048116;
        Fri, 22 May 2026 03:00:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm1516641b3a.3.2026.05.22.03.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 0/6] bus: mhi: Fix broken runtime PM design
Date: Fri, 22 May 2026 15:30:31 +0530
Message-Id: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD8pEGoC/13MQQ7CIBCF4as0s5YGUFJx5T1MY5BOZRKBCm2ja
 Xp3se7cTPJP8r4FMibCDKdqgYQzZYqhhNxVYJ0Jd2TUlQbJpRJCHpl3dE1TGMnj4FnfGOyUtFa
 pBspmSNjTa/MubWlHeYzpvfGz+H5/kuTiT5oF46w3N33Ya21No84x5/o5mYeN3tflQLuu6wcpq
 3SisQAAAA==
X-Change-ID: 20251128-mhi_runtimepm-f7aed52cc557
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444039; l=3236;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+1xqvOBtTjhR467f4KD24eV71y2gTMox1bK7uo2F8/c=;
 b=iacSYbanGsCgJO+FPf6WYlX9gd+HwgLu3fqlbeWGrFLEf8k83HR9i9JLXwUGXl1VNyUq9NpK0
 IN5Dw8Qus9yCJf1P0rKQA7/BzSTy5rzWWcg3vO/q5CYIoLB3Wz41hRb
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a102951 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KH93JrovTcJc50lypuwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: R7kSExkLuxwRT5gtkmSQ0S0boPZqowTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX5UHk9aPOTKTb
 fNlHMyz0g1RF6i2nEgajQfN8/1hVpqrdzb1bFgjx+YgAMLaTv01ZX+xOwscuWsa98LT/a3H/OQS
 PUTKqEnKMAwZWP/7D7odzLuf2SWoFaLem9thc8TEJ58/Tdmv/Q8FVsc4P8euGs1GA9pAU9vg1fl
 5FQmMAVwNPKLXCXmvxn/r0WWnSlLuJcNhixeSQzl8X+oSSeWQMswq3i/0O22Mm1S7cK9gwakUmd
 ljDXWFARV8dLWP6FpaN3tJvXyqWh+YhZPDsNWTvcNyRWbqwB7vvmnHWpuiUc4uJVc0SlK3Uaqtd
 utT+fB2NcuwTfhRXohR2+/aPAwg7RfCmb1Z3afhFSyHxHUkwOeA28SZlpFIS2U4bxyPUTm5jSnz
 QmtDpey5uv4uD2jOzf1c8OCUY4lglLzpbyh/r1w84OWOLzpeJS89Y9TnMUPXVnwDmn7jytIXGAz
 uTMKJQwZUwGlJNkNgSg==
X-Proofpoint-ORIG-GUID: R7kSExkLuxwRT5gtkmSQ0S0boPZqowTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

NOTE: As we have dependecies with other subsystems, Mani can you take
these series through MHI tree if other maintainers give a ack for this
series. To all the maintainers please ack to this series after reviewing
so that Mani can take this through MHI branch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Rewrite commit messages (Bjorn Andersson)
- Remove autosuspend and use normal runtime get/put API's as there is
  already autosuspend in controller driver which waits significant time.
- Add pm_runtime_get()/get_sync() error handling.
- Add rumtime pm for wwan and qrtr.
- Link to v1: https://lore.kernel.org/r/20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com

---
Krishna Chaitanya Chundru (6):
      bus: mhi: Replace controller runtime_get/put callbacks with direct PM runtime APIs
      bus: mhi: Drop controller runtime PM callback indirection
      net: mhi_net: Hold runtime PM during active data path operations
      net: qrtr: Hold runtime PM during active data path operations
      net: wwan: Hold runtime PM during active data path operations
      bus: mhi: host: Fix runtime PM ownership between clients and controller

 drivers/accel/qaic/mhi_controller.c   | 11 -------
 drivers/bus/mhi/host/init.c           |  4 ++-
 drivers/bus/mhi/host/internal.h       |  7 ++--
 drivers/bus/mhi/host/main.c           | 21 ++----------
 drivers/bus/mhi/host/pci_generic.c    | 24 ++------------
 drivers/bus/mhi/host/pm.c             | 18 +++++------
 drivers/net/mhi_net.c                 | 39 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -------
 drivers/net/wwan/mhi_wwan_ctrl.c      | 60 ++++++++++++++++++++++++++++++++++-
 drivers/net/wwan/mhi_wwan_mbim.c      | 44 ++++++++++++++++++++++++-
 include/linux/mhi.h                   |  4 ---
 net/qrtr/mhi.c                        | 57 +++++++++++++++++++++++++++++++--
 13 files changed, 216 insertions(+), 94 deletions(-)
---
base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
change-id: 20251128-mhi_runtimepm-f7aed52cc557

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

