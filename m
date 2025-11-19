Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625E33C523
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544027; cv=none; b=E4lxZFHtPmsVJNXutjP06vuGEpm6lhFh66NRvTzijyG71ntdmMIjfqqA/qfGzsCMMDnpzWtR1ZZ3s13MBZvxvfQlhWg9n9OLWDVvXiuatt+kORRNBRB6+yXP7po64HQ+lGR0n/7ipJ02JSKhyjntdo1Zkg0SqmdigLLRgzeEF6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544027; c=relaxed/simple;
	bh=9fJPnNI2m4Mw0YErBLTK/xunUVSnJ8Sguqhqukm3oVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNB3GLqCU65cJi10bDTkecasgOicNb4endInLo4vIu4NY00NKlt4ynIcnnVjDD7aUcSKOE4kwpQfyp/ka3UGHYzJJdxhouu5I9YwB5XE8oPtUmBeGdMIq9pDjCE7SJGNqlpmDj6CfFoec+4nAeDKvU07u4j23hOXOLvvreTQZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb6SkCgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWeMvS+8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb6SkCgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWeMvS+8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ2R5Sm3165030
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0oqujWEyH8f4p+10/5HYloF0
	w0PhJk2k7kxRCmoUJvM=; b=lb6SkCgTzCZF49CVkyhmn3O9IW8BOSOoQh7dumF+
	T4rWEs8ttUJKDLC9MdbGWsv7kapWNLCZlMoVFddeJXh8FUm7LH8JeZThA6Bc8atf
	B84XzMPqgGzabFKC3JCGKxBwWWph2qqtbpLuWWfDnFSfT/trhK2Kpp8Lu1zRbSCh
	iT21P7qjO/1tM47l82uPbfdsYOH/49RDLXFQmFdj8HMy/XvILN/uP60rdfCuF4u2
	5ktdJiCwmQrBLAMzpzT1vu8axFxHI6BrC7hEPtqzuB84cbMdLiuYnJcLpImj1oie
	PEMShc2NWp+xiQaYDF9MinGC4/n1GgM1PdG9xNgbPo+iBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgtkjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 09:20:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e4b78e35so948909485a.0
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763544024; x=1764148824; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0oqujWEyH8f4p+10/5HYloF0w0PhJk2k7kxRCmoUJvM=;
        b=DWeMvS+8DOIuIhD0DLJ1rhRsx0FtqYg5c1Ki4GQIHvyLMoHvz/oChx07hKzHdydv+z
         57Y11LdGjWyXdp4C2WT66jBZAbJy2qg0UC8s8V6XSB85hQGahP3InsWZFY4AYlkVUJTq
         ALS8cfR9AdBEX154l0dWQqdtbdIUHwCIfQpLzRORid4Kev0mOl8tBleCcX1yB7cOyW59
         hTCDyDfN9sVlpsRJcTx7Q1Vv0UKE3nJr92XqmYGWcWO1n2eybg+3hujADvfQz3efmIl4
         a97pKHpEZ6MqBvJZD0jVIf4cC7l0D39/sj756kFmpsbZ9rEGtZvMR+DPUJnF5A/xZIDs
         uBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544024; x=1764148824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oqujWEyH8f4p+10/5HYloF0w0PhJk2k7kxRCmoUJvM=;
        b=Oteyby8aVCEy+pKWJQ1sbq3nhgqqVc78nCaohixw70ZpEC03gnbLXTSFz0uZoHsKac
         bQviV9Y2/HjuAViMVPArCvLATSwy2g65bjuYpGeJ7fWHe0n50fcxpn9Xk6j5QzIdHZ1E
         y+HT9xaEUreLjLwsPE2DUEalH7bLC2slQ7vpS28C1fhG1F6iSPd2gOep7xa//KIfhWIW
         XLqnnrw/KIdr3Tmh1y5SYDxHWp/wKEMY4tbI0++Yut56jyN7N6YaGxyfvQS7uPIHxt2B
         rUXOpBzUc5goTXdc+rjlvv/9aeuf4yEu3UJ9DNmNR5E7QWYZZ0oili4Mhelk955MMlC5
         l+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVQBGUwx6CWyf58BqD1/187Ry1FiCNgPnfn1ALhAfyN3Rq/NhD86K3a3DPawKKSDWJbZkU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoZfqDrnnIFwipED0ZUzOgntRKS6UFs1cDJFSJtCWPdoyHn4h9
	8TyeEhya1jUpKhIoKHu40dB7StELzWTAUm9fqxFayVbdZt3ZMaBICBd2PEXjToRFLE1JC/PCw1F
	p7qOHfcHnUBHdKypycgdJXim7Q7VbRHI3QQQHYzJU7E2v2aCY33mEGAc=
X-Gm-Gg: ASbGncuu26IGdkFSXlkCK4cqvjR2vmo4XkOjA1UxU2KmTqaXz2v+RaR7T0LYYStjYQ0
	MYV89RXKpq6DfBmRJmWc62q2zO7n6UDxtefLnmKu72dw59nmGjdj0M5mb4EmJGkvHAtNegDpLE6
	OLlqJ84ldSMEu45zD5DwWWSpsY2zcE+7o9bE7Fs3qpCMoJKwW0FBxleIgtsWh7qxSKTeJAETq17
	5oVUd+3f6nGfZtPvt+8kry/q74LcNa2McIVUB+XGqzVdCWbh/DFMo9U5AG0S8kh+xzjxDCP3Jqa
	xLPyIN/pv0Ey+b/321UN3WkLeZlfNfnHnl+OD5xqrO+7Hf3o4oykLFiYiijouNH98jKESru2a50
	gdCmWkZwEz+0wfwU7v9FDlzL1g/NC18EcG8tzYNvUisS0bLV9xYT4e/EuANSAARee7ONuDz/tKp
	52hh99WbKDHxqD5t3zwkqlND8=
X-Received: by 2002:a05:620a:170f:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b2c31c19b4mr2331069685a.41.1763544024382;
        Wed, 19 Nov 2025 01:20:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwau4TOofaMhlSnertNBlaCy1ih9htw4EInhnJfyfk+IyFhhOlEaMeDB1ZwfqAWXI+o957Ow==
X-Received: by 2002:a05:620a:170f:b0:8a1:426a:2cca with SMTP id af79cd13be357-8b2c31c19b4mr2331067585a.41.1763544023975;
        Wed, 19 Nov 2025 01:20:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1577fsm40665051fa.17.2025.11.19.01.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:20:23 -0800 (PST)
Date: Wed, 19 Nov 2025 11:20:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760
 modem
Message-ID: <p3b2wmi2kzpeywu7pavmve4tw3esfvp5ltuzr7lbbo4jbqc4ow@q432vndbmye6>
References: <20251119084537.34303-1-slark_xiao@163.com>
 <aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy>
 <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7373f6c5.8783.19a9b62ad62.Coremail.slark_xiao@163.com>
X-Proofpoint-ORIG-GUID: sOfporetXnO_ot7p0zQ5K3gDfJ-sGZ6_
X-Proofpoint-GUID: sOfporetXnO_ot7p0zQ5K3gDfJ-sGZ6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MiBTYWx0ZWRfX3sBUb4ywlZcP
 E3jAIkGiDLSveuKSD6LWa4O5XfJLSU+q1KaBeYNoL4GqCnupIien10PjXaatphypq2cfS+sRSsn
 Cg2GV0EB4XI8Ta6w1H3D1HPWltwTEAShSee1Pk2WWh4AJh/v1C+oGpUInVO/FH3PSx7I7GZdS4F
 eKbysc/tKw/Sab5gPD7kVnb6f8JL9Ht4UWM2LfGJVxVlp9cBQ/8nBEWWkFv6vJ3JN9or6KaGfTF
 H6CZnBzVF49s1Gx0Q5pYunzB/dUJCyJtIuFV36CQ0D2+kyX5KQxlL9zqS4JyPGKt6yIqvm0+8Vw
 Ll5FoTpb/MD8CcuHXSsQO3UGlmdeJUkksXOXk+ggFZRhzBrRcI2zr/Z8bd4csVY7SASCjS1sWym
 2mLpZkGKBnJyibtl2aFutROS+eEMAg==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691d8bd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=G7VRq2ROR16SoJa6LKcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190072

On Wed, Nov 19, 2025 at 05:12:06PM +0800, Slark Xiao wrote:
> 
> At 2025-11-19 17:05:17, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >On Wed, Nov 19, 2025 at 04:45:37PM +0800, Slark Xiao wrote:
> >> T99W760 modem is based on Qualcomm SDX35 chipset.
> >> It use the same channel settings with Foxconn SDX61.
> >> edl file has been committed to linux-firmware.
> >> 
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >> v2: Add net and MHI maintainer together
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >
> >Note: only 1/2 made it to linux-arm-msm. Is it intentional or was there
> >any kind of an error while sending the patches?
> >
> >-- 
> >With best wishes
> >Dmitry
> Both patches have cc linux-arm-msm@vger.kernel.org.
> And now I can find both patches in:
> patchwork.kernel.org/project/linux-arm-msm/list/

See the thread as archived by lore:

https://lore.kernel.org/linux-arm-msm/aqhkk6sbsuvx5yoy564sd53blbb3fqcrlidrg3zuk3gsw64w24@hsxi4nj4t7vy/T/#t

-- 
With best wishes
Dmitry
