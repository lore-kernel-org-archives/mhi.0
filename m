Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BEE15A1
	for <mhi@lists.linux.dev>; Sun,  9 Oct 2022 03:34:45 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id 78so7744296pgb.13
        for <mhi@lists.linux.dev>; Sat, 08 Oct 2022 20:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAR+iZsrZo6mQ20Zus4Uk2tKzGTaCQcfwjTZ7t+Wqr8=;
        b=C1a+Qo0/qtzlc1dpBmp70XIZYrxPytMUdXrk4CPbeQ3IBECV+9L4bbVXer7KNx133y
         zQp2F0agZ/2Kh7JQqlbubFR2XQs9j7by6fhnwOzU8UNvfgnLKdbQ8c3Wu15XtcP54Mip
         q5F25qEO8V+KfDRKiBn9ytpIfsI8ryiZivOOm86ZowCZP82UwsMMYDWC0g5AsM6NJG5Y
         eTH69x3zPnmAsBZ0W/OpIOOfamskKJGR16FenPB2KAZHoEzmJcwnQydP4QTNLJMn9gqN
         VjR1vUg1MqAYKLslSM5VjvnPFW4nPLfH1EA2Si1XME39kFeQBt2ZRS1rgjaayl+212Ag
         xTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAR+iZsrZo6mQ20Zus4Uk2tKzGTaCQcfwjTZ7t+Wqr8=;
        b=MNvSgYugcRx3Jf3J3FOQECzooxl4h9I8ptldJZUX6QHGyGkqKSRkhuw1kKFWxQNjvI
         6yCDIJERFyFpDtWKnsnieVw4Rwr7NFV39K21i5MRUF5UVNr+JvW5lgwbfplBPWDl6jif
         +V4eIAvsVqFui1ycJv7K61zCwS73zQRd7a2gL2s2svig92GRrtbx7i3xdQc1xuC/E7nG
         6bkIJxnVU5aM8bMqXGs18bMisKv9nE31n/fsAvq6lguCaCEG8K3gxggOkNDqS8kqbdpO
         Uuk48CfNlJcBSjAUVUbFZM8LFClPIXL/8l6EiFrYaXQh/eyY3icziy+mxai3qj+rh2R6
         HXGw==
X-Gm-Message-State: ACrzQf39l4fxgatmy9khDAGnHVMM0afm9Xd/ApP/5KYGCL5Fj4SVMeSQ
	dAgeD2MAnWJ4SLy21tYMEHyTjrJXVr7K8g==
X-Google-Smtp-Source: AMsMyM7+iwuLXYi34FSlARzA6HKWqzyyg06hiB8lBzOgW15ZpcrN0bS6sdONCqeWfmQULaTkHwJN7Q==
X-Received: by 2002:aa7:951c:0:b0:562:ca32:3d3f with SMTP id b28-20020aa7951c000000b00562ca323d3fmr9761537pfp.33.1665286484459;
        Sat, 08 Oct 2022 20:34:44 -0700 (PDT)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id fv8-20020a17090b0e8800b001fe2ab750bbsm3794729pjb.29.2022.10.08.20.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Oct 2022 20:34:43 -0700 (PDT)
Message-ID: <676290c3-0435-d85c-99dc-084f120ee04c@gmail.com>
Date: Sun, 9 Oct 2022 11:34:39 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: mhi@lists.linux.dev
Cc: manivannan.sadhasivam@linaro.org, quic_hemantk@quicinc.com
From: Song Fuchang <song.fc@gmail.com>
Subject: [PATCH RESEND] bus: mhi: host: pci_generic: Add HP variant of T99W175
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The foxconn T99W175 has an HP variant, so add support for it to the
pci_generic driver.

Signed-off-by: Song Fuchang<song.fc@gmail.com>
---
  drivers/bus/mhi/host/pci_generic.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c
b/drivers/bus/mhi/host/pci_generic.c
index 9e545f2a5a26..650e8b9c26ad 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
      /* MV32-WB (Cinterion) */
      { PCI_DEVICE(0x1269, 0x00bb),
          .driver_data = (kernel_ulong_t) &mhi_mv32_info },
+    /* T99W175 (sdx55), HP variant */
+    { PCI_DEVICE(0x03f0, 0x0a6c),
+        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
      {  }
  };
  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 2.37.3

