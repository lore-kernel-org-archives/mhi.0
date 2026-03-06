Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA4E3783D0
	for <mhi@lists.linux.dev>; Fri,  6 Mar 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782877; cv=none; b=EXJ7/ODprF8sK2BYNCUTwiVV9BsCbNHiKuHIB/ji2tN9MaZ0NePl02V3poWu2+PxEln5bo7b6x6gLSXdsMZsaZT/E1zCeXKQF5xVgIm//h7yqdpTczjsr5v+PV/0GnKGxkaw3l3JHnpF3AcdEQbzS3Iv1KLNxqWdW1c4KZ3qans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782877; c=relaxed/simple;
	bh=KBqTZQUmVm1l3TMx2vocMDlDatncf7hKM+rVdpjNXZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W/yyEGsjgKbeidVSojByo6pFInuFMb5NKXbuVvWZ0LSFm/Pj9pFtx7Is7umKu87KEC9+e/peGsNa7RkR6SY1//rz+ceFwZ79bnMe4jhdObWikFSt33NxzhTj78Jvm1id1kHd1Gc8LkPg1pXxGZyakA2ECFGrbmqnsMqDoS5bmCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CADg3UBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jfNDx9Ii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CADg3UBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jfNDx9Ii"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aFv2265112
	for <mhi@lists.linux.dev>; Fri, 6 Mar 2026 07:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CiaSslmCTrFWUovPnExrsa13sAVJv0zHhYcKCq796dw=; b=CADg3UBEcph6bKGS
	nVrjTHTJXLEOLau4WU7ELzX30cI602IOrEvgvmeSMzoVPFJEbJL8GogncYQ/KSTj
	y9/PyqxzZa/5im3yIi56GBwrgyd56BYIoKlmwhCvg4HMWolr67UxuwaNcaN+0zxz
	HNDzouQr+0B3nJiKlWyi1MeTsd/b57CTrbknD4EhvfjsputP1Mj6HVBNXYuDphM4
	yucd4/pyeJOMGIUT7+BRFoyG9ZvGCKzyaCH1tY/YvPtVol98zVpKjMSB1IZLj6aB
	q7rCF4CswE6djxmiJ7Hvg75lTI1yamoMbaBjwp0IpHntfMXVeMyBlNfqnZnJUoJG
	Nl9vNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqdvktjxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 06 Mar 2026 07:41:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae65d5cc57so156627205ad.2
        for <mhi@lists.linux.dev>; Thu, 05 Mar 2026 23:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772782869; x=1773387669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiaSslmCTrFWUovPnExrsa13sAVJv0zHhYcKCq796dw=;
        b=jfNDx9Iie2PGYzMJgzFg06qpZEySe5wfr7jlRjCP1TYckwtwnF9Y6nwG0JoPUdQS2C
         D4WmMUo5n/c5grrBcMbs92nXC39VuWeXHZ+5DKB2cOxY9IvEoRaPSNKyQQSeaiqmboAM
         QnEMgHdu9EzeBScdPM9xleyJLW/2xkqeHIkrLCvOF3mgn5P6ULVK+0OMe1p5jmkWy2og
         WEZENATzPSIK9iWG+hXJXrqTqsLKHNayzvoiFbGNURgmXLyfI9shqCl49x/AHI8u1Tg1
         rAmDehaPbNTgGLPqg4mBp10lXSPZlUEjo3xA3IXrphAbhNukKj8+b6xIdcz3EGSBwMMe
         xCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772782869; x=1773387669;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CiaSslmCTrFWUovPnExrsa13sAVJv0zHhYcKCq796dw=;
        b=R2/9WUe45FssIg3yMutZ58jWwkXF5BeqsR2d6zsrNWLsBtClP4McH2PHI9eHWy0qrH
         DwGdhfT5OWCksdZQe1TN2z9nmS1UZxwGtWDhFLvlqfBat9O0FZOV66Ex6MimCMD+cZy4
         Aeh09EwW4MsU7UzDrKsfi2LS+uZUfW5qS0UwXcqrSwt0nL+7xIJuJx7fjQeVSQHAiAUs
         bQguEXR90I5rxyZtpHP4iEFWt3JTDDnSQtdS9CCLKGzDJOK5JhzjnDKI7OD4Yn9SWPi5
         KClYcR354Ge+v2t8t9fW++8TKp/Xtil/vBf3i6ZDp/4rQEAiVAj07gedzK3O04wFERnl
         PNpg==
X-Gm-Message-State: AOJu0Yw1bZI5htjs2Q3T9yHmp+N+ZFU1G/Y9jtWrxyreCTy1mnhSNcRR
	xncU/2w/Opul9E1m1a5uv7DiUsCcT8b/0xEHag3u64lLhxmNZxE6eGvIMQ/pQYxzPfikqGW5QOM
	+61Rq+NljtuyDzHZoJaNFdAJ0wnMMtUBfFjnmM7Qgmm+dx1GMed7aQ38=
X-Gm-Gg: ATEYQzyc7PSqWxEyXTa45z6gAt5ZybaeUav9EoLrOOT4VMzgBOzR40Ij4fqUabfUvzb
	YvjyRbVTzpdnWc/f68qRDkG3XTR+Pe4DJCxFwpiOk2KWWaGwTQVsW/HGCbq7ghPRiMPTIBrIgwN
	Vi0Y8bSdUvFL2PsMWNT4C5h8tMhEV0OcoN6gBJNyjGktI2djB7AJsScVYzMfTyY671E/ED0Ow1O
	oF3xGk+5QJM9tarvmT6qTnW6IxI/8uCTTpUFMSds1UxmsJJpjafeIwEz4yxqYJXKblKU2WARDyz
	ayE7J5MbzXCrxyIsYsn9tqCCoBnPk0L5yU7/kx/WjTwZ9B0KpjABB1b6rMltC/w3bY/rQXqd0Gn
	8Ondh5AkUBd/EPIwbcONRaBp3fLzlyS6JEb2Ouz+vZnkRW1o=
X-Received: by 2002:a17:903:2448:b0:2ae:62c8:771b with SMTP id d9443c01a7336-2ae82367245mr15289985ad.10.1772782869037;
        Thu, 05 Mar 2026 23:41:09 -0800 (PST)
X-Received: by 2002:a17:903:2448:b0:2ae:62c8:771b with SMTP id d9443c01a7336-2ae82367245mr15289775ad.10.1772782868548;
        Thu, 05 Mar 2026 23:41:08 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:a6f5:7b5a:25de:64e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8baa3sm10541835ad.65.2026.03.05.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:41:08 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] bus: mhi: host: pci_generic: Improve boot
 performance and cleanup
Message-Id: <177278286480.10289.11737446909883935736.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:11:04 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=M7xA6iws c=1 sm=1 tr=0 ts=69aa8515 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nnaEIi7Bd9H0Gnl-4-0A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA3MiBTYWx0ZWRfX4PX/qdVnOt6t
 mVGyWKlcTR+Ae5AYkkDESOIQhQdnFM0lCiswCrltS2/Hs7hcwvT/1A1yFNOEV/9Fpsen1fkCIUK
 TX/jYAm4xhQDMDKi5+Mj638dDOSpERocI5x9h7CoO41wzAHlK6rz2loM0wTrdaAatlvpohcHRVS
 s6VmQwwc0A1gd6LaOli/UYBPDYnwcnYlmFzarHFKPpivZ6grF3335y9Nl9PxVfY1ZHb7I/A8dti
 SktiPhsHtYRtMblAOxvnbOQXhOxHon3x2pz0r6kxKBQcSNd4o2edH3NIeCaJ6XbgQEfkDIIF4c+
 nYxFID5rHl70zDZ6Qd6XQyKGwjvDIPHT8Mu1H3NRQ6f3RZA/M7rMF45yV81HFqZ+qnn4uh5G8qW
 nJbZxmXtqL2R75jiRF0OLIeUb0JIoP4EQsu4w6tBE55bKMlS3ASUkpqO3kad1zmketUeaLjjCgt
 vNo/JqHT8sTUh5N/Vyg==
X-Proofpoint-GUID: rVZ8N9sK81cpGP0Y_R1xbuMF4lScNjvy
X-Proofpoint-ORIG-GUID: rVZ8N9sK81cpGP0Y_R1xbuMF4lScNjvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060072


On Tue, 03 Mar 2026 01:02:12 -0800, Qiang Yu wrote:
> This series addresses boot performance issues with MHI PCI generic driver
> and adds proper cleanup in the remove path.
> 
> Some modems like SDX75 take up to 20 seconds to initialize, which blocks
> system boot while waiting for them to reach mission mode. The first patch
> switches to async power up so the driver can return immediately and let
> initialization happen in the background.
> 
> [...]

Applied, thanks!

[1/2] bus: mhi: host: pci_generic: Switch to async power up to avoid boot delays
      commit: cfdb41adf1c2822ad1b1791d4d11093edb5582b6
[2/2] bus: mhi: host: pci_generic: Add pm_runtime_forbid() in remove callback
      commit: f227b246307e0cf3091e13e7fbae3974aaf38eb9

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

