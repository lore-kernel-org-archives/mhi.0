Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D56A35B659
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148198; cv=none; b=VnNFBc5ERYTCI4vqir8kG64RRZB0HeZnSrEtV61itf4tdNerAOnYXWTY2dAvgsQ+QzRbIncU6IsT8DDOH5w5uWwvk3VnV0EOBMr1UBqOPWZgJ4FabNk3vxSP8ta+2jaImBTVxWtXwyLXWHwe8n4mZL9Q09y2MkAtWClDmUXPNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148198; c=relaxed/simple;
	bh=VUUEikl5UHPOVfv4oKGMvbhN6g0SfRRYaQ479Gv4di4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8GSbeua5iRFTdZygDkc2AY9pveEfRccD0fzh49yxVvuyc/dpN4kCoXM6eBaJOogNz7LPQfNm0KWzQIZWrnAk+vSY1b6Ndu9siBS/yBr9Xs+0OGwx0+o/G3q5sM0fp6dJSMfQFWVUOhwU/xHSMydzcl0WfZhLXQ2B681qxyEr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzXDJ4yZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqbhm/fO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzXDJ4yZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqbhm/fO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBMHD3157990
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqmdkV0e8/mUqDD8XETz0W4AA/xXm+x9z4zqE7KF6y0=; b=DzXDJ4yZOhQ4A+9U
	33AwvLFNHP8PKCas+8cB+BkokTnQXwFbTAbQg/ER4qciyloTcqjN+VrJm3EcQ5Ce
	T9DVwBKmMYPYw8VkduttlVK7d/bsOdo/pIUnzseTyhomHvvSlY7LRPne2aJdCrq8
	onYiAg7TVBpzZ+4yclqqAarX+LIG1y8QTMTi1lJUb9SPjSJIEoeqCOJrjMT+d+iL
	9FoqjlWlJaCGrAWVfdTaGj2GJUIJngidJna7cMudEtBALiasvYtiLOmSeu8eCViO
	28h3UIUNh/+d4+RfqDpPxA+BLV897fLkW3R/AwMLGZiPnFOz1vTpgJ+pykfy6VCj
	1KH+Yg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b9b3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79281bd14cso1963250a12.3
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 23:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148195; x=1776752995; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqmdkV0e8/mUqDD8XETz0W4AA/xXm+x9z4zqE7KF6y0=;
        b=gqbhm/fOMqV9uAgQqxL2MuLoqcyTaY9MLMssLq36pO3HyJOzOoF9JSh8inwdwn178n
         WjuuOMdDUnMeywzKji9h7/nbgFAib8hbF/llTo3uAMPEd4n3hhygxzv+i9wdi1FWZvIP
         ldRXJfJEjjAHryXAOfWcRQ5mP0i7fDw7avzdg/dKWCfypu3izyWRDW0H9J7Jk8gJGLeb
         oVNyk9SQ8/bkgQRQfh4GMgtgYeSIrXA40mYAM2b4PBhaMbVW2H2hhpSXMlm5mlwUfHof
         CZV0lvaIOnnmxNVSW7tjSZGgpHi+No9n1oefGUTQKg/LzDqUjrJ+VuBuHL5Env4mKq/N
         /RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148195; x=1776752995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqmdkV0e8/mUqDD8XETz0W4AA/xXm+x9z4zqE7KF6y0=;
        b=flTlx0P2wSkL2zQAMFTeTflF5A8K6JxnLRfRezj8Z1eFHfmuu3I0ThYl3R4KrbHT4K
         oXY4NkcYiyRIxus42+mCN5xGPKYW+bvWaWkObalRY91ns1LIWHEQZnSaDoJL8h+eLgij
         AqcXDv8KXIE1P2ctRcwSVRtx0IKsxlfoOXcPIPaEdTOKMZvYRiJFAoWzQVj9n8zIVPW7
         QfBq/KU6wNPytipFnhqB6vR/Ka7Xzd0gtQjgCxnrCBuMMpamTccCzX0FPq7uOU6PkFMp
         n0d5ULDlSe0/x2417RFmkx1AvZzUZi/cJbAxadYSvo/3JrSyQ/VyxNyafUGeFtw5hpdI
         5AqA==
X-Gm-Message-State: AOJu0Yx6dkqbdzQpwmYwqIcKMddg/FI51jxR8qjFXxtSV9RD5QmqEnjZ
	eExuiSQYdaXW8UoMQispqa9jnXdIYO3jTIADfSuHT3x9ftzu4KdRBPx06lEFqZ7QTqMdrECy2qJ
	bYCBLHRkHBBbgqKQ1ptFiDZb+hsRT7GA7YCvjZhUCj9WXFG4emfuKDDM=
X-Gm-Gg: AeBDiesl62Pb6EtvOekfyuhRStj6GfUpNruy7zWdSC6Ujq81BeOxyWiKvm3Hvyij58w
	iskIgQRp0PPj4yQxKzYUW1cMD3L95YDGNo9GoMZ4X/0HAuKwcD6d/G44TQ2V+vhg8dHJqHYXt6e
	iXyM33Tp+q/nMYG9uXxdd5W7s1S0QrQKN86Fb7eB45Qf2G5FmeomDBgDTVt8qg8N2rad4YF6TMn
	7awJOeambwZxcI8g86FV3PiPoofhB2efYgUJ/Y2TaW5F8cRpV1Ai80Y59lOMwXOfTJ3tckQyIBM
	sfrVYrObjKELKrRgBDP2ZDXGZIcipkbpF/Yhq1/TZzHnJWLMnwO4a2x5iFqAY5zWA+G0oIjFAWt
	Q4ITFfUkBII+oUNses1L26T5OxvridlQIxd93ZvBJOdxKH8s2nMKZR95r3w==
X-Received: by 2002:a05:6a00:4212:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f0bea2ba5mr15310037b3a.0.1776148194940;
        Mon, 13 Apr 2026 23:29:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4212:b0:823:9e5:855e with SMTP id d2e1a72fcca58-82f0bea2ba5mr15309995b3a.0.1776148194389;
        Mon, 13 Apr 2026 23:29:54 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm12964090b3a.58.2026.04.13.23.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:29:53 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:59:41 +0530
Subject: [PATCH v2 2/2] bus: mhi: ep: Add missing state_lock protection for
 mhi_state access
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-reset_worker_deadlock-v2-2-42fd682b45db@oss.qualcomm.com>
References: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
In-Reply-To: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776148182; l=1292;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=VUUEikl5UHPOVfv4oKGMvbhN6g0SfRRYaQ479Gv4di4=;
 b=mfXuiOs0RRm9jJDNSqoGDvDqK4EalrFkiDlK4Wlj7Z5kJkqkvDp/kfdRKK9qOrU7RbAqLZZn6
 EjeQW2d3BIfBHhy9xK6WLWoCFh4PwFb/LSAZ4eI/BcV1jYZiDpGFFeO
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX/VMjkyAxnrKS
 zCIzLch9QbPIReoRbW35WQ8YtEPOEsk/ymi4GZ/KM1Qeh283sqAGGZJYk4l2sWgLxUbB5tWC2HY
 bJ8JvBHBVGvhAhGLU89EW69IPlpoMfXYM1IfXwUGOlvZiBVDn164WUK3kPTGMnee4k6LAEfNzzx
 5yXD5id9X06Nyrf/PAHnKMYYJ47FWfPr2QLlA0DNLrO204Xzs3DUIHIDJmAnTDyUictOwEDYOtA
 nANIQr3DvHVkcIEzpCo41r8XDrPhsw0SGfDKLbQsz4QX+guqHW8gnodUXL5VokX2E9aRbUpeKCx
 wXxzx9105hdOR2pPoTaWN4IjYE+CSYNv+R8Lh88l1sVrEIXvfRQggmdrkGTzIeyo1k+N4qciAsG
 LYc8A/FCXq3eMGdf11h6GQ9vPEI+HDfP1ZXxV/Xpeycln3F9a/m5pSQlky/tAlUwuNFzGR/qRha
 KNKxFuHjnDicnuXsIBw==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69dddee4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AUlretI1EePZII7xc8UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: qElY9tEc5y4HqN_M2ncxIqkH8-IcfeNA
X-Proofpoint-GUID: qElY9tEc5y4HqN_M2ncxIqkH8-IcfeNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140058

The mhi_cntrl->mhi_state field should be protected by state_lock to
ensure atomic state transitions. However, mhi_ep_power_up() access
mhi_state without holding this lock, which can race with concurrent state
transitions and lead to state corruption.

Add proper state_lock protection around mhi_state access.

Fixes: fb3a26b7e8af ("bus: mhi: ep: Add support for powering up the MHI endpoint stack")
Fixes: f7d0806bdb1b3 ("bus: mhi: ep: Add support for handling SYS_ERR condition")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 4bb007d1933315e5b0b40d235248d5373548d3f4..eefb0a6c82f68bf95f5c7418afa595c47519dee5 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1148,7 +1148,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->event_rings; i++)
 		mhi_ep_ring_init(&mhi_cntrl->mhi_event[i].ring, RING_TYPE_ER, i);
 
+	mutex_lock(&mhi_cntrl->state_lock);
 	mhi_cntrl->mhi_state = MHI_STATE_RESET;
+	mutex_unlock(&mhi_cntrl->state_lock);
 
 	/* Set AMSS EE before signaling ready state */
 	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);

-- 
2.34.1

