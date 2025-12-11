Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BAF2BE034
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440484; cv=none; b=Qx+ldkrlAgsR1h5aodSTDQCpBD/GB+JIC1Yjlx7ShU7FL0b66TnioImpjh9ZRP+6PTeDNugcd+vEr/jxmdJy2QQwWO0gtZo76IKfsYfYcoMS7g4kSUQ8SVl2yY7W/RkY6Blkbk1Gbmegs1uJKZYgOapXEVJrzw4kTRu61O5xaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440484; c=relaxed/simple;
	bh=sVj3mprRNG6drvaDTMIVs+xqjZm0zjQKaIX4lbi1mc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLTXIgbYrlAo6mJDJMZdTiNYChXHS6Vld5Qze9FJxScrCXjdsPL3iKqXHSijYilYLQLZbnr63cCOyTYTXnglUnwHroT9UMN/gsJw4tpRjeugGZdJX9ojVe/YGkLAPoY3yQtQcSJPGOoZ7HMpYTJdgKApd57v0q6UJMmiAhdTnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0X1IAP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lxs56dUD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0X1IAP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lxs56dUD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB6PqTB466844
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nh63pXsne4HVRwlvGklgIqjuPdur2YImFX+N/fXhtUs=; b=o0X1IAP94WVfXO7r
	sgiVEYZhh5uhyZxVsmZ4BNLhyym4Wfx3xMz1vRa06QCZqHcfYzVrkiXsp7tCBtDg
	eiWQusTj+MMqA0MB0UJWYGIyv3CBi3SB3zf+cBuxfkXZ3eq/svrrJkJvaAVt54UL
	kSrvKgLYwI7kkoD9o6x+FsQs59jjaP0xrQckqP7l0zgM2LW24Lys6L+iMCgaO0BJ
	0RV4x9pzsOnuPSjRGEhcpYabq/fxOCCmfHWjP05F/RHWzbcZzw+e3FDG7PnFnWlq
	VtJ8oJyA9zBdjShk0gmUhNrXQZ60qeXuidlIyMWsWM2mrloW70+MvbCoFlpKL8KR
	yi47Ng==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayrpag8vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:08:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f21951c317so668933b3a.2
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440480; x=1766045280; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh63pXsne4HVRwlvGklgIqjuPdur2YImFX+N/fXhtUs=;
        b=Lxs56dUD5IddNSEex0hptCUrQL/It87fa6o75dgixEmI+96NNZa+1EOA3YimMQW+lL
         AVaKy9vGb/DDFlwfCLe0DimR+U4/140HREOIe/ivyVOrmhe61J5jGUR3yCfDMwWyiBAe
         UBzQi+2e5RDWCwOASH2X9dGKPcKbEvtwEQsxMOBHE2VXCHUDXuqEJqx2KySdXr0xZtEu
         ZjH5xy/zC2S19rkvQ7PQd8D0C8Jz0Msgbttjc+jOXBZhXPs9x+0XT2bX5FPd/VpqdTwS
         HKM4DjkkzPv816Pu1GWL9exG2t40g4g3v6+hnkgwp+hHuzdhJb4CZNfp7upepn9tQWt/
         hD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440480; x=1766045280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nh63pXsne4HVRwlvGklgIqjuPdur2YImFX+N/fXhtUs=;
        b=N3Bad8aS62ptSN0rIBjD8p2L8IDSfIb1hYKkVhuhxGuE6vc2RnSa87z/5tP8B4Jmrc
         ypJY+nFlz7ANolKwK8lkpwuZ22lb1NjGnR2mU3YNcBOEfPypPjlQ4c6K11+rKkb8Zcdy
         ksfMQTtyj/JPbI0KjF4TerTATX4zUxCFewXkbzaJO+SWnDyU11sil6btq9/Krv51uRXE
         gURQ2KzNAVE4CZWUAXk+d5aN1HfyvHRCZCJa2JePC2b3MOns2Nz2dJrPCuwCU3Fwh0XK
         xD4VgfWUm3MLYSWOjSR7kr5BHb6VTyATUYyg5FUxOBrj7ef/FX9jkFPHb4zKtiVgdAjv
         ssNw==
X-Gm-Message-State: AOJu0YwsvUVV9K92mLTedczC1r5cPirJrrVz0mPB4kP0UOBXla93VkXn
	C41DWZ1K6WftMnZ725s+CVnH2gqwikDKW5Qj+DGG+056jjkQV5614D4nFDzaMLRy6sjq9CcEQF0
	WHTl2EhqOIyUxsRV8Aw5C6vIN8IvXXCTyHbE1Ots9ySWTCScl4VdSF0c=
X-Gm-Gg: AY/fxX6zrAHbjqTOP4SyP4N8mDeNkQDNZNqsUAfVwtKtBNnfO3B1nc7gwxickJjPfrZ
	e5GEdPgL9AsW87XVDYtDaq0DYJiF5Vn7ZaVroQCAAkD4A7isAY7rUaHjTdd6zW+zmDI/HZ2L2ij
	GxYn6TYh929I2ADgtotlO2T4cYb8VeYL8UoJhEv6y8x3qlPPqV3U7uXUmpvOQ+j1UZ2rRCQZaQH
	7IvpXtGGDov/8WfJKjPC44i03waHqJGpx6O1lgsrdi2YbMy9tQEC36YwNJ0QYyNnYEuXeX7LXM7
	0tl6g+1pAtkd6NsZjJxoiisjLq7pU9JMipvpEs4gghhQJde3VorGF8KhQm+5QtuBCgps24tzOe2
	ij03WHfbs0/eHj6C8VM6wCHj3s08+cbtZAQ==
X-Received: by 2002:a05:6a20:7291:b0:361:63eb:d024 with SMTP id adf61e73a8af0-366e170d283mr5379583637.23.1765440480331;
        Thu, 11 Dec 2025 00:08:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0fZlDZez9eqWc3Zg/NtCewKDhLdcD4B6soIfEw6sCVczIqjxToXsJ9htwhWz+y8n4ik6TLQ==
X-Received: by 2002:a05:6a20:7291:b0:361:63eb:d024 with SMTP id adf61e73a8af0-366e170d283mr5379548637.23.1765440479836;
        Thu, 11 Dec 2025 00:07:59 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:59 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:37 +0530
Subject: [PATCH 05/11] bus: mhi: host: Add support for both DL and Ul chan
 for poll
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-5-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: t0Rstf74GKvFygxLuzM5_uHJoGzm4ARq
X-Proofpoint-GUID: t0Rstf74GKvFygxLuzM5_uHJoGzm4ARq
X-Authority-Analysis: v=2.4 cv=G9sR0tk5 c=1 sm=1 tr=0 ts=693a7be1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RzC6bOiaW50bpgbzjqkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX4jIqvr72FgaQ
 9Chh9XCBhZeXeDV7K6MiKpaF0ACTVVE28Q0KejjJueesGLqAk0Cjrj6h0YMmYqzaBvmfitULtNJ
 AQCMepzTzLQMPEijFqBf60DYeoL9JvOL38sbzVfnUwu8M1yb2qd7xnrxJWtM6bR8sXzXhXvz/9C
 8DGTOV7SeRZ71abnPOolXHdT0Wsq800JBtvZVNSRDTCj4cG0OV+njEsr36u/KS6FQI0j/yBuuf6
 Ay13A2cXdKkbtLn9fe1UtEcCBcbojxPl3sBEoo36It0/KCFdRqBPHz/8NXczF0YHmh9A7ipzGpu
 JxhTP5rO8dIfctfA5P7oQWsmbEHNYK3hzTeSKA0mCqYwLIg5EHE0+lN62DJTxPYLYpH3kGqsTKg
 +wFWxsFS/h7J85A/gSvlQkhCna1hvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Add support for both DL and Ul chan in mhi_poll.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 4 ++--
 include/linux/mhi.h         | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 5d50f6ebf6f9..53bb93da4017 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1859,10 +1859,10 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
 
-int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget, enum dma_data_direction dir)
 {
 	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
-	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan : mhi_dev->dl_chan;
 	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
 	int ret;
 
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 360770ddef70..299216b5e4de 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -780,8 +780,9 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
  * mhi_poll - Poll for any available data in DL direction
  * @mhi_dev: Device associated with the channels
  * @budget: # of events to process
+ * @dir: Set direction whether for DMA_TO_DVICE or DMA_FROM_DEVICE
  */
-int mhi_poll(struct mhi_device *mhi_dev, u32 budget);
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget, enum dma_data_direction dir);
 
 /**
  * mhi_queue_buf - Send or receive raw buffers from client device over MHI

-- 
2.34.1

