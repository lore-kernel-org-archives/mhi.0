Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2235A13F
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560060; cv=none; b=MnHoPB3Qdvst8zY0eJGkTEA/1lExMR/uB4R0tqaK9pjRzbwPfWBnq1F/dXDmMSroY246OvSAsRlVz471dvgAuXdIeEjRq6OI9vXUwZ1gjeRGtBWZ2PTPQBTiUsPj+CpgQoMnJeJKq9CsZGm0w4862ujgXYf+QN7GDQAMzO0odKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560060; c=relaxed/simple;
	bh=fDOm5wEY/ZLTQb0kSG2ctQXeP09QVKdn/pChFY6JxgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9QVXPfMEQH3AbXXdQOmT96msOTZ3efnbiLPACpX0Yxt30KwYcJYDz/NOcIRUqeQcOb/ka+xZBeOkIARsfSxh6j86bWFHZjG6bII0mc+3TlCQGjzhAExc3A6f2kRp+tVeEPShW4dk0LKDxusUHcqSzg7wjVANwd3H3pBLXGZYXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/kobXso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZ9bgB3v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/kobXso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZ9bgB3v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJB92iu537178
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tiZ5VSPhJYDa1iQO8d+XKa7UiKTEiNsbsfg2KG3xxI=; b=Y/kobXsoEh9K/hXn
	OgUXohI+Boap/RXTWxWRrZG4Pu9VPX3cQfs+Q5LOu6o3iAkjWKXcuCKThTExm/JQ
	MIyo1QarFe4gUsn5XAcnWoGxwPcbAnQmsT523qfCEuVaHmAEsP0yyo5J7WdQojf0
	fAoS/DU5fbXtz4qA4XYXrnrffTWjGHnDbtAQOJFDeMTAvBp1SL0XhlZ8bPTkg10v
	zQ2Z+PV5qm0mTALJBa7a9hrT92b5JL+noRHIl/hn2Oq9LVFP+MNprzsL5nntdzCy
	lusMTI3/e+5jvUaRlbIYvEw8l2Pii00VTaDPnRWooXWKqgludI+1Pi7qHB3zFpmi
	+rmUjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t1pu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 13:47:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee04f4c632so93705141cf.3
        for <mhi@lists.linux.dev>; Wed, 19 Nov 2025 05:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763560056; x=1764164856; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tiZ5VSPhJYDa1iQO8d+XKa7UiKTEiNsbsfg2KG3xxI=;
        b=ZZ9bgB3vDZcd3cXh3KVKgRGcDTxuE9tqEtgBDxeYSUWqvh4ypCw1ZIqKEoizto/J2L
         vNpnBN5Mc+62z+AS/NARH2qwrLKM8W8HdVpj4TdNTsGNQjwsU0uU8ILHzR/mx4r8TExt
         gtAfHxjMHgXMIrEPcoTZ1swzXk1DRBxFXUk97gAyKjVtvnpr7F9YUs6PMDWcRXYJFvF9
         QmZpSp1jjvWcUmEwNvOuDAck0gQ+MUgx/Le5eW0dYTgZ/vFbeChuUpN5a8a4kXx0/ajj
         6/t8WuGS7p7BtMqLOsii3htqLyRdlQKnI2M9Mxi6dyX8CT7qwBGwgtfWOLwCCCDTzNOO
         BUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560056; x=1764164856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tiZ5VSPhJYDa1iQO8d+XKa7UiKTEiNsbsfg2KG3xxI=;
        b=n6jjByBv8HCdL2dwvsBeRPwONKrMpOj0RX9B7ZKSMxlNZWlGAiboLrvqsExXOKxmVr
         0yWD/kEtpZrQbzvpoOE+7rjyGpePtF1wnsh6iN9fTqDbpMXuZQab13ukAZ4ilFWbdArY
         af6YyRx4xS7iZ79CHg7PaWFp3qzNw20fLGqYimIp8HzFdWXpVL0vJZjhbaneFh3vlPcZ
         tu1cMjTrELo3+SmFt5aNV1TPEwtT9fcRZpnudmQHpO61rnz7QSevQjz6+zAhTDPGpivV
         1U/seEYgBdi569Ne11fnmtRXp8nvmYh2iiH+PwB0q+AZfFj5fJhSWJY4n4pnD0x3y47B
         Z8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUYS6K1ug0Tc2g0rXVwJbOiUGe7d4iuWrmMit74J3I0zDq55xsU6kAbvFo//lJoo+f6pNM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg7HiscTNf4ELd1AFve4QoHZ52JF/Jhdif7eTZcSAsxG4YlKJg
	FU7cwy0mVrG1RBfVr1p8q+lkXEb4sttIzNlI5WCeDnbM+8MkLN8R4p1wsOJaaU/BAWrDtlkQ+6Q
	+oV2wvYcH9oxnCQN0gFwvJv7ZF+6jwhVhmDHQ+VLAubwnI0QRw/vKtTg=
X-Gm-Gg: ASbGnctM6R0JMMQxD9Ygq2FAe7ntd0qo0Su5ptbBL4MRTU6TcQfHuRq+RWoNSby4tGz
	KnaOKLVhis+Plo5PXvCOlJpbxoAy/IRFia9FuHY6blhZm9mj6LXHGYj8SCJCOk3knJ+J7ymL7eS
	F/rZQiprrW613KL/byydCxarXghNElYWEk4hLdW6hbE/6BeAXelYDunVJfyxrArocdQ5ix/wj6b
	HRLOSldq52aCLz9g7Kc3DM4cBjgd14uBx3Vp+e3D9R+0D1YUUxt36PWMIAM1MwHUAV/mFsnrHLt
	9wvteSk7jvDvokyfOf4AUoQl4tuAiIwN8lNC0v3r0WRD2rrCGEo6MswSFOMEqo/1ZBqX+9szzl0
	d4MWjbiBMfRMOVqmfqRA9G+sUybrw7NTUpK5P2SvI7LGp9biY0OTVMEhhQhJo/XQJNlTBbQySRe
	9vqWHmEgyZU3EcYd9zW5atP/g=
X-Received: by 2002:a05:622a:11c2:b0:4ed:64ee:b93c with SMTP id d75a77b69052e-4edf212a300mr286924961cf.52.1763560056345;
        Wed, 19 Nov 2025 05:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb1xJ13os5DPIP4ym6xUbfxDe9p9GWA7wIXCSbQUAZrlRyRKjmS+0+aXVR3vePPjuKklaIEw==
X-Received: by 2002:a05:622a:11c2:b0:4ed:64ee:b93c with SMTP id d75a77b69052e-4edf212a300mr286924571cf.52.1763560055869;
        Wed, 19 Nov 2025 05:47:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b8427sm4657081e87.45.2025.11.19.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:47:35 -0800 (PST)
Date: Wed, 19 Nov 2025 15:47:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Slark Xiao <slark_xiao@163.com>, mani@kernel.org, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn
 T99W760
Message-ID: <rchyzpkfozxd55x4mvpsz2toz7j26yeww7yjiios3uky734lnq@rtuiloh6aokm>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691dca79 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=jQgu-4_j7KVpme77iUgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMCBTYWx0ZWRfXzaYH2obErqyP
 FrQQXcLnf2vbANe+ORuIplQG341z+HWjoz34ts7DOs1t/7djBTWO3mQy998fZTExPVjFAX+m18Y
 HTpXiq2uQTzulZbJXCAqHij7TfO6lBXd+se1uh54b7Puxc/i6e1R17eq67Et22dZYsTYNNa9mMW
 NMZlCWvwnKLMEgbAPnRPtVjSdYVJ8RQ4L5VtdJa79phKHxVFEsDo/TSRCgL8OS1ATZd7R3iURqh
 aWItdydacgFJ6FoFGIk1+Qyvl6O4iSX6QLIpb4llJ11K3NTJx7ubd4vx4YNTCeiqvFpBMsowHcb
 eMDxDRD4p3PLoJpXWJJd5NbSlt62wfrmfXu/rIXiAaz7i8bLLn6r5J/uNDcvp68nqlc03FMMmf5
 dD5yqrrzCR7N580G8bnePf+Qs47gzw==
X-Proofpoint-GUID: gD4e_P1xAqIux478JCe7J1jeVNl3A8EE
X-Proofpoint-ORIG-GUID: gD4e_P1xAqIux478JCe7J1jeVNl3A8EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190110

On Wed, Nov 19, 2025 at 02:08:33PM +0100, Loic Poulain wrote:
> On Wed, Nov 19, 2025 at 12:27 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > > architechture with SDX72/SDX75 chip. So we need to assign initial
> > > link id for this device to make sure network available.
> > >
> > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > ---
> > >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> > > index c814fbd756a1..a142af59a91f 100644
> > > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
> > >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> > >  {
> > >       if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
> > > -         strcmp(cntrl->name, "foxconn-t99w515") == 0)
> > > +         strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
> > > +         strcmp(cntrl->name, "foxconn-t99w760") == 0)
> >
> > Can we replace this list of strinc comparisons with some kind of device
> > data, being set in the mhi-pci-generic driver?
> 
> If we move this MBIM-specific information into mhi-pci-generic, we
> should consider using a software node (e.g. via
> device_add_software_node) so that these properties can be accessed
> through the generic device-property API.

Works for me too.

-- 
With best wishes
Dmitry
