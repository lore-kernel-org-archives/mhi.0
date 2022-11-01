Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C137C
	for <mhi@lists.linux.dev>; Tue,  1 Nov 2022 12:59:38 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id b5so13348550pgb.6
        for <mhi@lists.linux.dev>; Tue, 01 Nov 2022 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le0XKbDKfIkUuNzFmZcexdP1w3kL7zwjiulHbxd6DEc=;
        b=X+3XbRQgyL1mZuDWChFsRISnqiH1qtyZEtlxxpVv95HRYx53qQNtzTv93UDLpsKnaK
         kNGFyKrsErOWxMhE0t3KvV8YnQFRmmnw+Y1oiY5Cr7yLzdePZi+9RM3pl1hPQ1KhPt/B
         VOqJX1NnFhfZp5Olv6pNBzeM43a6tPU265yBCSu7a7VVmvqmeeIqCU/aGGa1JsnkVEtF
         MEQu4CtuE/uLxhIqrUbrftGTAadd7bgdIHZTUpVZ+7Z3PWfWE+nsGeyHoD52WgJhjSKq
         clkhQ+breqPeWe1ZL5azhRkyMjmC/vJ1LpvUCnDEbAidH+KaZplXU48x339hWOg6BAWa
         JLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=le0XKbDKfIkUuNzFmZcexdP1w3kL7zwjiulHbxd6DEc=;
        b=PUzNOHA7vQw7GVuZ8RUtnFQ9PvAr7BabRXYGp9dZv2hXiOd9UkPboYSpMR6c8sUNdA
         Hc73pT9Is7QfXW6djemQRd2g9ZBlhuH796bfkW696Bw6xefYw6Hs5D8w94hrZtxhHrZM
         Szn5ndvt3Ut/QEpx/H6k7GJBkFQASMbfHDFzpdlYzHRG9If1dl+CjvXCZrnvJ5wQ5p8Y
         YCcc3RI6+yVAuPtqHxwc+NKB0TR1z07EBc2X57O7Rqm36+XrDlRPxtJDn5OqQpDv35Tu
         6r6gi88MSzY4iQbugZmTHeU693ErMfCAreDFmH4D5UDnXRZp4WX58BQaT14cvHTMixyr
         +hbg==
X-Gm-Message-State: ACrzQf18O4BzIgHHqsp4XnWqUCHu+xsT8ryIj3iqqMFutkjZXONChu0i
	vj5CBfbkOZfkEgEULgPGGaPiKx7asDvvQux8
X-Google-Smtp-Source: AMsMyM6cx0D31MbypHklt4o0kjq4nCtSDNkIhWZAIuUnhaNCBDAzDeXm63VzfrDLYaUXpEQ6C+0qSg==
X-Received: by 2002:a63:6507:0:b0:46f:ea82:5792 with SMTP id z7-20020a636507000000b0046fea825792mr3458229pgb.50.1667307577858;
        Tue, 01 Nov 2022 05:59:37 -0700 (PDT)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709026f0800b0018668bee7cdsm6257943plk.77.2022.11.01.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 05:59:37 -0700 (PDT)
Message-ID: <c990bc1c-1acd-20d2-d6a8-6d202745ec8c@gmail.com>
Date: Tue, 1 Nov 2022 20:59:29 +0800
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
Cc: mhi@lists.linux.dev, quic_hemantk@quicinc.com
From: Song Fuchang <song.fc@gmail.com>
Subject: [PATCH v2] bus: mhi: host: pci_generic: Add HP variant of T99W175
Content-Type: text/plain; charset=UTF-8; format=flowed
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

diff --git a/drivers/bus/mhi/host/pci_generic.c 
b/drivers/bus/mhi/host/pci_generic.c
index 9e545f2a5a26..650e8b9c26ad 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -592,6 +592,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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

