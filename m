Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0B638F23D
	for <mhi@lists.linux.dev>; Tue,  3 Feb 2026 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101712; cv=none; b=DMnM+kY/WYUNB7XHxNlx1YrN3VH53eiUT/eI2RIR5anvC5/tfjqfr/EgtqRAXKWlM95LTGm/fDbug/MM7tIMKUKiNQY6WvJKQ10asnRh5JW9c78eOv+nT90XvHn9Ge07epSeUSfKkEYxaeUxLr0sWWk8wSQZ6Ia5GQTJTTXO+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101712; c=relaxed/simple;
	bh=1QZP2yBOYKQkZyiDROL5btYAGl+z9w2fPfu/JbHUWXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bMjhZhYexRlABzPWv6q7Jpwlt5zqXFFNDEhcm06OIgnDJt6yBVSn95c3uaGqYzLf1Fbu6PWLW9+1xli3Ym/fO5IGaEQ8o3vi34BZKrHeBViTKjhFUje1TLVkmsm0uHsA03t9hXmhks09pKjze40HuXxC64HWqEK80jhQQw9QoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwnGYxAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jfw2Gk92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwnGYxAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jfw2Gk92"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612KxYha2356975
	for <mhi@lists.linux.dev>; Tue, 3 Feb 2026 06:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yJh42zj/7ybOfbUD7RC8M0
	spX8TaPhWMxB9G3xfmx3M=; b=OwnGYxAAvIRItXG2xLKXi+IsVf0lLyfpE+BE5e
	rR1eE1zZyNZygzoM5fRBCx0xRSlMxpzBhCyYJyjQ79q1Ws6bsFpVcnJqDuFob+Bm
	KQ09wbR35P3WiL7KhAA26i5xcCS9diORBM2Df4DMl0O0iZWoc6Up8gxNfPP+GKIx
	PBHk/28h7DifGqfTcz0MBrnKY3uuwkzSEa/ecwYuFjC2R+aRPBvn8yEHCOT7XLQJ
	rX3wUTsMQSAgoTnDz8I5plb++2XENYN6T/FL4fi+hHeQF8hDgnvJdrqmQWVqBWaV
	s5YMpEL6f0GetcKFNWQ6S4Vetxmzo+vHh7zZvdfJ8bhlaVPQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0mb0n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Feb 2026 06:55:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-353049e6047so4101678a91.3
        for <mhi@lists.linux.dev>; Mon, 02 Feb 2026 22:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101707; x=1770706507; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJh42zj/7ybOfbUD7RC8M0spX8TaPhWMxB9G3xfmx3M=;
        b=Jfw2Gk92uoyqOesTVWlRpbmrWWvergJsP/mfVMDI4b5wzPVclTc/tEJFvXNEzHRLb9
         ypPjycuBSd8hZUEM4JCL+wImY809cN+eobOBstRZN4eCGoiynqCNuEEbyhXkNfDpKhX4
         oPz1wPq/x1u0iDizrRIsBQOj8ZaU9XdAVgud7QqDX76soJmpIT1hVZ/nzmPygJizM8We
         124XIQuFtt+8WUX6ogxEb9aXn/SFdWpLrAJrPEcjfYF2+bQqX9Wl6NKq94JNhH631lgl
         Piu4LEEhrrVOnHL5X4i/kzvO6+/9sIY1jy/6/J08qVjbnb9+allPOzpp8TxjUtODGe/Y
         n9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101707; x=1770706507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJh42zj/7ybOfbUD7RC8M0spX8TaPhWMxB9G3xfmx3M=;
        b=DAYIAHkN8nlHQqDcqHbby/hqtzTsV4NPkepyuWcT/k/mKRujgXTjmJKpEOV2k9RKd3
         Ak0hAs9EzpdZKzaQF83MTJSf93RtJpGlmnqNNalux/rbFZulVRpz/uHchLuXXjxiqA6g
         Znc8GxKQo0N3SKsbcc+lRCWN6JSYsxjmd+unxtCcCIAnKpt1p9/DLekzvo2WWzsFqO1D
         WNtlLwxwnaT1XpiB6INsDRO/pbVxrLBXrCb2dlWhx08oNPACW9T5GRSm6g1WtudnsvG4
         wlDZ/0Lv3jTKLaytnxwfzr5T/iMnX/7QozayObbFte3O4Bozuvjt/0LuthEgI6VssVC/
         lu3Q==
X-Gm-Message-State: AOJu0Ywgqmin/TXoE2l+b1QFME9fqEVjsl/aTtDfbv/XULQaDvH61Ago
	4u8CZlIcM2CErA2pHwjUEH3k7DL1oV4IrOH9rRyGiReDbQq5uNblmvenuNrrrU4JJFunSNsaRkZ
	ajiiRKaL5OhExIu5CeT6xzBtA7jZJJmn0dCfHaYVRmRfOE4YVBYw0hiw=
X-Gm-Gg: AZuq6aIQQS+HrM8EqMMzs28ezqZQ8y3gZWAuNXDooeOp9FoFVp56grTnfpcf/KBKp/W
	dThlI7RHwfHuQe+3iNxNMP32yThz0NUsRCbh18k19X/pp8Yb77Ks4S5uuJFMRH5qaCAEoOeaOpi
	iD3d0hXMj+YLKxo51Ma/KCcEa/BEq3o9lVOOxSYgFipOuPZl0PNAloAdQ9YAIIe8w433jSzwqpZ
	AdAnG6V/fgXkry4WOpGxSjnQDr5HfAOw3+lUh1/FloJ2rCIlbZaJueNl70L5qQckTk4GCODOH9B
	StmcmEQxIFPOQGnfSvEdChaQj58WTUW22pfOHkURBS2LPKxQgdvkY5elxMUTAVJEd3cCI5odto3
	PlfYeJl/bt1/sdjrV0EzHvC0bwavFqrZiK2E=
X-Received: by 2002:a17:90b:2d44:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-3547be4a465mr806919a91.12.1770101706693;
        Mon, 02 Feb 2026 22:55:06 -0800 (PST)
X-Received: by 2002:a17:90b:2d44:b0:354:7be4:a250 with SMTP id 98e67ed59e1d1-3547be4a465mr806882a91.12.1770101706186;
        Mon, 02 Feb 2026 22:55:06 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1036e6sm837924a91.11.2026.02.02.22.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:55:05 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] bus: mhi: ep: Fix state_lock protection issues
Date: Tue, 03 Feb 2026 12:25:00 +0530
Message-Id: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSbgWkC/4XNTW7CMBAF4Ksgr2vkGefHYdV7IIRsz6RYEFxsC
 K1Q7l6DukOEzUhvpPe9m8icAmexWtxE4jHkEI8lwMdC+J09frEMVLJAhTUAaJk483l7jWnPaUt
 s6RD9XipE3am2b31HonS/E/fh5+GuNyXvQj7H9PuYGeH+fSeOIEEia+WBauvIfMacl6eLPfg4D
 Mty7jv/SDWH1GQbgy05B7OIeY0oqVHV2lDvXNW8QhoFqOcQWzXsTKcJjXpGNtM0/QHJS+LBkAE
 AAA==
X-Change-ID: 20251113-reset_worker_deadlock-0223907f7c9d
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770101702; l=760;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=1QZP2yBOYKQkZyiDROL5btYAGl+z9w2fPfu/JbHUWXg=;
 b=NOMgO3tCdmINAuGBFIcL9Kiol8jRQcPQr0FNLlxZ32gQkeV0jKm7wUWhX0bxMktCAWUid+gA3
 AhFiDLypyBbDrp0/1AdLLVsVPwqC41j8HkaQDD7pNKikz1LTYnmU6Vq
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69819bcb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pCodMjt2KUT0m2k7nJoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 9s_M65S9DrESwJQ6j3IrPi4reSEv5w-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfXwOELSSDfAgJk
 qnGfJySSJt941aqWoGj7oSUNhW0Ft8bw65LX+lNMpB6O9Kej6jXkE3ayI7QNuzrrzAPEU/I6XWb
 IkrC82ssY2hx+4RRzGGBBj+T2GDD8xKwOM4aBhYrCRnsas3FNuKFsKu57OtJ2nSq6FgBmcBsgag
 u+K+o0C0oJ4uU3nwt2fEZzNGxTdHJC0jtt1mAS2rUqXQ8BkH1uskPkc7t7Wu58kgOn6RAct9Mx2
 btWwXOZ3SqtbAZt3F2BO5fgjFI9sLM5+mLq5fY1q8tBvOsZTdHtgwqPMfFunKPlW+qPVvYDCY/U
 h7lxKqDk2IXasNU3NHqkQygxAY/hbBCRlzwwYZ5O9zBq7cKbziMmk3fbXs+cj0z8GbouDS+LNfB
 2tfY6iMn34iJ+Rzml/cTJ0o1MwwCbm9hWp6IkRaKUly+eAFz90dPix81V0zagpfynCogS/00L53
 u7nanuC9qHsXMk+eOpg==
X-Proofpoint-ORIG-GUID: 9s_M65S9DrESwJQ6j3IrPi4reSEv5w-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030053

This series fixes a deadlock in mhi_ep_reset_worker() where state_lock is
acquired twice, and adds missing lock protection for mhi_state accesses
in mhi_ep_handle_syserr() and mhi_ep_power_up() to prevent race conditions
and state machine corruption.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Sumit Kumar (2):
      bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      bus: mhi: ep: Add missing state_lock protection for mhi_state accesses

 drivers/bus/mhi/ep/main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251113-reset_worker_deadlock-0223907f7c9d

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

