Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24614351C04
	for <mhi@lists.linux.dev>; Thu,  9 Apr 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769798; cv=none; b=aD0+oQvJHWutTeR7NuiIa6FPMO9z1fpweVHTPfh5KAKd4o3MljNDD5uUXpDAB28V26DzK8C275puL7ZHQp6PdW1/OW1QgqalzEdwEe586yK07C9iJ6w2i9iDes8nl3Gaik6pNoMf4SwVm1frhxJeGVcfTDUZX95Uy2Ih79qlEEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769798; c=relaxed/simple;
	bh=LPc3QBu+kJtrwBij2bSyr2bn3fppSoov+nAOiScxvNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQByw1XG1hiMwumG7UN9Dky/sg58cFPcrI1AsBVTfm4gywN0hToJ/fopH6+12Qtd8GQgGn/V3ztYe+viT0ZrjY6yw1RbmD86v+wM4w4PlbNicLdrc+ULAamUn8gr7oQIU5sv/hY3M0f82k7lhcIPDi2Frwp/J+3/80NNgD1iEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtPv8XsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FicGNmdL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtPv8XsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FicGNmdL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HkJoT2698258
	for <mhi@lists.linux.dev>; Thu, 9 Apr 2026 21:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSBXIIWfdwTwS8iiRQJHGI9PtTjv4IHRrGHbuBKd26c=; b=YtPv8XsWvAXUmXXL
	MzZUJC1E2rUDkiHda/ejZd/xqhij9t4SVRA/RZFldHUmjuRbcADFOZU3EYVSM3Ea
	YNpEso/Vx5MS8dZs9BvnmJFFS2Hbdb+tYhOdfsoep0HemYTzrS+R95Q4mX4o0O1W
	UxAVzZQFnELbMJK+VH6dBdqr9KgAb+2fl1E9IbJdSRniDBcskieWxwu6k9SorjeX
	gH1ZSyNCl+BCruBku+xwCTf+KrlSzKArZSzl5C/uK0bzXTeiU91J+Eea4M+3IeLy
	D31iKLibqQU6oyIQR+k3489iyfeeD8hJ+7U/uDLbwFZsRpFE3WmDOHQhusikn1/l
	doN+ng==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9rmd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 21:23:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c20d5d7f4so257699c88.1
        for <mhi@lists.linux.dev>; Thu, 09 Apr 2026 14:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769795; x=1776374595; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSBXIIWfdwTwS8iiRQJHGI9PtTjv4IHRrGHbuBKd26c=;
        b=FicGNmdLy5Sg/+dFvXUPb/OcqNRlCmifduuTsXRvNi02ZZbkw3MoCHb9EpZ3u5dab3
         uRSHoumMkWfE90OzZdgTjNl391bf9WfOwJQiLAuewHLlgvkgDmqh8q2brydo+9Wo2s/I
         eJEYDn0Xqu8Asl3+jdVxDlb023Ooq/RWtA7NdVZwCCmDji71egxcLeYUFVa9bLZ5RFdm
         jAtn/Qvf5NZctZ3gT4c/Dvyjwa0gpsZ7XyJ1SzoLsPxBGAY1//UWHrvRdZ5j25EtrUQA
         9d5hV7RfQL2kGWSGdvwiQ5zccdWh55beAjxzW2+BVc8/7lAg9hihvOsZJzzmi8AWrk48
         yh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769795; x=1776374595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSBXIIWfdwTwS8iiRQJHGI9PtTjv4IHRrGHbuBKd26c=;
        b=G3xRwlckBiZJdUw0SYm0U2HcBCf4kU0VxpnFDpPzPLeAVZ5E2QYRXsJhDTe/wIpb7J
         BTgu/9ftUVFGhTJTtEw91LD5rIYLfi6y9iu1lZ4GGIelxVK1LEkUpNyY/mJVNu7TZPg8
         S62s/mqKAFfYqPHkG49sxL7Koea3qPp+NsezmYbv022BFOSpLmAHuMOJ9kfy1N3SE90b
         vM7hSwuZPxEIEdrkiHuh3sn5Sm0TF5J/fofc6K+xbkuwD3+q6J1gpsV+Wqa+ahKx/p6V
         tKAbsxuO59HENGPELVcpQrSNi8AjbyaICga7r69wWmUh9uzQx/3vggyZOCzwxg1wieAK
         iSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxGeXxfn7ISV4QybGROqaPgOH5D0RY4u991XKdYswN3q/g/+G0FrXsyR6iAF2efO0nid4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1tbGH3h55P2eHNzdKdYPsIwp7TahAQqwVR3cRxnHPrx4uB0/+
	TOwJfsUh3xDAjyLrYLt6hhMUph+cpiJT69XELrpzaNS49x1qhgz6hBNS/aB6LROZm6tp04sfyVU
	0zaZ9vPZaDBII/36Li9P1yPeq+YFIrvmGsRTzX0MkFNammgBebWDZRM8=
X-Gm-Gg: AeBDieubB8M+uMvLeJ+ezQ23+3lcC7A3BuE7c8HB8B9PGI1yyVQj+hcjFhhvg3P2JdI
	BrsVRP5/2DQbrLpGVYA/TNwKtNrKvRGlubCYFasb0B75cq/kgdmTizGCCQpp7oUoV3iy+z/afms
	NZKvDQq/TFfz7DQMJDPIOrIdZ6RioW0hH1/qK1QQ6euj+E0kFefuTHfIkfXCWlCrEA3qIulVa6w
	lIOCxXk5V4tKSe6GUYwreKjnRCZ1WwCCmkqn2jtXao0QMhv73kjgMCq5BHb3vNWwnxa+8GZL+5I
	pQzypcFBI5ZzDNss2YSYfEJvJyBCLnzWY25WRg9b7pDKKrP73lXWkkhvT9cCEzdxDWSLJ46Mp04
	gpGwwSAs84nZ1yYwr0MQtg+iSTgT1NT19oJfATzaDnJONQka3Cgluz2ILL7LJQZqFRUHOq7H37h
	o=
X-Received: by 2002:a05:7022:60aa:b0:123:34e8:aec2 with SMTP id a92af1059eb24-12c34e4531dmr485662c88.1.1775769794928;
        Thu, 09 Apr 2026 14:23:14 -0700 (PDT)
X-Received: by 2002:a05:7022:60aa:b0:123:34e8:aec2 with SMTP id a92af1059eb24-12c34e4531dmr485631c88.1.1775769794383;
        Thu, 09 Apr 2026 14:23:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb26dsm907975c88.14.2026.04.09.14.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:23:14 -0700 (PDT)
Message-ID: <2865b4a9-9044-4593-b32d-39b581298edd@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:23:12 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] bus: mhi: Load DDR training data using per-device
 serial number
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-6-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NyBTYWx0ZWRfX9KFOPgaL48nH
 wbnmwSrmOM8wp6TpRQLr1zD7ay9gVfx4agVqMCFtDdwqZvpKkUNFIAJYY2T2EESat4AFIXqCrLk
 r5gdIWvDjnkAKymSLRsEXpcNOLliyRS5RHwmwNL/jmY3kDsPqqlghfl9FV4NAc4DxgKn0od3bIg
 mSmOKoYOy3680ZaW9kEYRQmKHKjLFhkBgMfruqjZ98GWSDpsnPo7jevYX9mcqaN/X696Dibgcwe
 sTLNSSvgA5k6EkJSzaR30HnI03mpUaOnO6p7jZb9qaiNIoBlLyzLbej8KFI3UIkV0s3fI3tea4V
 rK72ZsneFNT+wXzcsrjZOmOoKmodqiRn7cZofqW3EYb3fSVUYEj0J5J7gNnEEKSAGBPqNk6Ba/H
 8sibIX9MiMqX5wH4grcOKvL53Wv0tK+4B4RflKnDi4/u/K34NC3HcVNQ1PpRatjqBEvbrbk2Tjl
 P1WSHqDthznVTsnMKqw==
X-Proofpoint-ORIG-GUID: 5GtubPKtqp-R5FE4rz6ogSJgnT0szzcT
X-Proofpoint-GUID: 5GtubPKtqp-R5FE4rz6ogSJgnT0szzcT
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d818c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4fJIAEbhtct7chBbnB8A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090197

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Devices may provide device-specific DDR training data that can be reused
> across boot to avoid retraining and reduce boot time. The Sahara driver
> currently always falls back to the default DDR training image, even when
> per-device training data is available.
> 
> Extend the firmware loading logic to first attempt loading a per-device
> DDR training image using the device serial number. If the serial-specific
> image is not present, fallback to the existing default image, preserving
> current behavior.
> 
> This change enables DDR training data reuse when available while keeping
> the existing training flow unchanged for devices without saved data.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 47 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 4ea14c57774f51a778289d7409372a6ab21fea60..0a0f578aaa47ab2c4ca0765666b392fb9936ddd5 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -61,6 +61,8 @@
>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>   #define SAHARA_MEM_READ64_LENGTH	0x18
>   
> +#define SAHARA_DDR_TRAINING_IMG_ID	34
> +
>   struct sahara_packet {
>   	__le32 cmd;
>   	__le32 length;
> @@ -365,16 +367,41 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>   		return 0;
>   	}
>   
> -	/*
> -	 * This image might be optional. The device may continue without it.
> -	 * Only the device knows. Suppress error messages that could suggest an
> -	 * a problem when we were actually able to continue.
> -	 */
> -	ret = sahara_request_fw(context, context->image_table[image_id]);
> -	if (ret) {
> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
> -			image_id, context->image_table[image_id], ret);
> -		return ret;
> +	/* DDR training special case: Try per-serial number file first */
> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
> +
> +		fw_path = kasprintf(GFP_KERNEL,
> +				    "qcom/%s/mdmddr_0x%x.mbn",
> +				    context->fw_folder, serial_num);
> +		if (!fw_path)
> +			return -ENOMEM;
> +
> +		ret = sahara_request_fw(context, fw_path);
> +		kfree(fw_path);
> +
> +		if (ret) {
> +			ret = sahara_request_fw(context, context->image_table[image_id]);
> +			if (ret) {
> +				dev_dbg(&context->mhi_dev->dev,
> +					"request for image id %d / file %s failed %d\n",
> +					image_id, context->image_table[image_id], ret);
> +			}
> +			return ret;
> +		}

This is entirely redundant with the else in the next line. I don't 
understand why id 34 could be reserved for training data, but also be a 
valid image if the training data was not found.

Just have the if that looks for the training data, and an if that if 
there is no found image, do a normal lookup.

> +	} else {
> +		/*
> +		 * This image might be optional. The device may continue without it.
> +		 * Only the device knows. Suppress error messages that could suggest an
> +		 * a problem when we were actually able to continue.
> +		 */
> +		ret = sahara_request_fw(context, context->image_table[image_id]);
> +		if (ret) {
> +			dev_dbg(&context->mhi_dev->dev,
> +				"request for image id %d / file %s failed %d\n",
> +				image_id, context->image_table[image_id], ret);
> +			return ret;
> +		}
>   	}
>   
>   	context->active_image_id = image_id;
> 

