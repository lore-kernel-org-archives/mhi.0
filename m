Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0373383C9D
	for <mhi@lists.linux.dev>; Mon,  2 Mar 2026 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437476; cv=none; b=fbjihrRLad+TjlQoqZUMa5piRkh57oqnImsSoWowFmoqCEedxBdL/fzmOZTDvpZ5LRGCVQX9v5XBdpKt88KksFsh6IXnzGXAmOvvs43OnTj+6blC6q33H+7RGDKnJNCXD1f9ut9Rq28n/wAtPSHihHhWO9QepYqngZWqP/2+zHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437476; c=relaxed/simple;
	bh=CargpKkXQVqdsSsY3ImCivV1FVq/9kbtzLrmFN/ecrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XRBqYDV5JCqaQFK/xlNh2Iu1PbndYaQIPomMZ75bhtfuG/pbUirNEzR+rSvK4CcRDPB1T5ObB6a/3Nz+MDgif0yTiUqSjhQcSSuwcMfVT0gsM9SIBoUjEKTJBk059ySCv4SkqhuJtCZv19+gljElYdPCfys6/iS6Y7RYfqZzNmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j049FK3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVjOMj9h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j049FK3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVjOMj9h"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6225e5wj944323
	for <mhi@lists.linux.dev>; Mon, 2 Mar 2026 07:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFKTpBFrKK0qOlDxL66ErCH4SIFEqcVYM0K79QLoCPY=; b=j049FK3zsgLaw4ZF
	btm1Nsv0yyg+Qz0mgUPNdCloRTBjDeY6vL5kOS5DnsBPbd0hqVqe7rn7EBE4rR0f
	EYC9E0qfWbvjcw1paSUzMVBbzULewox9x3vzDhPzCcrmlsHmAy7XqVWOnCrtF52r
	gkyBXeojP22EVX3hOHvHcCBTzAjlG3AMa4qVMQQxsIrXUsuYrN1dqrFzp9KIZvQA
	rpMl2z1TOrNJFhw7Z+fcv0quSka6xXVX7157KF0w6BS0JB3b5UUw2od8/K5Yml/y
	xy2/yOotvq4OviyygVgFCATvLjk8TRjdlZdjYGiIIVas+a8nndbmUiyMWb9eIdM2
	j+uYog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq4m6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 07:44:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824bbce0a44so18920901b3a.2
        for <mhi@lists.linux.dev>; Sun, 01 Mar 2026 23:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772437474; x=1773042274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFKTpBFrKK0qOlDxL66ErCH4SIFEqcVYM0K79QLoCPY=;
        b=aVjOMj9hxlu/dyijvioRGkaYQgtUqRa69xmQY4R1/vGejIHIjd7IfMCwWeaMf2JEzv
         N4s7UPQGjfHwpCxZhlG/jAPtYONiGsChhRK5+mJwy+vBEb7/MPjcDqoD6Lao8eBStzE2
         gdOP1dFsRvILRwesBX60FxVjmv+M/fgps5GoZ7b+jZCqlzi0bWJAO7NPGer/Wr94WCcJ
         E2Brkv9zdQi5sJ5mA4LTUjOGt3QcktAVOklywNhKrgj6uBAs7NaX1fDF4CCamMDPDwuc
         cN/kwWEx21NL+FGZqreE6TlBwb06/y9w5NkjQ5Ujgk6mQpeYZdyPMKec+yJFTUuqackx
         zHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437474; x=1773042274;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFKTpBFrKK0qOlDxL66ErCH4SIFEqcVYM0K79QLoCPY=;
        b=D6iLgc35hHqYXOOhemS2vCkQuBDmtckaMhavbHzozXiiDJobrPp0xIQ93pT3RSTAPb
         TcIVaHyMP8yNSHpH5ahdIaQtI5IURFho9qtBrPZ7FR8NvOc/m6cL2CbVdhod6En9INv+
         9lK5Srju0Gigc+nhVAOTT9NqmaUPzj5inZ0399EPggNa/kYvOwuU50XZwIB6V0d5RZO1
         llYXFNriC1H2HC6o5T8j0u6WO5XPF5r5JOz7tRAE6x8dhZt+G6zmEXM9BYgHvkLmqDrh
         iynREhrG2pWn3xj+8e3pxqIBgO+1SrVyA4Pelnu2BRCSpy0dcr9omIZ0/WwaTPzspQ0A
         CbRg==
X-Gm-Message-State: AOJu0Yye5eAUuKmdcQogqhrW72zuryezppQOA43aGAkHFyvbUnZZySKR
	S9LkVJwL6uCa8LSKyaMBIiKphR1pZ5wTDWkjaDYcVhVYMqGrdU9/CaKtuUk7noIi+cozpthGnRb
	FvRfyX6FuDekewpVCy6fLdMzpn/hxEEA075UjyXmCUdwLpcrsYTX1ApU=
X-Gm-Gg: ATEYQzxJjkASQLWenLJmkvGusmKIR1yq2wED7DzabT+PHNlsmcmqzf6MgPbbznmXdIB
	/7i9qdsmkpzBTjAkfxNMxQxNKB/1UfERXgnL3RpluuNEFL8JHDn6880AG/RZKjJVKpCrnkWxRQq
	vj/pIfEDe/kQQ19M4WXzVfXCATHzKAGqcbQx0qqcy51QHmSXuLb+Q0PtuzM3iLAaMb9Lvc19m2P
	u//jHQYQHFpLJxqE860zQxYIZEoq4dterjAPKRnI5Nl6+DTeapOqTFCFiLAcKlb1uRdFPEhAaZw
	k0Z3UUWDIMnQvY8QqZiyCGThoASZRfRuPEuG26mNdlpmXwYYaYJcy8RLQAcgsVogXoDrLnYlePc
	WuaDifkqOZ87OANgQqhI+aFcr6Y/aDZ68lr88Vs0ZTWljQfg=
X-Received: by 2002:a05:6a00:2d07:b0:827:2a66:1fc4 with SMTP id d2e1a72fcca58-8274d99ac37mr10028167b3a.28.1772437474508;
        Sun, 01 Mar 2026 23:44:34 -0800 (PST)
X-Received: by 2002:a05:6a00:2d07:b0:827:2a66:1fc4 with SMTP id d2e1a72fcca58-8274d99ac37mr10028152b3a.28.1772437473995;
        Sun, 01 Mar 2026 23:44:33 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:40ee:341f:1665:8aed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff325esm15046491b3a.37.2026.03.01.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:44:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
References: <20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
Message-Id: <177243747142.16822.11221032397821014097.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:14:31 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Hrv5g9V__JdoDz1q6_5xOw7_UNjBGFEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA2NyBTYWx0ZWRfX7zAVKdhBX81K
 3BwaTkm0sxMX6Ysp32seUvifTL2MTLTFsTzQAdenw6iWXLcplGtUIK5+IG1jjFQNqRDpH6ZRRNy
 ZUy5y2EJHuaZtIVqkXLbSeJU4M/iBXdA6ZUmV0+sKxR4QJpnjdhI+dpWZ3Egahy/lrfUg6gUeo5
 V+eW5ULHo4y4o4FP0Me+uPcXjUaOyppY7iR0NXr/Ws9nbsWamKDMFBWlFQdEAIAG6B7H+LrRD7e
 Ns3za5BfnP6wfjRy0YgYZS2lVmfPOj6TRP2HwHjP+8e44r5lfIl9ewBjRk/zfd2CvMtv6b/Wk9l
 Qfo3lRNnmzUOKwbJ1VLZA1knLxxkZa2uDEyCq3pxBGA7iupEukY9z6ysWyrqdLSMCx3B6z0/E35
 eUrFF1s52wOQCojxZ1t54jqcQl1Djgn7G29kiTpV8CAjY2FlOnHcMxs7pbKd+a7Pj7YLo4kx/bO
 F+40vWowikHBAH1RPvQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a53fe3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UDMOASZ6n-RK-qn-_IkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: Hrv5g9V__JdoDz1q6_5xOw7_UNjBGFEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020067


On Fri, 23 Jan 2026 17:16:17 +0530, Krishna Chaitanya Chundru wrote:
> Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
> transition to ready during power up, so use modem_qcom_v2_mhiv_config
> configurations.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>             Subsystem: Qualcomm Device 011a
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
      commit: 6a7084102bb9659f699005c420eb59eade6d3b4f

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

