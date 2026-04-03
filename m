Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B0364058
	for <mhi@lists.linux.dev>; Fri,  3 Apr 2026 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775196925; cv=none; b=Bhhh6QzxfDvyRxSMT4QSpPav1HlWY+30Rh6I1R1NjbSOhD1V5zJDAmMCiex96TJkCsPbgUQXZNaiG+cQ2lZo+LIpC8OBPXKOnCMwLaOuc7FunC7tvuKrMMQtsZvRsDDM16GLuMYQZf8nbdU/RapFCcM/ap3mkjJZnbVrsfaeE4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775196925; c=relaxed/simple;
	bh=rQ1XWsAwABRLSc/df9pK0AK26PuDQCJmC0LIkUBuomc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jIH/sejjHsvopAS+PpEJohlWksInRsYOUhbvNfqapdiUe57UhtFJ8y5AXXTRyURQ650zPG+GjCiXDi/TKhEBIbllSKVSTSZ95Tt6uo7peaZHg/ud921fPIddB2ZJw9BAbkdCFy+mPP1XQhM93blSCjobvXJaVN0yiEg2IqZ4+bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZ9BiGrv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRZM4Akq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZ9BiGrv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRZM4Akq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332OOsT1525693
	for <mhi@lists.linux.dev>; Fri, 3 Apr 2026 06:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6BpMBsUS3gROf4qM7aBvUfrbuUasghT9uMQfBqZ9Ms=; b=aZ9BiGrv5O13ScBv
	tX1RvCt0/i6EGzuKrPSGeUiZELq1Eg7qozJg7lHmgAbbBZiShMrQoFsJ/hqQVhFN
	lRR3gXA4o2qad93P/oTUcQ7kAfMeZBHpgPQ4M6At5x8blW8fd8yuzsvvxdp62Rce
	0aZBwH+dn1hmIktR2zPkx94c/KIEluEmHpEb5YkIv7PwqGQNuOa4Vmak1INfKEoE
	TFnRDEcMIYAfIY+aXMhRHVXFbf4iLa+c6reM6ZWLX/SJDsJUOoxbB1o0+1Kcr5VY
	py/o3D9HjOYEDbqTIAPFDL60B9sVTeX3nRDdSe8UqDboT9iKjjnhqKM2zxWiJAnp
	3GVLLg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcucsfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 03 Apr 2026 06:15:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso22767205ad.3
        for <mhi@lists.linux.dev>; Thu, 02 Apr 2026 23:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775196916; x=1775801716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6BpMBsUS3gROf4qM7aBvUfrbuUasghT9uMQfBqZ9Ms=;
        b=CRZM4AkqbzzUxCDk90h0lg5DLT71trMvYhQf59eBIgAe0IsgwruSnzQCK9Uditc3vT
         TOlP4yquw5hlYKGCtE4rag1/QctBVCAfYs3QHg/00CXO6Ky0qcBiTBqG7Tt+WTQYxfNe
         r3mkDBAsfkhMn7/hmX94V63bOt6yAdV0PflX5r2f9XwnZFbF4F7Ka+Vt1CKrHdpiFqM0
         6f3DB9fQo6GCQKWYgJgHtkihTF7Ay4OxK21EvwpVkg1KPayH6rgFpw2qWlI6Xye/Qjzo
         Z/dauZG7LtYtups61bDlKs/kYS46U4e25KS5/ws9Qt8v4NWyl77LipGS1eDtj2Z/VAMq
         CFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775196916; x=1775801716;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q6BpMBsUS3gROf4qM7aBvUfrbuUasghT9uMQfBqZ9Ms=;
        b=CULaGqmEPQOPAWfi217N8yKTcqkIV8WgpGtdrqWgUCAZOxTX6Km/7BChQln7MO1Gd+
         Hgjk3qMGbh7tTC3xPsAelXot2u9AuRuPsVOJd9x7gkAdcPQFyoIIkjZ30FmVDZ4L7Dqa
         VeVMFkD2zczzWnHkTbZAoAFNpzEZ/MB+l4Svnm9Fjll2e9SKAxU4FLdbUAA65GVM2U/w
         FY41i37E4Yg7yh/9sHx+M7KG4ZmTA136qBMQmz1cPqCo1F/x4NRhwNFRFm8dvW5ISU9+
         wexhaZb/Jr28qV6mCYeOnTiR+WwCxKFoSjAEJNZ2qFg03qgcnqBW8TcXYNXJQmZ3dWd5
         /MuA==
X-Gm-Message-State: AOJu0YzBys/11F7PKke3pwEeueCdbqyeBnWojWlAVxNlJAq9e3tcSYDn
	AeGrL+5h3QmHoPdgZRFr+2WBibdH6BH7emBLV0IZuFctF7uC+UZGOfge1TTEOk/H9NiQqy6piDn
	Ot0VemKFmpacGMjzPeOgsAytABa4PluyRVLaVYsX3uFrImucgiy4IdhY=
X-Gm-Gg: AeBDievFpv+BWD8yuMMjceALnRyZUfXc0V56zdhccSMDZ3TYBGnTcsDMaJNJ1SZVro4
	HG5CQe3Jd1dx79w94Yf2pMe0EbKPdKg9FXXtauz5nDb9BhxFs+AkdHdv0I4uZy9C9OIgBhe6/F2
	o2Hw0gJ95SJjpCBonkcR5epM67sKhJpIDsuvFDdOiavHcLX1fmQ+6kuAQbVo+CzqumrZSFsmBiL
	0cUFi7usvhTvSazL+x6oPxnTOO0OlohnwDDMJX4KxwNxS3nFQMrHlKsa8lNA7nIbD8gzHEcl5cV
	QoIJEYSsJjHz3FYeqK+0VWQPXP5i65ZJZuaQOJLNxIukVbyeyFgqgY96c8z2zqNUeKyhb7v8haN
	U7jnGufl/AgMSg64MMXFD+UCPw13LH9aFfM3J/U7FTwS2U5KBhA==
X-Received: by 2002:a17:903:388f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b281789c6dmr21981205ad.29.1775196915901;
        Thu, 02 Apr 2026 23:15:15 -0700 (PDT)
X-Received: by 2002:a17:903:388f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b281789c6dmr21980835ad.29.1775196915388;
        Thu, 02 Apr 2026 23:15:15 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.79.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d688sm48496095ad.8.2026.04.02.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 23:15:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260323122837.3406521-1-dnlplm@gmail.com>
References: <20260323122837.3406521-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE912C04
 modem support
Message-Id: <177519691326.6771.13975361277585355648.b4-ty@b4>
Date: Fri, 03 Apr 2026 11:45:13 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA1MyBTYWx0ZWRfXxx7A+jnn0onv
 apOQCW6myOw9oH0JcQ0H5sIWRdRuwhRWMF+6J4jHZAoH6uw6YfmvqOp/E2DV1VHKEo6b6f4rweA
 u3kv1QpUn5MQTvJ/L8DiiO3BZTVjH+E40xzE/g/lH41JTHua8XpI7oZqcNPqzFE7SJ7JLhaevxh
 roWYuTyNzIUI9KP/+GsCzAfbW4lzJhn5sDfVx+WXuaiWzMb1urlKuGMxGFjENNdKvCoeKCVXe+B
 i7F9ZBxMaFIaP1F9gBvJ+Mdc4MUZz4PngsVtRkT8eLOMnIjLwIVodUoEdTlg7e6wERrr1iFa/jA
 RKP5KqREteEJagPfDY6Ks3/kBnG+MWD5NQv7Y2Da+ptpYaJ+i6TTZyqtCCFqAz12UWNn7WMFOUr
 6p+cfe9MuvpSdKk/U6cuVpDQunRR5UnbrnZk1GjPe2qv8kfsQUV4uG11E9RGKNFogZy4EcUa1GT
 i36zfBNJtcTAMXpGiug==
X-Proofpoint-GUID: e4FwLkllhVYpGt8HnRy_ouoZH3fKq4aj
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69cf5af5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=+KsUAYeLG1mN9JXONzlAbw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wTo5TqLFWbBI3rTarbsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: e4FwLkllhVYpGt8HnRy_ouoZH3fKq4aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030053


On Mon, 23 Mar 2026 13:28:37 +0100, Daniele Palmas wrote:
> Add SDX35 based modem Telit FE912C04, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>         Subsystem: Device 1c5d:2045

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FE912C04 modem support
      commit: ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

