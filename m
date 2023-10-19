Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912691A290
	for <mhi@lists.linux.dev>; Thu, 19 Oct 2023 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwEo/o0C"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7af52ee31so96973457b3.2
        for <mhi@lists.linux.dev>; Thu, 19 Oct 2023 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721078; x=1698325878; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mKyigxz0xjpNw4M9S8MD6bISZmwbP5guXuL2FXnbjpY=;
        b=ZwEo/o0CF9UlIFsWPYn8reOLrb0lWtfu9CsWuj39nM8K7p2rjnWBphYuy23JYEFAnH
         X0MT7IaSpAo9+EiCNWtbmkJ3sWszrUrTIS7pLvlmeo6fILOWKpKCjCKlxa5DN0cKnu/i
         cp7rWQEO354rIFCXqJL+4Mrw+JtTMiZaNqyG7/riDf8g65Ayh1UDtXLXTWwzuSas8XRI
         5oZNMAdNfcfJFil8bFjiynUeshY6g9mphcmF2HscRM22lmEjT7GjF73VCETrBJ7J/hTr
         BPbw1JU91rX/SpeOezGNSEzVHvx9Dzf+jxxwDtSRF9qAzvRg6m7NfaxFWLIdxHkhgYkH
         LUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721078; x=1698325878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKyigxz0xjpNw4M9S8MD6bISZmwbP5guXuL2FXnbjpY=;
        b=l00/z3QElgNLLX/AFYjiEmabVk9m73j1YpKaSU6gzWcb1PRjrnVrkiDqYITdJhCsbL
         ldA+wRF5P0gDggO/f9vxHm9jX6Rra5xW02MenUEsNTRuTZriRcwQ1ifGuMOb8Pl2jUp6
         kfOc6jnpirW+k+Mku2rSYvmI2LbRLw8NGpNrEf7zV/c7Mw8h7+HovY9ZPcEpXNYcOgl7
         vaSUhug35Q1XwzD1rHsxDr3yjX8QnBO3txHWumPzQtQ/IHc0gUeHDLYbV2lp9cBigGTy
         gVdh35YqxXxUXW3GEc5dNLVNDIugzIjn3DAP0e/2E15cia9l2tHTfh24aZiED4I9VHKF
         Dhng==
X-Gm-Message-State: AOJu0YxGXy45q0CkCe7BmRM5ocwpJXGh6mYezQj1u6PutqQw27n2XClU
	3WkQcsFLjbEtTOqhpwAI/q4ZyTxdMkKyIWahSqNzIg==
X-Google-Smtp-Source: AGHT+IFTDmViD4G59KbU+RTJg6WzdOrllTZxG71eprBWbjW7yf0Y2TxoOzGTmJh67kNKv4S5EHKdAM9I6+sYql2eQS4=
X-Received: by 2002:a0d:c1c2:0:b0:5a8:1058:5d97 with SMTP id
 c185-20020a0dc1c2000000b005a810585d97mr2524844ywd.45.1697721078519; Thu, 19
 Oct 2023 06:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1697715430-30820-1-git-send-email-quic_msarkar@quicinc.com> <1697715430-30820-4-git-send-email-quic_msarkar@quicinc.com>
In-Reply-To: <1697715430-30820-4-git-send-email-quic_msarkar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 Oct 2023 16:11:07 +0300
Message-ID: <CAA8EJpoAQbTT6KZWeD4_PSxDCG0tZ_PvGmUXxpAfHxrK5CAUcg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] phy: qcom-qmp-pcie: add endpoint support for sa8775p
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, konrad.dybcio@linaro.org, mani@kernel.org, 
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com, quic_ramkri@quicinc.com, 
	quic_nayiluri@quicinc.com, robh@kernel.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, quic_parass@quicinc.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Oct 2023 at 14:37, Mrinmay Sarkar <quic_msarkar@quicinc.com> wrote:
>
> Add support for dual lane end point mode PHY found on sa8755p platform.
>
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 37 +++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h |  2 ++
>  2 files changed, 39 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
