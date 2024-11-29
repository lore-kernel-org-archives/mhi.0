Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DBF1514F8
	for <mhi@lists.linux.dev>; Fri, 29 Nov 2024 02:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732848562; cv=none; b=eTCn1JpM3cEyU4P/36Kv+B/s4SJAZi0g4stoocAjvZ9tms8R/paIWN0+6ShS/bD9g+MqEAY+6lG75m8rlqVchwPc7h9fITUHezRcUABdQFFmuaRbgUr1o33brNQYXtLdlIYKYJoHuKutiKJ8nGGCXMYCTwj5eJfRk4iZlGb4gY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732848562; c=relaxed/simple;
	bh=Ti01UuaLu4Fnlpnpq8FacTdW9MBs2OXxTv9+1TxCdOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=W7VUL86S31HF9UMi1W6m1bHI52WfLvNIA/wnRnBymZhMYv01jkvzdtVUntlsbwQ2nvP0K+KM6kxwAACONceQxDgYBBvxk3acApnQ6K0MMg0OC1UPvQyv3ReRlDt+UWefLMUB2cwG9poIifsXgtwmEsmk3hE03+E6B6u5N4ARovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eLy1oea+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eLy1oea+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT1CrF3029947;
	Fri, 29 Nov 2024 02:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq7kj/Km8LNgI7gN3JcAvSHvu/XZ8fwPaWqrwsrFzlA=; b=eLy1oea++aQ6+yER
	D5+Z1ChpB6N2mSW+R9+kbJIX0I7U3Q54Ldam59d1EHJ5EG63JMOMXXHmNKIO1oty
	CO2eKiESTgtDGJ5nIK2w7Ao75TWqsSrTfWWelWm1vS1iuLQO4x3LrNm9W6sNrDf3
	IAtUos9/tEPWIyygdaSneeNdZyVCQrmWVhUJjZc+anE/9aNs/JYuNeS8AOt/934/
	9BlX7SM35GyzUiQIDn7YhvC9ieyUprr+9E7N4klzQZCJ7bsq5TG94D3BjDPt4FIb
	qFeUeJaWdN4f9iGpXNfp7DpURXRDpu+a9RR67uAHtL/qeggMANCntsEybpOk6YB/
	l3+0SA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xy45et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:49:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2nDwt009015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:49:13 GMT
Received: from [10.239.29.179] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:49:07 -0800
Message-ID: <b7533f3a-9d4e-4061-b085-3218793f4d6c@quicinc.com>
Date: Fri, 29 Nov 2024 10:49:04 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to add RTS support for wwan0at0 port
To: Slark Xiao <slark_xiao@163.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain
	<loic.poulain@linaro.org>, mhi <mhi@lists.linux.dev>,
        Mayank Rana
	<quic_mrana@quicinc.com>
References: <4281e5c1.4487.193428fe8ef.Coremail.slark_xiao@163.com>
 <CAOZjjh=Vre7Xn9-qjZ38eoAtD5AsiJM7hU+iGFjUqt+ZopTBxA@mail.gmail.com>
 <d24a7b26-03f6-42be-afcf-7a6897932c18@quicinc.com>
 <c52eebf.44be.19347bb3a2b.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <c52eebf.44be.19347bb3a2b.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FfupK_KM7rt3e8NZH9voyELvfKo1PMoU
X-Proofpoint-ORIG-GUID: FfupK_KM7rt3e8NZH9voyELvfKo1PMoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290021


On 11/20/2024 12:01 PM, Slark Xiao wrote:
>
>
>
> At 2024-11-19 20:06:08, "Qiang Yu" <quic_qianyu@quicinc.com> wrote:
> >+ Mayank
> >
> >On 11/19/2024 12:21 PM, Manivannan Sadhasivam wrote:
> >> + MHI list, Qiang
> >>
> >> On Tue, 19 Nov 2024 at 09:25, Slark Xiao <slark_xiao@163.com> wrote:
> >>
> >>     Hi Loic,
> >>     I tried to add RTS signal support for our AT port of wwan device.
> >>     Now we can know that we are using wwan_port_fops_at_ioctl() for
> >>     this configuration.
> >>     Actually, there are 2 cmd will be ignored by default: TIOCGRS485
> >>     and TIOCSRS485 when you tried to use "minicom -D /dev/wwan0at0".
> >>     Then I added it into that switch statement. May I know if the
> >>     "mdmbits"
> >>     corresponding to the defination in termios.h?
> >>
> >>     Below are some test results in wwan_port_fops_at_ioctl():
> >>
> >>     //sudo minicom -D /dev/wwan0at0:
> >>     [ 1773.390038] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389648
> >>     [ 1773.390062] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is
> >>     93936443291456
> >>     [ 1773.390069] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389408
> >>     [ 1773.390078] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389392
> >>     [ 1773.390082] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
> >>     140726000389344
> >>     [ 1773.390087] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389344
> >>     [ 1773.390092] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is
> >>     140726000389500
> >>     [ 1773.390097] wwan wwan0: ##shawn debug## cmd is 0x5418, arg is
> >>     140726000389500
> >>     [ 1773.390101] wwan wwan0: ##shawn debug1## mdmbits is 4
> >>     [ 1773.390106] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389408
> >>     [ 1773.390112] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389392
> >>     [ 1773.390116] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
> >>     140726000389344
> >>     [ 1773.390120] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389344
> >>     [ 1773.390126] wwan wwan0: ##shawn debug## cmd is 0x542e, arg is
> >>     140726000389568
> >>     [ 1773.390131] wwan wwan0: ##shawn debug## cmd is 0x542f, arg is
> >>     140726000389568
> >>     [ 1773.390135] wwan wwan0: ##shawn debug1## mdmbits is 0
> >>     [ 1773.390153] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389648
> >>     [ 1773.390158] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389632
> >>     [ 1773.390163] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
> >>     140726000389584
> >>     [ 1773.390167] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389584
> >>     [ 1773.390172] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389648
> >>     [ 1773.390177] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389632
> >>     [ 1773.390181] wwan wwan0: ##shawn debug## cmd is 0x5402, arg is
> >>     140726000389584
> >>     [ 1773.390185] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000389584
> >>     [ 1773.390191] wwan wwan0: ##shawn debug## cmd is 0x540b, arg is 2
> >>     [ 1773.393848] wwan wwan0: ##shawn debug## cmd is 0x5415, arg is
> >>     140726000390084
> >>     [ 1773.393861] wwan wwan0: ##shawn debug## cmd is 0x5401, arg is
> >>     140726000390064
> >>
> >>     I checked the old architecture of Qualcomm PCIE driver, and I
> >>     found that they support
> >>     these signal like RTS,DTR and so on.
> >>     Please see: https://git.codelinaro.org/clo/le/platform/mhi-host
> >>     file: drivers/net/wwan/mhi_dtr.c
> >>
> >>     Thanks
> >>
> >To add RTS support, I think IP_CTRL channel and corresponding client
> >driver(mhi_dtr.c) are required. We also need to change the switch
> >statement in wwan_port_fops_at_ioctl() to send data over IP_CTRL channel.
> >
> Hi Qiang,
> Is there any plan to commit this? I saw this solution in QC themselves 
> project.
Hi Slark,

Sorry for replying late, I discussed with internal team. We have no plans
to commit it as of now.

Thanks,
Qiang Yu
> >Thanks,
> >Qiang Yu
> >>
> >>
> >>
> >> -- 
> >> மணிவண்ணன் சதாசிவம்
