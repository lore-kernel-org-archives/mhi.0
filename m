Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD892D8791
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765440480; cv=none; b=lhja3Y63/hRzvwN9f2e52C0EBi47LyqVYlDFqjpNB57npaYPGAK38JTupYhwTjZ+v2T98cxyXP8klyqKmNVbuNuFjn0u6pgea3CdQQz6+CvuxpVMG3DBJV430rqU1AXSc/4tdSJcn89pUuX+lxlkc8tnEbRVxvq8hvqxYMKY6ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765440480; c=relaxed/simple;
	bh=YwRYwlT/5tfVm4v4+QRSkVb8bWyUn40Z8NTxXHlxQqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqidf7flB2eE5nWoK8YQ326cC5mY3XNGjyAbzDB7TZGvjR43/tUxce5tBPhb2eXzZaF8flMFgTix8UH5S49lJsS+iI9ABKlj0s5ID3hxUnVAVy79gg+x6/2xY2qLSmpiBu9Ymj9WsOYHp+H5tqaBAFZuv/+6HpWWPSbfTuBy01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ha2NaYCb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4MvgPl7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ha2NaYCb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4MvgPl7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP6gC3728172
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=; b=Ha2NaYCbL2/nS4Ux
	+G/j5mRPqFeVVK76nzztteRTh5yUkWJaZIBS3axSoFF7Po1KdVxGOgYbvLR7jUCl
	KxLkDJBAqiuAQH4Zq6OVhIIAGCBy7jCROHnU0tdyC4YWRGTmX8bgn4oFtpREWsoF
	iMpmQVC9goywilc+KYpgX7909nsQgjvDeMn8VJXVMfneXW8bv+vpD+BLyCcYck8G
	G+qKujQkfDrRBfowbSHnLjjtxIkvHBodEoMMjGJV1evCGQBJYlBA3D13zAjw3LMZ
	A0Yrd1jvFY8yMEHn8Vfk6yetjFrZjU+WrA2AsYLNivTPWG4yf/ftbYv04bZ0jZgw
	s5kSeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0psnuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 08:07:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so850339b3a.3
        for <mhi@lists.linux.dev>; Thu, 11 Dec 2025 00:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765440477; x=1766045277; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=;
        b=X4MvgPl7u2hxNWxjg6my+rgZ3i+1UZ7HdA/t13XCIYDxpdv0d+fo/IOcVNP/Vh7c2L
         dm0ioAhFHjI3KPAR9/godjdXjqGVee6bKeDrgd6X6BBCzzGQssaGePsYfyaGI3NgJjOU
         8mE30fYmifHBLt4eznG8SoitASzskI7/+KxovlwnA//cbbCBPWiy9rhXptJ4HZgUJOIB
         svTPFLzy40tFau2zmQkHBO2eX4/sN0e/BoBcg/TdvNz3P7E7k2V6r7HthaHK2Oxch7Cc
         WiHG5GrPyj93DVLs7MBBfQ22aaTkqKNjh7yC3v1RVov8P0GH+hT+inZoL9t6snwgGBqR
         1QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440477; x=1766045277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rVdEM4N9xR3Hr3V6+sHkWVsTPd5reFJrxYZtqqalbos=;
        b=Laj1RPW4Dy8wdo/huXdfTbaxQhi/mpzVjr0Q/EZ6JsSp5owBberzPAGCFM64qVlz2T
         7vGVWEluaA9VTNgDA8A3n180vSDyezP+29pckcD/1A47xqtUFc1o4vjyWLJK8W8/UqnZ
         iNH9MK74leWlAgR4W8xZOSROo5q0KEXmCWf5C8Z2ldpX77VqAjru/M0OD7YvrSxI9UIQ
         3XrgVSjywmpn7PxrkrF//+lzAZVuhwM/X9fXh81UnmpX5+0JsPRm32v3bKmAHzb+Y5E2
         FAJ1NKYWsEuVt95kpyI5BWMA0xi4Y7qIKN5DUWG914zBk28n3y5yj3hw5MC0rLcI5AyS
         MBJw==
X-Gm-Message-State: AOJu0YwDH/U/l+JaEIwNTVZeLiASt69HeK6kwmHkBC4ewIS/RyKzTXjb
	mC9mAwdxLyYN03HWShb70Q1ZYupf4i11n7cvrzV/0rU+58RNE3I4z3w1/rL20/N+xloDia2Bie3
	0Gdx3Q2DRE8qoc6p6XqbwUiL2bgoK119uA9my4JMIVBH6oROysp6joKQ=
X-Gm-Gg: AY/fxX6iTqu4sUxby62+B64YPZKWrrZZeBkDWp86qzafF3mxp1S3CzNI0T8vXxmJgOm
	+VMcax96yt9EtoXfPOnwA8nfnU7sI2JCKq8yeroW5uSCw9aXQMwGy+iqKNPJLrFGFTvIwweXLPS
	imqxVzExHy+ydrvxK+5PWlN1KAMobVOvVToJNJnPoKhlwUL/uMkQ+KcJg3QEqlGtj7mHFdL+hjY
	0hKElTdakPIzuHOmkAnUYeh/A2tNmt3kOqVmpmfxh9nKi0iMF128tuVidiRDVS+VGNsEbjOYXgo
	cXUO9DfR2dRS8aOStNU/BD57awOsUGva0/Qd6VdajdoaK6CjzUXgNNgYxdZBHF8EZE7sGt8oNX4
	KIn8flf1UQFUGlDnb2+lT9WQkHIm+A9LCUg==
X-Received: by 2002:a05:6a00:198c:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7f22d20a2a1mr5351889b3a.24.1765440476759;
        Thu, 11 Dec 2025 00:07:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYJ+9iyQn9SlqYsFPXt6cpvvx5kDRMcqf2QjkFSt1T5jR+a+kHMx0928Hl2duDOfH9ol1+dA==
X-Received: by 2002:a05:6a00:198c:b0:7ab:88:e397 with SMTP id d2e1a72fcca58-7f22d20a2a1mr5351855b3a.24.1765440476279;
        Thu, 11 Dec 2025 00:07:56 -0800 (PST)
Received: from [10.213.102.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm1706651b3a.3.2025.12.11.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:07:55 -0800 (PST)
From: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 13:37:36 +0530
Subject: [PATCH 04/11] Revert "bus: mhi: host: Remove mhi_poll() API"
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-siva_mhi_dp2-v1-4-d2895c4ec73a@oss.qualcomm.com>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
In-Reply-To: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Upal Kumar Saha <upal.saha@oss.qualcomm.com>,
        Himanshu Shukla <quic_himashuk@quicinc.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: TIGCTbr-OKAbhgNPLi1sD459hJDkM2xl
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a7bdd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oQAhVp1KcIWGeVV0ezEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1OSBTYWx0ZWRfX+eGe18F22Tfh
 4AyPXDrYl2MGrZH/RxWDrRkThHKu/uV2gsf1NdArUx2gsZWzq3p/Hm4yX3yUz8dF+lJ9e15sw1n
 XQho8cZYDB6iA/zajgD6ub8U/0CCm+lddtOIkzFurdO1+uhkXSgFGfPn1+avc49tP+7NGyZNl65
 6183wPFySmRleomK+GgseNtbzGUjV2Mrnv5jNsaqp06A2Og9CsykA8LhTqQx84GXOO4NT/zZ5SH
 lCcGRGN6dqYmsoDj5FS1U0MeV7B6nKxUyAApabioP7BLFnliR+Jlgd5Xa4SMLDsSN59J754+l2r
 HSZWTnnfy+xaBbl93+C3LgqBNZMEMIZZmSG6NABEcpPnOr5byYBcO3pvJkurUJyri2Ob58Rxb43
 JyLroR3+DN/Z1D1vV7F6599ZwL0Zzw==
X-Proofpoint-GUID: TIGCTbr-OKAbhgNPLi1sD459hJDkM2xl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110059

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Revert commit 5da094ac80cd ("bus: mhi: host: Remove mhi_poll() API")

Add mhi_poll() API. New hardware channel clients use mhi_poll() to manage
their own completion events instead of relying on the MHI core driver for
notifications.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 7beb848ca5c1..5d50f6ebf6f9 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1858,3 +1858,18 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
+	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+	int ret;
+
+	spin_lock_bh(&mhi_event->lock);
+	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
+	spin_unlock_bh(&mhi_event->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_poll);

-- 
2.34.1

