Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A337E47AF43
	for <mhi@lists.linux.dev>; Tue, 16 Jun 2026 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781630867; cv=none; b=bs7/g1uzK/w8SX64op1hkY1E6gLFxx2lUsmHEqy0XrYu9sETUxSdvPK3Iwp98HINue71JemDUAWZ+icML1NTJMutoYlSu37PPhNRyC7zWLk9e/AYT+pgAD+hBivJtIsU1EVDBQlIc3rQFA6UsLQkk0i3eXzXRdhZtHNk474cHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781630867; c=relaxed/simple;
	bh=O8cbjHqHqtkMgHfh7cfL3XvH7d1YL05sNt3MZ69NqSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AoFWOuCEe2OtDHWj3GJKXhTjfOaataxoRbvA3UPDCs1UBjAo1hczwhPt/FGO88au7iYiTktwCGKLGZvDipMDalN4zMggt/OVb4PZBWX1TY1wCSPkJRGabNmEIJvtl01eBgb471anMReilpjGZhtDIk1laRzhm3Ruys51I5AxJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE/LBG2I; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE/LBG2I"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-397e391cb2aso43087771fa.2
        for <mhi@lists.linux.dev>; Tue, 16 Jun 2026 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781630861; x=1782235661; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ihatTAgtIM75Y72cnH9JImL7Y6UJlEwRW9iaLN7oWc=;
        b=gE/LBG2I9bJP7J9OPx1VYQhUlVZlPNxVGbBToMQl83FG0PT7UXf8wuUm3Y/Ep2VCRa
         M6TRzqqBPsuL6k2NFJWpbfjtcH8EfdEaGO18Z6pXlxz0PGSViqTbBBqRnreCbi0BjCwz
         dsc+p/Dc0MXevk5bTfBhgmtUBBRUZxjI3wib/z0UcMaKITt6jfEpjfgW9xzdmfdVkTur
         RY84uaBrQY7fdr2DJVFxxisndhZciyIAQiRN35tz3sQBDJojAsY3fDv5s5q+Vxb7rLLy
         hR+RtSnff7PtC9Rhm3oGdvBGc9EBRaG5vo52ek9pxElSOTbCe8ByhO+pvnHJxNozRdVT
         D0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630861; x=1782235661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ihatTAgtIM75Y72cnH9JImL7Y6UJlEwRW9iaLN7oWc=;
        b=KUk2mS/mF8OUjYOVwWLd8DCmj9/KrTZZAkxTrJGM7RKF9hO0ZHR6iab0TsAtTRqe9B
         F7/Ka7xMLdKRHbLnDIU47nHKkcXhctyp0Jij2hY9ri6RDpgNyVp+bgiZRmrQJ8Gze6nX
         FVf8VyO/Mx5Unq3+Fjta0EsgXZ7l0EUbd3x1hwYh2ndecdcpDNFbG/B7LOYJloKIdlwj
         VmudpwdZs49HinOV2z8GAx2b3Lzqhl2l93OooaoGFVpZ0+wv555dL0QTgZW4CyYXHh3X
         4O5R52AX2RJx1mX7F/vR3ULZaj4fKk//ZCkM24xTvCsyqvShYz+SELeBxyqxSyokKRC0
         DAmw==
X-Forwarded-Encrypted: i=1; AFNElJ/3+TmPhK3uF7JyvEHJCTfRNxyLDU2C3emVdMgsCXfIJaRs5kOsL+KpYNlriPjlaG+zT3Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhYNwRxDR9NEIGC4xjXLaRubhyayyrdzDmEQMQl/2YDUSlq8lS
	NJoIn2WQEZrvaIqn1WELW+YzixQecJvWjvZSlkiG1qcuImAL7LrO8bnq
X-Gm-Gg: Acq92OGx17z+ea+4W6UK2+ksJQd2Mn3T+AWRQpI30ce6rMjjZI2cw8ttKny++Fl2pr8
	rBSIpHhL4jG22tI1DVw5qFBN2G5yeN2B1Gak6VZer5JYUQNHW4qq0yPU5aOdDz/b7oz0baHMrZc
	yxcIrFJbti4WAstq1tQk9/H2Xt5kJrrNLt7xf16gyVFES1JKJ6ZTWFSdCLnm+qjd3dR10kwzfST
	lJrz0hEsiYzM3Ut1w30c90cG+K4+99thwVzFPsfqplFzWg0y0xbysUlxthMdgOPnZele1kivD/J
	cjx5vJg83WbebhR5PuiWIqysrjJErBLD7qQKmRRHt7xc1Q+jOKllH3xjqfP9Thr8+N6zYEWlinj
	qkWhO7XeuZMaeHR7FD4CqDfVGo3rfqDxMscyO8cQV5CzL5eBz+TghmHW4uq/lBvM8mZP+IWOOe+
	lyVuvcpBaXey9fVx39//c4qj8NIOPot9i0iQs7pwE=
X-Received: by 2002:a2e:9a0f:0:b0:396:7b20:1a77 with SMTP id 38308e7fff4ca-3993575584fmr52468591fa.22.1781630860527;
        Tue, 16 Jun 2026 10:27:40 -0700 (PDT)
Received: from grower.astra-academy.ru ([185.32.135.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05acfcsm7978201fa.13.2026.06.16.10.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:27:40 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Youssef Samir <quic_yabdulra@quicinc.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	mhi@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] bus: mhi: host: Add alignment check for event ring read pointer
Date: Tue, 16 Jun 2026 20:27:42 +0000
Message-ID: <20260616202743.84303-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krishna chaitanya chundru <quic_krichai@quicinc.com>

commit eff9704f5332a13b08fbdbe0f84059c9e7051d5f upstream.

Though we do check the event ring read pointer by "is_valid_ring_ptr"
to make sure it is in the buffer range, but there is another risk the
pointer may be not aligned.  Since we are expecting event ring elements
are 128 bits(struct mhi_ring_element) aligned, an unaligned read pointer
could lead to multiple issues like DoS or ring buffer memory corruption.

So add a alignment check for event ring read pointer.

Fixes: ec32332df764 ("bus: mhi: core: Sanity check values from remote device before use")
cc: stable@vger.kernel.org
Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/20231031-alignment_check-v2-1-1441db7c5efd@quicinc.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2023-52494
 drivers/bus/mhi/host/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 49c0f5ad0b73..57c8d15b687c 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -222,7 +222,8 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
 
 static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
 {
-	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
+	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len &&
+			!(addr & (sizeof(struct mhi_tre) - 1));
 }
 
 int mhi_destroy_device(struct device *dev, void *data)
-- 
2.47.3
