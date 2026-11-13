Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596036;
	b=GZX5TeE2a/A8bLhWWNONFjQfB6EiXqS8KsssZoImcMWdcSdLI4UiSvUOrQuhASDwvs52
	 oWLMFMqXIz4FXONJy2BhLjPIq0tic8xZ24Xynjc0GEeg1WVelQVSPVqtskjoulpgUi0OJ
	 2vkUnym162+qUQvkJrcabnyj+1EQDsPZqyftUdFcd2EfI0Chxa75C+4GqzhKp8eZNXAiv
	 t0UmslAVwkmKd1cUJ2whPzjXDGdu9cXy3i0o8C0Wk+J7VNFpZpkYKrRQfIiGJrXWjuK03
	 K6V7rn+RG0UHRi7x7ctW2xMVvgFx9oQLvcVGYknhxqHIxcQFNagCvHyizJkuc5APKOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
	b=NsAe1KKdJrmHw9c/V9mYyqAcvH3PBKvB0GCrfdSojBcRuWf4y4jm61CYHUv0Nk6Xi06O
	 tGHyR8R4bvTevuhGx+oGInoTVH0XSe3H75ZarUzhh0Kg0ggfAUKUxvekrCMZAhGwlMf0y
	 ezv5mpQx1JptRJEJAztoZ3GeEAms0IEHPwD3kjD6PPYhazRN6GdG+VgIANoEAAl2H/3DZ
	 n/oOqdHEQ8I7W6LfMWil0zArcw8nw8+NXmxI+XJSLqgLbyvtHWJOm6TjLBH+819eDypMi
	 HIH4FhJFNGS0Vsaa7m703WUYIbk/z/IFE2ASjcp0qa9KMj6ZIv0/GfOJzHc8ZwkqKhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuwAKegk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SGUR/Tjq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F8606A8BF
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 18:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B78F8606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuwAKegk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SGUR/Tjq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR7eu552097
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 18:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=; b=HuwAKegkX9jMFg12
	8X2mvDeal8wOWxeqArB5K11MNcYclG3pSIdPE5EMyT+DQdrS9acUZwPOxI3xNc2K
	M/DsqNMgSRBl5lZE8PWCfA0fKsbYB3RxTmnkWoPmI6yASWMhwuyIkYxWbDlDz3qp
	Y6fWCA3wQRJbEZiRoWtZKZAb2ZWUu5ECzAbJNTPJ0EEqPBRFSpVYAbBjx1I9UBNZ
	KT9t3VeLP+hcC2gD4VyVvRyxDzciQ8fL0zMXkGxeeo2b0XTGLqnrbuOf7Qd8P9nL
	791E/2JIjxNxwk0pt9fRE6yDCn+95vjB4lppTfKklZfYQpTiO7Mltt1KCPiGSnWi
	m0gfiA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 18:53:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b238436265so631123c88.1
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 10:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596034; x=1795200834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
        b=SGUR/TjquP+NwHTs142zdFpKjuxjQw/qthKZcpRo+SvTpxEQGz9GutFeVTB/rITzpO
         Y8tSoPAiclP9Pm37MZEo+U5yKQ/Lc0esM8jOXTajvVfPLcHjGEH8KlvacPt2wsTZb0zh
         FCIrv8TelmVG7fxP/8oxLoEcHgklZD4UBosrG76Vo3LhtSn7oBdBAKnygyxvXXh+HEPn
         20rrjy2fmzh7x50BdfQi63pLwZEhrDbLNmEv8syXss5DlC7cQsr6whOTF8D3ctjgvJkO
         YIaoL9jf18J7qoSmT6mbTFgWw6tLk+wmC2s6f1mADjsl/ubg1QzD4SJExOa7JRudDzQf
         dKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596034; x=1795200834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
        b=fgCogmiNvcSQpqK/dHljpwmjjgRidytbvK5PE4BqLDU/Yc+VfGhytm7ez4QV3uXNwv
         nhHJRWFAvt78YVxJyKSERsBffUWbz8Fo6WNUtZLTsGhefNJiEJVN9MM7dDxtZilnUOHO
         3/UGmeRGyMgEknoqfJYPoxX8AL1f4jaPs2hRtTqPP8DUhnASmCclw6YYeBj5uhoJnUhS
         XO3EQRPNZsLyH0BkAKEhF9279GIV1FwSpGZOja5lv1JoQQCknpjx85ti67ynQhbgpRtJ
         VN6XEin0sSR2zNDPZxMVcEdzWUXy7AvlgehONyYNOuZjaZS8ibbSKv/OJ9y41K0rSESQ
         SgGQ==
X-Gm-Message-State: APuU4Z8vvJZrsNXl5Hg/unnxxTzz8HlKUI7NCksikAQtArxyVfJRA2uq
	u45a1LOuemSMVHeBvOH6W1Nxw89xEGwT9i5Htk72axIFTbrkUHbelWcT/xflMQW27b3ReLyNo8c
	KE8xEoOZ9EZ6PjY71YDveCDpiN5wHeXdsbLJ7obRJ78vu4yWXQP5Wlv6UIDOAl5/Cnw==
X-Gm-Gg: AYBFou3VJonymr9lzHZ8IxCEHr+r5KRxhoKqsujERoZs44sQplSN72gnInCnSJGvZyr
	jlBw0rbVRsGAStpbNUxMDlLSn2Dk74MnTCgz3H9J1i3LVJhLKaatG6VZD3U6K2YejWNKczEahW9
	F+PR8VXMI7LE5R5HcuA/gRf/ODJOaTWEyIFsBmlXTpGO3siHqDNwSan+vTKeJuA03C0/E0B/U4r
	KodDzH5RrwzI48448VYIdO2eJQQYZ/rHR0q5gM1Ih53GM6xyNIo5nNk30VKnX9Mt2Oj6czLigkS
	SOAWUt1JnthPoAuFAc4Z5xMvzaKrFNemRns8F99nFBnGUY8MPymBzyFkcnPWIS/QKY804Mgncyr
	zHAhyhJFm7zWpUM2JvaMYgirbqKFjF+Y+F07ulxjpZIpIdoRW0VfnIiflmzJFH4yxiAOiHc8FW5
	gE2Kth0Yx+sEeAPA6Qle4IrnY=
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr3253796c88.21.1794596033538;
        Fri, 13 Nov 2026 10:53:53 -0800 (PST)
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr3253779c88.21.1794596033072;
        Fri, 13 Nov 2026 10:53:53 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm7789937c88.1.2026.11.13.10.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:53:52 -0800 (PST)
Message-ID: <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:53:51 -0700
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
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: jimmie.lin@gmail.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, daleyo@gmail.com,
        Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cc2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=rHAfOLCqabZJc_1WEVQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: NAqFvLW5M1i5YoxIisRrNk6BAAtvUpw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/bAIsOULAo68
 Gz9f7+afOAEiCBwu1k97w1Y85xqG/XrdVpgTsDouOwDVs7DqVs4CLWUYQC06O7e8j72OnxncaKq
 wKU1H8EeJQ934PBMgThwnrcopigy2xZBXjFkzX1kLmVEIKUW56xTJY8W35RW1Hd7BhYp38ZsEF1
 fmcnnhxJLn2rqgtHUId/epDAruPvyHRnb8SlV0DnYbJYq107wSDHEqOxDmYHR051TkYsw66ljKw
 pUp/iJtNqmh98NZjWWJSteKyGXSFKVBZLoZbQHAH8BzVDV0qhhSv/oeu3CvS9Odr+kU20/Kgerb
 YsfL4ZfvZXYAph3ElI73/3hdzzgN+c5vDgVx64+fNsoaFFVnX6evM+kEzdrkoHhCLbvtx1vrsdi
 1pQ2yaFmwBZmQJi81jWwkKv9dHNxpftVe1rM+HRtGzOiBpQeyz8drMnz5eYAZd+0umG+wF7kXaj
 t+Ax4tyY43hGRGVUMYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX9QpXcUv6dZMp
 IQA0w7JZzVdXRMnM5y11XJNZG6Q9FDCgwuyD7H8J5Qd6qrD1eOZKSjidFc+cE6pp4BsucQUlGD6
 SlXr2ngbYbyeTwqtsWf9afy4kfgUGlA=
X-Proofpoint-GUID: NAqFvLW5M1i5YoxIisRrNk6BAAtvUpw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
> From: Haipeng Lin <jimmie.lin@gmail.com>
> 
> The Surface Pro 11 5G carries an SDX65 that enumerates with Qualcomm's
> generic IDs (17cb:0308, subsystem 17cb:0308) but runs the MBIM-mode
> firmware it ships with for Windows.
> 
> Control is MBIM only (the QMI channel never answers), and data on
> channels 100/101 is framed as MBIM NTBs: the modem reports a WDA data
> format of raw IP with MBIM aggregation, up to 32 KiB downlink.
> 
> The generic qcom-sdx65m entry names channels 100/101 "IP_HW0", which
> binds mhi_net. mhi_net expects raw IP, so no data session can work.
> The MBIM-mode modules in this driver name them "IP_HW0_MBIM" instead
> which binds mhi_wwan_mbim.
> 
> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
> This modem carries the generic subsystem ID, so select an MBIM
> configuration by machine compatible instead.
I'd like it if we could query the hardware to determine if it is in this 
mode as maybe one of these systems has a SDX65 dongle attached where 
this workaround does not apply.  However, I am failing to identify such 
a mechanism so what you have proposed seem to be the best solution so far.

Unless someone identifies a better idea, this seems reasonable given the 
situation.

-Jeff
