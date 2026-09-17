Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EB491590
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628934; cv=none; b=Kh9+dEFJcDzhgmNfaeHIcQ8+aDPdfFWHzdAlx4DoE9c9VC2gwEV+YfFS/6oDezRaD3xeAnn+h4im0C0OJlVgcdTPxRE38iCEAxUAvQevN7I5lSwT9aq05dDQBKqEwIxVN1ol0aagYGLzpcHch3gULQKawIpUkvwrOuT0/vcY338=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628934; c=relaxed/simple;
	bh=PDFtCkUMe5xgCgX5ms0kKIDJuV9MuZTF0CtXgl87Z4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRORGpggxpOlmcbrxL0rjSKOcvLSvdzga0KJtF2XNJt9XWxKIMfakWzX9GUR69Eyk6IghVYb+7F0M8Bw1rBlIycpGSLl3AeSy6zQRX4LIHFs4+N8IUHTbwdth3gTJLrCAz3eBR+4UgeRkm/Ko8K/kCSy0c3XMiOaljlUdY9C3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW44YZoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCZtoget; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW44YZoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCZtoget"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60UWV1211709
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7dL3ucP/imtNL8M2nWHaBKLW8DZgN5o/nieYjIGjzM=; b=RW44YZoU3AwpllwT
	pQCrFOiX60XozoBmw1eJYYb7ZQ0Wk5SXjZ2XAPtk55HJckrPWMMRQGPoX9RFFhdF
	a8ph/wt18EnO7/5L63OruGjTiDgn+hIUzmCY2NZNuj4T2S+7yk338Ii8QeLM864N
	upp/Bv6QkzF5Og27a64k4jgASi74gF3zV9lj2pycx+oLrX4+GBVDzBcaDlprQ2UT
	MPh79tPzebPXyQhdDl6WeB+nKDwkAZDvHoAsa/lcLs6QTA5z6ElSvwtD+FxAqtKG
	rGisxZpunCqQ25GlJV4Gdmbqw1XqKtqceZlTCUEnewl4zNlMOnUHxojv3cjgVoz2
	viINAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxayb7yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so479632a91.2
        for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628930; x=1790233730; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7dL3ucP/imtNL8M2nWHaBKLW8DZgN5o/nieYjIGjzM=;
        b=WCZtogetolb9ZvFt342nUslDcx/Nf7fYN/c+jkTt7vfdjunXivNNR/euU0bEmvEwHo
         L0/6U3PREnjqmf12lF5kpJBzaYj7P0WK8DIWqroC0un1cvqYiy3D2gYjS5nSBf5wRsQF
         M6iKbQnqDXVQNRQOvuZvoZMLT9dT8UXizzP8g9zBcdkURT4ei7JH4mc9Oi4f31xhEspl
         OsbeMAnWiGTI5EXLQPllHEkxBFGoddGVk0JZRo+hLRbxVDBfXS2C2cwk61Lfj3MFMBzz
         XO9pUsih6mG1xoksSWtP9+ewDGcxSSUUTB4dmRnwR1ouGabWifLiMOUNa3kGNV4+/N+B
         uT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628930; x=1790233730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7dL3ucP/imtNL8M2nWHaBKLW8DZgN5o/nieYjIGjzM=;
        b=vAcknHHS9+/CBrrir2XLjXeMptfhKqaunoPIpAZWFp1S55qmMPqKjkY3Fdr02cjNV5
         BftBDGPy7jnKstVzH0XhigDDkLYbHzYelyUkQHKY67j9EY3N1GtxzWpX6xOf2W4Rk86c
         J7biPXWfRB86hbwkuyLnWujEX2mqp1b6gF7wkxnMOyiQkb6zuUyXnXTm9hTmQ+AF5PEH
         8YVDabBq7+DiMrHHN8FPSy6+F6PAhxiedajhdA42HMsgW9PQX3Mn3BW1w1hnVmuYv4TS
         2XyIqoB9G1QIltcErezFnlnTle7K4A89MxznGHNLsgnolrpC5LKsK6R4Ps9GQhljyrIK
         hjng==
X-Gm-Message-State: AFuF++n8ASpADd0W+oV7f3+d0/OX5poyYlrxxpc6JelO/Jc0SIdkpZKZ
	BmrJxkVGe5t3vkjlQkhDs17HLbQNIDVqy0NcY5YfczKBuhe9FBKvw4h3f+WUMZcRwNTUFpmb5j8
	k1JmmOst+OSpn3QERTr5ilaL0fGZCrVkIrLDHIqW5JXgWYto8PYE2LJU=
X-Gm-Gg: AYBFou0HXQ6jsdivxdVvi23Stn4HONyVmjl+jcEklAjA7yuTTYLo1qFlGAwKlp7b4Mu
	Hzp69K8kfByJ+QVQEUWuapaqpHkSyUPDeJNYuvqchfEmfEaxQq3WUTphsInsAIdN/twKrpS244e
	qJTJbrqWaSFBL/Vwef3UjlGDg5eVdvNutZ4Fv56+v3c+SuEDYC3zsTG0ZxdeS2/MDfCh9QjcZcK
	Yj3wuGhiQxFtNiyVnZmsEaWpcKHOTkVMln11vxQrc094KJLoPS0YTLlWFCUJHf7vvKrNR8vFMez
	kmR/jjZAajWaTD/G10M6wdamSclz20gND6SGWrAqC9alpFgML3ByzHpv6k7VOSH33F/EpLbpUyE
	SBuRHDp5xI8QjpPM87f9BPG6D9PnUdbhH/7A=
X-Received: by 2002:a17:90b:3ccb:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39e1e52627bmr13473452a91.21.1789628930263;
        Thu, 17 Sep 2026 00:08:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3ccb:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39e1e52627bmr13473403a91.21.1789628929744;
        Thu, 17 Sep 2026 00:08:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:07 +0530
Subject: [PATCH v3 6/6] bus: mhi: host: mhi_phc: Update the Time sync logic
 to read 64 bit register value
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-6-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=2155;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PDFtCkUMe5xgCgX5ms0kKIDJuV9MuZTF0CtXgl87Z4k=;
 b=buSyD+p+9ce7wxdFM3rWvxg7ISBYYLinSYPJpFZVQ/JTKyPD8HFIu4l89pamZwcXJ5OCHBlsx
 jU9mJ2iYS1iA7Yf4OdTsqm10MM0aO66EN6OZRTSTOs+sENrXkfM0pEk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX3W+qAiyZAbsX
 je4QkRAQOqZc7napYk/emqm3f3e3U/5yc7AORvraNd9AnTyHI+tXO8cP9+pmZnGZYGcIJkJs4H0
 YwzGKI5Bnb2yf3TddZswuHYIpF6Z3Ww49YPYJ1FcI7cs6lsK8fyfbguEIZkyuAcPDdV1PEpL+bk
 CaGs38TMYnkN2kxj+bwSsyzbbWUo2XUEePFz3moME+tq/60jxUilNHwrqJAgTWsuLf1Tlkdzps1
 AfFsOYvY3Mchzeh0++9BvspaWN9hVzTQDGM8WpkAav7EBJ1alTViHUime8tNtBQwRY7Cm4fcDk9
 DMnEI4n5OG1jk9sfQ7OUkGDoEftj9326r9MqvI5VO3U9gDbKhmDNoVMLllHg2+RRYwa8GLqbx9u
 mt0yss6wHTKXVtGN6Uc54f9Aalun0MZV9HWTYEnRC5+B1QmVOLZ5tMv08Bpw1Oap+8Ojjffmdxo
 6cg2FshK2UOEQzYGvbw==
X-Proofpoint-GUID: 3QkINiSopBPmizWf_at-rYxPWZ-qv1Dz
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab9203 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-ftiAGXnolOcdJctExEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 3QkINiSopBPmizWf_at-rYxPWZ-qv1Dz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX0/3sV1jrZVjl
 MR9up6CUarmdNuQoTrz9ja63T4mm92yvsnLmqG05UvWX9rTTMlq3tHB2mMWX4l/arR48kftjQ7n
 gm4bq2B/gyzS9Nl3FP/OwymDe5LP1Lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170094

Instead of reading low and high of the mhi registers twice use 64 bit
register value to avoid any time penalty.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/mhi_phc.c | 47 ++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/bus/mhi/host/mhi_phc.c b/drivers/bus/mhi/host/mhi_phc.c
index 783f05b5d144..b1d10431bd30 100644
--- a/drivers/bus/mhi/host/mhi_phc.c
+++ b/drivers/bus/mhi/host/mhi_phc.c
@@ -57,26 +57,33 @@ static int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_t
 
 	ptp_read_system_prets(sts);
 
-	/*
-	 * Read the high dword twice around the low dword and retry if it
-	 * changed, to avoid a torn read across a device-side rollover.
-	 */
-	do {
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &hi);
-		if (ret)
-			break;
-
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_LOW_OFFSET, &lo);
-		if (ret)
-			break;
-
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
-	} while (!ret && hi != time->t_dev_hi);
-
-	time->t_dev_lo = lo;
+	if (mhi_cntrl->read_reg64) {
+		ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
+				     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
+		time->t_dev_lo = (u32)val;
+		time->t_dev_hi = (u32)(val >> 32);
+	} else {
+		/*
+		 * Read the high dword twice around the low dword and retry if it
+		 * changed, to avoid a torn read across a device-side rollover.
+		 */
+		do {
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &hi);
+			if (ret)
+				break;
+
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_LOW_OFFSET, &lo);
+			if (ret)
+				break;
+
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		} while (!ret && hi != time->t_dev_hi);
+
+		time->t_dev_lo = lo;
+	}
 
 	ptp_read_system_postts(sts);
 

-- 
2.34.1

