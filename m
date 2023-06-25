Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F25410E4
	for <mhi@lists.linux.dev>; Sun, 25 Jun 2023 18:34:55 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b8033987baso1372485ad.0
        for <mhi@lists.linux.dev>; Sun, 25 Jun 2023 11:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687718095; x=1690310095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7KVQuIv0V8DtSvRNaFYpILs9gFNdEYiZqxK/tch1DY=;
        b=hCzsuIOJRclY//Vtd1lF0O3qtpCGxX3v0iqiyos73HbDXaD2TngGG41Ee9lt7n1cGT
         +hR6qCCt+sizZauGM+ac+XMcH+Lml2YIequHinhLhNPkEKosJpMzkY0wUiDS6XXQXBNm
         EKXxDqeaa2t1uVXNZkGMZ3RxNdkPugJ7/T56DJd8m6nW43Mlg9BDKu2jZtNg2kv4pr6C
         1TnL5q1vNVj7mWHTwn5HCiJKv/ToQCjTkIL2JSRYSW28xFPmJz3HfOw3LNpSXXPM8AcL
         RqIO/7l3KbV3hhzVaY4mOtOIrYmcU3m87XUI+1SB18ZAFu1hvki6x2BxX/KE00AWYWvN
         81Ew==
X-Gm-Message-State: AC+VfDzcINbA820Lxw27+EovNGJ8K3qM8hdFb0LD3UKmxqiOxAAnJzN1
	EEbQHIlPnBzn/VqeYPLB9lc=
X-Google-Smtp-Source: ACHHUZ6CRTVKAAtFbxfwopL29P5NT7jjm5c8z99T4uJtIqzdlfkJtfqi9PwMu2VcDoyjYqpPn1R97w==
X-Received: by 2002:a17:902:ab05:b0:1b6:6751:95f5 with SMTP id ik5-20020a170902ab0500b001b6675195f5mr5327376plb.25.1687718095267;
        Sun, 25 Jun 2023 11:34:55 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id kp16-20020a170903281000b001b4f77d4e7csm2742744plb.115.2023.06.25.11.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 11:34:54 -0700 (PDT)
Date: Mon, 26 Jun 2023 03:34:53 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: mani@kernel.org, lpieralisi@kernel.org, kishon@kernel.org,
	bhelgaas@google.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] PCI: endpoint: Remove redundant dev_err().
Message-ID: <20230625183453.GB2459283@rocinante>
References: <20230607093514.104012-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607093514.104012-1-yang.lee@linux.alibaba.com>

Hello,

> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from either the platform_get_irq()
> or platform_get_irq_byname() functions as both are going to display an
> appropriate error message in case of a failure.

This extra dev_err() appears to have since been removed, per:

  https://git.kernel.org/pci/pci/c/1bf5f25324f7

Nevertheless, thank you for sending the patch over!

	Krzysztof
