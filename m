Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B137C921
	for <mhi@lists.linux.dev>; Tue, 17 Mar 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773727974; cv=none; b=GMd8sqY8f0aQBQabVJNN8vCd3filIrz9QvWbVoyRPwGz17obrPlsIDeg/6+/JHXMAUrjjTSeshGoaItpjhYtNcc9AJzw/THxwZsy71iebT82q+WjaRW1BuV0X8ars7CAuofsOxpmN9cpbQjDoDEZqTB42H9YFxd/1toPRRRxoJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773727974; c=relaxed/simple;
	bh=05tbdlBlkRu+01VdTCGRGeQ/hSfOdjmtktuELANbCqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U25+Q3xyrYtOzGRwnlx/4y+IkeDpoNEPBJS+YE9qe7lxlSi5nz2UcwZPA69QW1p/kRN/UOLJywrx1o+NMTRqSUBnBr6QRRx62jBpFAsjsAA4U9I1oxzjSmR9n9jrjy9b1Mx3+YIsCx6ayVHPvd1FT+4BXtHIYzopEP5DJ+Ks6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeMxCgk2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfsYdDKV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeMxCgk2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfsYdDKV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2KEkK4022233
	for <mhi@lists.linux.dev>; Tue, 17 Mar 2026 06:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YSM2SMwhyaI38MfGxlBh+X
	RUxBiv2hS8quwXmgbaogE=; b=QeMxCgk22UAwpYc2YyQh6ZAsDB42vln4ieOJKu
	6IvBjOvgtIK2AbhBVAXqBxZ/6/CvfCdUus+LscVFORpuzdK3d1Hq45kfKNL+7uxH
	ZVgEnSeYKW7lAg/Y2vN0i5r3ZM+CzkQFx1ED+F7dwXfgkgIYUJ7MVU/SpG+5GTl9
	vh5Lpjf+CYXLf933MKNLTxaGkzuDDF+oXKrIttxz8Jo0GcQyOq6/0UahgSoOQpF9
	S9OqvXjdnO5x3IARXHmB8tLgvIxih7m21QIt3v/dSm4BwvC9RKxBZS7S4DSU01/H
	+4leMnnbTeYCxSk08HZqyPUE9jSWwLCc+VPVcCbEYOp84mBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fjca9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 17 Mar 2026 06:12:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73b0c33e72so3129761a12.0
        for <mhi@lists.linux.dev>; Mon, 16 Mar 2026 23:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773727971; x=1774332771; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSM2SMwhyaI38MfGxlBh+XRUxBiv2hS8quwXmgbaogE=;
        b=FfsYdDKVQp478Mi0ijiGd0Stac20ro4SFMYQrWNHCPMHlq9UkBLUhcYsOTTJF2XGiB
         DJbNo6PuIbJR5ycOEPmOatr5tkIwejGafcdLYYknSQAUo6UpyQipTDlP6U6dEdlYk427
         0juY+xo7j7t8DzLLMKUTfpzz8cS1k/fUotZS82z15BgXavx4I3wyuIdSY2e3luV3hTrZ
         4CD4CpW0RBEysV/rj7BOaPqbmn4MYXmZg/55beRNdN6DGhrkslw8n4fEoG6MPkWr9nrd
         N6HPX6jglKxss/j3UsnmNmIqBK29b90uWnvGp2zmeUxZEnPF84/Zrlvcxsal2+rXptU0
         OB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773727971; x=1774332771;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSM2SMwhyaI38MfGxlBh+XRUxBiv2hS8quwXmgbaogE=;
        b=ZY0b8+Q0UDbLzspU5G8P9nlmROw7vtesj3fYsUiCWNMSq4hjygZ1yZW0CrsuYZ3gbW
         f16OsflRm48M/OmGKSFlwnFndogtuZGCPLdj7Rs5fPTlhiMfTCDL1/Am0gctiVhXcjqw
         rPQ+yaiyd+0G5CSO5ezGyJctWR+75k8aqLDoDywPUP4SaT7m/2EMqBTwyZus9pjAyJWg
         tQx1Oka0AWdljOB05VTfC1dOX3yvhA0r/paADNg92h3xVQnf8qYV2knBDlSSW/gp6vb5
         HqCxtMLQvnKCIfOXw627U4Rki7wNT1eWmW0jyAvjMBRarOEW2bDJ0Aps83AT5aF8KW0u
         eQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaPdHGuRIyBodrD5I7B0u7w9+cDYJAMLksrO1xZYel16wxmnmLw4D11TiOkWsEo60sU0c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdVDIjZ7yfGDEbkFhoUX7xCffveots+UOEvwH+iUtY3lCL17+h
	hKZTO0t0Q2cGkFIYV5CHD/bXGvJuNv5HnRTtk2Rq+1/g7200Pn+J1o6ctx7hxhLvr90WezwtPZ4
	QkUgWROAVsE7exPIaxvyT4Wcj/3d8wNHwsKNR+xjEUPf960xSWH+BJ1MWnasEQptzdw==
X-Gm-Gg: ATEYQzx6Pgx1VW6ipFWDvb99qNW6QEQ/Tkph0bRvWl/TaTn3Hd9o/VFDUcFq3j4/QwV
	dtYlX1Ep+FW8bI98e5K08ARByDh1IvseaclaYcL4xt2qaIOyUWIw8GToIW9pnsOy+KjoTXSGs7s
	k7vlWd6+TCW/j2a42Jpldj3HFobrz7DJmsWRFaqnGDd8Z9bT9pJebSsZPHIyxeg1DmB/abMV8Xi
	tJCVpypFvjPcfq2TEonAC98K1yDcdISTFR76uaHhPrFrS+OdmmxEZ0Hb1btV4HXIiyhBDfxxZjA
	A6lugfjXRJmVPVC7/t2f8jyjPfaGZHShxvGbalITbq+yMK6xkQvfcdLZVeU/FqzQK7fwLBM8iDT
	VS7HUu3AEODTP9rADkX1NAyGOQoda9Q59Yl6EoUqTq13vyfqSxoDVOAIgnJttv/5H4q2J3W5lQd
	A=
X-Received: by 2002:a05:6a20:3d88:b0:398:7357:bb92 with SMTP id adf61e73a8af0-398ec9e200amr15746683637.5.1773727970931;
        Mon, 16 Mar 2026 23:12:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d88:b0:398:7357:bb92 with SMTP id adf61e73a8af0-398ec9e200amr15746656637.5.1773727970434;
        Mon, 16 Mar 2026 23:12:50 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0727e581sm14434149b3a.27.2026.03.16.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:12:50 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 14:12:46 +0800
Subject: [PATCH] bus: mhi: host: fix invalid free of BHI/BHIe buffers
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-mhi-invalid-free-mhi-buffers-v1-1-8418a3ad604f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN3wuGkC/x3MQQqDMBBG4avIrB2IVizxKsVFYv7UgTaWCUohe
 HeDy+8tXqEMFWSamkKKQ7JsqaJrG1pWl95gCdXUm340j+7J31VY0uE+EjgqcAe/xwjN7N1gjbe
 DHS2oLn6KKP97/5rP8wK+RxBnbgAAAA==
X-Change-ID: 20260317-mhi-invalid-free-mhi-buffers-ba490b94969e
To: Manivannan Sadhasivam <mani@kernel.org>, Rosen Penev <rosenp@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b8f0e4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=foqD8dz_Jm88mIy5WCoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: _JtFp5NVNJlxKgeATQLZj3zMC74hUBvC
X-Proofpoint-ORIG-GUID: _JtFp5NVNJlxKgeATQLZj3zMC74hUBvC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA1MiBTYWx0ZWRfXzfYLj/XVrQ9n
 UmX4Q/gWl6IzbhqEqJIGXsoK2P7HcBQCT8+kbqxEUQMXFpjyA5gwYOIMa9KTg82OXA1HgeiW+Q9
 Rr1zGV4TDD+GAOWb2D1WUiedM34ENMS79tvhckDSlBaH6QAOJUpkigk4kBqpylq5yGWmjnOTiQ+
 0mDz0KW7aXQ+o5WFWb7XdOn2W6dKzbPLtJY3gVYWvCF/S7nGIjXz3RPHVySnjcvgrwfpcmQsUrw
 21clpBvZ52Jc1vXJA44ySfP9NRGHeIGhJJxArL/Qe16Ou5HqfBT9VYPZN+UdT4Pi6uWngdt4ogp
 c8H6Y0Isp2k2aFANkx9ve371nqryExz6mQwiNnjZjNnJGSavgvcgf4L3Ga8K7tO5q59gCm0sHyg
 EWr8aplmUyNT3zE6KmvgTWBf2E6CWw+c8d7hFPHNoikJwGCFlrmW4xleAfQT4dh9b9ALdqyZ5nc
 HuwHSVjxmpknv3nIGbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170052

Commit [1] converted mhi_buffer into a flexible array embedded in
image_info by switching to kzalloc_flex(). As a result, mhi_buffer is no
longer a standalone allocation and must not be freed independently. While
the error path was updated accordingly, the normal teardown path still
explicitly frees mhi_buffer, leading to an invalid kfree() and the
following warning:

BUG kmalloc-64 (Tainted: G        W          ): Invalid object pointer 0xffff8b05dfb91c50
Slab 0xffffd490857ee400 objects=32 used=22 fp=0xffff8b05dfb90b40 flags=0x200000000000240(workingset|head|node=0|zone=2)
WARNING: mm/slub.c:1227 at __slab_err+0x37/0x40, CPU#2: kworker/u113:0/205
Call Trace:
 slab_err
 free_to_partial_list
 __slab_free
 kfree
 mhi_fw_load_handler
 mhi_pm_st_worker

Remove the explicit free of mhi_buffer so that the memory is released
together with its parent image_info allocation.

Fixes: 2f5ae4827e94 ("bus: mhi: host: Use kzalloc_flex") # [1]
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/bus/mhi/host/boot.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index e1d77cecd75e..19c84913cfb9 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -308,7 +308,6 @@ static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
 	struct mhi_buf *mhi_buf = image_info->mhi_buf;
 
 	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len, mhi_buf->buf, mhi_buf->dma_addr);
-	kfree(image_info->mhi_buf);
 	kfree(image_info);
 }
 
@@ -322,7 +321,6 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
 				  mhi_buf->buf, mhi_buf->dma_addr);
 
-	kfree(image_info->mhi_buf);
 	kfree(image_info);
 }
 

---
base-commit: 702847e8cfd51856836a282db2073defd7cfd80c
change-id: 20260317-mhi-invalid-free-mhi-buffers-ba490b94969e

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>

