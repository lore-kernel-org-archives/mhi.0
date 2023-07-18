Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4D7D518;
	Tue, 18 Jul 2023 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6A8C433C7;
	Tue, 18 Jul 2023 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689694309;
	bh=UvS81nynzAskHbndFRf/Rn94S9fuk1KYmPk/g/MesL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+xmPqPNT46C/9ayWQvzmDHZv/ntnGcW8Xcdx44EDIg2wDncuMGisvPyJelAVPkz3
	 ytCNUjuWvG1hHKThZ605G6qZsJH7H/dNZwUqoyYFw4RV4jzGpwMGO47h+opj4oXIPC
	 FQ8rocsLSi3EiWJNTu7LeQXx0gdqZP3jgpkqixAV8ciBgOfHuMVADTAis8aCHgMUYi
	 V3o4LbcONlkmDGO5Sxj8ON2Fqo0x3rt56UijOxSnbkykqcC/bKH//OX2CfhXuPtTmf
	 ehVn8y3bX36Ia9HBsr7M0hp2HtujLuApk65fhkoSBStKXJ/3eAcOjNzpatT8uZlmKK
	 VDxkhLNkYD66A==
Date: Tue, 18 Jul 2023 08:35:12 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, mrana@quicinc.com, quic_qianyu@quicinc.com, 
	manivannan.sadhasivam@linaro.org, quic_vbadigan@quicinc.com, quic_krichai@quicinc.com, 
	quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] net: mhi : Add support to enable ethernet interface
Message-ID: <5b4okksnlobcm7sawopaayjciz4yp4y4b7vplacecqmgv5vtnk@oc2berflgkmr>
References: <1689660928-12092-1-git-send-email-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689660928-12092-1-git-send-email-quic_vpernami@quicinc.com>

On Tue, Jul 18, 2023 at 11:45:28AM +0530, Vivek Pernamitta wrote:

Please drop the extra ' ' after "mhi" in $subject as well.

Thanks,
Bjorn
