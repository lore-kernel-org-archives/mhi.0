Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F2132B990
	for <mhi@lists.linux.dev>; Thu,  6 Nov 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762435698; cv=none; b=IK94RKeNONAqdbOumUkqQPaLqJbXF3gH2gVGemPS4g61ROqboIlUpV0y32mMsJc8Ne1rL7zhlQDtcOl9IQNWPjfldoha0NnIIN0sZT3vx1eP4omPrJY9kWpmCCW0cXH88DkpOf5g2onf4cxUSYV+lCMipei0xXvGMrrmCwrfJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762435698; c=relaxed/simple;
	bh=2h1I5+IC5FJduxoWNinXYw0aN3SdJu1DaG7hWWK8DdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r0IPSbWtT+x0vdJHS9QCo6VXfjZqsdExewgrrF0bWLfdJzCOok4Ppuhda+SZ3ZS0NBO+GtggJRGOeOQR/PheAwrVRlmRUlv8oanoulWtw3XvuiZOV0rFVQYddihKvCzAIGeoIZCo6T4CZna8AxXF3J8QT22chIqGh7rtA27eQ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I68URC+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4Hns+WZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I68URC+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4Hns+WZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65wEeu1786137
	for <mhi@lists.linux.dev>; Thu, 6 Nov 2025 13:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o6mzQWJ7nU2gb68GlaeuTy
	m+gIZLvymtrF4X9C3SVhM=; b=I68URC+GaXWmwqL66JIfNanDe1iPj6smB/MKc1
	XbY6MwXTbIdpQ7u2MXpKLAhKeyFJ05cCzpDTRkC+ukaOJGd1CJ27QDRKSwHYLy+g
	ajioTRtj0quxs9BPp46ZcnWy2dTTR3PLXoQ/ypXT21IF/Flf+r2C3iSXFCypKdnE
	mo/cDkFx3MSo8/VvT01IcTiH/hC1M/i9Q4Z6nYdWQglJgXNDXJEiEqqy4nCGVRz6
	GTPUmUCwRhBmA4cG0F7Zs3TnBlcytdCgMstNyx8fR2XmY7uT4SYYHfMxh/fg9TdR
	7a/hUjixoGJqbkTCaqPy6pDf6JWG97I/zXEfm+l372zgw1qw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8amxb68p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 13:28:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341a72e4843so1183805a91.2
        for <mhi@lists.linux.dev>; Thu, 06 Nov 2025 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762435695; x=1763040495; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o6mzQWJ7nU2gb68GlaeuTym+gIZLvymtrF4X9C3SVhM=;
        b=P4Hns+WZ20cUYhWbI8y3XhS+O74VlipT2oMwJH4sZ/SFoLayqnM3lxnVfvrATx6mP5
         2iqaa13VB6JTP3K0QjQXR/9/AW/0MBnVSUhGPyJ9NecWD9AdlGh/yQEJmB82IYXFs0g1
         bWWPmp8txbqIaSNriIFVUfSV7uNPPFOi8BdQIV8RQIZxzY5Ix6wDcX6wwuqbj6f/BttE
         iPQEPsMuM1zgSzQYqVO6/cVPYX5+kYDgdwGVbxEIF03d+hOPo1w5BGGI/nORvPW2chEC
         c2TiGlTzPyr7hp3cBcBBhx/JFZVgU+UqwISBT2bBTBz9DomnOZ1HzOUTidxlfMVDJs26
         gLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435695; x=1763040495;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6mzQWJ7nU2gb68GlaeuTym+gIZLvymtrF4X9C3SVhM=;
        b=OIr5QkPYkfa8XQBJ9p+8D5cY583NTv6inN5N9dcjog1LgE8qvfVQO7GDkQtXY04aGx
         zUiSCHFXOXdCZV+jj3mt89V2J1lE5Um1TvpQQ9NMFbgX9B1xmcU6olWNrkfDI1g1nCKh
         SP4uYTKONqZ3wt3eCWHNCu61zBV/bZqn2O254w465JC0ySVts2YZ+NwoRao8hKsvtqx5
         FMGzOMqYnSO5PakBg4nTrsRPpKYT2F8u26JdzNTJnRAprJabcO7bxH99dCywSq6k+Vqy
         Q0MXFOn9WfR44PTBqgYYqQgSKUgyQvzyHlOigeMI6FabIpyKVS9UQdlRpz47LfV+/9+z
         K4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU423MhE/cK2mIRHUMkqL82R9nRPC0BoKK4NIBmyOG3yQtd1VWHhjTLEJS4MruXPV38GbI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2G2dD+GU1vAjk1mX+ZPbNN65ypbd3oyTjrvN33Ytt5e+si3zy
	gpGMoCEAmGNqVEbWsNhmwUDv4eWMHCl8I6Faz7svCMqY+L5hf4smBYS/KsWLMD1oUlTWdEiBt+k
	nT8gNlYaIHBkX1TPq3uODoj2LemY42iMr+ZilhGhc6TwR8ixMYX29vwU=
X-Gm-Gg: ASbGnctDf3l9PSrq4D4pJGYs27tdv1VDfNlm+hqV3LlitkPHjw+Jfa1ohim+cANda4j
	YQRtS4WbP/bDnAB3/9i0wR2WKzsXzNJYAa+s3690Rktk7etm0jxumF+CLQ2gSMFRrXw8IGvc5GR
	ovNgn0rGqXtGoHlQ3J10eXnaBW+ThYZZRy/n6NLl5A/ngimZ2tKrscmq1J4cO8e5uZFpa549iDW
	a+KbhMNAWIqnfOnB9380VEnPdZJA3JoqC8KDReWi79kl7Tev92/gBPr8pANM4U0NKnI45JQxnk1
	K3naR1KHjR4Yu1LGnkN3IXe3d2P/Ko/wbvOPmw6N3supu5p9pZKngoOrndE2ZDsNeRUpMP+4FY5
	+Zru0WYwDXXlhB9kScF7FqKLUhA==
X-Received: by 2002:a17:902:d584:b0:294:fcae:826 with SMTP id d9443c01a7336-2962ae9e353mr96453135ad.59.1762435695317;
        Thu, 06 Nov 2025 05:28:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSFxsiJ9uoiJUwbYs+c1n6AQH0+KN6pf7n2+/tZuBDDoIN/SDu6tuMS3691C9fjWWe+K+SGw==
X-Received: by 2002:a17:902:d584:b0:294:fcae:826 with SMTP id d9443c01a7336-2962ae9e353mr96452765ad.59.1762435694673;
        Thu, 06 Nov 2025 05:28:14 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1669sm28770225ad.94.2025.11.06.05.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:28:14 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Subject: [PATCH v5 0/3] drivers: net: mhi: Add support to enable ethernet
 network device for MHI NET driver
Date: Thu, 06 Nov 2025 18:58:07 +0530
Message-Id: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeiDGkC/zWMQQqAIBAAvxJ7TtDKoL4SIdputRcLDQnCvydBx
 xmYeSBSYIowVg8EShz58AV0XcGyW7+RYCwMjWy0UrIXCSkZT/clfmXo2gWi6vTSOoeDhRKfgVa
 +v/E05/wCfzajDGgAAAA=
X-Change-ID: 20251106-vdev_next-20251106_eth-dd145c3bbd9a
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762435691; l=1362;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=2h1I5+IC5FJduxoWNinXYw0aN3SdJu1DaG7hWWK8DdQ=;
 b=ZwpGqEXZUQmUg6ICYqqWCw9x0Kokox8JXNsLBX1vf2dZG4LAgl3f8PKnrOe11Qr31Ydc4dqAK
 lXB7mcsCjtCC8eNC1Cfp4x8bgHz5dxK2yApUZ62b/XdBoyevAxj7Ser
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-GUID: Jyany94Vi2BI2ChmEznvyFxXYjZTc_qH
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=690ca270 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=veql4nHwU9hKf8MHYCYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwNyBTYWx0ZWRfX6P/ygCt335km
 Gtu6HCapOYdSUP9ZYn1gzX8fhkCXcaREX2VhH/Tq8cEogrXrhri09T2ttiIzLlCjw2qvaGjuzPH
 2K90Bw4y1TCm7oms/ikuaO0rPxJJlYVMQJvy99vGD9DOt5NaZ2q7/pcYS853Yp2sDoCzrl8KTtq
 CBO7nv+gthidLtzvKTDpjaI1nHUSSFHP5WVgSFNMQW4Yi8g2OqNDQxJkcPMRJ5HlIb/T2dbr4D3
 Y7Dpw5mzMIzfQ0y8Weuzn2dPn/qihr5yCv0/tJjwI2zm2K4eq6JdgSIn9tEh8tHR1YrsBcwJUle
 XwzDlQLC4LrshREwAUSvOic+LyoMZ1ozio2PLpvVhGTsTTX58HCI00SBeIO+/yq64uEir94pN6Z
 4qepcx1KMePtjVBTlCXyr2FUvABBWw==
X-Proofpoint-ORIG-GUID: Jyany94Vi2BI2ChmEznvyFxXYjZTc_qH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060107

- Add support to enable ethernet network device for MHI NET driver
  currenlty we have support only NET driver. so new client can be
  configured to be Ethernet type over MHI by setting
  "mhi_device_info.ethernet_if = true"

- Add support for new MHI channels for M-plane, NETCONF and S-plane.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
previous patchset link: https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/

changes to v5:
- change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
- Renamed to patch v5 as per comments from Manivannan
- Restored to original name as per comments from Jakub
- Renamed the ethernet interfce to eth%d as per Jakub
---

---
Vivek Pernamitta (3):
      net: mhi : Add support to enable ethernet interface
      net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
      bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100

 drivers/bus/mhi/host/pci_generic.c |  8 ++++
 drivers/net/mhi_net.c              | 87 ++++++++++++++++++++++++++++++++------
 2 files changed, 82 insertions(+), 13 deletions(-)
---
base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
change-id: 20251106-vdev_next-20251106_eth-dd145c3bbd9a

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>

