Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3BE3264E1
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895144; cv=none; b=TmaD/E8RAd/pg+KcyPIFPwybxpOi7Z17pLraPMFIpMWvPm/JSsKaCq2U519pXMGvflgVv+bZpjznD78pWOnxMg+lVFssUK4z7HUDARKg0HJfi2waNdLOFUQszP1Pyg+Sets3i71wlI5zY0TyLWFnqe4Bakg8+fFvvhThtHb0aPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895144; c=relaxed/simple;
	bh=NyETwHthdW5B4gJ3ye9zxcWBwoooBXNdw7NK9RAuONA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNsu3GPht4pdhcFuRmcfIe/rb94TpovVykWtgYWftq0yDiR1F8ehQrIT9bTt+ECZKI2MlqvT7oPO7Ik4g2x+nJvt854oUhAByCgY8alevhO2zViVcbmhbPt+0d0itnfsbcc1QweFc0AA1/6sOAbQ3pA6oQGI6EfQb1OKr9IPEBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z60BCNC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAsG359P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z60BCNC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAsG359P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43alJ621396
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSARH394vdmTGRvfEuayVkMEZyjI7Kf27FX8nEqxTwo=; b=Z60BCNC1Q3u77yho
	9crAJKE1Q69MsvNOEZChw76YTv8tyWmXKvUWdgObyYyBUclPnwkezIqOqN8bRo01
	jXMA5/kBcw3F+nKgFbPzyyoVy9XSrGNW+gOlpUEBZnzFeoLByPGhyvV3+DXfPSgV
	RfE70zLWS5Vx8Vmokaye85onJ90tiyLcCVF/+hT66nktAaT2BMtzPiP0dgY039e+
	5uusJGTxZTT3AMC1vefgvqswu4HcT0r/SV1EfYdcuC+JO+n3eUX/lZTvVHr3KwYK
	+Z6tsOGQV79hrWb0aHgG5zPVdOMOE/hFdSjM37INtGp7BFEmmIFA9Cfhf6jXw4O1
	+D0j7g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrc45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741f038f7cso1722473a12.2
        for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895141; x=1776499941; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSARH394vdmTGRvfEuayVkMEZyjI7Kf27FX8nEqxTwo=;
        b=WAsG359Pd9+VC0/MRj2NTKWvyoEc0saUt6UFRMYceTg2b4PxAELp3SZoJT5JKQILb7
         o4YumPaJW6WiLj0sVBkdDDJzS1b64riF2Qiig+XqkjxQ2mZaGXn9HagK54OOEtU4e57s
         GDiUwW9P9b0Z6hFAPqZtSmawiqO5WdZnlNUBrb6emcAGLC4KQAmeO4D/lTWZu5Xk+EXz
         D5+Iph4BvFyCUOeyzdNKBllNHYRz+8Aa24ylO2boP+3RfJMeFVBbJ6N95sFrTKIsxUJD
         47zLFvZt30jOwztslreXQ6UjDA0Xo+TfZjfjLe9EkgOMHSocVccuzkR47k0Vl6mkaIdF
         ufsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895141; x=1776499941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XSARH394vdmTGRvfEuayVkMEZyjI7Kf27FX8nEqxTwo=;
        b=eamhZgqPaNk07peQyCPmlTSXk67PP+3N2FD+eqCe8K4rT8sVvKsk4zQz0sXFe2abyH
         3LBhUQPfKsep59h3P6+fLto+wXqREHH+gpA6QEqB/eS/z6L10pWpQfCHQMI7/mqAH9uO
         zK2HlqtHuCVyXQGMZKJicpQH7DGjI6tJcPbwReH7GL+31dzNxASvayWnTjGqkGB0Al0w
         MUMQukUKwWt3QJG3By+JkScN30iii493OYrDUJ4S4O+48EFWixNMy2ITZ6nxxge65Rc8
         +vdHYKrdSyMPcDLOjnjQDEWzwMU27SS6y4PtwvQW5xl+mOf9ykuSZ3p5cx1k7uI8iFj2
         BffQ==
X-Gm-Message-State: AOJu0Yw1HSwC5NjySRxbbyD/1ple05gS4MnoUJbPBe0qPhriteWlvIHJ
	/x1e64yOvlgrK6IOgX3ndhjD1pCg2iQoIHUo1dz8tf1+/vW3JkBhEFvsP7KuOz2STb+I/eA8RY3
	h/jo9VOEJkUHhfiahCD/PPslQG5a4NRRLnd/9fC/cmmIewaCuiwya/yuBdblgMWY=
X-Gm-Gg: AeBDiesd1vBsU+12sj5LdVvJr/O3gpI8cEDgPvgNXKXhlyW5dBS7K7ZC7I7CiJMf434
	7C9WfuDVRwXUMnHKKXBe78fata3V1MuC210jDSNGq5KRtbp339sJ0EE/q6EmOLxp/Va5T0flmAc
	y1n9+WvVOP2yN4WJkiCIwg6FA6kw20lBrQsGqRucweFViVimCXk/k5+ZhE9Hppf96LFFDWD8Zjp
	nUsQ2XZviMya6Zk235hVLAp/X2+0oKnQ9x8JiISeKFaVZOwIlDZmSb+jKeaWalhlSNZXmtWqMWm
	4N6fzwH17ZsMMiARt4b+O7QxWveXdrPEjJteHTe+nZb8sA6o1kaMKpaNJ4WnNNFclSNE9mvK52q
	JJvpMwKNRj0oaIrSlaLP3nmoK29xLF7s1vqQk9tSCpqAoVQT7bXSwkV8M
X-Received: by 2002:a05:6a00:bc0b:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f0c1880b9mr6659871b3a.23.1775895140736;
        Sat, 11 Apr 2026 01:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc0b:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f0c1880b9mr6659854b3a.23.1775895140289;
        Sat, 11 Apr 2026 01:12:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:03 +0530
Subject: [PATCH v2 3/6] bus: mhi: host: Add support for 64bit register
 reads and writes
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-3-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=2553;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NyETwHthdW5B4gJ3ye9zxcWBwoooBXNdw7NK9RAuONA=;
 b=fzBR2FV+F3XnecGKYRPZlKo0IWNSLXZs/Cz9LeprB0uOkdNN4mKqj1lNnk5QyDox4nicuKvMv
 8g1HHNhdsNABQD8a1WisyzGiEY040BMRRNjF92CJ4fv6nhTORsow/mr
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: yK-AK1W-hKClwPQ5q55zwzJ6SjNGLaC-
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da0266 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yK-AK1W-hKClwPQ5q55zwzJ6SjNGLaC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfX1/24U29k5ELB
 yM8AX7S52qfd4P3akVh/FEcz6j+qCoj5qvcwGwPUPiA/WN+2/YXEAUYunmLUVT+Gn7b//8h2uu1
 sehQV66ayjqMlvs1S04eXqNY/7xjwfvkmzU0D5pESaP51yal55Us/g1e1xiywvOgqNNN6w9oZAO
 bdKZhhlV9ZvV7SorQyh91B3Y/bMMv8LViNwh2nzzkOEB1h5BbH2wkLdl3Rn+Vlfs/klDBLTx6mO
 tnVks5Uj89hrgp4mP3qvSPqRtkwLpB60wPtOkboYShqj3tV7+n+b4foRLz+NQ/5+d/LRPuvmCxf
 wJpQFXTYA52mL81h7Xs/VXx0eL/GNJ/LaZBL1F9eZosRpU7g33qNoA/bO/eA02H/XEy/zs3VRHx
 uG5+MXOluRXYtobki8MhW8M7Ck6HF0/iKRhrJxfLIrxkSLGNYsPQhlrhXUb0yvoIgSNT3+SLdQe
 aGZt8+SWpqs7XJCWtTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110062

Some mhi registers are of 64 bit size, instead of reading high value
and low value separately provide a new function op to read & write to
64 bit register.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 12 ++++++++++++
 include/linux/mhi.h         |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index b7a727b1a5d1f20b570c62707a991ec5b85bfec7..99917593e1da06f1dece7b5b0037c2485953410f 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -67,6 +67,18 @@ void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 	mhi_cntrl->write_reg(mhi_cntrl, base + offset, val);
 }
 
+static int __must_check mhi_read_reg64(struct mhi_controller *mhi_cntrl,
+				       void __iomem *base, u32 offset, u64 *out)
+{
+	return mhi_cntrl->read_reg64(mhi_cntrl, base + offset, out);
+}
+
+static void __maybe_unused mhi_write_reg64(struct mhi_controller *mhi_cntrl, void __iomem *base,
+					   u32 offset, u64 val)
+{
+	mhi_cntrl->write_reg64(mhi_cntrl, base + offset, val);
+}
+
 int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
 				     void __iomem *base, u32 offset, u32 mask,
 				     u32 val)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index f39c8ca7c251954f2d83c1227d206b600b88c75f..8e7257a9c907fb03571a86e29db5534f492678c7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -376,6 +376,8 @@ struct mhi_timesync_info {
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
+ * @read_reg64: Read a 64 bit MHI register via the physical link (optional)
+ * @write_reg64: Write a 64 bit MHI register via the physical link (optional)
  * @reset: Controller specific reset function (optional)
  * @edl_trigger: CB function to trigger EDL mode (optional)
  * @buffer_len: Bounce buffer length
@@ -462,6 +464,10 @@ struct mhi_controller {
 			u32 *out);
 	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 			  u32 val);
+	int (*read_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			  u64 *out);
+	void (*write_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			    u64 val);
 	void (*reset)(struct mhi_controller *mhi_cntrl);
 	int (*edl_trigger)(struct mhi_controller *mhi_cntrl);
 

-- 
2.34.1

