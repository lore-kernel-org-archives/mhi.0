Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBDA401480
	for <mhi@lists.linux.dev>; Mon,  2 Mar 2026 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462719; cv=pass; b=np8gX8RCX+sgzoLwDXbpIgRvuNwXyEJOFy92g6SIYFwFWDoL2smv/+PYY6gd4bmSD1AXgUYFzIZOJ4DPojOelZuNxidwoDTuAZiKUFZwzS2LTJpjvjC26bAmViEib0PeYlYlIE6GAvs1kqUZiQpQqmkS6ddZG9cnUrmEynPvszE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462719; c=relaxed/simple;
	bh=hMGFPbgcy/TDy785SFcklcPbDYptUIGhTow4s756vO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmPdK/30b6wPqXIYrqlBT32SPqzqrVaRWjeMcCkBYVPn/Z4I/AYcwNbrkJsL/6qIX+NqeqxGLMIK6ZBi15q1IZrJLgWXNpK77n4x5cWw/fSVip48cekOF2vG4KG+xOfPqyTnxLKMMen0iODRm/n/fRyzJFvncUAam9dAnoGaGJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUpyE3X7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWdNvSyn; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUpyE3X7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWdNvSyn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228JDqF3224157
	for <mhi@lists.linux.dev>; Mon, 2 Mar 2026 14:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=; b=nUpyE3X7u+6y/0JT
	NVH/iPuT7cBuBVhVQSQkhyxSohal/Tu5MmTgSUobzaBnEbRx2QQlpsg5B69VMwJE
	B7xdcbkEOnd2Rq6BYO+p70sJCeibJ+Gv0veeDElUqJcbAhab1XRGGAb8nKWmpY7z
	bUFC9AYyZ/CZnmWyCtFiOSGjmgPg6n1LmLIwCantWjI9qCRuJ8si7IrsVTxtJO97
	m0TVVQnmPvQsmAmPmRUTRjMWpe1WkacbI2rKD3cLdV+RHq5h9kYJP8TgGh1ZLVNm
	iupqrOwMZuqZ08iamhD4fMRY28rdTi6s4NeJdNjXMA6U5V2QWolFQdwCDlaJLRuq
	dxSv0w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1jjfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 14:45:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89463017976so433005696d6.2
        for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 06:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772462716; cv=none;
        d=google.com; s=arc-20240605;
        b=SmArrFF+5Q8qspEazMHX3oLUru2PscwM7IdyVEzw1NgezS12scGAY2AHAzmjaVCrYo
         rB6Bhr/8Hwd13EwW3usK2GUW+xgPdrvu/AzP2NrXxqT5SYUqJkvqDjBadJdUuq3VZ5vU
         dbAY6fJzs3mNCd509GWhNXNwy99LZlbGRmSCAdnO+jti9KHrThCPHrSvh6Xg8FEifeoT
         jOgFcie5Y/PH4aBLRegiNyGf5+ZBoEyXATkcN+l3ljIIOlYONPZio3oJ23NYGZ2dajBU
         s9z1P2l5HL3vBU63YcgngCHvgDAYw6nsAP8DrtStUglMXTcezFvY6PGbxDgx6jfHJJap
         253g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=;
        fh=A1cw5xQucswHpC62kuxd8ID/1K8ikpU+AoCKW8tZsiY=;
        b=L3AGMuCj6Pzkpnd5fRYS3+JJAiLyacjqS8MTsd2c/e9qOajga1BnBySTbe/Qy7oT/u
         cEJ3VCcGbQwQrxj3Vfp7ZjpMkglsG25gzbNyYsX1uX+7BxGtA35WxSiazLoaeqPj2E02
         N2UCdQEGEfYNJFfgKcT7+a9peq+o4bMdqRYgdl3C8OKsGTNriAHYpKXqedX3HRVPF9nP
         2lYbubiGdzHdfYuTB+N3V5OHe4tmHF0nRcKvUTVthhgcAb2aYosqOarTUzm1D8EKL4Q5
         l/lUhpzxtASEgPPNcf4fyl/EgOSgtnNP51H4tslV8LEJIaMs15dcbACIm2wInHxatQYz
         63yw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462716; x=1773067516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=;
        b=UWdNvSynn0Tz5f/1jOKcM9Rh1w5fGN98Ftio9L80ezvPmZy82M7mrDtc5uiEyqUvt6
         kprLb6I4E60Qv+e2PeHab+wLoCcGJEcLHycGycbOuo2pSJIk3qAf52hj9TkNcfYqG6us
         Onv69aZ+uZoskoK5lyscVDaSZaF5e1XWW5sm9NAJRb3YVQMxiJvM6v71dXCRTjE1CJhM
         CCMUOD6hVOcTyx6du2DqqjQkuKcbKon6zyslqjgUcKJ1ZMIYtyzLq4KGvG/GWAlbYppF
         2cdoccq4MrX3J9cWEgOw8y8kjZeOZYVzaMjtGnPhwhnSLkgPERTD4kSl7LPueA28Uuld
         3msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462716; x=1773067516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=;
        b=sX879/RfzfOJwSaaBDH0J1eekVmRzxSU+SaaQXhjNHHFIVKxC2tlc13lPHar7QeweP
         hoSn4f41gXlpztOf39ui3auYkNsqb8UdDxb+gnVAJDt/xtO8c115lnOFP56UMJPr5+/7
         PKdh45PXoHbdkjL1EmAY+7SU8ksk+XJcL+wyQaYhp+/3Q3YgPP1dFjsJLIvN8MT6s6so
         aGG6ivZ7kQAzUsRO6QrcZlxE0xKBepaZ2SaZm/UKmUSlkX/5v6uDy0OdpUKEVVVttc+t
         ukSLErk1MO4FHQmWygynQ+5keo+d2k5kBKZLbo6AumJ4hQiusiZXsXdLLrR9zzCGEin0
         NUNA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Y91h626r0FmfG0kGjE/e7Aj76JRazI+D3n/z/7RoZ/FFLsUyzwMp4tyPK1yukEAtx0E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjY/tZ1oUBtW1ISTLiVBvhzBKAjJm2s2fxv+tMQiv9JW2mpHKr
	txjrJv7ROgVSVS2WQc6ynjfMmjx9Uevvk31md+TeutsPWtp2SV3QseZxmz3OJUMLl4wCiuVJ21y
	yO2c2Gh3nWSJmbq2JkRAL3xHse2yXniuYftvJu7vWHr+EhveNmp2VlWMRCKnMPiqSpL5wFc2wUW
	sDrrOe3PPBsfjfurDKsyf4ve5Fmoe/9g==
X-Gm-Gg: ATEYQzxMrVRIw0OyhBDJdhYrkHB9lYynyTmg3PjSObJ1W23zP47mI8hjlD/5OgFCpDl
	Yy4YUVigaUPOkMo0w+E+hC23V/IozAekh3ZXTtJSPoqhdRSDfpNaQe0WYTXrqMPETi6SsizaOnO
	5L4pezyRJ32meI+Xk01uq37cLf5KvrduST65WCNGi4Ef/sMAo8wpMDc9Pu/RJzJJUYfYoCkSU8n
	GcEEbd29xd//ICmLWHgFgug+7/aP7IXmtIwII+g
X-Received: by 2002:a05:6214:21c6:b0:896:a693:743a with SMTP id 6a1803df08f44-899d1da886fmr198072456d6.5.1772462716307;
        Mon, 02 Mar 2026 06:45:16 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:896:a693:743a with SMTP id
 6a1803df08f44-899d1da886fmr198071806d6.5.1772462715780; Mon, 02 Mar 2026
 06:45:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:45:04 +0100
X-Gm-Features: AaiRm52g_q-9ut5YRuzPfVjc9YOUMUhXK_-usBrh4QiYg5o-Hkom2vB8v_yqFfY
Message-ID: <CAFEp6-3iU6XEcwqkX4erAEPpgFubWMoihQy1DFyKmLtFOM_uvA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Resume the device before
 executing mhi_pci_remove()
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, qiang.yu@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WY0gMjMm8iM-pruOgPz9jibPl4b0BpDX
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a5a27d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=o1KvY5UHcyvAiU2fnK8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: WY0gMjMm8iM-pruOgPz9jibPl4b0BpDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNCBTYWx0ZWRfX2qtgtPqtFM9a
 oFmx8S3YxuzQtRyS54aba4o7YQ98P9Tlukc+Buf09cEUHlwWAGIVV1e+KFmc56ZzcQ93EaDNHo7
 Q4Uhd8xgRNMgMpha5A4VOQtIHAv6B8o6TCaiLJouTZJqbBTEs6L6kGDllwXU9oXY7VdXq9OP0Lf
 OcqNaLU0Y/5iESdCLEfUAS1I4s4FgULmApws0beVdck38K90VMiuggEUkLTvmqHe2EBRnZ7qjNj
 DTuuoz2kcSJVCSaDJ1rA6tLdvrXNZzRPaXy61sagQnUYbK0LGJkWrQ3lgk6/aFfpQVISE2UmQw/
 By6KGi+xQ8UtFarza2Jj51gXCzdAi+RQQMOl/saXEK6OrjxqqvChr/F/KQIGkiIOcC/nrxEX9Od
 GNxG0O8x0p0ZmrfGJ3rkoKis39/MKTsE6HWsdgizGt2elrVagSuhOR9yjaqzTg9RN2waVUy5D+C
 CGkpduxLs2Ixt1OkHrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020124

On Mon, Mar 2, 2026 at 2:41=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> mhi_pci_remove() carries out device specific operations that requires the
> device to be active. But pm_runtime_get_noresume() called at the end of t=
he
> remove() will not guarantee that.
>
> So use pm_runtime_get_sync() and call it at the start of remove().
>
> Cc: <stable@vger.kernel.org> # 5.13
> Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 425362037830..fe3aefa15966 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>         struct mhi_pci_device *mhi_pdev =3D pci_get_drvdata(pdev);
>         struct mhi_controller *mhi_cntrl =3D &mhi_pdev->mhi_cntrl;
>
> +       /* balancing probe put_noidle */
> +       if (pci_pme_capable(pdev, PCI_D3hot))
> +               pm_runtime_get_sync(&pdev->dev);
> +
>         pci_disable_sriov(pdev);
>
>         if (pdev->is_physfn)
> @@ -1451,10 +1455,6 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>                 mhi_unprepare_after_power_down(mhi_cntrl);
>         }
>
> -       /* balancing probe put_noidle */
> -       if (pci_pme_capable(pdev, PCI_D3hot))
> -               pm_runtime_get_noresume(&pdev->dev);
> -
>         if (mhi_pdev->reset_on_remove)
>                 mhi_soc_reset(mhi_cntrl);
>
> --
> 2.51.0
>
