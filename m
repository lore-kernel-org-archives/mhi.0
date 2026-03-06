Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258F24728F
	for <mhi@lists.linux.dev>; Fri,  6 Mar 2026 06:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776919; cv=none; b=tr9fuTRMTdXZwGJx5/7iH4OBxB5QfWoN7Nw272Zmb9bFQ7M1cTG2HBHK1CMPo1o3Hk/NVJkn+TW9O5sVqI0Z4fIW+xuas0NoTVQ1Nzl5fFUZYWSuX2AWfKBsu20CpSirvcGyoHYQzGIYx2cjxqDy1x7crrAD9QeOjg1DsCC623Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776919; c=relaxed/simple;
	bh=GzTLSMPHExwAy+6CUVsKaw1CSSI421JbGQHa7+s9Haw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iQx2f33wLjDiw3rAx839P8DaAxv3IBYWCDUTmQdD6ugDbtU5dwY+gU8b+N71MZdW9CTh+/T8ot7I3RQaQxmbAXguc4GL/sEZH4veN6lq0ksB1l0uRnpeRf/+p+L/aOXBchdLLBKjoARJwmrKWJ2OBUOiZ1ZtYZ9U+KO+kTC13s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIZR7BNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgJez5tT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIZR7BNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgJez5tT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aETC3219011
	for <mhi@lists.linux.dev>; Fri, 6 Mar 2026 06:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvxxD5R2g1eKWFZrtyXXoI1KYxWzBTsSDcmN5FvjfNg=; b=GIZR7BNfEcvDTUgK
	9n6eapf7PspeSBAYS+veW9/JdXbb+Gw9sgLVG5YwqOzgmdvLO562jArO/l8fLpOm
	v8gjaCKTxUUueU1lQ3d5VfxcgQ1Nw3LKJi9o9lIPO4iQ+3tpC7WndSIsxcqn/Xb2
	BNcsnczva50mCP5UESTi1/rWnoCGCptrTE03NRt8c8j5FHr2v7NQj589q+eknOtg
	PXqW0tkEUY1NMN2lg+EISEAqIr+aeGH2/MYnrWcNyrAaLKZlgrpOS3r4NpqAG4Wq
	6naMb4OMi9z0Dm3q0vVL+a3N89HjolcAhbi0aslOdnsRrg/SoO4gj5j3uSoPc4Es
	aSMvLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25svga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 06 Mar 2026 06:01:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae502a1dd9so66027575ad.3
        for <mhi@lists.linux.dev>; Thu, 05 Mar 2026 22:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772776917; x=1773381717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvxxD5R2g1eKWFZrtyXXoI1KYxWzBTsSDcmN5FvjfNg=;
        b=jgJez5tThDFrvcMdX8ZdRVq+UxiOHdy7PyDCI3tDmmJVdNlFso5nOxkhY+VfBTt9+6
         f4S2u2dXcrrBGosXvqtUZb5H6rAmKMS2Ah3YEiWPsnJznssok0bGhoaer6e7E8eUqbxT
         MEmKxvvTQlQ4/Y9XmDusHFsE53+KzNMKjztfX2Ip3deDfxDge6uiIEw3LHgupOqz/1wg
         IDNH5g82FLSBn/0pGX3+p2lKv9BKUfdJlLNss7aXsZsuXfJk8C+BiQbeee+GFgrg68d4
         o5GR1iF10SoOR3fp0vbh5IfEtYdm5zxlDNBMsuM3Cd3AekBX2Xc1t543YNyVA14dUJeD
         Kpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776917; x=1773381717;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uvxxD5R2g1eKWFZrtyXXoI1KYxWzBTsSDcmN5FvjfNg=;
        b=snzQOGzfRCr6GPoMT+pHQUIXwOJ+Emhj82HJ2YqLW8IXcdgopiv+L/qjeeLz8Kln4d
         lQ3DhNQ756hFkTAMRuVZFCDeOL5mvGKXgqkyIHJQuRWqHBhYw69w+s6zjFeggY/+gzt2
         jPI7AdSzx/xP/Y21lxFXGiYleS3NDrMNCZBp6DFH+TGKH9TyfBbdOcsS8wzKYoHmFTs+
         d5Ecq1oWwsB9fm7Ub2XvfGeHSMurtbc0J9BuUDAeVBp6jCv0fJgwLjj8HB9hVofkLC71
         5KOcW+IKiHFLSJoy0hAVR7NsMPiDtFCQkapLN8vBHrXalnbLQLbmdQ9oR/ZroAo85OQH
         xatg==
X-Forwarded-Encrypted: i=1; AJvYcCXMT8K6cyiDpmqJwRvg60MHXtLSteMbXntiyZKwjtoAK2+59/uoqk4k50l7uLZc8A6AD4U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz33gc9HaSQe72AKnvjmJIHf5Z2OMnSysm3AajR94VXHxV7p8XR
	K2XIbtmWN65j/2LEz9MSg0Vezeh+YSmXtTDAnCgrF2+iBWZHOYQJgi6JmbtySNxMNtonmWOfHH8
	c0n0O6rhD3trZnOPXb7T6J/Vt7UcKnUQ47Zl+WlgcDdXtb6GiWbuJCeg=
X-Gm-Gg: ATEYQzwW3YbV4owWCc03gDz70voW8YNMNWHA8hZofTNEM9I2EINgiT5/ATKAwePGfYl
	pWHOIQMwKDbGkW/kXvleIV6X5c3EA93682pop8uUKOX+6eMtHYkfu7AHTEQozKgrdF/MX7EPCbU
	fe+CyFrULPbReimkkrPcj/pRYlLCxqbEb9RkwpRlxBBawkJPgJvuTP8xcViVnW0xRaAtH9yzRY5
	6Y03Ky64gXJFJKaqWIGmMUsh06hgTnH47tvQFTR4mCIFIKw3GVEcX03F9LpCVLaJOq5Z1CS92s4
	BzTqVUKfB3Az29kfhHjVoEOdiLk4K//lgRBNhzTdBhDm/f/np4D3lXCNKwbDAa/MHPXagv+d6qx
	oxgBEuX1BYiIPkNtCehY7KioEf4qyd1v9DOLojNIKRieHtJo=
X-Received: by 2002:a17:902:c40f:b0:2ae:803e:6c0d with SMTP id d9443c01a7336-2ae8243b636mr12263575ad.19.1772776916887;
        Thu, 05 Mar 2026 22:01:56 -0800 (PST)
X-Received: by 2002:a17:902:c40f:b0:2ae:803e:6c0d with SMTP id d9443c01a7336-2ae8243b636mr12263295ad.19.1772776916367;
        Thu, 05 Mar 2026 22:01:56 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:a6f5:7b5a:25de:64e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e7c58asm6644065ad.25.2026.03.05.22.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:01:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
References: <20260212-eth_vdev_next-20260211-v8-0-0974b3a8d61b@qti.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/2] net: mhi: Add support to enable
 ethernet interface
Message-Id: <177277691237.6655.4175169329604491727.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 11:31:52 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: PqzosChTuy45StRQyLOj_59ld1Os9-33
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aa6dd5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=w-hdCPvak80ow5GQZm0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NSBTYWx0ZWRfX4LVwVmk67F8C
 NgTjQ7uuMLOArTbJ1Z73wF7ZnSPMahgQUQNuG8nXgqfTrYQLgk4J+anuzGM3VUbxcVrQOxK4q1V
 yCD9USSMQPvyKJhmx7uqQs6sgLOzMC/zZnm962jL6HY1tXH/4VHflb9LC0X2M05644tvBEeTYvH
 rHjLXkZteJlqT22T+VByHeDEZOLdzy1sSiv1R5+mUTYPtvk+RCnN7/b+fP5NSFh7AteYPq90IMm
 v/7G9/QIvrDeXW9t2jQblXX0A/tZkMHLr92mm4HqJEUOiKKxpOfMuvXX6bhiCVR9l2SDAtLj1qd
 +AfzgfV2yhwAab0OG0XGgGQnmW5PfYJIJtHH4nhdtD/B4+qxB0j/wD0Y0OJ1nQWX6/qIsf5yu8U
 tFaWMM8NBN0oIujAqG94hWvqVQiACdwe2kJbG5WKSuuj+Ls3tXfaj4tNpn6yVU09BgvKNoimjBd
 aSdJhHrmi2RGcuHde5w==
X-Proofpoint-GUID: PqzosChTuy45StRQyLOj_59ld1Os9-33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060055


On Thu, 12 Feb 2026 16:30:21 +0530, Vivek Pernamitta wrote:
> Add support to configure a new client as Ethernet type over MHI
> by setting "mhi_device_info.ethernet_if = true". Create a new
> Ethernet interface named eth%d. This complements existing NET
> driver support.
> 
> Enable IP_SW1 (ch:48/49), IP_ETH0 (ch:50,51) and IP_ETH1 (ch:52,
> 53) channels over MHI for M-plane, NETCONF and S-plane interface
> for QDU100.
> 
> [...]

Applied, thanks!

[2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100
      commit: 3cdd83ccd7d0d990ec55b35c8a794d84b22a9fd0

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

