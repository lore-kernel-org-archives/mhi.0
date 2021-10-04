Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A13A3FF9
	for <mhi@lists.linux.dev>; Mon,  4 Oct 2021 21:21:51 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id j13so17303651qtq.6
        for <mhi@lists.linux.dev>; Mon, 04 Oct 2021 14:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=MdNSXvvLeGOZZpP+gaikLSBPKVwikGVNkKvEpa2ipkI=;
        b=DB+pOMioXZLN7caM7LffM+M+pwghIEI6V3HcOkDvxAobyGl04ggHwRxRBnguUqBwcq
         wOsrSyZTQEBrMXcHSwXz11WALvz2lIaDCoT4Gi1NH4kacCQn81FzAJ8wKeVUwtzCx1eg
         fEAE0b9yA8GBWfDfbYfMwd0AXF50su2+8C/FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=MdNSXvvLeGOZZpP+gaikLSBPKVwikGVNkKvEpa2ipkI=;
        b=4u+HeaO2VYMjp09AHeI6BjDtXBt+0QkY1Q7C5FNWf1Cq7KH9l6d40oiROwggmXrlF0
         KpSVJKOMMcqpUsR+MdqBgdntag+Vy8BUa8RcQ7xGWGbiR8SRJEGYGJNOLbomkQozS3Ui
         wgT4GDnbMLUmujWBipwZTzoMw0SCNKZsrcPHNw7EYP1to+mQ+Z1Hl/Y7fE1uyxiow2N2
         o4rNkeu5OJBwov0GgWfEUcdfWHaF9QcA/7kroL51Dn2+iwudzr0V420cjpG/ABa3serr
         jPpD8F+vGlJ4RRNVEQChJMUfZwKlHed/oN0KO4GKmT3ej4IWFPn9TavDhbqVVAN08B93
         6blQ==
X-Gm-Message-State: AOAM532ua7WVaVxFfxegsq5Gop9BihoOCmD9qU9IU6iefEyJPYlyvdHK
	N1AYVLPrWXMlR3p8Xz7iaCOLO3O+MCAgVQ==
X-Google-Smtp-Source: ABdhPJyZY8tGAkM/DuxtdGZ88gbSmYdPxwngAjhmgdGg01KRR1Lqnq76lL/UvNeJNt0sWCt9sh/Xkw==
X-Received: by 2002:ac8:428c:: with SMTP id o12mr15867811qtl.89.1633382510228;
        Mon, 04 Oct 2021 14:21:50 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id q8sm9411824qtl.80.2021.10.04.14.21.49
        for <mhi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 14:21:49 -0700 (PDT)
Date: Mon, 4 Oct 2021 17:21:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: mhi@lists.linux.dev
Subject: Initial message to start the archive
Message-ID: <20211004212148.xuee6tgung7bm2mh@meerkat.local>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This message starts the archive and confirms delivery to all the necessary
places.

-K
