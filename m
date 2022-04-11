Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BE1849
	for <mhi@lists.linux.dev>; Mon, 11 Apr 2022 13:31:03 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id b15so14604366pfm.5
        for <mhi@lists.linux.dev>; Mon, 11 Apr 2022 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ledQ0Ydi6B8CWDPYoNTQwr7v3A4gfz4vdvCqzSKqX7g=;
        b=fth/YMFqdqkmsYAECvokOQ9m1OKQ/wuocTYitHeSDJ2GYhJIBMB5N/7A6isbrL44X7
         O5zp/7f5p9eRJ3iFFZKOJuuaU2wu/OZdUKCoCU5bojzuP0hWtXsK4FwRjX18xSYTMzXv
         rsvMUmGlvJhm1dQx1PF4neFjrzqx6QLRA6rbmpYVFtGoHX98sghMPPNWcEmNPiuhCE/k
         ZbdG5GyNITJLFNrQs4cNXdRlEbRr4e/tfAWTgxQe0pxiPigqBu7Lh0FpFkjyTswktOk4
         a1rYjS4rBQByE5MwcwVMNXWR+3T8McxTTViGrWG3ezbp6NRLBCxvd0xAZWmajWK1+54u
         XGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ledQ0Ydi6B8CWDPYoNTQwr7v3A4gfz4vdvCqzSKqX7g=;
        b=HwB8kRr/mGUcBHLIo633kjAbCL6kgvrmKuKEcNaqUc+gzdLgTOERBzDUR30vcCXCX4
         PkTFZVMZK3SMa4wz8r46uZ4MWrgBY49z0Bl2jckiauUlwhbLXx6dfOt3n5jt3xkWlNll
         TIEaEBNQeuMeT9I2bHCXwne0ZODvUqeY1LmPkVb9IZ2m1l2HnwotKmB/w1gAdd1qksbB
         RL7A9sR9z/HGKa2Ms/4G/7GfuvfsElgpL4VXbrgKezkYD9loUi3VTP8K24zbGIhl3KFW
         xOBjZyMfOmOEL7wzHxJxFdT+9vHrWIg4LO3JeV8nKwGgPjqQOZazd9uUADsX8kU1aoTn
         2SfQ==
X-Gm-Message-State: AOAM5309EGXCbL8VN76VBYrUgupa8xvXu15lUELDaA5/99yfuabYY3BE
	uJvhVHO9EakPjHCRHkVX3kK2
X-Google-Smtp-Source: ABdhPJwO+TjTZzMHsT/i6K9/3o2QsoDAcQJnb2SLEiCcwm/IE8cuMsvDvVdUcU4C7ipjf2wbQu1eEA==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id l13-20020a056a0016cd00b004e103667ee8mr32812580pfc.9.1649683862767;
        Mon, 11 Apr 2022 06:31:02 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id p3-20020a056a000b4300b004faee36ea56sm36126488pfo.155.2022.04.11.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 06:31:02 -0700 (PDT)
Date: Mon, 11 Apr 2022 19:00:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org, mhi@lists.linux.dev,
	quic_bbhatt@quicinc.com, quic_hemantk@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Sort mhi_pci_id_table based
 on the PID'
Message-ID: <20220411133057.GF24975@thinkpad>
References: <20220411054831.16344-1-manivannan.sadhasivam@linaro.org>
 <20220411123715.3640935-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411123715.3640935-1-dnlplm@gmail.com>

On Mon, Apr 11, 2022 at 02:37:15PM +0200, Daniele Palmas wrote:
> Hi Mani,
> 
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> 
> Shouldn't this entry be after all PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306,
> ones?
> 
> Otherwise will it catch all of them?
> 

Ah, yes. Will fix it.

Thanks,
Mani

> Thanks,
> Daniele
