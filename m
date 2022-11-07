Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A1F5CB4
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 12:22:35 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so9557242pjs.4
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1HXcdwkJgL9tQwylRY7u0I9/EdflzJMa38ISDpppIE=;
        b=BbPTy6Vd3AEGLJvLEDOdwLHhm/elZfxWGRyOOU6ltKemcCSKZTTskOwRPKB3e9TvFE
         JR5i8Hmi4rYTVCh0b7YnLpaH7/eMc+Gb4l2cxjFU0LZSaI9apvjiKbezOcO1yx91es7R
         pRr3YkvUiRByxdowh+/BPBkO8ws4RRnay2ekeDmbyz+qeSresHH9ug4YlTb21sqZxu2g
         W1Q2XV0lfipSYCWWiOoRUTEJNedRh5VOh+2aA08BXCMvUfDQDybaUwvfWewBPhLJyNQ7
         U3nJ9s3pkKhVNdJP16mK0X/gKUzRZyFoEyaXUG7mpl/Z/OynZc7rcqAmWZkmYJg/uv2C
         nnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1HXcdwkJgL9tQwylRY7u0I9/EdflzJMa38ISDpppIE=;
        b=qBTrx1/X9hgq7s9O94jl2f2boA3JycAdDOkfwzTk2I3W0pqJ6zpGw+ZvrlAct0Lhw2
         6DtnHJOhUXmx3tc3NWH1fFX1rd2G6Rho5oZ2mT3cCsEm+rLi4t81XF93ieZyOUIbewkB
         Zi2ZM35sItzkMtZSGJ7RL24V6tHlARDere//S8Str3SVmtUZ52MswpKMRkV33HalFydj
         a4Icguw79yvlbDhk/oVeY0/H5K/Lxq6zbPHw5c0jnnzJOLIGtTjrvvFeVRm4GJLBb7Q1
         GYT/RbFHDSuMfXuiVra5hwx7MDKYzcBF2gyamI6gMilhosGcDK0FCYIa28ywrtcCC+DZ
         JQiA==
X-Gm-Message-State: ACrzQf1/udn0AWQFrCt3qbi3/d9WqtQzLJwaMM3bJYqEjtB4FVg2guHE
	GPl+7+b87N+TAjxrF6OHOzie6SHEHXI=
X-Google-Smtp-Source: AMsMyM6+iVP+eoY4XbLxUd6s7qdHoRFTe1xwgZ36ltG1A3OPMeVtlSa01Z+kDOWfwxk9nQImx/vArg==
X-Received: by 2002:a17:902:7786:b0:178:48c0:a083 with SMTP id o6-20020a170902778600b0017848c0a083mr50849269pll.125.1667823755049;
        Mon, 07 Nov 2022 04:22:35 -0800 (PST)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id y5-20020a63e245000000b004582e25a595sm4101007pgj.41.2022.11.07.04.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:22:34 -0800 (PST)
Message-ID: <27f52e68-1e0f-6ee3-d0e5-c2f6bb3a4f39@gmail.com>
Date: Mon, 7 Nov 2022 20:22:29 +0800
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
Subject: [PATCH v2 RESEND] bus: mhi: host: pci_generic: Add HP variant of
 T99W175
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Foxconn T99W175 modem has an HP variant, which has
the following output from lspci:

  01:00.0 Wireless controller [0d40]: Device 03f0:0a6c

It also has some HP-specific serial numbers on the
metal case. It works well with this driver, so add
support for this to the pci_generic driver.

Signed-off-by: Song Fuchang <song.fc@gmail.com>
---

Changes in v2:
 - Add more detailed commit message.


 drivers/bus/mhi/host/pci_generic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9e545f2a5a26..650e8b9c26ad 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
     /* MV32-WB (Cinterion) */
     { PCI_DEVICE(0x1269, 0x00bb),
         .driver_data = (kernel_ulong_t) &mhi_mv32_info },
+    /* T99W175 (sdx55), HP variant */
+    { PCI_DEVICE(0x03f0, 0x0a6c),
+        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
     {  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.37.3


