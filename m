Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26AB1C727F
	for <mhi@lists.linux.dev>; Tue, 19 Nov 2024 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732018000; cv=none; b=XvwdFy1jNvju6nmGQGcHpx+md+eRil1eq/PF7iBy26QZ5nxUzlG9Gy1ya+KuvwVVIeq4lpiknwInUcXy3fCk/cHIZJt0Q9cdU6EtUYd6wJHH2ezcuUrvA48vwc83/GdnQGFlAGw0MXfUj/RxIVcAnWImbcs4e1MI+v0L1N4rbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732018000; c=relaxed/simple;
	bh=bQF2wG2y7zCnSZAgqYnfODoHHKEX3LEN9sr2g8dfwHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OPSa1lmjTVGnwDm52Lj3ZwXC1YPsStt/5kLjARyjUZMlJMCeH1nMjoYGirLxmTCKT9isntE3Q53Y/brQdCVTl5niRrQjith8iLjyfqEE1wNI++VeCm6HRF0I16Lvp8bkifYGTzTdmVF722u+awkiTiUd9CfEJZYJIxU6ZPgaWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DGqY6tzN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DGqY6tzN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7vqfi027397;
	Tue, 19 Nov 2024 12:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyNd0b/GUSI/KNve+Jmi4Do/Oml+XyeDmpIeUFaJolE=; b=DGqY6tzNnjMflwVI
	3PjMThwOdObYlk0vy7S++EFZyfuOAH/aUqWlmU3raHN8q6EtU55vwa/4WAEzzJ0K
	XfATB8hDaoB1cFiYr2s+bzHxFb3ZHEGG1NQKINFb6divL5K/rdnd7NIKgcME1q3g
	ooMf1bRrquN+xIAaR/shhtN6VxZD5+KXqQsTHFkcsnTMjddC9ZKQOJ+qtU2s0quM
	GItu4xUnphWiON4SzPTE0rxYKmEqvy2xZPM891xdAAiuye7xXuMh/Bb1pJl0VdVG
	8fbBeCorLSOABCkpWXRIkj2ADNeLsT0dCBZf517i04r6jMvymLbjLqX6I2mBKGir
	LgEERw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6tf5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 12:06:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJC6SNt001207
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 12:06:28 GMT
Received: from [10.253.10.236] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 04:06:27 -0800
Message-ID: <d24a7b26-03f6-42be-afcf-7a6897932c18@quicinc.com>
Date: Tue, 19 Nov 2024 20:06:08 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add RTS support for wwan0at0 port
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Slark Xiao
	<slark_xiao@163.com>
CC: Loic Poulain <loic.poulain@linaro.org>, mhi <mhi@lists.linux.dev>,
        "Mayank
 Rana" <quic_mrana@quicinc.com>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j4qZloKUyjv5z8iVIv42sMLRFLFaCjJ-
X-Proofpoint-GUID: j4qZloKUyjv5z8iVIv42sMLRFLFaCjJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=948
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190088

+ Mayank

On 11/19/2024 12:21 PM, Manivannan Sadhasivam wrote:
> + MHI list, Qiang
>
> On Tue, 19 Nov 2024 at 09:25, Slark Xiao <slark_xiao@163.com> wrote:
>
>     Hi Loic,
>     I tried to add RTS signal support for our AT port of wwan device.
>     Now we can know that we are using wwan_port_fops_at_ioctl() for
>     this configuration.
>     Actually, there are 2 cmd will be ignored by default: TIOCGRS485
>     and TIOCSRS485 when you tried to use "minicom -D /dev/wwan0at0".
>     Then I added it into that switch statement. May I know if the
>     "mdmbits"
>     corresponding to the defination in termios.h?
>
>     Below are some test results in wwan_port_fops_at_ioctl():
>
>     //sudo minicom -D /dev/wwan0at0:
>     [ 1773.390038] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389648
>     [ 1773.390062] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is
>     93936443291456
>     [ 1773.390069] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389408
>     [ 1773.390078] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389392
>     [ 1773.390082] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
>     140726000389344
>     [ 1773.390087] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389344
>     [ 1773.390092] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is
>     140726000389500
>     [ 1773.390097] wwan wwan0: ##shawn debug## cmd is 0x5418, arg is
>     140726000389500
>     [ 1773.390101] wwan wwan0: ##shawn debug1## mdmbits is 4
>     [ 1773.390106] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389408
>     [ 1773.390112] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389392
>     [ 1773.390116] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
>     140726000389344
>     [ 1773.390120] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389344
>     [ 1773.390126] wwan wwan0: ##shawn debug## cmd is 0x542e, arg is
>     140726000389568
>     [ 1773.390131] wwan wwan0: ##shawn debug## cmd is 0x542f, arg is
>     140726000389568
>     [ 1773.390135] wwan wwan0: ##shawn debug1## mdmbits is 0
>     [ 1773.390153] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389648
>     [ 1773.390158] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389632
>     [ 1773.390163] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
>     140726000389584
>     [ 1773.390167] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389584
>     [ 1773.390172] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389648
>     [ 1773.390177] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389632
>     [ 1773.390181] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
>     140726000389584
>     [ 1773.390185] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000389584
>     [ 1773.390191] wwan wwan0: ##shawn debug## cmd is 0x540b, arg is 2
>     [ 1773.393848] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is
>     140726000390084
>     [ 1773.393861] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
>     140726000390064
>
>     I checked the old architecture of Qualcomm PCIE driver, and I
>     found that they support
>     these signal like RTS,DTR and so on.
>     Please see: https://git.codelinaro.org/clo/le/platform/mhi-host
>     file: drivers/net/wwan/mhi_dtr.c
>
>     Thanks
>
To add RTS support, I think IP_CTRL channel and corresponding client
driver(mhi_dtr.c) are required. We also need to change the switch
statement in wwan_port_fops_at_ioctl() to send data over IP_CTRL channel.

Thanks,
Qiang Yu
>
>
>
> -- 
> மணிவண்ணன் சதாசிவம்
