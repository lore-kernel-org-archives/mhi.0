Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794582385;
	b=TbQoZxWspNHUIux6IWobdfhRQR0wuTspZq4L9y0HkYAWlZqutArGSjQf20WEEqM7E6rR
	 V2IfhpCet9pLQ5E5NUn2SPLpMWlsHum7GRY/IJ6VbAwTKC3c5RNBG4hXWsYOs9DTov5SH
	 3uzjdemZ5LmiwKDZfwwyU8uYTZEeD0ZZoW287ATu6hNeFxNwb/keInXJln+qdJT3ug8Pl
	 4b/kSdSjGglBlPr8730cOXsxa4Up2NehXzy33YDQhA/sDJsXP1B78NwTORW32ZASyDPV9
	 +ppJXsfN2LwSYzHCR/vVOiHuYh+n7hBeu4+UPbrwaWT6xbUDVLNGOXfRAhFurKauStw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
	b=tBkQK2Q9yxVX8+4OMvPK0Gint4Tg12UKV9SN2gO3z3gM60QWL6t9i41ZS57tyfn3Woy6
	 RyYGMRHLtKrRp+qB+ewT4Q4cwowo0ktX34UmL2TTmMnx7YvBKMPfbnSIDz3FfBlo0e2mV
	 jGivgkClRLK8VuytNrDS7oOIeojJg3wfugdp3ooGzWcITYqxRmskbV50LeDtl/puYona0
	 0hBCeDI05xNscjfeVgq0xdyqOZZA/vt9p3xZ+UIuGD6pqbNPKpCBC7IGTckft8OzINKoY
	 LJFyvMSRL115TMP3LfT+9sm4l+oZm8TFLu12SlbcRZqQvFRTJ1NsVlkeugwL0QQjawQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RarNiep5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SLSJnb9m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B7560A381C
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 15:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B7560A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RarNiep5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SLSJnb9m
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcU7058841
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 15:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=; b=RarNiep5MUR5lMIT
	8lLqXyMgEs/rw1xbOT+r72pPfKsp3/WHQ5MQYvnqnyLwREwoFc4KVK9mDHQZ0XN+
	WujmmrTE+fWXc4H0FCUAGuTg/85kD1I7q5/PlXJgsibe3iGvvSoVJaF/BuMboRF6
	Idiv2NaPr8qDQ7EuRGBK89XBDEEL5ThPvKmnDoGWtT3ahXi8+a4ZeGZCGBWgpZWQ
	q3kihX++ylhPieuo5j/aXh3v7HzcndGSyeCmL5DQzNzKgL4G4dhiuhTmfiJXDhyE
	Z1R5WD4Wi2HZhjAi/1bgpwhZynggkhN71UJ1cg59Ek+R4PvwCEQCpbs88fDIh8rf
	fbrnYQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwbhhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 15:06:23 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f8281066c4so1435755b6e.2
        for <mhi@lists.linux.dev>; Fri, 13 Nov 2026 07:06:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794582383; cv=none;
        d=google.com; s=arc-20260327;
        b=YEHfy4xIur+ee5j0HZ+GGad67xu9EImPWy/Sadb7Lc1vFQcNGX4YMkf4qxbkmEMQ7R
         S4ABV4r1wb4yljUYgYFcDS655+syf2cjYrUjwKY0lqvhTnIgyR34d9IhYRWESixPXiCB
         mwg4ughfczTXA/l3FNj3HlXz3pBiF2X8pyxU9Hk2EQnJqBD2bU1SI9k151PMp7vlBpvJ
         nuYZJBJR8w5twY/Et1EJVS2cBv9PRYNvmTaHby746HeKm+D+hfEb8KblpoDkMJKjV0x4
         BnJdsxp//4Glo/tmKdMU+gPy89iP43M/f31PXNLaRebA0IBRV6XBJx5LcdMx5EScR/Zk
         RigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
        fh=MnqAKwXdfjNEdPBfOoaVdXT4nM/pynHI/69KUCB42BQ=;
        b=EzSkv8gJzDqu0Cr/v1MGLm1KoIuU1uc2BO6bZxhOfT0/gjOaEprcLmHZGFmgWCMMh6
         E4Yl+XTYC3pydbLzbspq1m/lsmI3obxAQRzZY7XREt2zJ6oXiDjjiPmKC7JT3codn8aj
         GoQ3600FxynfPTIbBkiaaLzaAgP6spIgbqZCeiKf5iavqCzNl365pf/9HqQOfO3IfRsZ
         lFEHXtWs2h62Yz2G1bffPSAU5f8JhX2eRTsnRqKq9O4EGQSeQSBnzlQ4qfSxxOvUYrYO
         ubVLwuRT1zMFb8JnlMdUj2cPwK18bghs1hTT+5IbRx7NbBEVquDWXBD2jXZV3vHuJrbM
         EFQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794582383; x=1795187183; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
        b=SLSJnb9mmffTDKIpJMdavocCv7/dvjOJA2NelECFsPNbFeG+6Tu8I/CAEophFok8jp
         jkDHjwcoJqYutqe7SsYwo+fZj1ICZg/lpKvO5hXmpSf3a3X5nv821G2oDuHO/v99IWoJ
         yuhHCkEkz0y/P6T/Z3eYAlxsMhCbMXNVjuDYAnR+qk6FnkhIOV9lOidjz6IJOLwJ1dn/
         kog1+aLjqLGgihp+UGxTM+nln9hpvl+twSYPS3mXg3dsYR80btdB1808vUmPCrGDZ22X
         NJIgD1AsY3E5GkE+MPPKRGGkqaTiAsnRfCUkZSWky7bL8RwzEFd2Q0wNqv1yUlHz+J3t
         w7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582383; x=1795187183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckhtKtBkcI8bOjOr1kP05oR2A3mdkH6IC9LeZz9W0+o=;
        b=CmBvCICQ2/WZ+x5o11rcR42ggxFFzqpRi6pUYUHAqaeciEFnRcEOGVR89ng0HBPjI9
         WezHfBfGK3u+BERUKw3/FxOPid0hmguSjWj+r5TiTfeRMdfCK3lci17CkEhkHCi57kRn
         HF5t+9Dw6xIOg375hjxH4Qj/+OmSyny4H2/Vbl8XKSaE/I8jMo+v9flShuZVXWz3mbgb
         ZVs9D2aPN+DMMeiSkTPS0a3d5jg2456PaJLRRs18RUm7uqDdgFc3EsBnV0zI66cGUoa9
         oRlplnPjz/SPhNn6wBIzh1kqtxshvNIogr4bvnlanWHSRmdWnE3wYMw1qFw0ic7TdbLl
         vecw==
X-Forwarded-Encrypted: i=1; AL+hErGNyoVF38U5yl9get4l/wpvMkY1Z2ioEkiMO1nv/x8ICpPRBjQ4RC3v0DLaPqU/jotLNnQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZeAcr+LS6LpPB/39MDk+YJ0lY7sSJgggDgyFHki/6V9Q2nfLA
	ktUt5sPDvXsftV2JqQxRPJJ9+LCnhFqe6EY07qITxeHIQouRZ/0Q1VV1t2+PyRVHnap3SrcCGff
	5wfgO9riU3G1g1R0xDG63d84MODk87l+Li4ZsCBH80zpgGx/xC1ew4Szlry1VelgsLE+DB5Snvt
	+/iGwQE8zRn4IF4spccXMq+GN4xFTP/w==
X-Gm-Gg: AYBFou3y6gfHvtZj0zmI/T6P+AuaFWi1BXgVx6iatypf7qa+huE7x4GOzNotyND3g5g
	Sjdgfs05LolNfdSS9Ly0E97GACpQHW7Y2pS0nkpfu63l1svmwDKLESlb0ntNxo4EANKk8dgilfY
	wWcuBZG0gou1HWNBPJvfDVcVN7QNJah2ILn9WWzF/4fdrRMxpOH25Y/rJ8Oo0mxg6OqyhhGfKoT
	nIRvcq3a9CBAnNgt2HvtHcbnGdZGGGabRPCaZ0jisi11h6A6boweDCbFecr/lua9tKxnxruQPEQ
X-Received: by 2002:a05:6808:bc9:b0:53a:6769:c365 with SMTP id 5614622812f47-56e6328866cmr2333722b6e.12.1794582382791;
        Fri, 13 Nov 2026 07:06:22 -0800 (PST)
X-Received: by 2002:a05:6808:bc9:b0:53a:6769:c365 with SMTP id
 5614622812f47-56e6328866cmr2333678b6e.12.1794582382297; Fri, 13 Nov 2026
 07:06:22 -0800 (PST)
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
 <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com>
 <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
 <CAFEp6-2sLZkNQqDg7seE0ipZbuve_TZMjgNHV4ubW0Qs80Pyhg@mail.gmail.com> <CAJvTdKmGp6t44CP-smrjbm3aoXeTWvyUUM1Uv1w8UxEo3OSPJw@mail.gmail.com>
In-Reply-To: <CAJvTdKmGp6t44CP-smrjbm3aoXeTWvyUUM1Uv1w8UxEo3OSPJw@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:06:09 +0100
X-Gm-Features: AclHuK9bkZ5reHD91VpKpV7QwREy_Gm5RBl2twDjBGl-eypJtj0BwlEjdoR1eWg
Message-ID: <CAFEp6-3QnYgAwBbscorkXt=rROpt+iNv8R1=t-GdyDpHVL0q0Q@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix erroneous system suspend abort
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af7276f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=qTCYnKY_sxFd4FCAs5QA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: ydLZvPkbBAbVBIfoVRKFn61SYw-VxqfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX8ZWo569qi5ou
 ua50EWW/UEr+nwfNWQyXmEAnBLL6TKlFg3GmNet2plUstCEeApU7vqp8kJDBsxO1SDDaUgs5WD6
 RSHTSDlezluWGaReMH1a8OGl2BSakPo3oTI3uqNMYDLwZbUrqmJ+t7/5RAZQiQybq/HoOK9WxwC
 kBhLkfUSvTMYEofsCWxQZQ2WGh+nYlW93v4Q8sPyxBuYcUUV6QB3p/ddVKwUKXYeF0m6hTbryhT
 F23ZOi4swbNM5DkaBZhbe/X93102LYjoSEKhRdwOWIwBk/U8Cqo5SxQt4uUAi5Y+KaDlcJ7eqTq
 Q7gU/5vG1vYPXOOxhuIgJFYEx9fsFZYBS3eTIx8T+IMMCj9zwoCNqY7ffJuQA3KHrJ/2Ps3vSdT
 90Aaa0yC29/zXjfTJiIL6RM68k1DERY8soI5qpq3bxe3a7dXZC79ir+S3l43YrPbBNjk0Q6Jd3M
 RRpKpmrH1nHxMP6SxwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX/dRFco9qwuVV
 1cBYTGkRKR3xrzh1avjunQnhVDoDPiwcdC7a7J11VH6n2oBaYtcYMTA6Pqulx9FC3uG+KFtBHdY
 L8UWcxMGqzyTuNh3bGIFMZXz2jCknu0=
X-Proofpoint-GUID: ydLZvPkbBAbVBIfoVRKFn61SYw-VxqfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130060

On Fri, Nov 13, 2026 at 3:09=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> > > This 1-line fix should be applied NOW, without waiting for internal
> > > mhi internal or development.
> >
> > Fair enough, but would only ignoring error on -EBUSY would work for
> > you? as this is clearly something which is not relevant for system
> > wide suspend cases.
>
> Although I've seen only -EBUSY, I would turn that around...
> Are there ANY mhi suspend cases that merit aborting system wide suspend?
> If there are, then check for those and explicitly abort system suspension=
.
> (experience shows that these scenarios are quite rare, and it would
> be remarkable if there were such a condition here)

Taking a second look, it seems that we're not propagating the error
from MHI core in mhi_pci_runtime_suspend() and simply return always
-EBUSY instead, making it the only error that is reported anyway.

So your patch is fine as it stands as an immediate fix (along with the
comment). We can then work on a proper long-term solution separately.

>
> > Also would it be possible to add a small inline comment saying we
> > purposely ignore this because of buggy mhi suspend handling.
>
> I agree.  I'll add a comment to clarify.
>
> > With your patch what happens on the system resume path? is the MHI
> > device recovered?
>
> This laptop is generally quite a good suspend-resume regression test bed.
> It does actually have a wireless modem, but AFAIK, the device itself
> is always unused.
>
> $ lspci -nnk | grep -B 2 -A 3 -i mhi
> 08:00.0 Unassigned class [ff00]: Quectel Wireless Solutions Co., Ltd.
> Device [1eac:1007]
> Subsystem: Quectel Wireless Solutions Co., Ltd. Device [1eac:100c]
> Kernel driver in use: mhi-pci-generic
> Kernel modules: mhi_pci_generic
>
> I have over 28,000 suspend resume results on its local drive, dating
> back to Linux-7.2.
> The most recent 3,000 cycles included this one line patch and showed no i=
ssues.
> There were 9 suspend failures on a run of 2,500 suspend cycles run Nov
> 8 - Nov 9.

It would be worth including this result/info in the commit message.

> I've attached the mhi messages, as they'd wrap if I pasted them here.
>
> Twice we see this:
> mhi-pci-generic 0000:08:00.0: Unbalanced pm_runtime_enable!
>
> perhaps a hint?

Thanks, I will look at this.

Regards,
Loic
