Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093056;
	b=N7Er2uYz2DGxJL0DrnL2caN7muv7dLBY2cfqVQpOqaMhierjuYewhBcDt4afiZnQqiPq
	 p54WNV3X/md7oWmyzvR8YCcNSgJHhYlhpgIPB27Z+JxDjUjdx47lp2UcCLyDKTWgXXEsS
	 5O8jFz0ju6mM8gaP9Y1V3zwfWIgK/aoB6XJsypaLLLIQ/J0FENaKquDT7XlS//1vjqM8B
	 3B5u4/brrQMNLhda5WtDCWWhUUPWTY7eCmwPBfIPOyGURPkw7j2xydJcK4J2X18xIq5OX
	 gxD7T0DMYtnXSKNOtkDZkyAr8kiVVzgjfqmWZ2v02jYUIrU7y2w2JFu8wdEYRHfOlfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093056;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
	b=VzGOAOzS9DNGs1OM0WfdwYIWx+ggmTPVt8hSSLr39BGqsn33MaGNiD5B+Wr8j30gfx6N
	 4sau4CnJfYQzw8/g/9WgoOZlUQBaXmY0b+mmeFcl/C4eJDPcxN/t2riL3atCSpwKi8R/6
	 Gj6vb40QhiWj3mMgy+27VNZweec9odyfU+YjvYJFrnwCHr2Zc6jkWOZDjqAAWCbsZ1kqm
	 ykDWNpzvbhpHYZGOii4GyXWf1n01CmYjvHZt5fhMAbgtp+jpaJIh5TY6vZVHS5jPG7Q3e
	 K1TvhcHdxZavn2Uvbk/5gdA1kCs9uxAJaqGAmiGZ0+5vP77XCaDBXRaoPxhbxMuh8CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNFotFaL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE97C60A260B
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE97C60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fnOJOxjc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNFotFaL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkBFi2331724
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=; b=fnOJOxjcVJhPPc8X
	Tq1g+pIsA0wtmc0yQZgp+hJyTnaAjcvMFOlPWCQmFNS+YvR1W4YMTSSEdKAOjwF5
	vY1dJAWVXzi8WMUovDx3M13R9Xlc6+sUm1eKZYq4NjV0QKGWS0t6uhhZNMi7HXxS
	MecjPt1HkZbkTiJo0JG3sUv5Lxikt8M9mpu+p/KsDr2aKqZLl4wmpKA+Qqd1OzwE
	Sb9DJ0l4qQhtOzLWmOE3KIQs+7daAohIPeiE4nGyPLYImaFfquMhinR8q7JAgQI7
	0H0F+6wYjCna5DBYU+vGbaeNyHtTlrye4ngFKyr16yKtn1Pe7k9pJeEp5m5C1XVK
	EtfqWg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdctvhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so1438109eec.0
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093054; x=1795697854; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=GNFotFaLhDNhjJZ55SMhfsEIeELXDsHAPQQJMW+OgPxeR09q8bVDrm5wYval/ai3/m
         GgQznQ504UbW0r0bj6m8QJqNe36qO1mJYtz4x1CNxiyrSyquatrcVMz+5Hpd/y6kaWAP
         vY/lXrIR2HM/jPtBofSDY+QNs7GerSpg3u+eiWwVmSl8J0vx8/7SRQO4pvVqCmrMkpso
         LdS42LIqeI7yor+A35FFNLUHn0tZWKYYeKFJTCbFfOG3ch64k3lalRe7RKFchm+WCbmh
         U+cNZV+e0NYgXHWYmAsUt/wG17ma0NvFqTLwDzWgS6+TtIXc4iKP7Wit6oRAg3L+QHDM
         GJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093054; x=1795697854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF8VzT/J2/iP+99+TvvpQdbS2N6QK+uOBFrf4qDPfF8=;
        b=EB4knGU9Pu50Btx5x/Gz+hAkw+WdQsDekZJYnUYqS7berAZL8xmOt95pAAYQhVw5/W
         oLMvTX38IFH4a2fLwSLLN8/bFxMBGvgCkOqJPeUPFChZlvLmVweDXP/hdBcydXw0yM6G
         eN5LJ0yCUbo++DpH3Hk2eHocJgfswPkirNdG4kVGETPGPV3Yy2X6p8ucTmaHozWXwABA
         htwNzvq1oFAKISN3U8MGgiRa67JuIjhRTLxndNxRINpksJBhkqw/wHcDOPNkt1s3VkLc
         QROlow2+T+YKRlSrvxGK4eOT2qesB6ingMd30QJ/qIy7+5uqTGFNhh/Qz7sk75ZYxWfR
         i5bg==
X-Forwarded-Encrypted: i=1; AL+hErFdU5vG+SsVjt9yYeLb5tXEf7k2wvPCMoB50A6KP60BWVZwN9HAXOZeUYZzF6EFEToJ4C4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+iimyWaqdymR5O0F1DeMZDWu/PAtl9Sw3+kson8ZOXujQjN1su
	P7o2jCL4PTUJvQlDq0bR1YLufkzu9SzmIvT/ceI72uzbCR0QRLQ7wxcAs4c0LVnQV3pbBsuSh66
	bf88mdrqyeYFqzXz8Nkn5FS2QlsX3at1UZd/aExPliiTZBAi8A34HP6U=
X-Gm-Gg: AZFdTZeYdFSnTDXMQ6ILZrH5pHMeer0wa4qntEVtgOSh/+t0aEuAngpoDY82CGARIDQ
	n/7opl8AgDkgmYd92DnRfrMMRvy4Y7R5NJ7w5uB8kPfWKacnoTtxfUQKMPhz6x9/uPpxkvvA22A
	r3DdYl4G1Oo/uRWBJwY7fJULBUcQKoNlaEGkHcvyx8WsCKOJRfFvqW/hDvenPwQYkQKVvUqvL9D
	VGLezzba6ndu5B0tHZsZyEcos73/zPvLw6j9uuc9KSYf176bYByYOxyYSVXzGQjFHdELqX5Uhm0
	O7lLZGt+7E0/HSzamO+qPExMwzwvEDou6dHR93nutF9hHXyDpWZ2UDpvTRTbrgbLYLVVZqsbn7W
	3aYQPIZNyKsbPGTNIQ7XsQYpQfTT44fy+6VY8yjVHCGcA9YyHxcTptq7R7NvT0DVwoSIrtx1fAz
	NUFqXdGw7f
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987991eec.2.1795093053789;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
X-Received: by 2002:a05:7301:1502:b0:36e:a321:5353 with SMTP id 5a478bee46e88-3827dd05625mr4987957eec.2.1795093053264;
        Thu, 19 Nov 2026 04:57:33 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:57:32 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:39 +0530
Subject: [PATCH v6 7/7] PCI: qcom: Enable ASPM disabling during link
 retraining
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-7-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=1086;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dixWhgN1FcwflBXIi0Se/61aBMCRn0NVL4pFbQ5pD1M=;
 b=PUZk3GeenFpAL675pkSjVwlCW6zpIzwS6Gmvb7s0aa9docOEiXMtvktcnV9mru6evKsNiDilX
 wUhqKH8Hy86C6QnFabVSxqG6C4LbGY+SWRnz4vitzqM5gfjezA/UxS4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: QCDQrepPMM1qhJXKVblmT5xL55ODpnCN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX2rDgeYb4kthy
 3cVn0LKy/rIcRWc+Fk86094IpVNcOS2ijBEGwlVPMie+0GpH2dDOoEcJOMgRCGndJeZBeKgwX8b
 DZg8Bp2ktMCVWlERud0hSxk1i68fxNE=
X-Proofpoint-GUID: QCDQrepPMM1qhJXKVblmT5xL55ODpnCN
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afef23e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=R7JsESPv6PNixK4vMH8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX+/9ce2fJrvyC
 SjOGFhI0My02873tkS+jjPErBc76r9IzailW1XAih47Ne/6Xi1vd9BeLao2JX9PvHsYhp6sRwoz
 dbU5gBT0WPj7FKlbAKAmrDGC2S7QAu5Fkq71x8nrbk8j6Tma707Or5+sIpbDUeLu8E+z9XQZQMr
 jeE7tNJjCdv/lCmAuxobF8QgvPMLvTU90H6rsmqVHY3KMKpDwLsv5OjP7CZwH0wXD32GrlPBFX0
 doJS5Blr+04ox0vh2MnjnoerDaXhV7hSZn6r3bP2emk2p4tyDcFX6dIlJKzbxOoNVCn3dBAQA5x
 mcQU1ec1SM3wj2O/DZ67mI1mUvdcZgjWm9tiJxR9rk8aZy+55PkAPov2sRlztlupISZzG5ehLAg
 +SblrtKDpS2hRwm15ycis5ss0RTqhaWWWSNXrci3qGssNwAVpUmbQ5gu4yC6zh8dwW/eWyusRxk
 xqJWv5hFxT3H+uwaNlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

Some Qualcomm PCIe controllers require ASPM to be disabled while the link
is being retrained, otherwise the link state transitions during bandwidth
scaling can fail. This is a controller requirement, not a device quirk.

Set the disable_aspm_for_retrain flag in qcom_pcie_host_init() so that
the PCI core disables ASPM around link retraining. Future targets fix
this in hardware and will not set the flag.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 9b113536a82b..473f2fce258a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1514,6 +1514,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 
 	qcom_pcie_perst_deassert(pcie);
 
+	pp->bridge->disable_aspm_for_retrain = true;
+
 	if (pcie->cfg->ops->config_sid) {
 		ret = pcie->cfg->ops->config_sid(pcie);
 		if (ret)

-- 
2.34.1

