Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93203AAF5B
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961683; cv=none; b=Pl1ZwbK4hZtdSa8C4Ea3z6JxrN/agBStkjsD2XCweyIhHnxHjm76T3nasC9oPdShs/iXJZMn2ZqL6Ec0LV5n2Nt0lJq7gmXZZAucmkjTwN8p5g3LOWouSfdMxs3sIIFlEYPpY1LUxKTfg9Cj443tImu3cTw9sXLwWnK9suTtWw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961683; c=relaxed/simple;
	bh=wkO94JmouNLTREkhPPGAEm7GqQY+zVpvGMVJYEGmHqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xs8ANJ8B1dw++TKBkCXKZeVSH+EWK9UrX+EXP9aZTu8fzeMopnGpp4I4Lf6fJjx9u9fYloVhqcQVaBZRnXBIKhKSG29E3cVBzk1lBH4qDZQ8KZa2lxI8aSu2ANU2ZKKtb/QZ+53mir9ajxhRPRNJB3OwFk2f5Sy0zAgLqpxJs+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fnOfFObn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHL+kIS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fnOfFObn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHL+kIS8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9df4O727855
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XlPPjj1P5iTfQdJcc9mc2c
	YpkRVQ1iqS8kqGPOaY+lQ=; b=fnOfFObnSlI6UkDamLngtEKh1Ml6EP2Dqa6KR4
	eQlK5BgrYrqJiV79+9u+GkwbtuSlhz/5tMoRfZ70G/Lwszf3A454MglJmyFfqUzM
	DsqvOfPkUpVdRYhBzkIPANfrN8mvwza0Oph4hU3cpNAsVBSr68QrUuaiDzcgKxop
	yMpwC4yw9UcL7OL56fSfd2gr1RRv6tMajkErZF7BCEgbNCzdvYkk7lWG4PkO7n42
	MJ2WIGeeOL2WyuYdAVuLbddqvg4Z+I/e1Tpm+Vrkb1u9lXtnkGe8WEW+QTzaGJWf
	6G4B4LsAevDI8LATmBLGaXbXvEPeQ9JEkqD+f45ALPgcvHuA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke0rhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 10:14:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso3842883a91.3
        for <mhi@lists.linux.dev>; Mon, 17 Aug 2026 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961679; x=1787566479; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XlPPjj1P5iTfQdJcc9mc2cYpkRVQ1iqS8kqGPOaY+lQ=;
        b=NHL+kIS8UBUpgugQd8pLwdh7awgCpGM2+shSe7Y0Md96z8LhgLZS5jyNi8U9CDv+DZ
         3s4ikqbrEpCaj2/Eu9sUpUfPBpW1OsNmcjKE47DOK6jW7G9h5c3sKxyl/MX2q93e9OMs
         gSWhIfJc8kKNcLNKD93DR4PbfCco5plfuhJ/L4ZNi7dI3+OMBRyvBsKgJ/RhCOeRGdaZ
         cL4iI6aiZ6nuV5iroaGZFpb+TdZ9EFLEESwKL7rmNOBxY2hEpTiugtSzGW/2u+MiiqyZ
         nvTzagfE2XPQpST3BQVCjU7wPm9jqPz5+uFzk5nYnC2Mdf5yHZAwX6fsV3NcmKGtAi8k
         jbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961679; x=1787566479;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XlPPjj1P5iTfQdJcc9mc2cYpkRVQ1iqS8kqGPOaY+lQ=;
        b=kVHrWMLqn6ApJ5YfrKaUMpYzi8qOVMAGMC9pGkhAbkPnsAPP8VWKVZbyP2QGNAZ7+S
         38RLQqWv1bZnted/dvhCcjomzenfx+A29Z03ILsmsasntLNj+l0WGKE+SqVSIi97HWK4
         sC4NQ/j7kA41tOAy394J8VcfClLTXHMLwaRnJoWtDWiJwxqWZf2du/E3sKdoGSbV4uiA
         KL9tuOE5U/XN8utoYu1KO4XRqAZ266qUfsvNNThkesUSVbJdufuMT+/XeQMo3ifayUFq
         QvGT6mZSwdlvCNoT2Jrocu02jeBvNOBcFN0cVlyt2VRkanMLu6GLNWs2hLju+4oPtfRg
         l0bg==
X-Gm-Message-State: AOJu0YwtOv6Jav8k2itc4Ryhy3RauxqnT9VxChZZtRpXYf1Fxqmtj52l
	MKRtfmdVTJYblBifOxsV32fix+qgbQGrj50AgYnX/+sy62k5ZgYND0DulYvQry8XY5ZqR2Owt3s
	HVr6bCOfqsiYVg9aFpNwJXGYN6uJKfAdNUvRJP/lF6gA4GMOWFbq1Fac=
X-Gm-Gg: AR+sD111Shfvh/QH1OGnarME94FRIxeOtC1Ia8wu5ZECZoIFUa8iOZY17nHymrUz2f+
	YmeDGOTkCWaF24eEfGlWnyiwqbQ9OvyvXSjuWToPTs/Y+KDJ8JWv57Ki+MX9SVtO4ZBZdBwn2rb
	eMohd9qx6MAm4kcIWIqatSOXeNrHCq6wthM/zPZYL3QVjfJrdHF9CWCNO+d/wfQ2RO5iX0blYNM
	bBGVJqb2wLvsz8YkHCY46DT33W+t5VyOmrqsj6Au1vgvZeVKh8xr8PfH6uqWiW+OKs3fD7WGwVr
	b5xnp/nM2hd2mwYp6RpR8s2/2Nr0X15bmNXVXA3ggBYSVyhR52Docn/NhfRq7lTa5s9w1q+Hwkj
	eT4KoXZjIZNyrdJgeomojbyiy2A==
X-Received: by 2002:a17:90b:528a:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3933b7c3696mr24865431a91.3.1786961679366;
        Mon, 17 Aug 2026 03:14:39 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3933b7c3696mr24865382a91.3.1786961678819;
        Mon, 17 Aug 2026 03:14:38 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm1744315a91.17.2026.08.17.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:38 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v5 0/3] bus: mhi: Add loopback driver
Date: Mon, 17 Aug 2026 15:44:33 +0530
Message-Id: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnfgmoC/32Qy07DMBBFf6XyGlee8SNOV/wHQsi1x8SiqUsME
 ajKv+MUFUGbsrF0LZ0zd+bICg2JCtusjmygMZWU9zXouxXznds/E0+hZoYCtWiF5LucD1vnX57
 6LvFApHWMIiiDrCKHgWL6OOkeHmvuUnnLw+fJPsL8exapv6IRuOBGBe+tshGkvs+lrF/f3c7nv
 l/XZ9Z/s4ALrDfU2kqSc80/LMoF1hqwUUJUyrlrdt5jxJ/uAFfdsToabJyMoa3j1Q2HPDuMMCA
 uHLI6XCOlF56igVs91C8HXt5BzT0sbqUTEYnigmOapi9mjUgq8wEAAA==
X-Change-ID: 20250903-loopback_mhi-dee55ff0d462
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786961675; l=6724;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=wkO94JmouNLTREkhPPGAEm7GqQY+zVpvGMVJYEGmHqY=;
 b=uNerDlUabWVHFW//tcW5RH/9GyUT/ZoQyyY6AlXtCZfEvoCyHz5FKQnhPejHfjhcK1kdkJzds
 2cHSTPEvWXTBbVyaMoN2n/7VGQjcTL0sh3ElSbKz0A5hUQXqC+LGMJZ
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX1wnRt275e0RY
 M0RvY/2ZOgWc9uttYNVIYNHGz4ISZ58Q6x4XqdqRiLOEdXom+JwCa5sA109ZimQOk01Q1LDXuoy
 ZQKUVDwAthdbgRQpeUPTA+NUKbZOTrB1vn6mDxDGGm+uh8JBn1kDpncP9k1dsT4MfqI++3XxiUW
 mKT2GzYey05ro9JdwxmLon0gEVU532Sf7oW2kRzd3X/Pr5lw830RdcF4gJO17emh5puHGZMepwm
 6XQPRdYa1gjfapU6tMxFgr/b8emsJV8IcJFkq95rxMjCrUUFWYyU3qxVrafJErH1VyOU1NEQmDF
 vntdQhISqakkQEjXdzjBpSsPept1S3gbV2yzNIIpSkct5e1d4gn5hfnKEmOwa2aMlR5P6dJdvBW
 5fa7aK/XlBoTdM/UcschwVhkqaORqwOpOfbhDFrafAig3Y5L9DPtC0xVe/RHUwMUWCmArQfGC3j
 xmRCN0aYbyX8O1Ruvhw==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a82df10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3A0WO9QBTenhGBBI9gMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ua6aRklTCUxlMuEmKndtZXY9PQy1n27O
X-Proofpoint-GUID: ua6aRklTCUxlMuEmKndtZXY9PQy1n27O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX35DxvKwz3E1I
 ykiAW52WwR8oSfMC4Yo8aUTsdOgrtEApIK2VT1m2o3cMRHbCBOCkLceJ/vOPQGhWhFnuketJbDJ
 CsclCvogNWlkuqJmFxuzrL2hYoDXJXs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

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
Changes in v5:
- Rebase onto mhi-next to pick up the EP flush_async() support, which
  disables the channels and flushes the in-flight transfers before calling
  the client driver's remove()
- Drop the file header comment block duplicating the Kconfig help text (Mani)
- Rename tres_pending to tre_pending (Mani)
- Replace devm_device_add_group() with sysfs_create_group() and remove it
  explicitly in remove(); this drops the !loopback guards from all sysfs
  show/store callbacks (Mani)
- Reset the channel in the start_store() timeout path so the device releases
  the queued TREs before the buffers are freed (Mani)
- Drop the status sysfs attribute; start already blocks and returns the
  errno (Mani)
- Capitalize the error strings and print the errno (Mani)
- Drop the mutex_lock()/mutex_unlock() pair and dev_set_drvdata(NULL) from
  mhi_loopback_remove() (Mani)
- Use ret instead of rc and return 0 on the probe() success path (Mani)
- Validate num_tre against both the UL and DL rings, and check both for free
  space in start_store() before queuing any TRE
- Log the transaction status in the host ul_xfer_cb() callback
- ep: rename loopback_wq to wq, log the kmemdup()/kmalloc() failures, and
  reword the error strings (Mani)
- Link to v4: https://lore.kernel.org/r/20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com

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

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  39 +++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 130 +++++++++
 drivers/bus/mhi/ep/main.c                          |  29 ++-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 289 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  16 ++
 14 files changed, 537 insertions(+), 9 deletions(-)
---
base-commit: 9656bcd4c321a799148d00dd830ce7ebf20011da
change-id: 20250903-loopback_mhi-dee55ff0d462

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

