Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794576043;
	b=X3biVjdYm2Fo2UEGy8/HC9aYrCQnUJVYctCuMKQNlygZ3PCBR8K/l6EnagSAnlQSezcD
	 s4ZyYhBeolb894/0tXPYUAjktUvGI/koYC5vqhf5HeBtjFbmx9lUBYz57Uw/kUZMksWmv
	 IqFoJNZBKyJmCABEXOmjhhaFFLsCMjECjS1dWGfr2XG84bO91C4FHW1yj/s4v5JtOEE0n
	 7lS3esfD68i/yKChW30ehOB8q7THDBkMEMD68KsrmBULFpkwK5e3sKdrFH6c5lB0h2pjL
	 a83sQ+T1MS3j7g2JB/ZdPszkybosCrVCvMV4Q/TNDKgdKC8wgLcLcjAWahJ5p9jhJUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
	b=AZS/xjQFHESu9AGEVqBG+RKnCr+Ao+e33XInGXlGwbl52bwpzRkRCJGYDqnxqvH9G/Zg
	 pJs0HznldYQ/oBDUNaEParY2Q7/GHA2UuF1dF2NhMH5XKkr46Esnqz6MwmYe8SZcuqWtQ
	 yc1vujo2WAjcAPFYzN2tR8POZNz8i+kwlmZfudksuNzAKIj/dX84A46+dgHumRYyqcSLW
	 91KiIn6aLxBrjL9eRAOVKksMBnnMw2DeG4/IUoker1M4+2ddwy77MaJEMQY/4wMKN6LRv
	 omI4E3OVLPHeciLfd4U9OS0ZKqiaa6rybAET/rHkCEdDerLuewYHuCtvj0nbUaFikJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bsw5e1hi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1fo6ZR2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC2F606A8B3
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 13:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC2F606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bsw5e1hi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1fo6ZR2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJclk242575
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=; b=Bsw5e1hirQIXko1V
	P/A3PCvUyTKZmfoS9gy5RgDa/dv85s3HuArahYIeIgFWuRgyN8aV2PmZZwTCkxDD
	y8N+PDV6Z+HV0a2usDHnZrVOn+14Y76HpxIKK2OVIFGQCqLPqLstGD1ImLW5fs60
	UfP9cNwJ0w2B/2Zzltv6H9Dv/MNJ/8UHouJQC0L/gCk3vWl3kZ+6BiGXVtGcsm2e
	KmrfMtMpG0fzfh1IIqAqYTBtBJRumGmVmAAIXfwiFGbYoJYziQ7OlEtJ0tD+HMvW
	jpsPW88hVEk8TBMhGU/OxTvcNdSvvX+/zNk6nF27/N5YNBkWIA8MjaWcvki3EppX
	0IFABA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37hngn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 13:20:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so206375085a.1
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 05:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794576041; cv=none;
        d=google.com; s=arc-20260327;
        b=eJXqe/8GXKRdqHyK+ERIgJduppYxvjZ/6Bz9+GquS+t3qf+QWfQSBmlLDpbHhn7WmG
         3SHFFXPqUE9dEgIbhqljB/nOptgoDuNdv69fUIqXuEyAyiBhcNadJ9rORNIQqsxW6BoS
         ol7Y2O+Gwu1wJcqY1v7kCwK2nrtgRAnF75eCaoL4SveH2r6/DERu8DTNKybo+zbdzFxh
         NPG0PU9R7ToDE9sEviFoOqn8+o6ipNqKwRuFcL5URiWX9dHkNTzCiZ22cZ5fzSSRd2fb
         o0SJgkcBvtIU9FXmhUxKuHiUAJG8DlDtoz1ARC6f7y5SA91dNEJSfs+hjXIZIJiI3BwW
         O5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
        fh=LvWuxUsLs9xEm3hJLacOuJrXxpxxeLiTvk+th9nSOlU=;
        b=O+NRNOVMF8FiFmE3uQ21jtj58AStAxwwlZIJoe+8dab/6Zk2d2mCRgWwPo2aZxgrFm
         BbuW8Q2lKR57AFIUWqPmpddSyEiOQyKLs8N+MrPe5ADi/OKxoeHD548RSUdZSAJs46ki
         wWGR6mHQhCEiWkCZcnXv/3XAa0mr5V8L3wCSVmKOjBwggFd/ZkL8H7fF7iVUU8Whp9+W
         0GW780q+HIf9lTVsEe09UckMBY43Sh38DY0Kc5y4mH9SgIY/0jRWrjUR/7HObZ67dgyh
         +qjynPj+hNuPidkIkhC5Qg5y9taed/8oJv30Y+C5R0q1ennVD4A2lQ2QFWcE2CYbY9eb
         l9SQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794576041; x=1795180841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
        b=i1fo6ZR2yhj9afCLykObzCbcgMR33oZkaMdynmPmNK/B9BUgXLEq2pg7eWtiKZleV/
         /8S4YLLuMcuUFHDmDW2XDpLfyZSsg3T+UDCjiiW1hNV9y5lJFBKwXO2HnHDh0Me+ExA/
         z/a5J4Ys4VeeN1BBXGCkQKdGng5tFILwf3PFf89cq75Qw/L7G/05yS8OCLC33lwgVW1d
         tH0q2nzCGghlDy09WOsFJoSzWLEyEkvoD52uU9GA11kFrkuyHxmouXYh/IvPYztzCp2F
         fYsrdgn7QHFwpE3N6C58mVo3ivTWSspdgtisHDuGzQ2i8GKKGSBlPp9ZSgaT6NOncxfB
         72Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576041; x=1795180841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
        b=RV6YzAE4fma/VdQf6THMk0co3kDx6b+FkttrAdaIDXrJs1PuU3Cp4hhqlzaVSFVYuf
         NlqH1Az8I+xBUU7DW5Tz24T4NCGLRygAGFZwVOUNto7RZppiaaPlNWjRdJUWZoDDUcHC
         xFt2sdK9vNec1dVBydbC2f34M/NxMPPuCqrvhKeP9zcLSMuF+n9ooT20AOKBlAcEfQjB
         kSjzmmggKoxYbh/BIqE9jLVBCSaJwST1/A6fcHd1So7LQ1wkQxg4UwAvc0ZChD2RXtwC
         HWRSpVMEdWv/pKkrGpPz1FkgoseeyYXDsRTLxpJ0S2VmLPWVHQ0pWGBX4M7A2F15alf4
         xmaw==
X-Forwarded-Encrypted: i=1; AL+hErHkfneuAo0F4r09x9V0YswlhexcW3RTYilYlmlDnAioskNLrthT3Jb4c2FTrbZLma/kBxQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Jzm8J6CVUvReszEw4rX49+Ub2ttxxSOVVh5fVwb7lyYR0na8s
	mH9tZmXLgQWChuwmYwobyFULrlHvdoUNPqluta0QhseSEanIeozFbrS8cYMHi4GC7unUhm75B5Q
	qjpcZSGMelgZtZB3dyoQvMOAaijbIuJZ20GOUv4BrBfguz2UNx0RZEWqVTYKAVkbN3TJVXtm5IV
	k2aAoFhXCiy5yMPYGcQYiVqMpg5LQtuQ==
X-Gm-Gg: AYBFou1yNHjnrdov6ZEkYFlPfttpKpWYOBnit/5J0RrJF8A0xsr5IU+7QR9+xGVxBWr
	BsyAKNjLhzApa03opLzblNoRIRemPty3BtvUHQhFE4uvjA3DEQrL4GKzwxZcu4a6HMGySyNBROX
	C670In4pXJPTnJOSKxIxRddkeL+YkHeGajhIwfFts/l3RQemF4TnsR1vY3Yy6ZnVnORNeKLcWIq
	UAlMvcy1OTlpWAjIHHlnFhm099vgRYGOVPps3wZdTltu91IIrdwhgz2ih5Q5tivcdOfo0djzxuR
X-Received: by 2002:a05:620a:1b94:b0:93f:6fd6:fbf9 with SMTP id af79cd13be357-9494bb73895mr395776285a.66.1794576041145;
        Fri, 13 Nov 2026 05:20:41 -0800 (PST)
X-Received: by 2002:a05:620a:1b94:b0:93f:6fd6:fbf9 with SMTP id
 af79cd13be357-9494bb73895mr395772685a.66.1794576040564; Fri, 13 Nov 2026
 05:20:40 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <b47282f1514a9012ac51d0915afb83782c3c0050.1794417398.git.len.brown@intel.com>
 <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com> <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
In-Reply-To: <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:20:28 +0100
X-Gm-Features: AclHuK9JvzPh-gUt_-PJY2SOU0LfVCGU1Ko4D84s0fgkAlJoejMKa24l7xCqmo8
Message-ID: <CAFEp6-2sLZkNQqDg7seE0ipZbuve_TZMjgNHV4ubW0Qs80Pyhg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix erroneous system suspend abort
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX1vQOD8h36zvp
 ZLKWHSaaFzciG238Jzq6wk8iQXr4grhIUg1dkB7Xx1LKuUumRHUYB27twXhwVsQ8BpIdsff8CAI
 yPFH2l5YPoLAjHnCw4qmkDObIldXLbE=
X-Proofpoint-ORIG-GUID: uPW02H2SPd7iQpFSveBbq9oQBTuo353L
X-Proofpoint-GUID: uPW02H2SPd7iQpFSveBbq9oQBTuo353L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX1GTZwC2AOwae
 FoNXTvnACf7AGEh79jZ3MZipugHeICD2Atv1qhmrlqHNZm/doKhQ218b91m02iPxObLVzOI4q/y
 HcGVsHaYZlySXuMvgJU40FUipjcnYR28D9jHlh1TpXqYE3t9pBh0xI87bXOMo2tjcnYn9hzb40X
 YHnSWFFkDSOuxRvLb4clzkKswkuYjWwyppd+lcyv8WrVyEuXMryKICT8fr4vLpjqwRnrKlO06dH
 pwWyQ/OdkrUTRjABjg9btKLPK3gn2htQEwnmkfguYe5uNicP+BGk+qQdLD7dqumpMx8gEaTW/Km
 T9WeQptBJiw0UmWUzIoPW7ky5k6wpRBZaQlkcg9R8zqRrcSYujNa3CX4C6extXFcj4nY76p3atz
 Bx2gre7t/mPkRBT8CV/AB28H8CxY6HuqDBGLvdjesbj1UOKMpzkVi+SUqrb1AckePReDWvOlpPb
 buUmM39D5uXX9/bogdw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af70ea9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=BYJHoP1oeDQRUb2UbM4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130053

On Fri, Nov 13, 2026 at 1:43=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> Hello Loic,
>
> I agree that the device and the driver should be debugged, and perhaps
> re-implemented.
>
> Indeed, I'm happy to share the dmesg from 28,000 suspend/resume cycles
> on this machine
> over the last few months to support that effort, should somebody else
> undertake it.
>
> But today, this device is allowing its internal contagion to spread
> into Linux and interfere with
> system wide suspend due to an obvious 1-line programming error.
>
> This 1-line fix should be applied NOW, without waiting for internal
> mhi internal or development.

Fair enough, but would only ignoring error on -EBUSY would work for
you? as this is clearly something which is not relevant for system
wide suspend cases.

Also would it be possible to add a small inline comment saying we
purposely ignore this because of buggy mhi suspend handling.

With your patch what happens on the system resume path? is the MHI
device recovered?

Regards,
Loic

> thanks,
> -Len
>
> ps.  I filed this over a year ago:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220020
>
> On Thu, Nov 12, 2026 at 5:23=E2=80=AFAM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Hi Len,
> >
> > On Wed, Nov 11, 2026 at 6:23=E2=80=AFPM Len Brown <lenb@kernel.org> wro=
te:
> > >
> > > From: Len Brown <len.brown@intel.com>
> > >
> > > mhi sometimes aborts system suspend on the thinkpad T16 gen3:
> > >
> > > mhi-pci-generic 0000:08:00.0: failed to suspend device: -16
> > > mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend(): mhi_pci_suspend [=
mhi_pci_generic] returns -16
> > > mhi-pci-generic 0000:08:00.0: PM: dpm_run_callback(): pci_pm_suspend =
returns -16
> > > mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend returned -16 after 1=
5145 usecs
> > > mhi-pci-generic 0000:08:00.0: PM: failed to suspend async: error -16
> > >
> > > When a driver returns -EBUSY for its runtime suspend method,
> > > that means "try again later".
> > >
> > > But when a driver returns anything but 0 from its system-suspend
> > > method, that means "abort system suspend".
> > >
> > > Always return 0 from mhi_pci_suspend().
> >
> > Two things:
> > - I think we should simply use pm_runtime_force_suspend() /
> > pm_runtime_force_resume() for the system sleep callbacks instead of
> > implementing separate suspend/resume handling.
> > - Rather than silently ignoring the error, I think it would be worth
> > looking at the mhi_pm_suspend() implementation to understand what can
> > be returned here and under which conditions the MHI device fails to
> > suspend.
> >
> > Regards,
> > Loic
> >
> > >
> > > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime =
PM")
> > > Signed-off-by: Len Brown <len.brown@intel.com>
> > > ---
> > >  drivers/bus/mhi/host/pci_generic.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/hos=
t/pci_generic.c
> > > index 7193a384cca4..b036fa6e06c4 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -1727,7 +1727,8 @@ static int __maybe_unused mhi_pci_runtime_resum=
e(struct device *dev)
> > >  static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> > >  {
> > >         pm_runtime_disable(dev);
> > > -       return mhi_pci_runtime_suspend(dev);
> > > +       mhi_pci_runtime_suspend(dev);
> > > +       return 0;
> > >  }
> > >
> > >  static int __maybe_unused mhi_pci_resume(struct device *dev)
> > > --
> > > 2.45.2
> > >
>
>
>
> --
> Len Brown, Intel Open Source Technology Center
