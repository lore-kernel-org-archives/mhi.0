Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB553E9C32
	for <mhi@lists.linux.dev>; Mon, 19 Oct 2026 07:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395702; cv=pass; b=tZdkOVctuKMlWIZhH+h5Z5pFL7xD5qrhhELt/W4V03xTPOCtNmydWyU5mh7bkQcsyjhsxxJ2PIcLfA4o4LoE51kpiaCZvnDHvXJCL0yf3TdrSx2+fJn53M2UOJqXt1V2V2usvFZr5SIB7oaZ3Nz/r2rytyGqEdfnjgj/kbsu2FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395702; c=relaxed/simple;
	bh=h8c0jyzgi67+tCd3ukwwu6aqwYJd+LcuIZyhRhSGv/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ljhnl3HJSCaZ7+086EepxeqodMaphd5aNzSIboSuuvmqUGaPqkACabUqnumY/GnxXZmurIUgMr7/VnBkvsaPXoGC7gbgfmXmx+efzN4/67T0TTkM1HYIaIrEEiYCszybdYcbI+SpS+4KtocvNRkLr3KmwK6vDsj8LXEKZKIOFfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie6BG9nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSHe7ibj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie6BG9nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSHe7ibj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jpoj2180151
	for <mhi@lists.linux.dev>; Mon, 19 Oct 2026 07:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=; b=Ie6BG9nliLhoxWdy
	55QRXTjafw18UlwduSmAdj2bFtb2v8IvtAWgmje920t7Gli0TgodefhQTDgmSt33
	KNkDwZG31Jr/TOA1xlhuHrfUhUMnsUr01W6pKsWqd808TkkLmNPvU74u7Qel6Szk
	nYCZUtFvlMYCtDkPRBoKMZeLZrWv6ViBDc/dhnkbW5vowKJ2aF4q96x74RCnRPaz
	lprc4fDf3OcRiWPHQqVOiHfLZsIEzhnoV7U4tcvlo1R2KZSOVzfTFH+qaGP5cShT
	2m5KlHreFpPCTnPGk3TPb4eVL0ubqUdyUCADhWnmRCLLn76sd4tBwOuxVYzZqkhF
	/Z4BKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hkwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 Oct 2026 07:41:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso258320085a.2
        for <mhi@lists.linux.dev>; Mon, 19 Oct 2026 00:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792395699; cv=none;
        d=google.com; s=arc-20260327;
        b=aLwreXnB3efqu19wjHYilz/TVz0M9bLo5iRcc+HJMZRiDJy1ipR8nnBZQ8IoCuIXIS
         DW/50y4cEhfcK9iVhCKqhqymJH59sfM61sGfkM6CkkcLBXcqipjOBLz9bQO8aQTZhEPz
         YyVYdl9Fb8ZZaXNpRvAl3r4g6d9rDAMGodso37QDE5k6iVlKuOPpR1rWyqQ36XKUATN6
         12MNXBsoU1E8Z7c+qF89UYle+nIYGEWGnolsfbf8PW9OM/DMtMhoxhpxNsXFlsxsMsSO
         qbFmKMckN8Mkw+uvXl0YLd3CYLoc98y3W6/bteGH+KPq3lz1Y+J4wafiEzAubuuDCGOu
         4x3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=;
        fh=JyQrqNRd94W20nQp/c0UroDgN7839Z+58A0tMdQ3fng=;
        b=qbDfrgxuAs/2r3lMCewR0eFOkop64xx05/Wn1igv89MlXIhujtlfii39ionyptO1XD
         61r7QEUHdNHvtNhH+wNSqiVxYx9BhVgQZvFIRgTGkWXDJP+YoJaUUB87F+QIlkdDc5hY
         4GtFjKY8INODVVbfUSf4T7T889+FLyYiQS5ORHpj3KINt8qfPURVMThYMm+GEHnhV/BK
         ilp9UH81GEGbUbNn5WtyJ0Y6Ll4pvwo8FtXD9JfnKobdrl2++m8SyPgQRZLcdL6liToM
         BNXeYZgjUH0CDUad/xFSVLEWa6R/43B4OpiuYA8E17wz+WFl9IEVXd3sPYODBQ453v+d
         aj0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792395699; x=1793000499; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=;
        b=YSHe7ibjs/vpayt4d2LnpeMVyE2I6ssYEGVMeejqn26Id0lIy7EDw/PZT/WkDDuE/a
         Q1vc79L3JqJcECCBnOSmHlmbMOa33q63joQX8LhfFtc/XOFnY+g+I9K2+UsD5kgi2yJv
         uUIBoj85J/D4jHLZJ7MXqcEYe7NnC1Ahed8epcfyypNpmtAQ14MD92HPq+2CChbG5t3b
         lbK2Dm3E7jizbnmOvRJ24LOA35bpXXPC3LeFD5OJegfPhpIc5I6LPBgBoeFyZr2/O8FC
         Nx/lFMbFHmP605kSEHLCCK9gFhUQrDTszMenZzz0dDacWCyvGlPwgjw1VuQ/6BOtwPlM
         WSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395699; x=1793000499;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgncg1X2NqOexcfRvQJKJUsizuXyxT/HxxZeYT2aoFg=;
        b=Mt3qLvhwlRPY8oiVSgHqB/SitXMr5leo5RUudceBTvxmWfpJGUvkiD2hfjKu02AT0k
         OLdy5KEichyDw7xK3D1bBQgQRv7q68NeF6gy2aVbbWtBv5sBGcnZb8mPgu+NSanlExWa
         HMqHThDPnBxQcTCTKVuYRA1h0brvESwANYnTJDNU8GHVYQJE997oD0AIdwEBe0qLXG7N
         dGeXTkKB5NKeSuHvZpDfAR4uUqGCskoIIGnuXMhnHnyNTu0flDNAK0OkYThc+ncF8s7w
         J2xpAMeKzLeVtyz5b9BgqYfpm2u3FLWTGkY1PsQFunn0DENV+ieAhLojO8NsqRApAD0x
         4U2A==
X-Forwarded-Encrypted: i=1; AKwUvByo/6uBL4+S8M+A75NwVlBZb1KJfXKIM1Zv2i6TCB5SrVoqYrwEhMSQ/EXTOiraxV7GnT8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKl4KL9WTNHnWH+flet7nv/pKfq6658nGrnnkfymjLT1Q6q+y+T
	jyg4PkWdJ0Wxm+IRKKk1nozpax1Ysp6JBhyN6sN+gVJ4yB0h2BvtI+noEp4MArzSb4QkykV1Uim
	ass9adk3ViLc8GMenWXoFrnbaFKXYguQ771dDfuiIJ3xuQxdAmqRqTHw0Gy2omU7xqfJceoJYTM
	Bw6OGOpLcI3UISYonsRLHmWIjnUiu/Ug==
X-Gm-Gg: AYBFou2fzbwj7NZCBhnTLzH+SIQswaCK9NLnWv7jg1bBjcmGqdmp2Gb+nFbz+VM4wf4
	F4UbPCS3yuDEhBOsEVUOv7eLVfR/RysajUmc/tTYvyQZ8trpeKJ0ObqdPRSnt2MI2ApbrFLpwaj
	KIIIFrE+gar9gciK9S4TnFNDpgC40TmIiM08xyZM/C7/M9W3LsV5+Ra6ifsv3LfW3p7cNWwSVpo
	Bi5DzV6mgJrSS3evfzQVZkt2OczMZiwXmvwLzlj2goAHAqiiAjs3oK/r80ltrSEKGlg6k7fIhY=
X-Received: by 2002:a05:620a:294e:b0:93f:24e6:403e with SMTP id af79cd13be357-93f29d6fcfdmr1150743185a.54.1792395699218;
        Mon, 19 Oct 2026 00:41:39 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:93f:24e6:403e with SMTP id
 af79cd13be357-93f29d6fcfdmr1150741285a.54.1792395698710; Mon, 19 Oct 2026
 00:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com>
In-Reply-To: <20261019055109.49922-1-slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:41:27 +0200
X-Gm-Features: AclHuK87o9aE_B39B5wPYtHeWDW3Kp1B7I1cs-f1eftQiD1mAzEwlv18JNhWfQY
Message-ID: <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: J0bAnHqXa3j9onC9RLGfbjllB6wNDKvV
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5c9b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Byx-y9mGAAAA:8 a=VwQbUJbxAAAA:8
 a=vR8mXinTnKmWltssjH4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX6FzDv6cTexMH
 EMsapz5k/xyirWDBQab9w7767SHhBbVSXSSrivskBLKoX8P8rVBleWO174eSceT0cWuzq7oADRQ
 zRd3RbVyWMzfNxgcoWhtePBNBNmDfpg=
X-Proofpoint-GUID: J0bAnHqXa3j9onC9RLGfbjllB6wNDKvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfXzMOY+uSyQ/XZ
 gmbx1WD2vtea1qBUq0uif7R3wi/uqLHE1kO6xa/18UMTiW59KM1Hi2Qr0vUbuCJqvy8sZ8r7aJy
 3gnmLOMGaKqduyjyWD6vxgPyA2ehxb4TlACkP+c3+/ATHpAfQQgf/l+lMBZXuCYHGxf/QkR5u2x
 YGXEty+rj0VHT9Qmw/kaDi8DZ1ZeaduY/n10VPbbFCQ7iWEUc5FbB4wReJu+I4A/jJfBNg89uZc
 5auG3so9JZrgdrTxmKowzgtlBrp9KGrIX4oVKTRzqSeTj3lZS/M58wmdB3H6x7zviuw1NsQlJOu
 KLK3+oXd5zVla6FLuz49eWrkYmv0b5DXRVM4oZG7fnfrmjFBuMWatB7w4Cf0U7z+aqNDh7gXqSB
 qT1x2u4dEzGouFgGLbtVmwHjLsG7MokDfFzUafF9l7FU12g2ltxAbXf0dHbt7YlILDP99tdRnxi
 O2KNkruLNAerS+F9uSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190030

On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
> For some MHI devices in some specific scenario, the default value
> of autosuspend_delay_ms may not enough to handle last wake event.
> This may lead to some unexpected problems.
>
> Refer to the Qualcomm's Windows settings and we checked this with
> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.

Qualcomm

> Qualcomm also suggests us to update this for all MHI devices.
> Since this setting has affected some existed kernel versions, it's
> better to be applied to stable version.

This looks more like a workaround than a proper fix. It would be
helpful to describe the underlying issue, including the timing and
sequence of events that make this necessary. In principle, either the
device can be suspended at that point or it cannot. Relying on a
delayed suspend feels fragile and may end up masking the real problem.

>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..40735beb46cb 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>
>         /* Allow runtime suspend only if both PME from D3Hot and M3 are s=
upported */
>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
>                 pm_runtime_use_autosuspend(&pdev->dev);
>                 pm_runtime_mark_last_busy(&pdev->dev);
>                 pm_runtime_put_noidle(&pdev->dev);
> --
> 2.53.0
>
