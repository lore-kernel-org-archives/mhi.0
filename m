Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382449;
	b=Mrh6PGGXiNNXErPuQJaNpAJlmyoJCCSbl7AMG4MgLieCqMWuJpllZarCZDnk39lzbQ5/
	 pLjAN0ntL0zJ1lrRwbNGvltwnhBUPpvtnIPsfiQMW+Tr3Z6woyCW/c4l99syc0CDEQEjW
	 2gGyU+LyhJLVLS090WbixJHcXrTbF2cYb3E3SuzioOsUUKUzoRMROkYZ2hCOsot2c2lZy
	 VCK9oLaFSWzs5fLhYsJsdqIIIxvYseH6GT8LEo3SzJvbaLNwLYkfI0NVMdSE45pZ2hEAk
	 tP5r5POAabjCsr/G9phT5/U7qhDbaTdEupnEhfTjICeh0cYac3bkH2LucA9hzkpvI0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
	b=m5fUXEALAUGgZPz/BjTwycb7yktFDz0AWfb4L76MeI3x9DP6rk3mMY1APxORGnrwgyVI
	 T05lNcljkQW+nR3tqvFD7lBduzKH53egStlkp0cRIfqYJ4gJnqH5X9elzyXPslo58yBQU
	 gnVJaypnDZ6VbhKV8x7XwCFOO002f6UJP+BDifzhP3hqSfGABXkJMeA1E/53bR/bNCHoZ
	 ABfYrEp18y6Q+zmWYck3jKIwPHSeW8oGk443ErVtGzxUq2a8hRHfhq3iKiiXABSPX6ath
	 kRzGZPx6Vct+THeEJhychIas39J60WOAIsdkMrJk2WyDWPSS63fkniEffWSUyqquZzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c3S8fHhN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F86606A31F
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 17:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F86606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c3S8fHhN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERKxG2968138
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 17:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=; b=Q+uOJQx6MN7bb3Qp
	RIQYTGJp2FfIusVoQOW4c63d9kjqf9fxZE5a+4AMLZ03E3UWZKhYtxxNDQxmrv4d
	D7nXu9WxEBKPvZXkAgtmE08o/m638bt1LeKz9gZqzO9Z1F4WrmKB4hhO4d/kw2/Y
	AByqDlV1dclPMk97s/tXSR8QqMgqvUPrMSzmAy/GlYXH9UH+KBCu8JujNQHC6D9i
	evxujPQd6NPk0uS5cLyla83tXlWHbJi4/pywcNTdQg7JBet1vESc646SDTrxon0c
	UGQQYWMKkY8K/GpKNr3A8akHe+CgD7KJtltINTYsYqKDqBvtnA5bqsHO9TjFGM9A
	3+Zc0w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qmasd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 17:47:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2158866eec.1
        for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793382447; x=1793987247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=c3S8fHhNKb8KfsvBfPD4euaWWaxZHKgJOd+4q1DOWN04ooQSySDDz0WjYapYZlUB+9
         xNv4lXKl73+Fly3whJwGyPaimfEP+RCVyBewjnHD4yQ2B92Q8m/7mvobqm8wH/u254aR
         cYY0NzdXQR/j3Ut2Eb7ndNtey+dgtXh6NcrkesDQXA9zevdAThlf+WLY3A23wWVy/aAk
         LGAsvD+Wv9VjGOcaBSNtY7QyiPcECwEH47uophcBeZ+bGn6IPjS6yDExlwg6Pye7zLY3
         AD7V+04Nmv9WsnCsxEhZo5/7H47llCMdYuBQzZgMigcr6h7akbgKiSbAA4rpPHA4AB50
         CUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382447; x=1793987247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=pKXCMgAdcuXS4+Ea1AnO2SqpM0aHH62KbofuSjIcErg9bv9Iz6VdwhR18xa3noQzJI
         Jryih01k1VSwv7WwtnHd2Ykgue7uXjtLivPXnlrqcityTCeotQQ9W9fEdL+2xg1OVwuM
         +XUnKxmd3ZQP5c38gWRlidQ+6SnwZ/u582nCXBOEn1CBIk4Qd+Z783SgoDawB6PKFYfh
         gdDpFrroKpZNA4qjN7T9vhtqaPTGskIA82CvMBQnUzWJEmr1QOcg2OWthWuSPtnYFZQ6
         0bA6lePz1fzAWTkXg2VMxCon/vuNt9YINVlPDJKq7vl0ReFlGBuJ9MXBj0VDXrQzvUMj
         ooCA==
X-Forwarded-Encrypted: i=1; AKwUvBy3Bc77jX5xthkJNmVI8bK6jD4Hcvs/EfpDWj6c/bInHyIx5gqEZ24NO5yJsnYcAz2tSBQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYJlRonvRMss2SgDYZTYEps9eSArY2RZIV9XqubkPrxoICixhq/J
	JyMcH2BTkakP6OJYcXdvyh7YknEsU0BnffPblHSNe+YrcPBZBU1+H10pgQ1mtoP2Zw9GrkLfUJB
	6MskwSmXf728RUqqjanerKc+Skj8B4sqLoKU/FqoJAI9cphPbiT7JMKA=
X-Gm-Gg: AYBFou0r5ESnSP4saCjAvEawl8mjcTc39L0ScJEEOaJbH7I7l9vLRI4jL0jtRiGB3Wu
	uqrj44ev2fLL0M/fGeqKdfbmEJ/us/sZUUKoTVIBLKroez7kA6cIwS/D8e+ISR3Ag99fiqNsg/h
	DTSQICNKjAt/sW/XrraraSmdF6+bSdBbNcL/S3VgvHbkEjGkLSREXk/IQ+9vAf6J+8Aam7lTzrJ
	g7F99AL3438XN4R2jcKzo1NjhJl3qmVApUDOEUqOEtpDCWdGz/TIa3N9MVCGQAjmnJf7y+Lrqhl
	BCRLmqLxjOm9678vE5rYZyu3FD6ngflmTFtuZS5AdZ5AhTGRiWNEny8OdSzpSLTrKxW8nc1xAd1
	yQ6v7VZeW4VdU4E3CYf5RA0mDRMNMW3c88dohXexiGtP03RfrNLLc18Ij+79M5uDu0iZ7dp0QWU
	WExMrllDdGdWtN0Q03Tytf0BQ=
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894597eec.32.1793382446838;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894546eec.32.1793382446272;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm8787868eec.19.2026.10.30.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:47:25 -0700 (PDT)
Message-ID: <683ca22c-f0f8-458f-8323-214945ae6d45@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:47:24 -0600
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfXyFUlLUWf9SAZ
 IHZ4U8AYnW1OUf4qsFUl021uyJkLO+zYctbYNDk6aBTKVqJCOVEzlHz1y8avTz9yXMWLs9cAyrG
 VyWwtxobPa1AJJyITakE33w5HwoytY+g7PtGkCBUZSEtV46YvdoxMXVWSHsL5+/D88wsb1KI1V6
 SGa6LZpYEGUBRmYdx1OlH0njl+P25w+RDPPx/Lj/MAgqJt8uE+aWJ8T47AqJKfU6MC7IGpd+z4F
 j3w26DUm63YoyKIOUOCnMgk0lsgHlzHdPG7I4lWATLfZKaGfl8w9BY9d40Xq18JbBf2DTBaLPdY
 1ltNm3ZAC5sGDTkyi3MTlGZNNCjSPM+prT9jPjW7jeZLBP1SBUMaqzptJDDE5HaJNXZrxECEGvX
 EfXQ/C8n/5Mj3gna7NzsR3TU3jxsqBsd071yOnwy7HGKLWviza1g2HmQVokAsR2Us1JQItaub04
 Cj2f3k0ntLIA+f3AUNA==
X-Proofpoint-GUID: wbfqRCo6LkpZqES8hiLDB7c-JQ_E7d7t
X-Proofpoint-ORIG-GUID: wbfqRCo6LkpZqES8hiLDB7c-JQ_E7d7t
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4d82f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dq9AVsfMO__Ke9BKiAIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX6pSCRJBrQBoz
 yN19jBtbMZDKY4fnYTkLnFsonLwd7kXT06EQJkLIuyZkIIj90xjUd5bZ+uWfdYZb9nmbIKaxdT8
 YjayYJPjrFnsUCffxz2SNMruYECJ5wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300070

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/mhi/index.rst           |    1 +
>   Documentation/mhi/sahara_protocol.rst | 1241 +++++++++++++++++++++++++++++++++
>   2 files changed, 1242 insertions(+)
> 
> diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
> index 0aa00482aa2e2d7ec4941154a8c6947dc0a0ac40..39a38978398b81727514ec95dee4e060a1063b34 100644
> --- a/Documentation/mhi/index.rst
> +++ b/Documentation/mhi/index.rst
> @@ -9,3 +9,4 @@ MHI
>   
>      mhi
>      topology
> +   sahara_protocol
> diff --git a/Documentation/mhi/sahara_protocol.rst b/Documentation/mhi/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..3190e3e5a2820628e89efcf759c9ca634428f8b2
> --- /dev/null
> +++ b/Documentation/mhi/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification

I think either "Sahara Protocol Specification" or "Sahara protocol 
specification". Having lowercase protocol sandwiched between uppercase 
words seems weird.


> +Hello Packet

Until here, "packet" was lowercase. Please be consistent.

Also, somewhere around the read data packet section, it seems like you 
stopped capitalizing the packet type as well.

Also, did you run the make doc make target and look over this?  Also 
around the read data packet section you start using the section 
delimiter "=" instead of subsection delimiter "-".

The inconsistencies in the formatting of this documentation are probably 
going to make it very hard to read.
