Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4232C359A8C
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148190; cv=none; b=Vgy0pciM4xWlOhfISSzrH44FgslsxXUzlhlE+7Q/qpISuCPfV5OwnDDob0G+HYaPr0A3V2PY2nq+16pWDoj2oU5RRHHrOGssFy7zmKemZHI0hYCCd5qeGD7CSwTcm4I0M4fHWUwDG4qm36YIcZsepjpf4WE8AII3HD4zH5WLezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148190; c=relaxed/simple;
	bh=SLMPMucuMihuiOlx7PaQq4SBAxfTde3J4Eevj152d2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uEIqUM+MNVDKSAaAAsNpDt1QOWZIqvrVCkLT22vHgs0KNyvCQBg0jOcSFypQq9HgWQ3SGfYoKryPE5Y0TAOm957HaCbIgZBwxD6IgiHcL0I++2HfMLo0gl5Kmmzijd1VKPKDP7qGf4Tey0eobssdh87TOP4X0zG/IpRZmbgOBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8hv/421; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfiUOs8f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8hv/421";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfiUOs8f"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCR1H280759
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vSfZ9kEGx3ZJ6XOmihl6K/
	6a8EWL9iMB5kiI9kbbT2A=; b=o8hv/421KLiMQgZf/DeKITHNDcqRX6Iht3/1Ao
	7TMmvEv/hPjKblEnAiaxEXvp/KwFqwr8uNytSS7VasXnOUjwJlJa+umcpEST0dDM
	cUitbvqn+wGnaojIt1Sb9aTZftLf9Tnyc3H32f603AfrWyF1X1ss9axXoJkMSZ/7
	NYGsrNGpqbOpxnwZEtyP2xBXt2qVtBLCNSFo92Hof+iSxZQm+NxNQB3kxqEdbJmC
	kqnfiLXay4WZzz5uNtS/E9EivON8AYsf5sND2/doSU48ohX+bykSlRrUqsiaeC5P
	Updd1QqFbCgxAWYDYmF+S+MtT7q7rDDw0Tjd883tQmZ5exGA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vhb3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 14 Apr 2026 06:29:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f2478c37bso3379519b3a.3
        for <mhi@lists.linux.dev>; Mon, 13 Apr 2026 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776148187; x=1776752987; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSfZ9kEGx3ZJ6XOmihl6K/6a8EWL9iMB5kiI9kbbT2A=;
        b=FfiUOs8fLLMErxjBIwLrm0RvoUXCTSqGSkB4mxkrKIzt0wTuuts10qn/6bHLj00Ztu
         5DtNZV970PIHeAPuQHQyxFf0+WKyuXaMvrfQSZTF3SsWg2qBTOJ+Eb/E0UpW+ctg8yOK
         G/NAARKVZzLKfp2UCTUr4zpscrn/h4GPV1hbWTU77VJz4Mja54FWPB3VfzNUXvJwE30U
         JoXjsh2mceinAkueM6RBRq3AQrSqNc9JMjmynGBFCDrz40vsm3/gRUaqYURjnOhxVkLT
         FlPAHQ4IUKgM3/LD/o0sPreZesdtW0o+l4NhMzw2KFQdRP1KjvYkJl7uYYgtwlaQvnB/
         qZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776148187; x=1776752987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSfZ9kEGx3ZJ6XOmihl6K/6a8EWL9iMB5kiI9kbbT2A=;
        b=XMgT/phbYFaWltQhKfefrB4MvyuD6YLFS0J8fK5Ng6EEWJkHTfeSh4LbdPEQwSGrep
         JFlRJyhich6Wze4gx20HE4akajuVelXwCXs73PM1uF9yGnC6xkz0tB+9VNrYiDbP4xGJ
         97CkBHW8mMPwFXBLEQXCuO89r6Oa0SHaEyn9pRBXugBolTOgUeuPLAblvVjJooMNmESv
         fEYrwaMfDdjE6IPUTvccjVjtNmQkOsn8ESVxlIVTecFp75KF3wBTEufrwqdU4yDBQUnt
         d3D/L0jqVMyd/pbrOxmzpJ7/mBPxqLevAcLnZWWZAz4cLiTV5OcLO/zGONe8JPFbNFIb
         odyw==
X-Gm-Message-State: AOJu0YxyK2wzTKl4XjCHJNE+BiC3OGIwapDWHO7DNtqluEhXiMwIByaS
	Sdg+9TZVn+MxBRRfZDEnd7et/9fsKejKhCBuTmz2f1G17Pps7LmOoLw54N24AWYIAyo0LSeXnOv
	GPpGQemH0hhXLLhcjqQFF3g95oeG3UO8eSICB89zW+8miczPpeP2Zxzo=
X-Gm-Gg: AeBDies+0NejELp4Wz776UFgiWzMp5aQbiejSqEC/T2yDPwZMTnNM0F013zF2XH73aj
	hTWh9srvAV23Cr9n0caIWtWZ+T8PP/+4QOdYxCKIoL/7C/OXV4MRBQ610hWyVKHwvqCBZxP67AS
	Z43qLo1fasNtyK2VKoFyKBjuax7+VpM0Gw1el8yJ1m+sdeTEhuKdnKvjX4sEKQykZ7jZr4bM4Y6
	ljSlx3VV5NwHTSJXeyp6n3q1/J0t4tRJJ8STaZZI3I4k/t+6eggwzwK1H38gtLke5nGjSNl9f4M
	E5fHkweyjioYhhce1YrrzLIjwrxuv+/EtfhmeAStQpcNuA4wwps7tg4VaqZVzkZUymI8lbYA+7t
	zVb+8Q1YlQ54B6OJUpcZDbcmgqyNmmhZBwVtxLZ/nG2AX4PFHky3eW1/2/A==
X-Received: by 2002:a05:6a00:27aa:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f2243e66cmr10950764b3a.32.1776148187004;
        Mon, 13 Apr 2026 23:29:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:27aa:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-82f2243e66cmr10950737b3a.32.1776148186395;
        Mon, 13 Apr 2026 23:29:46 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d40bsm12964090b3a.58.2026.04.13.23.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:29:45 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] bus: mhi: ep: Fix state_lock protection issues
Date: Tue, 14 Apr 2026 11:59:39 +0530
Message-Id: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTe3WkC/4XNTW7DIBAF4KtErEvEDMbGWfUeURQBM25Qfmggd
 VtFvntJ1F1ldzPSG+l97y4K58hFbFZ3kXmMJaZLDfiyEuHgLm8sI9UsUKEBAC0zF77tP1M+ct4
 TOzqlcJQKUfeqG7rQk6jd98xD/Hq6213Nh1huKX8/Z0Z4fP8TR5AgkbUKQMZ5sq+plPX1w51CO
 p/X9Tx2fpFmCTHkWosdeQ+LiJ1HlNSojLY0eN+0c0irAPUS4pqWve01oVXzCKpFpGOytvfGD9D
 /RXbTNP0AIZLgl9UBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776148182; l=1047;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=SLMPMucuMihuiOlx7PaQq4SBAxfTde3J4Eevj152d2I=;
 b=lwtMIWaPRPDh65ac3Ln7X4yb3fLuuTtH2CeP7cLm+g9MMgqhBEAVaw+VLuZGR7b7qqQdVnr6E
 cZenQd4z3qCA8/wqXjy7L+AWPuq4Sdh+aJSH1wdft/0WiR2gqTUxWPC
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: 2f_oKj9ORnwLIAcll0fGE9lO1suIgb4k
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69dddedb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZAiG1xSz17VMwVfmIi4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2f_oKj9ORnwLIAcll0fGE9lO1suIgb4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX7wEW+dc7D/Pl
 jdPEb8GxjgVWOc62a+MbX49oUZkhP9yW0cGKMbBCcmhSxls+3bKdzK4em0B41ONtgR8nvzR5MP+
 zD8G+qX7vHJYxxKW63jLrXVguzFsQnEZ5b79yCoP6WQKOECcvlR/z9ltjdZ1et5pezcQRe88koE
 5IDA/viajfNBPeoV+yoNyS9hhZZ9X9MJHhRYs/uTUWlhbwSuASAL+yQTZCM9iV648ZcNdYj33TN
 1lUCXPUM6fOhVzQAWGvfqVvXQoJfYWNikIuAbWd4Puh2j3dkG3Jo3jJvIEHvpspyhff+AuNZo2F
 fagLdt1Bfb+fBmtx4DBIUeXqzG+qwIsz30yzNQdvn0jCiMkNeK360jZiHugOzXG7W70cUtbCJH/
 NFOTaq4huEp6o7gEmrRjGm7Xq8jnNrF5dtRmnRlejOBsn5bGMHcuJ6BJTcvGnGo84oyBZNiYs17
 csQZSjP8h7zeZWo8Q8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140058

This series fixes a deadlock in mhi_ep_reset_worker() where state_lock is
acquired twice, and adds missing lock protection for mhi_state access in
mhi_ep_power_up() to prevent race conditions and state machine corruption.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Move `mhi_ep_mmio_reset()` out of state mutex lock.(Mani).
- Removed the mutex lock from `mhi_ep_handle_syserr()`, since the caller of
  mhi_ep_handle_syserr() holds the lock.(Mani)
- Link to v1: https://lore.kernel.org/r/20260203-reset_worker_deadlock-v1-0-7ed889b5bf19@oss.qualcomm.com

---
Sumit Kumar (2):
      bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      bus: mhi: ep: Add missing state_lock protection for mhi_state access

 drivers/bus/mhi/ep/main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 6fa9041b7177f6771817b95e83f6df17b147c8c6
change-id: 20251113-reset_worker_deadlock-0223907f7c9d

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>

