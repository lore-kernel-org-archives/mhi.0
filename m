Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8C2F12C5
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807335; cv=pass; b=NRtSq4W67UkfB16mBi9ZTWQkk3l5sZWJpIEr5GmRvnaIOva1S95qth+gTxF1mobJqQb/YM6ZvNK/5PUWYOhrBItUQq+u9IdZo+PpBHv+iNYBDd8E85OY88PZhrP8DQ6M++L+aDvEIhegU53WzAGZDjCbrdRYcagvxGoNbeeXa9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807335; c=relaxed/simple;
	bh=XkD4CR8PxcyIMPcQRsfJGKsjJYowH3YGB0feBNav0jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RqpauHrjHvpEAZT3YYs+CX1T3rTKJkoIXIxJtk+ed+hSmAhjxX5HCW8gLhLRBvviwAMbclquNKjOu/LzEgj+XUJNsum8NAw2dCtcuPBYxeT/xgxrw1uC30pcN9dyfaOWs2pr5U1LQPp9/5dCiPgJodT7M2fpprkbZLIi9XOov/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIgjJlun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8bDqtC6; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIgjJlun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8bDqtC6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08QA1933224
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 12:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=; b=iIgjJlunebaL+dQl
	y7kyAnjPWPQyVlo/xPz7GIFkfZwEikr1zOuPIKSPYaLj2MtDHc1fdFB8f8op6wLW
	+XMplFk5+Z7AG/jH9ZuL2TiFzMPP32hMGXSdfS3lnuyq/QzPeecOx44JYznM0IQH
	Y05Esm7GtzezMV7x/ugGG37oRlDmgeWBqjUf9QJgdGl5QU+MQ0MJEShQEI3MpopY
	Kh22adoL4j3mzdXhgg2zOoQxIYBXT0260kg3Ri3iozM5FeIa8lQ39KhkRkJ8ufu4
	asQXAmQZl9IqLL1TX4ixiUNYH8p4PmLogxZ9ZQj/y0R2aEuC0LAieJO3S7XcdBo8
	pAxgzw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkj3w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 12:15:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b89614300so13725866d6.1
        for <mhi@lists.linux.dev>; Mon, 12 Oct 2026 05:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791807327; cv=none;
        d=google.com; s=arc-20260327;
        b=jaTCHKQ30AINNxCSzvZVsNSwLlDz+39Tb+SBvEic9Bk8xbZqKlF+pp7RnWwVMIv6Mw
         4iX8PHl/K9ddzTecBkq68d64Vq50Mqk6AULqS390IIjcHwrSUW0rhSTVmZV1s2J5xvJc
         x6TwzV9JesHJCBqbS2y/MHS3Keg9gt7LH1XozfKolOq7iiiwFGerzU1aCAXmV2I92IP8
         YB/8KQK6pGSHpIbv4qpKqM1TzMGqDHd3AoFrZioaRintON9dVoyz9wqCyj5l40jT2V2s
         Lj3yYQA1qIeUfIz9wT1QsYub+ei6p1Tw3cJmT68b6o3ZLzsxmNI0mgXGnnnPYltcrqon
         H47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        fh=lwKz7ZtDSMMCM71B5MiiWmzJmxeRdZ9zxkc7+IpkXGs=;
        b=M7OW5Kx1Ai4nbwayhmTNge40Az/0FQGgSqT+VDm3hOILFWiMA9Zf2sZ/c4+gkezUjs
         UzLlWdaawtqB450U7EN2wiROFI35eKBYZ140pAk4aGAnlwcAjZMHGL0g+DUhT05vH0ZA
         sg0xSGC4cj4e2bnDUtG1H9tnLZRhzKuVhcn+26hnkV1KoOW7rAcZqncBwDgPfLrKPP34
         apOQjbcD1rwWRUi/vqER7w1fzkuw1Ffi5S0zug1KMLOJlp3EjeNA1HBLE2Y3Hku+HhIb
         es+3kxO5EWNPHjIN0taLbEtb09hVYgNkAjuAoREZRnJo1DVsYsGwbEs/MVF2EHv5VwGT
         PpBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807327; x=1792412127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        b=L8bDqtC6O2Fsw0GA6kbpnv8umAOTk+3zI+HPjH9dbYwwD3gpWE/TLkivBss1iQAEnI
         INCQxb18Zac2xJBxuehd+fmW++keXie/SyQvuHLmJwYLSkxZ6uCCt09JKkFTQDFeNNPk
         OMI85Q6ZCmZs61GsOMqWa0EQyqjIqBj7zJDpqy64eBbbHsULqICO1YrbYbW/ZOMIIXAH
         0m+KM0qjKnDBvuoZed1GZctP8kFRf6aSz9ZD7MbW+IdwKCcp7FFLOPNIf2x7RnJwh6Hj
         r4+z7p8TzG7znlgs7JprT+m4kpauPJyvw8xpA6N39h4q5NM7uuDZSA7191rQwsgxMSCO
         X6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807327; x=1792412127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAGbpjDVZXSMGOmCLh8Gakvmpa7MrQxMwP/ilqdTzSw=;
        b=Ds9Io1o1f0idmV2UvnEJMIrosfTOUFNzOm3HUJMxpj6qVoPFhGYDUkLTh6Z8hxJ6n2
         Hvr50PhsuPYQ1LjDBeoB63fDgXsyxd0fTthZBQ96wbL3XJQXcmiQ86B1Ww2FfpRM7GM3
         v8PmcCGG3LHpm2gT9byBkfU8r34QD1SKCt0ucrPfj1NDtKfmNU1ayRx2DmIdVsZRqOMH
         /BlGaQ0coe3f4twdXsM4cMt1vkqhDbMsmv3RdQhYWiBifNGcwVkwXG7o0+hb2oCmnKlC
         pl5n8Tg9B/grWukAhuzOPMmdYwl/+F/PclUAXk8Qi1P7GYUtkDDw5JYZY2PWSxustIp3
         jnNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxspC+TaerbN3zS33HleLlwRi8QFTiVFT1slrSA1SHUsej+hdeglu9cmOFGsRUeAUTWHCA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKY2XG4vlGV3TwlGCX9uY9/07ifN2OZZ9YBcd5Tj2ltX7+0OaZH
	eZGZB/bimU3o5uyKi4eXQur4arAf3IHY20khr6FNvXS2lHJB6CqlN79sLq4Ngaeppcfgu5q8G0Y
	fAzNJUI8SVXCIzTyfMobnI3ixF/Upswq2kXRBtr6AMP6EU55NpxzRxn+ypL7NC1Ar8NqE81iPKk
	6wu0DuBQjHZYrv0uaikktTl3SQvsCjxg==
X-Gm-Gg: AYBFou0LQbXxpyeGBa8NKtr97e1AMWDtdIg5+UUOwUV95MFuXE4pAxpeNfIhqN2C4pT
	7OZ83SPhE+6nG++eZCu8yWulMQIBrCGGX20x91THTy0VH2gKz4QKwQPXjyK5itbjYHG5x28l30s
	Y2sF0sFNXwBQXR8AxLKHRIDLEfajYUxzDjop6TDDMwI4u1O7+ixyfYnoATpi3iRsepwgLCdD757
	vXXtynjIjI7KPrsePeE3HRUJXS3onyxghqWlWgTEyj4mcMNa6A6cEu5TV5kGPSEt1YtUGGpDeMr
X-Received: by 2002:a05:620a:224d:20b0:93e:c619:92ef with SMTP id af79cd13be357-93ec61994afmr1003158385a.42.1791807327107;
        Mon, 12 Oct 2026 05:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:224d:20b0:93e:c619:92ef with SMTP id
 af79cd13be357-93ec61994afmr1003152785a.42.1791807326529; Mon, 12 Oct 2026
 05:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007182238.1154851-2-peter.hunt@opengear.com>
 <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
 <20261009001714.1078580-1-peter.hunt@opengear.com> <20261010171531.1659006-1-peter.hunt@opengear.com>
In-Reply-To: <20261010171531.1659006-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:15:14 +0200
X-Gm-Features: AclHuK86CgairrG5EnLwkN2ULrA7W0dmSP8kvp0UdVoDkSumbBYBiXSg3WaZPEY
Message-ID: <CAFEp6-0vuU2sy3pfgyprMMiLOaKCoZMQN=nHQ+dQR1ku9dbwkw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: Daniele Palmas <dnlplm@gmail.com>, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX8W6CrVYYFpsu
 oMFCn+KG+xT1tGfenK4SOSemPKaHoQHLKsHADxXjFC5jTJ2qgcBdBrysaEeieuBJIMii0JyQOtc
 IdZ5YWMKjpD5ORMGGDkqbFv2n8BFlSPYdXCtzsAYnPQYulfOlqoBGxgCm0Jcl+XDEtKmSLYjSRF
 DdwK26hTvZO52bSLiRjr//ZOzOzu+74oIhErozzI59hyqSdYMxVEXS+dXXiy1UkRMDCWRhquuhL
 xcUOYJL2tKoImhBh4nYT+fuj/TKmggfL9fPDcsbdR5DWx1FRNeBQW9tgKouQlyVyF8/z7BK8TwE
 JSdVdIHR4qzsnLDc8lRCr4pkOzPlPdBDKDmFMrKZoyC1x8R7fWhh9Hzml5VGic9eUaWur5ZYjz/
 AbkASI757ZvBghPQJNmFVcHJscW0ndPZc3uBDpAZPermbV2vlKD22I7OaTLT0zfg3WcZt0qaMrn
 hXoHk5FOsFjIEIyzbpA==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acccf64 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=t2vznHeBAAAA:8 a=088zT0Ob94ooJFCwm_YA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OCBTYWx0ZWRfX50zdbRtrguJV
 IrIl3l7bHTW4RznWPttzW4LD9CYlj+nMiOS+F7CJFMcs7Ip53AMf6pCRY0+5ZbLyXdaX1icFuPr
 zEzazodws8yb0YzUhr0IrpJOEVQeWP8=
X-Proofpoint-ORIG-GUID: RvhU38ccNolwSLeQ7SSYbYyqpzLK5OmW
X-Proofpoint-GUID: RvhU38ccNolwSLeQ7SSYbYyqpzLK5OmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120048

Hi Peter,

On Sat, Oct 10, 2026 at 7:16=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> Hi Loic,
>
> A follow-up to my reply, as I overstated one point and would rather ask
> than argue on both. (Adding Daniele, as the first question touches his
> recent QCDM ioctl work.)
>
> On the AT-only check: I said QCDM has no DTR semantics, but I don't
> actually know that. I've only verified DTR/RTS on the AT (DUN) port of a
> Sierra EM9291. I don't know whether the DIAG channel behind QCDM ports
> honours DTR on these modems, or whether libqcdm relies on it now that
> QCDM ports have the TIOCM ioctls. So I see two options:
>
>   a) Keep it AT-only in all four places (open, close, removal, ioctl).
>   b) Call ->dtr_rts for any port with the TIOCM ioctls (AT and QCDM)
>      whenever the driver implements it, again in all four places, and
>      leave it to the driver to ignore ports where it doesn't apply.
>
> Which would you prefer? If you or Daniele know that QCDM/DIAG ports
> care about DTR, that would settle it for b).

I think we can go with option a) for now. The documentation I have
only references virtual RS-232 control signals for DUN, and we can
always revisit this later if additional use cases arise.

>
> On the locking: I agree the data_lock/ops_lock split is awkward, and
> it's this series that made the two locks interact. Most of the races
> found in earlier versions came from it. My only concern is the blocking
> write case I mentioned, so the options as I see them are:
>
>   a) Use only ops_lock, with the whole ioctl handler under a guard and
>      mutex_lock_interruptible() so a waiting ioctl can be interrupted,
>      accepting the wait behind a blocking write on rpmsg ports.
>   b) Keep data_lock for the termios/TIOCM state and take ops_lock,
>      interruptibly, only around the ->dtr_rts call. v9 already limits
>      that to when DTR or RTS actually changes.
>
> I'm happy to do either in v9, which do you prefer?

I would also lean toward option a). We may want more fine-grained
locking in the future, particularly given the blocking write path, but
I think the current approach is acceptable for now.

Regards,
Loic
