Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794583297;
	b=mRN/MscMDN9eugKIfLLZI6xM9jsDKJrpj5InOOLx4uBv05i/xM2Q7uqNtEkIyaQBX0ut
	 71cIOBh+NvphviL4Nn+fbPh1MDbAPCZLZ5XZJHIQ3vrrrCRgcJwgBR+wzAJqch0P0aqD2
	 KrGGdIUGdoU6sY/0emic8n2QxDtv1Qfx9xWQoQLJdiPAvNXHXKaQGQkkPRjzLC+XwD6UV
	 RBHFWAocyWawP0UIQVkW4cIDmpkuY717vk0Ku05pCwT/2zzoN/Nnzy5REUotMu30c2Jy2
	 vAFmmD4PRq25LKzMhi9pksbS6DS9S/q/6PMVTWGWV3zjEpubghU4Jv/LP649Ma+QZ8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
	b=WWd5hhkCNIUMNi7c8i3Ise+kUC+iSKNe0ReilRnczEhJSvdaNB8Lp3SFZnfJnlZVk0bZ
	 tLzTpvZ61/NYab2f6VdisUjCY/99c3QbY21MsrZBPVgVlToFhZMQRmILinbLoLJzcqqg2
	 izcQgfwYmoW7Z0y5HD2WiEN1nlHXcIpeJ6qikEqi09Kl0wcqXPJr8VfT4TaLwLKjr50dQ
	 DrjmRvnpWraHUipT3/BOdZyXaw10n57B91ObUCK8sEDkuJNrDZnYFeOmKvn81gYw4WVzO
	 zr8HcwmvZAdKNS5AHRNO7Ds5iaYb16dR1WArfD7CHzF7FBUdEiCzjl5OrKavM10pF/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R62GvGOb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBdAB0a+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56182606A330
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56182606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R62GvGOb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBdAB0a+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJPC81226952
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 15:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=; b=R62GvGObSKKij8es
	xl0IUxjIKVy5igLKNQ7usayh1NReBI4OWX0viyH1+kH13L9yKg1IA3OAQPlo53x/
	rqGPkv71NGhjv8qSAMxMo+Kl2ur1YKXTA5ZrjfNFOFH/oc98my+xU1YdEW4fwBd1
	1kZW5pEfcqO0SleqqdzRp9I6uMq/geWcCuMduJgss58viE8w3YvqGrpktJc7MwkZ
	BZeFkNeNq0ZgWiYOGzUv5DbMw3/OBIaq0au3hU7aGswJdUg+Dd7U5jKUMUZHv8Et
	EBmbzo6E4QHsCl2QIs48gJphtp/d1Aq62HC0XmJwlhO2551YhIG5w1dxmPLT5hJl
	fxD14A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp8wmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 15:21:35 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so1333834b6e.2
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 07:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794583294; cv=none;
        d=google.com; s=arc-20260327;
        b=pHpjKXpz1VM8sGZ2vwIoDD05FiZTcRtn5z6lMfaK5cednz9Agy1b3NzqC2o3E4cXH5
         mhQPDDyo+qbvuh8Y/JR8yZ28n48i/GdHLedlfmcanEX/joCvkh9Elq7dVGn8Qr59Da8S
         wBag4YRc3jfgAOXkUuzcvwayPAnkMzimAw3KFHGQwnXx92m3l6Wt3+5F33JNb74xudOQ
         bNmKxkWwpri3FlNR5UhZJ9XZPwawLAbwoXd1nmaUtoerT1sfJaTMoBfc0OrgxxtZYUI+
         bNbXpNsJ61F/tNoRq8YgceAVineYwfzyBfFpskURoBAnf557PSk/iOfeezlq1oMpiCcA
         6UDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
        fh=huYmB+kPTr1SIL84lTIZGUmRSgm14V2iICrlYgjB51M=;
        b=FR93dWxTZ6Myey1Ph6C40AZcyoEyov6Pl0kRgYMUUJtu1mefhUhYupM/N9jHv4CyQk
         6Vj8xPCCyRhx3uXXI1cs6120ZRW64yNwWeYTiLlKM9j6nJ0gtA1aHvbWtFaXoZUNZCYo
         eMNDFR7ztiNAqpT/l776pMWiSkT9ge2y7KoR79C7llMEYg/pR3qUjPxqWTTOYm2I/xmu
         zgV1JBYKsJAA4aul4QBrWf46dIxiGtIU4Lh5gpPomQvKJmhxFt44ePe9ipwx9kQl63dv
         5GdR0LUyVpHdXstzo5/AWg7TlI5EA3AcEuCD9CN5eIbVfHDM1v3mTJfCgowf/bNIzV8g
         oQDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794583294; x=1795188094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
        b=YBdAB0a+UP/mFGsCaHlV38huhNR4ljPWYIslaQ4ealiCcPPMrKLrApLIgMC/QlKuoF
         fb08RtP+r/DCbrEknO5qxl/o0CJ7zx1rTR5vwZtd7mxAxkjVpZrhmfnDMUOOnpY31eHP
         DrMHnhQ8DA6WVwePUAzYVsCDRRzkmN62kJDVSXeQfGDN26tLAQcBElWh2e6ZgpbtOCtD
         P3mc01ScRxCvlp2Xa3E2PftInUuiWH2fEYwfwYPvvuYb/fa4cYyr9Vr5MtPe8/mP2iTd
         PaDDYW8qugaOymqaLZU8II3Kv2FFxK/NC/1r568nF5IeE2JXOmvCoNa3RXI+yBNqPw5F
         e1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583294; x=1795188094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geT328QAyYnNeInrNQH4r++C+G0uRe3jXa85r1YPDYE=;
        b=xU2FBC6V3OULvpPDp7423EgDkONAjkR5PZyS4n6ZlE1E39yOq0ZGKiMdmkByz3QKYl
         uWI3Jx34se60Jywf7HJGCmsNZrUyjgBe7TNqf9x2INaZ93mLP01o8vcAAuCqKm75ovv3
         Zq255u7vmv7f6twjih7AYj0vKTRJnJwySdovKpnNC4YAkLdAY58eiWoQs4bhrCZlWy7u
         Yo/4llfGX1uGjtp7WV0y7uM1DPSV4hwSb8UR5Yhf0FbAq5VxYWOjiygwk047iw0Fhd4g
         t56/CdmfzoyyLKRBHoif1gtxIepOAEhxxsg8dz5VVY20bOjKOjBIQEtjThkty1Vb+o1s
         rjqg==
X-Forwarded-Encrypted: i=1; AL+hErGQ4Ah3liEhkDLsPRj6Eiyh42KhyweLm/qEpFbfh6CG1YPm7CJp/qWuBFaYy9Ggoy/8Egw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9WLO+30X+8/n2K17YdwGBVPDrbx9EPaPF7GOYVya0pTflA4PIa
	C4WHGVmA/87VLRQvU3ioIOQMIrcYNxBdGeDkzZgloOt4ZepomsOZu6hy3u/l3mtETTdfBKjV787
	oadbRtinU2/I9x/OnNZyrpY0yPvTd+3TUUnQWt3HDWBxH0SpMyMvVbbX/KIhgnTyHglB8Z6lTn3
	sfrkDZm2svYvEac8Yf7J5PQJTArFS5wg==
X-Gm-Gg: AYBFou2ALSzrx/oSjmVXMavOskkWlrAHhthQzOtqvhEvnOpxkrdxYOvJthouWAVuAeo
	+Q6X/mF+n+gti3hh2rZqDzQCJ5bRxOuMK8FsguQ//BSNyn94yQLGDq3n19RuQ7s1hXu4ZT2gIzM
	J0uTxpGePDmzXsgy9EpCw7RIJjtPxDP1i0+yBYPntap+qLnglR1uAnIJydkUCQ6bPLivdnsCoWz
	YrrUX9vf6Vh62e6LtVh/9Imed2HlIOx9ZslBPO3KtD+DcB1ErNKEA8Y2gUCCP530QgxExhJ3ak=
X-Received: by 2002:a05:6808:181d:b0:4f4:73a9:f853 with SMTP id 5614622812f47-56e611df811mr2085691b6e.1.1794583294468;
        Fri, 13 Nov 2026 07:21:34 -0800 (PST)
X-Received: by 2002:a05:6808:181d:b0:4f4:73a9:f853 with SMTP id
 5614622812f47-56e611df811mr2085665b6e.1.1794583293886; Fri, 13 Nov 2026
 07:21:33 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113151940.2922539-1-lenb@kernel.org> <7ce7895da501c3204416b69b0049ff488904f6a5.1794582108.git.len.brown@intel.com>
In-Reply-To: <7ce7895da501c3204416b69b0049ff488904f6a5.1794582108.git.len.brown@intel.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:21:18 +0100
X-Gm-Features: AclHuK_0UjCIdqCIyIhd3UJgroX3dB4L8LjioVSu6odip5Gimgv192l9aPp-fJg
Message-ID: <CAFEp6-2sE6bAWRSsjeLJYLawcc=N4DbLZq2JHVtPrunG10j-ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] bus: mhi: pci_generic: Prevent MHI from aborting
 system suspend
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af72aff cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=YEmDlaeyN0JEUVdw9q0A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: bKWYncygKRc4HNy0onqRaVFM0oBuUGm6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfXx4EPJ/ZjLwOw
 SBL0j94S5tLvluq0M24FzgOLVrbmW7qDCHfIz/tfSV+tFiNOqstUF8Ywy3MhCbuqr6DfYoGgCqr
 Lo5G6eoBk4IVWrf5bfIxb4j547rGtAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MSBTYWx0ZWRfXzRDVli7dflk2
 7LMX+OPsNPmZ5BA/oeZ1ZX2IL6mHKVw7zPhECSPlrSah/40ZosYXIVg4k9uqsO5OEN7vXydA9A5
 9hwdUsrxeD/h7ZV9qwC6QDCmZjDmrTAGxzWEvfBYnyA1WXLS4DXE6aM7qAngnXIxPDZvynwl82V
 t5GAybYGAKl48td0BgOTfM3u0spbCIcQq5OwGuDfA79Q5tlz1sRJw4h89TFAQ9F1ZRwjEe4EvjH
 MTXLeHfD+w+CjcdtxRvoGTy/Erqh97iafyFJpVHx+3TPj3RjsNmWSdNxFBNOAlGeSzdrTtNnxDi
 LrA+90iqePJFQqz8scx+UVxlvrqxDrUyXVYk1eY5RUQQ5LViJIpVvRo5/4sRW1UaiZvd5SlL23L
 j8wEybVp07V8QrKB5r9DgdxhBwVFBUhsHya4eQNVyB0WyyJtzyP8Fu4iMgonxHPmGG5Jj5mvuTu
 Vt4L0UTKug9YLhDGvZQ==
X-Proofpoint-ORIG-GUID: bKWYncygKRc4HNy0onqRaVFM0oBuUGm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130061

On Fri, Nov 13, 2026 at 4:19=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> From: Len Brown <len.brown@intel.com>
>
> mhi sometimes aborts system suspend on the thinkpad T16 gen3:
>
> mhi-pci-generic 0000:08:00.0:
> ... failed to suspend device: -16
> ... PM: pci_pm_suspend(): mhi_pci_suspend [mhi_pci_generic] returns -16
> ... PM: dpm_run_callback(): pci_pm_suspend returns -16
> ... PM: pci_pm_suspend returned -16 after 15145 usecs
> ... PM: failed to suspend async: error -16
>
> Prevent MHI from spreading this device-specific failure
> to the rest of the system.  I.e. "Why is a modem that I don't use
> preventing me from suspending my laptop?"
>
> This change does not comprehend the internal root cause of the
> mhi failure, which should be found and fixed.
>
> There is also a risk that ignoring the MHI error and continuing
> to put the device into PCI D3 will leave it in an error state.
>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Len Brown <len.brown@intel.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a384cca4..343d1046a25e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1727,7 +1727,12 @@ static int __maybe_unused mhi_pci_runtime_resume(s=
truct device *dev)
>  static int  __maybe_unused mhi_pci_suspend(struct device *dev)
>  {
>         pm_runtime_disable(dev);
> -       return mhi_pci_runtime_suspend(dev);
> +
> +       /* Ignore errors (e.g. -EBUSY); a failed modem suspend must not a=
bort system suspend */
> +       mhi_pci_runtime_suspend(dev);
> +
> +       /* Must return 0 to allow system suspend to continue */
> +       return 0;
>  }
>
>  static int __maybe_unused mhi_pci_resume(struct device *dev)
> --
> 2.45.2
>
