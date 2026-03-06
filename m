Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430A134A76E
	for <mhi@lists.linux.dev>; Fri,  6 Mar 2026 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777074; cv=none; b=X7C4xX/Yg37wH3/PBRxWn2fH1pUxf9rxeSlHRMtTZJYj6j4u9iCTeF+o3dZnQfQaifZAJ3HR5sBf6Uwtcpa3ZGR1fRm9XBAvpVgpTkicXz4rU/qEc5mZeowZCz8MvdJloGzrXskln3inStM2gS3QXJoFSB/Nzkw1J4itN8A/oio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777074; c=relaxed/simple;
	bh=qjb7kK6wFhW2UgOHfFAKXh0I9MPKRRlXQUKhED4DOJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LvnFRoL+yG6x9SdsdSk2FISnpclzzNQ3sC0Ejcfad1Vs/OxkLi6t18SWAdUVybtOA0OJl7jg7Vac0hsXFyCgjJfT4Dw+OJhhl+GaLRoCc4CBO9blTmOHqDSNnTkV+JSHNSjBxDedDAPYOzO7mzuBizgKEe/ur2mqNmiVUQ32M48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK2aGLZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDrNfSZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK2aGLZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDrNfSZX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aBOF3218970
	for <mhi@lists.linux.dev>; Fri, 6 Mar 2026 06:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdoVzbASvwRMf0eJZjPPRXe0BdQIUXnSotU37LZVeH8=; b=KK2aGLZqufhjK8ws
	JN5Zznu1BNZK+s7GDT4y6hNyuDHhyB4pfUSefbRTtr6O461zyYlFTd1wpGtQegGa
	6jJWeN0oyfkGvlY9T/a/JRI4tLqjwtP/yM0lvF+Ed4FW1c0cP0KXCJLkKK8yRVeE
	CQOrGtf9AGyNxXAKNz0WomQ0PNmrXnvMQvFSh9/aDGyI/xwJmgYdbZoaJoDoEyXd
	zAXIivcFaNjPqywKNbXjNr9TeQZMAo2yQfSfmddQgsLL14P5vx6U7ROZAd8HiIRJ
	GxRPg9iPTM0Ls8KXbF7mjk8SSdA3kuqAVgQerMLrnR79WoVC8dLu/x3iauj3ReSk
	tic5jA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25svt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 06 Mar 2026 06:04:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82984468f85so909954b3a.1
        for <mhi@lists.linux.dev>; Thu, 05 Mar 2026 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772777072; x=1773381872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdoVzbASvwRMf0eJZjPPRXe0BdQIUXnSotU37LZVeH8=;
        b=FDrNfSZXfuSKweReM3aMQQVnDQraV7RrH+g8/wzbYiT5zGJaEtDGPhYcV8mwyN3AlS
         3N7gSYKq1Hf9JoI1Euchk4o2uUYX/WqfcIEbTAG2jwYzZugnVBU0xUy5OHyXagTKGMYe
         L408wqdpFsqQFlWN/awsXEM1fYV55aS38ssFdBTQZMmy/PzAV9f1VFrsVSqcubopkchO
         SvFbg8f/mBCbxaeWTADebYn13gR8fQ/rF9GXndF1Nz3AeUWMUDUJ/766eyfL+xlsa1xX
         fTUH2ff1lZ6orz5pByOjWXos6K10FYcYJAI751+EkmBMmdAaGvnpCDKmK7LOCNTHGi1Y
         jPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777072; x=1773381872;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdoVzbASvwRMf0eJZjPPRXe0BdQIUXnSotU37LZVeH8=;
        b=INS4w6PYfZDzIM2XqxS2avZ4VJPWxxH3M6Si2vd6sWGj3rNU8E4SKHqFU1YA35ywBq
         hjjcVGZhuZ4JbBADZOx3EUz+L/DIxJ4OPq2mh5HCs4Ah+D9l+QaSuiPQGCfvPh+jw+yv
         BieC0uLOmfhVgGHyJ+CoVcZD+ovOqS1bKuHkuKL5h5utSECSw9reKMfah0cYFvT5aiR9
         PuPDYFpO/YSRtmUdMQYXU7wGTACJ+1G/34YcXCbXYCR0N5k2kIwVw3fWV80BKFY44DJM
         c+kTEM/dhMU1D2IQd5CZpmyz3C/LE2TMN55iU+Aan2d64HS3XVmUIMV/NgNG0pxCLv6F
         yzCg==
X-Gm-Message-State: AOJu0Yyak1MVIQdee+YsZ/0ygFXmCX7+y+9BA+XuXucSBsAQBBRoURdI
	QfPY0PNzK17XfjWeXGKijYwqyv2gFLcjoATXb5k+dWdCXGYOGXWNmFGS85Ku+O6YG90DbPifMEr
	HidR1BHKJ5M84Ch7VmXE8hlPta0ITjuZpD4l6xPR8Oq89Riqoky7hwjw=
X-Gm-Gg: ATEYQzyYBbPekuEyEvMA3Cix3hyMBi+VtiYrKWYLY55o1Za7oCSFyTSKOg1UMTpkQ0V
	POxffKOQMlHkBy0CYdeyELOo85GOGpvNwsU2om4Lk9HzZfCosVwcxjRyT8lyg5M5xu7E5S86Ojw
	4h8xzN7mxZxA1YCp7WfeE+eIyDAR//hdFVp4FMFtXsT7vVr1HRkLXWY9nBJ0LVh4Vvy8vAmIdVw
	K4yT+Y9xitEq0eGGJNyd9GR8IuxFEOqhJDqqPkkFkmvSja13+uSs70P9A1kIDpfmwMlt0Tp227d
	nbOcfSSgp5ygFQ/Yqe33MuQgax0iQU1Os+ekYlhr2dq32sdV+1SwuQ9X+6sSblN9DzoWcI7GSD9
	hR7FNmlcaB87ItTi10HdvLil0kB+HaAMs8kqEQNMxFrEVvNc=
X-Received: by 2002:a05:6a00:8d96:b0:81b:d5d9:a83a with SMTP id d2e1a72fcca58-829a30cd002mr960161b3a.61.1772777071869;
        Thu, 05 Mar 2026 22:04:31 -0800 (PST)
X-Received: by 2002:a05:6a00:8d96:b0:81b:d5d9:a83a with SMTP id d2e1a72fcca58-829a30cd002mr960098b3a.61.1772777070715;
        Thu, 05 Mar 2026 22:04:30 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:a6f5:7b5a:25de:64e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a44e36fesm726069b3a.0.2026.03.05.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:04:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260305094404.1956028-1-dnlplm@gmail.com>
References: <20260305094404.1956028-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add NMEA channels to
 FN920C04 and FN990A
Message-Id: <177277706860.7582.11134894627963020199.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 11:34:28 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: NUtePbF30tbqagdBQRRCA8wtP3rggDg6
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aa6e70 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EjD74-KgWZs1_kCVw6cA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NiBTYWx0ZWRfX/2VotO6lHS4P
 FdZ4aX0UgHolYr6ChZ+JJVlBx7h1G002EtlHccQFCs78Hd9zexNFdiWDB4gKn9IO7J7C8zZ2Viv
 5Zjpmn0TfiR6s7jyQAEF/bNWR1LPpx0EAyc1FsAWyW42/NwgdPUAZFi/Yfc4vbXQ/YMZjR98tcJ
 fVsMvqqc1D1VnPeCYy5/2RstrogQcAtf8vWZf3mMEfKtUI4qnHUHyQj/jUNJn2lZNpm1ooF0o1q
 JgdXlzJvrD6fdr6ZpT0BPtK1j8mU5aw2/XkPsn3hzdyXbQWby+Dn3ZZ43jWIREWRcMDD3Zi5wVT
 Rk6oOyA88rNXHxwkPaG1PxtRLRAbxr6c15FFsMkM+7XL0P/UsamoXuOUMIJk7qQNxszN3sfa1jW
 PDwkcYKC5pAFQdBM80EryJDsoSU38+kaLDM0U9XhXLIvo8RY7xFKz3YsFt8jwIW/2hZVTbrayyG
 52gyGJx5fdDc+yjgNtQ==
X-Proofpoint-GUID: NUtePbF30tbqagdBQRRCA8wtP3rggDg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060056


On Thu, 05 Mar 2026 10:44:04 +0100, Daniele Palmas wrote:
> Add NMEA channels to Telit FN920C04 and FN990A configuration.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add NMEA channels to FN920C04 and FN990A
      commit: 3763571de400595917b81a31a036ee289cb4b4f6

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

