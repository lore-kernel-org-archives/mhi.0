Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECD3563EA
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883733; cv=none; b=G01Ye29e2mhbJDKWB7GW2tvveotU7JvEG+xRQeUf7qJClCERdsd6qzo072TvVBXhna9qB/RjVAzlXe2BKIX6xcZNzBvynBo5Rj93d79QpsE7ROzyW1I2Iqpbk1pDt48ruCwovp9zDeKkZvNuFZUSlyJ/yBtashfHb027YsNR1U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883733; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfiiOoESZh1afnvDayV36EohpqNhHLI+SgHsnZN6i8K7UTzh5hluVAVUE6kbRPnMXbiRPNKubb4fKn3c20VJftKePni+k+G6ETHDj6FcqVOV2yuVtWYf9UrlVUymwIeIc1/Mpn4Y5/DM2gao1d4zV1gJHLxuDjRIrCx0CFGQtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwzR2mDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIKzFl+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwzR2mDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIKzFl+v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6278NQwH460187
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=XwzR2mDAVP8gQTmc
	ONv/9nBbSN6R1/IGchyt5pVMxbvkE+HFfnOaPpL3gKYssoTyJjrdBodQJLB9bkNl
	bbELNoZRi+f/yXKdHSR2QNGN202Me4tnPDtMvgEFsyEw3v8vSZLOJxjwGvvEygoD
	474gv3EinsdqUM2MqtJeKbK7qDKvuRedK8hSnoqO0c6kvLtX0SSF3pqmK5G8QWZK
	eQ7ExLmVM5by6tSH4MlHvuAjlAO47zPkWYRIHevZg0nOtMuuUi0gEG8lxjT8rBTv
	027wBHsbgvg1sshTTQrLhquygJn0fC+aKYAB/hbXM3B/3f7Eu3j2fzcpPiqK8G9s
	8CyhJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse0m6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4cdfc468so63808945ad.2
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883731; x=1773488531; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=bIKzFl+vx154KvVrZGtvmof68WzdOwotLQzYXs1T+dE/WZjwz1WKmgtK6j+clGhtpW
         sCW0YKVZXPc6W2i/E/vaFsybr4FUYaVqVBJ/0MJ1yabIIIty2U+TQb75nMdH5dOM+84A
         k0T4TavvJj2qYZhPp5C5k8blGjZF9Hp2+b6Y57hVPGKVTjHYqFRKE+UYM/fHiqxkxOg6
         HNJXCEf0uJQYORiJUrgjfgqgOnLGYwPvb8MMBFgZBxNvyKkDVtt3wjQUfccG5ZO2qQWp
         kk2beJL5bwWPAYGwP6nE1UAyuT70I02YO7PHYKCQZ8XFOfFpEuDN+470HF7ggV758TOF
         bhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883731; x=1773488531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=ajqFLAICOp0BsRxtDFSkMuxL2s7jsyZZ4u2/Dt0Ns+28svsb09T3cQ5K3why8lJOPv
         jap1SgwXFIfHIJtn/kd0gqrX4ZatuF97Rm+oi+FWMVeZMCVefA3axujssZ3fE/B3JwXT
         RlrF3e2mHI95LRTl1bRWX3omohMm7AItdbkZQlXsKhHt6UtzR6LitTN9S69UV4N/K1FF
         emOirojAz/NvpSo7uDcEkeGjeBa9DQnNvXUQmyVlJix5WoQ0w/yjTTmqeCtCjHeBzSL9
         iApflHeJLyysKEixLJgEAAfuB38AKHmOolsCtK3X/nUVst+oxjl3ObbyouGAwCzZhfeS
         U62Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQkEwgo7oykfT9hYoj6oJN1hSyY+Y+ODGoEn9R+iTe5j8Ru1qeMKD4algupxTNHo0jDM8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEjZkUmRSWUp1jrHMSfw8hBQVOkTJBr3Dtp7iRlqcFGr4CqOh+
	JfGu8WfympmY5U/TE5yHGkOXVZ2sEl5cIF1aSXLfzwWZTfWwx0c9LMXVHI4MD6HkYVGDS5ue5z1
	gzCVRzEUhh4v0Y4G9ZtTqBjJva7L9UK1L36Ci+AG1d3yELi6Vna25fMQtbfyCZK4=
X-Gm-Gg: ATEYQzyQVlXxVNYNrPtmxmNK1nIlWjg0IRDfZbbbJaOzdlVjmMkHjqhCM8BjsDvoUD0
	FlxqkQKjL9jVu517l/8Z66AMUCDgf9Kqocwn1tvgt6hsOv0MZtahT/Z/g3wQZVh2tEiVjjtOQZR
	XwLsmJd5VGrQzHpA+YchdfvfoteAUpKoZpbQvGE7fOC3WORUZu1T5lJ8532r0CbYV1CX1X5P3rF
	a2t4ZPzPFvuXvj40Q/KySKQOu4OnY3yUdYXTIWtg0k75vNPQ7p7eCbk30fWUQe/x1ch2iVrNdK1
	J3rxDw6SMQfl/izl3QL/pHhHd88lZl9Gxg7SWZS80m6Cr4Zj9+Z0l80QLmTeaMO/JweE0bbk2uC
	syIPPbdXnnND/vpzlU+fZwwK/WUQRlSN87gBtHNNJPShptvkVgik=
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id d9443c01a7336-2ae823aad45mr55366035ad.24.1772883730930;
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id d9443c01a7336-2ae823aad45mr55365825ad.24.1772883730454;
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:24 +0530
Subject: [PATCH v2 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-3-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=3HTb3lNqq1SBlZH8owlRUqgc1PykEjlh9ZnscaYY2XCHwlu9RlWn/8c29wYzbFP832FhPqK4M
 6/gbGM0wW/kAcei6sxdVFhRnS5Q53iyxG//r/OMoyPfrXciF+4abQ5k
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69ac0f13 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cW_jKJFDyR7gpKEb1BBRPpNFvLpZ-Zl2
X-Proofpoint-ORIG-GUID: cW_jKJFDyR7gpKEb1BBRPpNFvLpZ-Zl2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX+JAhUYmWaFJ0
 h/SNij2lN31hYv8Upo1EAEoNbPZG1oflwMg4CmCFTwdY5w6CTlsqzYx+/xFZKLFGwhi6seYwRBW
 zX3IvVrlZaV/lU0/ixcHuK7T17CNm7iSLS0eOZUEn/qCgMNH+hrkHCQ+XJUZGviOSopsuMVEaC3
 X3jmy/RmVbfL30faXCBIEU2agNqF04NP515/47OXZ3QmK9HwcMA95QKWdii1a6Ws50w7hTyS17B
 scWSBifovtjKdUVWBZHKubdHidVrAHoSB1wYsOK8mEMTkVq5c2vAuz7pBMIT9Mc2k3BG58ms+Dl
 dHoQwKmouOlnBJZNFEKqiCK3xyC1gy1+wPzRhfY+WEBtf9CbdCaQVl8uimduPZf6o/uXXKoD8Wu
 s/MBWauKarmGxDEZcfnr/NfYsjK5MlfURFKaC1lQ0lUn2azpSC1yHBVGASRuEfI2WMrGQS5USzL
 NhbgZ6jh3BnofuwdLhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1

