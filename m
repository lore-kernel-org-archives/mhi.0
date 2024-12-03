Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55245645
	for <mhi@lists.linux.dev>; Tue,  3 Dec 2024 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733205803; cv=none; b=NAYQQQuDgVm46kLQaDyZcw2T0qmZpih+MqLj6NFF1vzEoGQnGsqrMu8Zk9tdLS+6vLihzJTzqf00lCC1s9UHD8eU/zRjiye6ur1bpnd9m1yFquJFhuyoqrye7QOj787pdwyJNHvZcOeOYGYTAgpGYc109m1lTrWb+soGNjfd8G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733205803; c=relaxed/simple;
	bh=LOVzYK0SI9qHoe7y+E9ht4y04udtmgnCc0jWhTMhUgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6z7TMQBLjsqjOEZrVWxNNsH+f4l0E4wBnXoULtyWYJnBtQRfivoyD7L7R9EQxNe6ISM8xjev5wpT55ZZpCqsGdC2TfYOS/0jTBgtX77a83IV+yk5dXqaz1CiKSsBt0Qh2kJRkDsJhrVQNIltuF3kYOEd4V07R6XILTSNspy/GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2yjBnAs; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2yjBnAs"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724f0f6300aso5737175b3a.2
        for <mhi@lists.linux.dev>; Mon, 02 Dec 2024 22:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733205800; x=1733810600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUqmaEWsPyNojg4DI/HmtBzSeNNU1rv7g3aKET9NppU=;
        b=J2yjBnAsob5Pd/azMbEj/P/3KOAGU1gzUM1fSEbVLNTlXZ3YMyMY/5e8BUzY6SKS9C
         625ebnEe3saykvuC+15FtqQR34nhrTeXWENhMUA5fn2c+aS8waJQi1W+uDYEoeZ4B8Mm
         lEx/WkEvX2P9hpGaDmu1AjzN8IrjDs18y2U1iAgU4uJKzbeZAHCT1fuxPPlT+gT69bW1
         oaobygcSYUN0qHWGS/FiTtfS952rLrM3RXJFN1qmbdYkWC3OtLINwTaiplBTWrsZ6HNn
         Ndv4X0z0a4V4f7F+QQT6Uuaq2xf6envstpHP8vuw+UVjmncTz0JIrBpr+eLyh6j/5hH+
         6ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733205800; x=1733810600;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUqmaEWsPyNojg4DI/HmtBzSeNNU1rv7g3aKET9NppU=;
        b=HVdDQeTxTpf+xdBCt7TivBu7Q56Ww987wORzkfvzc38ZfU6YtBGcaVlIeIAZpA6eUR
         s5SNVgtcRYdRzT4HuHO1wr6cSVJCwJztylFTyOyeDgHqiAM0Y3YBnVioolrUOtodig+V
         LuSyh5nsqbLwdGxjDkp3xzzVGT/RmkXA/tRm3+tDdb4iJRH6L/+vsUjjSCJBMWmxiJGH
         GtlUXnkTsHBtK2nFWLEsRyN5mV6cja8XmyLBlCi+vQtWEYjUdXxTd98LymqPJGdCor1R
         eRAa5nsnP07oQhxEt4HmCzw++8aYXJS/m7FGpHLAo2Cadf/z25Lkl65klSxm9EmxevMp
         Wn6w==
X-Gm-Message-State: AOJu0YzqxoSpfvROb0hL/Vh6adBPBXziUl/EtE6oFQK6GuXIdRBli01o
	FSgUxkPB+3hTetCfmjonvRymsRRgRDm5sw+2tpgCVCSEQB8X3fprzLObzlxW1A==
X-Gm-Gg: ASbGncsV4+jnBU9fD+nZQiBzxoCVV8R009A6ch9qfsroKs05tsPAfSEzqHZy2yMSaRh
	1ENLWQxaYyzoH4Q9v7VF3hTNAJhvJZJjlb1V35+gWOnanRLjlgJfRVy1uwoOw9vwunAYFF+NnOg
	Vyv/j8IayveTc18cUTCgkMb7X7uyvgp1gjBb7F4Ko25GpvszP29JHEZmQUiFfF1XcV9tPRUqjyE
	sFdwU+mxe2PY3/rG3IqAlhzXbDpms55De3nfXEbJ31cFfENuMp3jMAZMAZM
X-Google-Smtp-Source: AGHT+IEPVw2/bia661AfhUmpeirmN/4JekEszPAa9SJAEueOT2ON9PjdY7e8cHCyarV3EiinjE6bmA==
X-Received: by 2002:a17:902:ce8b:b0:215:30d1:36f8 with SMTP id d9443c01a7336-215bd25453emr18781115ad.37.1733205799750;
        Mon, 02 Dec 2024 22:03:19 -0800 (PST)
Received: from thinkpad ([120.60.48.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215c1322696sm3439005ad.155.2024.12.02.22.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:03:19 -0800 (PST)
Date: Tue, 3 Dec 2024 11:33:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] MHI fix for v6.13
Message-ID: <20241203060311.66xwhgpqcw2hit6m@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.13

for you to fetch changes up to 098d8374033f323dae87a1d792a3c8911c2cf57f:

  bus: mhi: host: pci_generic: fix MHI BAR mapping (2024-12-02 15:14:33 +0530)

----------------------------------------------------------------
MHI Host
========

- Fix the MHI BAR mapping by passing BAR number to pcim_iomap_region() API
  instead of BAR mask. This fixes a regression for Qualcomm MHI modems.

----------------------------------------------------------------
Johan Hovold (1):
      bus: mhi: host: pci_generic: fix MHI BAR mapping

 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-- 
மணிவண்ணன் சதாசிவம்
