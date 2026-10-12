Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB94CEE71
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829111; cv=none; b=XdUBnT3hpNPXlDj0Paa4MMsVedIwSg0S7POgVYmWEvC8xcft5vx+lWeU4pbvENNhYjA6mcfDyN01cYGBckwulof7J+Y9E8Dnl3uJUnEE/eBym0u5hxYFp38cPGNrBQ0LfmtgxZJmhoU+atzv2JNIiOPmyWwaJRjFASECZLIx8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829111; c=relaxed/simple;
	bh=ZtZ6u+DRu7HtGnSn8MYFTYGuqWBEm+LcrAFnqwamhXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uy34CUl+eYb4WgCVuJYG+Wf0HTgTzpyYYAcaHVDMA1q4BLBt6fqd2mMG0+x2jBFQbvLRvLXkftctfUhtzhiRzs/dfR81k9UF4rc86PZJ8pV/NamcWXI/KiXqXw2IZlV5umTgZ2HkwzlgJ0aywsLMCTl1cBOpBeLWbZLsXMSoCPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJNPNYbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzqNBOdJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJNPNYbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzqNBOdJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHvDNg2879079
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a21CXdr0TVN/MkDPeYS8OA9CRqpA5gzmbpeFwPwg8Ec=; b=RJNPNYbEDiwh+LU3
	Gg/AzqILPsJnnlf4PuWc1gFQsjFNewwQdv4CyjFuXBY+13fZhtMDMvYr1DK62DlW
	6jZUI6EpY8JVnke73A5MTy222pNVMTPyv2q9xDbK8rJ+1tC6sxktDWDrd3vTFlMu
	vdZxf7ek2xsD3AWGZXSKeQf8hUEeelYEFz4U2CsGJaQMECMERh8b1P76YVdyTjzS
	FgtrWwkiKTFiqmCA5phuVyZLCUXhW9peny+lt8lc47nQXyg20YrSRmlVIfgX2OpI
	bU0aJCqqwn0WoP/IZbsLV2VMlGvF2wpAQJq6IMk6uOVfoq1blEv/th1rNmamJBHH
	6zK2QA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu3cj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:28 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so6070147c88.1
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829107; x=1792433907; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a21CXdr0TVN/MkDPeYS8OA9CRqpA5gzmbpeFwPwg8Ec=;
        b=SzqNBOdJMtwCthQpcFwQxO92VJGcb0R2ztqbI3PmWBN+Gq1JGrPY47EK9gmEMn2G9u
         z2fbJi5NxtXuFm1EqIPbypbyG+QXV/+1uZYwIfYJM07CZa2PWMmdP4t9EvlWRlzETiWk
         Pd3bMyrTDkMedwpvvnswyFRYPiucGvj5v3lF35xvEwrNbLwqhOFOToixXuu8S88foBpf
         rXBxUp53mk5fJYlEZx3XtabMQ9wtyyW4wFgQ1cpHkTiAS1BhDfz54jzgHu3TKpIEZEWd
         lUPRgP4SNYAbXpZpEoohKeQhPbZabd8t48skdeXgao4cGkMtWeYpJov7Cac3aBaq3v3M
         +O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829107; x=1792433907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a21CXdr0TVN/MkDPeYS8OA9CRqpA5gzmbpeFwPwg8Ec=;
        b=tLJdGC2E3Pvn5bLfI3Grme4FkUxppW14DyZsBLcCm2hWc0mJTZFla+ZuG/xX23vQqL
         0bToLDvlPtksCibvVgQQxGITDc520Xi0OuTPW2lsoQDQP/suzmO7NN2t79scrDXyn94D
         XfytNFEDppU+iyd1B90gJxLQu+eMrYOhUJ2wfCnJwGTp7Fciwnvuva4M9iqFsa2/oToX
         WZB9/tzyH6cDBJhAPRUDC4NSlpjyaiQSxeAXNJtzhQ7iQ83XmqERnnlHE3CKPqg+jAEe
         pxSIjCnKGp4+t83MYhRBFQWMOwC8TGyNVMyhlFrVDmaGRTKlU6edyIoyKWvqG4FOC3Us
         KJxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRR4oOLDiHHp5ELhMDbJvxB4MHy77agG+4iaiHuthyayJeHjj/EUJs2x0yV/srb5XFDQY=@lists.linux.dev
X-Gm-Message-State: AFq9FYKFR1EKzYydOOGoDRt9vKtucoUFo+OEpL4aUf2kA8JmDy7DYpNl
	oHfPcOX2B0ta59cVk5XP9r9SbWzc+xOwn2uG98jYWimfWvqYS7xiWBj7fzmurTZPXgNmtR9A7gY
	9GLsRKKoIzIFSCHEyqG9AN7PU4vhMZJ8VJpax1mSAN3jTeRezysMnHxhzGCnvsRw=
X-Gm-Gg: AYBFou0+7rLn2pAkTrLwwMBgwuBts3C6dFtWB//c3+GEMHbWN4VoOranDUG0/MqrGXr
	TDYaM9Tdo/O5Qa+KhUfcEfLw6nLX+9iKCFgTt+sr/8Reei/8CqyC0WVme5z7IEtE4itPZxBINo3
	aQeje1MlQ2AWja/S4n+3GYDqVch+rox3i2e5WwuGLcHksQJsmEj1lkn5hpYGMh44ounQug7rSSB
	ghvILKsQ36YKUGkgLTXJR7HGeeFduHUI7GEf04X+wXDZfk7593qM4SXokO7lvYSRPTNoYCcA75o
	rTOLCLreBFnGrjZ7zNRCMjklNbA6M5o893QyA4IlreT7CHLBzunLAt9qJuaBM2RxDP766VvQo/V
	o45wob1iRuzBFO7H+XboCSCxsasNk
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr15088040c88.12.1791829106994;
        Mon, 12 Oct 2026 11:18:26 -0700 (PDT)
X-Received: by 2002:a05:7022:3b8e:b0:166:fc9a:11b3 with SMTP id a92af1059eb24-16a1206fed8mr15087908c88.12.1791829104780;
        Mon, 12 Oct 2026 11:18:24 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:24 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:01 +0530
Subject: [PATCH v8 3/7] bus: mhi: Centralize Sahara firmware image table
 selection at probe time
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-3-e12939d229a1@oss.qualcomm.com>
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
In-Reply-To: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=8671;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ZtZ6u+DRu7HtGnSn8MYFTYGuqWBEm+LcrAFnqwamhXs=;
 b=6itkh64ThW6+pfLMUuaUqc9NPEi6VPZWJcO0Y1CuAsqnrXwtH3sJFh7mZMrw2y93zC8mfOIf3
 53QEPLu6qPjA85xpzUM1pc99nRv1o7M4S7wjoHA9uHsx/PwzrlRHost
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acd2474 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FaWmrOfgj8M-bvBoqZ0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX5lWEikT/4RhA
 1+mrcQSdkcC0ABi98M+nSn5d5hovkJxQaQDqyboMB3XM8StMCpbWPrLQE/Y6YtZAif1POTbP0AG
 Xju6S4szZYzVThs2bB+AvMXLUqZzTywy/3OAZyAOY6HO16CHKKgdq+8dDymu2oiqTmYnLRgGhmw
 80PntK2R5DWEdyUXt88mfpEtbUJ/4TonTZfN+EkoMdKoitCwJ4CN/E/PsXbV4w0qmynsaLltJ6p
 /G1WIl9+gOMwA1o5PkikHfXv2/16CzlBP4ixcjvlxCTS2JjLUiP/SUSUQLYt4mJ2LNw7diUrJpH
 KJe1gRWv88VgRJsliyqBAGHWg6byvR05YW2l6UJ9BqEdvsLksz6jn7nThSxcLZIIcsJ9VGhir99
 xi13O4YoRpksJgQn0XY9kpmKgMcZWcAb/xBj8tADcYbkf2QkKW6/jYnWEIbBdf/EsUQZtV43Kod
 V+VkQeEqXDzN568+KKA==
X-Proofpoint-ORIG-GUID: tze5zeFWo2wyNe0DZ38bpcXVVLnYL6Du
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXzxJjF//L/mDV
 4YH5ICrTCkMjdn09MD+KoxAtMG3yGeTiGfzh/t7OwD0DkrrEK56mU3xpXYM5U417f+EHcc/EXHy
 vbxoOMQ3Tl6VGxTWp2heF6ZDjjt+EiQ=
X-Proofpoint-GUID: tze5zeFWo2wyNe0DZ38bpcXVVLnYL6Du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120072

The Sahara driver currently selects firmware image tables using scattered,
device specific conditionals in the probe path. This makes the logic harder
to follow, harder to extend for new devices, and spreads device knowledge
across multiple code paths.

Refactor firmware image table selection into a single, explicit probe time
mechanism by introducing a controller provided firmware mapping table that
captures device matching, Sahara image tables, firmware folder names, and
streaming behaviour in one place.

This centralizes device specific decisions in the controller driver,
simplifies the Sahara probe logic, and removes ad-hoc conditionals while
preserving existing behavior for all supported AIC devices. This is in
preparation for adding QDU100 support.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c          | 61 ++++++++++++++++++++++++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c | 60 +++++----------------------
 include/linux/mhi.h                          | 17 ++++++++
 3 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 40e6d262ef217aad8ddff6f69a38388ef683e3ed..dd320739c07ad4a35b74446e32f0e8e64e847d16 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -20,6 +20,62 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
 module_param(mhi_timeout_ms, uint, 0600);
 MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
 
+static const char * const aic100_image_table[] = {
+	[1]  = "qcom/aic100/fw1.bin",
+	[2]  = "qcom/aic100/fw2.bin",
+	[4]  = "qcom/aic100/fw4.bin",
+	[5]  = "qcom/aic100/fw5.bin",
+	[6]  = "qcom/aic100/fw6.bin",
+	[8]  = "qcom/aic100/fw8.bin",
+	[9]  = "qcom/aic100/fw9.bin",
+	[10] = "qcom/aic100/fw10.bin",
+};
+
+static const char * const aic200_image_table[] = {
+	[5]  = "qcom/aic200/uefi.elf",
+	[12] = "qcom/aic200/aic200-nsp.bin",
+	[23] = "qcom/aic200/aop.mbn",
+	[32] = "qcom/aic200/tz.mbn",
+	[33] = "qcom/aic200/hypvm.mbn",
+	[38] = "qcom/aic200/xbl_config.elf",
+	[39] = "qcom/aic200/aic200_abl.elf",
+	[40] = "qcom/aic200/apdp.mbn",
+	[41] = "qcom/aic200/devcfg.mbn",
+	[42] = "qcom/aic200/sec.elf",
+	[43] = "qcom/aic200/aic200-hlos.elf",
+	[49] = "qcom/aic200/shrm.elf",
+	[50] = "qcom/aic200/cpucp.elf",
+	[51] = "qcom/aic200/aop_devcfg.mbn",
+	[54] = "qcom/aic200/qupv3fw.elf",
+	[57] = "qcom/aic200/cpucp_dtbs.elf",
+	[62] = "qcom/aic200/uefi_dtbs.elf",
+	[63] = "qcom/aic200/xbl_ac_config.mbn",
+	[64] = "qcom/aic200/tz_ac_config.mbn",
+	[65] = "qcom/aic200/hyp_ac_config.mbn",
+	[66] = "qcom/aic200/pdp.elf",
+	[67] = "qcom/aic200/pdp_cdb.elf",
+	[68] = "qcom/aic200/sdi.mbn",
+	[69] = "qcom/aic200/dcd.mbn",
+	[73] = "qcom/aic200/gearvm.mbn",
+	[74] = "qcom/aic200/sti.bin",
+	[76] = "qcom/aic200/tz_qti_config.mbn",
+	[78] = "qcom/aic200/pvs.bin",
+};
+
+static const struct mhi_sahara_fw_table aic100_sahara_fw = {
+	.image_table = aic100_image_table,
+	.table_size = ARRAY_SIZE(aic100_image_table),
+	.fw_folder = "aic100",
+	.non_streaming = true,
+};
+
+static const struct mhi_sahara_fw_table aic200_sahara_fw = {
+	.image_table = aic200_image_table,
+	.table_size = ARRAY_SIZE(aic200_image_table),
+	.fw_folder = "aic200",
+	.non_streaming = false,
+};
+
 static const char *fw_image_paths[FAMILY_MAX] = {
 	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
 	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
@@ -871,6 +927,11 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
 		mhi_cntrl->name = "AIC100";
 	}
 
+	if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC100"))
+		mhi_cntrl->sahara_fw = &aic100_sahara_fw;
+	else if (mhi_cntrl->name && !strcmp(mhi_cntrl->name, "AIC200"))
+		mhi_cntrl->sahara_fw = &aic200_sahara_fw;
+
 	/* use latest configured timeout */
 	mhi_config.timeout_ms = mhi_timeout_ms;
 	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index dc64beae06ada6915a506ed8f4ae4d71c03158bb..74bf57f02873e463d0c2cfdd2673237840169df2 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -179,48 +179,7 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
-};
-
-static const char * const aic100_image_table[] = {
-	[1]  = "qcom/aic100/fw1.bin",
-	[2]  = "qcom/aic100/fw2.bin",
-	[4]  = "qcom/aic100/fw4.bin",
-	[5]  = "qcom/aic100/fw5.bin",
-	[6]  = "qcom/aic100/fw6.bin",
-	[8]  = "qcom/aic100/fw8.bin",
-	[9]  = "qcom/aic100/fw9.bin",
-	[10] = "qcom/aic100/fw10.bin",
-};
-
-static const char * const aic200_image_table[] = {
-	[5]  = "qcom/aic200/uefi.elf",
-	[12] = "qcom/aic200/aic200-nsp.bin",
-	[23] = "qcom/aic200/aop.mbn",
-	[32] = "qcom/aic200/tz.mbn",
-	[33] = "qcom/aic200/hypvm.mbn",
-	[38] = "qcom/aic200/xbl_config.elf",
-	[39] = "qcom/aic200/aic200_abl.elf",
-	[40] = "qcom/aic200/apdp.mbn",
-	[41] = "qcom/aic200/devcfg.mbn",
-	[42] = "qcom/aic200/sec.elf",
-	[43] = "qcom/aic200/aic200-hlos.elf",
-	[49] = "qcom/aic200/shrm.elf",
-	[50] = "qcom/aic200/cpucp.elf",
-	[51] = "qcom/aic200/aop_devcfg.mbn",
-	[54] = "qcom/aic200/qupv3fw.elf",
-	[57] = "qcom/aic200/cpucp_dtbs.elf",
-	[62] = "qcom/aic200/uefi_dtbs.elf",
-	[63] = "qcom/aic200/xbl_ac_config.mbn",
-	[64] = "qcom/aic200/tz_ac_config.mbn",
-	[65] = "qcom/aic200/hyp_ac_config.mbn",
-	[66] = "qcom/aic200/pdp.elf",
-	[67] = "qcom/aic200/pdp_cdb.elf",
-	[68] = "qcom/aic200/sdi.mbn",
-	[69] = "qcom/aic200/dcd.mbn",
-	[73] = "qcom/aic200/gearvm.mbn",
-	[74] = "qcom/aic200/sti.bin",
-	[76] = "qcom/aic200/tz_qti_config.mbn",
-	[78] = "qcom/aic200/pvs.bin",
+	const char			*fw_folder;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -796,6 +755,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct mhi_sahara_fw_table *sahara_fw;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -808,14 +768,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
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
+	sahara_fw = mhi_dev->mhi_cntrl->sahara_fw;
+	if (!sahara_fw || !sahara_fw->image_table || !sahara_fw->table_size)
+		return -ENODEV;
+
+	context->image_table = sahara_fw->image_table;
+	context->table_size = sahara_fw->table_size;
+	context->non_streaming = sahara_fw->non_streaming;
+	context->fw_folder = sahara_fw->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 65e8a397cc50b89d045a242aa1164ea7fb8c9696..e1d12e8c1eb80945be6a6d0a5896d92ac221ab81 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -252,6 +252,21 @@ struct mhi_channel_config {
 	bool wake_capable;
 };
 
+/**
+ * struct mhi_sahara_fw_table - Controller provided sahara firmware mapping
+ * @image_table: Sparse array indexed by Sahara image ID
+ * @table_size: Size of @image_table
+ * @fw_folder: Firmware folder name.
+ * @non_streaming: Streaming feature support (optional)
+ *
+ */
+struct mhi_sahara_fw_table {
+	const char *const *image_table;
+	u32 table_size;
+	const char *fw_folder;
+	bool non_streaming;
+};
+
 /**
  * struct mhi_event_config - Event ring configuration structure for controller
  * @num_elements: The number of elements that can be queued to this ring
@@ -381,6 +396,7 @@ struct mhi_controller_config {
  * @no_m3: Device doesn't support M3 state
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @sahara_fw: Sahara firmware mapping
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -467,6 +483,7 @@ struct mhi_controller {
 	bool no_m3;
 	unsigned long irq_flags;
 	u32 mru;
+	const struct mhi_sahara_fw_table *sahara_fw;
 };
 
 /**

-- 
2.34.1

