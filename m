Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33903D99
	for <mhi@lists.linux.dev>; Wed,  7 Jun 2023 07:03:19 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-33d0b7114a9so2957305ab.2
        for <mhi@lists.linux.dev>; Wed, 07 Jun 2023 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686121399; x=1688713399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C0a8avfFzH0/TInQubHB2hVwaExHDjSLG4xvPtND4CU=;
        b=LHsq68mf95DWCWd++ppuWTiawK11Jry7kEtCzsm76CLPe/e8BlvJvkRpnhDXwE4uVC
         DQgCPuwAOUeV6NiHCnI8qngt1W25tIhzVTY8WFNsN+QtFnOS83rKn9TS5laMuVP8cviD
         xQ+hCeVIKtAX3T9aG/Vq89aeihi0jMlY4V3Hsr/N/ZZwq4e8IBdbRKAOUnX3D6W7S70a
         1+B3FYjE3b6PPHepe/rE2Tz5PKSEIAa2oI+8/Z1X8Z5qHLIVlPmLK9cKSmTCi2+3FVpK
         fHs/48u7P1vZJ/prfi2TL3vF9WUgqhKDPQlv1nZ33gZpGIoha5JWobnHrFgNua6daTY/
         K7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686121399; x=1688713399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0a8avfFzH0/TInQubHB2hVwaExHDjSLG4xvPtND4CU=;
        b=SomQnZMn5KC7uYrqFVSswfjP2vdi6pTWz0r2TbXIKqLbfvfIIeFBOwoUuyk72W/8ZE
         gU8eICVJNsEMlCou8rg7lxbESXwGG25AKyKBfH2+7RwMEVc+vpcBV5lwToia5F2A6cr2
         tu7ZYMhegf0jv0uq6/JrzCb6ytrV+MgRe0388SzJ0XMgxOPcikUyOVuRmDdlSVgLYLwd
         ld4bF1xAsR8JZkWA4tW3Y+g+UvjuBEioXbMDFcUI9P0XID4Mfw3z9BZa+OGNlKwFiwOj
         flOg4SxmT64X5ogB5ig9SuySfADxo3mKxODFcKnDanPW1QZEPMMogleHlovSFLz5jmVD
         S+5w==
X-Gm-Message-State: AC+VfDy+Cu4K809US8J1WlWwL0w/f8pmC9EgzUhnwgYPu5sYm4hQbae+
	ioMI2qBf1NGz75n049XUsRF/
X-Google-Smtp-Source: ACHHUZ5Z9Ml/BXS0Jtc/0C8R9yTDCmZw3x8Y9UsQXo+MWMTYwhb7ZQ2anCJkU2RoEcoOph3aH3fOpA==
X-Received: by 2002:a92:dcc8:0:b0:329:bba2:781a with SMTP id b8-20020a92dcc8000000b00329bba2781amr6804865ilr.0.1686121398761;
        Wed, 07 Jun 2023 00:03:18 -0700 (PDT)
Received: from thinkpad ([59.92.97.244])
        by smtp.gmail.com with ESMTPSA id f16-20020a63f750000000b00528da88275bsm8423502pgk.47.2023.06.07.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:03:18 -0700 (PDT)
Date: Wed, 7 Jun 2023 12:33:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org
Subject: Re: [PATCH 0/3] Add MHI Endpoint network driver
Message-ID: <20230607070313.GC5025@thinkpad>
References: <20230606123119.57499-1-manivannan.sadhasivam@linaro.org>
 <20230606142227.4f8fcfee@kernel.org>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606142227.4f8fcfee@kernel.org>

On Tue, Jun 06, 2023 at 02:22:27PM -0700, Jakub Kicinski wrote:
> On Tue,  6 Jun 2023 18:01:16 +0530 Manivannan Sadhasivam wrote:
> > This series adds a network driver for the Modem Host Interface (MHI) endpoint
> > devices that provides network interfaces to the PCIe based Qualcomm endpoint
> > devices supporting MHI bus (like Modems). This driver allows the MHI endpoint
> > devices to establish IP communication with the host machines (x86, ARM64) over
> > MHI bus.
> > 
> > On the host side, the existing mhi_net driver provides the network connectivity
> > to the host.
> 
> So the host can talk to the firmware over IP?

That's the typical usecase of these PCIe based modems. On the host, mhi_net
driver creates the network interface that communicates with the endpoint over
MHI host stack. On the endpoint, mhi_ep_net driver creates the network interface
that communicates with the host over MHI endpoint stack.

These drivers work on top of MHI channels like IP_SW0, IP_HW0 etc... IP_SW0
channel represents the IP communication between host and modem CPUs while IP_HW0
represents IP communication between host and modem DSP.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
