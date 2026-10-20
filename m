Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792481278;
	b=hQl0tAkw3adgnIi+w/JLNG7MTfYGez461cJokG3vEsLxZoD+YXHnp/o+PwyMRGoaIGjR
	 4fWYzCvCnJ1Hb9SqPbrErxnMtK+5fmLBXylrFZk/0DhmA29QzJoxhIhB4ZJRHFDxpSRq8
	 pK5Ehmskbe0bvN3J9iVBZuV8KMx5HDTs6rl5udm5YWtsqmOlqDBUcFW52pAHwc7UU0wnx
	 h8/R1tlWSye933ePGe4a96p56835sg2BEkGloYOJVZ9pvvVqtbGLaVKmlg7f+xzRLSc75
	 SivZ59oaUv3My7HobHN12V5iCUsbHWHLwRERjr3p62EdXqc3K6SCRINS8c2YhPTTmHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
	b=XCH47IEKxsV6AmaigEExskqwFK5Xjztg5JCqfdoZYL/wyjRsQS310tN6DqlQqU18HDIJ
	 u4tgliGgaczkcBQTe/Sq7osIYUHTobY4Ag5BZo6T4bMUA7vbSriHPjF6q1ewJkzWTtQh7
	 5lOq7YwU/TvPdZfNxcpSNRtXkwPCg6ULf52eNJ3HERvkTd87qbP3IsoW629ByYSGM1Hku
	 NpuSzKjjjMnCNm1gLBgcZ5yk49U6Rmx9XaH8UG150+39dLcx0Ba6TAuSHFxLOxYzuB818
	 nQ40xe7V+4qdCR37S/NmZSEmwI+ZrsvlG8QuMAzDj1WeDNfQr/Mc3Er/6HXYgvzmmrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGMTvWOl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yejo/AI3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F87606A32D
	for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 07:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F87606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGMTvWOl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yejo/AI3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tEaV3485941
	for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 07:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=; b=JGMTvWOlYgDWwsR4
	px87J5+exc88G4hmXIZIwtukYLxRO914Z4LsmKcoNegLaS2ElQ/TQ7t8F69p1CSe
	Bm4DAxTy1ck9PbnyM1mSBympoFSqVOkR3XNjstFzb0Jddht29FnN0hdAb4n0dbIy
	NpZTu0uBCXhwG2BXT9a3g8+9m1b7Futb5aSRY8x/W/R+Rb7wBK5HksyotzZBDvU1
	9zj+xbfHza6SMMsKlck/LOuqY2APMA94D3G7jUIMT86nH/LS429AmPyqGd/dIT8j
	ZmssFiysJeDA9oTvkU2c96rKltdnbkwBrh+ar+CgO/70aIW+1vz5XmB3+PlYwlZY
	Al2OVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1cht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 07:27:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso51855026d6.3
        for <mhi@lists.linux.dev>; Tue, 20 Oct 2026 00:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792481276; cv=none;
        d=google.com; s=arc-20260327;
        b=kQzwsKyPGczrLkmp3s85rskIE9GuMBVNnNaJGfL9KWNNcAL3SphJR55TAAhuYDSR55
         IuJ1QmP0HTWU1DYeUz0pKP2ZxeQsji9kZhzMdWJK+4+JexLnhJBSxPs+V/pyq2E15fzZ
         RTAN6IHu9HXonr9lR3NcKd7cLWL0v9t8CxUvAjD+/PnEKupOTcAmVlG7x3CiIXbaVkC3
         bol4vLhP61s5gg7h7bg5/289KRlOO5HkqqCyZ16jUZPZR1B17FwSXvl5mcHW4vW4BYE7
         cV9koj/XsoOi4YM1HuhSYok6FO7FhPtJ/PnpKadOYt3W1zmlwrEJy/cjcP5wcdkGeYaa
         ITOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        fh=R+6vjzO8csrkubowm6Soz6qB1mQFp09HKlMMYARvyWc=;
        b=dZE0XcPV74SatjKut3IBEMK8xvezkUuQmkZ7mqz/bMSnN8z/WL2Zxw2DiQr1zoYAQg
         QtKvLl/TWIQUppjYZzaDsjJhk6aJersKw+j2jF+PHyDssavhPEr5Km5pJOZjr31y/R0N
         O/FB+Cx20jekQqcezjD8/brHl8RzWwgvECfgaZbLfvlIkA/JfarsrsU4FGwXlhIyyeSD
         qa+bULgaAk1SNhO+GMl18ldO1EqsFo1tUmae11I30KslYaPf8aGQQoCVCBc+5ixPzuN9
         LLkK7fK8RQox2KuA/lHV3LpAnN71xjvtAXXM3ER5+hUqa6KdRwfYkhkuolCa5l3ouwzK
         dS9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481276; x=1793086076; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        b=Yejo/AI37b4ovbeiYokuohkWhB/3wEpzj3GTjFLUAmk1mFfhHalZq3Cir68NptXilf
         7DpAVbD9S+hUdy9OOjYtx1VX8ZrrcOYk86qG4rdTEvz85LhKKInuLbdNnlPLIs1/yOnh
         4Zl5ZoyXm9GR31htor6atllDwEhtT0qLCGUkYc3Ftf7WmFJ4umMAJMrNSswTUM8b8dlM
         CQ8ipdxO+RNt7+YMTrxsuAfJr7FrP7hcxr7uaASvABOUQgEXhEZ58uS3R1Q8JOW+b71L
         dPQwwNgFVSeUl35lc2jCeanj1ctoIFG4ORxovT1CeIcTFPTdc8sIGbxxjUVhBVkKAy31
         DO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481276; x=1793086076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uryACFItQvoVSCXIDTmHDQJ1dZiVZTVi9wKR8Cs4A3k=;
        b=wHYkli2kMyN5zd/z0aGbCXdmg8dHnr1AMWiNgVpAV/D1A70ao48ptKBbimFfW9N9iz
         DGI489gxEr9tYi+W7+12wpSmNnKxhtZhEB+IPWBPCNuPIClZFqHwjEw3fuQOjVLjqspO
         MKXly1vZDtOKM+muEi+dkBz9dxHk3scsJhWJfxZPQuLe7edCbEPnLORqtatyMX+DY21F
         vw0oCQfWVFTn5P3ZadwRY49eYvzO1hMp76ymy7FPBfF2hbe/YVitHr7EoP2Rmr1abySm
         7wy3twzBCuwTTDOTCGwdeUkTbvrybaSta7MPYJNCbFH+By33PR8vBgEBEBMrmdHDBLxj
         q4IA==
X-Forwarded-Encrypted: i=1; AKwUvByXC/V2LPBBPrfj7GqbmqlKvxeLgZNs1MeGeQxZkEIKfV9y2h60Sg2Ri2l0d5biR3VcXBE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIQsp4/P8hDqSc4yEg3mZ/2NDQN3tzOCY7O2RGJpUfYgAdbccUu
	JFxH+f2Eph5Nh0j4npw454mrsaCKwo2xlgVSXzT6JygMfO6JwQjV+/UIVXyFCVOSZtDWPdFo4Ab
	hijag32YmR3FGiwVGawUf+JFgMPiCEB8VLPcmbHRBeEy/vfYC3YxYbwZDHo1qB+Br0bL02W3isJ
	fTD0mwJxnt6JIMtrtSyMh0kJREZhi8eA==
X-Gm-Gg: AYBFou38hK0FIwj/tNtsL5HEowndOJ3hH0P1B3zt71d5LQvYJGefWebKEe1Bo3rMHKA
	xQdpuddsUe53udlk7c+N6ZObBbzz32mfE4q3Ssnp+/Tpc+J+Taj9z26PNeJXpgB9FiI46guzvt4
	dXjD0vexIXgDOT1sQ+Q50SQMW3vm0yGGtI5irkKNYtTR3jqHr2SlIDNxDdEdrf076MBgTs7ANIt
	JyXSOAndFThGWMbvFoqYlJJkT3Xn6OJpbCjtDvsvkxL4WUEJQo4DK5Y/6K8Uatrjm4ZiUdr1l4=
X-Received: by 2002:a05:620a:2990:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-93f29b7fa60mr1609173485a.12.1792481275963;
        Tue, 20 Oct 2026 00:27:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:93c:62c4:e2e2 with SMTP id
 af79cd13be357-93f29b7fa60mr1609170585a.12.1792481275371; Tue, 20 Oct 2026
 00:27:55 -0700 (PDT)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019055109.49922-1-slark_xiao@163.com> <CAFEp6-2XUE4AQPm5hinnRGyrrsHok2ftsFXragiHgDSKKtKWow@mail.gmail.com>
 <70714501.3175.1a157532149.Coremail.slark_xiao@163.com>
In-Reply-To: <70714501.3175.1a157532149.Coremail.slark_xiao@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:27:43 +0200
X-Gm-Features: AclHuK-6GBMcAS-d0BXDcZveUx2q3Jcid6zCI09TYG0U3nhdIt1a8EQqHNimECY
Message-ID: <CAFEp6-3o6gCb61hCQTJydiH2aD6CBVRa947tpmLe4L9j85Jg5w@mail.gmail.com>
Subject: Re: Re: [PATCH] bus: mhi: host: pci_generic: Update the default
 autosuspend_delay_ms as 5000ms
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad717fd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=8Bi4WqdHlDIZjTcgTq8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX6j0dSrH1BqdL
 XY07Uj+i/44rH7iiCvwcm/+IhbCOVYAFYLtDu8iS2jNZPaAB0MAWek9wTL9tt76mnZ+FfJPApaZ
 BDYIsSFVzatLVeBhQfU0rVdahglPVy0=
X-Proofpoint-GUID: 8zZjrGAt2bUJ5aLMJppdcLn6UKTRPmZF
X-Proofpoint-ORIG-GUID: 8zZjrGAt2bUJ5aLMJppdcLn6UKTRPmZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOSBTYWx0ZWRfX8DHDImEfy7tV
 rxfdzHR9KYvxYTcQNss64gzef8Uilm6SXkVwu3lMBvOyTubSm14d136NM+ngcChsZ++Mbas8HiZ
 LlCMnrSmCeYxO7TnC/MI4D/ITFtqa+UNOFsP9UTA1ok/cOu9BKx2PV1m2qKInbEK7zoXI6Caywx
 XcwmEoeifFfhbizv+fw27/dFdaqsjEcpI7BZ3mo3fkeCOgSFpwOs9yloTFRjTvjth8ehjBtfVGk
 9DwDEkOYJRxdyXOfxxUBBjD98Kf8KP41R//YwmdpVKWJ3LLXMp18ZZjOKoJX3pxfcUIW0bWSKLS
 0hljk/SLGOK3BELY54Vag+a22Hd+OgjCOQ1lAXhiV1lDvk7abSi4wcU0waI4k6JVEbM0paVflp9
 hYd9oNzU6uB/f75To1gOKH0b8qJm/3xTOiSiGZoGd4aF46MV34OPmVJd0GgpMsFvjj4kg2hKdki
 V3ZIcgkzS4q9UXV1LZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200029

Hi Slark,

On Tue, Oct 20, 2026 at 5:20=E2=80=AFAM Slark Xiao <slark_xiao@163.com> wro=
te:
>
>
> At 2026-10-19 15:41:27, "Loic Poulain" <loic.poulain@oss.qualcomm.com> wr=
ote:
> >On Mon, Oct 19, 2026 at 7:52=E2=80=AFAM Slark Xiao <slark_xiao@163.com> =
wrote:
> >>
> >> For some MHI devices in some specific scenario, the default value
> >> of autosuspend_delay_ms may not enough to handle last wake event.
> >> This may lead to some unexpected problems.
> >>
> >> Refer to the Qualcomm's Windows settings and we checked this with
> >> Quaclomm over case, Qualcomm recommend us to set this as 5000ms.
> >
> >Qualcomm
> >
> >> Qualcomm also suggests us to update this for all MHI devices.
> >> Since this setting has affected some existed kernel versions, it's
> >> better to be applied to stable version.
> >
> >This looks more like a workaround than a proper fix. It would be
> >helpful to describe the underlying issue, including the timing and
> >sequence of events that make this necessary. In principle, either the
> >device can be suspended at that point or it cannot. Relying on a
> >delayed suspend feels fragile and may end up masking the real problem.
> >
> Hi Loic,
> Honestly, Qualcomm has been analyzing for over 2 months and still hasn't
> identified the root cause.
>
> Actually I have explained the reasons behind the events to Mani in anothe=
r
> thread, you can refer to https://lore.kernel.org/mhi/20260919095506.9570-=
1-slark_xiao@163.com/
>
> From Qualcomm's perspective, 2 seconds is not enough for their default de=
sign.
> They recommended us to update this value to 5 seconds and Mani checked th=
is
> internally as well. So we decided to update this 5 seconds setting to all=
 MHI devices.

Thanks. I'm really surprised we still don't have a more precise
understanding or description of the underlying issue. That said, I
think it's reasonable to proceed with this as an initial workaround.

Could you please send a v2 that introduces a define for the 5000 ms
timeout? It would also be helpful to add a comment explaining that
this value is required to accommodate the 'late wake-event issue'.

Regards,
Loic

>
> Thanks
> >>
> >> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime P=
M")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> ---
> >>  drivers/bus/mhi/host/pci_generic.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host=
/pci_generic.c
> >> index 7193a384cca4..40735beb46cb 100644
> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> @@ -1483,7 +1483,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *id)
> >>
> >>         /* Allow runtime suspend only if both PME from D3Hot and M3 ar=
e supported */
> >>         if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
> >> -               pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> >> +               pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> >>                 pm_runtime_use_autosuspend(&pdev->dev);
> >>                 pm_runtime_mark_last_busy(&pdev->dev);
> >>                 pm_runtime_put_noidle(&pdev->dev);
> >> --
> >> 2.53.0
> >>
