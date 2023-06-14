Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0533FE4
	for <mhi@lists.linux.dev>; Wed, 14 Jun 2023 10:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FAFC433C0;
	Wed, 14 Jun 2023 10:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686739341;
	bh=X7yfHlvVllPkKbahx8vTZCjY01wqQ4qFTmrfD100fbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fhb+KPzasSVEQteouKqtKKg6l14tpSw3XjTGRH6HEQz5cu/1ekwL/tG+5qkz7oQf/
	 gI7WgUwhk567cA+p+1nMsgCsf/QaVnnhsefB8LqDT6x1YskRmIZdU6y8VLW6vtBlWT
	 ciNbEn3SD3XP1sRCMlx4iYnDSjapIx8hOtuP2TSxS8N7TJQgcJMUMdbKwsIKuWxWZ4
	 HnysOe6FomncdQ4BsJvGTH7MHuErOp/chaCfmVpEE4gLvRrq+QMm/rr0V1qw1TAdt+
	 Be67bJ47Lyp9R9iBiTY8o++5GswRkOzrD6M1IMpKsvmxYxcHDXYy8AM2F94Tyf08AV
	 Vxk4RZk8aw3sg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: endpoint: Check correct variable in __pci_epf_mhi_alloc_map()
Date: Wed, 14 Jun 2023 12:42:15 +0200
Message-Id: <168673929458.230348.14392570748400558563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <258e8de1-abff-4024-89e0-1c8df761d790@moroto.mountain>
References: <258e8de1-abff-4024-89e0-1c8df761d790@moroto.mountain>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 09 Jun 2023 13:49:33 +0300, Dan Carpenter wrote:
> This was intended to check "*vaddr" instead of "vaddr" (without an
> asterisk).
> 
> 

Squashed in the commit they are fixing, thanks !!

Thanks,
Lorenzo
