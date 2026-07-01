Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAEF344DBD
	for <mhi@lists.linux.dev>; Wed,  1 Jul 2026 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916047; cv=pass; b=ZvMMjgoWq9Lq8gNi5gXeOI3YTZ4eqALMd+9eO6n/PLKGwAj081YYCeSQQEUBNKFLtEys+xhH6lCXQs6lMfhl4jIuz9qAACPhsZYwI7p28Sr/GWzJB0sqgTpgmN/VH3AHs55PX5dWBiOUTLuhFPPn65Kbi7/ecRT9GOaWKBoRZQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916047; c=relaxed/simple;
	bh=o5hJ4zjdUnOfv1QaEjf+KgFzHDm/5IZUg+OW0f16z/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPCayhEmdJBHq9Hm9zn73GF4lLAGXuKTkFZDCH/lJyGKpomM6uvQ+/6UMZZ1EEp0h0v/ENWwZIW4+NxJG+8NA3ZjtJNlXI17XkGyzs5pS+xpztBB/OioEkAVdf6/CjjlZWZcSdjvrP2PSF9NB5dwnPhgqX+h5S8RAYcdDSxW9/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te3dOX/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dblm7UYh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te3dOX/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dblm7UYh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UqX680776
	for <mhi@lists.linux.dev>; Wed, 1 Jul 2026 14:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=; b=Te3dOX/oMm1dsiSh
	NMdFy2Wpu3MOA63ZucRuVwxcW+Nz7k9jDJhweSvRVVAP5QWCY+0AYmgxnV95hlJA
	W4LoxGz+hblSca0DMxszJKqB5mZ2JkPjhi+Oa3plAjM54WeaNR6Mu0WI9LjQACDc
	7v7bIWwjNhfTK/7vtsCevwB+TldVs0rK3QjSyzHKuvJ+afwTFlC1uQtqY9R87r14
	gK2H+Xm+7fa4yJ2XsTVU3yG/WkYwvhKkR5rUch9RgKJYlPZlFeba9JVTPJWl+hDL
	fu0Px8Qe5RvibYZ7pqCNqi50pTzCeRajeo66W2yVfs5zoLYtN08YGyLKG4JDlGm8
	sHu3mQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3smn73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 14:27:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c364ae3bso86957185a.0
        for <mhi@lists.linux.dev>; Wed, 01 Jul 2026 07:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916044; cv=none;
        d=google.com; s=arc-20260327;
        b=P5GaVNFbTNpsUOqa9YKAd/NNkMYIhVnqbdQbPHxc6HXzU2/da9dXf0FWXe1G7u+nRm
         wYPwef+jNXww0aW0Y43rfkSliqlpwaLEGBAVr4XcxJQ18r5o1ILTz28ILBNyoJx3ngE5
         Tx2ZKFuTI0G/NAe5GgjHiiEjWclGc6NqYc/FWGDXKkSRWvEOaM2dgneMxFYxWEgQ7AQ0
         qLSwiCZT0D1eE3RvJiO6blmXuhYlZw8gbT2GcTrktrARa+zxZQ1gj+ITk2WCc1aS8Jcq
         nidNj8YP7tSim7kI/coZAant3N+3I6kAkr6SI3E0m53vGKy/enX4hf3/3gY2a8g8t1Sl
         O7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=;
        fh=plqKdSx4c/R0EdDxvR0ogbUsXKeXxWHZHqAo7qd0svU=;
        b=lF0NwmBhv128SXMrvTZ2/ASwvsgIA1hvx4fOu4yJ6l/4w7kizlIW6vafS+N3SsTRpf
         7KtgKAshsmEQCq2MRxHU1mD0o15t9n3N9nBGzD0YCjXAtull6bOws61tcUycGPMBPboj
         O18T6/Q+kfmCpIxnqYdrca8xgbepzd+EnqfNSH7EfzdO2p7iNi1OqcvwA2SGwNhs575/
         S7FTxkEonI+seSDTAtWL+YHdnFpcFNuPnhGCYNAFZW/D6r2+QxfOpOAr9qIk++hB2h1r
         pcsE7jaDAWyhwQ1sh6fo5eRUqwznaeFSyYN3LVFuGghvJZ9hZ/5573CABye1/QAMfgxZ
         K+Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782916044; x=1783520844; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=;
        b=Dblm7UYh2s3UWLH0lu29JMR+Q3IdiznJY3UAZcTsiRKXnkoBUEom5dEtzdJJb4kZB8
         gz9pIXkkEeeDHzpjsvnyPA+7VXVGG9sKFRM/Bh349N0lC0anPWwo0K/f/DqzUSoUTnon
         jlqND353tTUbDtf2xc27zjQNwMxmj0gmTRsfWpxIBChvMC6Y/xvWuA7qY1oUXLJEnnY/
         GtYERYnPF6IlaSX/VhT4wm3sxhAzZWCIaCyjeIz4jUQX3zvoo4hmvtxDuBms6PfJ6+LA
         sIwKYS0RTMg0UcIED2Ad8dc0IsmdWvrAbwLpOSknXFq7LXArfRFfFMyem10905MUWfCR
         fSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916044; x=1783520844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slNfsSPq+LKvZAWAAOKAp2yofr1taXH3S3WyXQ27TPE=;
        b=j4ebzvZOXGNXP0fuB/9YA9M8wLcOjqi6BdIQ4zTnUdluQXALJaBoXIkt6dH13lL6iK
         voAr96YT0wDfGg8E/6/biz5p9/uDGt/6NguOjHzJi90jQk7sg0w/8ZZTYA29dv4yxpTj
         vcL1eHH0p+7zLYZobM5xyd0oYgxt6iJY5A/al7NlJyGoYM20Z6+rg+lOiCX5rPgtWL3A
         NEtpzMcVoBjwpGSnHu0usJ1fSIAHOk/cT4T0RB01+8VO3dh1FpJkWkAFdAgDRKs9OOiQ
         d19shDBEWXAEhL1wo/ytOZsX3hoxNRZeMvj0KSfQqMj2KfcZDDCJCm/P7PTr/0n1Micd
         WzEw==
X-Gm-Message-State: AOJu0YzIJ5C9W6YPu9FrpL8JZXUCT7IaxTbRrH5wYTzEa/greTfVxNI4
	wBj+pwqjD4axKPJNacrav7TX+FdIRnbAN8iJ8T8JngZ9/zUb6vSUYZqAjvPhgxvueFUFINZgFst
	TrPbNgqaMh58DzwEVMhuzibo18djIv6n0qICLD8Vad/S/kEJ17Q6ke9AW/GQqtT4hR/xfpAg80g
	pJfynA7ouUb5iAZJpztmBPObALfa9aTA==
X-Gm-Gg: AfdE7clG+rhIzP60G749P6rV+Ais0b+siNgAApf90Olz94Fl7vjjnG8rNfa7GmQUDTL
	FukXEdEdswvUzAs5u2LjBD8AjoS/kjHccwBPtPRiUtvbav+8/TLd6n4zNoCTbVgxBmtAQqgYyTh
	e7irUqLpj35GnGSR6Nn5LTtZk41jyIE6aTINkRv/dBbSeDvlwa3tW0fPglnHycsQ3ajUDD0i6kN
	OgdBvou358K6Q3B1aWHx0eGCE1QW3i/Xrk2aolrRzDFEke+eetBAUpsLcjQBXNOjl8W4OmZ1dtd
	J2QEJZveJQ==
X-Received: by 2002:a05:620a:4711:b0:92a:dcf5:ba5b with SMTP id af79cd13be357-92e781d35e8mr268234985a.14.1782916044102;
        Wed, 01 Jul 2026 07:27:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4711:b0:92a:dcf5:ba5b with SMTP id
 af79cd13be357-92e781d35e8mr268229085a.14.1782916043639; Wed, 01 Jul 2026
 07:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701095344.309409-1-zwq2226404116@163.com>
In-Reply-To: <20260701095344.309409-1-zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:27:12 +0200
X-Gm-Features: AVVi8CefzM1LituZvWyAk0MJEQ4HiP0taqRwbGukgdhVHhBq-uNWIgfCAUrAGm4
Message-ID: <CAFEp6-2ZPRbakA7wVHnaqMXgPnEL2BQ_gAEQC-2mH_=rOjHY1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] bus: mhi: pci_generic: fix Rolling Wireless
 RW135R-GL and RW151 support
To: zwq2226404116@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        mani@kernel.org, ryazanov.s.a@gmail.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, kuba@kernel.org,
        Wanquan Zhong <wanquan.zhong@fibocom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: C5mHHczKcQvGTez_jZislnfRMIoAlNuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfX/xvbcipvgFdy
 ssRbo7g+Y7S8WOVb/D7wONj4U5kRFhshZZM7rinVsxMyyApjMuawqT8VZ3k3BidSpDcHNW/8F7N
 ykCHpgkYie9MZR8Yg5b/PhjMxfxW+HEFjLgyig6NU2HvA6dd4BP91koA2jk42CqpN87kNyXBXQn
 r74vEu+1z8d+nlhjs7ysHw2ylzsStjU7nu4bVCYIHVjlcGez/JT2C3L0pDEO+v4qyUv2C8QYLsY
 b7rMUt0N9BT6qjX+aAlFYGjcq4sgrSAZMkGQV5zAtD1RkU13fKy1csRWUYv/yySp0JP7cqrdxAS
 lXCwVGbtSZmHTSzjDFnajvVtxxMOWeSKBETNWHM4krRl3t8zzn6LmyFo3xrahD0dFhxmSPOkNZE
 TjszqWi4SqBQ/RcufKMo7YQCglg40+tXfzuvj2QHFw7NnmrNrUMq/jxIovHPNzS9dI1thX778cZ
 4T50wPFICKVUM3IZs6g==
X-Proofpoint-ORIG-GUID: C5mHHczKcQvGTez_jZislnfRMIoAlNuK
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a4523cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Byx-y9mGAAAA:8 a=6GUwiT5CAAAA:8
 a=nWUtx5Q0ph_BRYhHASsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=tp1klI1xYmtLYojU9LVd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MSBTYWx0ZWRfXx+LCXRThzuC/
 OK0q+nO/okfFPippfeCLipV0ysZ0+4L6Ysou/sDP4xZf7BJSstCvbheg+/UAkJbuA3UV245OXN8
 Iu6riKtC5NXLrw3co8uzazsMo5ZG+Jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010151

On Wed, Jul 1, 2026 at 11:54=E2=80=AFAM <zwq2226404116@163.com> wrote:
>
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> bus: mhi: pci_generic: fix Rolling Wireless RW135R-GL and RW151 support
>
> - Increase RW151 MBIM channel ring size from 4 to 32

Why? What is the problem today? If they don=E2=80=99t address the same issu=
e,
they should be split into two separate patches.

>
> On HP and Lenovo laptop platforms the device probes successfully and
> WWAN ports are created, but pci_generic enables runtime autosuspend
> (PCI D3hot/M3) after a short idle period. Resume from runtime PM leaves
> the modem in MHI SYS ERROR; driver recovery (reset) fails and the device
> becomes inaccessible (PCIe config space reads as 0x7f). The failure is no=
t
> self-recoverable while runtime PM remains enabled; keeping power/control=
=3Don
> avoids the issue.
>
> Set no_m3 on RW135R-GL and RW151 so probe does not enable runtime M3
> autosuspend for these modules.
>
> Power management testing (separate from runtime PM above):
> - Suspend-to-RAM (S3/mem): tested on RW135R-GL and RW151; MHI/MBIM/wwan
>   function after wake.
> - Suspend-to-disk (hibernate): not available on the test platforms
>   (/sys/power/state lacks "disk", ENODEV).
>
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
>
> ---
> v2 -> v3: RW151 MBIM ring size 32; disable runtime M3 (no_m3)
>  drivers/bus/mhi/host/pci_generic.c | 4 +++-
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index d598bb3b3981..d0fee7e3ba3a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -942,6 +942,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw13=
5r_info =3D {
>         .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
>         .dma_data_width =3D 32,
>         .sideband_wake =3D false,
> +       .no_m3 =3D true,
>         .mru_default =3D 32768,
>         .edl_trigger =3D true,
>  };
> @@ -949,8 +950,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw13=
5r_info =3D {
>  static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
>         MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>         MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> -       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
> -       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> @@ -986,6 +987,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw15=
1_info =3D {
>         .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
>         .dma_data_width =3D 32,
>         .sideband_wake =3D false,
> +       .no_m3 =3D true,
>         .mru_default =3D 32768,
>         .edl_trigger =3D true,
>  };
>
> --
> 2.50.0
>
