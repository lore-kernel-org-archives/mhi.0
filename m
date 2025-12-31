Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0185D30FF03
	for <mhi@lists.linux.dev>; Wed, 31 Dec 2025 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178556; cv=none; b=WvhVCAM23SuwDIDS4e55SQOreuZ2umL38AYJatYy7bsoO+nb6KEYiRbfxsmTqMCXKrewgbftJ/MbTtIH//9CJRRWUvB7VTiz5X7FstmoRMz69O0GLc9m+tk8c8Gt1MKMmMaNhgZnriJpihXwTUj1sbdwDcuBOkCgxdG5mxG1Vq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178556; c=relaxed/simple;
	bh=HaoGokyMCKS6sYN1xubOMqBe4hgsaEX+B8nRrEYfBZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VQjbROmnTmpF/CcbD7Bbc4r1pRnxoJjH0lcv8qe/V0nlJxC1O1i97eULEudc0A1caQEEbnAXEh83XKSGwlMUXsbl0cNgr9AbV90lS4ZyFeKgzf3olptW3sPoBLk4ICZqPYm0cBDx9yPNQdFGal0wJAkr3vndGEdK0pgm7yeCnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9LalVlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VG556KYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9LalVlH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VG556KYP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV3dakL1830540
	for <mhi@lists.linux.dev>; Wed, 31 Dec 2025 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=l9LalVlHnMCVESuA
	ktNoLFmYgR+yMVeRPmZ1JFaUS088FgaON98gaUXZiHac/q7y5EeYEAVhiSnb1ZAs
	bYT+nenGTAW/98+5957nIK3Pr9Yc487SIjLLFsPE3gnkNCbWbIo3ZBBxFrTCoTdK
	khuLOhMy8IAWzxCWzztVs4hz4Kcl5cvgc8fD+mE0Mfp4uZWixQ1IaVnRZ1KWAq41
	edQTCHKA1PUAvPJLc6h0JiA83UANl8JKbLs7O3Uf0ZpoojkDqxfTTdBzgaYir3SN
	77Kp5o6ebyhoMAclhFdxW9LbhvNNHHTcT7l7pkeRIVAhRR6276p8C4+OyjObaxgD
	SQHIsA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4agqe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 31 Dec 2025 10:55:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f89d880668so15519844b3a.2
        for <mhi@lists.linux.dev>; Wed, 31 Dec 2025 02:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767178554; x=1767783354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=VG556KYPa0X7fYjKRCPhHHrH5pflR2rpcpsWK+xjjVeZbH9rkgTw1JB2mGSSqBPjvl
         q3LuJAah9eLDxXsxhEUqsK8XGGLtTPynoWcYh/XI+BzHcpG6agCXsqoerEx0n+jIyuZu
         brYZbiwLhL9vKqO++e5DMnpZLr1H1Vx+2Psx/tZbO/sExTjJ7b7A+CN5ISgfaIodQb1p
         WBtEQxIXBD5lj1STKBIw2KG3j2L9Wjiu2xDiuGys6ePGQQ/VlZjAmSMQNka79YWLQ2Gp
         N6afx44Ua+q1a6JF8MUWVOzAOzub00nvm2tM6y2GiMZ6UE93QXDasw42a0LsjESW1Rxq
         jKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178554; x=1767783354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=q1QUSzsHTSxCvHQ7Yiw7kXIINE5QwX/7P/MigUiLRfRCN83RqNiSwj/ZkcU48mROGv
         F+0Ty0+fvaBvnjaEL2G9yOUP6lEQOrQ49NVsPkrjgt1MZxvVVn1+PiPRb31ScdvFeMg3
         USXUWo/4IYpQXNMvXDXXzMZ4pyTjYnOrGslP5IbP95/vLrfs/oJ4kEoD/18De++ThzH3
         VM28asPMf9RGCtlVWhUZ+b/uWgQ9wmhWUlX3h7MdUvdKU2fKxc5ZB4os+HPh4GX3kmQ3
         M2f0fSR1q1o8L3WmkH3GvN/1tKv8cmY0bDZzgfLleYX5RieY+iBhVD44dTsbpsUlKYIQ
         ZE/g==
X-Forwarded-Encrypted: i=1; AJvYcCUouDLEeq1AkIWq6BeatG//UBWzCqJBef6TAoVrcjiKhO8xViJV/CLCzCWcppJJL5AwvV4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy37Zy8jAmSanPFALWehewBcYgBhGJiWUp47lewZaCvn0p3LK/Z
	ygeAYe0nrNbbl0bqp4PgtjZDJNZymlUYZZ74WNJDkBeXi75dKYEyDWpM607XghroU9iQKe9+zCI
	RedGoYYoemcnNv0kdh062pBFquqP/sKpxTOPPCgtCp6tbiXk+/Y97z/o=
X-Gm-Gg: AY/fxX6+rfXef1CRwvQdXqOxmPRLns515wbzwbNZVmZ2FpVNnWDPiG6B5XrepAUCgy/
	SbW6sllnGv3qeN5M8KKXH8I36oU771fKVuZvfh9MYJ5i1Qvsdmp/8xBDICCd5oLyoV9FE6VaX8U
	9ig7/uEaWsPZY2MNnk7lwA/NUXFpV7BAY9UPgh+98OoxIpq3hyBFffJwNNlUrCq5BFIp59Sc8bl
	mpKwd8dLl3zM6bzrmVW1hfd8fQxUuIqtk8SyjC/IC+BiODWvH5J0ARIEdZgd/P0FbGAspH/hqJm
	pwNJJr5wawbdy5egMc1umE6Yg7LNDmiKcIsD6aLXer9NM2l49uS5vMFNZzBldS/6Vb2UWtuti08
	7rvzPJxCy/FU4WtvUpi5dwNhMiI321qNNGVnMCA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190513b3a.31.1767178553536;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGioiLvW2U0joeR5pbtZjSEPSozpQwlq9uIpJCK2UPjGGzU6NNfRTPRLdM9fVlDl9M9HcekTA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190489b3a.31.1767178553048;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm35616794b3a.45.2025.12.31.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:55:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
In-Reply-To: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] net: qrtr: Drop the MHI 'auto_queue' feature
Message-Id: <176717854647.8976.2100798756796791971.b4-ty@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:25:46 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: nz03opWPB_N_DChxdtK-5WKUg96KDgWC
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=6955013a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1LwL24QG6zMnwvM45oA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NiBTYWx0ZWRfX0Qf96t5bIvGR
 gPCqsndRQrh3ZMrchWyc4eqfTFMsr4YwKoZEcGgtq7LuX9mlWRCu6oo852IKdrQAAgvXBplA1FG
 HS9f03hzrO9XJoCKVEt4HB4X1Y4OxC0FGZCG6AaLFU6RVBvUPFO/Q/e4yutXZzPAiWqHqQKN7ak
 gyrOKJcMmM+jOkX8pVAivPJDdhgHla1miXfHmrnMxfTjy1kZqw6PlN9h9LwbUmbxKO+j4OdZQKh
 h+rgAp7CtjhxEjBlkbTrrJ7eA/iTtrMqmhg3zyyqOxqRcgRRqg1O/S9KLefMBDGfnZqm73OBzX+
 VsvhjV5r4r16od8TNEkmDZQ8eUzMf9FHlYaqBJurHAtZ8t6Mdgb2MvxA7Ye5RsX2ZUVBMyJCHhH
 E2HaryuC2obnFqw+2lyrurlLgCiZASxPJqupo4wvKpwU/zI1G44fZx2Lt/KzguL/vg3PtBX8iSB
 NzuSbN859Bt6snGAjkg==
X-Proofpoint-GUID: nz03opWPB_N_DChxdtK-5WKUg96KDgWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310096


On Thu, 18 Dec 2025 22:21:43 +0530, Manivannan Sadhasivam wrote:
> This series intends to fix the race between the MHI stack and the MHI client
> drivers due to the MHI 'auto_queue' feature. As it turns out often, the best
> way to fix an issue in a feature is to drop the feature itself and this series
> does exactly that.
> 
> There is no real benefit in having the 'auto_queue' feature in the MHI stack,
> other than saving a few lines of code in the client drivers. Since the QRTR is
> the only client driver which makes use of this feature, this series reworks the
> QRTR driver to manage the buffer on its own.
> 
> [...]

Applied, thanks!

[1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
      commit: 51731792a25cb312ca94cdccfa139eb46de1b2ef
[2/2] bus: mhi: host: Drop the auto_queue support
      commit: 4a9ba211d0264131dcfca0cbc10bff5ff277ff0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

