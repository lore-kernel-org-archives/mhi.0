Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE0396D2F
	for <mhi@lists.linux.dev>; Mon,  2 Mar 2026 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446022; cv=none; b=T0y+AxlvkIbDyAiFONE3yxEu+w9miDmnljkixzUTrXtk4+HAgrB9M5q4sRYzMHGfHWPjzMkrkloNCsaZSfrfCIy+BtNTPWDhl7Xgm36cqdDFjuafUBW+oG9RXDOGMXWysn0w+hrVN65j3Vzbbl5XtAo+CcPpaO3N715vG6FbDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446022; c=relaxed/simple;
	bh=1DisLIAJV5f9N5mygvvEdeA1ect3ZFTltH4gxuXT7+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNFLDwo+r7jYCKSw4DVxiOa5TXKmqbGwG6Vj5kM1txpAma+hZfxDvieN/eYJ8gD+dNc9QiC6jiIIXuvhqhTvtw/jbyWPM4YLoMCUovIFSyo5pt4dKsUhJZsPWECGv9TbllLcrwrbcnuVOHnR9yyUgBCtV05yH/MhDlZXWQXPzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xcg6uVOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Amnr42ut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xcg6uVOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Amnr42ut"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294kTO1291355
	for <mhi@lists.linux.dev>; Mon, 2 Mar 2026 10:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OGeYPCNNHRhay6FzvSoj6pnDvuy3D3mqjeiMDVTRH9E=; b=Xcg6uVOKgKndd7co
	3rFf1oXMfh6VM7NFALBGz2ccMSVoQA35ZMdijMa4ZUvlMWy9rbTq5Z2G//DbZMse
	ohYZwVzLgI7kaN3LeQv0rj7mLjO4GMgLx7uonAFUdo9REx80PR4+BWp8NudXb1zU
	V5qz6GAUa/34qe1SOhSTZeBSmr6rsQyMOqI2AueQ+ZggQzYWTRyRWs7MdQPUNWct
	2PhXpD0kn3amemCKlvOo3CuztPAhmWHmeV5N4RSlYZnE6D9dLJ+S4su9vswbEyYR
	AjF2lxZ804A9c/odnaJ255QDTTTrUb9MPg5SxHSd/dUFAd2g3qcpN7B/vO517JQ/
	01PS5A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku07vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 10:06:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45ca5b0a968so55025258b6e.2
        for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 02:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446019; x=1773050819; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OGeYPCNNHRhay6FzvSoj6pnDvuy3D3mqjeiMDVTRH9E=;
        b=Amnr42utf2QLWi9krx7/sVmuyW1eD2fn9Z4PUG9FMiBxx1Wpp9wWt9EVb2q1VrqQbB
         +Cmj8lWZRO0gCxqFeaPRne7sk5e117CM1wqtQYeaj7yUqglehrXhr9BPaM4+vE3mcgzo
         x2MbpSBpTSmn8/3k7u80WEAk9qp1FJrg4WZrwwV0h5qwkwkQsQKSUq9l74zvV+3gYalg
         eXIW2WiAuHq66teRwZZHaU5VGBwsCSIo6/MX9dbkXEQ8bO8XNerL668cfp9A9P5sWYo9
         uEsCS1PwrGXfygy261rH2716+4weuiUxUI+BDTUG6tjge1qVN5ig+nGA0lXHskSeZdYz
         3TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446019; x=1773050819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGeYPCNNHRhay6FzvSoj6pnDvuy3D3mqjeiMDVTRH9E=;
        b=Bh+L9LZprDrKakjUnzM3a3vPZQ6wBB0HF04HVzmEVyTlOVCBrfDZV82YfY3Zrk78G3
         SyXs1Pfn/zdqW6BsZG9xkrXD499Zh5rIZnGmWu0LhUWZgGxDJilFakcsJO6oqkbpwWYE
         q/T4+uzRly8mX9VEOd+cXJBg7Az7tU9Vr9e+LqVnFl2J0JcUIzHa+Yxspq0Du426ccgo
         HEv+myxhpdE0xYvmE+T1n2NCVVoWj5/B4nj7IEVLMYF5tGaAPdkCRP8OJKmbjvwFDzgM
         pF0KDGZRwfLSAuTYI8QfVJphhGvHRrPB53gJllAlbtUkEDmF2BhKig7GazOaBT/0cSsl
         Cv+g==
X-Forwarded-Encrypted: i=1; AJvYcCXQDqY2V3fCMGOAoJRr9Ul/jn9kIHevgdB43pCADjRIbEQfH7e8zaqXsjfWeAjsoRtV7IQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwreJs4YKMQxknrCkmqPZ6TV48V0Fz4hvWKbaMnbNOePhcbBqDB
	9J/PuJ+wcedkAd3Cigf/rJjeIglcILE6jmtvp5CddfMpN1Hv89Pk1tyFu4UzaLYoDSQITWN2BUD
	vPsECWe3YkMBbgkFMCU9kUvbbojSSC4xwJPeBLMSA09zwcURiDT6dWJA=
X-Gm-Gg: ATEYQzzyb+Ff7IZKlEI07pTbvgsDQsUcBKWQwx2NJBV9wvbYpnnrm6qApsNg0zwUw8K
	cmuG2XjKQiMeItYdgxCT0IPFDFTxZ4ApKSrzxcXWsoCdZDQ/9lEv5uzaZA4NX+2v2zwAlmZeyNg
	Dfc5cRZuMjG7PDvTXs1R3qRfd6eCSfy9eHvWLIUWM65A3aMtGPo4oFNJ0VMhFaF593+oER7P3IJ
	NMiEHcmuxeGyGa5zogJolVvwJHbwcu54r85+lNerIYvbTpILT7DwYE0Ly8rFqDtiE4mRQ4COBa0
	5I58VA/IciT0Uyhfkb4EZCm1nZvEo68x+1l9MaqlvcpDAGtdybQPZ3BbgCQnLRjCBXNqV8dH0EM
	7EJHqCcv8UCjRzLzApNh1fAMldXe2F0LTrJFcsBhjewnLklwW69U6UpPMG5BNgbcqtNmm
X-Received: by 2002:a05:6808:191b:b0:45e:b647:ef5a with SMTP id 5614622812f47-464be9489famr5887249b6e.3.1772446019250;
        Mon, 02 Mar 2026 02:06:59 -0800 (PST)
X-Received: by 2002:a05:6808:191b:b0:45e:b647:ef5a with SMTP id 5614622812f47-464be9489famr5887237b6e.3.1772446018802;
        Mon, 02 Mar 2026 02:06:58 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41668233c4bsm2789197fac.19.2026.03.02.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:06:58 -0800 (PST)
Date: Mon, 2 Mar 2026 02:06:56 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Switch to async power up to
 avoid boot delays
Message-ID: <aaVhQKZUd+53Uwtl@hu-qianyu-lv.qualcomm.com>
References: <20260122-mhi_async_probe-v1-1-b5cb2a3629d0@oss.qualcomm.com>
 <vnqrsrglpmzizk2vtee3aohuwop5wynd463bkq6kknq4ploiox@frv5z5yk3kha>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vnqrsrglpmzizk2vtee3aohuwop5wynd463bkq6kknq4ploiox@frv5z5yk3kha>
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a56143 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yFp2A1wA7JFfkWW7:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mBkwmRZnPUGkx-IFPogA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: etLB3BidZbF1QrIn7bFsTeTqf6xOTSJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NCBTYWx0ZWRfX5eZDj3ObJREw
 /j9D6flnAwTYP4T+VJKwFoAEjQyJc/KGfSdC8ny61stR3TMWXVDCt5mKWG/Bfe8NI2pFjZ2du7H
 j91x+I1X/GlD2TYugt3GtVxzgNEK3/5nsmpx/ZJeMcsk3Mig1n+22ue5fCG3E3JfFrtYj4BXpMZ
 GI4Se/1lp+QmwkTMAy7qQKjRj6//aVrbSljlB8DHdQhDCizxA9CXZxGfTxnvyf1oyym7FpZY8nD
 jT4ofNtM1zeIZtdzvP0DBnFxeCaz5b2wEThUax+Yc0BrL9knBDvVfA7csvY3kYS9JPq2o54WDBZ
 5Z6dNdEi2pRmBnQ+KQ0BpZakDmuvmLVO+UayjlO+D7m6MZ/GzJh99IEcbPc1xh82Zpo9fnQMFIA
 I+3tYpqdZ7mmU7WOlgDTZKgyZLC0LkiBbh3X2zQGJCEfcQ+rZBcxulUBZ4FHtERvGTAbhBqBNmk
 BfhoI2mDI9kQgfI9vTw==
X-Proofpoint-ORIG-GUID: etLB3BidZbF1QrIn7bFsTeTqf6xOTSJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020084

On Mon, Mar 02, 2026 at 01:37:38PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Jan 22, 2026 at 12:53:48AM -0800, Qiang Yu wrote:
> > Some modem devices can take significant time (up to 20 secs for sdx75) to
> > enter mission mode during initialization. Currently, mhi_sync_power_up()
> > waits for this entire process to complete, blocking other driver probes
> > and delaying system boot.
> > 
> > Switch to mhi_async_power_up() so probe can return immediately while MHI
> > initialization continues in the background. This eliminates lengthy boot
> > delays and allows other drivers to probe in parallel, improving overall
> > system boot performance.
> > 
> 
> This part is fine.
> 
> > Add pm_runtime_forbid() in remove path to prevent device suspend during
> > driver reinstallation. This issue is specific to async power up: with
> > sync power up, pm_runtime_put_noidle() is called after mission mode is
> > reached because mhi_sync_power_up() waits for mission mode event. With
> > async power up, pm_runtime_put_noidle() is called immediately while power
> > up process continues in background, which can cause the device to
> > suspend and mhi init fail if pm_runtime_allow() from a previous probe
> > is still active.
> > 
> 
> pm_runtime_forbid() should be called at the start of the remove() callback to
> prevent the device from auto suspending during cleanup and to fix the issue you
> described above.
> 
> So do in a separate patch and add a Fixes tag pointing to the commit that added
> the Runtime PM support.
>

I can implement this in a separate patch as it also serves as a cleanup to
call pm_runtime_forbid() in the remove callback, since we call
pm_runtime_allow() in our driver. However, I cannot call it at the start
of the remove() callback. Before the remove callback is invoked,
pci_device_remove() calls pm_runtime_get_sync(dev) first, so we don't need
to worry about auto-suspend during removal.

Since we use mhi_async_power_up(), there's a race condition where the
mhi_pci_generic driver could be removed after mission mode is reached but
before pm_runtime_allow() is called as part of mhi_status_cb(). In this
scenario, the pm_runtime_forbid() operation would be ineffective, and when
the driver is reinstalled next time, MHI read operations will fail during
initialization because the previous pm_runtime_allow() state was not
properly cleared.

- Qiang Yu
> - Mani
> 
> > Fixes: 5571519009d0 ("bus: mhi: host: pci_generic: Add SDX75 based modem support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/bus/mhi/host/pci_generic.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> > index 0884a384b77fc3f56fa62a12351933132ffc9293..fc0952e46ae5e4854c7165ed60b850729843d458 100644
> > --- a/drivers/bus/mhi/host/pci_generic.c
> > +++ b/drivers/bus/mhi/host/pci_generic.c
> > @@ -1393,7 +1393,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  		goto err_unregister;
> >  	}
> >  
> > -	err = mhi_sync_power_up(mhi_cntrl);
> > +	err = mhi_async_power_up(mhi_cntrl);
> >  	if (err) {
> >  		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> >  		goto err_unprepare;
> > @@ -1447,6 +1447,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
> >  		mhi_soc_reset(mhi_cntrl);
> >  
> >  	mhi_unregister_controller(mhi_cntrl);
> > +	pm_runtime_forbid(&pdev->dev);
> >  }
> >  
> >  static void mhi_pci_shutdown(struct pci_dev *pdev)
> > 
> > ---
> > base-commit: 91a0b0dce350766675961892ba4431363c4e29f7
> > change-id: 20260113-mhi_async_probe-a7b0867b6e2e
> > 
> > Best regards,
> > -- 
> > Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
