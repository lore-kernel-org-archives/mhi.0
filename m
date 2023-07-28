Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0373D86
	for <mhi@lists.linux.dev>; Fri, 28 Jul 2023 05:51:40 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso26859251fa.0
        for <mhi@lists.linux.dev>; Thu, 27 Jul 2023 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690523498; x=1691128298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbJoy+y2Yudh1CYrBwAxIycjhiEMLkeAf2hLUb9dK34=;
        b=LH6YTDFSPga/O+VAxidGwEtHUFiI3euAsZYJ51ccNSFe5Qgtgeg9kwxBqunN05CDlm
         kGNggeVbJqUWLEqxdzRBLOUO4KA24vRH2TWLcqYZFoXj4kApGdquNlNU4oFte+F6WFIS
         6GfIpews7zvObUBnY1Mw94OfijKGIIIOYc+v2SFkeyRifN/mkWxK588/D7xru6SLq3iZ
         YCGk1V3fqh4Hk/f6tzMe3sJfUJB4z+9Xjt9WAF50WSbNiudloZSmfk0OHe/YmrjUbIXS
         D7DnFpN8sgy9CikjAz6AkK222KA1IDRS9zcCdz5QGmQXtObIX3fwlOu3rIJv6IGo2ABB
         O9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523498; x=1691128298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbJoy+y2Yudh1CYrBwAxIycjhiEMLkeAf2hLUb9dK34=;
        b=GZ/t3sFYj+a2KK/oU4UeyrkDrlx6FApm2IWkv0iurzaVhiCAWk0YlFiBMLc4E32eXz
         6rsWpOCvR0KJRKUDVUgSxrPdux2XK1SYTL55JGaHgqLh8iiFYvvqEMGHr+TICQnXverN
         en95fEe7haMWuwJI5H1fP8+CRJTy+mi50sI7WyGPDlqSFs4ycZ+2TaDSWsr0AxH39tG4
         8STmQwmvXNzwEsMil5x2gyT8HOxZSIay5c4lbYJ/Wc+XnQlnfdzSK9Mb2Ziiu/MIHp+G
         HGd0h9RPOGRWN9ismfW8EVD6WTDpGWa6io2uVFEwCe1hxFfY3DZFrpRaleLr7G0mbcMo
         Yi8w==
X-Gm-Message-State: ABy/qLZaoka8S+F0TL/JcKR7BUyNEvuQbOPWaEbBWZTh+LGsgT7H+Yrn
	gTiOoA1pUDVsPeXCq2gP922lyg==
X-Google-Smtp-Source: APBJJlGAM9s+ylKBZ7ENa9yuO0NicGa5hvMyehHWMw1AMAyqXxPn/1i1xulnaAcUNfJR3YVDzOPtCw==
X-Received: by 2002:a2e:b6c2:0:b0:2b6:df25:1ab0 with SMTP id m2-20020a2eb6c2000000b002b6df251ab0mr924764ljo.34.1690523498209;
        Thu, 27 Jul 2023 22:51:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w4-20020adfec44000000b00317614b6a5dsm3857666wrn.50.2023.07.27.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:51:37 -0700 (PDT)
Date: Fri, 28 Jul 2023 08:51:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v4 9/9] bus: mhi: ep: wake up host if the MHI state is in
 M3
Message-ID: <1399c766-791b-486d-90d5-a00999eb15fb@kadam.mountain>
References: <1689232218-28265-1-git-send-email-quic_krichai@quicinc.com>
 <1689232218-28265-10-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689232218-28265-10-git-send-email-quic_krichai@quicinc.com>

On Thu, Jul 13, 2023 at 12:40:18PM +0530, Krishna chaitanya chundru wrote:
> @@ -464,6 +484,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  	buf_left = skb->len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
> +	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
> +		if (mhi_ep_wake_host(mhi_cntrl)) {
> +			dev_err(dev, "Failed to wakeup host\n");
> +			return -ENODEV;
> +		}

Since you're going to be redoing this patch anyway could you please
propage the error code:

		ret = mhi_ep_wake_host(mhi_cntrl);
		if (ret) {
			dev_err(dev, "Failed to wakeup host\n");
			return ret;
		}

regards,
dan carpenter


