Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536934DB4C
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901923; cv=none; b=SJ2rAx9l/ez0vL90lILWlcnjn3afnKB0j8+Mi7xjGvFnyGM7xpcAQFjLbuTM3c7KXaFB/Y3TKlJ2kjq+Nk7yFnSVnw9q6oLXmmvVrQsjuP76FTCAMgDakqPiug6B+sVGAEQ9EPg7z2DbEHO5ze7HFIqdg6TZUspETEYE8EJO3Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901923; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oxg+yf89Mk7mCtFlLsDzhEDw2WxPpmX6HNUeQVtrQPEgFZAfxVBUTFpG+ZmcdXFJ+9Baqn2rITT67YNuLxyJO46KWPVyEWS4qy1KGdXe4QV6FqUNdxhBM99/OplGdU0UPtFfj1lCxVYflLuhya3ezplTodhpLACw1pSWjaI6mQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkZp3sUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yug0B6XM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkZp3sUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yug0B6XM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XIX93573643
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=fkZp3sUqKr59AwKU
	3uQq48p13b4vR6gBonGwvBmVjwn5n/YYbgRKQGX/vBwXiktFUhq81HbCwNCW7GQx
	AdJs03ZGTM2ggM9Ddue2sEYze0QrekcBpIPDuNn7Ltkon6+8QlbiKXCY6n1yinIk
	7Q/ecDZD66cnqUXbXDBqF2m83V4D9ky0+88t9zU4Zx66m1bl/YWl7wQMlgRyhDjA
	FrnWi+RtiXSskMjCJU8GZbxZRXIz/m/QouIEaYH4gHB2p7aIax9sfstropJL1srf
	i3/C0sB0dbhVo+s6P9F0xG9R3rMmVg6qeZgTKbfAyH6a10Tm31j/HtI990NGnQy4
	+/BQNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r8nd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Mar 2026 06:32:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0565d77a6so9768575ad.2
        for <mhi@lists.linux.dev>; Wed, 18 Mar 2026 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901920; x=1774506720; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=Yug0B6XMFlycy4I245rY5YSGWwG9Yp+fivanB4e/jOG3N1qo/VWHmxy0mWSWf9sz2D
         hFw+5cq6XsMpqnHhf5ORAS7ipaJxEzZlwYqya2bsAiPpGThBVNLBjkyAqb/8ynMjRtak
         MZ2/0dI2Hud1ZXScaQJv2MSmJRPOOhVR57UdBMlPsa/G12C0vXiHRmkJDsoBjRTWj+P6
         Tmz17sS8MV1Gs2cMpKmL8rXyjFocCWANK2eSXl5PMoNzHzSduqtqvmZHLJoDLHMPP+E4
         MxFD+gSw7riO1pF2EmqKeiOZhlIJ+578LNqZFlOvroKCTP7y5HZM6zwlaUhr+jnoFS0e
         6RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901920; x=1774506720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=CcYrFMAtdGkjk+uILNYZngDy3OU3aQhmVabJQT/0cNPgb8sKPzS/C8QiU32UyCEsmx
         vSep3d1X00VSh61m1YXM3U7zm5bngyBdPlTqO9IjnChwNQ5cBDwsxkrOyldUNAXXCFEK
         3UWYYLZsmPSUd61WZzIlYRGm+2csYxFvo5B/9RaFlKNIIyqrNjE+yYd8/75uAL/A6Am3
         TaCPXWkki0LJfCXojRdgF6b0tYCmoKgU9aQyWp0qxuvMlyk+w9GXlfxqcKeCKmf/0L49
         jK+PdXrRRetYvm9AnINwvN7dfJ7VAm3pYyzIulcoKV6o6n353xEU609OAtuzADifMuwo
         B39w==
X-Forwarded-Encrypted: i=1; AJvYcCUeESv4Iat1PRNQ5dPN4TvGCZMe0/dv2GOhvX3GIEdxw8CpiYbVZtXDscDj+96j9Gjt4YQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YylpfFmOL+8/oqu9DsQ07SrCfbu+VhhRhxCKneR8FJrwdbTQgxv
	vTIhs3RfMDgHeXg9gi66Ua20g802Dd2Yv66boij/+Geb9zdEGKrT1aiFTvjGFDJKCoEhWOrjCmR
	TnorbtahPnTIBPzoonkyBs93M79fcvfjytWccg/Ysq0DvugrkpDSQq58=
X-Gm-Gg: ATEYQzxAMwck/SC7CnZD5LpyEaZBp/xNyibBvkBO9IHWsHtcSt6b3TqY7YO974bCu7T
	+JzdJqfs7g1N6tPZRYULy2U3q8FQu/A9ln2495EP/D2rQB/I4rmkaU8v1G4ugSSVVwfImuwc/g2
	MrwYECh0sJxa19QLrSHrrQi7O1UdBLP8kmjkWbx/Woak92CcX9C+5Obk0apksJCbFQitMlTefw/
	/aihYgrBPROtM5UkdX0vyapECn5Xy2TEtOOfF9TpMbvRbKj524UBjkxuYki5GQKpiQZbPhRbbF4
	i2vaA29XaWlvFbepSx68P+8j2hOSJFqKEpzS3nZGuXLYrWfBCUTn+QM/KtWfQXGPEThcbYf9X0L
	xePIjV9pYlxPcXbMJ3DPofLBVn5jhlR4P/7fsF8/w6hk3KdxClMQ=
X-Received: by 2002:a17:903:3810:b0:2ae:a429:fc42 with SMTP id d9443c01a7336-2b06e400620mr66595335ad.40.1773901920343;
        Wed, 18 Mar 2026 23:32:00 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2ae:a429:fc42 with SMTP id d9443c01a7336-2b06e400620mr66594985ad.40.1773901919866;
        Wed, 18 Mar 2026 23:31:59 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:31:59 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:43 +0530
Subject: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=e9fMzcaKKjCxCsbrxlVdE5UJdojNscTn2zbL9SlQlbqh9xy1a1pnb+eD2q55B5TwUBYiq1GVm
 7P07BMMwHXWBaY4PRv2kbaKxxJwiZycQYlSC1IZL7WAdxVcWpfcgiJ/
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: WP6mea5UAsOvxvy-UDsuJmT-xgx8WdVr
X-Proofpoint-ORIG-GUID: WP6mea5UAsOvxvy-UDsuJmT-xgx8WdVr
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bb9861 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX+ldxYwAKMl1V
 mfnfpe8j+orw1XVs1ZCkxCoXGWY59VFjlSaBmVeLrkuldL0/cZDIjekX+8jMT1jXtXMDIsD6O8X
 GQfunl69x1DZcPcTyV8c4sQBkKFV0BGCuD9T6Abn9Q08FF49c2o1n/GOLQQMVQa2Og4vObypi5l
 c+++X2SooIX/NfgPVBUaz/cDVUmUxTDxWjG/1qsfxW70ZKmoIL2UVlevLV5aQ5jwHokl1wRrA0j
 f/goZR+ll7vMowWM+oqhyC4aL2rbvq2Z4Ol4FXy5jwxlkmOVA2q5BPdHQKra5dieSfkZalKmMpn
 klJABy/fk9gIre+l9kEJRi+IDpsWCsyjokJY6vQXk3Bot8CPNPH2WeeLOM2IcGeRo+qI0ljgw8O
 YXSWo8l+zKAvNcP8p+MFAvjjcuFTOOV4VgE9UW+J1IQva08dYhapS/7XGZEDZV4eDqUrmOrvxoU
 bTZ9/N0cydXdRpidsxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

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

