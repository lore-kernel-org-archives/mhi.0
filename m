Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587122;
	b=XmEBv1zfIJ7ztbskKZ/W0nVbZm1SJPfKTiMuTJqlliVs4GzgPyNkCHyQJitH6R11jG2o
	 rnkFdv7VcaMOAhUXMAr39szXO7unQXtaFc2fjzqMI18q0Fg43RCxXrpcRpux/sGnDPAEX
	 6qX1ONqHYR85QNk+xoiqI666gYhwuMc1g+4ch8ua2LSa+5XlhXoxeeZmmub6ZE3YO/+Nv
	 H7SrUiXpBUCiPTY4/nb9jEgqj1zP/W5ZJvSSCcCFNWjk0Q3r8adhjMDHf5z4LReQ7ARoh
	 Ps1OrovFfs9gGgLLkD/rWVcz2zv2BujJAYwFt/HLzpzKcURNlqRohstZSFXc0ln+Hxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
	b=BCxv8hWrktTv/ypN609TW1BDqoEzJSisKfgWbnHVICGFsfDbRltrxByGSHgXnfCLyYMs
	 w+gqqNsUDEBlOpCMH/nqOg8yZzloYH/NUMnRHd4G4XEWNp7wSMLKlw1k3yYCIIZRT590f
	 y/8jA6hJPJstdLlrERHShiB8aIgG6tIw026poP2CyHMPv9SEi4QYpNW8+mYtsthRSyHFG
	 uf8KviC5jVM78m+uHOpD5TY4O+hPU3OiyYaIT3FezqHjS4eLm2CAbJHgdLGFEQeD1U5TS
	 p9xNNzMJgThfxwhSZcHlxr2L94gsQoqsYNjldN9IPaKo0VyqaRxZPpYSPWzW42qafCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gketJED3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMJMvDbZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A5D606A327
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 12:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gketJED3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMJMvDbZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg6Y5977407
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 12:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=; b=gketJED3Gng6Tm+J
	KacvTNyCZfwMvS3Lp28mWyYLX9yosEkoYK3b9HIQfhAJMRNTgT7q9bE+QQQl9nWT
	NV12o9+UP9p18OSgcaYdd/VC7zrlj5hOsG/rq9rT0lDWPbb8xv4V+/tlNycOa5Z0
	UXriXCV0p/+MICmDwUES6u+qHrne7Jvx2kKmnHz7SXM+BfPxko1JE3y6Y5U3dJkg
	4gLNCFrZtcwHJkcaLNRAJP1ei2oXuo4+LjK46kkeRbM/6gVPliQ/McaqutAey1BO
	Wy0L1UAE5aQjoi7r0lLlA+I09JT7RUxnkQVdqFnptbepx3tXn0tv5v/KeVtr8uXH
	pumlVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs035tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 12:52:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so118858985a.3
        for <mhi@lists.linux.dev>; Wed, 21 Oct 2026 05:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587120; cv=none;
        d=google.com; s=arc-20260327;
        b=EdMY8xm10GJWLQGktC/VtE6mtI3W0Bk8X4YafmzpDa3WlnYtpoiY0xMRnaPO69YvDk
         sQric2tgRgTnBca4vtoundjnCRv6wUI//cXPCQNFjfbz3MamTlvkUMXupyHKeuunohmE
         Tjx0xh88mgAKWW/1vptGskgTP6Ak0ILWgzTxIqmoyp1UD47+A64kKR3ij5Nnlt+k79Ad
         TE2JPtmO1kP/NHHgL3d9TN3ND8klMuoso/407JOe7ajUu3kDwBdia9/Nj97G9Hqmzn3X
         bvbJDuhmOBt/BKABBnrIZErkM1tzzNkDVjueE82VHjj+3r9YyivICRMJA3Zg6DJiUnMO
         fuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        fh=vJ78N3NSTRidm4p+RbkE0HOcdddWiYtOc2TuhYNNo24=;
        b=XhUynPcj8jEL/38358gzrVUT7mJGLWK5Cu8n8xLunzI50OpPWRS5vRkJ8Q++me9pUr
         GxczPF+7PVoL6neEx/rj1ijW5YIKRsVlLZHTWBQ3uuNVF+VPlO2jTsGdDbJsQgBXuUpD
         MloHo8aHBcdzA/pwFdm1qH+0aXz9RltdHn+6oYz0bdbBVaQsxOqf7UVSiw6wYeK87YaL
         vog/l1eLR6odKncvct4TzpYsRfvODCP1rp7kP2W2rLILmPLr4KlkjjhIi3IuhrhfIFwv
         L6ybnDsWzvgOAYz3Zf0JEJQlxU021IqKNIdIOTN/Kkh9hDVNtlYIoXmJrlZZO4XR9OiK
         Hwlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792587120; x=1793191920; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        b=OMJMvDbZP5S3lBSUSTMA0VXihc370vymGo5SPjBC8+zJ2CmMuhvrtyg0RVHgjWdorZ
         zmo0/fbvxoayYti1p66m9XkLdkAlJrwXoUiKVbK14XDrXSoCTNkaKCT+yNLNXgN+5+jA
         8FA2GdCeOio+aubz2zrBTAjznswDp5Ml8xISNXpY6sPlow0iiFw1TgoYmXpz8+LB+gN/
         S9Mo1TuFlTZfYqqytRe3OedDr4zy5WmG7JJQsk8ze+MGDwz3DzoaOa0vktTFF3H+/yJP
         k5+6/3MlzG11PCxoyQtW9tZmciLsTNZzbPCSuGes8vXAGJddFq4G/MvCxHub+CY9Df0J
         Pt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587120; x=1793191920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKCN/Ntx/9lDpfB3hIQgsrXXGLrS6SF0i7Fxu+R/PMI=;
        b=URlJxlQO1EVDA+4B04am8vPGgmOGI0myb5KFW3p6GPn9przD5SBDwUOHj4/CbKVh4M
         Lb43XHSkT57loFTUSI5VdDA/59oOKXzFkVNHCTkUGUeKQt/57QfvkOY9cOdieHMW+Jh9
         p1Vqj9zzEeAHBCGZbVGVgs4Mhr/3LE4RlEQjgBZjRBTJLiDfutLX6/kCh1kcYQPTJBZd
         uGDGtxiarxW2AoWvC5Yf26jDIVMIvqIDAt+a/fCD1xVrYpncgbgok9zoq7kViHaaICg9
         wVItKlJp597TlVcewjoDy01yeoZlfIGyuv5AGpAadHupdsDLo77OSmvceYiS3z6yngBo
         vR3Q==
X-Forwarded-Encrypted: i=1; AKwUvBykgBfe0iH3irOkb77bWt+67UHeXzbr9AiEuP632I0OXfYr3AXp9TVLsLh5jEqRF4N/Itg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJlI5buqJXgaEXE4LAIl9H2bHSI9vQ595acZXjgiFrVzmEMycjQ
	sex/u7lD2IdRZqjodjAzgBqC9kqpbIhSbj48Qrhjb2KVWKEh62DJVeQtYs+dJlCI7Gr6JU7R5QH
	wAG/iYqTediFwIVFo4b8emCOdg7YphdVcCeH0mJqnHYy4yXl4drn4HKRBc5+nfKl6JyaExxSHIG
	E7HEo5mZ49jrcZzW3sRFTqMFWvjLiReA==
X-Gm-Gg: AYBFou0pyYEb015j0Z+exCDsnQxc9CCEJ3P82lstqaftnowltc4mC7n5PQQuEMTPASI
	+fqWQstL+n8sF05gfct8ELVm/biP6iys6VgW+j/jy1dd8WN3crv79N8ZNjjUzUrf3iDtABV0y1f
	/lFabLS7cw+L+T0pECO5qzKJkdP8yt5fm1wXKTJRa5a3/KGqgV7uCF/fP4l97kk6jiNVHYQ6Nph
	bfDiYhommIgOyc1w/1kEvMp2dBxaXv2Z7hqTzqR70v58DEaMIja+4nC6M7uUScrcPCkxFHw2Ew=
X-Received: by 2002:a05:620a:28c8:b0:93f:2aa8:c550 with SMTP id af79cd13be357-93f57fa151emr385796685a.26.1792587115071;
        Wed, 21 Oct 2026 05:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:28c8:b0:93f:2aa8:c550 with SMTP id
 af79cd13be357-93f57fa151emr385791985a.26.1792587114427; Wed, 21 Oct 2026
 05:51:54 -0700 (PDT)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021105434.29897-1-slark_xiao@163.com>
In-Reply-To: <20261021105434.29897-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:51:43 +0200
X-Gm-Features: AclHuK-yPVVb7PzvbUMTFtaNy5JD5TXtzFZ7YNTeyh98oaWvr44i4RUl_uqSzOU
Message-ID: <CAFEp6-3F=fZ+kTsyZJTDk1Qfw_kPY-2u0G-PDHs7XyBs8tyOWQ@mail.gmail.com>
Subject: Re: [PATCH v3] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, val@packett.cool,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8b570 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cfVVBkdRkn7iCyj4mtkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX9Xw9UVwgBKHR
 HICfeYo6LhSBJh8bX7KAPeMYBNZ/2NizwA83y+XTrjmHupd/A9sGyMR4akZDci1r8u+ap31vtYe
 ++Geuaw0xdcvD9mYzbKsletkljRbHFSViXLK/ykX46ppqEsnoEvSBhhEZ0Szl41Q+VOyoxk9abr
 Ovz4QnuPi4LgsDiUBieyVOoZNJ3wU0bG2t1rlymrG1gSO/VaM+gjaXheHAjPKPAjrKHDOCJQtLn
 t/KMX8ONWeoljjtLWV3YCb+eEjO4bguKwmCF1mULkXB1eXrsUGREdkyVWD6kvcGb6/BniIfYEaj
 EQFJDmZXMcUk9mD3uxqezSfKWMQllKKup4R5oZUVuXX8+g8SoIcRQe+4UpiQZsA8mmes0bzA6Ev
 cKzH8mJnwHny2+SwSDqzTL+rkRB4IFhLdWcM6O4fcnCV6zEUn1k6dNmpQdWjoAeswKu63l315wm
 CCbPb/PINKml+5K5TxQ==
X-Proofpoint-ORIG-GUID: AAC-DM-fcNZQ4V90pR5I0T3UhkCoglYk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MSBTYWx0ZWRfX4bf5y6jFJrcN
 vYqDm7ZRggfy6L9kna7mhxiHJ5QNB6zTO9dI0+HwuOMx+isv8/c2QHC+qvCsgUJrOf+//7Qe0qU
 jtQv4qtiPoETi9tpESLRu3uMQ9AsYf8=
X-Proofpoint-GUID: AAC-DM-fcNZQ4V90pR5I0T3UhkCoglYk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210051

On Wed, Oct 21, 2026 at 12:55=E2=80=AFPM Slark Xiao <slark_xiao@163.com> wr=
ote:
>
> For some MHI devices in some specific scenarios, the default value
> of autosuspend_delay_ms may not be enough to handle the last wake
> event, potentially leading to device timeout or link drop issues.
> This can lead to a runtime resume failure and a subsequent system
> error:
>
>   [ 8749.089545] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>   [ 8749.089573] mhi-pci-generic 0000:73:00.0: failed to resume device: -=
22
>   [ 8749.090218] mhi-pci-generic 0000:73:00.0: device recovery started
>   ...
>   [ 8752.940324] mhi-pci-generic 0000:73:00.0: reset failed
>
> Following Qualcomm's recommended settings from Windows and their
> suggestion during case discussions, update the default autosuspend
> delay to 5000ms for MHI devices.
>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v3: update the commit message and the comment of the define
> v2: define a autosuspend delay timeout and explain the reason
> ---
>  drivers/bus/mhi/host/pci_generic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..17d51964b55f 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -21,6 +21,9 @@
>
>  #define MHI_POST_RESET_DELAY_MS 2000
>
> +/* Timeout to accommodate a potential 'late wake-event' issue */
> +#define MHI_AUTOSUSPEND_DELAY_MS 5000
> +
>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>
>  /* PCI VID definitions */
> @@ -1483,7 +1486,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>
>         /* Allow runtime suspend only if both PME from D3Hot and M3 are s=
upported */
>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +               pm_runtime_set_autosuspend_delay(&pdev->dev, MHI_AUTOSUSP=
END_DELAY_MS);
>                 pm_runtime_use_autosuspend(&pdev->dev);
>                 pm_runtime_mark_last_busy(&pdev->dev);
>                 pm_runtime_put_noidle(&pdev->dev);
> --
> 2.53.0
>
