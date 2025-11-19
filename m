Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48395346E73
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551673; cv=none; b=SIu6vuZVzsYOC/NUfX3K94T1VKsLuPw6p5WvF3FrfKv8+a9wLn4PRgyb2NmMmfC5ID61YdE1U4JrS9+KaAXeQ+Alc7CS9f7keH4yto09joWUvVlcVSB1klIw/xTU2H7dQIe11Q9nwno20LggIHLoOUfxnXRUihTW+n6z3liUFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551673; c=relaxed/simple;
	bh=eRPVVHGIz3DHYU1O7ZOYH/eQeyBRv9Sfhbel71R8gsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhDm7l+CDsztsY25P3pXcvb+xikqko6V/TAX8pH27nr46E6oAXbVf0ypkX0DXWC8IOIePoYMcXJqtCKD2bNHHOATAC1jjOUZjOu1Bnngp5bC/btVYptyvkMiJ0DQXNkOhK26BgAMhz/u6IGfUeSFFmjy/x8OIhk4GFc0aZYaDro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWHf2y5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQAgfOrK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWHf2y5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQAgfOrK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJA0kFD3165017
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 11:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htjqet1z8r5meoFg6hkg4pYc
	+osGI5Z3qXMT5iYRGBw=; b=AWHf2y5rVWlQhegBtAH96wfWD7vy1ku4Now4oTx6
	vOD5hF8mqIude6iQzXH3prNU8uewBtuOqEnuAdtzq1PVaHVRqO3kU9Dhsw3lVODv
	eGdNSbmaEF2P7Xs3gJiUx9YIyOOaVeG9SIijl7FaCoONfUZhgKVi5J+vYvMAqzgr
	CDWA3HYZP184KnWX1tvvMTm+bGyeINh4fIpG7Km1HwusPKGskNkEPUbH7cZW9Bn/
	3ojbNqT9ipm+y2uoGWJ6ml0twpPEBrd6RkzEDG4YVSjbqXLf9erZfrRCyRrzDPGl
	F9iz1AuDT1dIaAbvbQ0bSdWtiAOWvgDJGT2i5j/OlPsjjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgu03g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 11:27:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-880444afa2cso79495136d6.1
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 03:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763551670; x=1764156470; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htjqet1z8r5meoFg6hkg4pYc+osGI5Z3qXMT5iYRGBw=;
        b=HQAgfOrKI0nmsTCPpQY6/45gWqUCkzYy7st/pBzoJhl4Vf+/gafGSUqRnAksF+h6SJ
         shh+kwm3Ztc/GHt1iwrW4PCN425EFJJkFPIEMj5MBKR2eXEWpdTc9P9eN/Lb4nhBT3Xn
         dXTU+XzO9ZzcgklZs56MwK4YfGYoCyBLojmFphh1RIOYJsWgmPTeJZZ/xhbypY4dc8EK
         RMoHYDuQMyuDlSinDVz3ASK5pJgSoGSlog0AKtgqPVjQ9lSS6Z/hcJKjADsvC5GOJ91e
         2nPh8dmy8gxhM0u37w2cBfiLDal14V9sigTlZUVoJPonjynD8okq+t2y0R4RT9nJ8qW6
         zpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551670; x=1764156470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htjqet1z8r5meoFg6hkg4pYc+osGI5Z3qXMT5iYRGBw=;
        b=KZaI/11UQFA2aW+3DbYst7tsMZMsBkX0SlaJzl9Ok8/J2Y5OAB64dg2Qi9F9g4BwqE
         Be7dTACsVJedyt7tWFr1I54iJC7O48Au43ME/9e57oQtmGikNTnSCI6H3oRNJzM6zxC/
         y9Kby/E3yy6+HdCNewNEWZRruw27Ha2YMvn27kXTSujq4n/p4c6e4RRkwPF4W75vDxar
         TciAe8mmsDBgR+RjcyDW9kpT/bqyPjXwz3/x+r1MGbagjfj7W9Cl/bSkYseH8Ruf2j2/
         nLvOFLar6vzdNMF2bK5kJoGK/lqHJ2S1SuV+IQ1yIPJHTyNKOi7W73Dbsfq3fCCG518N
         OxmA==
X-Forwarded-Encrypted: i=1; AJvYcCWwWccCQYrBPZUd9qFhAtv0MsjiTkYaXREzk8Bor4T/uyFG2NifA6ePShNyJ7dVL++IW/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzECGMOKJmn6D/bY43EN8bWrcV45DZDoPls6qY+5m/C4UmYznUR
	RXZdtIGkkcRPhs6QQL+cJWcdg2lRC2WTMhjDDkUNfvrZKSM+miA8iMIkqq/MpCqvDAaSg6pkvbj
	/NHctI6C0eR0TlTTprkqZ3EDb5DXoH5mbh9Gj57xhUoUi5jF4Jeh4NKc=
X-Gm-Gg: ASbGnctzu018HTwVIw8iDlVtH3oqNQIVaawwZIcLGvWEqMAEMtK73Fk1EPZ8HivlGJX
	wjEVWObM5MpO2ihcezXU9Es9HqseWznIj+Is4IdIKr6vMWLTH/5tTHHjMM+IMSyhNdtO6rEmdZU
	8a9wsoILOd2GQ2zL0mVOjVHV9rpuz9W1W394ozaqxgEYcK+wJokrIcIQMNahFHwCpUeefJdQRbd
	gjg0Qr7lchvb2DTFSqJa15tCVhx/J7eqUQuElH13W12U4b9Gz/Ut5d4REnUVGH7olVxXXrg8R2g
	oaYZWtttrhMwR3l1i0u0jJ5X0z7MRGgKvRZdHgZwyyzZ/vAUqUtvAN0+94jDmIDwrvLi0/4MdFe
	+uYRcnS9lZdxCWasBUVrwOVGbAddGR2XzOeXc5xVtz9T8CL9JZ44mhWVkTzOl3XLOI4ownEQQs5
	935kFMjug9BWS9KNHRu5p98VU=
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id 6a1803df08f44-88292686aabmr245308116d6.44.1763551670470;
        Wed, 19 Nov 2025 03:27:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyHMkVncCkfQ9fLK6iwiE5NtdrxN7grXBPy/3NfpN7Bs+jSnMQrPk3t4w17vy04KZ0+hrZiQ==
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id 6a1803df08f44-88292686aabmr245307846d6.44.1763551669969;
        Wed, 19 Nov 2025 03:27:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1509fsm39043511fa.13.2025.11.19.03.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:27:49 -0800 (PST)
Date: Wed, 19 Nov 2025 13:27:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn
 T99W760
Message-ID: <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119105615.48295-3-slark_xiao@163.com>
X-Proofpoint-ORIG-GUID: BUhHhSsMMLVpvFCB1pllw0OMZQNkRQ0M
X-Proofpoint-GUID: BUhHhSsMMLVpvFCB1pllw0OMZQNkRQ0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5MCBTYWx0ZWRfX5GrycjUTHrxz
 3OCjsP63hc0PyoIZXaGjVbeHkx/1cr05ILOQTEoHhu/frxer5H6ID4FF4XRIoOnvBa87yrlvPK1
 NfoNsGxKkciNls/AJsSUYcCvM0rkhZyoiDy04WCzP25nZEkJEEemZ540ku+9fWnsUo9roRrzfnZ
 ap+Qw7O7IPMthbleMP4aBIIrb00ZncL9JeS3W8xp33AZGviaM93nlqlMPMLYxLYeLd/8c8HyPbN
 2FxxxkRM5ZNRyE4bvg6ltjgWP3UhnIonfjIwSBt6NG88/MuQcSFxzejwiDwWYKyI/kdJhPlV7E7
 k3kCRCzjdcgaQWB/xRWmZshVkK4ikpCO/dFSRgyh0lOtBMcKUihYqVSddRunoQlifkVltasI8Ox
 BVFaJjEzivjhJ5KLYAIbAyanKCxnDw==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691da9b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Byx-y9mGAAAA:8 a=yYy6iFiXQZVf29SkKJEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190090

On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> architechture with SDX72/SDX75 chip. So we need to assign initial
> link id for this device to make sure network available.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> index c814fbd756a1..a142af59a91f 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
>  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
>  {
>  	if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
> -	    strcmp(cntrl->name, "foxconn-t99w515") == 0)
> +	    strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
> +	    strcmp(cntrl->name, "foxconn-t99w760") == 0)

Can we replace this list of strinc comparisons with some kind of device
data, being set in the mhi-pci-generic driver?

>  		return WDS_BIND_MUX_DATA_PORT_MUX_ID;
>  
>  	return 0;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
