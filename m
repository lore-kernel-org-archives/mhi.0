Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51D3E7179
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127348; cv=none; b=h2rvLLeEiI2oEX2xEiIMc5H0tGHwp20P2RViVMyc8RzxWNnD3RUrGQ+40p1eruhynVgRzGI8zaav457UVBCSu0phbzoS3Pu0FgXnkKcA3e/AVYHa9p4IMw7qWhWSVWJHKl71ATs+EKdkuxKJ6v+/4EnKZsnMJ//BQTlln5YHcWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127348; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksj+vtJWoEVuz6SVV6GL1LZANpG23Q6qBe9GLfbdGyLRUflOsokqWkVfomPUJmK/+8jkvQ50OlgeLrQBIv0GdqILzMgg7JeeenQ8NV7N/Ym82LllQN+f0bXZXzbeRM1c3zsIhUKBuczDAUnqy4uAp28LeDJ0kAg28KfFE53z68I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE00zKg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amWZfeUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE00zKg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amWZfeUi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EIvA3754619
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=bE00zKg82QpSEXAE
	sUs1tgKxj60OvCcicGr+h9SRIsymVM+bIeE+ZzpohQMX115+Teu1J3/TxLvSxX2R
	4teFSl2ZGqEpXBWNOL5B2hjg82A9yKGx00y99kvWsm2tjrUuaqrbuMhDwSCtVSUA
	sNZdcbMNJzutUticdx99e8ejvLsdwHrdPQT0okl+TyxnVQ2kM8PLSoJD1xVP50Lb
	QGAq3DOTY/nscC/ihSxVkhWcOIAAWxZ/tv6wkQtROLT12iEIggf9kA0y3MobxHH3
	NkhERxlQRyyXnnTcF9ku0QpHc/5P/LOE+BuvWj6s1AEkNx41NOscxDqSdctMJkMN
	OxCDHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477j07b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 07:22:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae50463ba8so480487435ad.0
        for <mhi@lists.linux.dev>; Tue, 10 Mar 2026 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127345; x=1773732145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=amWZfeUimlUrxNAqBXDZA9w3MmyxRCHZCahQ6qPpyGWusyXDeVAyi3iw2WSaibSm6K
         evutj6xJJU/IT1JR5yGROQBI4NAubca/kjllBhPFDnQhkMuSjCYzhy85r2gvjYyHGnui
         joJAUcPlg7PRxzs7RYG0hNV4VINLK85UzfBg8VGToXX+b5hvuq3ogcoPWeHy8LtPLpqZ
         BzgJFYES1xlUXeyF4rirtplHZWTglnD4d7e8g4X8K0kue5ldHy3yfoXdorJD+kMbmCKn
         UJobEnE3bxMcjrUHBLnRrrayXnzbKdjNrVo3QYQImBeKg9jCKqncPjN5EXJrtuReID8j
         DOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127345; x=1773732145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=DdfrdUmEs2P2XAX7x1rlHds1vMlU5qrGTVeHchPlcfbn8SusG1+tNpB9OR5p9j+gdP
         bswpXwcUCzoILUTJmI7kDIpbqXK06UYJzw2tES6Eu0kQa953HYs40+18aKRltIL5MpU3
         CvmxJsCV+AN3j+0RPw26s27jFZnamHwDYLmC+fAoZ6hDRIytGEYLUpwbvntTOAuNG8gC
         z36SZh6zBOFiE4K2x3KLkqnVcK6F9VeXUl6mbx5yQwlXAlB9TeQ2+syAbW9p5jpebw0l
         pn/CAHjFUElzVVeEbpe0rP0idIiwRlHdWbBDP+hqZFOf2DZQntBbjOgIpMtZnwfoUN6f
         CAKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB9VkVyc69/v095VWErYj/QJyEqlDKpwOIK6FI59OCfbVVgiyJmWcltggoEGl7k4slM8A=@lists.linux.dev
X-Gm-Message-State: AOJu0YznmAZ5dq5Fcu9Q6LokIrTr72FTgj28yxdy3whnIXVn4NLN4SyH
	9xq4yGoWNpcClf3YrbBqOQ7PbRkaNdEvUAJSx0C/8j5TMSjCcw3+fFfopIkVhy6b2oDi3lafRWj
	DUWhyV3LgzxNxlS5VdJhzXIPySoUkcEYzebalI7CMTG12O3sPJHakpTQ=
X-Gm-Gg: ATEYQzxgaNXMBqvaWIFwXZzbAXAOH4hOBjcoAib5iLSNfNqucmawR1800KzhyP4hbAy
	XR1UCk4jc8Ft7KJDa9yuQGDJV49gXaOTtEi81YbVWv24hVV/39HrmUVpmGvFVoUv20xNoosFcEN
	CMqHeiN2NIGAs4GlYf4IXfOD+8e9e+PbFpqxTG/sINNrtbP1EyNshdtGjQPKkGWuHnVHs2Mt3+k
	E1RgokKW2YeYDa1epGeP7Y1ZH1Td5szhFhJz0oEqGZ+3uAf4gkmKaF8XiPuYzTcNsOgaz83MySa
	34REBfx/8GGaWmAhSHMR7IXG8LKmur46Zpf+gWrVUs1/LlF5/Uhx81Tswf/mHEgXGNacyedN5/g
	fr2bUQjGhdILFbW5rmujGDJ7oN+bBbmRt9K5n422zjxnaxA2tEEU=
X-Received: by 2002:a17:902:e94f:b0:2ae:4b91:8407 with SMTP id d9443c01a7336-2ae8242d12bmr146751985ad.34.1773127345319;
        Tue, 10 Mar 2026 00:22:25 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2ae:4b91:8407 with SMTP id d9443c01a7336-2ae8242d12bmr146751725ad.34.1773127344908;
        Tue, 10 Mar 2026 00:22:24 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:24 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:00 +0530
Subject: [PATCH v3 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-3-994ea4b0d5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=JpWPX2Hky7cq3Nl6hLOjQzB7LEodbqyGjGzdh/B0/3SOpGWRzPC5Y7PbSt0UPu3GoyPubIzcS
 ufCXAQU53epBVWp4MW4wO6vSR7tsCwarDtfd8M7z7dvhGKxtoJf6jlW
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX7GWqTRM0Xipg
 6+AYRKhGNjgWO4XOTfRmezjHLC19YHbM9sbnPI2eu9mgaWEBhmx022Oufl/H6J5SrxJs5xPQoVR
 nJWNQEDJPTXTIlhQgFsVkOlrT24Z8p2ayVkBayqhCA2LSrbFAtu4UBf2dhflLlf19zyzejqf6kD
 MvopERjdmC/suty6FcT9H7tzXnAt9VVthCEqdm5JNcJK4CKVkMCPZkq6W7qfBHInrEQSWdlzLQv
 kerMBobOTHAON0bf6pZvThxZwEP+DQDV4E9Va5qq0gcGF3vF9071qXxoOsLd6W/qhqZr4Xmoked
 /T+cMeOIi3ERJrxKOtH9oTcNb/pE0B2MaKawDwfdRFRDYL8LWxUhgxO/mKS5cWASrB5O9ErBO7R
 Q6AX26pHScOsV8a207i5WUmClmEO60EubQXx7pGojjRWg9KYh6wIUucmTCTy2tw00faErltX3tO
 lPkgvwkKDCOJVA96nHA==
X-Proofpoint-GUID: u4J-szU0UjLqUUdixhAp1f3RWx9q5Mas
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afc6b2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: u4J-szU0UjLqUUdixhAp1f3RWx9q5Mas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

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

