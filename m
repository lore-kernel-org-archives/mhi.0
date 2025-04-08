Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA895846C
	for <mhi@lists.linux.dev>; Tue,  8 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103612; cv=none; b=gjL7T3oopbB26zZMJxOpLIgGOq3DCPB2H9sFwjhUvn3bOnr7Vt/wvgpnHD+gGimk11fwQf0paZRD/AxyQHUjtTva3Kdh9irlYwJVrpqUfE/RuWZcjnEFMhzhRV+yZGpvlffY6Bss1La4El0pvN9iXv71aI5xbDK8/nCfJ0phMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103612; c=relaxed/simple;
	bh=tCGz5KQVipv/8FujA7ugn+DYGSAc3ViSjrcCSunJYhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAzfl/H8ekZGQQhXQpCGT+fE2TtTbmFB1o7Q/10gNtfGZGVSbgNQORyoOtiBg2B9cmJnhwvh4cibkrADqGcGN7rrhzrMqywE7hnsS1Q+ivHirWPx5Z3ZA7KoTENQ9bNbNCX+vrOxVqrh3M6XY504H7rkPidPWBgIM2g5v8scDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvANpkQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvANpkQW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMIB029499
	for <mhi@lists.linux.dev>; Tue, 8 Apr 2025 09:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCGz5KQVipv/8FujA7ugn+DYGSAc3ViSjrcCSunJYhw=; b=LvANpkQWiWyboFs3
	P0399o1daRV7I8qGzUPKO4cxiygWiSHDu4rDg/LaV5CU7DyxnPu6qouHIJRvjzzD
	bthKccv1p6RVPlYmD17I6vZ0/3memlN7GURggtSrV+ND88FNky5a+QLIvwaTHtPu
	gZrH2BgJFu/q+KewaQBAjdSvZCLsyTNPw/Reumr59b8rk8Jp7H5dL93bDY0q7YjD
	pn9h4cEAdNFTBfzz48oLbukdF/1T3p3fQi9QZKEwkCnzoVpvN1hDWy+DzIRVXkOB
	UJBFZ/nGAiLrLQ5jKlYlHK/wda3rmrEYT6ua48eth5C7Cnf24E8djKLQhwHZggKW
	8kBj8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrf6we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 09:13:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e905e89798so72817106d6.3
        for <mhi@lists.linux.dev>; Tue, 08 Apr 2025 02:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103608; x=1744708408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCGz5KQVipv/8FujA7ugn+DYGSAc3ViSjrcCSunJYhw=;
        b=LTlC0V6u+xiKhioKoFNHYNLYUh5/ARZouuX85oWeInA2ERCxAeEEPskzvK0rJn9f10
         MsmYnX5oYhklMVxLfNzT8s0SZPcjdNdNG5caiBQ/j1DBc/VXikT7XOfBdpRgxeRrGKSg
         M72+bc5fj+zhNyvCIPUpWmxJoSS9qppySxVjYV+DedNhsXSaonNdSiJ49udW2t8pzh2E
         jk1Ce+8Ov8nhGa7KIXc1FzhsFUNtST2CjLQUSA9iSLEV2DJk9YvQpN5pukJc4YVErwO6
         t+CJXgYZO/qAnBQYAl2z4AESMw73a40c6RrUzGaqe/uZGOheAJxI3g31ywUARxlHXelW
         dxvw==
X-Forwarded-Encrypted: i=1; AJvYcCXaPuU7ED5E2gUrv7xMtzumEcREFvq4inmn4T6l83Te6md3CxcKhMxXiCEJJ4wX5VWgUKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwB9zw766Fk7Zhoc8GmTpCCfudtSVXrzuq6tBCI3YO9VWvy5UwC
	UNoZcXpMHf97E8RGKVyzBjhi3PDeU2Cdo4mVc/vIuUrVNVRrx/XiH2N4GhmMi+HBqJWLZu6X4ln
	lxJbYa3l1l0r76Axhi6JzSrHkUbNm28FjS8ShSrqlai9kbpAeoEdOimg6FoeLGLRi3XZ0uDiEDx
	AsJ/Cm0Ad1uHOTQ/s2CWmtv+6GNw==
X-Gm-Gg: ASbGncvFc1jWngDrk8cevDj7pIn/n3zbUvGCdf3WGeczcpd54JeKwR7qqT3GrP782Yl
	rjQS5GjAPChCnm9Xs67SuICgryNLmVTity/htQpziP6ELps7on+Oj7Y9yN21EPXZzF9GzucLeyg
	==
X-Received: by 2002:ad4:5dc8:0:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f0b7467892mr134571146d6.17.1744103608674;
        Tue, 08 Apr 2025 02:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSkFpxkTp6UKXrMGOqDzSHCRI8idixQPMSOhESHrDY4X3H1hJ24b//y74f+Ln4swPrkCsOsZCgPU8gFqAASvE=
X-Received: by 2002:ad4:5dc8:0:b0:6e8:f166:b19e with SMTP id
 6a1803df08f44-6f0b7467892mr134570936d6.17.1744103608381; Tue, 08 Apr 2025
 02:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
 <DBU4US.LSH9IZJH4Q933@unrealasia.net> <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
 <f0798724-d5dd-498b-89be-7d7521ac4930@gmail.com> <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com>
In-Reply-To: <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 11:13:17 +0200
X-Gm-Features: ATxdqUEoBkExVAitZg50FMHZyf2yBpbrCvO1TJcyi1Ltlp1T8oTppXOz-QXED6g
Message-ID: <CAFEp6-2_+25Z+2nPOQtOzJPgfJM8DAs2h_e6HTQ4fAVLt0+bwQ@mail.gmail.com>
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Muhammad Nuzaihan <zaihan@unrealasia.net>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Slark Xiao <slark_xiao@163.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, netdev@vger.kernel.org,
        Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org,
        mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: E6YrimuAosgt6p4dZZQMZCP0b8A421xl
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f4e8b9 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=mThdVl9iAAAA:8 a=9d_Yctv7ZfaLz5H8tHgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=GbkGdI2Iuv6_No-W-q0B:22
X-Proofpoint-GUID: E6YrimuAosgt6p4dZZQMZCP0b8A421xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=830 bulkscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080065

Hi Zhaihan, Sergey.

On Fri, Apr 4, 2025 at 7:42=E2=80=AFAM Muhammad Nuzaihan <zaihan@unrealasia=
.net> wrote:
>
> Hi Sergey, Slark,
>
> Using wwan subsystem and it works without issues, maybe i might miss
> something, perhaps the flow control but i never have any problems even
> without flow control.
>
> I am using gpsd + cgps and xgps with a small modification to Linux
> kernel's wwan subsystem in the kernel to get NMEA data.
>
> I had posted the patch previously and i can post the patch again if you l=
ike.
>
> Attached in this email is the screenshot of cgps + gpsd.
>
> Maybe it should be in GPS subsystem but it's working for me even using
> wwan subsystem for months now.

Yes, I would strongly recommend doing the extra step of making it
registered to the GNSS subsystem so that device is exposed with the
correct class.
From WWAN driver perspective, it will not change anything, as we could
have the WWAN framework handling this properly (bridging to gnss
intead of exposing the port as wwan character device).
Sergey, is it your plan?

Regards,
Loic
