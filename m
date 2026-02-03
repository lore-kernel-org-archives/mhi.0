Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C938F937
	for <mhi@lists.linux.dev>; Tue,  3 Feb 2026 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101718; cv=none; b=prUXa7eGE2YKioNSf1QAAjWL2Q76wsOCO+hSDAi1qBvBX7AHduQCvB6p2eU5oxPgn7OS0rf8WFEXZG5jQXjRXMmfs9xnuCduve3BLCKkbCG3pj4bof31M5AIatTaPwGsQ+EgRxWhL1c7Nj2He33v4HI3C18WuYrn0WEqBTYfUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101718; c=relaxed/simple;
	bh=lxSYBQP96mlT5aJJCUIduL+qGCMMryWk8oKPo1JcZnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmF/c6UMK+C9W/vbHsqaUEZNjJfDsUQyhdFzLRbQ33HKohiH2SzAeKjMfZ53+LCdsUSDPllRwhbvTMBDELeWmw3ENVGWNECfKxtpBfjTbidqIWAjfcUkpRrgA434qLvui3b50hfKYotPPeY9lTPC/zsKtFL9oJ77UJ+Wk7p5gkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=od2gjrHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+c2Z9DM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="od2gjrHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+c2Z9DM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136R3cV277310
	for <mhi@lists.linux.dev>; Tue, 3 Feb 2026 06:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOXCSYC2A9VCviyNI8z78wUSXKOiy96tkmU2QjAY1o0=; b=od2gjrHJgR6kcKxx
	UAH99ADuw/DTZoBxDMAbELzqiOmKNlnyIs6s6FpgILXGAT5+rEBNHD1H/1yVj4iy
	P/OYhxOoD81qV0x1dBUUBNk13o//O327VcSAAkeHhewBn07odrqI7IHlphT101TR
	BLNHJolZkhYJjvjbjhRXQtxmEaJ1inxd4EtyjQQFDQhw7grBbsc/oS3x8mGyxuxZ
	GQWxzAdePG97ZOOGmZDK/DRzWv8HSql4nWU9fobLRUqSuTR/2wjHYutKmGQvIuF/
	GaYPVnrbcnGOPJ2224IWBDCA63gGhqlTy4iEDCzGUkFYQSWtEtjUwyUcIuctr3XH
	cghj1A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s39jy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Feb 2026 06:55:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3726146a12.3
        for <mhi@lists.linux.dev>; Mon, 02 Feb 2026 22:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770101714; x=1770706514; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOXCSYC2A9VCviyNI8z78wUSXKOiy96tkmU2QjAY1o0=;
        b=g+c2Z9DMda+FI6eDmrhqoPGWdjqAEevY1maWIS9y2hJ4KpMD7qr+3KkGJeo8Yjsoi6
         NXWLHBzFF2eMKEzUGAj+bzvj492B6oqar3CqxJYaOuyvdGxOuEi40xhU0SYDakA7s1Lx
         Q7o5eAiQLc9IjVrambZmEiY3f76d44iFtloRlf2UZzAhmvjcBCHKWZuneUKPkvfNi5XY
         qtBG+kg2ylUXqs0Ku3lex5ry0Hr+0osYJpAJfaBdjdQP1QT8Qfz8mxhnNuhzmq87rl2Y
         zP7A8dCkLwbQXIZG/1+CviCPqeKYBmGM0c+c6zuARq8jNQiD5c5Tw3SQ/8KINqmAgnS9
         E6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770101714; x=1770706514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XOXCSYC2A9VCviyNI8z78wUSXKOiy96tkmU2QjAY1o0=;
        b=GBug6ekdlswWS27S7zsr1gpkbgk3Da0Y2m5GK0a848RTFWzMtmD2n2gu5LtuwFuI1e
         7kNohbmviWQLrQxkrUAeheSWP0fy8uD0jeVHIycbkI3hE+/rCJd/VmbyplQKPuTv/dZi
         vqdYGWCAsf0y5+7ruT/rUFD6WUWgktA+qV7t6ajHPGbRlHFEUpdx3MlJ7rhwkiq6kt2G
         xLBYl7ZfELIWoaeYVw1oUEtNM6XnYCMrD37N5WNhagQh4ok/MCG45tsF6pp+JzcjNd5V
         JzcGwuUjzzLqJYcoW/CuV7XghRgTvXoObZ/OvvR+f+NB4OQDa9ry2l/te5Xn5Y1Gl1X0
         PPQw==
X-Gm-Message-State: AOJu0YzcHXvTlmYfZ3qwuRUnngTn2W3ht8mZKOv23Y24lj9vydThk/dp
	5rMOHVtTawspiAB699Dp8BnLNm1cNi3oscAuiunFFQNC1Fm477/eQGJlRPak+uUSzBIighvRxdC
	DlQUMMyUSPYJzLiocyxIOTzFUGlb6Ih3SjkfmJhfwseJraAxArAK0Z4E=
X-Gm-Gg: AZuq6aI6yaYMELmvMCZRjlUYNXnf+1vhuJIPffU68vjCB4AkScloarGLdnQPUm1p/NZ
	NZBh9fLz7gx6QsJOJfQk80u729pGb4EM6Z4nzO6cx/YpnhjR1GB9typNVBNw5+QqT/1QV8jue9u
	nZN/ID7JuhNo3618yv8T37kJIv/CbiAb9z3mpaWBEhQFJnvzhkgvaLLpQ3cbmu9a4OB8xUIKXsX
	gVfYCs2w7vX20Qal72njAllaOmM4NTUGzq1pXRdH0jz+CBW4xTqPyWdUIQCyd5uUdalpBUTSSGQ
	Z6hJXpsbBopRRJHX6mcuDvjG4j4LMfKFUPAv+XlsOWT11zy6cnagMyXn79T+CRMLmIsuZZmz2z6
	M/i0sv/CHLMLBnL7HpZxw7H7RnuEH+CLeRIg=
X-Received: by 2002:a05:6a21:600a:b0:366:1a00:2dab with SMTP id adf61e73a8af0-392dffe0dafmr12386003637.3.1770101714428;
        Mon, 02 Feb 2026 22:55:14 -0800 (PST)
X-Received: by 2002:a05:6a21:600a:b0:366:1a00:2dab with SMTP id adf61e73a8af0-392dffe0dafmr12385977637.3.1770101713886;
        Mon, 02 Feb 2026 22:55:13 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3547b1036e6sm837924a91.11.2026.02.02.22.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:55:13 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 12:25:02 +0530
Subject: [PATCH 2/2] bus: mhi: ep: Add missing state_lock protection for
 mhi_state accesses
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-reset_worker_deadlock-v1-2-7ed889b5bf19@oss.qualcomm.com>
References: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
In-Reply-To: <20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770101702; l=1662;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=lxSYBQP96mlT5aJJCUIduL+qGCMMryWk8oKPo1JcZnI=;
 b=km0yVdXibT9OTRzqgtmO4t4idXp2sR9f1MHa05U7VsODGYuwBe5nZEWtg1FQdPdOKr4c5Qlbz
 vDWa542bh5GDeWZ1whMf3S7Tz1K8peJq6cBeT2I05c8+FhtO8aOXYRG
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=69819bd3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0bTHJ2J0XYZ6sYew-2AA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ceo_rzTKmVmlUCauMrv52HHh1Li3r30r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA1MyBTYWx0ZWRfX0LXGRHDpMUhy
 S8UYC3CpmNVEfYs0Ezc5SYUxtunR/e26hk3RSU0IiCpGLmoa8OXlrJYAfR9xNmoBAHimxjNxRRi
 sbTrt5Y4NcXm/yx9x3eZcwcVvKtJSa+5HCDY1LRFMz0fdJ/IDGZ+raBOHHDrU62kTTqbOX0Pnjx
 wSg1qX1qgcrRkpzcgZw1I38yppmtEuUfN88nmcdulnTxjkcF7BpAreUkWCwLoSafj7RSm9PHT7H
 /V81nR/qVWfmrbi9N7PruiqBN3NXP6sNSx5wPQ/7HvvjpoqXKbwfFTKrfm2yL6jyx38tNvsycn2
 IT0E40HUP78/V3XPbnlg8hYWCECLVm80wk+1IItu7iyqBBJDoUDwZ3sfE06hrq0+QtNBCrjcVM7
 Cbn9iOtGRL49Eennlg6zd0Z3UUeZmuRRfe8EwcqBvvIiCIJZlNiyuve6BjelKAaSXdjBJYpf645
 QQT9LteUBy+9jwDD5iw==
X-Proofpoint-GUID: ceo_rzTKmVmlUCauMrv52HHh1Li3r30r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030053

The mhi_cntrl->mhi_state field should be protected by state_lock to
ensure atomic state transitions. However, mhi_ep_handle_syserr() and
mhi_ep_power_up() access mhi_state without holding this lock, which can
race with concurrent state transitions and lead to state corruption.

Add proper state_lock protection in both functions around their mhi_state
accesses.

Fixes: fb3a26b7e8af ("bus: mhi: ep: Add support for powering up the MHI endpoint stack")
Fixes: f7d0806bdb1b3 ("bus: mhi: ep: Add support for handling SYS_ERR condition")
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 73597de373ef7e0c428bcbc126d63a9a97f95144..e9d14006453aa8b8999486a1cef17ca43f4cc4e1 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1113,7 +1113,9 @@ void mhi_ep_handle_syserr(struct mhi_ep_cntrl *mhi_cntrl)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	int ret;
 
+	mutex_lock(&mhi_cntrl->state_lock);
 	ret = mhi_ep_set_mhi_state(mhi_cntrl, MHI_STATE_SYS_ERR);
+	mutex_unlock(&mhi_cntrl->state_lock);
 	if (ret)
 		return;
 
@@ -1148,7 +1150,9 @@ int mhi_ep_power_up(struct mhi_ep_cntrl *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->event_rings; i++)
 		mhi_ep_ring_init(&mhi_cntrl->mhi_event[i].ring, RING_TYPE_ER, i);
 
+	mutex_lock(&mhi_cntrl->state_lock);
 	mhi_cntrl->mhi_state = MHI_STATE_RESET;
+	mutex_unlock(&mhi_cntrl->state_lock);
 
 	/* Set AMSS EE before signaling ready state */
 	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);

-- 
2.34.1

