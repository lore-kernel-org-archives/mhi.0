Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C61DFE22
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440467; cv=none; b=Q0CHRqRnO2KDKpqoH8KoPXrlLUxonWwg5bFCy74vpNqvA5qUjo30mp2lZZk4Gm+FUrN4wgxKvYrMl8QsTOITlzdlj7wW5pS6ICws1kuvtLhlELbjoqdKQxYjForpdADeGvBgHBc8W8Dd5+795oLHKgThBIxa6uSrXjEOIeFZx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440467; c=relaxed/simple;
	bh=DzUkoaCRQrd8kzQjqI9+WRCwNjkdq7WIcS0d4IrkeJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YG/Rj4OtleHY/PdeHnf9aBE1eakR4R2twNpEw5vKAJqeY0LX6lCNhznnTjrI0CxB8TH4jNeu5t+XgLXYD9rvLDoY2gGdTfpC8WTCS47McyKb65e/qFWTnzt+X/rw4YD1VUs7afPiNVoWa3O7gHcALqeNTDMpcZae3+aT+NPdGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kf1TF42W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIoulOXK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kf1TF42W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIoulOXK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALVnkx4064593
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VGTar1izj8fY00PeUl0xnU
	XG+q987NKaQmzFHHieSFE=; b=kf1TF42WLr8Pa1KsbYkA4xjNnisiXWMZIZ+7tW
	YPbp1aA4ziq/x8YxF8t56mafHuDIyvkmMuSgJvhPxeujkeR71UpIqH7tn0Si1YL/
	kn2HNrAG94BwBM+uCZSbZDnXVaCBWe9PGMUVQRZROsDmRCNiTCV9kdNfKmiThmGm
	JVqB7VuztaaklgqyFSEKhN3ERxi2VrVOjJ1HHljsMNI9XAKqZpeV78CEPVrjt9n2
	3/maJwKXodRPncmUaDimsyQKaPtbV32dh9gNcEN4ffRRboSoS4cyWLiN3RXkIdx+
	vNSJuFFkv4GH+3DkJwECsowwe9fW409ssm9z2s50+mpruvlg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayguqhg2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:07:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so1175759b3a.2
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440462; x=1766045262; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGTar1izj8fY00PeUl0xnUXG+q987NKaQmzFHHieSFE=;
        b=NIoulOXKi4ae4+y/quPfnTS2udPEA/SESiNIGO6oerrnqOMi2WzEzg8YJ2F8HYthND
         YyvQ1ASDCncaEQWqMiE6/Rdoa30DQJ98BdV5NjZvPkRKQ97ak8e0eHOCqS4khsXKv5N9
         bMWmZiOSeRd+Z/uK81Deo1vzWRLykMqRBYmnvT+kENnj7+pgzgwXY3xKaohfFIX0kZ67
         f8yTqfjq72diRZbik8QR1WzOa8L1RbpgYrB4r1f/9UkluSAfoBqT2dt2xYmxDIZJv81A
         hvTJjpAh+8FXdSWQjCEx8w/WIN46UvOTjZ+sFz6y625MiRHZlPqdawjycnqPlYRZCnl5
         lg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440462; x=1766045262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGTar1izj8fY00PeUl0xnUXG+q987NKaQmzFHHieSFE=;
        b=jiPtB9E0yd9vu2L9GMnIEAatrHFnoJZfboLJCL5nXp2UE3WBHrhsQntpvFghLCaxTr
         JDU24lLUwj6zDHPKKf4R8CsD7Jmb8gOuWzvKKCCBHJwBz/ROMX0H2lIv/AnOpFu/lPsF
         AOSt6tzQgPRNvWYbbNmDMlaPX26xM4UFz5FQeqTkdcEabFGYxYl67oGNej+dZKOYpM5E
         Ewtj23+u95R7AYjrFwQzF9+zrPbEFa9L3UWYkgz+gXiZo+pjK6ITjNpv4poYkFu6HTAv
         unxzsMjLc0RCayaHa7QPETNsBnZriFkb2mFgMiBuCs2dn+GhRg00ceYy7LSQH4SPS78S
         xwkw==
X-Gm-Message-State: AOJu0Ywr5uVH14BpGIghP1u19amUHUppYiu1IqRyEs3xWKaYlL165T+u
	nfMPNdtcBr9s0AJX3uPow4G6V6kmTyKHfStiErUQN/LIcWpqG0OZJNb6ZiIzEGS4AOSw+YCn7/0
	CBQqZJniKJ7l40Rk1sZYDvorCdm9Z7xfpgIfGsM765WHFsS43p7XGLgI=
X-Gm-Gg: AY/fxX7/Cz/rBSCB4qPQfOr2dRDRoMyeRqqFwXm7HsNtzMaab8VEh+nrmu45UbzcCRZ
	tPz4a6E8P0+tFa7jIjRhX354YMVl8IiXunQHscNlg7oC26FNsG1dwcYSdzvWiLlG6EBxqmpXud+
	LccFVlZE8kRvHvg/7dTUF+02VqsGYuuC3wHNJwgPLocFtVVDDsjhR3jy8+moypFXRJ4zeFsU3ne
	a9ac62nG8kEya99ic+PX+yosWKfqQ4jnHWCnB8lm+Orfxnddrv4j7NHD1l1gkztIJids05do4UO
	WXQOUiXPTSozAtPYdela3lulU2DWEBUB2Cw/r772oXFzd205nTbnRxMbNs23fou0O/RIaY9NFxL
	vixrbIjoN9dsmeVJBYfacp921XNzSvMOM4Q==
X-Received: by 2002:a05:6a00:17a3:b0:7e8:43f5:bd0f with SMTP id d2e1a72fcca58-7f22f71609amr5676709b3a.36.1765440461617;
        Thu, 11 Dec 2025 00:07:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIseC4kxMi6GgqhPQpVCfbKl1ZmOrjAgsLnUg3i5shyad7AbU3UyI5CsdPGZTDkw+VryeapQ==
X-Received: by 2002:a05:6a00:17a3:b0:7e8:43f5:bd0f with SMTP id d2e1a72fcca58-7f22f71609amr5676679b3a.36.1765440461108;
        Thu, 11 Dec 2025 00:07:41 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:40 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Subject: [PATCH 00/11] char: qcom_csm_dp: Add data path driver for QDU100
 device
Date: Thu, 11 Dec 2025 13:37:32 +0530
Message-Id: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMV7OmkC/1WN4QqCMBRGX2Xc3w22K5vlq4SIm9e8QWbblEB89
 1YG0c8D33fOCpECU4RKrBBo4cj3MYM+CPBDO15IcpcZUKHRqLWMvLTNbeCmm1BiUXqFiKVtEfJ
 lCtTz86M71zvH2V3Jp7fjuwj0mHMn7bNfphL/EUqDpP7ksFDGHa2pFgv1tr0AAsBQQbMAAAA=
X-Change-ID: 20251211-siva_mhi_dp2-237c022276a2
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX/joy2ZdpqD+v
 yKWZLgYkZiQVP7qktN7oYynFpFXcqWXiQGgLquiPexMosAbM/LgtuOfSl/1raDOgXEktTz87c11
 iaKzK2us6w6XcG9DmKjzUYUv0ILOxRn+hAdcQHjZ4aABr+vnr9NbXLAX9O5i1/r94jQ3g8eUW1I
 T2z9vzWcegfiLmA0+/JSOyew0nwvmLw6gp8AUZyEpZsqCKL8HZ/WzYH6Q68CRdx5paj0wyHbGZ3
 OU0p2bSkEcbvNL5XqlkvAKd1Dx8BMupNOl9caMGxWmOfnPiVpwQWZO+sIOLURRvqUwTz+PndQtN
 a+IVxvvK2Qf8c/psDmytkALoj1R+WBeMEO5U44W8K5Fe/x0zbWhQRudsXwVIh9iCc7kiYIT6QJ5
 Tcs+18N1ve8qpDb40V0IYc/eUkZofA==
X-Authority-Analysis: v=2.4 cv=deGNHHXe c=1 sm=1 tr=0 ts=693a7bce cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Tkdv6tb7jgSxGDo1kvcA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: b8eoR-cCX-KfXzMrbqEC_nS4yqcip4WL
X-Proofpoint-ORIG-GUID: b8eoR-cCX-KfXzMrbqEC_nS4yqcip4WL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

This series introduces a character device driver for the Qualcomm
Cell Site Modem (CSM) Data Path (DP) interface to support the
QDU100 5G distributed unit in cellular base station deployments

The driver enables high-performance communication between an x86
Layer 2 host and the Qualcomm Distributed Unit (QDU100) by
transmitting and receiving FAPI packets over PCIe using the Modem
Host Interface (MHI). The design targets low-latency, high-rate
data movement suitable for real-time 5G workloads.

Key features
------------
 - Provide a character-based interface to userspace and register as
   an MHI client.
 - Implement zero-copy using shared rings and memory pools to avoid
   data copies between user and kernel space, reducing latency and
   increasing throughput.
 - Expose ioctls for memory pool management and packet transmission.
 - Support two DMA channels (control and data) with system
   configuration ensuring correct channel assignment.
 - Add SR-IOV support so QDU100 can present multiple virtual PCIe
   functions to the host, scaling to up to 12 devices with up to 4
   virtual functions per device.

Userspace API(dp-lib)
-------------
The character device exposes ioctls to:
 - create and manage memory pools and shared rings
 - enqueue and dequeue packet buffers for TX/RX
 - configure control vs data channel usage
dp-lib: https://github.com/qualcomm/dp-lib

MHI
-------
Add support to read MHI capabilities. Initial post of MHI
capabilities is referenced here:
https://lore.kernel.org/all/202508181647.7mZJVOr6-lkp@intel.com/

Add data path channels and event rings for QDU100 VFs. Disable
IRQ moderation for hardware channels to improve latency.

IP_HW1: Control configuration procedures over the L1 FAPI P5
interface include initialization, termination, restart, reset,
and error notification. These procedures transition the PHY
layer through IDLE, CONFIGURED, and RUNNING states.

IP_HW2: Data path configuration procedures control DL and UL
frame structures and transfer subframe data between L2/L3
software and PHY. Supported procedures include subframe message
transmission, SFN/SF synchronization, and various transport
channel operations.

Add support for queuing multiple DMA buffers. Optimize MHI
clients by allowing them to queue multiple DMA buffers for a
given transfer without ringing the channel doorbell for every
queue. This avoids unnecessary link access. Introduce the
exported API mhi_queue_n_dma to pass an array of MHI buffers and
MHI flags.

Add support for mhi_poll API. New hardware channel clients use
mhi_poll() to manage their own completion events instead of
relying on the MHI core driver for notifications. Also support
both DL and UL channels in mhi_poll.

Add overflow disable flag for QDU100 hardware channels. When the
client transfers a large packet, the host may set overflow
events if the packet size exceeds the transfer ring element
size. This flag disables overflow events.

Add MHI callback support for channel error notifications. This
allows the client driver to take further action if there is any
issue on the device side.

Introduce a new API to retrieve the length of a transfer ring.
This API allows clients to query the ring length.

Read the MHI capability for MAX TRB length if supported by the
device. Use this information to send MHI data with a higher TRB
length as allowed by the device.

Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Change depends on:
https://lore.kernel.org/all/20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com/

---
Sivareddy Surasani (1):
      char: qcom_csm_dp: Add data path driver for QDU100 device

Vivek Pernamitta (10):
      bus: mhi: host: Add support to read MHI capabilities
      bus: mhi: pci_generic: Add Data plane channels for QDU100 VF's
      bus: mhi: host: Add support for queuing multiple DMA buffers
      Revert "bus: mhi: host: Remove mhi_poll() API"
      bus: mhi: host: Add support for both DL and Ul chan for poll
      bus: mhi: host: pci: Add overflow disable flag for QDU100 H/W channels
      bus: mhi: host: core: Add overflow disable flag
      bus: mhi: MHI CB support for Channel error notification
      bus: mhi: host: Get total descriptor count
      drivers: bus: mhi: host: Add support for MHI MAX TRB capability

 Documentation/misc-devices/qcom_csm_dp.rst     |  138 +++
 drivers/bus/mhi/common.h                       |   26 +-
 drivers/bus/mhi/host/init.c                    |   56 ++
 drivers/bus/mhi/host/internal.h                |    9 +
 drivers/bus/mhi/host/main.c                    |  270 +++++-
 drivers/bus/mhi/host/pci_generic.c             |   59 ++
 drivers/char/Kconfig                           |    2 +
 drivers/char/Makefile                          |    1 +
 drivers/char/qcom_csm_dp/Kconfig               |    9 +
 drivers/char/qcom_csm_dp/Makefile              |    5 +
 drivers/char/qcom_csm_dp/qcom_csm_dp.h         |  173 ++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_cdev.c    |  941 +++++++++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_core.c    |  571 +++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_debugfs.c |  993 ++++++++++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mem.c     | 1078 ++++++++++++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mem.h     |  292 +++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.c     |  651 ++++++++++++++
 drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.h     |   81 ++
 include/linux/mhi.h                            |   42 +
 include/uapi/linux/qcom_csm_dp_ioctl.h         |  306 +++++++
 20 files changed, 5674 insertions(+), 29 deletions(-)
---
base-commit: e3b1905d4f5cc4eb39fa7b9fac6b6db3ab1a89e2
change-id: 20251211-siva_mhi_dp2-237c022276a2
prerequisite-change-id: 20251211-siva_eth-ef9b2305b865:v6

Best regards,
--  
Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>

