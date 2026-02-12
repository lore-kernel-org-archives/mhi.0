Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08DA329E5E
	for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894036; cv=none; b=HjszygFFS9162drWKfO1bCPASLnESeTIDDmirxkHVOxYsrGwPe8pYYJ5U3hQP+98GZ1fVLZYuVobPcj+FD8ZApngHr/fuIYsV93Ljs4mgaH8tA5GQaL0M9EpQfmNCB4KNubbi8CidAQbB74bAXPI3LePPNiZzTdiahifEN0uWoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894036; c=relaxed/simple;
	bh=fR/bL8DW8w7719SXkjd06zJ2rT/UFwnxQu3aQzrS/E4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VvS1LPgwhNUgFPyE/dBVG9z1vxi8WNH80rBt5ZZMv2PMRrkUz4acOlsbtb94IeGowX9Th6yf0n3TOuGMiXoQbwXHrp03YPwJmZwD1TyO2itUM3jKKNSZOLKmoiEhPVHCNlVPGVsqMJzYn1+mfZKHWATJ9wmr0JYlEzTVOOIUTk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0AmMNPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gh/SCP5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0AmMNPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gh/SCP5R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAoupD2545228
	for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 11:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IT0E+i/X/7kLm33FOBTs5Y
	3poQRTNZiMl1emlGeTKc0=; b=E0AmMNPRPUXpFgNh+qjrCYF+mXyipcE5A3vIuU
	Rg/cr9y/nnzle7sI2vOdpBq8Nm7Qm6A5ucLV/BW70OtK3EX4ORP2DBvpLBIO+UYO
	WHN5x+teVDPCreEWl5MzehE0pOTDAmV4QIQ//kVsfKMYdqLMRmQqCqOj3gZUFP51
	1vr+tcaXBpFh2ZisLdp3KsrcsrsmY6DPJXr9p5JjuKZbqTSxUAHH9ugN/GMPflzh
	nHqUMEHPkaegMxaDUf6zscwJs+sY6a6XOOgYxlUfly0zoWQyYymn0vD/ZgCjwhg3
	2TeDnMLoZVzDWCYTuvWdPOT1p4fbQvvYWaNr0iEN1wd+h2lQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpk0kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 11:00:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso14446460a91.0
        for <mhi@lists.linux.dev>; Thu, 12 Feb 2026 03:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770894032; x=1771498832; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IT0E+i/X/7kLm33FOBTs5Y3poQRTNZiMl1emlGeTKc0=;
        b=gh/SCP5R+LMw88f0rLidhT88xXgH+FzIAWM6jRr7dp2XMzpnRRngyybfTzzUjl0x3t
         Gg+m5kRe5rC1cD8UDQzLdmlC3vdCqcpfKFohEAT9UXVVTreT5+CrqoF+7Cu0fiwudSq8
         s8zqCgnWNUKC2CNiXibZtDEtg/84xBboX+fdZHoxjIAv8ru+AOWRCCs+vxt9kh8JBdqf
         zADj8HaUOhZfSWhyd9nFI+DMwOt/9hCNDzJVopGiasdG7NHBAT4owiDOBlGCYyh2G2hL
         44gkgC5At3hk5wP4C4FRKFTW5fYOavl1zdl7pqzDw6ldHD2B3714zg7QZ7r3/9KrwU/7
         QX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894032; x=1771498832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IT0E+i/X/7kLm33FOBTs5Y3poQRTNZiMl1emlGeTKc0=;
        b=tHpXjG6eDZVn1YnYUpuv2jZNivhcNzMqO/gFzLhvh8geL6CrGuMMG5TngcBswFj/pp
         R2qg6Rnj2H/thJiXKna0bUBp98pBgEWitOuSqFwCPkekrmMLiHBnlxRR/PXhnQy5I9bv
         QoExTVWzRbyfFD0qTLntai6XcQLCwBDxJAz0IZwL01PFpHEbtUFDSyxNpbV3yBHQ54RI
         csN7hzYfQNZ/Dgmw3rMylJegWpnDRq7TXYEKUmyjps4Jt7BYWDWmhTpaU/1nJrwtNcYE
         iPSUG3YizC906x7e6lQ3o5LEA0RpNEdQfR3+vj7UIYziLsntq0I+QpHBXAE3EjIp5RJ7
         jWEA==
X-Forwarded-Encrypted: i=1; AJvYcCVyJiL8NPle+RshoKOp9bxezibEdxcUf7kHUNZ7zsMNxV+SJoO3ZBNd+TdEMxj+qU+uKyg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI8oJ4A5T9uB9qzTHtqHlUVPrXq5BGRQvNF7ShLC4hZUEBtLkB
	vI3zc6pSgJUX4PZ9G0iA0THn+Sef06izVn8F995gRwaSltEuLvjrYFkV/pKXqDg/z8nuAT0JZhb
	PxcYL22VikaGXYFGp4nkKce8qv2KkB4wiQZPDAZzQvNiQAm8xmRj7Bj4=
X-Gm-Gg: AZuq6aLeKtDtXF5WVknwFTE0y+vS9CNqoq9StrXI4dnw4VuqGNrMjf+J2rmu+iGfaj8
	898dhantU1VC+TcV6od0gjSDSy4hTGYVgK5MZ5LXYM4nYmW5zdrqt8sTT4RNmm1fAGRSHAl3Gj4
	qC1L48Oqr/CiUlSNOGb5sUxWJDirdfHz4CUbnhQef/Q5H4NLNQYlrY4F0SCVU4Q8ZUOagfwUFF6
	avkdCOjSJTvz42h9N5IfsintwCj6g+GWPFh8lr6ZKcF/VslDavO7DRqynFHS99TCZjn1FbQFLrw
	NyROH6W7GRhaXf25o6ZujFkrINHfXT5jFCZgwWDhjE1k57MettW32IIunUUQvPN4Qu4S2nkLGjJ
	ZKAxH2z9MbJQ/RLEXWLnRnNeRAd2lwU+VwF99AXCjf7OImTCT
X-Received: by 2002:a17:90b:3b46:b0:356:41c2:896f with SMTP id 98e67ed59e1d1-3568f2cc5e5mr2206210a91.7.1770894030795;
        Thu, 12 Feb 2026 03:00:30 -0800 (PST)
X-Received: by 2002:a17:90b:3b46:b0:356:41c2:896f with SMTP id 98e67ed59e1d1-3568f2cc5e5mr2206090a91.7.1770894028604;
        Thu, 12 Feb 2026 03:00:28 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd8e6sm4708348b3a.14.2026.02.12.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:00:27 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta <vpernami@qti.qualcomm.com>
Subject: [PATCH v8 0/2] net: mhi: Add support to enable ethernet interface
Date: Thu, 12 Feb 2026 16:30:21 +0530
Message-Id: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMWyjWkC/y2MXQqAIBAGrxL7nJAbhXSViOjnq/bFQkUC6e5J9
 DgDM4k8nMBTVyRyiOLltBlMWdByTHaHkjUzccVtxZoVwjHGFXG0uIP6tVbzYmqwabe5Ycrx5bD
 J/Y374Xlew3fcWWgAAAA=
X-Change-ID: 20260212-eth_vdev_next-20260211-bc83e286fb52
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770894024; l=5705;
 i=vpernami@qti.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=fR/bL8DW8w7719SXkjd06zJ2rT/UFwnxQu3aQzrS/E4=;
 b=gURkiOMf8DdO4v1fPTIncFv1RdaIC9dwnnrfu+Vf5zRIDNfL0aVdToooSu5BOM+4Ssc5tw36r
 eK34ORtv7jXAAPeHp3GuKaHWzmFERoHJytT6uoLc8uXZ0QGv4t3H6a4
X-Developer-Key: i=vpernami@qti.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698db2d1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8SqqAd8AVnWKc5cE22EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: a9Vy76cv7A3wB-Yo3PdwBqIQollgMHqd
X-Proofpoint-ORIG-GUID: a9Vy76cv7A3wB-Yo3PdwBqIQollgMHqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4MSBTYWx0ZWRfX4Xsvd2CLwC2l
 dVJeTjm8mac0xQcSNheF991FBKrUUW3dsO08aY/eiO1F5GGk9mVCVZMGQQAjFNd7cEeLL63MgdT
 cBMVf4qD8h8HqUTgT7J5iBvS9PFCZfQJ3WaBNjDGz0uyklcKGbS3AgPDM9YpaWONMfNVPNiT6zD
 Jr9Vos1czjOUpqO7XbaJoWwZG2MmnZu3vZbt+dOEIfPZTYbQdV8orAip4KOhh2z0+HsFlkpoAuh
 QJ4X3iasHEfqskmrSqismAl5yVF/+PN9WfDHzEGXzsLJ7qI/I+M7JQrBOSj2t//GMpQzqV/fIYw
 0Z2/kzY1l/160GwYhoCsHJBCIikjJcp+5Px0f/93/d3uDLm4fQBADus1RUU9ixHQDrr71efA5Vz
 sQH04CGTU0NGyVxedusan1OvHHyorzYnY6nq1xvFlNq7DhPR2o66yhvDQMtRFdWdAMBA5gd+3Q1
 p5dKxdyOUVib/0L8hHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120081

Add support to configure a new client as Ethernet type over MHI
by setting "mhi_device_info.ethernet_if = true". Create a new
Ethernet interface named eth%d. This complements existing NET
driver support.

Enable IP_SW1 (ch:48/49), IP_ETH0 (ch:50,51) and IP_ETH1 (ch:52,
53) channels over MHI for M-plane, NETCONF and S-plane interface
for QDU100.

M-plane:
Implement DU M-Plane software for non-real-time O-RAN
management between O-DU and O-RU using NETCONF/YANG and
O-RAN WG4 M-Plane YANG models. Provide capability exchange,
configuration management, performance monitoring, and fault
management per O-RAN.WG4.TS.MP.0-R004-v18.00.
YANG model based interface aligned with O-RAN WG4 M-Plane
specifications over TCP between the OAM application on the
host and the DU M-Plane software running on the X100 platform.

Netconf:
Use NETCONF protocol for configuration operations such as
fetching, modifying, and deleting network device
configurations.
This interface is used for IETF Netconf communication,
enabling a Netconf server on the ORU to interact with a
Netconf client running on the host.

S-plane:
Support frequency and time synchronization between O-DUs and
O-RUs using Synchronous Ethernet and IEEE 1588. Assume PTP
transport over L2 Ethernet (ITU-T G.8275.1) for full timing
support; allow PTP over UDP/IP (ITU-T G.8275.2) with reduced
reliability, as per ORAN spec O-RAN.WG4.CUS.0-R003-v12.00.
To support accurate phase and time synchronization between
the host (L2) and device (L1-High), the system must exchange
PTP messages as raw Layer-2 Ethernet frames, because the
ITU-T G.8275.1 profile operates strictly over Ethernet
multicast and not over IP networks. This means the device’s
PTP stack can only send and receive PTP Announce, Sync,
Follow-Up, and Delay messages in native Ethernet format, not
as IPv4/IPv6 packets. However, the host and device communicate
only through MHI/PCIe, which provides no native Ethernet
interface. Therefore, the system must implement a virtual
Ethernet interface over MHI on both sides. This virtual
Layer-2 link enables true Ethernet-frame transport, ensuring
the device’s PTP implementation remains fully compliant with
the G.8275.1 Ethernet-based timing model.

The actual link between the device (QDU100) and the host is
PCIe/MHI. The device has the Ethernet interface and is exposed
as the MHI channel to the host. So this patch creates the
Ethernet interface on the host based on the 'IP_ETH' channel
so that the host can use this interface for exchanging the
NETCONF packets.

The patch primarily addresses host-to-DU(QDU100) communication.
However, the NETCONF/M-Plane packets originating from the host
will eventually be transmitted from the DU to the RU over the
fronthaul, which uses Ethernet. For additional details on this
architecture and data flow, refer to the O-RAN Management
Plane Specification:

O-RAN.WG4.MP.0-v07.00
O-RAN Alliance Working Group 4 – Management Plane
Specification
Chapter 4: O-RU to O-DU Interface Management

MHI_CHANNEL_CONFIG defines channel attributes for the host
controller to set up channel rings. These entries are part of
the MHI controller’s configuration so that client drivers, such
as the MHI network driver, can attach to them. Each interface is
mapped to an MHI channel (for example, eth0 → IP_ETH0 channels
50/51), which is why this configuration resides in the bus code.

Allocate MHI netdev's using NET_NAME_ENUM to reflect kernel-enumerated
naming. This updates the reported name_assign_type for MHI net
interfaces created by this driver, aligning naming semantics across
existing and new devices. No functional or interface naming changes
are introduced.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
patchset link for V7 : https://lore.kernel.org/all/20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com/
patchset link for V6 : https://lore.kernel.org/all/20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com/
patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/

changes to v8:
- Removed skb_copy_to_linear_data call as it is not needed, updated
  as per Loic Poulain and Paolo Abeni.
- Removed ethernet_if member in struct mhi_net_dev instead used
  !!ndev->header_ops check for ethernet protocol as per paolo Abeni.
- Updated more infromation in commit text for change from
  NET_NAME_PREDICTABLE to NET_NAME_ENUM.

changes to v7:
- Updated to NET_NAME_ENUM while allocating netdev as per Andrew
- Updated more information as per comments from Jakub and Mani

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

 drivers/bus/mhi/host/pci_generic.c |  8 +++++
 drivers/net/mhi_net.c              | 67 +++++++++++++++++++++++++++++++-------
 2 files changed, 64 insertions(+), 11 deletions(-)
---
base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
change-id: 20260212-eth_vdev_next-20260211-bc83e286fb52

Best regards,
-- 
Vivek Pernamitta <vpernami@qti.qualcomm.com>

