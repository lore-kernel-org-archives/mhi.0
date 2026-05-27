Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C83D3E3143
	for <mhi@lists.linux.dev>; Wed, 27 May 2026 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871950; cv=none; b=Nr7lOZxUiE9i4XPtZykyq2fFxLVhCdYb3+QJshPdhtyeEovlmZjrNlwz0IB9jE2FdBRKVazvd1aBU7K2x1f1G63CuBfycxAnLvZFyuqKx/lS3vAlMstjs2kb2iEBC6gcvC+QtF/Qq9rC5Q/mah/Qfol8IICySKMTcoh+qm/b6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871950; c=relaxed/simple;
	bh=ydp3iiH3t45YwufOFs9xQs9qEz4U89SME+5Zvi/mahQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCwlyCXLCnuOjj0vKPeaQzUKFjcNhUDJMzBLOBLE2+h4ejNux8yBifb1s0wF3/3h2k+/jy7aa9RSECvBCLf/tx71R9oeYBgExo2tjH5NsxKuM6OUhQA3EFBrOQa7/J+TFwxY2T5NCHOUwaqLmwOo2tYXeR+umsh1dRNzs80xYps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnBxcLQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=illpWAuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnBxcLQl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="illpWAuy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mWG72152353
	for <mhi@lists.linux.dev>; Wed, 27 May 2026 08:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T/chsqjTnFdkud9/UATRE73Ia/WpFMOscnZ
	9VfaUcDU=; b=RnBxcLQl9ZT8ZlB8FzkL7qCzH1WwZHdUKv9nDPX4iD45gPPTuHy
	xIDLe5fKg3JTdb2o/2kPdhlPdiwH0IfF7zi1q3T4VbLLU4XUCP1HB/Ql8RdGHpdE
	wDpwXCIW0wjmiMT+VljDh69SqBV+ZVQX0WrixfjpErXMgXQvID0Cng02xaOlkYc3
	lcjPZ0zDXu7qJZMMUc+qxkyYRYz+1QgUU9CibfvqOCGJM/MB4vBklRemNnvBnoGM
	ySJCLBq7WVoCQscvThl6+YsgzFepzutFT+F3sVhLBjL1bKAtkfbjOM2qTt8es0+p
	vbcq71TZOCDVGv8WO+DzyE8RrWG9b5tz3wg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgkhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 27 May 2026 08:52:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so23465551cf.1
        for <mhi@lists.linux.dev>; Wed, 27 May 2026 01:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779871947; x=1780476747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/chsqjTnFdkud9/UATRE73Ia/WpFMOscnZ9VfaUcDU=;
        b=illpWAuyXeU0NzPPy03b3Zv+aIEdfIq0q0vOqYj5taMKsZ4E6PkSFZT3rYprIlV15Y
         HBtqEF0yBSBQlQ1+d54DWr81b4rpmamqVRVJsYSoP8EKokvPagZJWMtCfJyiKUOY35O7
         EjHkBJEILpNhvDI+gR2I0W2J/WrrEvAt5EfN/423GS1fq8M6GFv74IouM4UP1dAUCZ4b
         fm84fQRD6p0Muto3jy3mjwBDMSqzjqSMphmgNcinMpR9jznjtnFvKzDH4KDITr1CIWUe
         jEARp8OIxSoTDSXvAAqUGE/fAy5t0Jh9+ctbHY1ezWsTLMJy06FpEjv55qLq478h9aVr
         Jkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779871947; x=1780476747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/chsqjTnFdkud9/UATRE73Ia/WpFMOscnZ9VfaUcDU=;
        b=IH7ariTHk3RrBYDRjcykc/1SxHYLh5GxwxVdAlolYdZgSJXi0BNqzBhSIOUsnspTWa
         0JuYRrOyU/dU2jzaztNX1av49QGyECC1veYQ13lA13IXsXWd572r5usw0L4JwAQpTHD0
         0grc3/df98rI07r1zHU5CECi0AnGI/3cvI8i79FaKkufQmVUYlxOnQNT4B7g4Bf443Eg
         MBPY3MU7xv9IK4ScqFbnkqCpQbJMIYVp6zAOwv55WvFnLZA0NFmuxJnaMD9xyZCtwqvo
         SNass1FUjaP4aP7pd6aueB13FdHBsRx3fwMvxIoid24JVSBhxJggbrWjkoWMlRe3Wj3b
         MkpA==
X-Forwarded-Encrypted: i=1; AFNElJ95QF+u/QDRgQxvdiVWDfQcR8lhLBV/lzlLksvXL3b6gPI9mT9slosN8Oij3s44LdMmub0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMhdHxGb/if0AGVkDpwD28on61bAhzQ9dOWpMygIOiIOBQ1wRQ
	mijkYCeH29DtNlWS8YNdr67nB5W8FH4g6pKyr9z2PtyxgGUNkwzg558bVB60AaxemKIzl1TwHGD
	H63od0MaAthOQOyQsQIPjjhZ4iUXJbd2r0fykvtRVQJ0EdQ/IEIP+knE=
X-Gm-Gg: Acq92OFE1TBSRkIf9c1I6NhEtYyIGBdoyCQSkRxJiA7MMvQ6oNx1HJJhAv2kT2CWbn+
	sbd1riIt0kNzkjpFLagM+SXhcYLF6V6BaH+3bPGKoHcgZ/OIcJjXkmhDfV6uabzZR+ZmsReDf3l
	BBDK3A0F01kXm7o+xwsfFI6Cgl2aPCasqXsLP5velTFOXE4Ah4aL5H3ntKV7LnDMdHfw+xvZePX
	6RRLLX0kOlljG7k625JRz/zljWs6h0vJWPxfKIaLWn29eRBK1SJGhUqewzKNjpI7+YrzHoe6Lir
	+6xAGTLuNt7R0ea1XSiYGffPYAl/ftT7quRCKBWDea3yjzyPWKYHOqu70Ip+zxKlSmyBmgXHbN8
	q3bU4L7XjPijeQIdO6fP3xl4vTUrXIeIRld4iiDL4ngM/od5LUQiO0noPfctgTE5RLxIrUH5zwO
	ppfcr6PySZAGUwexKj/ms1cg==
X-Received: by 2002:ac8:5a45:0:b0:517:146c:c869 with SMTP id d75a77b69052e-517146cebebmr13526661cf.31.1779871946500;
        Wed, 27 May 2026 01:52:26 -0700 (PDT)
X-Received: by 2002:ac8:5a45:0:b0:517:146c:c869 with SMTP id d75a77b69052e-517146cebebmr13526431cf.31.1779871945964;
        Wed, 27 May 2026 01:52:25 -0700 (PDT)
Received: from work.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5c27e7sm4601127f8f.35.2026.05.27.01.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:52:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org, mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Fix the physical function check
Date: Wed, 27 May 2026 10:52:20 +0200
Message-ID: <20260527085220.14139-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16b0cb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Byx-y9mGAAAA:8
 a=EUspDBNiAAAA:8 a=_ArHcOP2DiPeV0EhLvoA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA4NSBTYWx0ZWRfX2xOLwmwc0vD+
 pfMmhAtL6r28weEqkUyDKaOKZzZ/oT8BV/VPgoHOqnSncbAZmc2i9V4yQywpCyz77HRsDzVz5Vs
 GcZ/w7YCyxtT/UWO5kVSezCf0RsE1OHc6/oD8fzLf/vfTiqDqecNxcfe2Ivf7uTm8xIdm5/J362
 qGx3xn1UXSWgLVIB7GYVkJaoN8fe9GkQC4XzJ7vkj9wEuKEfhi4ZK3irXljLphU/qAqpdHa/qEa
 XWBPQSAsTev6VrnQi3p7JiPpaiR6wrbsGvm9FmGbMBONP69l3mc8tZd85zVQDfSDxIxJX0zsOob
 W9Tbe2p9omPoNBvWHAmt3XoZF0m1CR0CCIUYzQTbAHCVW8tCw3siE1iVoiQHALewCOJJCg29E0w
 jYOV8+Mkfn33nVjWGT4WTGRPvyEiNoOAMmG5zRotCpZaAxS/CQJVjA1Y+usNwZo0DZviRHa5/OH
 W6byB6sQ/OX5u0TtwOw==
X-Proofpoint-GUID: ppVk5ux_UDgwSJ8RRZJxJXXkzT6qn-i_
X-Proofpoint-ORIG-GUID: ppVk5ux_UDgwSJ8RRZJxJXXkzT6qn-i_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270085

Commit b4d01c5b9a9d ("bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID
for VF's to check status") added the check for physical function by
checking for 'pdev->is_physfn. But 'pdev->is_physfn' is only set for the
physical function of a SR-IOV capable device. But for the non-SR-IOV device
this variable will be 0. So this check ended up breaking the health check
functionality for all non-SR-IOV devices.

Fix it by checking for '!pdev->is_virtfn' to make sure that the check is
only skipped for virtual functions.

Reported-by: Slark Xiao <slark_xiao@163.com>
Fixes: b4d01c5b9a9d ("bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID for VF's to check status")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 5836ecb0ea32..0d0d9c7ffa4b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1261,7 +1261,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	dev_warn(&pdev->dev, "device recovery started\n");
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete(&mhi_pdev->health_check_timer);
 
 	pm_runtime_forbid(&pdev->dev);
@@ -1291,7 +1291,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	return;
@@ -1382,7 +1382,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		mhi_cntrl_config = info->config;
 
 	/* Initialize health check monitor only for Physical functions */
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
 
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
@@ -1404,7 +1404,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->mru = info->mru_default;
 	mhi_cntrl->name = info->name;
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mhi_pdev->reset_on_remove = info->reset_on_remove;
 
 	if (info->edl_trigger)
@@ -1453,7 +1453,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
 
 	/* start health check */
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
@@ -1482,7 +1482,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	pm_runtime_forbid(&pdev->dev);
 	pci_disable_sriov(pdev);
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
@@ -1514,7 +1514,7 @@ static void mhi_pci_reset_prepare(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "reset\n");
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete(&mhi_pdev->health_check_timer);
 
 	/* Clean up MHI state */
@@ -1560,7 +1560,7 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
 	}
 
 	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 }
 
@@ -1626,7 +1626,7 @@ static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
 	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
 		return 0;
 
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		timer_delete(&mhi_pdev->health_check_timer);
 
 	cancel_work_sync(&mhi_pdev->recovery_work);
@@ -1679,7 +1679,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
 	}
 
 	/* Resume health check */
-	if (pdev->is_physfn)
+	if (!pdev->is_virtfn)
 		mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
 
 	/* It can be a remote wakeup (no mhi runtime_get), update access time */
-- 
2.51.0

