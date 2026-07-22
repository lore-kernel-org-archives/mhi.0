Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C070481679;
	Wed, 22 Jul 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714310; cv=none; b=K8yP/8SdQk1boagOLF9myWwIT4z4fFp5PYxB6M7klYPf9JOWCUQhbFf/U6u3siYibuODGy+AgD05WlE9yIcyU95IDkbcdMNJ90icQ4saItiUH0ruhw1rB+1NysAJIJ1blbO2YD3LkYBxfSWkNKCKj9rlrO3Asa/4WvwpTtl/4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714310; c=relaxed/simple;
	bh=atjPk3Ny3mP0G/5KMG932skgjRejrp8lVur/8nuJKkQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cjNhCTgs0wWtdbNzEDam7j+4o4oHDFvt4HKhxNl74yCnhRrB7g2r3vjmjroeeEJdxW3PTyn4a/TxTDfHzaUxkslr+9ZoaJfPxnCKaojKuFirs3GEU7SQGKEPQ5m7ylCnSdi9ZIB4tejz2y3GLqjJJfVWyRxc1HDtGrTWXILPsyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F9A1F00A3A;
	Wed, 22 Jul 2026 09:58:25 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Yuho Choi <dbgh9129@gmail.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Adam Xue <zxue@semtech.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Kees Cook <kees@kernel.org>, mhi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260707185100.424891-1-dbgh9129@gmail.com>
References: <20260707185100.424891-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] bus: mhi: host: Fix controller cleanup on EDL sysfs
 failure
Message-Id: <178471430574.139980.6107699223693982045.b4-ty@b4>
Date: Wed, 22 Jul 2026 11:58:25 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Tue, 07 Jul 2026 14:51:00 -0400, Yuho Choi wrote:
> mhi_register_controller() adds the controller device before creating the
> optional trigger_edl sysfs file. If sysfs_create_file() fails, the error
> path only drops the device reference and leaves the device registered.
> 
> Add a post-device_add() error path that calls device_del() before
> put_device(), matching the normal unregister path.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: Fix controller cleanup on EDL sysfs failure
      commit: df0da14720337107da54ceacd310a21855d24225

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


