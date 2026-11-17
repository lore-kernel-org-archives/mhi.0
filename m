Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920637;
	b=qHgxnB76XXfKoA4OD8dnHO24PH3lGrWNIeW4lf9wsmZUwIXtDFla4E2T5GixAujSMDoR
	 W66Cojp3hccB5g1WCPOYmHnNU4aI7o0Z8lrjG51Tiu/piXgatY5BnPCrCANHLQ1OXgO0a
	 fzzG3x5jdS54YfNJSaHZcpBfnIV4oe+xKEPCKAYdm2esJ0XpZbCmoVFFiBdGN/PT6nmCS
	 HlAqEYjiG7xxZBV6YZlpKYIJLKj0V/X2rQiDEdciaIhP7wTwAe8oUkWFnRvfC8tMrVCtR
	 QmPsaRKosDXZEtXyJ+E1yKboI8RURCfyC9ZanzvHIGWECgWPmaSLQzklENvHVn3s9Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
	b=CqIj2T+zV9owsmiNI5ZU9hEqRQ0jpX7AW8imGP9Qx78jB/F2MlSdWEM9D0s27Vh1cZJZ
	 yOsgaJrrcHpmvAoDStVuZv7ZuxsK1fsuQudZOnBcgBY7aRy1e4Q+eQIFaHLiCQjvN0CmH
	 Q/dffuze6OX0MsbzLWMzbpN7CixwvNz+HOvGSHAPzTyJ+GIhwc5sD49gantVHs4epUbrY
	 JNYRcd03EVlxBJp9MOWbIwZp5ZCoYy/QNgDu9fbsSeVNrIC5zov6ibpkZV0R84X5PvlLY
	 K51GWmOSJFxQFhWdnD0LtXExpAYt2fBumcaTK54r9heUy0rauxKoC9ET1l99VnEU6Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z708Ontx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6dvJ1QY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861F606A32A
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 13:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3861F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z708Ontx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6dvJ1QY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1D4g198293
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 13:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=; b=Z708OntxTIeiu5xP
	JQo/syo6ixFFvp8O3tcgIJXCVoAahWzRbhduZ6QukD3Sv+2dkDVsH9UfB4svY0Bx
	L73an1q7vj0+lMSePFWRnhmoked7pOlnlSJJr16JHnOu76wKAh0nQwbOWGdc4jBS
	uq3/J0CcnDOdS2ALTsDBRhUd7R5CTh83GnKnJk3uZ1qX9jDYNwGFxZRcZXZv9jsP
	ggifrH4bpm74JcFXLkws1clbpYBzuRHCWiVGNwisBr7dS2y/SGRh8grvg/HFooms
	IH+1gnIyc5ZryvMgtXimfK1+ElT/MV5etM9x6NIpgPSCUUuUlCv7vMEho3T3tGIl
	ZYBYlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh9u42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 13:03:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-948d83322f6so775775485a.1
        for <mhi@lists.linux.dev>; Tue, 17 Nov 2026 05:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794920635; cv=none;
        d=google.com; s=arc-20260327;
        b=HTLHlax2QgLNwA70N2RPBT9cDJdEfXX3cinweIGaeEHzOcXn+luc7kUMdTquudtuzT
         BBBacKGt+k8L0NgbmtzlVRvuFNV+ulak2tFwilJ3vnsYI/1qs06nmWCGcjPkeN2GBPoP
         p6/2dae7mB/4jpQQzfFeoIuapBaz4Ncy2HT7gPNyQcY3dYeU2L7BrFvPdT87BuhWoRyL
         Dvp0d1u30tmiPL0HHuq6AwGhoecdRjK3jPoXq4V+KltgpI81o5oRSLG9o3mQyJ64GWOK
         x0TlSXlknSKOpTWiif87Pkkq13+hQ8yRv7KZ9kedgOpdmTtje1uIOPd/sJ1cxvjhvnzI
         Kw0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        fh=2pyWosYKlMGuZaJC4Z11Sa6FHsIb3WoUGeQvtN7b6+M=;
        b=q9sGYgmW5zHn+aZ42IWMcZ8TS5jLCJEdF6Fybm5D08NkdO6mmgrRxVywKwN3DY0ztn
         qJvE69yOOeshtafVsd1+W6bA2rAR6cobMtY8OQigkUXvB59E6qrurapwmHOTwxZtFdCk
         P3LU97T68ncjZMy1uVBmo7uKY15PNWL+GN/gh9P6Zx9m0KPBAyQ9CABm3x5v4xLzbXnp
         bawxZlolWlR1Cncr2YPd7uZPzXt7uyGQeFrUt7zwMCobRMu9TiKdcL8nFn2unze2G1R3
         /N15dxj0ey8w5EHLuTm5SGUKHccnl8xqLK3isyeqfMqb7MHI6LBWZL3kaAniS1b4ftHn
         LCnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920635; x=1795525435; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        b=K6dvJ1QY6q1x8WSWMlJ3rf+fka3fEXH+jOR/RZQG5GaVJjjA3zHzDV0dPN75gFVxme
         xSfyIKwJJqPZ4oH2YIfjevQsNw9hCU6kLOQ38XOGv5XEtojVuUDRtfMQb8qk6NUT+ZP0
         Ioif7LlGs3mQ/i41ZdlBnthZcsSlQVzPe14QTzMklxJQDZSIC3NLiZKp3PxyOBHwxAAk
         3Xi2eWd4+X4cHmacpNjRq4b3nuzNv4qBvVBi53ppz/qCYhVbztyhsx147tt1b0LBU7kS
         N6UwpZhJ6DsR4zEL6HOGRQptd1hL8EO/ZXtliUjfzKPLiufNpOiIgfmLcjc6037Xbnht
         tNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920635; x=1795525435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        b=XAXTQXto9DdpnB6R4c0m0OgqnWYLlp8UuksgjBp8avTpb6c55zn9NFEH9vrQ5c2fXW
         SMSX08CqdbwiaIDyj10NORdr+zQ8ixpc2dpjJzkT+Nge03ZjejsrcdJ+CuunNBVUKxA7
         b1HEmc+xzIEZQx4C2ZbVq5xels1LSctMEAUQzVHWeqzipnf+JX3/Qbj6A+KOjPSc8+k8
         XLhRmUkHK32i8zpQ3gBgtlV9M2Otb6ST/uCbRi8y0iVKoVcVJRENx9KWNxS24JnTVn5a
         D73nMZzr7RdOOcrTFz4Yszosmrpq1m8fB6IkGlfH6qpcoW32k/bOgbim57BD0CfJ3a8A
         MklQ==
X-Gm-Message-State: APuU4Z/oVNx/u4RcQ+76MdTQv0/mevEgbmAy9ReqIitYAw/QNTzmcytV
	4UM6qsMaDcuDdCSoms5AhtmBEnr4RRdKTwSI60yCy72QFPTih6R4qCAbMwGGHLXBzgFUem2J4bC
	QGh9x6LGjxdW5ulojKaJ5zp+iVV0EXMYWXRrDU2g38MfUZFjPVWJJ8Dvyw/zvd9UUuOTHrESVsc
	C4hYiTNRwBqJ1jMQKY+Jm21JMxg7Nn+A==
X-Gm-Gg: AYBFou3p126QJa68NcyILB2P4ugQu4pFkKmdX1fzdtJJ4gbokONH/vl6sWgfPMIiWIE
	yfmXLfqtn7WQSNyhYjA63q3KAGeEV3LCgs2tfzFVJGz4dqHm77ZZM696JZBUqlQqodtUHAmMvfd
	Fg2tNgLfRo9w9nqtXg2mQDJTy78PN8scdR5A1Glbw0aNEs80RggoSscAS3sIOZAcXr93OIU5UDi
	uz36FfBMm59Vkrcll00vQxSAw3U6RSO2BdvCf5Xldz0E7fZQLqMWNCS7AK/DKJ1RQwwE2qUnQqJ
X-Received: by 2002:a05:620a:27c1:b0:93e:c12c:9b71 with SMTP id af79cd13be357-9494bd03e56mr1975573385a.76.1794920634667;
        Tue, 17 Nov 2026 05:03:54 -0800 (PST)
X-Received: by 2002:a05:620a:27c1:b0:93e:c12c:9b71 with SMTP id
 af79cd13be357-9494bd03e56mr1975567585a.76.1794920633951; Tue, 17 Nov 2026
 05:03:53 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794905977.git.zwq2226404116@163.com> <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
In-Reply-To: <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:03:43 +0100
X-Gm-Features: AclHuK_HDpVH5z01rUZMFuJfiVt58vAHMQBA7hfg6V5RM69JEn4q2DTIa3B2MKM
Message-ID: <CAFEp6-3qmEu7CToPu6A9=DeVRSfTF0qmw2Ki+CYmJ4gvpzOVWw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] bus: mhi: pci_generic: add Rolling Wireless
 RW135R-GL and RW151 support
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
X-Proofpoint-ORIG-GUID: Nb197ZabGp0WQ3hG8-DoZsAznYDXyeYE
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc50bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=Byx-y9mGAAAA:8 a=1peLKHpgovxI-enXKA0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Nb197ZabGp0WQ3hG8-DoZsAznYDXyeYE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX2Kngz2m2xwI6
 5hPOIjwBdXe7/dlBhSNU2Oiai2BVM7KA+7ummPm5HvAozagRyx+B8mB1GIyq2u6VYx1NkpY4d1d
 i7F8vnt0nKLSlIGnBTrXHjt8Buvg/P0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX+jeJftY/b1jv
 fpjveoZloxmNwgdT9ALmS0j3R3MMHtWycfIyMIfQagsY2JGVblShgJMLzIR3/fJ3V0TO3/anP0C
 MQCQOdVlhz2oRCC1jMQLfW48VN0W9M3D9Vgc0wDopdNJCb+k86zXnDqnsIFWdUbjjlPjqMyBFkD
 l5GdgMn2VArDuli8vSLHWd6qbjWU4i5J3vV6GjxZvTfrICsOUVPuLamKBvpyS1cJoxb5tjJk/DL
 tcnsbDlpy0ouVpccKBKxxhHb+nAdiW9stXOIfMcMMwPxiKj95aYFwx9ywyobNhY4ARpkFgiB0wI
 lmFMNfW4l7Lgs82Jxx4F/X7UJktjKj+AS5YRik/5F/bmqlRp2+6cEL+IqHTFbHvf6IQdnwoxh6L
 qM9RkiXAfgcLVckvORjG/xIYHeKEgcXwh0TYPK5u8V/B+B1MJARJWPh44qOyPL+EEKWTnjXe/K3
 b2wBLZRw/vatNGllc1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170051

On Tue, Nov 17, 2026 at 10:14=E2=80=AFAM Wanquan Zhong <zwq2226404116@163.c=
om> wrote:
>
> Add MHI PCIe device configuration for Rolling Wireless modules:
>
> - RW135R-GL (Qualcomm sdx35): SAHARA, DIAG, MBIM, DUN, FIREHOSE, ADB,
>   NMEA and IP_HW0
> - RW151 (Qualcomm sdx75): MBIM-based config for most SKUs
> - RW151 SP (2099:1502): QMI on channels 14/15 instead of MBIM
>
> Register PCI_DEVICE_SUB entries per chipset:
>
> - RW135R-GL on QCOM 0x011a (sdx35): sub-vendor 0x2099, sub-device
>   0x1300/0x1301
> - RW151 on QCOM 0x0309 (sdx75): sub-vendor 0x2099, sub-device
>   0x1500/0x1501/0x1502; HP OEM sub-vendor 0x103c, sub-device
>   0x8fb8/0x8fb4
>
> Use Rolling-specific EDL firmware paths under qcom/sdx35/rolling/ and
> qcom/sdx75/rolling/.
>
> Tested suspend-to-RAM (mem) on Rolling RW135R-GL and RW151 hardware: MHI
> resumes cleanly and MBIM/wwan function after wake. Hibernate (disk) could
> not be tested on this platform (/sys/power/state lacks "disk", ENODEV).
>
> Tested-on: Rolling RW135R-GL hardware (MHI probe, MBIM, DIAG, ADB,
> suspend-to-RAM)
> Tested-on: Rolling RW151 hardware (MHI probe, MBIM, DIAG, ADB,
> suspend-to-RAM)
>
> Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>
> ---
> Changes in v7:
> - Standalone series on mhi-next (v6 not merged); includes full v6 content
> - Add mhi_rolling_rw151_sp_* for 2099:1502 (QMI instead of MBIM)
>
> Changes in v6:
> - Full RW135R/RW151 channel config and PCI IDs; no_m3 dropped; MBIM ring =
32
>
>  drivers/bus/mhi/host/pci_generic.c | 152 +++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index b636e2c23b4d..ce9a1205c2e9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -948,6 +948,137 @@ static const struct mhi_pci_dev_info mhi_netprisma_=
fcun69_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] =3D=
 {
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +       .ch_cfg =3D mhi_rolling_rw135r_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw135r_events),
> +       .event_cfg =3D mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info =3D {
> +       .name =3D "rolling-rw135r",
> +       .edl =3D "qcom/sdx35/rolling/prog_firehose_ddr.elf",
> +       .config =3D &modem_rolling_rw135r_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};

mhi_rolling_rw135r_channels[] and mhi_rolling_rw151_channels[] are
identical? why duplicating them? same for event configs.

> +
> +static const struct mhi_channel_config mhi_rolling_rw151_sp_channels[] =
=3D {
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_sp_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_sp_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_sp_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info =3D {
> +       .name =3D "rolling-rw151",
> +       .edl =3D "qcom/sdx75/rolling/prog_firehose_lite.elf",
> +       .config =3D &modem_rolling_rw151_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_sp_info =3D {
> +       .name =3D "rolling-rw151",
> +       .edl =3D "qcom/sdx75/rolling/prog_firehose_lite.elf",
> +       .config =3D &modem_rolling_rw151_sp_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the=
 last entry */
>  static const struct pci_device_id mhi_pci_id_table[] =3D {
>         {PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -961,6 +1092,12 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE912C04 (sdx35) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe912c04_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx35_info },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -995,6 +1132,21 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE990B40 (sdx72) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe990b40_inf=
o },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1500),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1501),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1502),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_sp_i=
nfo },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb8),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb4),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx75_info },
>         /* QDU100, x100-DU */
> --
> 2.53.0
>
