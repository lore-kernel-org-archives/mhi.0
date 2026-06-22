Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9220D3546EB
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782104970; cv=none; b=kAt3e5djaLpXhzbL/s8iLNSro0ZCIO7C3tHpRpD8wWgKN3nQhm+qSsRlU6T2q1yg+aNM1Wrcr0pWFNTeLnWonBQWWIxldGqw0y8Mi05VXBaHcFO9e+p567LAxbuRekLYXG6SlEQLhr/+uh3wmqgPL63rdF+xPTXbVCttucN1meA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782104970; c=relaxed/simple;
	bh=/uwt8kgsgK9u5RsDCVx5ENOpZJjs+RoI8FLf2D/hs68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E6HKsicMJPqax8VmxbsdJE5dVSFQ070hLCiMg0a7I52VaqQGFjnucwDWXOvUetLsWTBGcpFHQO3rfT3W7cl0v5Rp8HjKhtNuB/2vEQc0r1fk52dHE0RM7mjy/E26ZziiT00HtOR+FVebw9J8buKWZfkEa3f5WQ2gYWy7x6nzUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdKXbsq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMKGemsf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdKXbsq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMKGemsf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59SvL3880381
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4k26TN/DWSZP8LRKvVcEmT
	AWTWEuz42kG0MVOuNnrP8=; b=NdKXbsq2BqjJzLnPAMgdGwv5bPEqDN4L2djiUm
	4uSlWgrw01qycCRavLXqn3HAkXKPvO889nMXPUkcDsBO1LFtUrnbi7SSA0VRrQdm
	i/lN9M7yUwjKHN9A5Dq0LcJlodCSl2vRJrJmJobJ+dKRy9jchmZaKrmoE4K+1KI/
	iTVE9En73zLM4vGvQHoFlzKLVjPprOQK5r+KXSa/0Vw4hG5gM4eM6ravv18gsBUO
	l8voRiqUw1z7y3BcUycCVUpc/lpcI30Ky+ECQWwYysN8zwrItI6DUF7FjbLiOrYo
	7fZ3VNbsNvK5KH1RowigX88jgT6eI7ifmAlcqrjp8+bgRQlQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjed2gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 22 Jun 2026 05:09:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso2627803a12.1
        for <mhi@lists.linux.dev>; Sun, 21 Jun 2026 22:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782104961; x=1782709761; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4k26TN/DWSZP8LRKvVcEmTAWTWEuz42kG0MVOuNnrP8=;
        b=AMKGemsfnnXZ1liiUzSGfM4ONFk3hEa/O3vpXJfn6/h746sj4m33xsXV6XEZLBJT31
         5zCwLnrjvjSBqjGxqzPfvVdP2HE894ACSwjRDXyAL7G2MQSZoO8rLV7rKwjReEMB6GoI
         a5H0owsUUazoiVi0r8DF8gfX3cih1+FXqwK/ujjt5ie+FSCEfPn+UR9eJ0JXN9PnENjy
         rv0oVUNAxZ3vR7XZ9z4HeaoI6+tyf7Tq5CwxsbVf4Nceyf+MN++JclaLDgQaLi/wC08v
         pyN1hv4TMSVsEe15vp2y0rXsL26fVJahYw0lxH/PhhaFjpz+L994U4mkWoEUnmoqnOcH
         Y0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782104961; x=1782709761;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k26TN/DWSZP8LRKvVcEmTAWTWEuz42kG0MVOuNnrP8=;
        b=p+oPFbzUeEzuYz4EFTv51+hUERDJNpJ4NrIdR2xRhdDbNJCY6+rHBI4hXg62XVLhEy
         Zetg4jSFdSekzhvAZfexTQC+uBpoVXPo/uY1uq+X0lLEO7fBTBMx0WPSguMg2fu2I14l
         tzZ3utlIkBjhyI9/BRB3TNftJSHQz0w9u2EFwHU5EFqmk0oOHYaXYI6brzIRagfy5fib
         bpBdjIs4YSI+yHlB0QzKvZCf+04OJ9bMNjC8vvZ8/LRGA7vzKH0oee/H3h94KTUE0NEW
         uFjo2L+5I0bxxpkW1pxUubun+yEgjb0DAJaVYBILB/FQfmZt6Q51VjsdNgvaNd5/IBU2
         jeNw==
X-Gm-Message-State: AOJu0Yw9zo16m6qVhGMtfSYnQQyUU9BOlEq/uwT4/25JgcCsZaYCVdeC
	aPQt5Bh13cv3//SJ51CDO+9wqfwffmkEP+W1gS0VOOC5O7kCwTnyyFg8gJM3TXMeHjcudy0Y+8b
	WysHXSUKn5Hl85+rsJE4JWE5El9L3uKfOOvWp8NwAKmiYs5sPLS/+eO8=
X-Gm-Gg: AfdE7ckY+OGtiiuuXxOBF+3HKXGu3t6pMbRYcGX8Abnh9nf23ePMIQzR0ec4gmzmEkJ
	BT2nsqWWIFdeF7DpwgKVTKFZeBVXmuWX6l2p+rsACOkgmjvAqGnl7ebl98lcuBvVlFXCetz+o77
	msWi69tFRzC7nvX6xq8N8flZNV/UdYObgUPub8f7WWMJ9ilx5HJfaTNOOOv6bq3hbpAsLgEd7Co
	t8zzgfHGfBy91RqxIZ5Bc6ewa9jQrG2LVxmz49oBF1KUhiJq+hcSNuQqzsphLzK6zfLf1M9xZQ5
	NuC6FXwy3JQNOJ4ZPbR4qWM6LJNXYO9o0w3ldzxtHfJ8TWTvUOZyMfeXQDbvKAccsYpvslz47vs
	XPVdFBCBv8zOdwtCe/x7sguohYHNk5VsJAjay
X-Received: by 2002:a05:6a00:bb8f:b0:845:3fea:976 with SMTP id d2e1a72fcca58-84550878020mr13574477b3a.29.1782104961235;
        Sun, 21 Jun 2026 22:09:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb8f:b0:845:3fea:976 with SMTP id d2e1a72fcca58-84550878020mr13574436b3a.29.1782104960565;
        Sun, 21 Jun 2026 22:09:20 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c5dbsm5905996b3a.12.2026.06.21.22.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:09:20 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v4 0/3] bus: mhi: Add loopback driver
Date: Mon, 22 Jun 2026 10:39:14 +0530
Message-Id: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrDOGoC/32P0U7DMAxFf2XKM5niOE3TPfEfCKGQODRiXUYDF
 Wjqv+MODQlWeLF0LZ3j65OoNGaqYrc5iZGmXHM5cDA3GxF6f3gimSNnoZVuVKdQ7ks5Pvrw/DD
 0WUaipklJRWO1YOQ4UsrvZ93dPec+19cyfpztEyzbi8j8FE0glbQmhuCMS4DNbal1+/Lm96EMw
 5bHov9iQa+wwVLnmCTv239YjSuss+ASQjLG+2t2+WPS390BrrprdrS69Zhix+fNHw68OKyyoH4
 5kB2+RQwqULKw1mOe50/+yHiarwEAAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782104957; l=5359;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=/uwt8kgsgK9u5RsDCVx5ENOpZJjs+RoI8FLf2D/hs68=;
 b=YxYLzOdhL/dadhFmAEOJNpOEPS2orexyVZIs2OTyZa3CnM3sFf3ORdhbgSANf54GuQhmn+Jh0
 FWo9MshRpZeAJ10sWzew8iA9eKLi6SKNq7Zcdub/3pLAFgyiRhh5v1H
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: nq_4VnUe7jFVSu-ZznWmMvSXhPGyuy4q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXwzbZUqPIqqR+
 dC2KFiks/XpiWyKiDiAeUcgx8+MaEZUumZRkITMQ5tjvbAHZhhxXEGifi4DGPWKCm1UlZkyvS36
 OT5LVtrOH7FAfcGMZCrGMrFPaF4NoK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXxySpVssE/pf3
 MC5uoNUY3GMZHjcRtXWgRKdbAYfqY7Xe/V+uZB89LJLpwRiwEu3iESRwRcjUVcWiA7CQhj4OLAC
 MfslUVwrqFauPV2catQZ3JWSWHV+1fyGVTXQD1NUBW0ADW+qqaYSu+AkGvK4tb0O2EmYV6Sx9XO
 eeAUJKzK0FTdg/CIckkJiHTMShmglQV/nBEePZI6VD82l9Bc7rN7/Nng2XTNJPRmECG6roWZe7o
 rKN/7S0qc7PyhElx2L/4F8zkdbbAnQBena+ywd4EGfFG7HqyVrGwUZ/u7eCi8DRIMIPa0RsELct
 QbO8oJ3glK7b0nOJ+3r+8Faz/iGwmv2oQSq2608x/HemaU/dpLIkErYxz8h2POnJ/XWgoJyG0QM
 n/pwNj5qt7JHItXfr4eNxprPYzJXUTeDc23FvHwESxtqU6EkESY15B4YAcYMT1jTiJYyp4McQEt
 bs0WF+oqjIwjSwsisxg==
X-Proofpoint-GUID: nq_4VnUe7jFVSu-ZznWmMvSXhPGyuy4q
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a38c387 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C3iqeZzp22duqOMSZkcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

The MHI specification defines a LOOPBACK channel that is already
implemented by MHI-based devices (modems, WLAN) deployed in the field.
The endpoint firmware echoes back whatever the host sends on this channel.
Without a host-side driver, there is no way to exercise this channel to
validate MHI data path integrity between host and endpoint.

This series adds drivers to exercise the LOOPBACK channel from both the
host and endpoint sides. The host driver (patch 1) binds to the LOOPBACK
channel and provides a sysfs interface for configuring transfer parameters,
triggering a test, and reading the result. The sysfs interface is stable
ABI because the wire protocol is fixed by the endpoint firmware already
deployed in the field and cannot be changed.

The endpoint driver (patch 3) echoes received data back to the host using
a workqueue for asynchronous processing. Patch 2 introduces the
mhi_ep_queue_buf() API needed by the endpoint driver for raw buffer
queuing without an skb dependency.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v4:
- Fix MHI_LOOPBACK_MAX_TRE_SIZE: change SZ_64K to (SZ_64K - 1) since the TRE
  length field is 16 bits and cannot encode 65536 (sashiko)
- Move mhi_prepare_for_transfer() to probe() so ring->el_size is initialized
  before num_tre_store() calls mhi_get_free_desc_count() (sashiko)
- Add mhi_unprepare_from_transfer() in mhi_loopback_remove() (sashiko)
- Add NULL guard in all sysfs show/store callbacks against post-remove drvdata
  race with devres teardown (sashiko)
- Add KMALLOC_MAX_SIZE check before kzalloc() to prevent page allocator WARN
  on large tre_count * tre_size values (sashiko)
- Fix start_store() to use __free(kfree) locals instead of goto-based cleanup
  to comply with cleanup.h guard+goto mixing rule (sashiko)
- Change buf_left and read_offset from u32 to size_t in mhi_ep_queue() to
  avoid truncation of size_t len parameter (sashiko)
- Add zero-length guard in mhi_ep_loopback_ul_callback() before kmemdup() to
  handle 0-byte transfers returning ZERO_SIZE_PTR (sashiko)
- Add NULL guard in mhi_ep_loopback_ul_callback() against post-remove drvdata
  race (sashiko)
- Link to v3: https://lore.kernel.org/r/20260610-loopback_mhi-v3-0-a733c0cef61a@oss.qualcomm.com

Changes in v3:
- Move ep driver to drivers/bus/mhi/ep/clients/loopback.c (Mani)
- Move host driver to drivers/bus/mhi/host/clients/loopback.c; keep
  module name mhi_loopback (Bjorn, Mani)
- Add ABI documentation in Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
  (Bjorn, Mani)
- Rename sysfs attribute 'size' to 'tre_size'; add 'max_tre_size' attribute
- Update Kconfig title to 'MHI LOOPBACK client driver' and describe that
  the driver binds to the MHI LOOPBACK channel defined in the MHI spec
  (Mani).
- Fix memory leak in ep loopback DL transfer error path.
- Rename mhi_ep_skb_completion() to mhi_ep_buf_completion().
- Document buffer ownership semantics in mhi_ep_queue_buf() kernel-doc
- Fix use-after-free in host loopback
- Fix completion race: arm completion before queuing recv TREs
- Fix teardown race: synchronize mhi_loopback_remove() with start_store()
  via lb_mutex
- Fix u32 multiplication overflow in total_size: use size_mul()
- Replace kmalloc+memcpy with kmemdup in ep loopback UL callback
- Update mhi_ep_queue_buf() kernel-doc: note per-TRE callback behavior
  when buffer length spans multiple host DL TREs
- Move mhi_prepare_for_transfer()/mhi_unprepare_from_transfer() into
  start_store() to avoid holding the channel open when idle
- Link to v2: https://lore.kernel.org/r/20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com

Changes in v2:
- Use __free(kfree) macro for buffers
- Removed NET layer socket buffer dependency, now using buffer and len
- Created a New Api for queuing buffers for clients which do not use skb
- Link to v1: https://lore.kernel.org/r/20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com

---
Sumit Kumar (3):
      bus: mhi: host: clients: Add loopback driver with sysfs interface
      bus: mhi: ep: Add mhi_ep_queue_buf() API for raw buffer queuing
      bus: mhi: ep: clients: Add loopback driver for data path testing

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  51 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 +
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 128 ++++++++
 drivers/bus/mhi/ep/main.c                          |  29 +-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 329 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  15 +
 14 files changed, 586 insertions(+), 9 deletions(-)
---
base-commit: e6b9dce0aeeb91dfc0974ab87f02454e24566182
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

