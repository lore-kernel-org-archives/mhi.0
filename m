Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766EB242D70
	for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039711; cv=none; b=DtUAiZeyaQHI6HmeQgqRbUld/RK2d38GA0wGVdNAdU+5gONQ6YGhSZcHD0YhZApobf+VSY+/uKuWUZNOmra6Ylud51vsED2GTa24FN0jacMUXzvm4VKpZWTocn1sJZU80t4/O5MUlYtQW0R0Hj5dXRCM8+8J44pA1g4tayBw7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039711; c=relaxed/simple;
	bh=fQyhbdxLu2Yr8h7IfuKXCAVZ8vKSkQIrn0uwbz9tiK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSjkUOx13KINxgrPlU9KKYRB+AkAtNocssvEFw+ZVzTNNj/sgdOMgUQFqFkkNOZ9SUqTrYWUVC6yfMDUYnoDRFM3CTJIi9VgMUOWILiTw/9fHzBMqkP+E6qKtFhXNIIz+D6CArhHvWclIwD7aVH4cxJh7VbuO/pmev4yN9V1Z5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlAdv2ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdOxfOIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlAdv2ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdOxfOIt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9e6C04069042
	for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 20:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=KlAdv2ubMWttmbER
	zK1m+HlhknlB9IltkrkURme8qcJDFJ+ZfDlbtrT4bO63ZP5p0yx+Yt8/PEmB7e22
	ahTfq8OgZvlgXY/Fsb8iq2Hnn0nKA7XFrPAgv5htE3T0qjnlfrTng8IXvQR38wtG
	dyS4TuVPF7yWnkc9+GkWwkgFnvdzpeOMNt3YbmgDgTpzxZ6IDNNMTu7cVEt0ApYd
	RQLEh2PAj9p1gENTP3jl3g3yILavYaUsbAem52ycezS2xmen9DpZqC0OGQFJUvui
	8gdV093GMKBOXuEyX5EfYy6KfwRshLAHXVDpYwIjScRmISHmwSoBA6hGexuUMRA1
	OFlloA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5n9kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 20:21:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11ddcc9f85eso18264843c88.0
        for <mhi@lists.linux.dev>; Mon, 29 Dec 2025 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039708; x=1767644508; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=JdOxfOIt60LBLmjEz8pLvjbvY18ZBwkoq+dhjs2VDgeEQYLDksQ2Kx7qU7GJ2YsfY1
         DEx+i35wqOQPAjfl3QlzinaEHLcgtBMeTHONwmMJLO9Qn+Fm0wyIrxYUXKlG4WCZwNYS
         p84Hye3/C9bYVuVCm71BiF2fxxoc0DpDKQ1lTQFmd1hHQPS1L/yV55zFCl6nHzWbc1/C
         TdZdTUGBc8AJYeuEkeHMLpll12I98qPhAXEDcIryu7dtt6+60C87kChnbfziM8x+inxS
         s0r/Iud8QdxcrPOBppvh6CZZ2rJuXI0kkBGTYljYjME4z/OL7DWFYw/NZf490t0b+fea
         1tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039708; x=1767644508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=Rry9pDViUOlLr4klyJTldE+KFmXafxrMNEs3PDieBVO11iw6u/zgxJJawUlUc1lrhH
         RI0pzIqu1SmJ3zlpJCFvPhNEslCUy4W2jovfPYbAJm7NCzgDYd/UAiPzA58p/MNKG+UR
         P+W6qFsUXhTrrBLL17+dUPB4DGCCSHuGzgsMQhWaysdnlUKH449MERe/bSliFSC8P4nC
         7P9HnAFKDllcGv1+8ZvDBXH1eBEml0P5mFAGAAHpP4DQ1zuRL5s6i5Tpk6UaJUMhDfOS
         w5gb+iNnmNJ8mehSkYpqkMlX7YLLsPy5idDwKVwPBZyTl3VYiSVcqy2UhCDbI1MBSnCy
         MMxw==
X-Forwarded-Encrypted: i=1; AJvYcCX1m2iuZi+aNM3uphthKct/N26QC6rMrpywBJH6VVe9ck07mw+BQeEkGvrbqAq43NJbcA8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSNN0f01lUqjd7dhJcKgyWyfw6HxNPAbiAEQH96rx9PgjWeKdE
	tiJ3K7tpGn2qce2pcn/Zr4ChtwLUwMXBCZVZ2kvt5me6011oyVg9ifsGXg2SYLpgDnWPmrCcfwd
	o0Q08KfqyMKqOoUKnbx+fmBnPG7UWnw4oBC79qNALnG4vrpQW27dX+ZnJ0XasNb4=
X-Gm-Gg: AY/fxX7n09YmvkmhcezrLO6pADsw4L0g/sE4auZ7+2Xx9tkpGd2oAT0s1fGdIA0qSPR
	lHTEUuZGiAdyI0ehW/yecyd3evTMQW9GUW93fL4I63tVPI3u8jZv0sMhoWke0RTu9WRddBD8/Qy
	C9eFXHvCL2WaAmVhZTa4DPmJCykPqVGP/HTKO1uwFNQ8MCjSHdoiUzIe9i40Txzerp6bD+gT32m
	hI69yN59Ymxjrx3oTu/0lBdFpJQZpMjKqhsOTyN5f6N7AmmVCDAz6+g7gZGldXEN7W5hG2S+Ilv
	9dWrEAE6dia1yAp1jBjpS/p26h68X1ARnJmRGzdPUMBXffjDDYMu40vVR77kUrCrOmaCC1ZnLiK
	WvB/4vBIy/IuJk4csI5vt/O282RLcxQ69LOi+sSVOpYJGiqHkiU8U5eaL9gerp2o=
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221585c88.12.1767039708192;
        Mon, 29 Dec 2025 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETQHo90sIZ9Ah2oFCPURRgJ6JOFVSXKLGKjyL2O2wo5JOl3Bs3GTMtBAiIr30Ft0lRKlNsqA==
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221563c88.12.1767039707617;
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm120318362c88.5.2025.12.29.12.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Message-ID: <9e6d2c54-6c63-4cb9-933b-3647c25fe72d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:21:45 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8DVl9mX3yIHiKUHXarbeS89yU0uteDis
X-Proofpoint-ORIG-GUID: 8DVl9mX3yIHiKUHXarbeS89yU0uteDis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NiBTYWx0ZWRfX9qnlam5oVK9O
 Xak76NoHoBqsSS8eZ+ZJt+Qnkxr6mC99fMn4kz0/mApsFUEFW+/eDercnAvu7VUYAbFfThTdxuF
 VpB13OY7/jBcdxxUw5Mpkk13Qc4WZmQZtSe8un5BtD4Z7jslPF1W0DyZdQVOE5rmwbhJcFH+VC2
 t6Rjii859hq+eTHJE4JfNW1ExfzjlgJXs4tP2GV2QhfSY10jOKl7O4l3LyqJjth3c1TLfoj06tL
 snwexUW3S1fTN13lrGXbP6oyKbFFmoJ4uIeLiic/qSFQln1pdXYHa/6wySRRxyl3XmKpv9s9UD/
 jHRk2TT30Hs2wm2x05/Ms0G7bVpSAuYrm1iimczTINIv23QsILx2yzLM802rGjcaj4ohMS3Vloh
 09osXhXE0VYP6KuOfZaYJldsE6yJkahiijnzxf+RKwCFTbL+DnGbM2vdJL+5HYgdxSI0bkR9XII
 Gu0HT/ckRT/p24Lan8A==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=6952e2dd cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gPICEALkPRU_h5exja4A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290186

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
