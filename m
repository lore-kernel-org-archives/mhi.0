Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5240A3612E7
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557730; cv=none; b=tYObQ0jjMVrIclJTwE+81kHDR0VcWHg2bFnvejUF8H3FT4zDv7vslUgcJ8AxsEvuVVaySEYWqcIxqP9f/dbHYoTl1U4TrQtB8p3eXiWpFPbk50yyORuij9p4+UEyZ0uSCtwOIUL9kOpbaCDVaA6CHFQhvz7MA6glLnnovCAf/Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557730; c=relaxed/simple;
	bh=zfEQUt4DhWAUXc5x6ce3fvEtypuCBnBXH7OVSLBJQLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iY501ZFMxGIlhf6YxfJ8+fswPBrYt3wBTIhegsrovTkTUXvQxXHeonogq7hrDRZ2IijLrNqocA76ewF/M3GW8MmB2njAS3ki2WdtKXEynK6sjhEw7WvB298BMoHwcYGomLhU/QM4H5LPyLQw7ML1xqI7ZbpK0j8gNk/dmtV+v9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aufVFN8K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9oSHA/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aufVFN8K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9oSHA/+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB6G5k1982236
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 13:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9lECUAFdYVI6sCIVSOz3LRlNh/O8By86XnvozCDqms=; b=aufVFN8KDVdSv69a
	hRT8GTNwJnTqUhoUVN0GUd1eHfFPuDuEXpteVMBRqQmbkLV+9JhrVq/4f3PPqsQK
	spfIbRLn0RBJyWlFxIOKhGcaoRy3quZ/Ixko412pkSEOsaZmMOa2gY9hxHKyNwLd
	NnQO77kYkz+sasGlbwDvbIZ6hiHAfv0Drj/6dVhTDG89cO21LJ8N8lACunR8cW02
	RUlJvAwTWm9LW8xqVGt4tq0fZGsAN3FJsptioNFnfTmpfKS1belXodN/SSvBorDJ
	9NI/1SpAeY0Hc8QAegSbTv+eqUsyDUa4jZZjV0nxiXmVEY+ObCpM6Mk6y7tJESgn
	ZWXUfQ==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahcqng9yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 13:08:47 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-9487df8723aso1209398239f.3
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763557726; x=1764162526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9lECUAFdYVI6sCIVSOz3LRlNh/O8By86XnvozCDqms=;
        b=M9oSHA/+FjrfMDrYs+7DnGzhEFdZWKAVIzAxY3bNg9bB6Z4YvpqK/xpTUGH9vH6IW7
         vIm91y/w05YJgzz2gjuiPCkU+c1b/Rsjs31g6nDkIE6d91jRw7im9jp9vdlzv62xgBKp
         HzgcO+tqTKP205r09x4ClYjE2C45boKrxor55RDw+lMFiWnAgZLWg4ukpK0p+zvFzNm0
         PpWw1VstaN0jSGaWTfxIXYXcbwsY71o+aKMSf3qG2Q4z0l65Ib6QSFVm/iwT9aoSUrYp
         jrv9JknZuSk1lA0BXEZyAXmgAlAu1Pblen8TwfhHMDhZVXEbj6JXKTAhdrYCw7/VziE6
         YACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557726; x=1764162526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9lECUAFdYVI6sCIVSOz3LRlNh/O8By86XnvozCDqms=;
        b=tmT5h4FDzL5+Qo2jbPJBb7r6a5AWdwK/vrxH1rbH6WRC6h7SFBJsweUShCKhnoRETO
         kDpddDGlJHPXxTid0MOum/26BO6HVUaUqb+90ztAA98SBMbPhloJKGGZDXlVxkZVnuez
         uuhpJG0s7WWhKJwTZZpM7hyvZGIS16dBSnb6c7lSsNQCUOx6PLJoTF1Nhe01PXSVFKd3
         MuwLG/tXM0Q/dkdN6TMQN8Ul6+KYUdsHtWaaRLQq1At+06qAC1D5Ae69CzvxvMECeK7d
         U9dizOMLeGvAgmQXgfKjRHg9ZtFbp068qQC30jdBsEtO/LhqPrbhZYtc7B7paQpfCzRH
         7K+A==
X-Forwarded-Encrypted: i=1; AJvYcCVW04gZyy9gVrWfzz9d53ffrLu/Kc8G4OmJvl6mRfSlY/ZWBjZuieXioewT4pkoIOnR1BM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU7QUKfrodiIAzZSzVx0WjqpECx07A3F5/GOEi/Dl/Z+afygNR
	x+NFmANHJAbcDISYfCQ1Xp0oNQF9Mw7peCQG9u1/mQSZ4qypZ+FNeR/HxByh0tA7CyWyO5ya4UP
	qnhaulTxhlxIXIEkucqgX5T9iO7UWQJebHHVITru92zD6EUN2g6JRC+tPyVK/FB0GabhtVQgRMC
	iUZPWne6k9FZFVVRwfCzKpprNXTj8+VQ==
X-Gm-Gg: ASbGncukCcwSdN3egHHyHbhwYWX9aRhSzK0BNfwDfICPD5FiizC4STe5GAyM5GmXEQH
	XggkPjt3RbtgwVBf1/IgRF/HvvmIoX8Vxn5s016VsjXFNlJFF1cRYEcSXpjafUv0GUsQFPVl2Is
	5qpoBvetHDbZcXPSIgbL0qb6FEjhEL4p7QGgCJMVgfNFA7DfaiZqEacdjQDIZJNTbWvW7IElwy0
	wGe6ZETXEcBW/I9ya9P9LKzez7O
X-Received: by 2002:a02:ac16:0:b0:57b:66fe:15ef with SMTP id 8926c6da1cb9f-5b7c9e0370cmr14450851173.19.1763557726444;
        Wed, 19 Nov 2025 05:08:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY+j1dfzf8Batt7FHNQwSvu4wncs/IYd0ddz7VrhrJ0xKu+nxGk0DEyzi1ENK6CVZeNWF9cPj4TuK3qu0VzgI=
X-Received: by 2002:a02:ac16:0:b0:57b:66fe:15ef with SMTP id
 8926c6da1cb9f-5b7c9e0370cmr14450812173.19.1763557725952; Wed, 19 Nov 2025
 05:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
In-Reply-To: <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 14:08:33 +0100
X-Gm-Features: AWmQ_bkdfqVA1rkVLtELKfbA7SfWdvWWr7jj-_NBBRnuiF2JhyyUFR7jNOrf7ls
Message-ID: <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEwNCBTYWx0ZWRfX0Ya9zI3rCFIo
 JWHTXloXYkCMR+8rM4LB7IaQBNT3as++Uc3vGRIfEdZfA+HpYTFZAFRf5+Mo3oVd0fGxyEvNGRj
 Xmm4ULU/w1shTrApqshvS8WoLu3DdzG2CqXiQZjIuqiej7+5lVub6gWGX6jUcTvOdMYolScxwZU
 cAEBV708aYiSHz9D/d82qselclPR4E1L7ZUkxdWj/cV0PvY1dPC4PTym+SWYBUgj+ThsBhjk+jQ
 dnvjSzLAHpdl7ZJu3KHvnXjHg6P+0mpQyCLNLhSfsqDO8Q3FTGU2krgH3kH/86fybgu6ApBHloe
 +vMLwq/EOnTwB7KFE7+3qRgl5MvpsVnNQHTiy0VT5lLlFQbNqHJzICDqLtIoDy2DMMo5GD4tA9M
 5RaG0eddnYCvAu/3/EhYwX3NsLz7yQ==
X-Authority-Analysis: v=2.4 cv=ApfjHe9P c=1 sm=1 tr=0 ts=691dc15f cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8
 a=8dE3Wk8t88_o15qU7OwA:9 a=QEXdDO2ut3YA:10 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-GUID: -l5TnRPq0vYsnVUMbZ-23Zc18H0l1Fas
X-Proofpoint-ORIG-GUID: -l5TnRPq0vYsnVUMbZ-23Zc18H0l1Fas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190104

On Wed, Nov 19, 2025 at 12:27=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > architechture with SDX72/SDX75 chip. So we need to assign initial
> > link id for this device to make sure network available.
> >
> > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > ---
> >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_ww=
an_mbim.c
> > index c814fbd756a1..a142af59a91f 100644
> > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(st=
ruct mhi_mbim_context *mbim
> >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> >  {
> >       if (strcmp(cntrl->name, "foxconn-dw5934e") =3D=3D 0 ||
> > -         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0)
> > +         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0 ||
> > +         strcmp(cntrl->name, "foxconn-t99w760") =3D=3D 0)
>
> Can we replace this list of strinc comparisons with some kind of device
> data, being set in the mhi-pci-generic driver?

If we move this MBIM-specific information into mhi-pci-generic, we
should consider using a software node (e.g. via
device_add_software_node) so that these properties can be accessed
through the generic device-property API.

Regards,
Loic
