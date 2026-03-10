Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD553E8C46
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127354; cv=none; b=qigFeJN//bcJPw2CXtozIkZpyGFG81wwWjhpAvHV4Vn8uFqj4CKI9tINGpLseFR8fwn9UvF0R96N39nEjqFjIH0I3Tdl1Xgz57DvuYIAUw7n2WK/IXOSavl1VNrS083oeXGK9KPumWSKJK+BSTcdUwMznnKWqEYkF4idGIJsu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127354; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIsEJr+kdSOumDQYpA9j66ZuHZDjWo2az9CBBTvkHyssIG18HNl2+Ut6xbuWOQTycdaxljmMEmtrjIkWUcq4v4cyEY51qgf0HPs6oIETEoUrmmX8+wDDmoxc/thGE8DgkRsRgvazcjwuCj79toVgYp4/t+FUHRMg3d8BcLpVlsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWrtB+Yk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWEkIixF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWrtB+Yk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWEkIixF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EGTh3754582
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=dWrtB+YkkeoZVD5l
	dBFkknMK73pt1U9W74yJib2y3ulLziyenaDahhjvZ9t4ziBrpCDmWruMXWoHjkvA
	+wJ7JJFub+qHEbbjgs+a6kW/9y42jPK8PO7KHLjOm2cRsvBmb7gN7XaqgGN/TPZJ
	JEtkg4qNoW4BMt80YI7HtRC2+oQ0/WR7fylCDmlraX+U7JE/HY6IXXKvBkfvq+hE
	83fPNy2XAtlEQfKRuK5PvtY0hYa8nI90pynbbVBLvY/KKWAhPSrTR+V37Ehaa++N
	ZSOTeMwl9aNU881G3Euk/MEd6o6xqIUSht/bMcjqiaEyvD8sWEt9jpcB3e/4PApe
	9t2gCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477j07m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae502a1dd9so112812095ad.3
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127349; x=1773732149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=dWEkIixFJvRLGz6Stqr3dicxClLfQyz8wSodlA8lVVZptisAUdb+sgLbpY10+w8vqF
         Qe0IF6GU2XIC6PYEAZk2+bu+hthOSFJsQl4cCJb+qL3yw7orOsZjr0KWUTwdN33gQogZ
         YYoRRj4osC7A47CixOlm2g+uVx1npiUz5B/p9sXU81GNLdTBSKy4O2Ub7ySdSfua0EWD
         MROwqt16aOLuhnOXtaFidlABRV/xZextuKPEIpIeKcITsf6d5yu4usQ5mshn88lObcJo
         8djMBEw82wC5hSz8oKd2jB0ViREBCwfJ+IABUEd1dPc1bxJIEhSu8pTT+/1u/uSrhQsL
         A3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127349; x=1773732149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=fpS0k/1zRjeRSSzj9WaE3xvVv3NcsBmYRTp5hjfqnYAUsaXU/9E4irPelxH/O/fspa
         DHwEqdj+DELeJFZRLD7q/dio9EO/ttieeZNbznDtcvS/aK3usFCKc16337s/OgO76TXo
         LE4FdLK569ymFny3ORhe4JLkWP/NedDDFfoOl7Z7YbtrhSi6dByemisV4xAxmMAKPgaT
         TI8a6nKyWyxSzd3exHEHWbD86hkPMCW9N17FdTbejz8SScG3vCcZlsmveK4JfrLAjcim
         IfRtL+LVxjrz/M65PMYqgfiwy5KhO0mnGs9mU7pkGIpoOaf48VMRns8tFJT+jiC4kupX
         70tA==
X-Forwarded-Encrypted: i=1; AJvYcCU2rjdg8ocXasUz2lbTj7AIgnoPgHqjOC5IbT6uHCgHpMIU7W+RCV/12MFCaCVSIB0UywQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHl9G6Awvbx949rytwj+wjwoyuTf2usV8btYCvAzTDpvaLq5At
	I+u4K1+exRHh5sR7jLkQRpjgT5LOxh4Ci/7NBDVd9bt6mRZ/AqU2SiApnS5o7QI1JaNXML2HEDT
	egvWDTNrLVClZxRActqNxYHh3pzgEz7gQYjQ1nBOfdZb/mqBRkuC/B/w=
X-Gm-Gg: ATEYQzzsG6VU5Ky/nm0eLK+rkIC9N3MiJqq+Jyqqebsy5gdJDdn/d8acgYULfpV5fzT
	1tW0n36kw2A/5pFgCsVStskxoIgU2/Zx5qBlr83jDXxYUPIer3cUNRqhOQbRlvb6wHOF9FQJ5ph
	M+v/cCrefNRJWbgkkGrX84lzEL/HZtkoHsNrHZ4BlWlfiTRrMM8W4fkLWFzA+gmGKnVphnqZKyx
	G7IkgVl6l9IQfuEXBpfpEBANPzgRWrzT8URn4/UKTHKdVrSKAA4GiFPKwojFYJCQSqWOBC7PpL8
	uN5quBkeh4SCMPkN57yYqyaMm/pwCsM0KPFiE9nQpJ8t2MaTIrZuMK6A1e16iK6HrjxD2xDooM/
	wsBc9BN+qpsONH7aFg9LsoOEghXZJKmrbF+wVqRIyzrW7j6SVGuQ=
X-Received: by 2002:a17:902:e790:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ae82505f47mr138797225ad.44.1773127349316;
        Tue, 10 Mar 2026 00:22:29 -0700 (PDT)
X-Received: by 2002:a17:902:e790:b0:2aa:d630:cd5d with SMTP id d9443c01a7336-2ae82505f47mr138796965ad.44.1773127348780;
        Tue, 10 Mar 2026 00:22:28 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:28 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:01 +0530
Subject: [PATCH v3 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-4-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=CTZh2FV9FQiyZwGLQPHTzXB9kJsW6bpaNzbyq0P/Z7ViUQFDLg9+WJ+aT6EaDJ4D/XXTwoGOe
 oXks72SrrRJAHcr4haYbVSjBADZoIijZ2z4edmqXtFNpuZGaHlJRE6T
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX6AiMxdLq6xYh
 Xj63AzpvDMBuFlmHvgpSuXXW9Hr+/kWqp5jPnYD4nMiD2w3dT7kKR/C0Hefikf8G6ja4Oc2aorZ
 ah29Ztcu5sD0SSPRP+o3NqG5PYMOe7GlSP2GQk2ftUlWoimYbSEixxeNyeFk/MjyegHTin7MiTi
 BdbffHJA8hbwruCCuSIrUK1rqgONusgLO7gmKWl72RGTnhO4RWxpehUmp/4iYmcsGf2/DXR/X9O
 sLfz4BU/sIVK4Ci6mjzyIPlmseNIFrn0Q5XJ1B9RnXCa117f5n3JefOyqmIQPOdQ6B9WSJgQMhI
 749+zWHW1hJi/CqMmKdvViJlDlRRUJPxW2Zq2QFxeJVTqx2+tax7AYVrWKN6lZ8RxiU0Y6OipcK
 iqzmiiAoGOl/PKRpdY+7cmfzbQOYMMxg5yNFxAHbL3FFvZw/JfTkKfn2r8gs98/9BbBoc4wCgKW
 srlXCYjyly1npp8+Xbg==
X-Proofpoint-GUID: vwZ0KIjkZ1J2EUwflQl4VtAVnj3HNHs5
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afc6b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vwZ0KIjkZ1J2EUwflQl4VtAVnj3HNHs5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

The Sahara driver currently selects firmware image tables using
scattered, device specific conditionals in the probe path, making the
logic harder to  follow and extend.

Refactor firmware image table selection into a single, explicit probe-time
mechanism by introducing a variant table that captures device matching,
firmware image tables, firmware folder names, and streaming behavior in
one place.

This centralizes device specific decisions, simplifies the probe logic,
and avoids ad-hoc conditionals while preserving the existing behavior for
all supported AIC devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -180,6 +180,16 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
+	const char			*fw_folder;
+};
+
+struct sahara_variant {
+	const char *match;
+	bool match_is_chan;
+	const char * const *image_table;
+	size_t table_size;
+	const char *fw_folder;
+	bool non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const struct sahara_variant sahara_variants[] = {
+	{
+		.match = "AIC100",
+		.match_is_chan = false,
+		.image_table = aic100_image_table,
+		.table_size = ARRAY_SIZE(aic100_image_table),
+		.fw_folder = "aic100",
+		.non_streaming = true,
+	},
+	{
+		.match = "AIC200",
+		.match_is_chan = false,
+		.image_table = aic200_image_table,
+		.table_size = ARRAY_SIZE(aic200_image_table),
+		.fw_folder = "aic200",
+		.non_streaming = false,
+	}
+};
+
 static bool is_streaming(struct sahara_context *context)
 {
 	return !context->non_streaming;
 }
 
+static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
+							  const struct mhi_device_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
+		const struct sahara_variant *v = &sahara_variants[i];
+
+		if (v->match_is_chan) {
+			if (id && id->chan && !strcmp(id->chan, v->match))
+				return v;
+		} else {
+			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
+			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
+				return v;
+		}
+	}
+	return NULL;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct sahara_variant *variant;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	variant = sahara_select_variant(mhi_dev, id);
+	if (!variant)
+		return -ENODEV;
+
+	context->image_table = variant->image_table;
+	context->table_size = variant->table_size;
+	context->non_streaming = variant->non_streaming;
+	context->fw_folder = variant->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.

-- 
2.34.1

