Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471796;
	b=bUkdvSuCgzTdjAS8rTwwO1j2pWR+hZMKKpo7RtKqrOuYo/BI5knaLOmGBEZpeMxzY+j3
	 YO5oNdzv6gTurkAdm6PHXBPV5PHAis3mfj+fsLrW/DkNKF/sX21iW/f0V2Hn8LIsZAlzH
	 RArDesKgI6MToL7yKFbN6GjbUHdIHex/t8d3JxvtU/GWTV6Vp/r7rxLfiJ7khtBEPOwRn
	 wHjmb+Qx90JvBpiCvJWjvpJ5D5+YwT7LvUiuqgXwXjrIdm0MqynyC5JouuFgqBq5fFj/t
	 PqOC2fQnRQuFusd8ElpAhv8C0B22SxJp0BQZt6qlxkGSrUkgaBqMhf3BXfbGxnpfijA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=08cEaQh1yyLsKkm7fAFIcqkmwiaYr3emRrdLH1THyPs=;
	b=SJJuIRluLExMycmdLfvuLyuM1LfpowRB+wml2j9p4uhNyJ2w2yZdxdv8wd4RXzxTIMEU
	 AwOrjQS1CwiuOufCxsuoh2b2ztONSavqvYMF2PUgRBLVWcZl7PZUEsppvKcXH/ZFW1AWC
	 PPDyugfBUmOtVizRxKpe38F6MRJpIG8wx8cg9L3YI5sbfBiv/wniSfsamovPkqIFlDZFZ
	 rXyKV8OYlOKUBlw67jazJ5Fg+Ps16+TOtXpCllqhJ7gIsRjfINl/KRmcWVSA73+UTHWCW
	 Nj1EEKFb64yBmqQmL8BnMabMEdIil8TGLjO2u+buwIrf9DmO7YvU65HlAmve/VKRJeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHzFKtbM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWUOWJWr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43749606A88D
	for <mhi@lists.linux.dev>; Thu, 12 Nov 2026 08:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43749606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHzFKtbM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWUOWJWr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aUVM1475352
	for <mhi@lists.linux.dev>; Thu, 12 Nov 2026 08:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08cEaQh1yyLsKkm7fAFIcqkmwiaYr3emRrdLH1THyPs=; b=jHzFKtbMwpCy1Da7
	/prLV5AfMnIY39wIw5nH5xtdfd+kAKw5CxvWGVuSrryNdVeLUoC8GBnlG4UT5kXc
	DQ5KunDrMLJyc2xY06+KjdsKhi89YI4WXkkN4olzW8P2ZJI1/sJhZw6dWL+VPBmE
	8zS9pcDDzZpy7JMZJLgDJ8IswLGkb1P+VJa2X5TRG4uxSb6s2av0A2R4ypBbmPEi
	S4l+6nuvYjCOtRfTxWlq1eNK+Sn0tzHBzIZ8bp+qD3KSvF9BuvssEn98BxCGnEiV
	FzEiuNwWM6UVIA/ay9NDuXZE5Sug2kttrn3e3o89ZVeudFIfPcgkyJkp3sng8ymM
	S+C/Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymueyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 12 Nov 2026 08:23:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso127407385a.0
        for <mhi@lists.linux.dev>; Thu, 12 Nov 2026 00:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794471793; cv=none;
        d=google.com; s=arc-20260327;
        b=G9i55OLfl53qaV8vtMw++ZTWYngvAdNxBweU81wQO9x0Zh+zn525BAhhR8sDyNosDu
         xjklPqlxUeWhcqgkeNvQBeswwT1rsdDCg5bzHENRdeuiIyLDsSAl2oZPr6ydN159SoPr
         XtXdHa/e7Mu39iNYFq6MkRjswFSaCp9O2n2NABqnwAhssy9uHtZMUv3w8QSFkZXKalft
         60VN5RM5xlt2KYDxDZjHSSO8ZmrzKYuqTNeGlxHgaxjEv9zZx3bstYOuE2YKrDShzq1p
         vVZCB7/C4QrYyrs0QWV4BntHYvVJFfsOJq31qOLF0R2+1jjcc92VgWr2Cq6hJ86pXg9d
         eRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08cEaQh1yyLsKkm7fAFIcqkmwiaYr3emRrdLH1THyPs=;
        fh=PMBYF9qJ94umrSa5t70gR5VM/rOcicp3RhL0SQuA/ic=;
        b=RR8PjNhwWWsjlAwHWP+OY4N7oOgyYbQrXc+b7jb21eWiUXBYH1HhQD7DAcsH49jOyq
         Ny0lM6kIdR0Y4EKlKBPADTWgAXa+Apq5Ut31k4U+o8pAinzqNDOETWHpbxD9xxdN6K45
         FbWv1B3S99xAiIfVBe7tCTnqzUBESvQ6W7fAfGkQmbCSE1kxyyrntpPypL8K9R1xCz+e
         yPRT0RXwU/u+1ZU2NuxEmj2Mo8Z28h5UvSMdbltsOJ8xi8dv6lle8sLxyz2RdcaFQLwM
         az984nmVAvBeAxn9/pFD80j/0C0pt0vF0IC84n4p6CaB3KemdEY9vPe9iITNPphiUPuH
         5qGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794471793; x=1795076593; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08cEaQh1yyLsKkm7fAFIcqkmwiaYr3emRrdLH1THyPs=;
        b=aWUOWJWrIprVU0D8B5HpeLik6sFOPZuXgphS9Pm0Dge2/yUxovAqaIo2sz/Ihqz7y4
         /s5fWa35lc1XtIItKv4ayhXEXbBMmAMAcpAZmtqHIvseTYSKe/ZkJ7fJuqFWM3c66Fk9
         AyiSg64kiEITEpPF8B9RPrC6Wabwu8SDVOVfCN8rfMAW3w+6iXeCuVWsaO4x//ODsJml
         dJZpGDS9H8HzrgG56mrt5At8n4Mo5PJCIvvaXiJnA8d8hjvsOKZUHjJEpbO2PsxnDTYc
         IHdU7H2ibE9lj9GHOqTNvhbBp8vBbZzqqGENrBtdvuIte1eCpLK/q9/e7ntQI0OoH4jX
         Fo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471793; x=1795076593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08cEaQh1yyLsKkm7fAFIcqkmwiaYr3emRrdLH1THyPs=;
        b=iX6ztM/kkVx1qWczJyNt3KC9OUsmp2U71hNWri/OVVCqVRGLyjRpYK9//8lgwng65p
         /FbxvYxFhO4xCGaUET1gGaQx+Xe/MW/EkiMK0WqHLrcK6uLBgW5/QWs6stWFmQzUvPb4
         L9BRwMZDfz8S2qVPwe8ucE8myMCDahNyIbuUsvgDka0SNG6c7Atdmvozy5FCSpCznLvx
         uQvSjW7yIQoNPLSqX3ElyY+sUtMNLcx8jHnyuOZQ+UNm+KeYVQOm1o0IbqK/K0K7M0Qi
         dZHWGNZ5iAG0qLqzdJmg6OncrlpeEumeDGLFoPIFfByfzEIPkzsPGL7VZspNk6tjlqkc
         kdIw==
X-Forwarded-Encrypted: i=1; AL+hErG622QEZBA3xTj9hez0hWQdbo8HGFKjzaKDAY6TPN7IR7VVJ4Vvvg1rlHI5CkscEEjdN9M=@lists.linux.dev
X-Gm-Message-State: APuU4Z8s7Mu7i2d/2cKgYSxWtTifFyUXMN83b/EuQuQ/GRtVKnIKrceP
	TyNxyVrRtxJ2SymUgm/G2pMF8hcU5IsQABsexlPk+EDmYNA/BV/dDOsLfCdI9vfSAdyKozi+Mru
	obVi56wQF8pf1jdNW7Wvco6iGUUrRSROEDjYktF6l9L5KSl3JfEwkaDvN7i7qfxS44ruQAmUF6j
	nu7UKRnx5OQre0Zbx7vs5LUOb3jWdzIQ==
X-Gm-Gg: AYBFou0IETchmHqqtwEpbPl2WTfJ6klG4ncnSdZGfveFRgEIz/z/J8+oBJuCsBlBY1e
	0ptDOs2uY60PxqKSXUlfEaPlD4E/U8C5LceZt/ETkvmSM11gk0wd/LVXTDWqHlLmtdAzBnD9D+y
	b6NsJUC7ZeXGxpjlRzfuBOesYB+l7+ASp0KZfHxvNMo/hSO49YnAEycci+yZ2GaNM8aJQhrPm/j
	dTIYVIUP7LGz79XBMZl4SmAGLDLY1OfelwQPhfrTyax1jOnaFlOGj1TuVqIAsUoK5xqCgKg/pk=
X-Received: by 2002:a05:620a:4107:b0:93c:891b:90f1 with SMTP id af79cd13be357-949330d463amr311772685a.26.1794471793470;
        Thu, 12 Nov 2026 00:23:13 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:93c:891b:90f1 with SMTP id
 af79cd13be357-949330d463amr311770185a.26.1794471792988; Thu, 12 Nov 2026
 00:23:12 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <b47282f1514a9012ac51d0915afb83782c3c0050.1794417398.git.len.brown@intel.com>
In-Reply-To: <b47282f1514a9012ac51d0915afb83782c3c0050.1794417398.git.len.brown@intel.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:22:59 +0100
X-Gm-Features: AclHuK9mf73E_udLBsal6MmjRAHMEHwg4PirGobwKujBcW0eeFtgBfzQgE6Dh_U
Message-ID: <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix erroneous system suspend abort
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ajsy7SbzFBv5zZZ2Y-vWlUVrFO5Eejr7
X-Proofpoint-ORIG-GUID: Ajsy7SbzFBv5zZZ2Y-vWlUVrFO5Eejr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX6/7SyTCjZRcN
 fxmh03l9i2mdLYknqWoqKZDec6MVAFy+yt0Oc2xE/0qoDfH57lD86kIxpaEuvzeJKEYZqqVWP98
 NbPYgh5gMiXbIBh77nGUSYj1YaAKOHRwB4BbSp6TCKLpd+bZmZV4q/gQsJ9Mz52Z8px2V1GUI0f
 JHT0X3s6YXHXGGDys/laJUr3ZXjAnknkHguDezvwsgRH/gMjeqomy8Vspr6INo+yOgqRrMHgbqt
 AOSkVyVnjDUKyrG/ZHKbgUPaf2+oGoj/Vb1kWUQmELzGhymqtonBk4bQT9fbGoESCIk9FR/oEu0
 kRUcNtU7CxwFYQf+RNpaUKrCBc6vPmXFmGud8M6GGp4f/OTBqWT8mQxelm91ZQC8PCxVUdJprGH
 vfPUqY5SEIZ8Tojpbxsj6xmnv7Y+AA2DdmlCSuZ6/cd3EZZOKVzv0p7fahMgGHHs9/INkkfUm3C
 rG5HMs/R98C5Lbj4vGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX+UxraM6SN2ZA
 JeMFWcM87UUpeNUoklbbAyAP6RsS1Tf1KQ/yOFSgLrQQm1mlQFgXQHzq0YM8txtiZ+QmJbUJv9u
 av7BTO/799YbPHalld0dQkWVq1ueYoE=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af57772 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=RwBrVW2nJu9fPh6-OooA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Hi Len,

On Wed, Nov 11, 2026 at 6:23=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> From: Len Brown <len.brown@intel.com>
>
> mhi sometimes aborts system suspend on the thinkpad T16 gen3:
>
> mhi-pci-generic 0000:08:00.0: failed to suspend device: -16
> mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend(): mhi_pci_suspend [mhi_=
pci_generic] returns -16
> mhi-pci-generic 0000:08:00.0: PM: dpm_run_callback(): pci_pm_suspend retu=
rns -16
> mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend returned -16 after 15145=
 usecs
> mhi-pci-generic 0000:08:00.0: PM: failed to suspend async: error -16
>
> When a driver returns -EBUSY for its runtime suspend method,
> that means "try again later".
>
> But when a driver returns anything but 0 from its system-suspend
> method, that means "abort system suspend".
>
> Always return 0 from mhi_pci_suspend().

Two things:
- I think we should simply use pm_runtime_force_suspend() /
pm_runtime_force_resume() for the system sleep callbacks instead of
implementing separate suspend/resume handling.
- Rather than silently ignoring the error, I think it would be worth
looking at the mhi_pm_suspend() implementation to understand what can
be returned here and under which conditions the MHI device fails to
suspend.

Regards,
Loic

>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Len Brown <len.brown@intel.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..b036fa6e06c4 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1727,7 +1727,8 @@ static int __maybe_unused mhi_pci_runtime_resume(st=
ruct device *dev)
>  static int  __maybe_unused mhi_pci_suspend(struct device *dev)
>  {
>         pm_runtime_disable(dev);
> -       return mhi_pci_runtime_suspend(dev);
> +       mhi_pci_runtime_suspend(dev);
> +       return 0;
>  }
>
>  static int __maybe_unused mhi_pci_resume(struct device *dev)
> --
> 2.45.2
>
