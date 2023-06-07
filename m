Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0176AB4
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 11:21:48 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-256712e2be3so6205888a91.2
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686136908; x=1688728908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sXtu7T4BuQTlc5G2QE10guaIjIMheRY/q8IpaabYJXE=;
        b=mJcJOtf9cKn2YYWGd/imMh8cq1rB3fGhC5WYLbJRmA79Z2r356m97G9o9T0VhQ42Or
         dGQ2nwHsJ4TRNWy3H7od5UQpyhwG096mKD468OFXY99pwzrF2BSE37k0C9MnHN5it1nm
         ToW6hfUtdLfQadVYPGvDPW5Ivrc7sHhY8MGVJ2NUL5A4butCHKYWvRDgmSgTBmSQC1Mf
         9CtXIVdDDwEWlNZ7VV6Vwl74N4JWJreGrfVIKIY9ZMvjwZXHX6fsVQ2zE47tv4WQ2lj3
         GOH0dad4BC210GQnP0xEuBUv17WSwMbwPDiPFrgoi2LXCp/laF6+QoADHUZH63rHXcRe
         p49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686136908; x=1688728908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXtu7T4BuQTlc5G2QE10guaIjIMheRY/q8IpaabYJXE=;
        b=laY7H/M3XjO9sFDhRBB25XF2pjmUu1sFv0kts+WR+ahiWNiT796YJ1uIqdyRpVu2g5
         OaXdWhWiOOao+kVWSzkCo8yvMgawpn7trJsuUePebgb+XEZsACCBVxPFJ+HJw6Y4irHr
         k+g71BC8j6AW/NQ3ZOD0GM7JI+hyebkqExHF5ca8HOIn8lEnbzyS0JHH2TR4o2w4+fRV
         CIuoTFRO9q7d+/iegETawgLNbUmmO2QGX3eUvgeBVvVzIMu7fHaBPBq1NQUtO0gVVkYO
         k3AcIVGOlxITTp39bCQlPI61VdvujtCHLoiVQkt6t7nH5U82/2j3vyMEKchozly+Gf1R
         KNXA==
X-Gm-Message-State: AC+VfDwlW+KyIiMT4nKfhIeiNg9+iAP8ZdkXVMyUa4MFA6w+HhMMO6TO
	OvT94jAviBCaDUdANsRrABZc
X-Google-Smtp-Source: ACHHUZ75KNTAVNCWXJU3GsKBzmblvZ/f6zZCceUwhTqXHVFfvpwuY3PBfdfhrO3xihSUnq5IJQZR0g==
X-Received: by 2002:a17:90a:195b:b0:259:c015:9fa1 with SMTP id 27-20020a17090a195b00b00259c0159fa1mr1754510pjh.46.1686136908342;
        Wed, 07 Jun 2023 04:21:48 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a001e00b00250bf8495b3sm1217420pja.39.2023.06.07.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 04:21:47 -0700 (PDT)
Date: Wed, 7 Jun 2023 16:51:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Simon Horman <simon.horman@corigine.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH 1/3] net: Add MHI Endpoint network driver
Message-ID: <20230607112143.GE5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <20230606123119.57499-2-manivannan.sadhasivam@linaro.org>
 <ZIA910jCjl+dxc/a@corigine.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIA910jCjl+dxc/a@corigine.com>

On Wed, Jun 07, 2023 at 10:20:39AM +0200, Simon Horman wrote:
> On Tue, Jun 06, 2023 at 06:01:17PM +0530, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > +static void mhi_ep_net_dev_process_queue_packets(struct work_struct *work)
> > +{
> > +	struct mhi_ep_net_dev *mhi_ep_netdev = container_of(work,
> > +			struct mhi_ep_net_dev, xmit_work);
> > +	struct mhi_ep_device *mdev = mhi_ep_netdev->mdev;
> > +	struct sk_buff_head q;
> > +	struct sk_buff *skb;
> > +	int ret;
> > +
> > +	if (mhi_ep_queue_is_empty(mdev, DMA_FROM_DEVICE)) {
> > +		netif_stop_queue(mhi_ep_netdev->ndev);
> > +		return;
> > +	}
> > +
> > +	__skb_queue_head_init(&q);
> > +
> > +	spin_lock_bh(&mhi_ep_netdev->tx_lock);
> > +	skb_queue_splice_init(&mhi_ep_netdev->tx_buffers, &q);
> > +	spin_unlock_bh(&mhi_ep_netdev->tx_lock);
> > +
> > +	while ((skb = __skb_dequeue(&q))) {
> > +		ret = mhi_ep_queue_skb(mdev, skb);
> > +		if (ret) {
> 
> Hi Manivannan,
> 
> I wonder if this should be kfree_skb(skb);
> 

Good catch! Will fix it.

- Mani

> > +			kfree(skb);
> > +			goto exit_drop;
> > +		}
> 
> ...

-- 
மணிவண்ணன் சதாசிவம்
