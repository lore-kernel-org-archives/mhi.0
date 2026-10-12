Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C657D4D1792
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829121; cv=none; b=BxMrLQYpjtIKMjmyC11pN4P0NubDmnBG0zWJ/I2gkP6TX8OUqwKWrbTIwbyiKS/2A9g0NulTxJSf86B0SDwK9LhO0hiXsGnfNdukRaS8pyLgDFG9YLE3x4l6nDil/KgYNYlKaQlLgKbQNvamhlE0C4ZEID0lnMDtVV8Uf0c1lhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829121; c=relaxed/simple;
	bh=VkPrxkJqsqM3JMRUSMdLvFLYTODuntM5UO+1g8Zzfgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SeqQSr9D9bh2GSiH5jtwdNl9fHVSSoB9g2k2WWl4nRNXm1wGFpWYej02bbxiLA88eCc54vFEL8LgiIbBBmQn6lqyVhAldBKiA/Bws7jJfvfblyS6xtp/9PSZjlrKr9vaPUykGIuFVAo3P9e8TVtlwtCVU4l79kQJafWM9BubTdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYGolGSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0lk4SMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYGolGSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0lk4SMf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHvDVU2879064
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLxL9awAk419qzBctCiH67jNF66X+ZqDVOqGlMQ9peA=; b=HYGolGSlwfYtoBjN
	Tx0Q/JUifUU5LAzpZViLLH5uxn1PVr6PNzSBa/D4gJfQiPtE6rh2ED9L4JTbMOSG
	bI014oW9Ri40/EHZJdP2Srtts7wOkY33q0L/5dvXHoIJONmBrpnqo+MAWSABN05A
	vf6qjNCtwfTQhD8GFtXc5zRO6xtV5dKm10ylVEbKjH2dzAzWc+uk1zk8cu/iJTsz
	FyMLkgR2k3K3kGJkz7Btjpe+fqUaZoWiRlMMCifx+36xqMJPBBBFNcHNHiBi//9k
	67P8QWk3nORt8hWfXsOUq5+PnhT433WaHeyTfpfve0+YXDULXLDCCZimN6DB6xws
	44Ifeg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu3cjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 18:18:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so4695201eec.1
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791829117; x=1792433917; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLxL9awAk419qzBctCiH67jNF66X+ZqDVOqGlMQ9peA=;
        b=K0lk4SMfRRjM2HKcJLYHEKrfyzS+sQAPbUG3sgES2nMgyquR2H6aZFmGG++YnvlCch
         YCVbR+7LSTnAwLLgN8Xw2ha55zj0atb162c8cHV2mQKZSPaptj/T8rrE/lQ9Na3w3fGY
         nkDzTXOwH/5hrUgrC8/ZlYRl+IDVM58YRp4zZyGPjqpMh/C+YGQLcaob5bDPQNqz2Dfq
         CqyTG+yqGW+XOo0yY3xdQdVCZUVd4i5GLLtEhHzE9KyKwLbYXr2lftEJ8JYdybgPFBtl
         xS+houH9EVKlcIN9bVLGXYDqAw8mMdZ5B31EHsoE2aDLUmrvEw7q91cDMddempXTrwmH
         sRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829117; x=1792433917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLxL9awAk419qzBctCiH67jNF66X+ZqDVOqGlMQ9peA=;
        b=pefiKvpbl2fCtSxE9h0eLRELryrCACy1GhHgIOsYnVUJBbvAiMq5wNEZqT1xzbupI4
         GPD1Qh6SQz0ynYC+D6S5jE8YUMUSIujK9de83smuzLn8/FytIqbHm7o7XbocFIgFB715
         +q+8mXhLHQEqvURM4QRd4wt+wNPGDZ4Zpw6VawUvYkYP/nbQF2UN9Npz8ogO9zybnNN8
         FZDi636mTqbOkPJ3KeJMXHD75pk9GhrYfdOOQSM1d6CcQoFICdML2vszoxIdsboCaxFm
         YA0jCko7+c7Wn718pYrKH49J6nhUDAO0rNe47TUjYQstvRWK2Y0xaznjzV5oWRY9x9QZ
         Ey6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWqwpKjW9sFqKIWHxbeXyA2Hjkz6mJIsBqX1WCkoQ2eMpEoMGdVTXs73btx3nK+iAXTS0=@lists.linux.dev
X-Gm-Message-State: AFq9FYJmMmsDXXxhzwzfzbMDIcZrmj2GZaKy1suz/eJyEiL3SG3J+7bg
	6Ipbc51Do9UWOafVDftfoncPTcA3I/zu3VWV7vLdSyYU9wAR3ZPPlyX8CiGS+Lws52uxpj2NIgl
	NnIV1gFyYcj6ooJLLQkmhT+m1cm5oQNGJkIqnbntcjg6U3G18OqZnIb4=
X-Gm-Gg: AYBFou1CPi6EQF/3Nf2a+/fQfuFicsn2q09lrpvf1A0l73vsnqBeFkid1mxQhDvd0NT
	EQdpOKpOvu5SfnAbiOBSqR6n8UC80UoPz0LlxhukBvHhAObQRLwFPWGkSci3twIkuyYQCEv7SYx
	XTDKK5Pr6Bts13HqvcGfVOSsC1TsxxH0CKLuCPKCdpLgEiIQF1mTBaQEtb9CxryfA+MaQjpNd0M
	LdQLUTUYl7+jL45kvhKGI1AlXM93syxEN/HPbcIhULnY8LVJAjVHB9TNbv5mq1OOxDQySWHpZTm
	RBkPX38VQUz4xoFxGdF/jHPhJ5epuuwIimLxSD6o/fEFGGx7aJBgnoK+t1ZkSHovc51n5wP3f6m
	IstiiPNm6b9ImFaO2cVLEziIO1DnP
X-Received: by 2002:a05:7300:ac81:b0:353:7e33:664c with SMTP id 5a478bee46e88-3537e3369c5mr21147274eec.37.1791829116488;
        Mon, 12 Oct 2026 11:18:36 -0700 (PDT)
X-Received: by 2002:a05:7300:ac81:b0:353:7e33:664c with SMTP id 5a478bee46e88-3537e3369c5mr21147215eec.37.1791829115791;
        Mon, 12 Oct 2026 11:18:35 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm22827311eec.31.2026.10.12.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:18:35 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:48:03 +0530
Subject: [PATCH v8 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sahara_protocol_new_v2-v8-5-e12939d229a1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791829086; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=VkPrxkJqsqM3JMRUSMdLvFLYTODuntM5UO+1g8Zzfgc=;
 b=ZpCO9GOHQmxmSwwG63+gYndvPFgU1yjA7PkqDcVwq7tg7+t+/k2WztsK7jewmcQJx4SJnS0Cg
 8QZrLuBr5IDDxqp8aU5o8mPtE07eD02TC2jLh2utDGUFJH+LQE5DLDd
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acd247d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX5nicHeqO0GZi
 i3NPfnpKQPYdeyYTNQVIVR6He5dHsPyLh/b//ihW72Ke8GnUl9Hg/VsplnrKvyVd42zAgb3XI/F
 NwmXbf8fAMBeA0xNkr2W5I2AaxtLg/Ol+PZZoJsga9YwAbeHMfQtEkFlGaWovW49npLWhbTBVRP
 nWJybTDGLqi6REFVNkxwoqAaw6Zb9YoyDv7dBYsH4wiINepZ7BCTEmF9S61ks17HSyi1/7aCQa4
 90e7api1arUOiyj7V9662nV2IIFW+/a7EIZKu/NpDdOgM4vFuFUUrQjG720YHD1k+zdOV32WAKM
 pXJzu06t64eHyJW+naMx3x8to7A7K5Ze0BV0XC8hLD0mZNN8QVMfKWKamI2l57xxRQUwd4uJasA
 1ifDVlbppwAqkVlYnzG875aSso19MdweKwdrKaqEKXchULIrVBiANHJyc5OxB3t8caax7Rel+7/
 l3bci84URz8gwNOIoeQ==
X-Proofpoint-ORIG-GUID: mFJvHBWCTufSVj1junz6iweKpVIM0tPn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXyNzrHEMOrcw+
 aJ8gfbBJE3WskqQt3uPv9ILNree11TLTKPMdATooUJJQ2tVBzNUThPtr2UPlQ3qpSJSOGySh48t
 OcOgKSb/04aNE94HpF7oIyOcEBgevqk=
X-Proofpoint-GUID: mFJvHBWCTufSVj1junz6iweKpVIM0tPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120072

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 4baa47d0b94e326b5bfcaa80c8ddf008881c85c9..afb72910fd67b225cd77c44d7e835cae138c2ffb 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an

-- 
2.34.1

