Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A92355023
	for <mhi@lists.linux.dev>; Tue, 11 Nov 2025 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858482; cv=none; b=K6DYgCYWYtlp1/ugms5XyEXCqNaXMbaJaznrkhifVkLCRQtFkaMDto53AmKcZ2FYckaJQ0x3QxGKgWEp8cYOjaGgSP6/0CsUqAUwCqIoCxFolMFdxXqsnBVCHh1JQ3mXj8FxhiWVxXlmAOvvKwQeVb0XLq6YXNWt9J3G6riBJFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858482; c=relaxed/simple;
	bh=uX2FRXbwwZCCv1tYbHwS7dtnDr3CH51sdbhNp9wWUD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTi2o3wGm2s1hq5GdwRj7eIG8M1kB23LgDUFV412yWZyxj0Id72RvLrrSG1Y54YOv8NVrX08jXFKOvm7T8vKek5o5mQFCChUVNjFwXhmXz+C+p8teyb0Ql3isNEiHfKaiboznXNy0lvoFDw28amZZd46SssKHOrMV1oEBVYuXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZE9KAt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrHlw5Q5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZE9KAt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrHlw5Q5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4so5S1327083
	for <mhi@lists.linux.dev>; Tue, 11 Nov 2025 10:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bjzJGvDc5zRS1OfTZQSifCpq
	YpVSEVlEOhF0L9KjMqA=; b=VZE9KAt0/uqTpHpUQlsHtUrGzV2Xaiq2acFdXg9B
	0Oldk1XNUX+M1FOafQpV5D6QJ3w7vkE3cuvA4gyK0ZaWgcnfsbRbLDqWuydJgUSD
	TUwTc7wXaXDRna/cAp+lomRL8nBE5FmtQokVflqaVpOufdXbfX3PAdSl1BP+qeQ4
	gInKNEuGfpxRdqveezwIyNsQoWkxys2ksQh2mu0KL8Gc2yIArPBAgMObTxnc8o6H
	CUq29WUP4BccXcwNsc72oo7yfgMws46TrdCv0uPKImHQyhKAEr1EV5Kw8B2uT7Ct
	Kr4hhxoosmF8uKkkZZhjGFGSDyBAEwM7XSB48SLrxiDYDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhh177-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 11 Nov 2025 10:54:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb84fc9bbso21920471cf.0
        for <mhi@lists.linux.dev>; Tue, 11 Nov 2025 02:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762858479; x=1763463279; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjzJGvDc5zRS1OfTZQSifCpqYpVSEVlEOhF0L9KjMqA=;
        b=SrHlw5Q5sfWdym+GKHoXZqxUrrZ+PkafnKgx7mqQIqHfeGeySNTUObRrk7Kx3zRYea
         Pmx1A6EKM19jF48az4Nzmx1z0WHdXau6pr2D48fWKolNnJUp/tHh9Tx20SmGmcs+ZJDL
         9g9wmaUT6P6rHxgHofpyPS/YpVmqpQHXiEqLveHkFG1+QLZks5U17FRaidAxSyPvk7vO
         7kJpOUvWKphl559aMRLEPfOvEU9tFWXO2ZX6VOtUgkInqSO1IgmFpg6ubiNSxoFhpvBl
         FE6m9+uK5aWLUyh8nElGd11OThiFpXSpupP0hvq119dETE6en3lu8SBjG0+MOXisciP7
         VxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858479; x=1763463279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjzJGvDc5zRS1OfTZQSifCpqYpVSEVlEOhF0L9KjMqA=;
        b=bBwGALgyzbAuged2NRQ5kKJkyp+CuBT1z/l6DKkQPVC6b2pB/53ZYSAmaK3WQKueDQ
         fPJ40YUVdOt2kWu7TsP8CRwReCemMO1X0QnG61jdh9AeznhassvXp9+qOPpBIg9h/D8p
         PTDRyHn/6UkF4IwWvmoiHJb0hM9D5k3rRvIbHWyU5mM1eamfmciW1BrgNgEk0hE48Veu
         Nuycf2qP4v/BxDE52Qnr8eWtLr92EPRY+LuOF4SeqsjNYS0MElvnmX0cgzr+8rxjN8QI
         tdjC0lypK+gfrAK9iI/xoi23BAdHYRACWFCHVIMbqhNCBnbiNPAiO2QDL5TU+hg8S1wq
         pqyw==
X-Forwarded-Encrypted: i=1; AJvYcCU3hSPlqL5CWigJ/xqrdbdlThz3DGebXcBVXXoXXFrI3conHHPO10JM6TkgpUr6yCIiLbg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+l3LZN8RRVdY4GBF2HMmDB470P4/Ru8SHYzn+58Dj/0BwAoc9
	peycmhbUynPA8fCxuStXBnH9fHardboODQlZzqy2/PFnHGjEk3Dkqv7l+DiZ82AaYydUL6Qcjh1
	8zCEFJuYFK9PHTCVNFKSUev/jGrNwFlbkkNcs/Ilj3g2bW+9U9he4hbU=
X-Gm-Gg: ASbGncux1sCfAkYs63uuHyIqOtUja+jPsrfL16aQpnvOJie+cEYjIMIY64mSzdH4ip8
	oGOLL1oOfrWU3MdXN5V0M+SYckxYGRUgDK92FjlbHMAqXVxtiO2dhk4ZHPac2UuMD/SVb7JYfh7
	qU66Y9VoV64EwpDXSJTjs6KBv1db+Rr1IzUYyDgas0EFXTcMSziDReqEAVkyZivpzHn4560Qh9G
	OJeTmuuuTLbxoeQ/GG28YqbYlfi6VT4p3sTtxG5t8N6VJYPksRoa0opFUnhJcMKyZ1EFh6YMWzj
	azP+gc/47enAXMVxIGT+nDOyv1oQhw2n6xeYD410y7l1y4z9mp5RJLti3KRK2/zUaC1SoG74JDO
	VJ+ekO4ysLCnOFxY18WgdXwcKTYYPG2HPtBWWIgXd4qiwgM7fptBf3dWmxIzRxLy/+lO+2b5gZ1
	KT339P3iI9Ydua
X-Received: by 2002:a05:622a:188e:b0:4e6:ded9:6b29 with SMTP id d75a77b69052e-4edcaaa3ea4mr32888481cf.3.1762858479495;
        Tue, 11 Nov 2025 02:54:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlDf0js8yY75bKRYmabDEAq0elXP2pI/iZd6RI90nqeKsx02RoVZL9jJHhTzE+f6l/HKMiwg==
X-Received: by 2002:a05:622a:188e:b0:4e6:ded9:6b29 with SMTP id d75a77b69052e-4edcaaa3ea4mr32888181cf.3.1762858478897;
        Tue, 11 Nov 2025 02:54:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b74b6sm4784539e87.64.2025.11.11.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:54:38 -0800 (PST)
Date: Tue, 11 Nov 2025 12:54:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 2/3] net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
Message-ID: <ljrvtl447meb34zfgzef3dw4oqfp6j3ixxwoooewxxvqsi23tz@fbg4zkpctddn>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
 <20251106-vdev_next-20251106_eth-v5-2-bbc0f7ff3a68@quicinc.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-2-bbc0f7ff3a68@quicinc.com>
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=691315f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bC9JWDkrhmRD4PJ24AEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: rz1-nQ_tj09PTTmX3La0329Y-htQOqLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfXzPK0+1C7Nr5q
 Nq/kmbuf5kwag4w4cFUO58ow5B4QaDWZ2rb5OmTrmy2JmHX5D72q/vOPPzIMTacC+/Jphp+yk48
 3EtzqoWefJZFHqbfFRnHmGEiWwB4Nz3WP0SczjZg1RiShKOK2WFs7bQ1KB47eB0y3uacJ6XeDCO
 LGjoZk1pMDWVbSxNc4VZyiaIqtJT6VBKtQxUsjI98vSI2D4JVD14LklohAyjyAlcLzW2hRQ6P8d
 XQkD4sZDkiSrI7sUEikGBV9QZDX7YlU8sk3AtLPPwtsVAOsbWNOR4O/dzv/tWTgusUcbMaXbU6F
 cUKZXlN5Fs71v+G7idltZpKupuV51cX7s6WzxIaMC/PS6H1b3JjERhAMUHhuW6dmnww3CzOr7t8
 VcHdt0dV9TkxP+tereIofTJzEd9KuQ==
X-Proofpoint-GUID: rz1-nQ_tj09PTTmX3La0329Y-htQOqLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

On Thu, Nov 06, 2025 at 06:58:09PM +0530, Vivek Pernamitta wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Add IP_SW1, ETH0 and ETH1 network interfaces are required
> for M-plane, Nefconf and S-plane component.

This is a very useful, totally uncryptic message.

> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index aeb2d67aeb238e520dbd2a83b35602a7e5144fa2..7fca7b1ec7b8250fca5b99ba6d1be470fed87995 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -449,6 +449,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
>  	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
>  	/* Software data PATH (to modem CPU) */
>  	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
> +	{ .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
> +	{ .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
> +	{ .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
