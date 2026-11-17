Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920679;
	b=TKrTx0xLlRVmBi6hS2Rx3pw5cE0k1G4f05divlk5SoC9mD0zaT6oFLu+snsgRsSFvsOF
	 kfwXg5o0aPpWmwC3iL/kiUYzQoVQWUgRXLvjZthCOeVgjlsS2NMrK4eKjbx4VB3SZ9QcW
	 dpTeQx5CI388S2Y4QtQzXx0/ItBYkJS7v6+k/b5rt1GLo0zwENJ2ebrGzU93SXlTBarRJ
	 wGtQhWd+qTglmlW4/TCm1uRqnFvXUXVSRbEnWVyUCrOgSVZbIcLWOG9JvOP2wwKfi7tCD
	 QOqnoBL1R+CdkOjwB1GhSFMbukXalspRyrjmNJIeuuCgFgwrigXhVfwX40XlQYshiHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
	b=ZoHThWPGOlVfTP8oCLPZPO47YIPRSn1rGDyTb7RD5b+QWM9c5edpLHyYKDGFrPvRbqBh
	 CIAMXWguXdbCIx8IoHpSV0f6oElrdaoXC9bHblcsNIiE2gn6sfTxRaob9KyjkMsyV3HWw
	 +AmPCMY0p+MCABumdqL2wRzCep+3j2DeWvz16x0WtxA5awCPBUCsh5w2ziO4b6zgwhFkf
	 pmM866sHGCTqzqHm2k9JaiLZr0mN+es8MhZt2bsUlM/rMeD5lvMR8Iew9qUfde4/v/3i5
	 8UCf16qh5xVeGMpfiF3v/JedtjE8xsz0Xo6gRuhfcCMSj3Tw422sB4N3lkqviIU9+tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYkFQOP0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY+l3xOy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519FE606A330
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 519FE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYkFQOP0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aY+l3xOy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1K0R541629
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 13:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=; b=SYkFQOP05yzwfBmQ
	5l84X0HWUxtGj+hF7Gw5J7foY6wyE8XXvtl/YCJLSjRsEnoWLCJRu3B9DxflQr83
	Mrl8GfwE3Et2CMKPTXRknXmSoXtjngcpp7qHLTkn4SE/CM/9BBdbLdUQ4NpRewtf
	xXmf4TYoc44juksX6PMyuRa6SIyqFjVSmk7UFIHv/WAKHzfnd2vFcpyCgZw0IL6k
	JZ06icBis88H4HnsKh0zgFszN/+otSR4iFEcVdYfCwu17GaEHZyJvnkAp0W4GpfH
	heNLnp+6PTtvS2QO8t+rQaiNcvIy0L7l06rpvHRPobW1JR0LD98ef3QGpHZQxBa8
	2WjaEA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1gs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 13:04:38 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so5557465b6e.3
        for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 05:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794920677; cv=none;
        d=google.com; s=arc-20260327;
        b=DZvaD7Iirva5AULY70UOZjuuxNUXUcE0cOL+rGN5mlX3d4JUrzcull1a6dFuPgZbcn
         IrBh0uPAe3sqLyA2myxIVTmMBMiYBjTlNWRTa4N2tN9mwGJ3KBR0SfGzSp4mLgtNqAjU
         wroTwG/Kp0nFdWfWTAriZNqceAUT10Lx7PElXlFWvYScm1arN2ZXpeNqng1MkFZB9yWc
         iR+TeNzfuej4VL1qFNc82n8SvAoLoHVx1Rt7WNShGtLq6ok3ZipfFuz6Iu1TixG/4OOO
         zKuJJUUUfBqKE17JTUt+HAP2OIJaUZpwTMUe+UZ23zXVNxMIcaJAZ6HRu7e1Sl5ulgz0
         gTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        fh=2pyWosYKlMGuZaJC4Z11Sa6FHsIb3WoUGeQvtN7b6+M=;
        b=RKelNszO6xUuk1fiZUXDtGcW7lxNubujlDgoOHQP9Ehf9RTObgJxuIM2FIerPeYMPb
         g199v188+psCq6qd2oUIjtQKAN5IGFkUPUg1cGusy114+ypadCLuVLSfJS4s1S7onzef
         N0Otdl6eeIOVCW+SVB/SwhpNNopYDab18d6UGX4KnC1PIw9VZXgz/TOUnPvzERez85II
         aJZEUZ5LJus/bMiVfvm2um+vmBZZ/jCbhi9x3tGaTCW7tcj0WKy/EHCDV68CpHtNbrwd
         KPj8EOE+s6ykS2GPfD75UVZkH3udRtji89v4ZIxlTxcL/JmsM7BOa3lTHBn5BT7DutZE
         MPBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920677; x=1795525477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        b=aY+l3xOyioVcav6AOXKihTYYcYJDPSa5kqhKzQSnlvrB+upAaC6kiz0MtFG5lhqDdv
         79o3bEO9QkflQ7H7FikV7h/khcbw/QCz4YENExDntsiykWlAJYgVDlJ6dTkiCBYoDt2X
         Z9qYomNy68wOoWpeL66GxTSXpJ8Rg9OmxCZazcbtOc82Mv0iMc7v+3VP5i9mhlZDr7rV
         7j/X6UL+CSktZJo8zQWXM7/vyfoazZVbOTLPCBZ9MCa9SVPCMTfev8QMJS3n3nLjSsld
         qdQSg3dDUGw1m2JPSlF+03FB5YoRQPvGmbmqZyp4sePzUJiKynzBTyofSmnrEw06+Mka
         bw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920677; x=1795525477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        b=Uw0FC2TOlTwypz9E9Qhe3EYrjnVcadHHkGPCZJ8GRrqv7Pb/PsJvyyOgYB5B+rzZnD
         MS+eriDw01asfe1z0yGhQ0FXZ7FgMmgHduUltFOyMQ5KXS2NvUQh8nNXjursOryVweKO
         O9ioEWN0ruE/0h4owhgVmcB8a9g9TwPaFKEWTDSR2GiLUtYBmh+X50kKj6+n4nRENSXd
         njEGoGUkSjo2D1WIhDEl1Gl98x+ygC7XZ/sD7r9KHdd/h2JERcF6EchCDxOAC4aFecYU
         hHy46P2D/LNMWx9dXo5svCi62sld9eSmJs1XR6G5BIjgocEkFwaQQ+8h6AvPRuVo/nre
         /skQ==
X-Gm-Message-State: APuU4Z9CFuFkMPChdHaHX14+/tLQGdaq7u+urnf8tzMzajBAzwKsDK5w
	7JCYreq+XmWPXE0kVAUoXb1gjNYHmj7FNLOpKfdGUPUe+c2ae83uBFXokR6TgxTCp1+8eZbcqt5
	I7y+2buxy216ftAf/rrZrupwjw02Bb6uKlFIZRqTTEIer8qlhZyVIxW9KuWmEf5a96lRN4MBU3H
	aLiTaXjtmROf1lz++a41BUVEZT8rW3mg==
X-Gm-Gg: AYBFou0XrUBgb6r4N8/ABTMthhL3tOy9cETG+AENsu2XlMbqXUPhYe8GOW0m5n/yeRe
	kOpZ7zP5RGFL5QBIPbppiBuXC77mBtLPQL6dEgCiOvveBbplmbv15mPSTpOQWAcuzAM/gwHcoHC
	06X7BeH0SQz9YvqLwixowHsWlh/K1vnqXAh7JWe0q5236+kVkySMstKv/Mq5o6vv7WcxkR9eRm0
	XUm+oi7xnC714Uo4N8w98olmspO51rmILp3s8H5k7uFjyXcq5OuQDwjps4xEbdHXDjG0Bvb7SAN
X-Received: by 2002:a05:6808:f14:b0:55c:127b:b769 with SMTP id 5614622812f47-56e641d64femr11065193b6e.32.1794920677595;
        Tue, 17 Nov 2026 05:04:37 -0800 (PST)
X-Received: by 2002:a05:6808:f14:b0:55c:127b:b769 with SMTP id
 5614622812f47-56e641d64femr11065153b6e.32.1794920677100; Tue, 17 Nov 2026
 05:04:37 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794905977.git.zwq2226404116@163.com> <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
In-Reply-To: <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:04:25 +0100
X-Gm-Features: AclHuK9K-5DuIleq2c3acuiwkf7IKa5obuGwZtGKAK3ggbCHmu3QWH-ILx8kY-I
Message-ID: <CAFEp6-3VtgV7QLBVjrsHpGRo4MvzZV5KVAYiiZjYJrz9mApHHw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] net: wwan: mhi_wwan_ctrl: add ADB channel support
To: Wanquan Zhong <zwq2226404116@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc50e6 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=Nxhiib172zSPVyf_-JkA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXyJTZEOgjRNt3
 3xQIFsamvJL6/9rF7Dct49JIFxLwkI2ftW092zNOvImLw25KQdVJOuHsTUZEUsuJL1hp4ZR8iWP
 XN1fDOMhLxutFeJc9NKNL3j7wdOvIw4=
X-Proofpoint-GUID: ulL3202gHxYXW_CFQCcHValPIzogNp3T
X-Proofpoint-ORIG-GUID: ulL3202gHxYXW_CFQCcHValPIzogNp3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX7KxAP1w55uJw
 xd0z++ysx1bKggpfl7UaqjHv1fhq5N9Lt/5rw5RphQg8jnSS+0DBQhrYpbtCNZZZL3LWLVrtW+z
 H39OcAJ9s+3VunzFW6oFfkdy5FEms1/FyrSaG3Fe1yXu03v0zqMue9hjXT2TnSgWtUJfa987IOh
 TUjCNJ0wsXCBPtXijkgNxwJfQs0jTj88uGPUqc40hP2vbHhDWmDLNMOpoKh0W7TZFeZwhzrrLsV
 fwNx9XGw0dbqUc0jYFcOsUonDXC+vT2sEcizXd+KGS1Qtf30kEo/e4tN158kHENDd8IL4bH5noL
 Y3kawf5mIXkaUX8ROsZvakkzbNZSH203KhVHJiwVIoh6qaVSmsce8I0sPOL+Tq7Cm+zydo9s8o2
 jEMzSvBGnZnE8UQP9SMLbks9TGjN2OXw0eDQeU4md4KPFEqAYxbt8+V/KTZ2qcSxupkqfSTVl+A
 J8//rNAyReywViUQYKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

On Tue, Nov 17, 2026 at 10:14=E2=80=AFAM Wanquan Zhong <zwq2226404116@163.c=
om> wrote:
>
> Bind the MHI "ADB" channel to WWAN_PORT_ADB so userspace can access the
> ADB port through the wwan subsystem.
>
> Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Unchanged from v6 patch 2/2; bundled with v1/v2 historically (Loic).
>
>  drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index a31d8540fbb8..50a3a940357b 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -263,6 +263,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match=
_table[] =3D {
>         { .chan =3D "DIAG", .driver_data =3D WWAN_PORT_QCDM },
>         { .chan =3D "FIREHOSE", .driver_data =3D WWAN_PORT_FIREHOSE },
>         { .chan =3D "NMEA", .driver_data =3D WWAN_PORT_NMEA },
> +       { .chan =3D "ADB", .driver_data =3D WWAN_PORT_ADB },
>         {},
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
> --
> 2.53.0
>
