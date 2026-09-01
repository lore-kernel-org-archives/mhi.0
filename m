Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466040B0EE
	for <mhi@lists.linux.dev>; Tue,  1 Sep 2026 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273938; cv=none; b=nfUFjtn+Fz4W+//VOeMkyrYcN9TaJyZcSNhBxyR86KWCXPaVvn4QwvS+0QYnfgqNFRm9t3HoxYpmS2lMvT1qj2oDtPIFZcSnVT5EhUEiCNaTHrxOQcJxFEHlzGG2BGhQf1jGMI2Psn6NAuWbWKaa8vZH5xLVuNHh1J2R5LdjLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273938; c=relaxed/simple;
	bh=fKQMBvYKulAxw8GGhm1+J27XYbV4eVyJyPhTEapLLdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UA7vQjkMCNE+eHtgR+xMUNxi4jOfqBJ9mSGFSEaPeRAPwJXJ5TZQC0pkNuFRJpsXnR5nmBxo6+kP7ygF+ksvjwqac/9P2NkjbqxwI7/xiWrs9D9TSyT/+aLM7gNyPqW/NFU4TOCANiSY+qAVobZcOANJlhVVSIceYrM23QCNHpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iz4Df0X1; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iz4Df0X1"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1174398f8f.2
        for <mhi@lists.linux.dev>; Tue, 01 Sep 2026 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788273932; x=1788878732; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=;
        b=Iz4Df0X1DhZu01dmzGqcfcn342Lx6PIzQLnaFmbyziNgEO+xE0YipVzYpAFpPoPOsO
         R5VcZ3OOqTnEyIftJxmugxpl0F3KOgVWL8Gj+md2BLQ9NOEiOrFbYqJsrgBpzLgu0dGI
         BxLlecDaVNgV+Hg6tn0prSiaKyog9+i7YqUziFa7yTLjnZP8FJoyYxyvSBhg6Ilg1y4X
         IK0uTwwkQ1CNc53ByMSBA4xdIhL0bjo5XabInMGmBTNpPW8jtjF7i8hZ2JBJGXo9TXTL
         +QEfgnyPzlj+wwPAvQcL2vmJpKH1tkERucSMUet0nnn9M2/lMYHK87spWtAci9hUgp3B
         rN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273932; x=1788878732;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cMkyp7j0GDArFH/6epwRcq8HmCIf0xcPQczhEQvkqh8=;
        b=EEbyk4IYbYEeXvpZhPNI7LK85tZ2gx5jW+vtPe0KXeMzFzJ4+DmKoGI3h3mfA8wKDw
         otjxFGuwOU2sbLUaI+QR/FYPVK197LTHzu5DsYDKuqawCEdQLm+DwnLEm693wk1pzNN6
         HSRmsqOtfe6Mq7hluguTGtPEP82//ZOJ/CQwzr6rOlwWmE59WTwYtWbkFs5QsPdaEoS7
         q/fCU6hEoBOH/y7CmQfd091sztC61p0fjckhU8DZWnkJbPoCdn/kU7UHp66uGcqOUdJO
         vA9euvmXxYPY3qQ+pfoHe7bvOKybn6sRKmGOJYWGsT9W+w/X5jJAIkb2FgHgtw1Zdvuu
         fwDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbh/d/WTZU3hkVaI5lBk4IW2qDJFk/CN8QQfVbxGLpHxsNbqAaMHIy1UF5gSlg66U0oTQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mrUtscWZ4VkuKtmw8hzEZwpwPzwbHLh7M4nALcqqU6x2uTosgn
	LxgGVOyCliafvaOCp50ew6PObLAqxxAXNemku2U+m77d0YMQom4IN3it5EXQMe51/UU=
X-Gm-Gg: AYBFou0h/+Bl6dfM1xaBNSmlnGt/13Uyyuj/igPBI13kh2I6E3SyogIuNwmP4bTkVzE
	vDIfd7YMzv+8Yl/Yy+WrM3u5XeR5GxoCk/NtO+K3uv+Sfo7XAetipY3jBxpMjeEiG1uAQ8evbZo
	mvMjJZHkntv8O7I+nP6WTVonVZgVyPh+bJ5MCG0NYJ8qT586in4ojgT0pTMa5/pEMJJHj/TKlbc
	LBgNZ5hRiELc9yh3R5aImJLgbMtPU0WSrREdgFI9DV+X2KFRhJaEh3Kb/kx9S24BPbwkH5PCiRO
	E2LGUyB7BiymHpv2FyLXMUIdgnSmAUFStJv8xxl9MUFYN3Fkt1GLcvMDN4+Kk/KaixLDAH72cyR
	8pAQUaXRTtQMqAEpRiyPP9q6KARdFjuT8wIAfyJFhckBjQFztbPSvTYFCiI1/5Qxtp+QWHD5Du7
	In2Fw/+v/Xf1nM+kfQR4hwX0zU9ie+uRC/Kqz4H2FY6LSxcvWaoyIaXruPSBYhHjlX4LklOXRhm
	Z6hnZixoXnt/keo16ry2I515aRLtVct222SLxygoFA=
X-Received: by 2002:a05:6000:64a:b0:484:3621:6341 with SMTP id ffacd0b85a97d-48441011660mr15993949f8f.15.1788273932264;
        Tue, 01 Sep 2026 07:45:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3b72:e9ec:2552:5b90? ([2a01:e0a:106d:1080:3b72:e9ec:2552:5b90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d37111sm5175659f8f.5.2026.09.01.07.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:45:31 -0700 (PDT)
Message-ID: <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Date: Tue, 1 Sep 2026 16:45:30 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/6] wifi: ath11k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/19/26 15:25, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.
> 
> Bandwidth scaling is initiated by the endpoint firmware based upon the
> bandwidth requirements, if there is high bandwidth data endpoint requests
> for higher data rates or if there is less bandwidth they request for lower
> data rates to reduce power. Endpoint initiates this through MHI protocol.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Somehow unrelated, but I added this to the ath12k to test on an WCN785x and I just
got a single event to set the speed to 5GT/s and no further event whatever the state
of the Wireless link is.

Is there anything required on the ath12k side to allow lowering the speed to 2.5GT/s ?

Thanks,
Neil

> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 38 +++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index a6c9ff112c68..9bff4c4bca3b 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -20,6 +20,7 @@
>   #define MHI_TIMEOUT_DEFAULT_MS	20000
>   #define RDDM_DUMP_SIZE	0x420000
>   #define MHI_CB_INVALID	0xff
> +#define MHI_BW_SCALE_CHAN_DB 126
>   
>   static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
>   	{
> @@ -71,6 +72,17 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
>   		.client_managed = false,
>   		.offload_channel = false,
>   	},
> +	{
> +		.num_elements = 8,
> +		.irq_moderation_ms = 0,
> +		.irq = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_BW_SCALE,
> +		.priority = 2,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
>   };
>   
>   static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
> @@ -311,6 +323,30 @@ static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
>   	writel(val, addr);
>   }
>   
> +static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller *mhi_cntrl,
> +					   enum mhi_er_data_type type)
> +{
> +	if (type == MHI_ER_BW_SCALE)
> +		return MHI_BW_SCALE_CHAN_DB;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
> +				  struct mhi_link_info *link_info)
> +{
> +	enum pci_bus_speed speed = pci_lnkctl2_bus_speed(link_info->target_link_speed);
> +	struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
> +	struct pci_dev *pci_dev = to_pci_dev(ab->dev);
> +	struct pci_dev *pdev;
> +
> +	pdev = pci_upstream_bridge(pci_dev);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return pcie_set_target_speed(pdev, speed, true);
> +}
> +
>   static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
>   {
>   	struct device_node *np;
> @@ -387,6 +423,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>   	mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>   	mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>   	mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
> +	mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
> +	mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
>   
>   	switch (ab->hw_rev) {
>   	case ATH11K_HW_QCN9074_HW10:
> 

