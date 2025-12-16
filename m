Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFF3358A0
	for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865518; cv=none; b=uj7KpTeCdbdaIGkRPtEay4tZH9/FA49N8nkMZV3cYVBiEqp0QBnwruijza1RMoPoJJ9NABSCpsi3hU1PcWU7R9TsTLyTXBeck2pizPNMsMJrQNUHracz0QZPfNhhKAzXvRCpAtevwK0aGiV+Q/kUSmvnrxT1NNAU54x2y9lLXMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865518; c=relaxed/simple;
	bh=i1Nwt0cCOQGDA21YL0EvQLhtpOTFKxdTlaMYLCDWRDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efT4t9h7qL+fbK7daG0etKU0V/+P7t8Fn98CjqOpwfu02wgg3VvB4HL97u6e9s/HjSPk1lB+PQKXDrenSwT2IBcKbcjcJelj550bJRTbIx0x9GAy+nDrnoVwogofZirdZEIf3+9+yxrFtvyY/u0jsnzY2yxUQ9FQpNYrBw7ma5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AErAzs5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJLuHv48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AErAzs5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJLuHv48"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG25P9d1205156
	for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 06:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GYtIKEJE2D2FmKqEGGzDBua0
	0Jcsf/HU9nFna+Bnk/k=; b=AErAzs5D+qQHkkY0UCul7jV9PfK3iI56TNk9mb+o
	2DWIbIWXO6hDBEelq1xI9JL40uiSdEMTYL2zdzXngQcMYN9ZdQWp/0ySAgZHaqgr
	FZXbvIq3UbhFMNyEc2KXYxj7xPO2JcDx6/Kujxq7CTHTLOp4NSnKh09dlGfe1wj0
	5JEeXOoX5WNeRwDWiDE6SRxjaBfO3zgqpOiQA8f25SBXLGLCyF8nP2QBBoqF7cjy
	hgJQrUmYrvmRE7l0cTtGk/6nlhgordUQq67NNe8EyXre2NRQKDlDH4WaxxlObUzl
	MUxzTiQ3lo2W7PVZJxXnTyvo2nD+9/9ukBehF/oIZmsrYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdajcq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 16 Dec 2025 06:11:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so4783020a12.2
        for <mhi@lists.linux.dev>; Mon, 15 Dec 2025 22:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765865503; x=1766470303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYtIKEJE2D2FmKqEGGzDBua00Jcsf/HU9nFna+Bnk/k=;
        b=RJLuHv48dewEndY5Q1CafWSNFwVLUbVWbWqu5XGqaxGVKEPZrrH50ccaC2leq4mIjt
         /9ZmXVSIfMLDSsck7N4goq1znLkt3LgYqy6bmAF4E9X18G5AWLripoepIXfhrvjXRd2N
         Sot16a/b9v/Jhc5dFTZAvCcmUL0MW7ySFNg//sAOuL49mXP9zZnswY5kdk9w8QQtWEEH
         w//sD61tqnW41mX7X8KhDFeITpP9ner5cz79tR9pPedtBerwLbwrmcdOXoLYAiEjHY38
         FKOlMYMEFrVQbzEY2+Nw7fxkPzsj8yYc07N2Ej6Bq4opap8eORFPOVkb4YEL1KwQq//g
         udNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865503; x=1766470303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYtIKEJE2D2FmKqEGGzDBua00Jcsf/HU9nFna+Bnk/k=;
        b=f9A0FJStRz4waTHSZVS2hP9LxMDLzu/ZJoUr+SZLT5XhyN6tSk+i8nUzaOCCCo8Sox
         dkSwk2qeMNRaVMmeLwYoIlaKu/SqcrvXVL/C5fCDeihXN6THgDdKVCEJ+f+jZqckpvC2
         bb3Sujb+dWWv6+QFtFd9ONqoVmcDMGuaUx11nbL0R7lWtRj03DE5LNjQoWLu/muhXV5x
         GmcngxeBmC/B5JplyCN5uFuR6LdGvfRTBm02xrbdx4KwDdSiH8V+xxzJm5OH/ordE7kd
         SunWBIXxoNTtODl61/kcAHaDZamsaBqzcULKaodS2heMwNgnw35m+dkUaYZgrRVS1qzK
         E2eg==
X-Forwarded-Encrypted: i=1; AJvYcCULwb86fyNiL6/tyd2zy+meJ1nuOPQOPwuN+GS9vJwrRB0Y9wVHy9VXMYr53bGg8B4siq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFG/zwpZCqMOIp7r/krmMd33F55TrSYyb+2SmrmGSdA9Egxg7B
	rZFxdZgo5osaXBAQ8s32ylj7Uuw1D8h9ygiV6Tz4PtFWbX9ODlOH9F4GQwB6D/DfntaNk8+gP/B
	fC4IhR6WUXWXNmOv3S+fEzbfEQpl9vtBdLq+zps9FuAp3RU6wBgsLCMI=
X-Gm-Gg: AY/fxX4VwMrLWhjOoXatJtSHBrcgDlZyJHc0wMNe/2nT1IZM6A0ZNI1mN/w3My1Zi1H
	g6Vn6mc4Ij2yNNSvftONT96VqsW0ps9J2rkKiVG2hcJIU+f5WFjnHVYXTxUdsxkvBpMdInaJs7x
	gu0PN7l3wrSwd/MhcyNM16cKeuQ8mhOK/7SqbsW+oaTTEP6JVvXdAHOjPIcIrpcg2xP2bJzuEmW
	QbInf/uxDrD1LqGneoo7WK/Zn/pt3S8tkEKEQMqj5KPXh7f2m1eEZpNGT7TyDckyB8mv4edlwXP
	3x290EelkX+p3rsfocpBmG6ksz74Folu2X8Ii11eP5DD2qZ1gIRdKX+BaJb8i+dDSqdGbgeC8cJ
	m9DHlnOLXpOhhIviyxPJK/Qufkv9chOTHrj9/obL//QbkZD21uNzPt4Ia
X-Received: by 2002:a05:7022:2485:b0:11c:b3ae:c9e9 with SMTP id a92af1059eb24-11f34c2da09mr10389182c88.43.1765865502722;
        Mon, 15 Dec 2025 22:11:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQUrjrXhziyFtXJsM6JkEaIAFtfz31jh8L3KbQdzLZxoqrvqw0zeZlF6U5tIO/dtPAtWXSZg==
X-Received: by 2002:a05:7022:2485:b0:11c:b3ae:c9e9 with SMTP id a92af1059eb24-11f34c2da09mr10389165c88.43.1765865502211;
        Mon, 15 Dec 2025 22:11:42 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43ced319sm18229042c88.9.2025.12.15.22.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:11:41 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:40 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v3] mhi: host: Add standard elf image download
 functionality
Message-ID: <aUD4HLP8wZr4Iztn@hu-qianyu-lv.qualcomm.com>
References: <20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com>
 <ttpn6o2far7xebghblurxvi43aohv74v7jq2vdgc4jhgc7avo2@lgp4y4sytene>
 <aTZxrhpYhoOP+VDz@hu-qianyu-lv.qualcomm.com>
 <6b115125-17f9-4eec-b10c-0722eabe517e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b115125-17f9-4eec-b10c-0722eabe517e@oss.qualcomm.com>
X-Proofpoint-GUID: goQgiCxDp4Ra9a4ddqCTmPgduKKfrdNJ
X-Proofpoint-ORIG-GUID: goQgiCxDp4Ra9a4ddqCTmPgduKKfrdNJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA0OSBTYWx0ZWRfXwyU95y7aNkRy
 3xms/ICN9jPSEnRGV1kcEscGYjwfCCIVpYWkl48Y0McTb/cpxVkgMdR6GD+GsuEpRlLRgy81mg+
 URhSMV69RT6rxjFKVWdluAUiXiQavyvAVDqNULwI57mzS0kO4ov7sXR2KbAUdNI5rN6VIXdp7iz
 P9rS9Kokl0wNlOYwDvYfYKH34G1A2FU0pG/o9BU1KfIhS4EEmgA4VyODSkmMCaCPHTB7xXzX1Au
 v8t5hfCtZsJqbVo2ljPybvPBHBgdCxqhvShuSImMnoOrJFC8yDOpfCjwaSKOgxtZE6nsKVR+Npt
 uvQ/6XuD7rEUd7swP6GeE2duOGH8iSUhuP+Iw37wd+PUUECAxMW1Iz1rZwKgqnKR3fsNn6mrw0z
 arf0ublPGGuv4bSJQ0Q5oeKBVEtqiQ==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=6940f81f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RwQgUtxsi0qMzmDKmZsA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160049

n Mon, Dec 15, 2025 at 10:21:58AM -0800, Jeff Johnson wrote:
> On 12/7/2025 10:35 PM, Qiang Yu wrote:
> > On Sat, Dec 06, 2025 at 01:25:34PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, Dec 01, 2025 at 06:33:15PM -0800, Qiang Yu wrote:
> >>> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> ...
> >>> @@ -445,6 +448,7 @@ struct mhi_controller {
> >>>  	bool bounce_buf;
> >>>  	bool fbc_download;
> >>>  	bool wake_set;
> >>> +	bool standard_elf_image;
> >>
> >> This flag is never set, making it a dead API. If there are other patches
> >> setting up the flag, please include them into them in the same series.
> > 
> > Let me discuss with Baochen about whether he can include the patch in his
> > series that actually sets this flag for QCC2072 device.
> 
> The QCC2072 patchset under internal review is already 19 patches, all of which
> are specific to the ath12k driver and hence would go through ath.git.
> 
> I'd prefer to not bury this patch in that series.
> 
> Would you be happy with a commit text note that indicates this functionality
> will be used in an upcoming series that adds support for QCC2072 to the ath12k
> driver?
>
It's fine to me.

- Qiang Yu
