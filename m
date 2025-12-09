Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2663628A701
	for <mhi@lists.linux.dev>; Tue,  9 Dec 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765279548; cv=none; b=FRqoY0M9IkbqvCZZQp2XiAUK+V6+5G2LyOj70C+HlWYY5iz6T+7ZVwPrhsB6ZwmSMIfd5v6DnyiWXyDQdz5nGFvxuStjPO8lLuUI5h8XAt05s1tCLAHEr9zsIahvfcaFFTJpCwTnupH8Zhf87aFVClAMKVVdD57aP7WywKprpSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765279548; c=relaxed/simple;
	bh=DsiJN+x8Fqjt+HlhEmfCrebctPNMtUSyNZcOLLpnAeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JWUArb+XQly2OVfT2XJZfOcgkr1Tj1aZXDnOjrUZJ9Bzzevm/ff+pXCuAk/jNilWc2KmoLQi/ZlcG/BpFfwWXASh6PKLAmobGsPfact+yML9QlUqLv4IpkTxI/jD5MKZdpFTZWnk4f3Mp/w3lxuZcD/PlQ5BhvVFAr56oMw/nus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed3abrwY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POGHFmwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed3abrwY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POGHFmwl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NnQM3260626
	for <mhi@lists.linux.dev>; Tue, 9 Dec 2025 11:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsBgdJ+ubxIlMlId0qH8F8
	slq+A2hSv7BDe8MHbvG64=; b=ed3abrwYdom/+eT1rno8AvMC74c5yHWsG9C/hy
	ho3/zxuCilqP6vk0IaIj4UhPnEIrbjC/EQ/HTJ+HcQRXnnBk+0533y4WYJRfTWNG
	LEJ8Pd5Pkjo8yLBT7Gg2y052xsc/ZdEGS1XnxpktY4/vgzGnqdkC/FOVvppg01gb
	5L4YO4rqqrE2KbmDwR0LCxiwtrt+UMRmCYILJ2kvgqjmLbHHuJZYh326nx3t2eJB
	UjBGQlKGe1X+l6pVQKs+HaD2QSyUN2X3FULbgFlg2+EEGbahcmQ97GzHRkAQz4tv
	6m4Yba7fjpPHgERsLoXX6jtntdM5vNB5+rFKjwHU2SqxH9AA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgqpresm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 11:25:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34385d7c4a7so3558189a91.0
        for <mhi@lists.linux.dev>; Tue, 09 Dec 2025 03:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765279545; x=1765884345; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsBgdJ+ubxIlMlId0qH8F8slq+A2hSv7BDe8MHbvG64=;
        b=POGHFmwlepDUUyB6grN3EADT1Z9YcnLqwOHos26dGO0GIxrYI6Hn0FbSqtB+G5EHV4
         7digzhqMTq3m+BbsDZi+CYb1OqfqP0NXiY3xMTlxoqLWl26c7G8StLYzrPa7RUZXO1Nk
         RsjonmqMmToJKa/9D9DeXzn44EETP5JZatzA+60HkGokpCZY0gdNP4mS0goj/gpXb0kQ
         e3ZpD/b8rjijMiA2hrLbPddFL2cfOQSDCfAAFVo5L3tLqX1SXDubmw5sXGCmCOMZXhLM
         I2qHIzCHJGY16S13zlvdPY4hochA/jKHG1B6PXsD3JuP7tshEQewWimgMIjlh7NWzDcM
         HjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765279545; x=1765884345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsBgdJ+ubxIlMlId0qH8F8slq+A2hSv7BDe8MHbvG64=;
        b=JJveyWZQkrXn0lya+868+Tkst0LKIV72OGWJv8BNnYtizo2D/8rOUBRcT+P+GVtli1
         uP5bJg9Fgsv3l7DKe4qAAsw6mg9gVW3OrnCMcyBFcvKMas7vKj6h+/zohMbqpulcJ+Cx
         2ni1O7SiDHNMlIhfAKUbnzKzCqqPCvFXQNZn/ka3xMYpXP7CPCQjTF2QzBq+Ptw9UVes
         /ENS9KECXJCBXWtFHJ6DLD7zWl3S12e83E50fsih/5sJ8fS8XQ5ZNbjarq/PK4oRpg/y
         VwGFwgzgaUCFU50z99Nri0R+3bxM8033qEomJfYHcvk5y5cZENFnzEHSqbC7vHgLbM70
         F0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8bo5FzgjLgNlKUw42WO1ts+LumTXMrHBIDyJKNF/3wrhMgzTKJBrG97lFkx2sCCoL08I=@lists.linux.dev
X-Gm-Message-State: AOJu0YywXrLI8U3k8ATDLxICavI6Nz3mGqLc9AbPNoXnLB5qHJEVtl7Z
	1NtZ0zuIFfUreh1SOpxv7g4ovFX26W38EiI9EquPsxQVxlC0tIiCbTf2OD32THmZNq/OtXlQQMv
	NSRv4AjnBJoJNBrImCvp4NQgHkfH7FpQ57RB7eu2HyfGlrcJiXcYSRLE=
X-Gm-Gg: AY/fxX71UcqnkHHwfailHuUr/xGNh8vDXNXNoULP6l4EF4qtY6JQgkuoRKpY3221QCX
	sSz0rNNiiRdbaAYzFL1DBdEKyA+yVX13nmcG2OJg9V3ODR0h0eK0DBAu/iO6pQDwSCCDLDp9ClC
	Ogy5nEkKhhDP/I7qgQCb1bhfOHte9UcHV7bmf66HNj1RyM81ntZczvvjiZxkvFf4s+T445vGjyj
	3xxRCoYQEu64O7jqpLDy0vL6MlIKebbhgh+mYH/1ifuGmJ2RLzVhWELmBh0ErozVJmHt1us9US4
	+9CxUHDrW/nYNm5XHSKkO8zVk+OjKz+OEfnQYUpNQNglprD04D/tf54hpiDRtOn23xAmJO4DXFC
	9n41HM/at0brZkmjKTSWBx42PoE5t+1YGmnJk
X-Received: by 2002:a17:90b:1f87:b0:349:7f0a:38e0 with SMTP id 98e67ed59e1d1-34a4f8bc3d6mr942781a91.17.1765279545541;
        Tue, 09 Dec 2025 03:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGczqed4JYXeBh97lxyTB5anIJMDGPxDqMP+bWLrjssFzZu758BmfhApm7fzoyy9+J7HleFog==
X-Received: by 2002:a17:90b:1f87:b0:349:7f0a:38e0 with SMTP id 98e67ed59e1d1-34a4f8bc3d6mr942765a91.17.1765279545080;
        Tue, 09 Dec 2025 03:25:45 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b9178csm2135964a91.12.2025.12.09.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:25:43 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Subject: [PATCH v6 0/2] net: mhi: Add support to enable ethernet interface
Date: Tue, 09 Dec 2025 16:55:37 +0530
Message-Id: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEHOGkC/y2MQQqAIBQFrxJ/nWCWUV0lQiKf9TcWGhJEd0+i5
 QzM3BQRGJGG4qaAxJF3n6EtC1q22a8QbDOTkkpXSvYiWSTjcZ3iV53BuZnUiqWReoatagdLuT8
 CHF/fe5ye5wW+OMAHawAAAA==
X-Change-ID: 20251209-vdev_next-20251208_eth_v6-c405aed13fed
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765279540; l=2389;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=DsiJN+x8Fqjt+HlhEmfCrebctPNMtUSyNZcOLLpnAeg=;
 b=yCEy1+3+fTCjhl2Y2Mp6zaC9Tm+MeaGfiLGbPV1B2s+Yc6xPUPOrHwQ3WONSqCqgIxIk9Lv5t
 TKTiGS9px4PC4bCbXD84RTbn8ojO9JSsFabbiY8oCUER/apsllhZMPP
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=KMhXzVFo c=1 sm=1 tr=0 ts=6938073a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QULB0W7ECN1Zqye5N6MA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: muK9atnr8C5891uIgqMXJj5PNkLBwHvj
X-Proofpoint-ORIG-GUID: muK9atnr8C5891uIgqMXJj5PNkLBwHvj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4MSBTYWx0ZWRfX8FjC2AhQjH1e
 PyErPGdvnZgqY5g+10HDaKgxvzja2zecerJTFSAY4Mwy5gPmZOJ1Vwtzl7PJGm59HDa0EMKE4bb
 NnmET1X2kFvJ09Z3gcDP2uRGnaKPOqeV+JfMDns0qO6/NZRWkj9XltxN1aSJfEFZF81XlsRw5xS
 ZXZ+V5cR+qFD108Bu9lHuQxrIwm/FZ5CsMA5lBJ+Q3bt2TeaN4kbaVwaYNSiiL5SPSc+bs601v3
 Y7DFDHIu24uukNp9PuQfbUWRd+JkPBv//230aUgkwSCuOK40vi6NuHCmDHq0aMmFjKEkde1N0eR
 do50hdjF84OM1ONiA9t5cbPyE/oxpqFMfTf//NleQfGCyMOT7dol7rtqOPOK4qeTCXgwXpeHTZl
 +tWqDlcqx1e9BMojgqC2+DyqrXU4xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090081

Add support to configure a new client as Ethernet type over MHI by
setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
interface named eth%d. This complements existing NET driver support.

Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
M-plane, NETCONF, and S-plane components.

M-plane:
Implement DU M-Plane software for non-real-time O-RAN management
between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
models. Provide capability exchange, configuration management,
performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
R004-v18.00.

Netconf:
Use NETCONF protocol for configuration operations such as fetching,
modifying, and deleting network device configurations.

S-plane:
Support frequency and time synchronization between O-DUs and O-RUs
using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
O-RAN.WG4.CUS.0-R003-v12.00.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
patchset link for V5 : https://lore.kernel.org/all/20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com/
patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/

changes to v6:
- Removed interm variable useage as per comments from Simon and Dmirty.
- Squashed gerrits 1 and 2 in single gerrit.
- Added more description for M-plane, Netconf and S-plane.

changes to v5:
- change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
- Renamed to patch v5 as per comments from Manivannan
- Restored to original name as per comments from Jakub
- Renamed the ethernet interfce to eth%d as per Jakub
---

---
Vivek Pernamitta (2):
      net: mhi: Enable Ethernet interface support
      bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100

 drivers/bus/mhi/host/pci_generic.c |  8 ++++
 drivers/net/mhi_net.c              | 75 +++++++++++++++++++++++++++++++-------
 2 files changed, 70 insertions(+), 13 deletions(-)
---
base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
change-id: 20251209-vdev_next-20251208_eth_v6-c405aed13fed

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>

