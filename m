Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86134DCC8
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901945; cv=none; b=lKZxVaPwPT3v2e0mTRMLBjgxPlj6y7ywm9itr6iGp8rhP8VNStpFFySKIkRTUCqS9vDZGBEKAtg5YmJGVXRfN5O5cpwvqZBaTOJ29h1MhDJq/oRJX8LiVA+a2ZxAVKAAKGHxk8fSLEYQyHqlgCw2dWG9TxFCiTfxR5NYBnaPUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901945; c=relaxed/simple;
	bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SuvSw+7Mwi8BHS6Focb9ne+/Hkugvj00aqLQsjzasRbLpuFFqzF60kEIWyms29MLWMD/vA8G9cXHGx65PvhmVfyC2ruHvo1uL3jkA8h3slKqwazUv5wWfmowGh6ZHumADWRgMhG+7+Xq87fLyzKR9/sQBfieLEqZcAgnkv9+hPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsLNHs4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kcsUayXs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsLNHs4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kcsUayXs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Y9362690169
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=; b=YsLNHs4ESlAlVBun
	SQlyjD5zscJyYzZ7SvkeNmzOkYaKxSikbLg1ELzJJZTBiU+CnRu0Dx9bOa+N2KnG
	nCil+AlRj/yvaGwbkgjj6glQdR3T1c4k462uSVSibHHPGdCdcfmabwlZDOOYxMO7
	39pj0Y8ztpK4W/badPXfvDZxs2VxverZt2Mw4BmjpoztOT4e0GyUK+bsQl5QwmtM
	KwDA+Yl6es15EM1RIIkpRVffWm+vHCLZS6HzUpx/Er8VHY5Toq/KgqDVsnl+ZYDo
	G9fVCXHqEVcK7L+RjRr/lD9sG72Ov3sMYc4KH9xPW6m068gobAecuggJq98q07TV
	Whm45w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyucdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae3badc00dso6696685ad.3
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901942; x=1774506742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=kcsUayXsQILiT/ijBql4FFLi7jMVSpD2dGYL6mHygx1YmaWUsL8lLBgxn0cgRZD6ey
         NSa761p4FoHK5APz/4UgA3d8DFhINdr8W0OgiUwz2ZT7tfl0p0AVseD5Rpl5XgGmZU6A
         ExIp+FaNGtAagb5dz8cW/5ZCadRRwJPTzTGsQlXTPe9wC5b0l+k7ICyhMK4jX1MP8nLb
         ileRVtywLOp2bEtPCAmxTCkKEzp9I0iE+r3Lj9W4BsCZT9t6jMhIaRAVRtJ8it6O+BLm
         TEddG83jHFscfo/9GZKq5hJHGl6KeObbKylsM1nTvyBM++ZkIJF23cU3jF/nO4MPE4bs
         EQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901942; x=1774506742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=lsRbbb9lbME86QlV7jOUpwoKtPQxoUfBFe4SES3Q6AlEDefB+dax6VI4XSUF1Vpnzq
         C58GKIchEHrmVqsv7YAFdxAD2IbVYoTdR0+my+oNZxNaZl6E+stqkC0iFN/oLtIGSA+W
         VlCBPJyZbcyNAOmjcke0m+gCmd0o0mrVVZ/0RuLni8Ce5L0eFW1rtBkBusrA8i2UIVMl
         v56T2cxjZvVyPXUxT0wSjNxLscTqC5RHfKJtR3TYfagb2bw76me7534nsCbRtn0+Q7ZU
         QP3QCj9DC2jVmyNYuEhOMasshoQ9quZWcg+TXcOpXc/SlFTncOpeeaGrSnxo1I+3N3YQ
         x7OA==
X-Forwarded-Encrypted: i=1; AJvYcCVAopk608/hkkPElOFnEsuRn874XmyBo13pyXFSZLEgpag51ssdxiSwcVpiAoreBa6SLWg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn1/NgYr+ZnGKfof17GotHGR3S19kv/FZSjFddy4bB3tQIekwh
	b+q1q6S0aIaplpiCVO/SsULYpC+oaOqtvce1Y3DG7CZR9WOfFO+ww++Y6ZSCYCCo4XkvmlqJE4l
	fIZyXocshNPx/rk5WWyzN8dP/oFdF7snHqsfDo2Cx4PFkYGKNo3jJLHFrF7uCUMQ=
X-Gm-Gg: ATEYQzycwkRe4iXgJT1Cc+eIGgCbIL3/+p2ObTejNkhLazYOnVJ/UX1wzJ9AD78tCrp
	GuZQ2ZtKbopClaYZSKpTmB24s6TrQi97LdAotLVM7bgmszRsHdyTQwTxoz2lGredI00VAs3p3Cl
	Ndy1e5+AYl00re2cGNX2EE0iBOdf78rvPTmjA7tmYlTsepQLV+Wmz/nhXJDphX/7TKXgmqnyGQh
	HXXip2EqzrO66PUA+EmrYbnt8QWNyRDfjb2WgBHVCeFPwU1yZ9CbDLdOMMHsWpkQBbikZDEKp9B
	vsHL7olAbHLCmAgQmHv8LRi2dh9Rd7Spvi/DYm+kuOeLi1HmU2XlQByR+iPDg3bzG7B8gI3kFXt
	4AR0NYv95L717Js0PiKDnzTkVTSHsdTXKaCRvvp8V21uBp0WIldI=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57940065ad.43.1773901942236;
        Wed, 18 Mar 2026 23:32:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57939835ad.43.1773901941736;
        Wed, 18 Mar 2026 23:32:21 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:21 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:48 +0530
Subject: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
 b=E912BIRgk2tIUK4/M4i8++DPEcAM8x+0kS4yuwICPrM81yr9VdRFAzP87se9p2qP1rqiZUxb4
 9ZzAK2xR+g5DkO5ycJfNGU8vhWZhLd/M+V0j9MwRw2DwL6pPFoJCvz0
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: ujlJXNDWLGde7gi88-cjeOVlg8MNlck0
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bb9877 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXwyOcq1/K+v4t
 MHGKltNbmoUE6HW1UIkcAEjdg6HQXQmwgzH0J0AOwGjwhGw9hcWoe5o2ldB0LFJwlaHOqfnL7R2
 +unNbSmazMAcN7c8gRkcCWwOcCXi0ZQlqSFKoz9kGw1VIhjDJ7pENFy5MKs8kS4tLUI+x9VDfzI
 Vz6rVRa/DpqSNIlTAJXmeCF2YzgDg6uj8VnYZ4LvZhJ5jBhRQ/X/9Mvy1fJgKsv/yMeGW4tVYRS
 ff4oIiGcDPlUml75xh2m3Xn5o+VzwW0cTR+1stNjaDkBQnIQGMGC3BCNoCAPPtYKzoVPBS2oG9A
 YY+9+OIxCMGMO83WjNldqyY3SmN9uFLmzdCvLBw+eNCvroIR6xyIKOStf2vKPbakM5OFTEDXxPh
 IWncq53Jr8CmLQ1ElRnkwe9SikfpXlQVAjTPi9njTTmWzMhzifxJKSei+Xu0ffx2i3T/ea4olTw
 4JCqm860kuvEuasYJ+Q==
X-Proofpoint-ORIG-GUID: ujlJXNDWLGde7gi88-cjeOVlg8MNlck0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device. The sysfs file is created under
the controller node, allowing userspace to read the training data even
after the sahara channel device has been removed.

The sysfs attribute reads directly from controller-scoped storage and
relies on device managed resources for cleanup when the controller
device is destroyed. No explicit sysfs removal is required, avoiding
lifetime dependencies on the Sahara channel device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_ctrl_trng_data *ct;
+	size_t available;
+
+	ct = sahara_ctrl_trng_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+
+static const struct bin_attribute ddr_training_data_attr = {
+	.attr = {
+		.name = "ddr_training_data",
+		.mode = 0444,
+	},
+	.read = ddr_training_data_read,
+};
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &ddr_training_data_attr);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &ddr_training_data_attr);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &ddr_training_data_attr);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

