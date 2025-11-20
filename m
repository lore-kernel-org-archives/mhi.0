Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85634156230
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763617524; cv=none; b=J7/IGfbJ0q0/4f1Yha6th5dfbdIIEP9llfAAbI9rL/VRQd5W5UhibzsKs6dZH5aPF0r5Ww0sAlA5R3hyF/QozTSSOqHxDAv3EJ+xJ/FkdOrmJuqQkQbl+NsPPa+ADohhR1B7JF88zERb/geFkWtZHIl73tQmKPKPfZRMENlsKFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763617524; c=relaxed/simple;
	bh=hZ8Zb+XPk6p2PK8VQRVha4TEshtY/2wT1XfF6qcodoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LWtePMgdt2QFKzWDeLNG+e/vOcoqptW7A5XqEmRym/bYUdULhwDcnWbHD22nTLfWOnnhwhqiMmsj5vDTPehAMmcY+UADPPQxMeKoqk16ULo8J7DYZTYc/zcRbEtm71evpblZW9Jyl9Iyj2einXxlroBTsYF+ba1hg0Izg8sfwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vov/U6R6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFxPeiJi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vov/U6R6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFxPeiJi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pmPS3844013
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 05:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c8av3WKePdCQCUeOmyIDBHtGr8ivxy57ShX6He/2Aa8=; b=Vov/U6R6QnMmbgf/
	qThm1ULgil2UH0/odb2f4VFupw7LrC/iA6kG7flKrh8qTh1BxPF9T1FXR1Pn/tTv
	Rj37nnCDJW1DDHOgaCFjKF2s5f0gIZdAX8u/DEeBI8uBuV0zCV8+aprTBT/sp+N8
	YPHSDY4wGVGbBON0Sv6HtNuhN8pJkftes1fpc0qWbUQ1k0tFiypiZzH+khPDRr0o
	N6YONobohJ6bh5mg1LqlVnDefbzNO9Oim6qwVH6hpWEwmwS+2pPihKn9mN7p5dpb
	Rw1wsV+6lwIFMmoOgUOQXSDRZYbtJDVxGFQmKuf8BSjaje+WFqnoBrV++doOE6qc
	y6IdmQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr2tj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 20 Nov 2025 05:45:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3439fe6229aso603535a91.1
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 21:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763617521; x=1764222321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8av3WKePdCQCUeOmyIDBHtGr8ivxy57ShX6He/2Aa8=;
        b=eFxPeiJiDVXrnluAR61KJvJZn+UDpEmDZO8exZO0O2EYDUVmH+Zj6AvSNkm24RN6Fv
         UETAizJ3c43+Xd/lVs2oNKCBakNWZeEPTUOlIfD+XcaNknnrmZXKBfR1apFRAGfDBOEk
         29YGC/diYgd+vtSA1qHwG9Ok+q0vO0vrNFUZMs1Y2IUQQh1PZm2T81b2NLCdI/TtqpEA
         DPWO3cZK5trXk9eaAy/rEsnAxbBbZJotbpMcc747F1/x9keQzFxZsF+7YFEK+rb1YB/Q
         Yx45nToURaJk3XsYBdGwaj21tfdHicsXQeG+QMKe+qj+geic9amW5S/iUZPrtoLQWPmP
         MQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763617521; x=1764222321;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8av3WKePdCQCUeOmyIDBHtGr8ivxy57ShX6He/2Aa8=;
        b=Ppa/iJx2izPa1GmE4YR18REzA8BkTwsnsRlSAWiPEIIC2ODLImhuO7XrivdgZYbYvb
         Rpn370G/ljtXeUdoXL0WMRFWVjHpOh9A9r82Xu9gRqcjZcwN25kZHqwG8xUBGVuEk7RA
         f7eanNW1rvk7lPuOUAMlal0ZHKn1xzEg1UzKBprNqDpf3lBy9PhF3DjYtjViG30oOjo4
         EmpKaKx1E5CW/Wi0mad8S0d+hQvEFKcuao53kwxb4jUdIgf+RZGwlhpKt29d5yDc1cP9
         B8Hk27iqcuGzjXpUqACvPUSsstzVL8hfsJuqEoe5adhkUQG+Q9eLZsa3BPTVwf/QSIus
         0y1w==
X-Gm-Message-State: AOJu0YxoiVT0rI87KRpkjr1mJGE39sUfk6cS7Y7blLWT9PTUDVZQ1Ih1
	rFq+NhFF0pVs9vl1OhMP5kDNeCwg+xZW3EpOWfJ9IDx+RsRWGJICSl/HrVocrWxz4xjZiAvK0M4
	v/PLGuNgGz1pyll5/MfmAgJy/5YTKtwHzg1m9fRLjJvvlZDmfOHHJMkc=
X-Gm-Gg: ASbGncu7jMY8KsoRa+ktHruSHb7uaEHGOYqAynemhnJIABiRRq5C/mBaXbjdcpLP6iQ
	YF4ITEoLAkKVLIXOIBdDSdlPPdNhJYVuTBKBmi0392BftUC07r4dU0aVUv1V299B5bKcNaG+UWi
	+Bey+ZPCihA+70Hz5QypSr0XEyqPAVsFe7Aod1KH8MLQ/oMRooFvSDzNNB3PIz5kToNmAvYlD4I
	rmBDmecMwbJRdM9gYQzBz5T5SiKGtw06+GFryumqt3fQFFzCCqMDq7HyTk8rss90HdL+SnXYzvl
	3NgGX0st6TER7gZjNDic7xzwndnIheHQQOJXau0O9EJNDkNW7UH6/w+hfTHydBkKrCug+3ZZd9N
	wRibvMhQfNnNE2uqANAFfLcaZlxRTMGIMSYPwJcI=
X-Received: by 2002:a17:90b:224a:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-3472983c014mr1566391a91.1.1763617520924;
        Wed, 19 Nov 2025 21:45:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO+KG805i3YS+IeZPm/hdGaBmj6AEgCTQlfyNg1lYz4PrcEHQL1VlHyMMwTZs3ZKfP3abYgA==
X-Received: by 2002:a17:90b:224a:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-3472983c014mr1566326a91.1.1763617520450;
        Wed, 19 Nov 2025 21:45:20 -0800 (PST)
Received: from [192.168.1.102] ([120.56.197.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692e5d3sm1279307a91.9.2025.11.19.21.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 21:45:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251119105615.48295-1-slark_xiao@163.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
Subject: Re: (subset) [PATCH v3 0/2] *** Add support for Foxconn T99W760
 ***
Message-Id: <176361751471.6039.14437856360980124388.b4-ty@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 11:15:14 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691eaaf1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xeX0Tm50+WxWVv+NCdhSGA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v3APBEOz52XWWHmREQQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzMiBTYWx0ZWRfX4qoGTCOjGgnp
 mTT/y4O/muPsJvb6i9zvK4D9UONgO3ARq9CMCLaaElxltS/s6qphuM+lgjLYuf0z7gH2mvw3mSJ
 yW9R6HNzA2F6KcLlFFdogJzuex1yMdOKa3nvQNI6Ufk5jTCzMQNsPwipqxwWrT9LrtwRFrLpnUR
 wpfi7fDBLbeQaE1JKZoDVwCiQ1vP93GwMwuMCQNK2llUyr1F4ese12F+bcLhwgXLOScgxfQsKl9
 9ERWdKijWQ8BNf4dtWUd+X8sbLvv5EBZV6w6JYfx25IhJq0Zjvwevo1N9dDeyN/fSRIY7WKQY2e
 9KHztg3uaWuGrgrBJB/yVqEbVg0dsZdvXrSPZS9NJMSiiMgMNnLIkySkhxgfGKxHssRuW0hl2/O
 jKCdt0BpPkcsJLIDQ0MCxZdbuQX4+A==
X-Proofpoint-ORIG-GUID: PsWK0lDBuyGOqFPey1pd1BN7lU2UIu4l
X-Proofpoint-GUID: PsWK0lDBuyGOqFPey1pd1BN7lU2UIu4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200032


On Wed, 19 Nov 2025 18:56:13 +0800, Slark Xiao wrote:
> *** This series add support for Foxconn 5G modem T99W760 ***
> 
> Updates:
>   v3: Fix the 2 patches not in one thread issue
>   v2: Add net and MHI mantainer together
> 
> Slark Xiao (2):
>   bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
>   net: wwan: mhi: Add network support for Foxconn T99W760
> 
> [...]

Applied, thanks!

[1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
      commit: d44619821f46e724bca2a001fa7daa35d4e5602d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

