Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92035389DE6
	for <mhi@lists.linux.dev>; Tue,  3 Mar 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528545; cv=none; b=CmE86ca1uvQKyaDeadonlzLFQQTc4zLKRG7WqVAmcwy29gcNDC8l4Y1c5lLfr+KLCFO3kuy1JE62Axu/v6tnsAGMdAId1z6JyWMl9NyaVTT585+7C/6gIoQMXRPa9ScNnyt2TD2m7hr9dZeFfpPJmcTVrjO91T+N0L+6TC6iUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528545; c=relaxed/simple;
	bh=nF3allrJaPSurlBTOy+OjL88YEUKbGJ3Wzw9ZYRFU8w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tfPIHo8IFIdkrnKBWH+zzoF5zmGBbdwBsYetYWVkIS4vlraRIRRtCw9J1KkIJHxhh3s7RFF2gwSyaJ2iCKX3C1GBO1ocIytoe/4k/qbgaRPgjpv7i/3jUhaZ/mKxEPK8rzSmm9kuF0V9xDYH6I0QZuls2uM0dzEBXhPFRVxCxns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI/W+FBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDjcq8Ks; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI/W+FBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDjcq8Ks"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235sJQl2208416
	for <mhi@lists.linux.dev>; Tue, 3 Mar 2026 09:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x9stiGj0JIZWulRxQkg2eU
	PltuECBDP0mhJ66zEg6Kw=; b=XI/W+FBkv+gkS52+OMQ1NsihkMKe14F2OJLlJK
	ylY4EC5jMGceRtr6ulr0rSMS3xT+eMosVCNvvCYZ+zQjwxgQrbWbFUG6wklgVArV
	4338jO2z1k6fgKOGMXi71GVUc+8t0i0499DmfaZljVyptp9wVuAXgj9VDcub1JdL
	Nokdv9Jaq1cklzMqGSJE6nJwkP3gCeAjFqnv3FDEzNLn6brFLDxLwE8dvII/LL2R
	7afxiL4vRp6AVNysqP7pqe8C+BhB4GkEl19Zs9LP2yEM11d30iRmzLSmtSlnhVoa
	oTncC3ASOj8vcflMec9+OtZa4ITT/uzfItOWkWOp76TtLoBg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe0kv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 09:02:23 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-463a1cee56aso55431105b6e.0
        for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 01:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772528542; x=1773133342; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9stiGj0JIZWulRxQkg2eUPltuECBDP0mhJ66zEg6Kw=;
        b=ZDjcq8Ks0MXefSLgh9u8vn4PEOhyFq4BnqqcBjq54o7mQO7rwl8STIbxsWdlZG4MG+
         4sEXFD4G+V56AMSbCRSYYy5hZES6PSnt38P0lCue9V039/IkTu5B9++zKHsKiAJXwPUX
         Id/9EOPuvDLHCR4krfz9MNTx93S5rAeyaKyUIdGaGW44rCa3fmXZBEhaHDqu0im+Y5dF
         DgnO6DGqQdgtgzCsKALKx2y05Lz8hFaaiHZPpS7zuST4EZRi0CUTUpBbn692KcSDRKGx
         gD/0NpTrtBm31fhnW5SKdhH5gtG8GONe6ZggJyAntO4c4Hlmc3pcK/ecEX2FzMmlmhcV
         Z4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528542; x=1773133342;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9stiGj0JIZWulRxQkg2eUPltuECBDP0mhJ66zEg6Kw=;
        b=OFIpQYJfyOTJY9wOmgf6AoawQfxzfw3UTNYjiR8nDaub+0WSo5c8TWbZ+28QRrDrfc
         At2RDoC8RuDw8h5RdJ9YDhE90gX6FNmnYeMvSwSAaCHuxzpvkwV4Gb5gwqNJI0wdGe8j
         wsI3LOFNQVQdU586nffkppC7Plykaw6BS1cBA742Vcu2cdnwHEwcrRkB891UXyWBeYbd
         /AdOCpnASX0jT/Tnd00O0dc88rOwTAaOqhdckEMcqzlMuHqXiXOfiOSmiii1//N1lqoF
         apbUtTMc+C1/121bPeJbbrgylgK7aTR3ax/43PglYAi0h8zuib894e+R2UJxCSwL6JjX
         6aDg==
X-Gm-Message-State: AOJu0YzS68AUPO2ZfIb4II2cbDDhKcgLzVMUkQFP0gRiT4+N/pTWhuwN
	6m8GeYkZ08QCoyg6FoyOX8WubP0xc1uSURvnCYBAJhC6EPIQJ5emN1hDDlDY7qa+G0HE4mkAx1P
	WY+67uKylNt2CBWIBc8vyF8wpok/rkmL7a/AhUeZpRj0qTD6NRwfPWjVAS9bovluOcg==
X-Gm-Gg: ATEYQzy4dHQH0KJshL+960Tp8kNz71X05cD9ZZDs4JK6sEmbEE8mTf0gAECUgABjhTT
	A9Rn8dHJuKW2v6rXPT47Nh+kXEnr8D6QHqtfklkG5sDiMBI2+Mtc2gu68p8c8xJcfZKi13FQLQG
	d+Mt98k9b7MF6vdBJ671AzK39Jzi2DP63LxHU2ZrOLAijVrGmS+IH+KMhNgqguWwkNd4sKzJXNO
	CFO6WKtm48RWTa9kh9FRut1s9egmNLROzC+c3MnhhHrKNhktdA+8881gOd/VIsvnjyrre8AfVwI
	dE1XJWEPnLHDNgirmIDlShJewAbeIJWpSeViWNQXB3U6LARp+AteodWOG9ESY5HEBOsPk3DkUH4
	sJfWvFDk/jyDJCfWKAcP8p0brEjp7hoWst1HJoG/hNWZAfvG0NkF/OhwG2/cItZdvQ6ie
X-Received: by 2002:a05:6808:1184:b0:463:c56f:a45b with SMTP id 5614622812f47-464beb27715mr8785050b6e.28.1772528542491;
        Tue, 03 Mar 2026 01:02:22 -0800 (PST)
X-Received: by 2002:a05:6808:1184:b0:463:c56f:a45b with SMTP id 5614622812f47-464beb27715mr8785030b6e.28.1772528541987;
        Tue, 03 Mar 2026 01:02:21 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb604f5esm9288908b6e.18.2026.03.03.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:02:21 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] bus: mhi: host: pci_generic: Improve boot
 performance and cleanup
Date: Tue, 03 Mar 2026 01:02:12 -0800
Message-Id: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSjpmkC/x3MSwqAIBRG4a3EHSeoRWRbiYiyv7oTDYUehHtPG
 n6Dc16KCIxIXfFSwMmRvcvQZUF2n9wGwUs2aakbWclKzLWY4uPsePgLYfROGGWUhUELDcrdEbD
 y/T/7IaUPn+jb3mMAAAA=
X-Change-ID: 20260303-b4-async_power_on-9191ce9e8e2e
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772528541; l=1196;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=nF3allrJaPSurlBTOy+OjL88YEUKbGJ3Wzw9ZYRFU8w=;
 b=pFY9kEsq7rZvI/+O4GGwk6J5ndc3+jp7rMLnCJ738IcFGO9wVwMms9VXx7kt4K6ytaABbCcUH
 N+wM4jRxFyLCgEYE6MFkBoLjS9IXHgpWw/X4lhSj59h3wfP/7ndjq0o
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: RXU4nQ7qWG1Bqi9fkfkKZellLs8QIfxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfX87q9gLfRfnyB
 l1TwnTRUZycGt3A8OHJmjonl4FnzX+pm/NSOJyrZeJVAOCtk/Iihf2BQyLDhjay3Kxw+xOJFteP
 ox2xuUQoPcyX/upQcgE3RINB+s2yfE1NY8KcTd0dh4Y9H1dIVrKixfwZE8TkthgbGYh5Zh2Dn5v
 /15MqzFq68d/tLgnkmBaaZaXSiPiW322kkP8gwGvB77aas158wAIuJUgRnk48chdALXqkI/OXYN
 wA97q0NU6vtjE2aDut24d6npJue05YR64S/DD6miJfVKkzJWKrR20Y5dEpGb0qI13MuxDCLBqw5
 D0awwCnpN4KVwDWKFbDOXMDZdfnwR30eaoAIittasXSY/vQyz6IG0ppirCrenq8XSembyQRo/Mw
 ZHWhLNqyE6c/n882r40cm5fdlhterMki+S5YIPCCI1KHmd4WxdeTEm2hsP1nADlcLyDJX4q7gGn
 BznNC2oeWllXR4eXouQ==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6a39f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xtHKfOcq51I26jS6Dc4A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: RXU4nQ7qWG1Bqi9fkfkKZellLs8QIfxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066

This series addresses boot performance issues with MHI PCI generic driver
and adds proper cleanup in the remove path.

Some modems like SDX75 take up to 20 seconds to initialize, which blocks
system boot while waiting for them to reach mission mode. The first patch
switches to async power up so the driver can return immediately and let
initialization happen in the background.

The second patch adds the missing pm_runtime_forbid() call in remove to
balance the pm_runtime_allow() from probe.

Changes in v2:
- Make a separated patch for pm_runtime_forbid in remove callback.
- Link to v1: https://lore.kernel.org/r/20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (2):
      bus: mhi: host: pci_generic: Switch to async power up to avoid boot delays
      bus: mhi: host: pci_generic: Add pm_runtime_forbid() in remove callback

 drivers/bus/mhi/host/pci_generic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 6a7084102bb9659f699005c420eb59eade6d3b4f
change-id: 20260303-b4-async_power_on-9191ce9e8e2e

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>

