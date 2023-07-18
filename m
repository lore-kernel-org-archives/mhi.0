Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79FAD4B
	for <mhi@lists.linux.dev>; Tue, 18 Jul 2023 12:43:42 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-666ecf9a081so5648995b3a.2
        for <mhi@lists.linux.dev>; Tue, 18 Jul 2023 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689684222; x=1692276222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gM/YgQOHeZ56BBUJtDtFJHEmngLOGV7x/3NVPgw+uwg=;
        b=w2hgTYFo0jHGi/AdVX7TD2uUbk+BXLb+ZG2Zdw4rHJpk2T64R7srvLTU1EecmWqOqS
         +2jICAWOFdA3n+NCVvYfHl0gbvmHFdN/TULrzU34DmJFhmBJ7HFP7kD5ELlciAE0SsxV
         kgKsVcvw9mNvmcXpwZJ5BsgmfldRJD4EnkdtvBbHkjY7R1wkzXZqohfr1f2V2t/auNvo
         uOLi0T3d6Ic7oVvvNRQKN86yHEsfxfjzgpmHSNnGOf0CgRVMHzyIXHqFgtUkPuw34m6B
         abB+AOkZ+UV4Q+lnWukzd73MYDLSmt8SFGtfUhAx+cIIkzHJHWVCM1nTKlaOQTXdZ+OC
         icaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684222; x=1692276222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gM/YgQOHeZ56BBUJtDtFJHEmngLOGV7x/3NVPgw+uwg=;
        b=U2ejuWurMwPWjTWHkXfiDzae42JuXdQlXI/kva5WwDaBj4B8bw4pDOYq7i3BTgwsXq
         aIi9ZUoB/j+gC6DoAOyAug7vq3dcuMz0llTO06Uhu3IisL3sIpL8eP/Ws+okaMrGt3jX
         FS7cXa8KW7OERaA0Iey3Hbo6AsIv+VbdSY1pIMsyHQ998/kLByekxN5UPPTBIGsffesm
         OsmgaoNo2NkCsyZe5jeU6elVr1bJ5UcdS8hFEA6kZOzlcILsVxf/+fgVnHyxucqbh5LV
         eass/X9eP2o0KqgNaycVyVurBZwluhXVX/WdrNcesxtx18iV5KZTTHkk8iV8UXUzWr/i
         vNhw==
X-Gm-Message-State: ABy/qLZ47mT64kSo/PyP4M2hGvkERSly9EdqHib8jUz1iKrFTPXeb8hi
	epyOd3IhDoQLDnhyaQOEGzq5
X-Google-Smtp-Source: APBJJlGIyCLi2xXMxJXvF91GTdpgYQEGsEVobhqGEnYYRfEsOVgBWaJGpPgU4Z2/dyfXjMaz88khfw==
X-Received: by 2002:a05:6a20:a121:b0:133:249f:2ce2 with SMTP id q33-20020a056a20a12100b00133249f2ce2mr18924689pzk.0.1689684221820;
        Tue, 18 Jul 2023 05:43:41 -0700 (PDT)
Received: from thinkpad ([117.217.191.149])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78395000000b0065434edd521sm1444932pfm.196.2023.07.18.05.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 05:43:41 -0700 (PDT)
Date: Tue, 18 Jul 2023 18:13:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, mrana@quicinc.com, quic_qianyu@quicinc.com,
	quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
	quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] net: mhi : Add support to enable ethernet interface
Message-ID: <20230718124334.GG4771@thinkpad>
References: <1689660928-12092-1-git-send-email-quic_vpernami@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1689660928-12092-1-git-send-email-quic_vpernami@quicinc.com>

On Tue, Jul 18, 2023 at 11:45:28AM +0530, Vivek Pernamitta wrote:
> Add support to enable ethernet interface for MHI SWIP channels.
> 

Please add more info in the commit message i.e., why this interface is added and
how it is going to benefit the users etc..

Since you are modifying the existing mhi_swip interface, this isn't an ABI
change?

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Daniele Palmas <dnlplm@gmail.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> ---
> 
> changes since v1:
> 	- Moved to net-next from linux-next	
> 	- moved to eth_hw_addr_random() to assign Ethernet MAC address
> 	  from eth_random_addr()
> ---
>  drivers/net/mhi_net.c | 53 ++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index 3d322ac..5bb8d99 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c

[...]

> @@ -380,10 +405,12 @@ static void mhi_net_remove(struct mhi_device *mhi_dev)
>  
>  static const struct mhi_device_info mhi_hwip0 = {
>  	.netname = "mhi_hwip%d",
> +	.ethernet_if = false,
>  };
>  
>  static const struct mhi_device_info mhi_swip0 = {
>  	.netname = "mhi_swip%d",
> +	.ethernet_if = false,

false?

- Mani

>  };
>  
>  static const struct mhi_device_id mhi_net_id_table[] = {
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
