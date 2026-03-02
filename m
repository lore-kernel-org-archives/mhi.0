Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38538B7C1
	for <mhi@lists.linux.dev>; Mon,  2 Mar 2026 08:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441783; cv=none; b=Bj4U8XT4FDBY1dxVh6qnH7E/oh0mMyyYRdACsMEPxscdxecruyOBcv52qmltGtS00Mh7RfZf+I9N8YKZaZpagzlY0TYDgzOcCJnCidWVXW1YtkS7IJCi0M4Ow02S8qMO6wX81VHqmUpldkb1/4+olbOrdjxQWB0VR7MHCGTsbSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441783; c=relaxed/simple;
	bh=YSle7age6/sGC4mrbcE1fgXH371qq6gkeUXhaxiCOyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HrK4sF9pSFR72+WEgYu39q8ZON/zSZmJTFpW+S2gWzO0d3eRgW3Xd6L9DvzZXsq1M8AASJ471l7x+2KsX7DE9OsPGKkN9mF1sXGht4EQ00SFcRoeZauAoFyhBHR5rhzxUOX+JOZ8dthfpeSu3LacczYo4NLUQE8cuFX8QNJ4fU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFoyPolg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYDTxTwP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFoyPolg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYDTxTwP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227pmjK2284148
	for <mhi@lists.linux.dev>; Mon, 2 Mar 2026 08:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WApl3fPUusQhgCuPfXm41GbJ+B8rlZDv+NV
	xfvyf6qI=; b=DFoyPolgCp/EYJgTV2hvkk8ihX/ytfIJn6J2abn+QncUKRTGVtK
	ZJaGh0+irgpLI9LzNxJAiQqLowGytkcMZACEy7YbRvUi2yLXgofgdA6VHT0D2egw
	eMY1xNtX3jke5KRM6u3PpNWMHV1E6kQgjRtfK1Zp18uOjU4r9tXUIIxAw8PQ4fR2
	US3h82xcsjtRf7jIrhVfR/ZQaMwNDATh67Koj62swj8hQSa111zk2wdNYKmU9uaI
	tMaH8YqTErI+yAq2e4oy/rwPuEuP+fuxHo8ReRliAFqJCTgFVrctkJesR00O0t8J
	3LA3KVQweNdMi7BviEhGu+6p4Z+Nh6KKP/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq4wh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 08:56:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad7e454f38so271547795ad.0
        for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 00:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772441781; x=1773046581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WApl3fPUusQhgCuPfXm41GbJ+B8rlZDv+NVxfvyf6qI=;
        b=YYDTxTwPvpJxmElf+RbtI5zdWwwQZZIzRVoqCuCmpwWwL66Or1cxFJTIrRJ9f+shtC
         HY8DWeU93WEAX45Bfd3OdtNvUg9jIi1+cc206nGQ+tGh9NieXQNwTNsRh8gh4x3MBMqP
         af1wuQQhlZuoNwkhOjt3nbqhXmOZHnUqO5eylNiCQmBPU8dFmQrB1VO4Cwmwh87Ovav9
         s5FAIJ8jVgo4OkpJ9E3lTVBwws9WuAVoYKnACaaJzO9roxUiSNDlb2P6InApLhSTIrfE
         76JYZnHwsW8kjzSmJWqZMNiNSalAympw985JW1VtvbGbfzl1siLyaSej7Xc+oufFlu9t
         gesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441781; x=1773046581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WApl3fPUusQhgCuPfXm41GbJ+B8rlZDv+NVxfvyf6qI=;
        b=N99s7TovGyy3ZvFJBs43Sv5eE0K2pq6W9vtI57evVIi+a0X9kmXLKIL6rzd5harrhK
         5RYa1tXnI/dBRsQ1lhP9IZXcghu8Vc88MYsBI/rEycRod1FCFM+JKniGTKWtzKVe4XOS
         4GC1c62EX52NW8t2LAtJARolgqkMxUMoOZIKuL7sTcdoHGPxlmf9AauMER3dg4JiUsbu
         if0REyMW0lXNm4oRxAXIywh28b90KscDxsF8IDfcNtaW7iOYx0nZydE3NMm+4hyLroiE
         hGYckR0rkFFkoeno9Su13lBkW78KKb2UelyKzjq1OkQ5n5AgswxUG8XciYRDk47c+Ytw
         ieTw==
X-Forwarded-Encrypted: i=1; AJvYcCWH+MNMxB8RGk7FOR4NzAp9R/u7mbbXyuiF9L6L74hUapm9UZogHNDSDVlnUxySG+bNujs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvp1EpxpxQiimQZQVHKzlaPX0uxeRACjKFIsSszLeQcsEQbmGc
	ad6Ebm8qkjlfVwremJ0PtCpUrHGv92wcAbXNTCYZTTFJ9chnl0YPqFb0LA6e4ooGG5AuB69OUq0
	fUUArU0MT+VYqzT3MwONR9vRHVEAfBzDSamEKt4mgY5Ls+DSVAanyezEb3/bHetk=
X-Gm-Gg: ATEYQzxjxwsPfiYEkqG8h91Vla7rQhBa8Q+7ppvR6cHNPUvqrRixv3WQUJW7Bt3os4R
	kRFiYn31pDbjjm3BQ/S0WF7nrt0Y2AeTiyse8HR2WJ1xOq+OMnMZcAVo7f1xGhOQBFRd6Eg4KCe
	HZD8bpFq274PofBX2BiDGdoqz+jxlQyYvWXqpW518Nm6qHyoX4qmqdDPG33lYQvRQtZOIevKfzK
	hqEphNrzCIX4qYLaVYi/SAX0Z+cvOKm1LB096BqAFEqt7XbxVw86s0AIlH3v6fI1RI5kwla2A1k
	b6zr+QXrHuIPLaa0z5QIRxvkNVoUSL5RR0bn1oiNJ96eZIGvm54A31uD53xK3GRa00ySmWu1Jr2
	pxFsBOjVyN73tPTtUumEt8HygYl7VwPFBaS6C1qVddzz2erU=
X-Received: by 2002:a17:902:d508:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2ae2e4d0a96mr130649845ad.50.1772441781166;
        Mon, 02 Mar 2026 00:56:21 -0800 (PST)
X-Received: by 2002:a17:902:d508:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2ae2e4d0a96mr130649365ad.50.1772441780596;
        Mon, 02 Mar 2026 00:56:20 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:40ee:341f:1665:8aed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590158f6e0sm20781263a91.1.2026.03.02.00.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:56:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org
Cc: sumit.kumar@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] bus: mhi: ep: Protect mhi_ep_handle_syserr() in the error path
Date: Mon,  2 Mar 2026 14:26:12 +0530
Message-ID: <20260302085612.18725-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lBO5VkcF3Unrt-OHKyVVmPF4wgLpLonv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NyBTYWx0ZWRfX6TNYply1eKmL
 fPt0qkcmFZdMIZeOpExrrBGW39s7RbQ3g7cwqPKmCI2DLI7dPkxuZJKH2cSTjtvb7X6HuawLJIg
 AQsP/G1o9elTTmDYBeK0/Ax1Oac+4Tna6iCqfH+WnVunUsh2Qp9Jte66ftqt5m5SDWEh/dtaSIq
 vadPJMZFOXsdBzCva4QGVTAPS33O98cF1+tkOB/niHGHUtRXd3hiFZDts9xKAh09YviDTAeVrzO
 LJ1yptZHU5NJoXudh4XiYlZ0e8Aw30ylkWCCman3M/8jZjZaPCsimKUvfZOc/CBHT5nxcuNMAGm
 jPzAw78fBeUZJFgNbpDK1YUs8YufoiLgBSGrd6xq72+74YIbiPEqE/8KJoQl5X1mX+Nn1EeD6Pg
 lGE07UVbcIwJ8gFwoOuFg/QJOyEn0Q4c9KkCQwMfh47cVkvVXzwee7IbIkkpp0bK1S/mrtsjrOu
 euEbR/JO6fE1ZUJsUMg==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a550b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AUlretI1EePZII7xc8UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lBO5VkcF3Unrt-OHKyVVmPF4wgLpLonv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020077

All the callers of mhi_ep_handle_syserr() except mhi_ep_process_cmd_ring()
are holding the 'state_lock' to avoid the race in setting the MHI state. So
do the same in mhi_ep_process_cmd_ring() for sanity.

Cc: <stable@vger.kernel.org> # 5.18
Fixes: e827569062a8 ("bus: mhi: ep: Add support for processing command rings")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e3d0a3cbaf94..6a6aa2c28760 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -232,7 +232,9 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
 			ret = mhi_ep_create_device(mhi_cntrl, ch_id);
 			if (ret) {
 				dev_err(dev, "Error creating device for channel (%u)\n", ch_id);
+				mutex_lock(&mhi_cntrl->state_lock);
 				mhi_ep_handle_syserr(mhi_cntrl);
+				mutex_unlock(&mhi_cntrl->state_lock);
 				return ret;
 			}
 		}
-- 
2.51.0

