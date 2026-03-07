Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076735838C
	for <mhi@lists.linux.dev>; Sat,  7 Mar 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883760; cv=none; b=GgSlhPDRgcR0EvpgeOjaMNr1ImDSeb4zB+3lPcllRddXkCz2xhkyV77+xJUb3kuUK7HWSqyIJQPiyjZp+WT7a2DD1jD6B47FIEvnYvDmb5GCp5Yus91pW8Cy6rBOVqzZxRsVS78yQTtT8189I6Sxc3kctiBSe0niWQgxWdmjlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883760; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iit8oEr2JFhExaicJMwwGbQQXKYYzY8y3iXPK/Lu1Qi7mzEeJb+ZqqGosRkrsKEu5Bw1yBVI91TFObwxIoJkswk+ogr0C5uIWu4sIjnTr7xHZZqMQfUstIubSG0izCAvs6PSvYYjXR3X9APVT7bIyaHdKGhJgmnyjO1Krutw5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMLBSZCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB567Fs6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMLBSZCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB567Fs6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qrnC1976618
	for <mhi@lists.linux.dev>; Sat, 7 Mar 2026 11:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=MMLBSZCEODmf65KM
	WTGAu6cSZXV8zO7KcZdu1QYppchEuMAjFw9PsZaPDSObGoHSV298OjX4rRlxS31a
	ShLIjSX4e/Il5ULFHLHHdpiOO+0YTvtxszMTTF1v2IotkKKKuueLpqbJcE9pbAHW
	q0N93E2L1djGKr7yNLzYkdDgPwJYxGhSmlWn5sn9PVfOxXZFxK5bSrYiEd1sxYy4
	DvO8k2StvOjyipliFk/crY/2v/2jFHO/RTy3khQm23o8EdGHwQR5hMVfo7SoQ5vx
	+KAs/2nqUXTLOUyCE9CoL8u0YM91zUF3WkeOZi14dDXrqs8XwuLS1HFM2utOrtN/
	N7KKvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxrrk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 11:42:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adc527eaf5so58959275ad.0
        for <mhi@lists.linux.dev>; Sat, 07 Mar 2026 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883756; x=1773488556; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=FB567Fs64mHQTAdZle29qgJH8IPXw3V/55ZAH/lAlzvLNiq8E+1TkVYH0IwjJZcsU6
         6/Han9QfqoOG1bTHV6rPtQeV8o9y2VqOEU8qcpxOFQoTVGvRAhV2ZyqBUdLkHPAw9QXX
         S1oTuybEjmivkhAWCHxnCH10N1soCGdNTdjGwhCDjZOAhUtHdaoLF4Ee1zBaHmXyGTND
         AeXP38AZYv7bQZSnottQQb2wWvfeCy4PMvuZDSFASyJAu5CAMk3C5FDBjRDZEpFg1UrD
         4k/TUD9G/lzPvnNvr9QZk4Bh+9o4bcE1qji8If7o/Hv48eInX0cLE6IrTs9WAm9wAFf0
         HC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883756; x=1773488556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=WW8E+8Y4l5VNJNbyWcX4sLwOLqG4NAsm9oZdWwV/NnEY+MuFsI1C0189J+JYAqeL87
         DmVB8k0mFTlOOJWhPYgqaqV+twUfbgEUuVh37Xon5MMQf/z9XmJdfDfGei7U3+UjPWiT
         iNv1v+7gcSn5FwoscaGFQWQKFcbcEygghvOgSdfnsPr/bJPdnjMwr6cT41zgWXqORI9I
         cLqaJgxsWt9V2rdu8TIR8BUiW3EFHq+OAlXL9g66CF3BtZ1a1CcmtPecT3kDooAIOab7
         C3MQTyDU4sa9Y9x043WmQxSKxN+3Rql9ojaJcrHLQwEcp7tmOrq6kqyn/9yu03zQ7UlH
         ohXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhWu/SJrmboZFTqNU0KqaAyHSUd5EWAiQtAyAwIgQryGj/osj3GFXTihUqH6Ynohp8yc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiFL3KNL4pzPN3mN75xWj0P7SI3cfeKiR1pZlPNiEeZ0wCompY
	tI0ze/oMZ+gJeCJYgHZuvUrl+ToU0OyvxwISVuOFfP8Bt6KJ2XGiKhX7pD8UyG6ecZiiFZFdHkC
	TY0d2UWf9BwBvzXUzF03tjVNKvkGFuRd7RJ1HERRRrEsgZ+wccBxjAitE0iR2yAo=
X-Gm-Gg: ATEYQzyK1sg2wSN3CPntRmKCWjKLeZMJzAUcI8x7YoQqQRYL6Y8c6JKfwWrtMBjkfmH
	ooooHOITO8Frf3If4v5W18GHsFn0ZWlCfFOpjUWVeCnEJ+j3vu8F2ztzMc6k0mTYjUIT39l2TOp
	zGlbYRp+bTxuVSUweV2gbvQDaOZZPwEQTpt7Yatjl+o0ZYJLlLXbYSMDlTiQ4pgy/Xpl3GJ6cw9
	ZoLG/u4Cbnk7L6Vur6RrqDIIeRGfGNF32qMosh+szkruEyy13Cag4uMRWT8gEIPnNJsgsu1uEhf
	C5q9yO64B/UUuq3YnoTM3CwAsOosjmXRwPprvVhwGHhJOIf7pXjEVyvKLFkdU7ljQbCgmSiQwMs
	fawT5KKfYf64p+h9rbiwjPFmcRcZfZ5fwAipZDfeHVrp5zSaXt1M=
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id d9443c01a7336-2ae8241685bmr59503475ad.2.1772883756459;
        Sat, 07 Mar 2026 03:42:36 -0800 (PST)
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id d9443c01a7336-2ae8241685bmr59503205ad.2.1772883755994;
        Sat, 07 Mar 2026 03:42:35 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:35 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:30 +0530
Subject: [PATCH v2 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-9-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=w+aHsVXwaMyLhL8Goe7uM28s40e002IzrEGaReObHvVofLk2hwgKkxUc87dYK5Uy5uT4SJ0v/
 IsfocM9Rc+BB12kavhO74NwlBai980rYUSUPMwBcVaAgD/rMcxEMAB+
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfX7C7QAq/ui789
 Sid7gGSAom6DkY6cf+kWfLOnfP7clNEVw/6HVE+qthX9lBfX6PPb5IZSvYgqJ6oqzkyOzQYfFNL
 H/ksZa+0g095RjDXgDa7odiY1ltIyBId3YiluERTGQPfZH0tjqxJ3PLmpMmYsQttGqYGhhOGXDg
 VLzDvx+dFH3SEQohd+mtLZYjbl5FOXwpStYwMtDFlierFVclTV/nnPzERGBPj8GsKrId+TAOyRT
 /dBu3hPOAu2NhqGpb5Ts7N78xkkr4CbL18BbhBX8DiIuYUv4OCJNp29ps/HZKYTUkeBTGkg7Vii
 iNKN12bPWtQwInJwQ6Kq2IEZRMByOExB0Vnjy7DTKhYUJQn97NCxXlvj0TSeOKPR2GNFBIj+/WC
 PMKfLDJ8CCWfxHnNjqlP25dNiGCy5aTgJNCbfDk3wZ4hgMJuIalXTTafpVHZ3ZmfvukqKEw04WE
 bfg758cA2IfFIAETs6A==
X-Proofpoint-ORIG-GUID: hWD8nCTlJOr_73Q5FkH3ZWMVxJ7u7gMO
X-Proofpoint-GUID: hWD8nCTlJOr_73Q5FkH3ZWMVxJ7u7gMO
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ac0f2d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603070109

Add ABI documentation for the DDR training data sysfs attribute exposed by
the sahara MHI driver.

The documented sysfs node provides read-only access to the DDR training
data captured during sahara command mode and exposed via the MHI
controller device. This allows userspace to read the training data and
manage it as needed outside the kernel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.

-- 
2.34.1

