Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295CE27FD4B
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104683; cv=none; b=VV5CdtzR3L71wQiCRuZ1hD0nvpz2oam7Uk7cnDB3STGtcBB0MHXVCxU4u6qN4nr28bVDDy2/gQiTVUBHH54T27Kx9FXYc2OoM7AFCUqzoKvwTareinL997ax6AO58ubgBhkt9KOqa4V0ywX+xtiBDQmbl93DpoGn1CAPvQTbrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104683; c=relaxed/simple;
	bh=/1sJCH4aTkjnvQlnz28mHEwHTNCEcg/DB+ztRHNHtj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ed7r3xb2YtHhoOch8GPXDKqdqjZQAFFdKwL/OUIHOyxpnt3Ya1rtYNeQzuCpjyjK0FqUvE+jt+A7KkL/wdMj7DFXMMMw8XTWTmsfap7nZEdoLmrDM+v0dMIN4I5lOft/5A5D00ALT8OJicQ/d60QBsDyMq7TC4+cg8tgci9VpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTQ8l0k8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dyr/5MTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTQ8l0k8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dyr/5MTk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBtEl1600340
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 15:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=arBA4jNd+HaGHDjGRvTV9aRNGknsiOJivvV
	DqRhmnP0=; b=jTQ8l0k8UiiMhpfiF6QLZiaeAdkTkMKGdGfCXhoeyursUyYbSQx
	PYivx4NbG8TKc42AQkWD5r8c9IlwkknXz8dJrrPv01E0wLaUwlw0tTFj0mO6ygNF
	AOJn9nl2+xWX/flkJVwRtTpdQ1TW/jcE9lpdQCxwMG0NQHvmiOO3JXbsd4JIG+wM
	C1EVfkFtU/kcunXOpApc3PGNxASETfKt8wGqngzyPUIQAMEP2XKoC8aDVtW/VpKf
	KEXrBrtBBvJCUTmkUnlSesZqeoEyMIqCLXpsdnfdU+ehjkVCLknSSlZlphDVn4nh
	ssA74Qw/knjWaCIbfUmD31VFhzNZuQBWknQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg2cv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 15:18:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso70552715ad.1
        for <mhi@lists.linux.dev>; Wed, 10 Jun 2026 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781104680; x=1781709480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arBA4jNd+HaGHDjGRvTV9aRNGknsiOJivvVDqRhmnP0=;
        b=Dyr/5MTkkzanquxgQ8RGmy5wZfJJFfRW1DOmJ9o8P+3x9PH3UsWWwLwaFkL2rG6ZA9
         u/PdXo2SAwR7VrjYhcZ/3uddwcm7gi2xAIEk5bjScgtAvdjaLksED7rgVGmEunRzg/F8
         5B1izBkCqsXiVQPOLkrAjVXmGtvDykWzQ5MnyGge/8kMeg9H0WDFPAW2ymfS4kJmyWVH
         XcxcvOhYfdW/p/vT2wuv1lVuyfBi08+EjWVAnZZ/sBIjfq14+NeLW5Hj+fn5t9+wZYEz
         8TXzrE4JM0+0fyBgywruh/JspcfaD5c7DibhwfTjy63PJtmRZaEeo1f1ak8keCUaGeKw
         +rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104680; x=1781709480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arBA4jNd+HaGHDjGRvTV9aRNGknsiOJivvVDqRhmnP0=;
        b=rRKubSbk32JH77dxA8kwiLoDfFUW4592cnYObvQDuMi3x2t60Q8WYXfF7pT5gr8/BC
         yacLqOXPNrfOweV2fSCoXvPCMMPs2CsiqBIcTotILphm7eJIjMTZKD4cArRP2myDvvlS
         cPuf8M33x+gpHIHBVcpKBjROJDBZ0yJuxsWu8c3f2Om7x6mzsD7VllxVl0qoqBfj/h9J
         bZEzrYtStPEbFF92VwxUqexvUKJOEXgMlEZ15kCQiF4DXFIoiR9tKlUi5g+WKr6FeaEC
         hwEGS3KloN++XZHgDM+C9qBmvVzZfMM0UkoJ3/d+xRiz+72KOhci7gC2GdqA/soAbHY+
         zJWw==
X-Gm-Message-State: AOJu0YxTcqLhrsSztLZyc/dQMhKJEibfU0p297A81SFBJmxgXC5nz08V
	wFxZtAI3ekArTE8bNPtjKDjOejM4S0ssMizs9FofXXvCZbrcVoQq8TQDsFvz7r0ScKUGRGp6E6E
	P6Vx76jVHRuPKDHqZKeJTA0OQ1w9x48mYiP+brLeHRdBvil5yWIPqrp2Fmwj+AJ8=
X-Gm-Gg: Acq92OHcXR63uqF5zjTdIBWL+HrckfLHcW5me6eb+GLm67PNF1zKL6WNwK9qDo8o8SM
	JZ52GkywcDsWF6/rj4mO99XAj6Jjb5POQoUXGyjmVrblg91MZz9n8I9TyPBwIfuTAEkYyY7nPXp
	6IouaQZsx9WXNw1zyhixRH6lvL33bd7RHWy07r2myq2tuxl5kTv5kT7RKDMdTPwycTILyatsC55
	/t8xwPq+cL29bQ8faU5uJ3jzm7ArAdcD5X7SJwaCrAM4qcK5lKMt4xc1BxyqUoPCHjItDin3HG7
	BzAhHZWVt35o55o6W/omEP0BZXOC36aFL/jL7apEw6YRYc13N3uzlV2UxZ13ueWZ41U1SuHLwkn
	3akN2Xxd9BrLnEyYdtbIMCbGIuade8ilWkZLoAl70HfBoptY8fWY=
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr288458645ad.29.1781104679963;
        Wed, 10 Jun 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr288458145ad.29.1781104679381;
        Wed, 10 Jun 2026 08:17:59 -0700 (PDT)
Received: from work.. ([120.56.195.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm248366335ad.2.2026.06.10.08.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:17:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Add Jeff Hugo as the Reviewer of MHI bus
Date: Wed, 10 Jun 2026 20:47:52 +0530
Message-ID: <20260610151752.9373-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ynJq89e52O1WLvOixtBS1c-maoQVfGbm
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a298029 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=n8UK4BQKCdfH/t0JQ2luxA==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=jTQlwRca_LGcpbZH8LAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0NiBTYWx0ZWRfX9S4tsGSRpxHP
 TyYNIVWFHcrHzApQaZAGDj0a+3yVxqNL9dfVDssPG+GIoR/howJRfA4hHrnMK9F6t/JpQbh/alh
 tjv79zQBIVzO5AesrdDAHSmF0Gkv2qfVnV2U+IczQxkQKa6omtLuh3Alx0HEFn8FOp09p5J5NRe
 Ja/Q4r+FsXKVtTtNraNflYnAeIjdZM+W9PwEQCMqArm4Yn1gq8IS7nZme6morrM81b0uOCebXf2
 k0iV+y6pJe2Rv6++fDQB84PoLhLi5Eohq465iCO4U6lN/nfG7AmiI9xFNsHVn0KDSZUaH6n0saB
 Ilj0BkP8w3Mrgo5jbppA2DP3ZMQvzQj48aazdWHaKUmt0j5ReliDq63l9P2G43nhUN4+0BhFtqY
 eGlG9zjm/ALsxOpZz7QNvHNIA8yCxhY+Rovh9naRqog+gzyzzrLe581dyv6DoWgqeoeGVqgyomt
 zRzhE22LZd0oSUof6/w==
X-Proofpoint-ORIG-GUID: ynJq89e52O1WLvOixtBS1c-maoQVfGbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100146

Jeff has been active in reviewing the MHI patches and he volunteered to
become an official reviewer.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..17c6fe6a0687 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17250,6 +17250,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.*
 
 MHI BUS
 M:	Manivannan Sadhasivam <mani@kernel.org>
+R:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.48.1

