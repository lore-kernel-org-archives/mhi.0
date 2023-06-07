Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F211ACB5
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 14:56:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b01d912924so69100355ad.1
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149803; x=1688741803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/8N0gSaOfJ2+iPgCykIKtJEIBruFOuP2BSekoV+jGac=;
        b=XPoPdqNAA+maAKafsTiOfSoXt9pZvdj8FOvrnFoztfJuU2HX4+F6LJO8TFgm+5rePd
         1IXyh0M5zvR71jJUBXxsXeeqrPuGjPDajCHZMFjbJZr17bFPrkxNGTRrx+UYgk7ulG+D
         8TN63BR5vE9yhwTXiHoth+AIOD2G8v5pX84Wz/B/c7VOEET22YzTwCVWbav4gyGQ0qEU
         EwnZ6p1qNa+5Ms7vtTUge4c1/UYnRn9brjQJDeri5DZ+SbT2ZEpWPov5EwudTzJEfGiW
         Fpb4k0KBzZ0yMJxqjvBXdQTxmTkCyedR7GJ0sG5NKprINyRH0cMzEk7MSE17IIPLYnpX
         6BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149803; x=1688741803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8N0gSaOfJ2+iPgCykIKtJEIBruFOuP2BSekoV+jGac=;
        b=RQk1/I+tgm62UfIHJgXIDHnOmp1DqBKJZ+vTcp/qs18MKmht7mOefeevg2qKPQfu9X
         t/Kh78dAmN3oobIkMxPHyctCwrko3P0Drf6LUwAzGN1W2aYgB4yHrQrZeY3//Jk5Sh6c
         /eDV0RFlJq2kd2h6GlYXMPGoN96Qpg+zmO8/sECB96OzIQ32mEvbIlpGBi2mFZITSXma
         esVDuZ2k6WcgkLzogtWizc7BqjF8ntAEwJGx1Gyucn5uBKbSRAHqpxOb88LGQZMbCjvz
         GYizelcOvSXBijAGe87pKH+Xhxcm2edJ7CJXtUDdQht7WhERIY6FVtOLp20F0OrmO3w1
         q46g==
X-Gm-Message-State: AC+VfDyFB8ui79HnLY/hCuAlv3cA1tO1arB8/lKTlBudzGqFdLMaPANf
	7ouMq95M7QPxI3xAf6zMMjxY
X-Google-Smtp-Source: ACHHUZ5V+hBDwNNGVzLSvr6qyetGCLP1NSULs5tOPW6A/VkRv4ZISCL9y8DAAbyQrdYbu/FxS10I9g==
X-Received: by 2002:a17:902:ced0:b0:1b0:7739:657c with SMTP id d16-20020a170902ced000b001b07739657cmr6692548plg.55.1686149802732;
        Wed, 07 Jun 2023 07:56:42 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902f54800b001ab1d23bf5dsm10543852plf.258.2023.06.07.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:56:42 -0700 (PDT)
Date: Wed, 7 Jun 2023 20:26:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org
Subject: Re: [PATCH 3/3] net: mhi: Increase the default MTU from 16K to 32K
Message-ID: <20230607145637.GA103098@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <20230606123119.57499-4-manivannan.sadhasivam@linaro.org>
 <b8a25a70-8781-8b82-96d8-bc1ecf2d5468@quicinc.com>
 <20230607065809.GB5025@thinkpad>
 <f96d4956-6b69-4809-9461-9157e32b3865@lunn.ch>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f96d4956-6b69-4809-9461-9157e32b3865@lunn.ch>

On Wed, Jun 07, 2023 at 02:25:50PM +0200, Andrew Lunn wrote:
> On Wed, Jun 07, 2023 at 12:28:09PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jun 06, 2023 at 07:50:23AM -0600, Jeffrey Hugo wrote:
> > > On 6/6/2023 6:31 AM, Manivannan Sadhasivam wrote:
> > > > Most of the Qualcomm endpoint devices are supporting 32K MTU for the
> > > > UL (Uplink) and DL (Downlink) channels. So let's use the same value
> > > > in the MHI NET driver also. This gives almost 2x increase in the throughput
> > > > for the UL channel.
> 
> You say here 'Most'. What happens on those which do not support 32K?
> Do the packets get dropped and it turns into a black hole?
> 

Yeah, and the host has to retransmit. But I checked again with Qcom on the MTU
size and got a different answer that forced me to change "most" to "few". So
this patch is not needed for now. I'll drop it.

- Mani

>    Andrew
> 

-- 
மணிவண்ணன் சதாசிவம்
