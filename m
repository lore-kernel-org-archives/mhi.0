Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284521842
	for <mhi@lists.linux.dev>; Mon, 14 Aug 2023 08:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56655C433C8;
	Mon, 14 Aug 2023 08:14:40 +0000 (UTC)
Date: Mon, 14 Aug 2023 13:44:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: helgaas@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_vbadigan@quicinc.com, quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com, quic_parass@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	"open list:MHI BUS" <mhi@lists.linux.dev>
Subject: Re: [PATCH v1] bus: mhi: ep: Clear channel interrupts that are
 unmasked
Message-ID: <20230814081435.GA9011@thinkpad>
References: <1691747849-15385-1-git-send-email-quic_skananth@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1691747849-15385-1-git-send-email-quic_skananth@quicinc.com>

On Fri, Aug 11, 2023 at 02:57:08AM -0700, Subramanian Ananthanarayanan wrote:
> Change is to avoid clearing of interrupts that could have been masked.
> 
> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>

Is this scenario possible in real life? We unmask all the interrupts during
power_up and later mask the interrupts specific to channels when they are
started. So I do not see a possibility where the CHDB status would be set for an
unmasked channel.

Looking at the code now, I think we can get rid of the mask check, even the
local copy of mask if there is a guarantee that doorbell interrupts won't be
enabled behind the back of the MHI stack.

IIRC, I added the mask check as the HW channel interrupts were enabled behind
the back. But that was fixed with all unmask during power_up and mask only
started channels strategy.

PS: The term "mask" is horribly used in an inverted manner in MHI.

- Mani

> ---
>  drivers/bus/mhi/ep/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 6008818..a818781 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -867,7 +867,7 @@ static void mhi_ep_check_channel_interrupt(struct mhi_ep_cntrl *mhi_cntrl)
>  		if (ch_int) {
>  			mhi_ep_queue_channel_db(mhi_cntrl, ch_int, ch_idx);
>  			mhi_ep_mmio_write(mhi_cntrl, MHI_CHDB_INT_CLEAR_n(i),
> -							mhi_cntrl->chdb[i].status);
> +							ch_int);
>  		}
>  	}
>  }
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்
