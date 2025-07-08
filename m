Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386AC1FBEBE
	for <mhi@lists.linux.dev>; Tue,  8 Jul 2025 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751968080; cv=none; b=Hi1wKeDsPGO+CsElUuBVzDi59JnAe90vc73vRatXNiLeWiLZmR/zpHa9jP/oLWafzGNALak3a1jrdv793bLAMPqY9OzffDotdUTSVbO3tKDwgbcucOvemwsR+VgysSCbT+jnFDYAYGULhV509uTOMK9M5WziYiapxddDckWmxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751968080; c=relaxed/simple;
	bh=CP4SRGjBuWIbV/zkWEs61kqCHOr0mrANevngSd/vBGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVb5ShMUKFb1wIFxo1du1+zq9HLJdZZ7MOMQG3RBCVt/qAJeTd9UFuBEbrkRBqRk+vFkg7rvKaq1++uVrODSPQLd1rTp8N4AbCsNoCLuc/KuT7kfqJukyfjLcrNoYqsy2JYjjbinpMSQjJrYoviZd07H+nTFiY4ERUx9zpDjKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIUWvQKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIUWvQKo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5686fHol017546
	for <mhi@lists.linux.dev>; Tue, 8 Jul 2025 09:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njs/a9YmbrfSj8TquqSQGFpLy4CGvLcOR4JivFTYSx0=; b=iIUWvQKokSiVX8TB
	3rPi1zEiEhuAiEBDT0pmC0KkughyW6E13JZLbd/+VznBLC0EkLnLfiKqmdZCKCzO
	DvBVXnoEqTVv11A6wKupehF+UuTmkJ6Xc4ai9MrR9/73NxBzSHMQB3i7MJKP7oZV
	SqvpOFIItR4PUIJHCW494zdyWMoJjszqHoBaB7IIcF5g7X1S0BiDZXEjILKABz9H
	qtoclGmI8AB+9oeQNDkux/Rc54tKzoDSMbqTgWKuMbww/RBP34Eejxml0VxF4bXF
	Ybzs5r1GI5pDeiTr8CTbnx7Qu4GhZJ3CSCjDPK9VWx1e71BbUJcfs3fp2sAo0NKw
	MG3NFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97kx19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 09:47:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235089528a0so41291325ad.1
        for <mhi@lists.linux.dev>; Tue, 08 Jul 2025 02:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751968077; x=1752572877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njs/a9YmbrfSj8TquqSQGFpLy4CGvLcOR4JivFTYSx0=;
        b=sTBC/1CcLYUI8Z7Mcte9lkAgrqA1DB/ErPoMAn3s7PjphS79qtA9bhaSulU2/GQcX3
         QuYHoJZaxJi58DxWmBfUEzwjeLxxNz2WnV+k32e50pxwLQuZL9sPbx1NB/H8ewfrVcy/
         ljjwCzJxq8NndhpPp1xzXVfruLFVAW8jlctRVGpkMQvEk2hPDzY1JSycZmvVH307Bk/e
         DITzPkfr2JiXTDigsFx4ivxRbtbTy5bGvI+bp17i6F9uK5cmJR3ifKDm5/GNzdFnhouU
         0QdIX/GSiMAoHycUei4Ny/6d+Y9oj6z1hDMeaPWhHC04B1vCJSsdXuYUNuNaZimBrFzb
         +/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXNO3gUS+J1O+fp31oFEnIW8ssCOznelmEl0NaRf0EhWkv6Li9iFOpvuITBs2xYy5AJWhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR0FI9Tlpx7S062AcMbJ1A7pgHXzlvZ+5NBP/K0l4NFtHrKGCy
	GOoi7ozwrS0Y9cu8TfJNu5YGsM3zH5mD2PHyqYU63G4pgw/MqeWkPASRYIClsijEaFQP/KE1BGs
	+zxgbFnjS2Lg9aexGZO6X9Eld2Pkyp6eLrJbSJaTQthl9Ab2rPYgclmI=
X-Gm-Gg: ASbGnctICoSGZ8TPicOqV63ygr0eNXW+9n66QMfF3Bvat/WjIc9FRIHvGNppnM59ooG
	Y0r5qD5qzA7oorlAOJL2mZzT6LdpOuSAOOlxQNYnWhke4xI+/ehPHN5UMQIQ7yeGqwxEcB4glGQ
	m84u0Q340nAwvw00nj4FqWQfP41f/UNARMAEIjY6cAQJC0XzvXe49yRfuiNwjiBvjYj3lbX1BqZ
	4le6nZl32OGZawVF9f9nzVYxD/NHQuIsNiUeyiTQKdYbdJQS2W5grkH3Jt3yrLKvA5n51RQ1INE
	tWPjOMDXX7Tgk1vMEGLzJCwc4Wvt2GXkdZEDMM0QXKD8ho7jNDDC
X-Received: by 2002:a17:903:2c5:b0:235:e94b:62dd with SMTP id d9443c01a7336-23dd1b2834bmr33312345ad.12.1751968077189;
        Tue, 08 Jul 2025 02:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqQCn0zBoj5m+uABIv+hHMtgAY7o4x29kvnu/P7PJA1PO0G36QZYi2DbfeTjQzqaz+bQRXqA==
X-Received: by 2002:a17:903:2c5:b0:235:e94b:62dd with SMTP id d9443c01a7336-23dd1b2834bmr33312085ad.12.1751968076664;
        Tue, 08 Jul 2025 02:47:56 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455cf60sm104858925ad.98.2025.07.08.02.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:47:56 -0700 (PDT)
Message-ID: <b76cfe82-b977-4166-85d8-368539b392fd@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:17:47 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] bus: mhi: host: keep bhi buffer through suspend cycle
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Youssef Samir <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>, John Crispin <john@phrozen.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Cc: kernel@collabora.com
References: <20250630074330.253867-1-usama.anjum@collabora.com>
 <20250630074330.253867-2-usama.anjum@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-2-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686ce94e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8
 a=B232akhBMsyPXTXv-t0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4MCBTYWx0ZWRfXyiTLox0/VAMJ
 Yqh1PaIex9ACkXhf7Gb2f7AegD32iga6FHTytqNVhsFmiMrmCHSb7NUwK13EWb8jqU4iSTHgW2v
 RrdI2VXhE3Pn9atlVXUrG1DF01yPew5u1R+G8hyBsNaaOhreLIUdxffNugum7jvOwieyw1+buKL
 7BNIaZCTMAyxvQ0fQI/euG9KQqhAPv48Pk99SbR8Q1PZjTTFxGBT2oZYGb62WS1LaiHcGu6Uceq
 B579et5c4KYsWU8NequCISgoQw/T7x34661BIoVFn6OrkPbk6LwJobb/7lv02tCzBDSrqr8PdrA
 FfVbdqszE6PaXNbG2bjLY4urGFGo/jXzSXTUrPpBsUqtw5emr4sj26jxA6rRL3lWBOjN6nApCL8
 SasBhi9DL2Uys6/tX7O+wgM/MGK86AZck0ySWR/3sHjgjdQ2DN8eGrsKctAO9aU774/fe/lM
X-Proofpoint-GUID: QriyPqE4L-sJAUtIjFESVpA-84eVoQkj
X-Proofpoint-ORIG-GUID: QriyPqE4L-sJAUtIjFESVpA-84eVoQkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080080



On 6/30/2025 1:13 PM, Muhammad Usama Anjum wrote:
> When there is memory pressure, at resume time dma_alloc_coherent()
> returns error which in turn fails the loading of firmware and hence
> the driver crashes:
> 
why only bhi? bhie can also have same issue.
> kernel: kworker/u33:5: page allocation failure: order:7,
> mode:0xc04(GFP_NOIO|GFP_DMA32), nodemask=(null),cpuset=/,mems_allowed=0
> kernel: CPU: 1 UID: 0 PID: 7693 Comm: kworker/u33:5 Not tainted
> 6.11.11-valve17-1-neptune-611-g027868a0ac03 #1
> 3843143b92e9da0fa2d3d5f21f51beaed15c7d59
> kernel: Hardware name: Valve Galileo/Galileo, BIOS F7G0112 08/01/2024
> kernel: Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  dump_stack_lvl+0x4e/0x70
> kernel:  warn_alloc+0x164/0x190
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  ? __alloc_pages_direct_compact+0xaf/0x360
> kernel:  __alloc_pages_slowpath.constprop.0+0xc75/0xd70
> kernel:  __alloc_pages_noprof+0x321/0x350
> kernel:  __dma_direct_alloc_pages.isra.0+0x14a/0x290
> kernel:  dma_direct_alloc+0x70/0x270
> kernel:  mhi_fw_load_handler+0x126/0x340 [mhi
> a96cb91daba500cc77f86bad60c1f332dc3babdf]
> kernel:  mhi_pm_st_worker+0x5e8/0xac0 [mhi
> a96cb91daba500cc77f86bad60c1f332dc3babdf]
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  process_one_work+0x17e/0x330
> kernel:  worker_thread+0x2ce/0x3f0
> kernel:  ? __pfx_worker_thread+0x10/0x10
> kernel:  kthread+0xd2/0x100
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork+0x34/0x50
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork_asm+0x1a/0x30
> kernel:  </TASK>
> kernel: Mem-Info:
> kernel: active_anon:513809 inactive_anon:152 isolated_anon:0
>      active_file:359315 inactive_file:2487001 isolated_file:0
>      unevictable:637 dirty:19 writeback:0
>      slab_reclaimable:160391 slab_unreclaimable:39729
>      mapped:175836 shmem:51039 pagetables:4415
>      sec_pagetables:0 bounce:0
>      kernel_misc_reclaimable:0
>      free:125666 free_pcp:0 free_cma:0
> 
> In above example, if we sum all the consumed memory, it comes out
> to be 15.5GB and free memory is ~ 500MB from a total of 16GB RAM.
> Even though memory is present. But all of the dma memory has been
> exhausted or fragmented.
> 
> Fix it by allocating it only once and then reuse the same allocated
> memory. As we'll allocate this memory only once, this memory will stay
> allocated.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Reported here:
> https://lore.kernel.org/all/ead32f5b-730a-4b81-b38f-93d822f990c6@collabora.com
> 
> Still a lot of more fixes are required. Hence, I'm not adding closes tag.
> ---
>   drivers/bus/mhi/host/boot.c     | 19 ++++++++++---------
>   drivers/bus/mhi/host/init.c     |  5 +++++
>   drivers/bus/mhi/host/internal.h |  2 ++
>   include/linux/mhi.h             |  1 +
>   4 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index b3a85aa3c4768..11bb8c12ac597 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -302,8 +302,8 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>   	return -EIO;
>   }
>   
> -static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> -				struct image_info *image_info)
> +void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +			 struct image_info *image_info)
>   {
>   	struct mhi_buf *mhi_buf = image_info->mhi_buf;
>   
> @@ -455,18 +455,19 @@ static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *m
>   
>   static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
>   {
> -	struct image_info *image;
> +	struct image_info *image = mhi_cntrl->bhi_image;
>   	int ret;
>   
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret)
> -		return ret;
> +	if (!image) {
> +		ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +		if (ret)
> +			return ret;
>   
> -	/* Load the firmware into BHI vec table */
> -	memcpy(image->mhi_buf->buf, fw_data, size);
> +		/* Load the firmware into BHI vec table */
> +		memcpy(image->mhi_buf->buf, fw_data, size);
> +	}
>   
>   	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
if mhi fw load fails didn't we need to free bhi buffer.

- Krishna Chaitanya.
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
>   
>   	return ret;
>   }
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 6e06e4efec765..2e0f18c939e68 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1228,6 +1228,11 @@ void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
>   		mhi_cntrl->rddm_image = NULL;
>   	}
>   
> +	if (mhi_cntrl->bhi_image) {
> +		mhi_free_bhi_buffer(mhi_cntrl, mhi_cntrl->bhi_image);
> +		mhi_cntrl->bhi_image = NULL;
> +	}
> +
>   	mhi_deinit_dev_ctxt(mhi_cntrl);
>   }
>   EXPORT_SYMBOL_GPL(mhi_unprepare_after_power_down);
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 1054e67bb450d..60b0699323375 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -324,6 +324,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>   			 struct image_info **image_info, size_t alloc_size);
>   void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>   			 struct image_info *image_info);
> +void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +			 struct image_info *image_info);
>   
>   /* Power management APIs */
>   enum mhi_pm_state __must_check mhi_tryset_pm_state(
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 4c567907933a5..593012f779d97 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -391,6 +391,7 @@ struct mhi_controller {
>   	size_t reg_len;
>   	struct image_info *fbc_image;
>   	struct image_info *rddm_image;
> +	struct image_info *bhi_image;
>   	struct mhi_chan *mhi_chan;
>   	struct list_head lpm_chans;
>   	int *irq;
