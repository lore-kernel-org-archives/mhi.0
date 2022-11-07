Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D06118
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 13:10:53 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id g24so11024467plq.3
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 05:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zv4xSJ2U37UpXLIeHS/FSy6KF+phlmnb6ICEdSDB70=;
        b=XXtTDNADJSTvy7N8R9Q0JWsMSf3/z5Vx1N6sIjJnUPMQmHxxU8W+PaXmPCi5VO3pt2
         llJbLYDoTNn8P34Yu7/lgb7qtt44owWWzIWzxHq7inQuYxOTQWTD/TXabEvcU4b+LfoK
         mP7a9ENuGmZyi5uHzeFF3vr8Dx4vDKCggPQN2pKAm9Wtg6rf5PrM/PZWohXi4R9BHZJJ
         CJl6snyxYYL0dO6AMMhFZ4RThe//nZQZ+caBQQAOIcZnZHkWUs6DShCWhBoynU+SHQwa
         cN89f1bvX2DldmAd8T68Va9SV9N5BJ+6ArWbIwx3+SbdeLKCbmjkzyUH1mOQ0Fcrw5dH
         /l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Zv4xSJ2U37UpXLIeHS/FSy6KF+phlmnb6ICEdSDB70=;
        b=dp+Jktb0GKElJanehLQcRQ5H4DPjc8S/F3TINsz6sK1KI8eM0OLFEN14ONOfoCkd8u
         A0hpJzD3Bmi3B+6hf3KO0PypS/cOlIhPlw0fHHmJukiRuQ7N7n6LYQcD7AMKrZIbhSON
         q0m+XCIEnZEaJ93dEf289NapltmjR55ACoY/jeqa3qZ2tT1vTJTfXMACOWs8BXEw90gj
         SwV3EIkH2nyYF3sAkWD5qSYV9Az70MAAiS8YI//sGkoZmGJS//DSBXeOJYCIpdd5S0ff
         3Sp8ETG7wGPglqXKb/XLkRiJ/oR/7bdXthUoAv31Wl4QrDV9nYjQlaH1UKnorQb/F5zB
         IOOA==
X-Gm-Message-State: ACrzQf0MX4ZAeQotbObe/J2jO7yjz4t0PQ0Zxz6FnWYs6Q1Pv7CWmJaH
	Bfvluw7H8qypkjfRBPUWtT6NgMaDdmk=
X-Google-Smtp-Source: AMsMyM5dlx9gT/+0Nlw/40ifdFdqlhQ7NiHrmP6jvgQ5zp9/+UlcbqVsiFDcvuwkm52OcLTh4qe7ag==
X-Received: by 2002:a17:903:124c:b0:184:cb7e:67c5 with SMTP id u12-20020a170903124c00b00184cb7e67c5mr51114281plh.117.1667826652639;
        Mon, 07 Nov 2022 05:10:52 -0800 (PST)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id j63-20020a625542000000b005627868e27esm4404838pfb.127.2022.11.07.05.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 05:10:51 -0800 (PST)
Message-ID: <836f0bd5-0f38-dbf1-c3a0-d670cc09cb2e@gmail.com>
Date: Mon, 7 Nov 2022 21:10:47 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev
From: Song Fuchang <song.fc@gmail.com>
Subject: [PATCH v2 RESEND rebased] bus: mhi: host: pci_generic: Add HP variant
 of T99W175
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Foxconn T99W175 modem has an HP variant, which has
the following output from lspci:

  01:00.0 Wireless controller [0d40]: Device 03f0:0a6c

It also has some HP-specific serial numbers on the
metal case. It works well with this driver, so add
support for this to the pci_generic driver.

Signed-off-by: Song Fuchang <song.fc@gmail.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---


Changes in v2:
  - Add more detailed commit message and rebased on mhi-next.


 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index fb3b050aed70..b58a30367896 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -598,6 +598,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
        /* MV32-WB (Cinterion) */
        { PCI_DEVICE(0x1269, 0x00bb),
                .driver_data = (kernel_ulong_t) &mhi_mv32_info },
+       /* T99W175 (sdx55), HP variant */
+       { PCI_DEVICE(0x03f0, 0x0a6c),
+               .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
        {  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.37.3


