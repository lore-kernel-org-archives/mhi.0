Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68C42571DA
	for <mhi@lists.linux.dev>; Thu,  6 Mar 2025 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282169; cv=none; b=DfU1/ua6ybnAG1inPwFI99kIb+73iYl+baYMbs6U9z1vMes2VE5kFjW18z6QRePLUbv+XqGgNK6fhKSEgROIYGtNDoVojPdJPAU6vyYcI9I2mxdvG5kRAYqd9u+PSJTZwhHdYhoRg5aEyFOaXpqaTyCtzzs41xTN7FNDO9P3hmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282169; c=relaxed/simple;
	bh=SK9/Ohmw+1otKWtlFUlEyMyKbw3cq9qOXkFIVx3zNXg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LrLxjZsANHXxG9c/eqPvj92enc2VXcgaJNKrvPlBhqC+QlAztkTMZg7buvrobYL43sbQ4eE5yHOfda5STlqvxo3kTdjT7TWaKez3WH2jzJ14btWJGceL92O+B9mytYwYZRIT32iJQbS+ZIEGyd5PggIgRVeyqsM9J4PzUwYnfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vmuu9qn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vmuu9qn2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526GB7x0017858
	for <mhi@lists.linux.dev>; Thu, 6 Mar 2025 17:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jbyLH+4nPjH1WJGe+0pFFxnVjJDTttpMkzt
	Llpat8+E=; b=Vmuu9qn2ZS1DIR5h2aZkgqr6zczMm96iDCri6DuBUn6OgE8FEEU
	k2A7wvzcquF8ql1OVAh8UEatVcoidhXdUtTjyovIFIXxJhQUibg73/8GFe6bMGf3
	TOOv77brLfnfT/rsRBfcNzX8qOx7MbbEpGc9HFgBCsfmD5urHx3oZR9hvDB2LdWQ
	AtOHk1F3zvMijd15Dq+MnBOI+C7SgTeagOeewA47FrxsK+6G5xHxQQmDjj+AsZHp
	Rfatf8upIHKqj/5L1Br/ThK+sR4fKIAjuv9d+6MK0DQ42ahTNtaT6zCrtOvUj8jZ
	U0dHqXck+KMhfqncpy0FhTeJWD4CgDaEhuA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45778t9rur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 06 Mar 2025 17:29:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22107b29ac3so14328425ad.1
        for <mhi@lists.linux.dev>; Thu, 06 Mar 2025 09:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282159; x=1741886959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyLH+4nPjH1WJGe+0pFFxnVjJDTttpMkztLlpat8+E=;
        b=JGanhQBPW6RKLAp+ywnxhwfTcb/gO1Y5hpvUvAbSLUv8tjjRKEkOqIMBJksv+FRQt6
         LeM8oo5xegnFnIekBcKDyCNdLldlzUNlMfBENaqRdh/vZYdxy9ZeFSgQ567Jpej3ySGI
         YCRK39mjQPpujFXo9bIlMqbWwr2cpNk3AMgP3WHWV9UiUoSYNHS2ZrICdlUZJgrFHzr8
         Ipjob+K3gd3Veba4QCAMb24G2paT+nXpjvmXrhwyqkcVP87pYM6JNUEVTrCl3cHT7QNQ
         VBOq81quThmPgjwi+yjl+FyQ7HeNErABQ+OSC+o+g7KSsMkqA7xaa6xu0XZcF22vzjx7
         WkUw==
X-Gm-Message-State: AOJu0Yxr0BRfmRt+6L6yCebIFlloOv0Gpkhp0xYZkE80IKUbMAYSfWau
	AbWj1Kn+9HYriibJoaVgWvpN62+fYdL0WDp3yA1IaX4ZLNthrhUhucEJNp64ioSrgsmsq1aHVY4
	nKNmP1HKv6fr1djTT0PuFP9LQ2fWyPIzmDGzHaH8VyfacTBcX1dg=
X-Gm-Gg: ASbGncuiCd6TnV8yDQdxq1L2id8d4ZWFKiZ49Be9DLWGQOmmNyDYjN8qtCSF2Obh81s
	dZdhckEnD92Dh0eg9nLlNATq2WZ7Zq5iOreqyBshXpxzVwu3JUym5yVyh3cG/uYUePJts2X2aTL
	kKIcqRfWfLvXfj2pwzs7xcpZteykaUy3ONfxTMKctXWtX1BKceiO4nqq7riO8ImeYk20Gkx8FbA
	8Z4b2M60v5eUujacFe4C/+c8ujxsTzu3HoVvhtUUMEL6tRq31hVTyB+14BgnffhiVbVhJisynpv
	ryyxfE2xLhL1JXTjhcsgy4T3Qi3kWLFwo8Fw0z/yzjDCTlej2ftmSizdnbEPSxj7
X-Received: by 2002:a17:902:e74f:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22426fc03fcmr5144285ad.5.1741282158907;
        Thu, 06 Mar 2025 09:29:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZy7UmJOU9W+n94KmlMaD1yLmj10UArukLE32E5fXQ6dyBHDxN8x1U3Nn8PdBB2pzgfFFDzQ==
X-Received: by 2002:a17:902:e74f:b0:21f:2e:4e4e with SMTP id d9443c01a7336-22426fc03fcmr5143845ad.5.1741282158477;
        Thu, 06 Mar 2025 09:29:18 -0800 (PST)
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f8e3sm15045095ad.121.2025.03.06.09.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:29:18 -0800 (PST)
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: host: Fix race between unprepare and queue_buf
Date: Thu,  6 Mar 2025 10:29:13 -0700
Message-Id: <20250306172913.856982-1-jeff.hugo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n1wQL9gxjDzXwjNuOIqwXZRW07VB0NwU
X-Authority-Analysis: v=2.4 cv=U5poDfru c=1 sm=1 tr=0 ts=67c9db6f cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=brqu0hH53q4B7AMxx_8A:9 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: n1wQL9gxjDzXwjNuOIqwXZRW07VB0NwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=975 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060133

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

A client driver may use mhi_unprepare_from_transfer() to quiesce
incoming data during the client driver's tear down. The client driver
might also be processing data at the same time, resulting in a call to
mhi_queue_buf() which will invoke mhi_gen_tre(). If mhi_gen_tre() runs
after mhi_unprepare_from_transfer() has torn down the channel, a panic
will occur due to an invalid dereference leading to a page fault.

This occurs because mhi_gen_tre() does not verify the channel state
after locking it. Fix this by having mhi_gen_tre() confirm the channel
state is valid, or return error to avoid accessing deinitialized data.

Fixes: b89b6a863dd5 ("bus: mhi: host: Add spinlock to protect WP access when queueing TREs")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4de75674f193..aa8a0ef697c7 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1207,11 +1207,16 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	struct mhi_ring_element *mhi_tre;
 	struct mhi_buf_info *buf_info;
 	int eot, eob, chain, bei;
-	int ret;
+	int ret = 0;
 
 	/* Protect accesses for reading and incrementing WP */
 	write_lock_bh(&mhi_chan->lock);
 
+	if (mhi_chan->ch_state != MHI_CH_STATE_ENABLED) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
 
@@ -1229,10 +1234,8 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 
 	if (!info->pre_mapped) {
 		ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
-		if (ret) {
-			write_unlock_bh(&mhi_chan->lock);
-			return ret;
-		}
+		if (ret)
+			goto out;
 	}
 
 	eob = !!(flags & MHI_EOB);
@@ -1250,9 +1253,10 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	mhi_add_ring_element(mhi_cntrl, tre_ring);
 	mhi_add_ring_element(mhi_cntrl, buf_ring);
 
+out:
 	write_unlock_bh(&mhi_chan->lock);
 
-	return 0;
+	return ret;
 }
 
 int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
-- 
2.34.1

