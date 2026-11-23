Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447940;
	b=vzAdHfc/gdarX3xKtr6trHFsSPnVEBmC6k+DEPFsLB8SOv8wc4mT+nQjvT0N4+jtoZXO
	 keInosGxXVeiy4Qd1igv7yn6nuM4DxIbkl1XDY858lSoC5pZ7LoSpDvs8acoXf5z8ASLY
	 DSGjpY46OBDoUeU3uaA0Taaupi+Bbz8UtssyDu5offmlFodiJDwnMGttml1zieVLo+lHc
	 8QkfvaZ11CT/hI+re9BjWqXCMB9WVYLmtgwnD0j8xGfb8jyi5WqP5w9ESWec7HDau4k/+
	 f0y1Rn7HBGAJDgp322TXHByrVY6pAyMiajIFnUklP3+k5xDYuPrD0GWv3qF3j83k+LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
	b=4GBUZhRPC8gvHq3xAUFs16s8fquUMqBM7bCDZrVfs9kVWLUxOh9CHRNkEEEE2VgYPxfT
	 Lgpie8kwu2cGRuF3fEL/EXeBuP3b2bI2IffoRH+I7iIvDb+JO0KMsg5eC0utz/bjEtnXy
	 lSlVWmCgGT7/wy0sfdQkvFfipZa8GKKBRARv0XVpG4ya4cq0vymliiXAqQ4NfIjXxcU9s
	 ZX9FX2EsykiLL9jos6pUGqXe0UTuQMvfKrhdPZhyWn8vu/pQCEDLFFtuUDeOjAYNHtind
	 jVnkgZeuOi7V68LFT03U0XGeDYtQZz43eFQmBHp6bYJ0dxd5wQvy30pEzKN8141YQ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BqDRC2LD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C00606A337
	for <mhi@lists.linux.dev>; Mon, 23 Nov 2026 15:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C00606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XNi3fIG8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BqDRC2LD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLSNs1461855
	for <mhi@lists.linux.dev>; Mon, 23 Nov 2026 15:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=; b=XNi3fIG8bLeWMU+f
	PwdUtzFy62pJN3m/uGsa6NfdR7ouMm5LiYtfaTNBKNdEfLs2s6R1cStk/RtofF4x
	SxsjBrl8EMJQUyf9IbdVp1Kkf3Ov/9iMVU+qYILRHQ80s/FTqKbeAsCdcCIifPYm
	qQguOivaL4NEWgFe/ZZDj9CPwEVNJVVlZIKbYGV5HOdLSWGOnNn4ayu09OWHKM5A
	pLK2Rue2VTs11R8os2eWmHiavQxvSD1MSHOLPNMkcUdndOq3w/AVWm/RhpR3RtwE
	1hpChhkUrek4n3LkgToNrUj3GFMofKy2/YGBck3DD8J/sT2qDTMkRM36+YjhmM+J
	t2o3Vg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a21kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 23 Nov 2026 15:32:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3847a8f4e77so461345eec.1
        for <mhi@lists.linux.dev>; Mon, 23 Nov 2026 07:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447939; x=1796052739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=BqDRC2LD1fQIQwIrLWN3gwdF9ycRsLQZEmFgWG5QYcYBTmQJRKdTMyPPxI8qHLBcUE
         Zqn/Jd3IOI0VtClznwuz+ivVNg5+Sujuq8mVQbqRHlPF8m3CUBqIi4shlh/4EcInCnlK
         UdjC6tvkGKAlcSG0HfjuynAmRvijhSO1qLlE41HYhut1N1tnfg+NPaRKKZmkbe0zWYkQ
         9H4al7PWywAwU/JNRnku2rKnXLL/iCFw4M3MVPzkFG2RRxGyIDqyNyu2SVH/cP/kHYFS
         Xv6G9AHqmjq9BDzRqLAy5UG0LcJ9JA01YGCgsYKcsgCM3HV9mo03c1T9cn3gcjNbrKF8
         cGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447939; x=1796052739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+cg+HLLf1GgThk3qa/fLNtMDnlxrXIqtYEA8DMiby0g=;
        b=mel26t4rfl/Z6JnzyQ6xwGE++7irB5qpjFYRafgFaCnyVx5DEkX0tNhEc5hbbYweEe
         38STgcDXBx0rD0tIBHVF0tYwiwbZ0LE/7F7eiP2+77eNZjLucjO5E71jX2bgLuSjtZpF
         2xFs0kcVPRJkB9rDt0fO8pzjYSMBhe3SWyPnrg2hgPIDTZARfqAzmCzeJikWhvQFtuvd
         Mae8NBc1xTsYv4B/TsEB+e/0FYQxapI7jR5CJe3WtQxnVt6EteWHbGtiDFl3jEa3ud7U
         RBmdlVWjDSB0vN+UnsAj81QQOHAnHJYXXlFSyh0dnCPUz5OGXPVfNFkRRUat1W/a9HIw
         yFBw==
X-Forwarded-Encrypted: i=1; AL+hErH+fsgzq+L/4wNEhw4l3MppN1oXd4C+U+sbyejx9cloHgVdPa0t46t6f6uZxFslwM1wXOI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8RiVv6uxBQYos4IZwVviyZrDhdwxsmv7ySh25gOa4OBT0ilux0
	6exbvm0jO52dyxu3gk2WdrEF6cDWCTLG2HgrK80dyfmeMDJZfXhfGuQUEMpRL4teuOd1LfdMdzb
	OxTJgo/rYSPK8qBO52zKkltydFAPeDoWiEOCBRU0eNC6QQskr88FM/R0=
X-Gm-Gg: AZFdTZeQDGoFHQiz/4FYPCOIzR8IVILkaXtJ8JQhSD4Yx1Ogr6V7ZCJXiRTGgm1xD9q
	K3Xv3W+YFf9dgYjok5Jm6lQOF7GVtsgntEg7n6IvcYAsti327F3nMfALdAGrIJAhmND40TmmZqm
	gt+Jp5bF9gm2Hv2cu+gaHVcwcGlZzSOsQ/L+cyRKK5hMuzZr6MWG21jkWikoxny7dVO7rBQIWPe
	6DM7YtcTNTyqUvRpx3osvQChoCDnQBd5NIUq0GVh9ElL4kL7if0F+YHDOq3oIs9fRF1VdF/5Exy
	oXJmpeCYWm4fiEwHKAjiJUzlkZkX37cX4VabAG5h9uBLU9NKbsVeMiZP3lUtYL6BwaSYEEP2goR
	zJKp1CgXqBFJwSVOIlcFAEZH7xs5MmmNGjX2lJpjooIp/yhhvjxLm7nNHDO2zkhEiFa2ClgM=
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458781eec.0.1795447938630;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr19458731eec.0.1795447938084;
        Mon, 23 Nov 2026 07:32:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm5516406a12.9.2026.11.23.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:32:17 -0800 (PST)
Message-ID: <b777e26d-98a1-4cef-96f6-cdab7918a1cc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:32:13 +0100
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
Subject: Re: [PATCH v6 6/7] wifi: ath12k: Add support for MHI bandwidth
 scaling
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
 <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-6-9a9a715fcb46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX/JTLG07sJPkG
 uP6Mz+o9/TyK4VXx1qSOCWfioph886X0OVPXB9oKrn/psXGkspl9bW7nBRKpW6dezNbfr8x0eCW
 1BPKSOTOto+0F9v48zW5pga+KlnmBX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX18WJhZvZjHPJ
 95XGlPMVQ2oHu3I+dDUnAD9zfD7+LjNW7CMl8Lq+XA5CjgK4vh24sgp4HA+0p+mqhqCQ5W+VuOe
 pAFP48URIN6QOgzpjvUe8uucLydKoSbT6joP2BqVl1AeYvAJmy5E7Ype46QXF1bwg5NTP4/Ge1j
 nDlcjiF+lefuKGFzBslsLYCHchQqwagx5t39XHPuwTWDP3TqR/bJpBlRPbgE83NLP2FVZmUFZyx
 MdaKB8k71fgSVXuaslldXpOem7I7foBtjge40TcVyCdEcRy1tEzOWn70JbqeGgmFjvl0E10QaAf
 00SQ8Kx0qyZrGjGRZnw0HLvDLY4mvcSMznJeLlqqnq7IOjqRq2sOw+GMah5NSTPAXv8aZxRnpdi
 A1GJ3VxEuBolUSsBX44SVzp4ECPwUCwMeeqinEn8Gdpm8rnubR+DVuJBsAnQ6M+tv23hwt4eMPA
 YfYqpbMwxN4Xl6EqQ6w==
X-Proofpoint-ORIG-GUID: S2HK3Av2AIiPC0EOjO8nrrThFvgrt9wd
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b045c83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EZJCw1MXRrN0MplZF-sA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: S2HK3Av2AIiPC0EOjO8nrrThFvgrt9wd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/19/26 1:56 PM, Krishna Chaitanya Chundru wrote:
> Add support for MHI bandwidth scaling, which reduces power consumption
> if WLAN operates with lower bandwidth. This is only enabled for WCN7850.

Curiosity, not necessarily a blocker - do other ath12k chips also support
it?

Konrad
