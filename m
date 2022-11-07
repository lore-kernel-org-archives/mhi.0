Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63AD5CB4
	for <mhi@lists.linux.dev>; Mon,  7 Nov 2022 12:11:42 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id l6so10406567pjj.0
        for <mhi@lists.linux.dev>; Mon, 07 Nov 2022 04:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5VLDSP1Iw+mjLb5ctZ65LZwBc9yYbpqHNj8NfVQIM=;
        b=lhQPE9igsNVeU9mJCD4i1BVBdwgeVx4afH/wH463gknbiKWL1DPykqTqRuZf66r3IF
         Zi8BmqAiuwiS4LRrMg7XPtFYvZHO9+ozoddKflvVt5C/kgNtjiq3qFHjW4S5Vs5lavBh
         gY4uYtjHX/uN9R4a4W4p+5t+AYCeoShWNvXYBmsaD5JA5vGf9SMQEVtr8/0TL9Y+f45K
         zfIllqDYOwY6ZT/Qqw6F4NJ8wWDW4K5aUXH69YAhxiDl6iijW21pzBaA8mPXF6CDh6i7
         Zgz7iJK6yeyS6/P8/xrsfh9Fj03corQTG0hiKXxR15rq0Ye+ZkvkfHRJgVxVyf4qJyyn
         u95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4J5VLDSP1Iw+mjLb5ctZ65LZwBc9yYbpqHNj8NfVQIM=;
        b=mEVc8vIFtURz6X/VDkJcMHEVCC5HpjdblI40DfX9hg8/UIQRt7I7Y79GQ8CXcMvELR
         ia4nvmkmZA3JguCffhhxxtxuFnpUcskj2LqwfGW64Xlu+JpJDNNvXs2o5wf5LjktJdl6
         7WopC+j6SYig3435gyl8tA+y9phNf2kIyjcpJWoN+c/ABqeQFjQM8295qXzIFuIgr9ea
         PabFyT4wUxMV0WQrVla/66GQ4Rb1L9f1+g6RiX7H/8I9zkxtbmd9Po/ajhUlVkx6SwxF
         OuExgqE13Xk99qsdnmN/M3/RcUowRy66TzaZEzDk4AsK/ieOuYZ4KBsjujc/BNWdzi+O
         fIvA==
X-Gm-Message-State: ACrzQf1bcRYiqJl2CvSUF4ngX0PpWvOOVLLfFZOEdG6+vdLWb0Ycr9vl
	GccVvbGeJSl/HJ5M+xYxyGnHK7KkSgs=
X-Google-Smtp-Source: AMsMyM6BwDzqxRKKmIMdm1D7euxbjrHn45MAacqMmDm6d2GlUZc7lAochNJOfvLRs9M8CMNuF0906Q==
X-Received: by 2002:a17:90a:cb8c:b0:212:eba5:a143 with SMTP id a12-20020a17090acb8c00b00212eba5a143mr51260474pju.79.1667823102269;
        Mon, 07 Nov 2022 04:11:42 -0800 (PST)
Received: from [0.0.0.0] (107.182.18.67.16clouds.com. [107.182.18.67])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a680100b00203ab277966sm6108685pjj.7.2022.11.07.04.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:11:41 -0800 (PST)
Message-ID: <c7500e36-e1fe-ce84-4cb9-662b5169daec@gmail.com>
Date: Mon, 7 Nov 2022 20:11:37 +0800
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
+    /* T99W175 (sdx55), HP variant */
+    { PCI_DEVICE(0x03f0, 0x0a6c),
+        .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
      {  }
  };
  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.37.3

