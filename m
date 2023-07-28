Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAC3D86
	for <mhi@lists.linux.dev>; Fri, 28 Jul 2023 05:51:00 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so18227905e9.1
        for <mhi@lists.linux.dev>; Thu, 27 Jul 2023 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690523459; x=1691128259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSuglWWWuvnTAwFecP2fdurJw0H3jPVUPOnEpGUZ84k=;
        b=Pf+35Ea2+OP5qEt+XA1bRQIY1QwBMwcoOV0F1MhOgDlOtPmqo1Vl84lahKA+PwNA5p
         7MV1xJr76S9kyHKrotCUbiCMrdH2eNSZTrFl0Z9OVRJv4cHs54ff9UMiIyTiUS0aUdxE
         /MjHJBbmaJJ1L4I7Ka+yWZRh7oKeaGkPQiVED9tR8qZoUB1BD5979MgdCpYP7vEtbsQY
         BsRz5B+PmEUweiMqgAh+o8olOE0S2FIydic3R6lvXO3XWs4IJPOpGp0AQa/Mn56VpFWO
         MWO8cMxv4Lmd4W9Ch20KgCvZT2O/vYPh3PsoCsTcyrF/9bj1Z25Hntm1V8jFk0hJK41B
         kb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523459; x=1691128259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSuglWWWuvnTAwFecP2fdurJw0H3jPVUPOnEpGUZ84k=;
        b=l0ATvd5hvy1Pbm1gWZgOfMuYuRi10ImBkt2SueuG12W6b3/e4yx+5D9YxNYNm75Cwl
         jN7573dvZWrVVnwOqdYH8ZK6fOPGPMzln6s5NF1hoQI6wIhRwZOg4k1rJ7vIWzRnoDmu
         9riPJevmi99y5kB8thYBh0GC0Q4qBVWDjqB2CwDn1e2RDZN9ObAD1RUz2t1FHqOeEOWO
         iZAObAXvcBhD/uk2bYC7h87lRbLVo1J++9lW2k0XiZn8s+Ht17gz/1X/V4tn0Qi3bYdL
         ZdvMjtzyxgBx0kAczvoCnGv9wxeuXTPgiL6jNZKDE5aFeISFXRIpQKgdJh9P52zKZ56E
         Q3FQ==
X-Gm-Message-State: ABy/qLaWubXAsHjWxwmcl5QQjVr0UgPqiPmJaE6LVx8xX45caox7x15h
	MMhtENxkZzaT7JLml8tTleGM+w==
X-Google-Smtp-Source: APBJJlFaG8h7Fj0j7Unr5sC2nd3IjUGHzuPwquodiSKRNodcz43RwOaO6l+fbEz0F9h4adT+oF4H6Q==
X-Received: by 2002:adf:fa03:0:b0:317:7441:1a4 with SMTP id m3-20020adffa03000000b00317744101a4mr840161wrr.29.1690523458882;
        Thu, 27 Jul 2023 22:50:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r18-20020adfce92000000b0031272fced4dsm3835498wrn.52.2023.07.27.22.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:50:58 -0700 (PDT)
Date: Fri, 28 Jul 2023 08:50:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	manivannan.sadhasivam@linaro.org, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, krzysztof.kozlowski@linaro.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v4 9/9] bus: mhi: ep: wake up host if the MHI state is in
 M3
Message-ID: <15a19a2d-d6e8-4fbc-a31d-561cff00b01a@kadam.mountain>
References: <1689232218-28265-1-git-send-email-quic_krichai@quicinc.com>
 <1689232218-28265-10-git-send-email-quic_krichai@quicinc.com>
 <20230728043452.GI4433@thinkpad>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728043452.GI4433@thinkpad>

On Fri, Jul 28, 2023 at 10:04:52AM +0530, Manivannan Sadhasivam wrote:
> > @@ -464,6 +484,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> >  	buf_left = skb->len;
> >  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
> >  
> > +	if (mhi_cntrl->mhi_state == MHI_STATE_M3) {
> > +		if (mhi_ep_wake_host(mhi_cntrl)) {
> 
> Don't you need lock here in the case of multiple queue requests?
> 
> - Mani
> 
> > +			dev_err(dev, "Failed to wakeup host\n");
> > +			return -ENODEV;
> > +		}
> > +	}
> > +
> >  	mutex_lock(&mhi_chan->lock);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^
This lock isn't enough?

regards,
dan carpenter
