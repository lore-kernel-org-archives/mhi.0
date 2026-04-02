Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3203EAC9E
	for <mhi@lists.linux.dev>; Thu,  2 Apr 2026 14:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141074; cv=pass; b=gxx0ezBrX0H0s9lWcG54+K81zW9h1qln8BQClVQgxAcz/Loug5vd52hEGq36rQxdD1DZgdWgkLkn6DW8mrp+GROxtXGEOQ+FyU3ldL8EYc4wGnJG0LNIMMpuHUmkN6N07xeCZF4d16U8zezaiNP+S82CuR777So3eWpCO1EZXL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141074; c=relaxed/simple;
	bh=lOwJSYIpgmuYzycJ+j+RWtkYtkH39Q+qyG7uaFmvw/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Z4PMmF8I1kWXpxnLrk+oY1m1i6SQa21k4bEg7UPnflA+vLZztWGLvLbWk43JuWzHyOPPcNKvpNJh/AfxNcP/8zRmKwS0MP4Y0EPYeHppcNv5xkBaBj8mk3ScPG/qn+ZdSS1ZVKcwG5E2rnsPOHGwjkXq/sUOyKL5k9M0p221zf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U28VnIeG; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U28VnIeG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c238f1063so592103a91.1
        for <mhi@lists.linux.dev>; Thu, 02 Apr 2026 07:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775141073; cv=none;
        d=google.com; s=arc-20240605;
        b=bS+8RFbvXFiWSol+5e9JgJyL0n8KFduFrEpr0JwJc2kGkKcLt/x6AkkYOBGY5d2MeM
         NCjMMh3EuZ7rVM6ujSqrvbgSdNTiFk7/O1qjq8QbHPK9baLygzlRnT56VDcemze3e1a5
         W7OktFSyfJoN00gcSQUaGdQn2fOdX4hCMn6uAUik7yZL23VxWtBU6KPWIyDHeElrxXpS
         d55awosaDodTLLeDlh0NXN/TmBsOLp8Y8knBrr5XEmeRJfHn6TTcSICnquyjskOvm4Z0
         Fws+rP7jNN6hFAEgG5pkOftlploZNh5Tf0CXN06kV2QCiF2Zj2XIm9XXN/vFpbP2dNoT
         uyvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+zhntp9y1qTdwd+OPVre8pKQMdMB8D0HucF+a31WUcw=;
        fh=QjKpi5302NOiWNiP2gN/OqwGK61ybhYjMYA3u4WeDSw=;
        b=OZJhgQtNHNWei4TP05azSMoetABr5HEU4MQOv9EbpKvUV8EWqBWtktg4jN/dGyRMqj
         OTbLbB+DqffTpU2LJfLDqd52oinB9xJL5xFb3ZSqI+UtK4uAAoTDK+cen+rBKGZGqezi
         QIny+fYEzeM6OPNJO5rIWWfLX+gvKfZ5dm1K04cSGQF/GcDALQVkemvilD/AZ90oOMey
         xmw3k0wCrbh9hjvzbvVXSNBH39jS1jLC/62+eX9yu6t4899oGumq22rCRkozN9TJ4GKj
         j7wUWl5PSKJ+aEz7BR+/PgVhG29rsA1olSEEvj01vEKzMhuk0nkajRve695beOGx5eSP
         M6ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141073; x=1775745873; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zhntp9y1qTdwd+OPVre8pKQMdMB8D0HucF+a31WUcw=;
        b=U28VnIeGi0hiWTTqfnNCZFuP9RjfCAvGNeOfoqrQ17kq5TnS+ijT/orHt50E3eT5I8
         IpmxNHziJ/7hwOGePDfQMuKYePk0TIJsCsQe72fuAFXOfZAINo1HyvzXUie9Lq1mYgt0
         tSAppal4uhwd1xi3gp2TXhL0257rPuS74KCSAaJuzZXLB87kPm8OZBRlkjfR9mNT5H4G
         w04nvQcIwZjGtbnzzuEMx/tLu6eR5oMjQdZCAZHBDDSrpj+xsEtm9PP2DiqrO98ny9Ha
         shR2gISki9VhMzKP0YX0qo7Jk1IykixrAmzJAX7trexowl1yFmQhILWkTUmBapvATqVv
         k8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141073; x=1775745873;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zhntp9y1qTdwd+OPVre8pKQMdMB8D0HucF+a31WUcw=;
        b=BOCf6kCGAllCBrbtcCGd5K/KuPFFM8SOLlEAlcpbKnirgNIeqSVNyv95pjWO+3zGG2
         R8RhDGzY740nUxCXCDe85fZXUbHlk2O0QcQZWzqIcthDVsC9WbZO2yF7Odt3P7Ww1j00
         grg1SgtXwT4knVCZuMZj+0UWazYH3bEEHmDWq51+FmzvcTfZXohk/GLdqCqLYszNZAUi
         oNpJMFD3Vc8E2G2jG+d3f+2OP60+wlzAiZdeadfeAVtIYXU+Ps0oSLO40yXk6QrCivlC
         2V0RAF8ewSX4LoZ/HpJVpwjpI+5Y/NpGm796sYWZkY8N0BbwSBibWaqmP81GxZKTEIGO
         hwcA==
X-Forwarded-Encrypted: i=1; AJvYcCWcAXcwdXPac2vjZ6Uvl4gRfbVls3NIAbga8RAsLx5VYz+PcRl+0+IMaw9jkzivEc+42Vw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqoDp5UaTbEtItERrJAFqHWwHWR5C2gUu6wW6ERAJ5xIMjNug0
	hsjyKe97cl4gg7153di7N0Ht4nMuEX6XAdoQouijpi7usEVTZ+9eehe4b6zuSvAdaGQFAUBxukp
	jiAdqMcSBk++K8iefnXdzvf16jKhkkG3dO5+3OTg=
X-Gm-Gg: AeBDiesg+sP12tZ/FnL3lWrBH/+XrOFS9lMVAf4dMdRV/8JMG+G02EnAu71+I+FfSBE
	3URv/1JiRLL2qxAwd+5xIo5MUbnbWNRCMg1/fFHRmn8GDdyofyaGv9a3kh09M+Z3hx+GZz5HLMz
	0vYCd/6Ua+QOXfdjKzvMwdfNIhJSd53KUByDQ3zCKDRTAPM64uEnRxS3ohh1BvxR1zYpmjqQn7e
	LHGKpEwIbqNPbFh4TomQdds/sg/cdIBpjTpIe3VMnUd7cI/8PbSj6jiHtSPA8Zdii3umu4BUfEF
	5FIpgDELhZoT2y7ubUuDxo5NkiHFBDFE409sdLla
X-Received: by 2002:a17:90b:3a8b:b0:35d:93ff:2859 with SMTP id
 98e67ed59e1d1-35dc6f92e1amr7201188a91.22.1775141072491; Thu, 02 Apr 2026
 07:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACixm21PgogxqCRSWHOaj2J5VmSphCULi5Lz2nMbGp6zb32beg@mail.gmail.com>
In-Reply-To: <CACixm21PgogxqCRSWHOaj2J5VmSphCULi5Lz2nMbGp6zb32beg@mail.gmail.com>
From: Javier Achirica <jachirica@gmail.com>
Date: Thu, 2 Apr 2026 16:44:21 +0200
X-Gm-Features: AQROBzDlqufyKaJlyQ-ZUMydWFhLHcFX4o6iiZv9ZdsF2hAjZWltXFR_WVKxpV0
Message-ID: <CACixm21E8g-k73HpPMQm2AjEu=PDONe5t0XhAHu3kqUMkYkrLA@mail.gmail.com>
Subject: bus: mhi: host: pci_generic: round up nr_irqs to a power of two
To: manivannan.sadhasivam@linaro.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I have an issue with a SDX55 modem in a TCL HH500V router, when trying
to make it work under kernel 6.12.x (OpenWrt).

It looks like when an MHI device uses standard MSI, the PCI core
requires the allocated number of vectors to be a strict power of two.

In this case, nr_irqs is 5, so the generated mask is wrong and it
won't properly work. It can be fixed by explicitly rounding up the
requested IRQ count using `roundup_pow_of_two()` before passing it to
`pci_alloc_irq_vectors()`.

This patch, in 6.12.x tree, will fix it, but I'm not sure of the
impact of it on newer kernels and if it's the right way of fixing it.
Any tips on how to properly fix this issue?

Thanks!
Javier

Signed-off-by: Javier Achirica <jachirica@gmail.com>
---
diff --git a/drivers/bus/mhi/host/pci_generic.c
b/drivers/bus/mhi/host/pci_generic.c
--- a/drivers/bus/mhi/host/pci_generic.c        2026-02-19
16:29:56.000000000 +0100
+++ b/drivers/bus/mhi/host/pci_generic.c        2026-03-29
13:14:17.053879617 +0200
@@ -1014,7 +1014,7 @@
         */
        mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;

-       nr_vectors = pci_alloc_irq_vectors(pdev, 1,
mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
+       nr_vectors = pci_alloc_irq_vectors(pdev, 1,
roundup_pow_of_two(mhi_cntrl->nr_irqs), PCI_IRQ_MSI);
        if (nr_vectors < 0) {
                dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
                        nr_vectors);
