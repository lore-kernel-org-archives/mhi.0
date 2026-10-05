Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6359445AE7
	for <mhi@lists.linux.dev>; Mon,  5 Oct 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196782; cv=none; b=KWK9Q/3e18edW/fjgTjBV4V/iaBRnlBfTO6b4pw7nIB2lhutE7Y2ZCmjVxOHk3yBHbqEbEDWedIqFaZL/sB9MMHCi/1vTxnU3pT+34HNwbsX2araOXpTqx0ANzko0zS6YaY+QvEQPCcS8+QbSL4z+V5MzitSlVOcQ+2STlT115Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196782; c=relaxed/simple;
	bh=bc5GFRQiIGiADHORo9EuaMGvjImIKx+DzfnfjV56Axg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rnfYQak31IdUmfMigckeRZ7CEBtOyttE0cZ6Qj3m2JHjq/loBHCMj+X2POg2rs5EqKHKT4r9k+IBpAKkSVwERhWKhXW++a/OjQ9HSxCEIeVFHpFKivvaBc7p+ZAz4pLvbbGuL0x5kVY2m0V0I5sUefYqNvM7fzN3XfUJFZ/Tmts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuKo0Zri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTUZJpo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuKo0Zri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTUZJpo+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695A4baj2084899
	for <mhi@lists.linux.dev>; Mon, 5 Oct 2026 10:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VYZZiRmnjas3w9PBHGWmvS
	vkLtLWSqfv4c+kGyXuZMM=; b=GuKo0ZriCn0+TIxeXucbTNpuwhkIDr1a4LPTU0
	zEIEmVQBblcAiaJl0lUF+QKjDs3A3kjezO6WbAhTiihx8XCePkQ3tzMMp0qVKK96
	VszhMAAzLz5Wv/vYYm893DSwSwvnH0KhFJhZZqm2HK5OMs8HOcpDbrje3kU3PTKI
	wwnD7trfJ3DfixyWLL/KW26+mcYsYoP7MMad9aGQ8lmYcCvHddr1BwUlL0mDzLdN
	kRcgHGBwN+e8TEYZq2YNJxV49rszwxeB5uAfEa5UtQhgiW61nYD/FFXViwinHk1Y
	WexRFLV71K8mFUFptD5B/twdK2so2udEr5HMZ36OcfAtj3tA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvr3fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 10:39:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a47617a0b3so1362433a91.2
        for <mhi@lists.linux.dev>; Mon, 05 Oct 2026 03:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791196779; x=1791801579; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VYZZiRmnjas3w9PBHGWmvSvkLtLWSqfv4c+kGyXuZMM=;
        b=KTUZJpo+F16yCcZpxO9+I6X1ZhYix3opn1rw7kcYfEkDpDsbPIY526xLLhFWJiDphq
         sRnsyV78XNgxLtFFZ4yasUKC0v2C61X1GBFMxRCOxvjF69ayuYkytEB7E8GgdByMRLdW
         Hmwg/LFwL9brAhdij7nsjDhGGoPjcqwCbuwid+5nSXaf1yPiBY0QhppYABvH8BYmBLHm
         whm/ZB8fiQ0yUqNBqbjjEnQ5zRt5+RPbQnomt5hGHY+WhBRi9CMDPdzARL9RMfdoctRR
         Jl9Cp6LF8DZSlgPdkR+lkCkUguigbv8tcVxKHPNmdLrvzKyTTACTPmDmjQyNXCqNCSeS
         9+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196779; x=1791801579;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VYZZiRmnjas3w9PBHGWmvSvkLtLWSqfv4c+kGyXuZMM=;
        b=m8VIBMVTH8XFXASO4lIbzE3oZolD9eitTjrT4YOlCTnAjp8n4NB/IA/VXYMMtwTiyT
         0FS6PfjFafzIpWnA63Psb7NxDLDnfedrzoNfU3K3QseRZdCcQVTwwtV0pKtrLu3gcAMP
         Zd0zcnyYZLfXxyFMJ7oRAht6/M8MkAr/NrRAqjZkIj/Zg8ujxw3MX0/+qYYnFBdfFK93
         CCZeSihOnLyJKfteZOepFOR/VNNEdft0Mdgt7FpNLFnrkTVh4f7hps6nFOhT3wlzDwdB
         AWvOhyJ/OOmEeJ24YTEjmenhWwGXj1mZTd3zUTuXsvzoF3e7TjHldQI7bJ5uqlFPoHUf
         Bt4A==
X-Gm-Message-State: AFq9FYJnLf8YsoZnIiYz+m6ht4/1EqRGFh+UgP9SLIsM5kGjaCYHAejU
	Cq9FnvesbRsCsnpFeeeNsvqzbu4Dgtpb1MVp2MNKB1C5VhqsqQ3d8dn5tTPrPogG4S5t99DSt1U
	kBpWd8zroCoKOuDxoKC1pmSn67oS2KkaYpLp5h9MWZCYesGp8g6JKA9o=
X-Gm-Gg: AYBFou0Jq3JSnJ4B1caAOOj1a+jwnQ1S+ASIFYAVpNPCQ77SkxdObJhOs17EF/hP6sD
	IAFCLK1ah1GKCDWSyfs/ADRQ3TNctMNyPeAP57ptUoyJYPAWwCYd4H32HT2jXQziEFFlQMMLPCn
	Sg43KmLP+xlErhNBHiIuNnTBS903tVYONiroAwXDqlzC7NcpF6K+emz8F3QmNblJq0rgimcGkZO
	Uh3dEHtcaUM8rco1Q0YaUct7C7L3AE7RfvTkALEieYBRdhvRyrfw0KMTQY6xHaOgjFI+zjG5mQV
	KpiP9K7sAgfFJliyf8OE+4ayc/zyTWytX1KwZOEQZuu8h4RiLTFuaGVGoszEEyJy24mb8WGJLPu
	U3JOVg9VEl/9EIb/m79LWAnYD
X-Received: by 2002:a17:90b:3b87:b0:3a2:b04e:8084 with SMTP id 98e67ed59e1d1-3a6cec8273fmr4751683a91.42.1791196778523;
        Mon, 05 Oct 2026 03:39:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3b87:b0:3a2:b04e:8084 with SMTP id 98e67ed59e1d1-3a6cec8273fmr4751673a91.42.1791196778008;
        Mon, 05 Oct 2026 03:39:38 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e61386csm11223918a91.17.2026.10.05.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:39:37 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v7 0/3] bus: mhi: Add loopback driver
Date: Mon, 05 Oct 2026 16:09:28 +0530
Message-Id: <20261005-lb-v7-0-36a268b6386f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGB+w2oC/yWMwQ6CMBBEf4Xs2ZJSQime/A/Dga6LbAJUW200p
 P9uwcskbzJvNgjkmQKciw08RQ7s1gztqQCchvVOgm+ZQUmlpVFSzFaMlaXaYGfQ1JCHD08jf46
 Ta5954vBy/nt8Rr23f72TZtejFlJo3TYNkq004sWFUD7fw4xuWcoc0KeUfqJrI9ibAAAA
X-Change-ID: 20260820-lb-f1be38c98c83
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791196774; l=8614;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=bc5GFRQiIGiADHORo9EuaMGvjImIKx+DzfnfjV56Axg=;
 b=eOHazO4BBOj3sGjWA5m9o3rRbaNmOJYmuk4EI4AZmspVNoZzrUW94/1H3skqDapjG97ve+VLt
 eKFOqR2hrXhBFbUxpr/URggpKGuRm9delzr1GmvasK2kmQjaztYj1sA
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac37e6b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3ZmytVxvEA25S_oFN6sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PqP_nbneoSROK09NOLOK50JE6UorE85m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX0oxbLH5CacdV
 gDBz0yC+5bVJn9bx2oLVgJ7tb/LgFG08A7hVb7MngD0rTWWWFFm6vjLKByb+x35fUR9g4cpTFis
 wLhQZnW1nzb+DWVzSh+Qqi5Tiwm9uSlh/PrmuIgwF3R/82Lu10ZNg3nDVssIxqtewd/A/A7W2/2
 m85Iznosdzv0WQeuAQee6RdUPv4OC6Aec8jP2DWpAyHzSveCOH9gIJrjSkuRsOKnv/I5APNoZzB
 flXLlIMU5zVvMm0P7VUcBM498xh2ZQUatM9+xvcn8ZoaKQGoHy2+NghHmW2le0DZXF2ceTkjcN6
 LGLxxqeNqf2ecKOcZZSx68gF1fNp/7E3G7GJGDBqWdBJkXVQn7inH4HFwh5HWbR0pWz9EsZXA1x
 m59y/zJWrsmFW4orY0bTNBi/7bY02HaMS4T35FQvWAUAlmew9EsLkfEetgrL6bEYVd5JaC3zCu3
 utv0LClthoXEUgfEQdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MSBTYWx0ZWRfX0hKMTOlfxV8B
 tajILWZ4F2Qsp8+jI8Mo2FGXi2vOB61/CxQakaK9TqZE6Yg25KWfjQSDLwmDcILGEStEVqwlj1t
 uWReUfe41lT3BEiABzFXjWuhfZ+HHgo=
X-Proofpoint-ORIG-GUID: PqP_nbneoSROK09NOLOK50JE6UorE85m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050041

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
Changes in v7:
- Fix the tre_pending comment: it only tracks DL completions, not DL+UL
  completions (Mani)
- Add a new 'max_num_tre' RO sysfs attribute reporting the live channel
  ring capacity, and reword the num_tre ABI description to reference it,
  so callers don't have to guess a value and parse dmesg on failure
- Reset the channel on every early-failure path in start_store(), not just
  the timeout path, so TREs already queued to the device can't outlive the
  buffers they point to once freed (Mani)
- Replace sysfs_create_group()/sysfs_remove_group() with
  driver.dev_groups so the driver core manages the sysfs group across
  probe()/remove() (Mani)
- ep: restore the blank line after mhi_ep_buf_completion() (Mani)
- Link to v6: https://lore.kernel.org/r/20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com

Changes in v6:
- Add comment explaining the purpose of atomic_t tre_pending (Jeff)
- Drop <linux/mod_devicetable.h>; already covered by <linux/mhi.h> after
  recent tree cleanups (Jeff, Uwe)
- Drop the trailing comma after the NULL sentinel in
  mhi_loopback_attrs[] (Uwe)
- Use dev_err_probe() in the probe() error path (Uwe)
- Fix spacing in the mhi_device_id table entries (Uwe)
- Reword Kconfig help text so modems/WLAN read as examples of LOOPBACK
  channel implementers, not an exhaustive list (Jeff)
- Spell out Transfer Ring Element (TRE) in the max_tre_size ABI
  description, matching the neighbouring entries (Jeff)
- Clarify in the commit message that the new ABI is added under
  Documentation/ABI/testing/, not stable/, and is unrelated to the
  existing stable MHI ABI entry sharing the same MAINTAINERS line (Jeff)
- Bump KernelVersion from 7.2 to 7.4 in the ABI documentation, since
  this series missed both 7.2 and 7.3 (Jeff)
- Link to v5: https://lore.kernel.org/all/20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com/

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

 .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  49 ++++
 MAINTAINERS                                        |   1 +
 drivers/bus/mhi/ep/Kconfig                         |   2 +
 drivers/bus/mhi/ep/Makefile                        |   1 +
 drivers/bus/mhi/ep/clients/Kconfig                 |  16 ++
 drivers/bus/mhi/ep/clients/Makefile                |   2 +
 drivers/bus/mhi/ep/clients/loopback.c              | 129 +++++++++
 drivers/bus/mhi/ep/main.c                          |  28 +-
 drivers/bus/mhi/host/Kconfig                       |   1 +
 drivers/bus/mhi/host/Makefile                      |   1 +
 drivers/bus/mhi/host/clients/Kconfig               |  17 ++
 drivers/bus/mhi/host/clients/Makefile              |   2 +
 drivers/bus/mhi/host/clients/loopback.c            | 312 +++++++++++++++++++++
 include/linux/mhi_ep.h                             |  16 ++
 14 files changed, 569 insertions(+), 8 deletions(-)
---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260820-lb-f1be38c98c83

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

