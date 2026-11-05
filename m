Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793885723;
	b=RUPR1HyX5IQiQaDrtzoHfPSoy8fXV/gG1oVbbLd4zNdpvF3z6Y02VHpCWWv04OARwFim
	 AqIiq1Dt8eb67sw8UvtTUZ4HA4qG4g74rtwopgBq0QHy82HndMswwAFRQmIdOLIxj4fHD
	 /7r6BQl2Qf1VZIjG3/yo29YASK179+fP5gNX1b6sLCEYqUJUIuLCvNGf6ZO/sVO2vLGKg
	 PBROuYQ49/kAUF7m7CLc1q27rM75R81HVP/MuYO7K0rSKLeTwMCa5I7V20kQ2M2FOGey2
	 1OjA+dOSSAVnCrT4ZyV5nSO6UYY9tk2WlKO2YJNK4XFoeNhmfDf7hIXsdRtJivGSL6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 In-Reply-To:References:MIME-Version:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
	b=0EEnNML2cKYVm75CVfz5Umi4iQtO0cJF+kr3MTnqR8dpyIxKM8d5F8jqPlY25R7LYVpw
	 8GR3vn3baofEGRbsvDSUhW/xPSTWVcXbX5LQlwM2cKGOF2rT+q4WrZXmwI6yPPTMlKspS
	 Oi2cU0tnzDwqqW87l4AZRtMaJKYu7MEnuhNrJvfswu7myI3yGXqGmoOa6+uTzIQATDltB
	 9PnCI7QPvIRjje+JnWL+JztMv9OyXph2vX9kXiWuHgG6kJ827KDyTOID+z9w2+2Ca4Cey
	 q0UX5m4mGHre7Vc4JwwPzmXDefMha/duBoJ7LiUITPPZfsxkoaLiPyS96+KRS3OPD/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9HFt4DT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F73606A31B
	for <mhi@lists.linux.dev>; Thu,  5 Nov 2026 13:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F73606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9HFt4DT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2374624e87.1
        for <mhi@lists.linux.dev>; Thu, 05 Nov 2026 05:35:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793885721; cv=none;
        d=google.com; s=arc-20260327;
        b=DlNHrw8AAyZVfkyRyioBpmylKiUdwMP91mIE8thq847lHWdV3fJLYU4tGSSKu4y2qW
         cpAFEudoR4gTR3fcmYGS3hjeVKZg5fNWD1x6LZ1mF3cIrnDeq05A7envKXAcj71U9EEK
         I28g/xarZzhm3K6gWKudZ95k71KzpdGKMTqqO2rErOS6wUXCFmcxar53G167WJitPoIn
         kX7IcX+n1IyDcW4Q97wPdE32L5e1P1aiV7IlK3/F3yLZnI2Y5cHpLp6DS69IFAuReQNw
         wBBBBhfT9PsWZemzo/d5yAS3HViy9GN2+arh/YsMYOu1SP7j8qFsCYq/AYN//rJqDUXL
         PTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        fh=gZkWN7N24A9mcSE8SQ2m0iViyUKtDxNwad/X3lMQIrU=;
        b=PBuxuWAahT69nT1VuD1mifbbR5ccvFgYfoD4yZgBivZLlh0vDgK90jD3rxNt2U/HPY
         MWpghZEjXV3/VNhWyPqnQ4vMRgT3gW3OeMlugL3AYRShGSqBnPo8B6O1cZOov6prZPBW
         uGm8S0rHGchElkSq551s8A0HdJM0hLSHC/U1QowgBcOMhQLGrXznTTBvs+5x1k0ze12l
         jlzBHwJsOr+WEwFeRCymaj79Vvh+jKAvASptSF6BuNm7H29Rp2o9AKTiAlH05y6M/GU7
         BwWMxsR/qTAmCBqF6SwePzRGjx7ZSH4V1cMO/9iXplRO3jCDOSmnktaDVhNrgunw+pqm
         at3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793885721; x=1794490521; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        b=H9HFt4DTHwDG0EJbs43B+F4x5dSa1K3BED3dOHXdn5msVJ/RwTuvJ2y5006kAHxCSU
         Jwcl58N/hkDjXiaoRvDjA6A6t2gTv1rJ1O+D2YX6ozOqKad9wF4ftnzvKhmlZGkIZLBh
         UO1C+Kwr0KKg+uqr2HsUatLLpJGpp3K94JiuHkBoGV8z5WUySnhAZqTF1Z1qGOamyjsc
         Lr9ZUqwHr1OLXrF8GnM1ARmKRAkVZYR3t6nxolIl7/2deqyRUCiJko5i3IMITJC7oJEe
         k3QdI/76O2/HLg2Hy8yR68MRzNMowa7mp21Tb0o1UoX2Hr5LNw7aF037f7rMBmotHgAI
         QLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885721; x=1794490521;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=un/mirF/YwQDhny9ifbt8IaNHDK4E34ldwmWHRru9ic=;
        b=eMcO/SOXQdQFnn6+vJnL6SNutEdBXxMqE1OPGuuGLUic2zNtC6zC9KSbPICuAHyDaK
         y3/HAtaJxSyAJIsTISyh5VD4aagl5LOSprRkjbwImyjJ8Dq9LDhZC5PRxvETT/hgSF3y
         4A5vk6SbNehpF8TCn/hQmYQ8MKDMBTSc++gP6OHrLuF/7RE8fF82BwD0Ygdjwv/QFPh1
         e0kK8zNX7FZXqVJk4E0QKi6C6exZKx1K6SSYmqnUwip3M+CM8GB4VltV0bfaw2IQ7w+4
         il87olHCFeSJ5FdojWcvFqHIGfHpbpIl8eHwdVX/3PoRTnr6I9cBvuXW0KF/C6NEEFf6
         sexQ==
X-Gm-Message-State: APuU4Z+9DNS6S8vNeGia17O2POzAKureBz1AsFFV/qvxX36I4BLn9DMo
	zuIjoRwkHIRfuKqEtNZjfTSZaijjBJVMYkNyGZBACXCCpx926+tPoiZ81i8boxDJy9b4Wrrhm8v
	kmCvZLFXCliEd9wk/l0kI+nbY53PRboAkwA==
X-Gm-Gg: AYBFou2Skl+YFDzMCLdPWr0bn9gjhTAxE5tJxWMYP0jcxFZDMvHF/vqQL/x7YnBN5ey
	k4bia1yIRt629pK38uSwXWsB7SI7HsAYZfaHBliH+W5Xf8h0jJ+7i4BRNAMXl5reV/nSy6i1Hbw
	M+/AJm5OkkHRA3cA3m+MoRkk3MTjDrxwEuUzHV5ZLJK631QrZ/QQYMrBDTPd+Cppaiz1xavYRnh
	5iWKFLCsr2u/xGeAYwRBDq35sWVxWCu/rv39BEF6q9T9YVpR9CpK1lenQ5i7bMrmX/6ymCfzwL6
	lglWOU9wyCD71UzIRbMNpXdKWbc1pN8YLLKzMw0cIwZNaVxRYSU35xJ+QpdvZr5Lx9Per8HzeuC
	+TMR3g7S/wAcZWKCYpMXotN21XT4DCjbNo8oL
X-Received: by 2002:a05:6512:39c1:b0:5bf:d2ec:904d with SMTP id
 2adb3069b0e04-5bfd9563095mr6994195e87.14.1793885721088; Thu, 05 Nov 2026
 05:35:21 -0800 (PST)
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 05:35:20 -0800
Received: from 16659893159 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 05:35:20 -0800
From: Steve Meek <stevemeek82@gmail.com>
In-Reply-To: <20261013-rm500q-db-burst-v1-1-bb850d54e2c4@gmail.com>
References: <20261013-rm500q-db-burst-v1-1-bb850d54e2c4@gmail.com>
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 05:35:20 -0800
X-Gm-Features: AclHuK_uyRr2JFV4uyjiNutcKI3LwrFFfmjL5VbrHIy6nDY9T6nQp1olD23DFVo
Message-ID: <CAPzME4ZmwuXDRAoYDqi7et2q=f1QU69g8ZUrocS3rZn9ajy6+Q@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Disable doorbell burst mode
 for Quectel RM500Q-AE
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

Gentle ping on this one. Happy to resend or rework it if you'd prefer a
different approach, or to send the traces from the stall if a core fix
would be better.

Thanks,
Steve
