Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8F47604B
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628917; cv=none; b=Vv1l0EWHBIrKa7RzHN5gIsQ25xS0tVsvjUtf9BLtYfIQSD82rPPr9zqxnN1KhZbSXf4jBo01WhkLtHjQWkkjOVElRAZvWiwJohQXg1/NiWN2Qj5URgKctRE+hqEPlXUP3kCmoGjHU/ULSn4quaGAqFWJsUNxn998mKYwoeTraE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628917; c=relaxed/simple;
	bh=+JeOcCKCJT9TzZJOqCr35ckMrsBUUbL5W5ule19GD10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFod9iw+2OKqBhloGthMmrfXekFPKzcAAGrJDRaa93+gj1zDJwALf77+Y3SBO1j6h7dcI1CJNqwcUdr51nfGpovSXegEXeoXtnbUCP+kwz/8meXaw/YC/vynQk1G+kvQE6B+Z5MnPPr8uVKtshpKUxX21WLe6WItPQlvc86cjnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvDGX5jE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wj5d7idJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvDGX5jE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wj5d7idJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61GOW133171
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvKzqYphaIeLTQrNu5cABi1Q09xRTU6c92RkEhIvSW4=; b=ZvDGX5jELdG/1TuK
	WedbuiquKmbLPNq2yz8NBFSwany6WnHfJrXVXvhYONvjE3a3ujemYddOM8D5Hbx4
	zLnBS2BoUc2wHBPOjOkieI/KrqPv71Gkca0tZ2j071ufmbW3egtug2XCp3ANWo8o
	6oqMkoloXaMqDGvd61+1WlgQ8MFm3iVgqXq4QxrODmZMTorlyhQYOb726SKkDiY1
	hqeXbevjeCCVUqP/Siosp8LsGiH//PRbh9LsA8xQbMAhkfcJ9C8X0d3V/9zRvSOR
	4moZLGBcE3dWZ1c/PuGc7ziv70gK6VqMEfc9PrAsF8ezAEXBDZGaiIxYzNaQjCvB
	M6+d2w==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn549mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 07:08:34 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bfcf73dcd5so728106eaf.0
        for <mhi@lists.linux.dev>; Thu, 17 Sep 2026 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628913; x=1790233713; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvKzqYphaIeLTQrNu5cABi1Q09xRTU6c92RkEhIvSW4=;
        b=Wj5d7idJOgw7h0hX5h7d5qzUnQJF6JE0nVdfHjRhgrh3/zwptPzyKKr29oEP6TJj4D
         0YgZJS3ET6l4SGhVU1rNcisGWByMtRcGYwdLMnzEEuoM8iS4DIIyaR/aV+HdfEKp3HbQ
         DIjhRmIHR4jDRg1/CoGsVZyLa2RsmAV4O27Qzl6FvZlKj8RJ3XldJApJx3hi2f1VVrG6
         ODKhw0LbNeF2E+c4kS4M9zXYofslWHvyBizeHBrBDUHKf5msvlkOK+yioJaYVWazttwf
         Cr1/ZffTcM9vXvg3t4JcTKSBn70MSgCdfNFjlWp9FTjo3snV3e1YTfIcYQVa0KwsHEUp
         CI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628913; x=1790233713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvKzqYphaIeLTQrNu5cABi1Q09xRTU6c92RkEhIvSW4=;
        b=B/UYhdl2Hc3PzolC6PZ4fmaw6ppiw9BI+tapuZFrngAhlWzpkoLdkjZ/lgxrKSlvmR
         vO4czRsnRONuU5odnlTl2/jFhW/feu01RHN2qelpwQNy5f7uJGUiuV5hewaXMq53hanM
         SsCSAyYZLPv/DKTPOh3GUb0FIq/RictUpKi51NLjjI7DDvP2TNYh58XbxdjFyIbB0DOf
         kpPFFcrQp0vmkEjoh1o4EQiyZKny9nDJ1xwAcwpk3dR0JmARktrVV84VHA9O21peEkLN
         1g5vEteUKFQsnzxL0Sw+on5wNICNCaed2s3Zdknjmeb5llxrkh4sA108OqfWsxNrRnEq
         lotw==
X-Gm-Message-State: AFuF++m3mypY6vJBZqTg9IfBrZfsi2j0nTufltEfEeR5+7MdYSe26v86
	qDbSmmAHj3wNoXIMknBS8PrlSOz0qZdRK9W+l0rC48ck7VZ/6E9A81tY3VS5F9A9TvofLdrzgRw
	xlPz8pTX8cXQfRtuPX/ySv0v8/cIiMuV8/r4KG6DIgGCbwvrLGxc0dkw=
X-Gm-Gg: AYBFou3MFhzppeCfowE0OAw2+xlWkFOTpZYuJn6J0ZxCVmE1GkHQ4jMJ842DhMLChKD
	QGWXG35OSlCtfKPQrkeJi/bEs2rrOTKjx9qhFL3XK0bqr0qHkL+cXziSl7cRZRpVFnDxuLTppbn
	kK1kHg0/uZtdxfu45bbBmw52nAB7U+vh7+YletACA9YxkHCqVn89D9x6QK8iCI4XCpd03ukyDNd
	id48lC2Zki2Ca0fT4I+iQ7ApqiGL8QGZaMBGxpq4CrXWD851dOG2Rrwqh1o/m11YvoAH28TcHAo
	XmrVfbGrAcrhYHxZMbuP4ktzGWimrcs/KdpDVi14tqBpT+5EeJ010bDLjPcRIKNu1l8mg1+P8Im
	CQYb0R/NSQovRlmB3cj6yVqVKwTp7r88/lH0=
X-Received: by 2002:a05:6820:1899:b0:6c0:66ae:ba91 with SMTP id 006d021491bc7-6c7d0ee5129mr4794613eaf.28.1789628913551;
        Thu, 17 Sep 2026 00:08:33 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6c0:66ae:ba91 with SMTP id 006d021491bc7-6c7d0ee5129mr4794593eaf.28.1789628913142;
        Thu, 17 Sep 2026 00:08:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:32 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 12:38:02 +0530
Subject: [PATCH v3 1/6] bus: mhi: host: Add support to read MHI
 capabilities
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-tsc_timesync-v3-1-6826d5d2d527@oss.qualcomm.com>
References: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
In-Reply-To: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=3082;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JclDFIoQQmU13ybasYFbXZ7aKUGUQ3PPLi7vjPeAauw=;
 b=dWhPBK3oKBwqaXPL4W4EjaTr6g3gbUYII/k9qYfnqAqLMsDoscAd2NEWHr7hsbXw/7d4ln4Ny
 PZ1ugcCeg+KBXaA9KkDH1WFik8LwsAQfemljUID9++iWggEIW7HuaP5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfX17lWJt2OjCXO
 cbhmf64YzO33YtRDDn6Ji56nl1Gvpi3CZebdZHvf/oY0QxSJIhEr8DWBtCbpDLF3USEWitW9UDn
 xoNPeOFCmUL8O+3qY1m8fMdJzg8CmPqWsZmQLdxLCGGFwYackRQ8pSPfzTkWFJyiiSncwo0w6d/
 Qq6wp9b9+YaVNQXmUUSsDS7x6+n/tu/Y2ChqQ4EPt89qNaQIdF48iBsLoRMP3rX7hsyCo2Uy03L
 Bl80OpAdfuQo4WP7pfJXO+uO46rn0FOMC4davJvMLd1WkmLhfyJdcaPlSQ74s0nbaWEgfxKB4pR
 8BII2W/bJyVj3VtHkclmWg0ScNY+RgnoXtO5bLGk8wF494DnxWW9BQmc4UOwXHYEN3jtNvzNUdu
 keE1AjjYqpFPNqidxE41jCDhERZ6XY0ibI43LvvzXOppEK5hwsO9Ud/hdOzw65VaJIxyW0fgOOk
 DnSN+SMKsu+LbbS7eQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXwqJFj1nhWFle
 WuvfhjAUC5EgANFMbJG2CHgMGzG+jLX9rGLMw6jJ4GXxUDo/Penc7akRWJDh+KRz3HOQXGEGUuP
 7OzHAQZmhY5R7a2fxUBEB1v7Of/3IZE=
X-Proofpoint-ORIG-GUID: nvLEPjWFdjH42fevjTco4gYMksQDU34m
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aab91f2 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CnzCB1l8zP_khqs2e6IA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: nvLEPjWFdjH42fevjTco4gYMksQDU34m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    | 11 +++++++++++
 drivers/bus/mhi/host/init.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95..4c316f3d5a68 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
@@ -204,6 +208,13 @@
 #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
 							       MHI_PKT_TYPE_COALESCING))
 
+#define MHI_CAP_ID_INTX			0x1
+#define MHI_CAP_ID_TIME_SYNC		0x2
+#define MHI_CAP_ID_BW_SCALE		0x3
+#define MHI_CAP_ID_TSC_TIME_SYNC	0x4
+#define MHI_CAP_ID_MAX_TRB_LEN		0x5
+#define MHI_CAP_ID_MAX			0x6
+
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID = 0x0,
 	MHI_PKT_TYPE_NOOP_CMD = 0x1,
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index fd3050889412..7ca2fe48c9ac 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -465,6 +465,38 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
+{
+	u32 val, cur_cap, next_offset, cur_offset;
+	int ret;
+
+	/* Get the first supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, &cur_offset);
+	if (ret)
+		return 0;
+
+	do {
+		if (cur_offset >= mhi_cntrl->reg_len)
+			return 0;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, cur_offset, &val);
+		if (ret)
+			return 0;
+
+		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
+		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap >= MHI_CAP_ID_MAX)
+			return 0;
+
+		if (cur_cap == capability)
+			return cur_offset;
+
+		cur_offset = next_offset;
+	} while (next_offset);
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1

