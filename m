Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0938380FC1
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753132; cv=none; b=p5EqmSiAIvtqDfJkaRDpTlfj9uYC6j0xoMnomQexoKYCxVRDhJQVM9YKjTgzRCm9feEoL3CU2p49EHDHhS9Ic//bBWsM1niOkIof1ATesZiOwxYT8kvlyu2u5Zqvx0Pi6ygYXq+ali7p7W9GfQfATCRF3B3l9iA4kwDGf7GEsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753132; c=relaxed/simple;
	bh=YQodrxLZXGti3XmvW8nwU9lpi/9j4ifCS2HxijUaHDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDCPqBN8caLHFNnaVP1ogrKRcxwcCRAhVV1dKV6KUPJ2DumMlEXAPmVUeGXIzH+cX1SQXyZfQf/vCZPcjoFyL6vKKgq8oRlmNAgMvNS6zW9ZQsP72bez9QtRW+bQJheoitnJZ3oPFdm0xAzGe9W5jdO6VVjnW0l24jC2752RRZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu4Jb7gB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJTT2ccY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu4Jb7gB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJTT2ccY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736S8ri051899
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=; b=Vu4Jb7gB3declPWK
	TI3ECB0a8FvuRnE+D/jzRkJmWnbzJac120CngS1IhSZayxc7b9m4tP74KA7HjzI0
	+Hr4EmydHJ/DbcOv5kOQ83iOgtoNvmG06zuFKdriQHYHbp1PSU3aENjow4ucZbmg
	DOidSr8lKRiL8ntegXqq0+5mO0vfXX6G+6pZvhhQQO/38cQ+JB8Kht/drncw1GGJ
	+kWFiQuNIvA0+o773xfVNWk3oNepwb9E151S+Ji/WULvobiHMp7evIdT5hIBn+sx
	4AjzSC2+A1KUEa0UKvSnu4sYplS7jMo07ulsrleYdoBQayosyJwfNMx8AlFfhFyo
	jHfApA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb91ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 10:32:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so3509754a91.1
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753128; x=1786357928; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=;
        b=WJTT2ccY7XKPx28r+OZtosI9AJNaUKEonHf6AJqUmWyPUEWnS7JXBwcOzGKHyo7nKh
         c5x6pUYG+zra+WrfwgGoPaVJnQK8KVDrl/gkZXmC0Ur/11Je2igT85i4nEarZdWQKF/J
         MbOMJQhJJtJBalnhPTJJjN/0bMSHEmFCpTaFSEFIUqxC/HCKo3du2EPKVXIRRg4xloFa
         CQ4odzeL8cPj+kaiw5O9h5veNE2j7Gs5Vg/RrJQeyEHj7AmtGd25micSr1nfaTFDPkDi
         +wMA3/ZJvbnIkoLaOVmjEUXSAC7q/UKbucBwFc2LkUa01ZygaL5+iLYw/UMCLwD4Bm9B
         Op9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753128; x=1786357928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhWKGvX0bNeNwHOozHVzgVNQHnYcAVFkH32Yo6rHh38=;
        b=aoU1wAo+JEwFLB6CG3V1NjvqvXeyz2GJeXy0aj8bjQBqm2G3lz6+T7TNRtOdZw/8R4
         Lo6gzo3coSPb/M55DWkXIW08CFWFH84/HinnzZDws/vkzag4fGY8F2nX2qi5HodwmnHL
         wGw7k0mkdWubUy9fwaAatwW40Kmcb7hdyOpQdH2OA9k5kMhXOwNcuc7b/Urpb97FTSud
         8aSw9shrk/hzO9wnPGV9nU7QtPZ4OXXAPnS/E0PT8KQkNufiil77wzJyvzWt3Gu3L/8S
         yv9su6SzqfgH3rbNyqKSyNkIemtbDr2fLfYJUfYi77KNvwo7Paudka5GlsbmoM4j3Psd
         ng1A==
X-Forwarded-Encrypted: i=1; AHgh+RroNZfqhkcvWrjtbudA+8CbRz6b1IBMt2NtVB7PYbPU0+E9G1z+DIsv7KDJrfZZt045Wrg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJZKNbnljEyk4CpSsEHrgYowQSCDjocEWUr1yNi9poQMQ9s7KI
	EC86UUMW8EKg8okvxalYivxyn9OMotwmUz92sJIzm3qZQxcpiCdaBVsjOL46MrrZ6wYD7bViiQJ
	2jSa9kYjG+b5RlnueQHyPIrerTuthbKEgzTfNX6+b5+95yc7vYNFf2D0=
X-Gm-Gg: AR+sD12n1kQQWtEsL4OJvAS1AQnjctTv/zZWHLPYEkJ6NMFIA1jSmwRDi/OsybEQCZB
	a1N0AGHbAlztwDZ719mB987Omze8wwYyql+sifZsUPRK6lTnsmhax5rMZlM5QZPvaNlEdmqlIpU
	gexbQQtII6xJZ0wJPJHm0Gd8Gk60dSrFRMkYUNDwkI6vP0/EeEX0F1Akhcx4CrLzzYKR+C9q3gI
	RYy5U/IkO9x4Dkv7vgltNkjTtSCFjdT+OHKeyo1sv//tB1gNjPz++kKa0H7hvOLjVcXY40COsCt
	AhDMEZ3asnJTeSQigE85TvLBv9+nafvGbkcxwHSpZmsBGVlI6r3xbRVx9ZYjKhhRpqktl/hhlAp
	9WisNYhwe8M5CpdgcaAiIc58ubg==
X-Received: by 2002:a17:90b:58c3:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38fbc4bc3cbmr8623167a91.24.1785753128263;
        Mon, 03 Aug 2026 03:32:08 -0700 (PDT)
X-Received: by 2002:a17:90b:58c3:b0:389:8f6c:4d59 with SMTP id 98e67ed59e1d1-38fbc4bc3cbmr8623122a91.24.1785753127669;
        Mon, 03 Aug 2026 03:32:07 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b1244bsm3693427a91.0.2026.08.03.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:32:07 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:01:45 +0530
Subject: [PATCH v2 3/5] PCI: epf-mhi: Use a define for the DMA transfer
 timeout
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-dma_multi_sg-v2-3-c12bb05e42d6@oss.qualcomm.com>
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
In-Reply-To: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785753106; l=1737;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=YQodrxLZXGti3XmvW8nwU9lpi/9j4ifCS2HxijUaHDk=;
 b=rcBxb1zUyIP4s50AcsJ6tkSwDs7jalf+WtVec3AVWiM+5ZsHiNUzXBYpOlzh8jiw2Jacuj4Ec
 tl6wkE1qXPxBIdwVaF+mpN3ZJYM4JlQEETY7EYgWiO8hxuAAq1WXNMf
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfXyjPQW6f4qYvK
 +wJAVqBkj8YtduZTpi3jweXFDtLY7GJv4zCisoynDGWMDivzVGcqY4xS/50KfgoBWJ/h1RSulri
 QhFPfbwyL/YNVDo3IGq7RGveEdNnKYQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NCBTYWx0ZWRfX61Yx4lahbPLJ
 uCsTNzTVQNcYNG69QfaFO0CjjYoV/1O9FEanvqEajvZC9TeuJ4KMMOHALXAkXYp6q1iQ8p3fjDI
 vAZ0m1R9bQHNonIy4w3/oyRzFCBJQZ6pYxAtz//8FsjjzKMZ2peq/A4NChMG8BffOtbzdorDqM+
 fwI0cT3xLQTusKuP4j2mBZrfrUsoU77J7a46yk8hIsWAuBxeOCGRUffwx1ZpI6lzV0yRNjtFVLX
 dTuFrtC6e93jBC5GVkidV1T+ax9ZN5DrptJvSElpxz7Mh6UY8aHGJF3Az883hqfiEikYmjDw0aW
 x/eZSI86YCQQso2+b9v5e2qdvrmfemhOEWr3Wy6a18FaLrzcAT6aj7pTcBPSp593sSmwvup4pQb
 Vor/a+sIdcrtJ7S89b3PJBCBdgxQtGpfwu+OjeYszZIm3FJBQmOskYcXfeUfB1ZAUwthgNisbEI
 qmRTjq0zIyGDQ9hFqIg==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a706e29 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K2uzCxK3BSS_9ZXfCP0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YWgIO_AtI-Fl30eoLVuXuPni8jhQL568
X-Proofpoint-ORIG-GUID: YWgIO_AtI-Fl30eoLVuXuPni8jhQL568
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030094

The eDMA read and write paths open-code a 1000 ms completion timeout as a
msecs_to_jiffies(1000) literal. Replace both with a
PCI_EPF_MHI_DMA_TIMEOUT_MS define so the value is named and shared. No
functional change.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index c3e3b58fb86cd75e175b69ca45530610c500b99e..6bac69fc84b472c5f1abbeede2b441b5db73c784 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -21,6 +21,8 @@
 /* Platform specific flags */
 #define MHI_EPF_USE_DMA BIT(0)
 
+#define PCI_EPF_MHI_DMA_TIMEOUT_MS 1000
+
 struct pci_epf_mhi_dma_transfer {
 	struct pci_epf_mhi *epf_mhi;
 	struct mhi_ep_buf_info buf_info;
@@ -357,7 +359,7 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	dma_async_issue_pending(chan);
-	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(1000));
+	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
 	if (!ret) {
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);
@@ -425,7 +427,7 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
 	}
 
 	dma_async_issue_pending(chan);
-	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(1000));
+	ret = wait_for_completion_timeout(&complete, msecs_to_jiffies(PCI_EPF_MHI_DMA_TIMEOUT_MS));
 	if (!ret) {
 		dev_err(dev, "DMA transfer timeout\n");
 		dmaengine_terminate_sync(chan);

-- 
2.34.1

