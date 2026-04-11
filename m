Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD33128CF
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895150; cv=none; b=S3C/Ko72UZb1UuEI8OBVtSKi0iDyqcDmP8PwTDsJxYNrx5wadciENHITc4JccFL5uflC26lGX9+lTCPLWAHsgQtMu5iDXLrqxedGjBJDFmwJb1pVotWN3o5BjnUiVxw647/iRbyfN+hcP4jz+hv5/KZfvkGS5KNINUSUImSPIyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895150; c=relaxed/simple;
	bh=MA03LnHAjOcvrM5mKxM9VHVgHQ54gpGwmJ8aVHg0TVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KGNFKlV6ntwB2/bbFrI1sgqHpv1Ug2gvDWOfwYlMP2MH6iP23q322S88cnf1aC35fyqV0qIAzDaf3wt6IpoA9SW70IP+yvUrPx/MlOqv5knP//Wjbr+uAeK0475+ooYJ3e4o0jQ0+yEIVZ1mVtSsuVA2KNTBbK8OmbXr7HYoHHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCzFYd9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJODEgMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCzFYd9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJODEgMu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43alL621396
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQs3/vhNVlE1qEYG7AJugEMA0XRV65iB16Q7DxAeW+c=; b=HCzFYd9IdjJUvnub
	/l4LSzoGQC94OgVWsKijUENulihc/wYEv317r9t9OCjc4r/1p+mlI+Xb7QBwSMBs
	aAuPgs1vNcjtqpoqmBrp87WdNMpMgI9L0tgZIeRL+tokyT0FTKwuoXjXjHLBmWw4
	6eyc28zMijgGPVUpFKsr4C2wlCanAyn1kOLyevKrXCmxiTT6Kj6m20kV9z4HPFnn
	dP3xUZkfIHK611kffqMLjTa8gMZA/QK3b7NyDZps22NhA9v1RTkZVB1SFGcqRcDK
	wuuDtWEWX2ofV6eNrrAjp4M3OgkskeDMR/9a6N1TCVyd26DPcuzVhMFbRPyXqwaI
	c5Eiew==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrc4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f07cc6590so1244847b3a.3
        for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895147; x=1776499947; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQs3/vhNVlE1qEYG7AJugEMA0XRV65iB16Q7DxAeW+c=;
        b=hJODEgMuY0sctMNSSfXflRPDFzRAyFoNBj51Frid7kVFqWfnnOqlUL7mmAV6Sr32U4
         SRme4i7zga2AcMRLdPLL4JHZ0CKyNdVV6fBrL6nc23hAvwhzswwRf3Gdh1FXFxAO0rJ4
         8tUOyul3zv+hvtZNZ6u6f/O+QUp/8fIRgbQkBEYx9WzSDA+o5+ZavUBuZa+gPuKZhnrp
         m3FDioGNrPRUMwA3MELyul8cWJN/qxXA7E3t5TJ45Yj4Ecg0qWmQhiSlL53ugymZLddp
         d5HT+OXEJ82L80JWNd6DDLRSx+bytY2HWBRQ7EPcogKMbQOHlb4fPu/rQJl9jxLw1T3E
         DY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895147; x=1776499947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQs3/vhNVlE1qEYG7AJugEMA0XRV65iB16Q7DxAeW+c=;
        b=dfVoYdd9zPU3urIui7w89S+fYat77YtVopXPcIS6aivnGbYBnRzZY5SzIG935VxImh
         eUgGfbXj/OkYEQg3udMCkT2DjcTIxaSDphuvoavbgv2t46nL5VolDntX/DUCj3HyHOpQ
         zfndJFi4ZK+v9cfWGHgct6h30U4SXHzBFnf8rz49maevmtdune1Z27v4F5DEXtLFON2E
         Ys0wpRR2dS62my0OzkCSEMitaMvVUQDLQEcPrxq1pf7oBsMABVaEC3nxJ3Nw19FSXl90
         YdFPSh5CE3fCBnGvsgFmfvGvTVsbakY83rRl3l8EK4EquWTPTRsyO5dmiSLezeqP7a5y
         ByqQ==
X-Gm-Message-State: AOJu0Yys7Ptpd6bHz9YIPTZnvjWZ6ZdsD5bLqjyGn7WhTmM6L9TOtJf0
	C0Ko7I0FT1RJclt8U5PR0oN8+ekToPtuH45PQnxCSFM4YTa5MmwD+ey2BLuRNxpQbp8jTidkDV/
	414DygFMcUdbMN6ja8Gltuo6eMfbS8wmOuHecu0RRAknMMa3TXNQN0iqRalcw3Fk=
X-Gm-Gg: AeBDiespMNoJwjx/dgytaTp6OUyLGSFvP1GASH3dYTCmBBvS6s3qBUXw1yozwWuv9VU
	9cwZoooReTyS2RZDwp84L/4wVAGPyNBauLI1e3RSMoIpMD5wmyUuAUgU3hwLrKHjr+7rp1rlCUQ
	A5yL5qu6iIv9JeJ2dC5bEU/lvxhqFrsNsJyqgOYqjHcGrXy2aRjwo3inbr6C7V8JeSsdCmExgcK
	u5DzEl22X9p8fagMmA/wQQDgswxL+1ZwDhsN1/DLMgZAS/LGbo5n6eYyLm6tWMnUYnJu3J57Amf
	GWkjq7hM09a4LmNAvwijvAltrC/KokdL56y3mkYe/CZ76Ufnqarfcy7B3dreCO5scm5QffVqzDG
	VmTgh7I5+cDLitP8T0cwRUfd7OI/7M7nKv6lpDnpBmhrxWegGdokGEavN
X-Received: by 2002:a05:6a00:140e:b0:82c:6f07:2d8e with SMTP id d2e1a72fcca58-82f0c411dfdmr6928554b3a.54.1775895146568;
        Sat, 11 Apr 2026 01:12:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:140e:b0:82c:6f07:2d8e with SMTP id d2e1a72fcca58-82f0c411dfdmr6928529b3a.54.1775895146067;
        Sat, 11 Apr 2026 01:12:26 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:05 +0530
Subject: [PATCH v2 5/6] bus: mhi: host: Update the Time sync logic to read
 64 bit register value
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-5-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=1869;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=MA03LnHAjOcvrM5mKxM9VHVgHQ54gpGwmJ8aVHg0TVc=;
 b=jRgjuD5LRCxWLZfAioVQJ+gfVkC0jXv7TrTMQtg8I15aCDEKaPfgMlt6HH8QUZOHDugyF2Quw
 UTTkzywMCFoD76x0XNp5OUWSL/sdKmQAZJK/Q/XW7dcwm+ohDWcxI1/
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: weKQ_gggAnqMv4xE5Mxw53GUMaG3FxNz
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da026b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=51wy-JC9mB198bzmU4IA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: weKQ_gggAnqMv4xE5Mxw53GUMaG3FxNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfX5+AFo62K0rSw
 nvs3G55IXNxGHQhG+xYKCBfCgAeyaTI4xskTmEr9bBi/XwAEaFSqc4RZTDXR/DP9vtBdDsf85AE
 LNHtL4yaQj2qiLUPSg9SSJYaYJ3gGCaYsfYVveQvPt4f4mN575pDqaFYroGqYWlKcq/INrvCzkW
 p3Xc2LkODheRJv3ewyYbg9E+G6zhvvK4obml2xpoP2XHtEdJzROCqV7uolxjm/4eg8o3Y59ea6k
 ztNzxy6v/G+dwUhYoQGwYIW7HmBWb6ygdkNXTI709nJchOPq9sl2zdBYOuaz1dhgmZ3ssFRQoqu
 4J09b2rODMnjlIPcCE0njc0CAxl5ZgL620ouMr8eh7Vxkjk7NRS0QCJbivVsL3oMygEjrnSUUkI
 RnVWnzRE+JTyaW4b9sMP/9yp3f2Ra3S2wxGTcWjGcXv1E7GD4prnL0uy4lcXQjpu3BImGVS0YTp
 6MdY4N2D9XpEDWd7/4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062

Instead of reading low and high of the mhi registers twice use 64 bit
register value to avoid any time penality.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 99917593e1da06f1dece7b5b0037c2485953410f..e853419a0195dff4a18123631cb1f74242ab4428 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1643,6 +1643,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 			       struct mhi_timesync_info *time)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	u64 val = U64_MAX;
 	int ret, i;
 
 	if (!mhi_tsync && !mhi_tsync->time_reg) {
@@ -1680,15 +1681,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
 	 * transition to L0.
 	 */
 	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
-
-		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
-				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+		if (mhi_cntrl->read_reg64) {
+			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
+					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
+		} else {
+			ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+					   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
+
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

