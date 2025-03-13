Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614C22612
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741910015; cv=none; b=d8zlobahWXVZCO8IP4CmljmNrvyyXcoHEpWTXl6I/kdGRRBI3rHkVA+GSWJAXzR6D8FaQ0YxQVAYIX2cFZKvm/dXY3FMvAe5Y908z8v37fN5ienc7kASxWF3Su7rnEA64Uz1IxjRVNdQ5MB5pJ1MeavpnaBiycwORnyo4rt32i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741910015; c=relaxed/simple;
	bh=/WF7lCXlqMJQXcnRe/Nj0OUVnpD4zUFuEEAmeWVowgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNVwTx66RJU9a9/LovPAUkn0C6SQpPsVKnH9e70YOEO5av2feB1l89Vw8036Fu+TZcojhqubrsMGpV4VJHS5YAbIljXVxCzG/WgZAORRPIFkYSwSA6E26YQo6PKd38BXIBlSijV3G65/4RvTQKlo+akakPlYMiMeNHNPu5p5tBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPjRJhj4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPjRJhj4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNftrP030521
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1qHYlOfwaIa9F8NhGAepXYgOg3iVgKToWFIujHQr7Q=; b=RPjRJhj4i13DyISw
	zz5+4A/xR1gTJnoZrUKDpkGEAz1a929GrLPfOG0t5ajBs96ENsHjpaf/VtV9oCFj
	PjL2OKh0GXkehenNDE1/GbfhF6g8VqEd2n52DYKuajcz7WB/1MZpCRijGgLJtgtE
	sDiMD9iBrwj7cRVmGIx/Fx7QeKTjgmGlDRPSX/mDXnK9UZjPCIo6azdhpPNW+fXt
	C/PNF5GvyskW5GF82kpXmp6F0CDr61bZr1B9TAU3GhHvop4tIKmqiFrDMllI81PU
	xPxi2ywG+JJgOwJj+emdaZynXNzPokFVcuK+8LZflrQq89dHio+eZYbNu3/P1Zcb
	5jKXOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qqfau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 23:53:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-301192d5d75so4099328a91.0
        for <mhi@lists.linux.dev>; Thu, 13 Mar 2025 16:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741910011; x=1742514811;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1qHYlOfwaIa9F8NhGAepXYgOg3iVgKToWFIujHQr7Q=;
        b=czWefMYDKIzY4sFW5+DnThmmC+ftQOTp9BSUCm/WRI0xmGLnSh15uuNdc5lyBWlqgo
         QfTRYSvP0tqu5kQw09a8Taklls/Qqe4yTVgAc5Bp7MS2vg6yBfaEag3bRrwGsJY01DkN
         LgDV2/44z5wEDSJtREMhCZVfVnVxrBQSr5i1xJ6A465ghy/JjLsirUnVwez+83P08czZ
         zV4Bh7w73nKQKogVGLSo1n0qmq+e6c7XHqoNaVZTcKXnEt16dK5xt+t729MzZBBSzYtY
         Q/VdRpD4omy5kE8gS3JkehQ7lQxrM8fXZiCjssm3Ga5KaPWTUS4FRW1QR7AHGCiUtUzp
         aTkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAGP03Ec2yxb4PPR/5pWNNruUkME4Bgvrvfhz8fzru3C3eXodyn+JD74UZqXz6b5xcS5U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yys5xxlD35oMGta49a/r8907lZKIkMqqLvs5SUZiOqZhCyYSVEM
	7+gPROBS44g8cT6iBwRjEAjVmwH9i/BI3YXGreXtIV46Nm55CScZ3vikFkAtlYmker9w8/wvgnx
	PUnOk+BfSB+PD4hmPDd7fUxiRu4+7IhGcolgs00r4u+nwI/qVksE=
X-Gm-Gg: ASbGncurta8Ta3dkI5bkRFou+d6wfz0Anl9XOhNFotCvPJdetvItYVAxcpfLpYjDL0e
	H0GFVSE9hdfLk01L5YgQ8mOPE+S6qvQKxIHbkwWgsBMWVjjeRy/0ZCHJDSVGmeRro/QMn9XNZdV
	XO7GImyFb7EMo9clba+yj2PiAOmD1A4ftdTrEr4VmswYAZ8QFSsUqegBBo3nabhhcLULElDCdNC
	AMO6mzTf82SuVymhupnp8YOTcCYDG7yIoDoa0NtgX9yyYMXL/y+ZI0xTzqrRlkLBlnd+veo399p
	6+dKpzDN5pg8pfvXEa0lGdwG42axZGMsYTd5lv3zWYsC9lEjB6jjkwGjRHiPD9JiJvDvb1XAS6x
	0Yyn2CxdF
X-Received: by 2002:a05:6a21:328e:b0:1f5:8e94:2e7f with SMTP id adf61e73a8af0-1f5c12c790dmr698736637.33.1741910011163;
        Thu, 13 Mar 2025 16:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM6b+l2sHUOM4fapHzw2f4ilNzLLFqdXS3SQzF+UQWAtBtRNPOP8tJRZpq6HKBejspqZR3Cw==
X-Received: by 2002:a05:6a21:328e:b0:1f5:8e94:2e7f with SMTP id adf61e73a8af0-1f5c12c790dmr698706637.33.1741910010801;
        Thu, 13 Mar 2025 16:53:30 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea0428fsm1864011a12.38.2025.03.13.16.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:53:30 -0700 (PDT)
Message-ID: <06a86ae9-6537-4d48-82d9-60fb7e123054@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 16:53:28 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] wifi: ath11k: add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-10-869ca32170bf@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250313-mhi_bw_up-v2-10-869ca32170bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 16oT1nUR_8sji_sUxdCHKdohFW7ayFL_
X-Proofpoint-GUID: 16oT1nUR_8sji_sUxdCHKdohFW7ayFL_
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d36ffc cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=DXIUzMgivY99M8N_Z1sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_10,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=900 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130182

On 3/13/2025 4:40 AM, Krishna Chaitanya Chundru wrote:
> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> Add support for MHI bandwidth scaling, which will reduce power consumption
> if WLAN operates with lower bandwidth. This feature is only enabled for
> QCA6390.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

Tested-on is not an official tag but an ath.git-specific tag, so it should be
separated from the official tags by a blank line

> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

your S-O-B needs to be added

/jeff
