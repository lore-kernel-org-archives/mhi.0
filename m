Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296C124BD04
	for <mhi@lists.linux.dev>; Tue, 29 Jul 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783552; cv=none; b=AXtS77R1JDA2lkEb8ZiSxHcYigmwLkaUcez27nXq94AJQnl7O1Eb0tYzutb4LTSXO/fcUZfwETMnyzMftB9Uo3hle4J2AL+qz6DcOrgoDsV+CZVNKpwtX1sdniQfAzTJ4iRRbebh0zLCMqdDHImiN+vRBjqURSV865kXdTvBwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783552; c=relaxed/simple;
	bh=SHTEpp3GbW5H/33H1WzW3afLaf6u98VhBfR8Aaf/al0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JFWmik+FMb//Ws/jZjef89K0sExUKLMAcZKCB3XL9PX7jFVqaP4S7WiDq1TM6V5NPTZALFtzQJWlcbZbKJo1QgqwvxhvkreeuNF7lnuekoorsOhqVxePYHO3QyE9uD+HiLr9Li+Itmtsvb0hR3fGU3t9RfUx/JSTyhN5yV5tuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCcljsQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCcljsQh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8HGM4023606
	for <mhi@lists.linux.dev>; Tue, 29 Jul 2025 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H6/4gB0PQHXp3E9D6c+ROkMP3PajhH/MxVH0eBWIk6M=; b=CCcljsQhtm+R3X6x
	mM8eHwBRYJUEu46R83ZDqvV+OwyCZyBlJgZDolkXicsmy+bwEzfy8Mo9AV4gjyXw
	5St+xDUiFvv8TT8MHKbyVYgE321IK+h8AlGj7sxheJtz8/HO4Gcq6pWJdaj3iWJd
	oa3VMJdYyJolEx9hArdgRuLGmGdO9PE2AS54YucWSlx4LVr2vPQkVjUUqoBVyU0T
	oWyGOS2zkZHpapGR+HN4lL2yusJ04/wiww1ZR/QPog0hZqgzHxLq2H6uZAtg32Rl
	U7X2TStJUHRgMLe/v51+SZc28UjSkWWaBKhBN3+xAooHcSYDUkmhCQU3MMLqOow3
	+NcWyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qqmtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 29 Jul 2025 10:05:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dfd0470485so44881485a.1
        for <mhi@lists.linux.dev>; Tue, 29 Jul 2025 03:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783546; x=1754388346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H6/4gB0PQHXp3E9D6c+ROkMP3PajhH/MxVH0eBWIk6M=;
        b=RAspIugK1h0AY4zKlPur+7FV8zQ575bpG5r8HrIcMJEpxUUN33lOBUb6HIyMt0sQkA
         F/WBubVNmvUWeG7IlfuRQt4T7HpoPKcV+stmS4LjMrUkk0oP1GwAXbDTQrEpNgVeUs/d
         B6q56xV6676MKTCKgUhyVnHIoZnzYpLuj8lKDoEXM9Wh3Ot98dyZnAdbmMQmZWFUyyIm
         4fTLhQpBhR8iI2kTLnkVHzObSDyS2SAnD9DIwGCNdN4s2fa/KEQEIj4KgqnNgyh5hE/c
         g4ZOcIuFSGXrqT3Vr0OX0ruHupr9jbQLuf2k+36xLBAHl8UZwUI1vc1ThfvkyaYG/0UO
         5UPw==
X-Forwarded-Encrypted: i=1; AJvYcCVLxWtiNEicsfv9VU6nXq55J7n2LRAZEFHNz6bRfsKTOtfPR8qNFq+9z5ZnOvnp7yzI1aA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuqbVwLWs9kz7UFsfY5/5PPSOmjUxeBOIk7m/6MrUz0OCjYyNk
	gM8NgK67abr7qQ2Dvs0GD9z0EPuXMiiyb8ghl6j/nLeaszeyFClJ0zUVu7l8h6LsmnThMHX4M70
	XibIqgG+mRsgD1m7rQvvKIRpGvvrbSEJiC1Dj6C+oodIurMxDsmmFt3+jRk9hkBY=
X-Gm-Gg: ASbGncuUnVeM1Rp2jBlYWfVaxjJnZE9W9MpvYGVDBoyN5AquIEWv0IetlEezWE6EXYr
	Q8P/3STam4skTnFi3dH0crjylhFsNWMKl0Oj50yOPozRr1ex8dWybTyl8aDyQU5bUU+gUqTOm0z
	UQHhuFIXvW4RLmWVcrs4U1tgWe8Pao84sKpGVpkmeKkUxu8uf/kbKG1O+Z7vHKtEvg03jKJX9pM
	mrT+PZr3XeZwxXni4diPDXspf29M0v3rymdtLKvIVyqcaiX7AjUile+FXN+14EhYEyieN5cBEMW
	T/P8zGG7/bpzBHhLJsWbpMMW5WX+dNIs62Mpbtu3DdcC7a2XUokMkxAb8DHZTUlC6GKp9Z7sIU4
	Ejvh6ps0/j26CYB1v+A==
X-Received: by 2002:a05:620a:472b:b0:7e3:30a8:4c90 with SMTP id af79cd13be357-7e63bf6cd35mr779059885a.3.1753783546526;
        Tue, 29 Jul 2025 03:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGuwTBBhjZj+4ShS9oIceW3dlnFR3ST5BxB15eroVIhSQX/LLYlS6jM8I47EkjVzn5NEPIOQ==
X-Received: by 2002:a05:620a:472b:b0:7e3:30a8:4c90 with SMTP id af79cd13be357-7e63bf6cd35mr779057885a.3.1753783546012;
        Tue, 29 Jul 2025 03:05:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa4e88sm561174266b.106.2025.07.29.03.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:05:45 -0700 (PDT)
Message-ID: <ea81638c-c9eb-4a3b-9a74-a590729e1f8a@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 12:05:43 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [newbie] [patch?] for mhi to get Quectel RM520N-GLAP (WWAN Modem)
 running
To: Michael Fritscher <michael@fritscher.net>, mani@kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
References: <8040b225-5735-4bc5-aed4-f6432bb045ee@fritscher.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8040b225-5735-4bc5-aed4-f6432bb045ee@fritscher.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3NSBTYWx0ZWRfXy6xzY/lpzc/U
 tI/nYcuYg8k+fNxcfaeqQkiOOmJApyqpXyuIHj8e2V7wnA/v13OHMuQKmWZZlQwQ2vE0cGVVEWU
 TrgkE0cOh/+f5ZEo1OFK6oOgvh9S8ZyptQMok1UPBXZ7um9Wzj7cPV69kkQpvhQw+LPo3UTgl5R
 7YTvH4m5jBpwxrB5n9vyB75awRe20B2g9sCZWoYiB/FQFodvSy6WUhXwWvwraZldPPRqc20bMyG
 N2eiFMVDpbXovK1A4pFGW2tVAJgI5DHswt8bO/5bz/QZux2vvEfjTYxohF8koFXacWI6LG2xi4+
 ZaYootH7Vz0cvFVvcPW+V3589DmGo32MBHP8oVBnFLXp0PQSQG4vh0ay1mR0WIIU+5+1xkz2Gpb
 wBBdkf1XYUyaSvCAIp8QdTxMBu4Si67eQGHUcLiSzTZMbNdh2KCO2mZh0dd2RxBrXrc/ypK+
X-Proofpoint-ORIG-GUID: Yn_qmnL4t9MKk-bXeduqD7wXFEc9edux
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68889cfc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7JHxg_qRAAAA:8 a=SiqW3_QkAAAA:8
 a=VwQbUJbxAAAA:8 a=bEQMOJCF4vkCq3EJMD4A:9 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10
 a=xa8LZTUigIcA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=8Tj3VdMd3OmKtKXJkbp4:22
 a=0-oVHmElw7bdUHZZ8WX8:22
X-Proofpoint-GUID: Yn_qmnL4t9MKk-bXeduqD7wXFEc9edux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290075

On 7/29/25 11:27 AM, Michael Fritscher wrote:
> Good day,
> 
> my first email here, so a tiny introduction of myself: I'm a computer scientist and work e.g. with OpenWRT and microcontrollers. I know some basic workflows with git as well.
> 
> So, while getting the Quectel RM520N-GLAP (the GLAA is running ootb) I stumbled over problems. Luckily, there exists a tiny patch ( https://forum.gl-inet.com/t/how-to-installing-vanilla-openwrt-on-gl-x3000/45404/15 ), which only adds a PCI Vendor/Product ID variant for this card to the mhi driver. It applies cleanly against git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git . I've tested it with current OpenWRT and can confirm that it works.
> 
> The big question is: How to get this patch into mainline? ;-) Should I simply send it to this list, following https://kernelnewbies.org/FirstKernelPatch ? It is also ok for me if somebody else steps in.

Hi, you'll likely want to use the b4 tool [1] which simplifies a lot
of the boilerplate in the process.

The general idea is to:

- check out Mani's -next branch (since you're targeting it specifically)
- create a new branch based on it
- add your commit (title and describe your changes similarly to other
  commits in that directory)
- make sure you sign-off on the commit
- compile- and boot-test it, confirming everything's in order
- send it off for review
- respond to review comments should you get any (which is usually the
  case) - there's a big doc describing the process in quite some detail

[1] https://b4.docs.kernel.org/en/latest/
[2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Konrad
