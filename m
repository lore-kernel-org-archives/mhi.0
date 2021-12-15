Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8772CA4
	for <mhi@lists.linux.dev>; Wed, 15 Dec 2021 23:24:49 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 133so21368427pgc.12
        for <mhi@lists.linux.dev>; Wed, 15 Dec 2021 15:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wKtXeTQxQFOQCh8iyar/PDd0xAj+8Ua39SmoAmPwN0=;
        b=e93vtoDwd7onN/Fo3H65oql7xosjLseC1YGapBrQmDK8jys1N9X2tePXxtX6QEq0nI
         iDk6bk2DjcbExvPfmz/6+6BGWestI5jcC4InWhbLSXwwL53ZzItr2OyIyb7zESJ1u4Uq
         Uria1ieOHKqTNLG4TJ8pf/MQSl/1RONlDvHVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wKtXeTQxQFOQCh8iyar/PDd0xAj+8Ua39SmoAmPwN0=;
        b=KXPKFv3Zr/Yt20XNSXQBZBrUCwxxZz1ai/Qh7lV+hDfS2sfdeXnE5p0++ZEGVTGGqB
         gen/dyQgLaS4ED7058CsHhoatmJfTCobo246bVureijF+hyBPRXwcVCQOl1WKNGr0sPx
         LE5Q65eqS6nzJ7c4QNcJ8HC5KChSaoql8pRgvhmXSTKJUhN9Qh1rQO0zuw2EFAYFYR3Y
         pgblt9HDdWXu6zTOGTZkogYlYEvXl7k9zQjnggoEA6/FdbtLS1Wq7foPal/FN/p8nTwR
         3XiLfjC7Kdf74U7AVQV6E/Y0IOTMEGQ6k6aGlDlpsmF32vAA5+iklzYBfb3qAmDk8Xa2
         oZIg==
X-Gm-Message-State: AOAM533M4IQ4w4gWzN4dbkTO89eIlvCwQvSJTpSz8iqJGMaCCBv9CWYg
	SAZ6D5Y1n6zpjboJidw6OSG54FEllyAdEw==
X-Google-Smtp-Source: ABdhPJzPaE3TIAcoa2YxlOC2PEjMxZUiaqVdjcPVu4fLhU5i65rsqtA1qnZU6a6ixNYs/HcqJpfTSw==
X-Received: by 2002:aa7:9990:0:b0:4a1:57ff:3369 with SMTP id k16-20020aa79990000000b004a157ff3369mr11043448pfh.31.1639610688626;
        Wed, 15 Dec 2021 15:24:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c17sm3819536pfc.163.2021.12.15.15.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 15:24:48 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Hemant Kumar <hemantk@codeaurora.org>,
	Bhaumik Bhatt <quic_bbhatt@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Yury Norov <yury.norov@gmail.com>,
	Carl Huang <cjhuang@codeaurora.org>,
	Carl Yin <carl.yin@quectel.com>,
	linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] bus: mhi: core: Use correctly sized arguments for bit field
Date: Wed, 15 Dec 2021 15:24:46 -0800
Message-Id: <20211215232446.2069794-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2373; h=from:subject; bh=5LBWuQcow5y4kUPEfLAt34GEYiaqhrm63wbxhk+W1ig=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhunk+I6cQX+iJm8LamClVJjxV5guF1cKeTHIPdL2O qM1yHtyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYbp5PgAKCRCJcvTf3G3AJsjfD/ 9q5kWvVOIY0URvI4tj+mBje1t9tKvfuWMgGjtOXSEkCwt9eJuF6pjzV0I4cbdUmSgim7Nmqpyw8Pg0 2GqtVDK+rttKDmj3c7nA/bBDK89QLy2ddXtThguHJmEyyQyDBEtDXF921DwPMSO3WcIsfDdO3OhPIH Lu1Q6KPnBCnR4x7JE3/S26qSrLxFWuAt/rx2dGkNSF9TwCfeNB/sjxEJgA3cgdHrTtf/nna6jq1iDo r/DFhSPVhPJvVZF090UyNXl9D/cjecCHFnry7rfYNIh4J3jsiLwuEuyhp0vWvTE3BtVErokZyPuNpC 1mLoIfEmURAaIpIgixc+CBWHerMTijTuuC74n03XRWGFweixnFUXHD1Q6+CWubPkImDvRgfz29CwyR yBGzlF6HGzStLuGjoijkx8NBFB6TrRkwDFAWF5B0zw5qp3UrY+tSNO/YblwCNDvTq0462OfdG9cmVO pddc24rF+fnPL2/w9oTILc2Zri0z/gG5INmovaxelLQZXicWKq+xqPzW1tRtxhjEcIGaiLfRI0dZiO DK4/dMZ6bkYZ5RTeVJXNq0Gss3mT0AAXx14TKmm5JxoKuF4ZimvKbUTZ6n6ThtW6ak4tp4lC5EpzI6 FJrzw3xgxM7vAvncRiuDTMExcJ67HX5QgLfa35S+FkRjeRs5PI3Ev81oCCoA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The find.h APIs are designed to be used only on unsigned long arguments.
This can technically result in a over-read, but it is harmless in this
case. Regardless, fix it to avoid the warning seen under -Warray-bounds,
which we'd like to enable globally:

In file included from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:22,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:60,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:55,
                 from ./include/linux/wait.h:9,
                 from ./include/linux/wait_bit.h:8,
                 from ./include/linux/fs.h:6,
                 from ./include/linux/debugfs.h:15,
                 from drivers/bus/mhi/core/init.c:7:
drivers/bus/mhi/core/init.c: In function 'to_mhi_pm_state_str':
./include/linux/find.h:187:37: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'enum mhi_pm_state[1]' [-Warray-bounds]
  187 |                 unsigned long val = *addr & GENMASK(size - 1, 0);
      |                                     ^~~~~
drivers/bus/mhi/core/init.c:80:51: note: while referencing 'state'
   80 | const char *to_mhi_pm_state_str(enum mhi_pm_state state)
      |                                 ~~~~~~~~~~~~~~~~~~^~~~~

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/bus/mhi/core/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f1ec34417592..b91f75fff962 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,7 +79,8 @@ static const char * const mhi_pm_state_str[] = {
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	int index = find_last_bit((unsigned long *)&state, 32);
+	unsigned long bits = state;
+	int index = find_last_bit(&bits, 32);
 
 	if (index >= ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
-- 
2.30.2

