Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794223448;
	b=2QaUxXgF8O9Az1nR9aUGbLCUalKRftMbhnqD5b+x0FMWpTCZXDCUY0EqGlKvYmA3p6Wt
	 FQhnuHsxTx7UONVNZiyn/Gxciv5sGZmVrAFDDz9bf2PCnDKd5smndVHye6+dOW8Y5x3sw
	 ivsfQmQPgv7jCV1ZwmhugF3uNrb1U3jRjzVT1vxvVamJUleGvWBd8GjviS0H8lPApnglF
	 UXa9ALahUyEXZ/S9XPPdtVc3SzReFekVTKA+iUjFtJ6tyGpswo86E/EQ0qPIps5IrSnYZ
	 1Ahzb4Pxz7Sho0Le5xdZwmlB1xwuRGsQsHwlOKP1DcLKY4fXF1mySgIkFYCi6F+CKFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
	b=p1qEFR066MSfFPWPTswUBgq3P4W9yS/QII8zIEer4PlvQmxlgQlR0rrtfEhVa28VIB2p
	 IfbvqD6sm0GymiXhhEzrmEJVEmAlGwWPeHqN2j2yOkZvB+9xStBT5OLd+5xwy/Hky0v2A
	 Kl9fDkrWUzeWfdQBzUIukfZkRkBQyFJFgjnYp8Dw3MafqYnyD8kwvsWG5Rx/okSbK4Mpd
	 C6sK4CW4gUhQdZrLM+JryETYE264S2J9AYfpU4DNMHvmoS72f1+cdrWOps8NwRWDxDnwV
	 vHGzKhh4cj7jVdvLQAzDHmRcAZ/cwLLGAGUytrVw3cZHjWMo/tQt7Rt0YCD6HjAX4gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwTWnkiQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NZoRkoTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2540606A31C
	for <mhi@lists.linux.dev>; Mon,  9 Nov 2026 11:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2540606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwTWnkiQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NZoRkoTm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usBh550774
	for <mhi@lists.linux.dev>; Mon, 9 Nov 2026 11:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=; b=NwTWnkiQVksAE+LU
	l7m6spD1oZV4uW7PzTNwXLg+dM1Wq8aANLKsuxPXlkuVe/RUowEv3I4fbV+6CQPx
	XO/pGMRvXSzZ/ncZNK8mgmDQ9v1ATkBHoWEfyZKKeaJNi+iEztf1320dzWGp/lXf
	/gw+0zSF3rKsa+xGn5YFNFKEV79BNgyg6NWnEK869iB7stX7qZq7pyB0slRv8z46
	ZugPxesDo+iyoasdDUAoawji2Z/GDpwfEbD0LB/MDbQRmhVWbfdBpLR/ynjvON5H
	hPsLI5nF8B20TDjyFx646qvuc1e+go5LfLcFPeCSKTFCGuIVz8IRnN1vMsqV4p5+
	dsp/Rg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2vrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 09 Nov 2026 11:24:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94607500fb0so139920085a.2
        for <mhi@lists.linux.dev>; Mon, 09 Nov 2026 03:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794223446; cv=none;
        d=google.com; s=arc-20260327;
        b=K3pdpQ2Q0rpogEJgHBEM9xYtT6QF+VmnyCpJ9OMCrkwSsXB8NGAfUVl4jq4iLNHzFi
         I5rKwaj9zRpEpFB4L87eByCTIwLMxyPc/uScCyyT8vNyl0auYxVB2OaRLiP7yaL4cI0K
         yO9D3bJWVArQWBBLu22UgB7Lk4uYJ61VCS2Q2U3Ih/h0JGGw0dNTKKIL7jfyHWVcp9Af
         mCViLJM0aQhishyD8mKxvt+iXl6XrZ2R1MfxdRCO3bSgcLPLs9mamksGhoZ9RvdqOjFY
         Ywfr/QGXHvD49EdzCaVNJvcUFgj8HVPpEBh22fmzP+0pBWOoIqfI7gs8xPPVgMnPLye1
         1L3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
        fh=y/1mV8nMJ7OuQjpWkNXtaO1/ZITuORvK31e06oiSzsM=;
        b=oNNjeYWjskOazc8YATc/TLiDhO9Wq92MPAMAMeSN9OH3+53QqJP/CCO9h2u9iYWoJO
         VcuFbCF1QZSBsuUc0BdyavbsCfqwpMNLGIS77ye86QWVoJ4ZCFw0LEavawZ3z1MlZD7h
         grXApD+ZqoqK4GwnW4PDO3I3Zy0iFaOReNAzhIu+gnq7AfV7de1LIBegH21Ed4s5qvLV
         lz6pCDsgrvhSAiZHZQ839oaBbW1mg9IAnHRCsGCQWgrOmkzJ50+cF1w1mPM7rMM9VNiv
         G5ogYdfwZ0MNuEdnUp50hsuHmFzknJbPbISC+EX5Er7vJ1DJJONXfkoOZvxY48rHBXpp
         pUqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794223446; x=1794828246; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
        b=NZoRkoTmuaKhw4cLD/9pAT76QmllG3YRZGZdnFPFrUBRINr8oV+RzELdCi7wbmVeiY
         /+uJmwhBtUdJZZg90w3XiUZ21CXnbUFPNtz2BIps5jbalCofdIIH4zBdFZnO2If+/u2X
         NdblTEcMTuTN27jB4fVRJ7/CLjsWl934C1I0hTd1Y2HOS9EYQRkFKccaK8HyM2l1pdN2
         FGysbhE7y36BuTKY6uMrt2PsjrBpWGuCE2PWSVgE4oRkRyyis0brRwaQDCfBX5We+jlt
         ar5A3yBMC6f73ps7ppjS3SpA8VH5ZW2vwovf6Ap19kXFBQyKSX2J26afZ02Z4ene6vcZ
         k8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223446; x=1794828246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRlu7W9Vc9K7eUEhyybmW+ubbTQJiOQyPaiHlBL/ieo=;
        b=EhTPw2VzTmOveMXVqAKg9JOCv1le47aGWrRWET35fn5HDXcB7QMqHedVAc48eIxTMj
         C/E2gfZTTORu82Xt56fS3akHm+ppPfQAeLEa3Gp/C1bUALRG3ww8OUEWF6FBAegZwddQ
         wyhzzuD0tkwnC0d0sLWHriSe/FlxsO5z4Lu7ZNj3Gh/YgAPg1pMVPm2Pe1E92EgpiSnP
         aaVqEwAqOhAz+x2Qe5g51/726h1/tC0X9jMJRryotY0i0PPH0KjZNOC2E3ynbaAvCxdF
         xbwsxgPhjgK/BddCmjqCj0zFIub9dYX596EYzLhqWR56SlAmP2i5OqC2Che87xXvHfMV
         OCYA==
X-Forwarded-Encrypted: i=1; AL+hErHQ0nxWwlyFuYInD02SF99wiWbdrW6hiR9BH3IKCRtChG41MtU/zeDa7LxQimp77hhzytE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+spdwusjEUZbmtHfMVUt77fDVVjNqLh3mUenUE0ONNLxDkqnwn
	peBcc9z66zrsBxonLjUmmJxv9Hm9lcyVEc8xsi+LrrG77CKGzXSTmm01e/p314UoqOxal6H1GmS
	DTGiCpZkLFiTCyE+WsRm9RylYHXYzMkKjGBOqxzuzgypDtoqXdMEwjTVJOQePH5vzxMxYxTrCnG
	ZMk023fivg05CxxFXiyN6I7WKZtx74Hg==
X-Gm-Gg: AYBFou2D73waKGFYAvB7/fA5Zzq+KivB4Rk01O/zBrY1jg2qt1lb/XyharHTo9H0Awo
	lYNYoTxvniH49uT9Jx++2ucIcHAmFAv6T2i0Nsv+Tn1VYWHKFQVuAYIZF5SzyWeJdYiy6zG46GG
	/Q8+0lCyRrtiQWSO5xA3CEQx89PrDkIa6PgVRXQ7WCn1l/8Dma0/dcMFIzr/pNy/CT9NBWER1dl
	wiknFz7mhOHyiOrLtcEn9Zu0tF8jYmgbEtaNVQYR8dvg0nZ1zB87NwvFLFs5HvTLcwK8dGLStc=
X-Received: by 2002:a05:620a:372c:b0:93e:c12c:f127 with SMTP id af79cd13be357-947842cc3d0mr531329485a.83.1794223445766;
        Mon, 09 Nov 2026 03:24:05 -0800 (PST)
X-Received: by 2002:a05:620a:372c:b0:93e:c12c:f127 with SMTP id
 af79cd13be357-947842cc3d0mr531326585a.83.1794223445161; Mon, 09 Nov 2026
 03:24:05 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109110352.1621-1-xing1989093@163.com>
In-Reply-To: <20261109110352.1621-1-xing1989093@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:23:54 +0100
X-Gm-Features: AclHuK-bsTnV534e2o8b2uaFEnn9XDo3taFcRNRvoIpbZtuKvB31nYQ4Wmbg9tg
Message-ID: <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: xing1989093@163.com
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NSBTYWx0ZWRfXxqsHkdMwDVKo
 /jzGNV58RVdBgRA7ijJOXvB+siy5A5uiDxRR++eT1tJeX9OI/tG+qh8Ufp9CjZASs5OZcpgVipg
 pTx/SGXiE8jTihauMB64YoRTWjE01V8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NSBTYWx0ZWRfX39pqiW17pi9l
 YPMZZzWjXKrblJQ7zyK8AObSlsueG7PSUzei1BQBd8xHPPcW/TYiQJElRJYYhZOlgHKf9/d/O+d
 IZWS2ohJmhMiZczx5oMZKzJqe9bh9rGtcwDowAqHdjoMTne/jQnHzpOF2zZHMbHCXvbugJREJLT
 EVyBDR4+mhg4MqBswTg4df6hD8MZsXUTPyn7EoRvPQjkUuLPIPP2rPBSykDqIeSkRdSnxGOcg8G
 2bsaF6epb2idrZw/r+qY7OnPetH6g5V6tj6VHmOlALAhBkDQ6LCq8UodgHo42WRRSm//jSzdM4/
 5BXuieqftmuyssxZ8/sdVWXxsiTNG135zWwt02ykzfg+IWH1oCBp/Zm3n23J+GMREoC9QbZ2CCI
 0F88sH+52YBi94Cc0ZG1r9NYxDXo4ToG0Z6G0euob6lBjM3qceqBf1+lbmRBs3RDFhWsPxhrTnZ
 6EHfB7GK8TG4WS2P1GQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1ad56 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=Byx-y9mGAAAA:8 a=KKAkSRfTAAAA:8
 a=Ok8h7geywy7ULKIwiTUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EQZ8Jgsuc7pMM4ydnuFj9UPtYgCOTuQ9
X-Proofpoint-ORIG-GUID: EQZ8Jgsuc7pMM4ydnuFj9UPtYgCOTuQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090045

On Mon, Nov 9, 2026 at 12:05=E2=80=AFPM <xing1989093@163.com> wrote:
>
> From: Hongxing Xu <xing1989093@163.com>
>
> Writing the MHI SOC_RESET register is a device internal soft reset: it
> only asks the modem to restart itself, so it is useless once the device
> has stopped servicing MHI. A platform level device reset (PLDR) power
> cycles the module at board level through an ACPI method instead and does
> not depend on any device state, which is why vendor drivers keep it as
> the reset of last resort.
>
> The out-of-tree MediaTek PCI driver does exactly that. Add the same
> capability to mhi_pci_generic so that such boards can be supported
> without a vendor driver. The method name is board specific, MediaTek
> firmware uses the vendor scoped "MRST._RST" while others may expose the
> standard "_RST", so it comes from struct mhi_pci_dev_info rather than
> being fixed in the reset path.

Since mhi_pci_dev_info describes device-specific rather than
board/host-specific properties, the same MHI/PCIe device could be
reset through ACPI on one host and not on another, depending on the
platform it is connected to.

> A NULL name keeps the generic SoC reset,
> the same way fw and edl express "not supported".
>
> pci_save_state()/pci_restore_state() are not used around the ACPI call
> because they clobber dev->saved_config_space, which mhi_pci_reset_done()
> needs; pci_reset_function() recurses back through reset_prepare();
> pci_dev_acpi_reset() is not exported to modules. The call is skipped
> when oops_in_progress is set, since acpi_evaluate_object() allocates
> memory and takes ACPICA locks; that leaves the panic path a no-op rather
> than a fallback, as a device needing this method cannot use the register
> write anyway.
>
> CONFIG_MHI_PCI_GENERIC does not depend on CONFIG_ACPI, so the path is
> compiled out on such builds.
>
> Signed-off-by: Hongxing Xu <xing1989093@163.com>
> ---
>  Documentation/ABI/stable/sysfs-bus-mhi |  4 ++
>  drivers/bus/mhi/host/pci_generic.c     | 66 ++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+)
>
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/s=
table/sysfs-bus-mhi
> index 8b9698f..064bf6b 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -29,6 +29,10 @@ Description: Initiates a SoC reset on the MHI controll=
er.  A SoC reset is
>                  This can be useful as a method of recovery if the device=
 is
>                  non-responsive, or as a means of loading new firmware as=
 a
>                  system administration task.
> +                Devices that advertise an ACPI reset method (for example=
 the
> +                MediaTek modems using "MRST._RST") are reset at board le=
vel
> +                through that method instead, which power cycles the modu=
le
> +                rather than asking it to restart itself.
>
>  What:           /sys/bus/mhi/devices/.../trigger_edl
>  Date:           April 2024
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 7193a38..4e84e10 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -8,12 +8,14 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/mhi.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/printk.h>
>  #include <linux/timer.h>
>  #include <linux/workqueue.h>
>
> @@ -39,6 +41,9 @@
>   * @fw: firmware path (if any)
>   * @edl: emergency download mode firmware path (if any)
>   * @edl_trigger: capable of triggering EDL mode in the device (if suppor=
ted)
> + * @acpi_reset_method: name of the ACPI method that resets the
> + *                   device at board level, such as "MRST._RST".
> + *                   NULL when the device cannot be reset through ACPI.
>   * @bar_num: PCI base address register to use for MHI MMIO register spac=
e
>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
>   * @vf_dma_data_width: DMA transfer word size for VF's (optional)
> @@ -55,6 +60,7 @@ struct mhi_pci_dev_info {
>         const char *fw;
>         const char *edl;
>         bool edl_trigger;
> +       const char *acpi_reset_method;

And your patch series does not define any device with this property set.

>         unsigned int bar_num;
>         unsigned int dma_data_width;
>         unsigned int vf_dma_data_width;
> @@ -1111,6 +1117,7 @@ enum mhi_pci_device_status {
>  struct mhi_pci_device {
>         struct mhi_controller mhi_cntrl;
>         struct pci_saved_state *pci_state;
> +       const char *acpi_reset_method;
>         struct work_struct recovery_work;
>         struct timer_list health_check_timer;
>         unsigned long status;
> @@ -1180,6 +1187,49 @@ static bool mhi_pci_is_alive(struct mhi_controller=
 *mhi_cntrl)
>         return true;
>  }
>
> +static inline struct mhi_pci_device *
> +to_mhi_pci_device(struct mhi_controller *mhi_cntrl)
> +{
> +       return container_of(mhi_cntrl, struct mhi_pci_device, mhi_cntrl);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static void mhi_pci_acpi_reset(struct mhi_controller *mhi_cntrl)
> +{
> +       struct mhi_pci_device *mhi_pdev =3D to_mhi_pci_device(mhi_cntrl);
> +       struct pci_dev *pdev =3D to_pci_dev(mhi_cntrl->cntrl_dev);
> +       const char *method =3D mhi_pdev->acpi_reset_method;
> +       acpi_handle handle =3D ACPI_HANDLE(&pdev->dev);
> +       u32 saved[16];
> +       acpi_status status;
> +       unsigned int i;
> +
> +       /*
> +        * acpi_evaluate_object() allocates memory and takes ACPICA locks=
,
> +        * neither of which is safe once a panic is underway. mhi_soc_res=
et()
> +        * is reachable from __mhi_download_rddm_in_panic().
> +        */
> +       if (oops_in_progress)
> +               return;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(saved); i++)
> +               pci_read_config_dword(pdev, i * 4, &saved[i]);
> +
> +       status =3D acpi_evaluate_object(handle, (char *)method, NULL, NUL=
L);
> +       if (ACPI_FAILURE(status))
> +               dev_err(&pdev->dev, "failed to execute %s: %s\n", method,
> +                       acpi_format_exception(status));
> +
> +       for (i =3D 0; i < ARRAY_SIZE(saved); i++)
> +               pci_write_config_dword(pdev, i * 4, saved[i]);
> +}
> +#endif
> +
>  static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>                          unsigned int bar_num, u64 dma_mask)
>  {
> @@ -1435,6 +1485,22 @@ static int mhi_pci_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
>         if (info->edl_trigger)
>                 mhi_cntrl->edl_trigger =3D mhi_pci_generic_edl_trigger;
>
> +#ifdef CONFIG_ACPI
> +       if (info->acpi_reset_method) {
> +               acpi_handle handle =3D ACPI_HANDLE(&pdev->dev);
> +
> +               if (handle &&
> +                   acpi_has_method(handle, (char *)info->acpi_reset_meth=
od)) {
> +                       mhi_pdev->acpi_reset_method =3D info->acpi_reset_=
method;

Wouldn't it be better to maintain a list of supported reset methods
and iterate through them, selecting the first available one, from the
most generic approach to the most platform-specific?

> +                       mhi_cntrl->reset =3D mhi_pci_acpi_reset;
> +               } else {
> +                       dev_warn(&pdev->dev,
> +                                "ACPI %s not found, keeping SoC reset\n"=
,
> +                                info->acpi_reset_method);
> +               }
> +       }
> +#endif
> +
>         if (info->sideband_wake) {
>                 mhi_cntrl->wake_get =3D mhi_pci_wake_get_nop;
>                 mhi_cntrl->wake_put =3D mhi_pci_wake_put_nop;
>
>
