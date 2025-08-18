Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F027C842
	for <mhi@lists.linux.dev>; Mon, 18 Aug 2025 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500185; cv=none; b=Y/7rH5goKUknqGbgv33R1v8iVV+jemZ7N6vyJr4xw9U3JFlQ8yta6U0tbu3kyYWIy0bNu94kYLGyckb1unSbYepI293osXUVlHMkrLNOZ+L1uJLhMLq9A/lvSXBnIreOta9dimbm7At3k1+VNR8GeGVB9NxYRlAGbMuHIJ11YvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500185; c=relaxed/simple;
	bh=VRKkJyPIHYb7eI+77dobbkoEosf8XwqEXf3P34a8jG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZpYEeucU/xkqIqpQckW5P2CXGSVrvNRfO52xzGMjMJcBTLWCCMquk0ZSY4VePvuscxVWlr/FrhKrYC9gus61PswK9DX6gm68Qr2aF+DYctlbTSgZDqNPBbod13lWhhLk9iGnrI4ywqSFFDJOTKrtvahCaKDCqpv5GQhxLV+hOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeZLdcd6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeZLdcd6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I6c6JV007903
	for <mhi@lists.linux.dev>; Mon, 18 Aug 2025 06:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqJ0pd1cftmxuJoM3+8jxhExU4GWVeeNWMlPt/Wsh6g=; b=OeZLdcd6mipZH84b
	Bze95LSpZub22oaGvk8PCHYPM2ICddEdVH8a3tg8tbaUQYeoC42gLAS6Xo8z4yat
	EcILVpt5faJ8P3tIVMAn1tpqgtgtWs/kjYud5wkLFtw6JCQoiPmOX+21+8cETl/u
	GfNyOpuRCQcdUaGiA1kV1hqZ4lV6QIQonqpL8BaLqcJ9x8gAq1pIvlQeJKHuzxOT
	rAqxIsO7QeYTpxgzVWfj0P9j2AmK/xNQxGwG1MRrnXd4MA81mLhU1lYpDn536/y3
	3LTig5RmE95x3ktaUjCNG5fnXKGwOd1iEyrLeZyWm/o7QxRcTxj7roI7nNITIVmI
	mW54vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj743jpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 18 Aug 2025 06:56:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445812598bso104305585ad.2
        for <mhi@lists.linux.dev>; Sun, 17 Aug 2025 23:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500182; x=1756104982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqJ0pd1cftmxuJoM3+8jxhExU4GWVeeNWMlPt/Wsh6g=;
        b=QUphxl/DBefTXp/8KtoxT4iRjlYnVefxNs567p+Jr2fa1vYFzmqlFpTuFS9Q+BjZyC
         Sr9oVEizuIJIRcY+ICiSWv002xI49jW8UNx2b/C1OXrqiwcroBgghI+luK3UuSQfrLIC
         xhqJPUKriGdXQo+1gSo6plXLixGNvARRVAOsyl7h8rpugOGMF4fFTXCJx7vVRaFTmtnp
         72+C3Gs9h+NKHsT/+O+edcAS2fwW/bSn3SMGLSX6YJJwKdpzCzEvXT+kajtQDR4kLB7j
         zIdz5jccuWCUyILu6IPLVldP3QpivpRLqDPJobvnEBNcQXad95LpazsY6oVySlH+6/fY
         3FFg==
X-Gm-Message-State: AOJu0YxUYpXmRolDhU4MeDMhpoV7uP7MSLtpqL4y0scmc7u3Fb/NJa35
	dZs88IQA7d/xfYCqLO0oFYfrHY35WkEDZW/6f4r6TJ2hvoiFP1VNA+ukxyHhVilR+9YMxiujRKm
	iYVntuMDe2w87jWWvhI6QzU13snKsPV+JNOJYFekBzEdaDIOZkM1zmbA=
X-Gm-Gg: ASbGncsVqWe2MVWg4ypww0ZW0eulEYYMb80P907qaQ53WlBgN6TposixuMWaFL6g4F1
	NjqbAhtr4orw0h7+n89M8hyBEukQ1DUszpIiOAQzEX979aXTPYYSPzPam2QJzlEJFGCn7IyeiLl
	gnG40nA7UpqnntBJiIdFNQh1ofD/Nh8LIGkDFOdfacdhdyz+RWvRo56Do7DrhhYeLZyDQuh8pn8
	8S9cFpLEExCEzmBcnBaDTDB6q5FizqJSm/v6gI8UqvFmXEjuEVVcvmIidGEw2dd+e6GEvejEyyf
	Hu4Iy5TJZ3WReE4/+zBDbdaMumuSy+YeVcjhKJKfZla7/NLstpBuq5UiPqCDxD34EG482ery/LI
	=
X-Received: by 2002:a17:903:4b4e:b0:240:9006:1523 with SMTP id d9443c01a7336-2446d5ba0d4mr136433715ad.10.1755500181740;
        Sun, 17 Aug 2025 23:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETroDxJYGIyIPvDwM5oImCqL+/zZSX4gJhnhKuXRgaJ/nVRPOgHpZ97wp6pTTUeuLGkE9a5Q==
X-Received: by 2002:a17:903:4b4e:b0:240:9006:1523 with SMTP id d9443c01a7336-2446d5ba0d4mr136433505ad.10.1755500181304;
        Sun, 17 Aug 2025 23:56:21 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm70240105ad.75.2025.08.17.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:56:21 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:25:49 +0530
Subject: [PATCH 4/5] bus: mhi: host: Update the Time sync logic to read 64
 bit register value
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
In-Reply-To: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755500162; l=1864;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=VRKkJyPIHYb7eI+77dobbkoEosf8XwqEXf3P34a8jG0=;
 b=ogLjc4Nt0lyt61XbdjF9grKAQZjNggEwG+U62zk8ksA8Di1pRTHGwXONGGpX+RfExLKWxiyJo
 UXgpiO0FlRrCxpdNriEnm0pEngHx+z5oU4KaDHbANZgcvu1xHNs/J56
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: EJrXd0MGA5XcfgO4XQVMxrEowe_G8o5T
X-Proofpoint-ORIG-GUID: EJrXd0MGA5XcfgO4XQVMxrEowe_G8o5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX6kCBxwEVCOhX
 iKYAJgfrJF5OZhVumwIH2B+npb2c4HlVDOs8SOSTcLmyhZRiogl6CufAzsutBwJ/r2RXMyfl8yx
 xMMVZcmr513Ac85rSVMU5y7ywm6QDpRF7XtbuyTtbETSPp6Ss2yPJFpBxfkxfLpB8eu5tiTyJbM
 S0YTW4SGlD9vsN9SRgDIfbU3OGBFU/o+lrpjNylaRZdzyxU7aFCpRMBCjfhU4Z2plbJ5EcJYF6K
 CkZutogPe1BYnYYBUlCPr+8qOJL9eg3FrIDHkqgzoHkL8b8hGQ8R0TyUs22f7mdXioxlUI7pXiJ
 cufkwgzIySUclZYS+LHWwnalA3YPcw1mvr30Xez0l4ZyKIUcphG8dsz9j7JPRkX64FlKaMZsHHk
 KfuBiEg7
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a2ce96 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TFScpXbSeKEp2Eh2D0gA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Instead of reading low and high of the mhi registers twice use 64 bit
register value to avoid any time penality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index b7ceeb7261b708d46572d1f68dc277b6e1186b6e..f628198218ef9dc760bbfc3ec496603d1a45dfc1 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1719,6 +1719,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 			       struct mhi_timesync_info *time)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u64 val = U64_MAX;
 	int ret, i;
 
 	if (!mhi_tsync && !mhi_tsync->time_reg) {
@@ -1756,15 +1757,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 	 * transition to L0.
 	 */
 	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
+		if (mhi_cntrl->read_reg64) {
+			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
+					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
+		} else {
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
 
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		}
 	}
 
 	time->t_host_post = ktime_get_real();
 
+	if (mhi_cntrl->read_reg64) {
+		time->t_dev_lo = (u32)val;
+		time->t_dev_hi = (u32)(val >> 32);
+	}
+
 	local_irq_enable();
 	preempt_enable();
 

-- 
2.34.1

