Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371C1A2622
	for <mhi@lists.linux.dev>; Wed,  2 Jul 2025 03:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428262; cv=none; b=AdikkbEll4oiCm0S/OQT44QL6fcgL8qiYPYKrReC5SZxU7aooVozOcqz5Ha4NPD3mZPKI9m+Vy+OQdoSoXWcsLL3zwjYutYLyccIS0yOMzP/7KYtt/fxtlXmZiSomWIKpd7WPxKakH3H07eYwieqIGGldqz8pK+VZYKhRh4copQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428262; c=relaxed/simple;
	bh=Gbuc3GQ5YJqvpK3fI88NEhS8do1N5azsksWGgrAjPfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fR1TVSeYcv7c4KT7xMaLRq/f+/QaH1NHuVKkp62R11sPYVqlV15ike2/NOM4i3rOWbTsx4tXVPmXrkhNKWBpof6bVhv1f8r3MY3+hyEQjVGoLFjqf1FPmmHY/iJCfzHRd6tIKH0IM+lhkN191HDrhLCE78MlrU2UVabGjzUHObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEi30UPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEi30UPU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561H4lpG032109
	for <mhi@lists.linux.dev>; Wed, 2 Jul 2025 03:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=; b=FEi30UPUuoSGSfRf
	M9U5f/XhyVi/oUJ6zB5wflNxRDXDrApWQx1lDehRQjn8KmSxvQflv+4Cpoz8mZgT
	PPAU++VyU+CMsAlbqwV/FtWKlCfGdm3R7QWpNRGD2XZDp7AZbHFuKubOJFkdYafn
	qu/CzqXA7gCXNmA6CtNs+pyJmEvBuT9Ai41s0Q28hyLiJvrLFe+22B9fTQ3Ko4em
	ebX8SFOCZoGe+e2v8tCOlQ2aa4JngI8nlKjjxvIeNkJS6wJ5KoprBC5h4lC2AEtQ
	uusM6OyG9Pgc6pkZ7NKJGo51Jvkjc2Mxw7zZbRuKqmxTtoPM9UxlDIxYivGoTqSl
	ekaZNA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kb4w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 02 Jul 2025 03:50:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31e1ef8890so2731401a12.2
        for <mhi@lists.linux.dev>; Tue, 01 Jul 2025 20:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751428259; x=1752033059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B32luW0Sw1ltGtcSblfZe+j06KEyJ9zkhx3k4IlmlpI=;
        b=HTpROleRHHxBhWPHPp+tqEIYhXQwpfllzz9c2Evol4iU4GdG8BQd4GH2ftFwVdCSft
         Qon79c7DN6M5kmGaeHIeCPWN1/5kI9ZQTJjicgSD/xuMqhRBf2QJjJjN4UNjZGOTuc+X
         BX/p/U6mgiPAmMi8XkJlMXDtaXs2KZBC0M60Z/uAls7aVu6oh3d44jaRqjBoUErKU9WZ
         yzr9JH03MIAOSJhGhgyTuGjonU4sFrz1rE2RKCKPhnHrwQduJbgDzz+s7fxgGo2jptod
         Rjs80UeG13myufIbyzVcvy9rAqwQ8xSq6P618OIRezlpNyIFKc1rio5OeQA0MjmviqVc
         HNfg==
X-Forwarded-Encrypted: i=1; AJvYcCUPPt3DtzYK19cz5VUCbr2aDHBMrKrwpxYbfyY4RLWw3FaBp1a/tS20qMpa1kSQDKWKlD0=@lists.linux.dev
X-Gm-Message-State: AOJu0YykzExCkc49s8gdGG34F2ux+9IaKjWJ46jZd7QapDJSOnwn0pfx
	NFA1V0Qgr0PqBXLMZj8uguC4o3E6qhCLB0K6nEb9XFhzYK/qJZYlH6nyUtip1FeL98olxhs6pyi
	e/esVFDghyZoJbH4WFUIoN9os41hMcWNoOKZIj8hYYXnLDwxWYyXUFBM=
X-Gm-Gg: ASbGncvgspF+hXPzZWAx6s6p8EjKs/604Z7iMgsfbtu5388+Z/iP8jleHbNEVOwnLqK
	cibuNbnQt5iRKkx6z5DnG4rn/srW/aSPWEpG04ISt6r0tDSc5I4sfHnvtTeskikGl/kbFQ1+uI4
	18YVeT0LLKBMBIS7Tqt8p58djetpZnBLBgsPZJSsbepfInApRL1OZKKJnEtf5gLyGy9HzyJ2QyK
	ieorN2hsiy09VHc88iV8mNuYRUSJVOky0RVH/cZklVq3QWmkTJew8pHkJll5bp6MHO+Gk5aZ3wK
	CVA7wbKGikFgE2P0hCyWJ5uqzoha3uSv2veh7S9/WAZaREJpF06ZPD/xo9p0v9WU9ttw4VNJhgg
	tgjqteWJZclFS9qo=
X-Received: by 2002:a05:6a20:7350:b0:222:c961:af1d with SMTP id adf61e73a8af0-222d7dc49eamr2846936637.8.1751428258819;
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8idSmfFKyDABY7yM0MVRpAAZkjEtC9DI11EGGNuOUHqgZpQyGDn56ZzZiQmPlDfFVsxkK9g==
X-Received: by 2002:a05:6a20:7350:b0:222:c961:af1d with SMTP id adf61e73a8af0-222d7dc49eamr2846895637.8.1751428258347;
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
Received: from [10.133.33.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300994asm11767768a12.3.2025.07.01.20.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 20:50:58 -0700 (PDT)
Message-ID: <5f2a900a-3c8e-4b16-bd91-500af7d0315e@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 11:50:51 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] bus: mhi: don't deinitialize and re-initialize again
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
 <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20250630074330.253867-3-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6864aca3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=UYPn-Rg_fxiY8il1LgUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDAyOSBTYWx0ZWRfX6bc70CXVbzvD
 iPr9/+4yb9PNvIQxfeJhHS7qiPPxYxkLs+LM1Z64dACd4z7q07buExnorhfbzdFU+LJMULdfJkN
 oE8IwfXhLKH8QKFFmFMOUtExmLpx21um4MTG5qmYFQEyU00myYOysl/6muBh1obMD3od4j0DS3S
 peN2rhemrwKv874faxlQUzDIXWrHt4LyqP7O8RrGa1MTp2b46MY2mnUtHrw9mD6z2R1pF8DJZIm
 jRnGYUY4zR65yjmmLvCOQqL/pF/J0EhQk3eTnnT+o33x/9XGAwWbHETKyEcLMt+cUNCYfcraMAt
 n8bxSGoUlFyuHnbuqI2eITZicvKQODFQRv10HVcYV951/h+STJAHh+FfoZL3+ENEJEPjKDox1BS
 A9/SWJBIRn1W5dLBxKiHSZTSuMoEg61gaDKvb2fqYukee2SsRCU9IR9PPW7I2GWboERZxxRT
X-Proofpoint-ORIG-GUID: tpzGCprobVbk6mjDM5d0KFqbfgruAzNZ
X-Proofpoint-GUID: tpzGCprobVbk6mjDM5d0KFqbfgruAzNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020029



On 6/30/2025 3:43 PM, Muhammad Usama Anjum wrote:
> Don't deinitialize and reinitialize the HAL helpers. The dma memory is
> deallocated and there is high possibility that we'll not be able to get
> the same memory allocated from dma when there is high memory pressure.
> 
> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 4488e4cdc5e9e..bc4930fe6a367 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2213,14 +2213,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>  	mutex_unlock(&ab->core_lock);
>  
>  	ath11k_dp_free(ab);
> -	ath11k_hal_srng_deinit(ab);
>  
>  	ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
>  
> -	ret = ath11k_hal_srng_init(ab);
> -	if (ret)
> -		return ret;
> -

while I agree there is no need of a dealloc/realloc, we can not simply remove calling the
_deinit()/_init() pair. At least the memset() cleanup to hal parameters (e.g.
avail_blk_resource, current_blk_index and num_shadow_reg_configured etc.) inside the
_init() needs to be kept as the later operation needs a clean state of them.

>  	clear_bit(ATH11K_FLAG_CRASH_FLUSH, &ab->dev_flags);
>  
>  	ret = ath11k_core_qmi_firmware_ready(ab);

the _deinit() is still getting called in case ath11k_core_qmi_firmware_ready() fails,
making it a little odd since there is no _init() anymore with this change, though this is
the way of current logic (I mean the hal is currently deinit in the error path).

Thinking it more, if we hit the error path, seems the only way is to remove ath11k module.
In that case the _deinit() would be called again in ath11k_pci_remove(), leading to issues
(at least I see a double free of hal->srng_config). But this is another topic which can be
fixed in a separate patch.

