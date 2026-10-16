Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156031F78E6
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180011; cv=pass; b=VmOoMD6JFdrrcJHKiQdBtDphhhYi2/yidPkTEpsmx8HgKk+rFy0Mo9PcRWxrsQ8CT9ZKeP6IudyDaYO0gCSoPCB8DKArDb4r3D2f/H+IBKjeG5kLQYm79qiF3m1dH/GHjMyYWPZf9O7+0jbs7wjwHPFkf5y8GqYlXtp2QLizLVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180011; c=relaxed/simple;
	bh=O8cy62w25lVRLQ2+87Qxso1BD9oGuEcVFUfjG4kL72s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHA2AjPwaY+11OcGtQTZwfHk8tbh9FrdJW9R+7ReSjavqc3EnCcnUKwpk6VBNWjGpWs796o4j0C6POVl6gxTy3qGwzNFF2c48ekGVYsH45SaJ+f2E9Qr72Np3iSgNo6anMCNZTM8P+wz1RiwVDCICkrgPJmKnvDgRVMFl3sWG2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2zMWSUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hE1CJUe0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2zMWSUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hE1CJUe0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeAkc3213022
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 19:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=; b=e2zMWSUcOWleOa2n
	j79pJlkXPs35DClARNUvq+3ZYiCyMLyeX8gS9qSzUSqbg2xHPzthQ581WM+nMAyv
	3wkTHJUtrzPiIgXv4tZ50WHzIS4K0ebntCICuN4iob0QKtApF1IgW5ET8Gid4zNc
	0RO4EIEWx0BACvUFaEOSoyX7oK6qCjVhTAUTK4O2PHEVNI/EzdifQ8AxOUPet0j1
	Ij/Mwj0z/UA5KReFNGQ5FvsaCLy2dF/2wDFVdCAqRAnAvRt6MmpdjbKrYPFhqeHe
	nP6Y0wt/q6qmsHqK74WIlSFlKZY0JU1lf9lG952eTNB2UACmf0Q1B5s7WQ2y6gQL
	62sGcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbrwmrap8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 19:46:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so40155685a.3
        for <mhi@lists.linux.dev>; Fri, 16 Oct 2026 12:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792180006; cv=none;
        d=google.com; s=arc-20260327;
        b=jjTCHoiON5d4xdXP3OfkFZSEe+XWbPwRnGxhxMNcLSj/zK0IToJGUmQtTUhq4bF6GM
         W4dQ/jR5ISMHNsa+8HiYMMECn+IHbpuB8Pq+sr8lS3cVGNJhVWVYDBli1AABXGuKArnW
         z8ucqZ4wE9L8TkU4Gg5fGyotLfa5kcia94QJ/8bzd8DIMLHPOK68LB9/W3tyl4aplH21
         i4jno/oT1peJPZGWUB7fXM7/WHj8JQj1HA4O+4otkNgopU6x3xJ4Wv/SOcR+Nsj90Ias
         0jOv2W0laHLO9i7BKM0CPIkypGhoVi29pyZEHX/HXB3lzAPky6jYlL3k1qoIrcHHvJXy
         ouYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=;
        fh=/wZmf/UzyagdUTwXs4xVkzTS1vQ0XcaWKjARKI4bi5o=;
        b=FuBXox+hpQQKg26OH3UMShk4qKesNMmBpO76KCAEAtXTH7qia/5VexZpk0grOLIgXF
         t8TGhVpYq9DHw10Tq8T8VIRiXtAIFQTpS1JM4YrU9+UYoKH/bS8MLGktUdO1f9vHxZE2
         lOXHNsgF4hSTiN3HPA+VeaIXV2z6vdR5VxQBDKKnctZgVAvzm5yhS/yoZzf7WkRJxAx+
         CSMVKZgoCe+1+11WIIlDBHsgVzKUDysPWgYQl9OaqxjbHm3ygNYd7XU73A1hOxKUtHl/
         0sVROT934InLt95YAy0CkVZJy2i8vEp4ltw9BoCjqHltvSWkFoZ1K3NPMdJ3dzfKTUB/
         8jOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792180006; x=1792784806; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=;
        b=hE1CJUe03nb6Z9Q66CzFLV4TMMXV10z3WGXExZTjk981fCygiGkv07koS2bxHVOZ47
         A8g8ZcapWjg2uxslloDp6AaWivmxe7ycoNTxbOn0c47OnrW0lLQTqgRKpWhQZcftDUN1
         ljnJPhTlEs9OYyh6HBQl73jXnMOWnIxfVkVAdiBE23iqLKD0K1pvzAKey3Sk7Ou7uu+u
         liFln9TozrfTcsfoKrqdg/OFuRPEY4D6XU6Wp0BzUEedE5gTdy79w2qMNENUD4j7lvoq
         3VIspTbhgGgzV8fqAug6xAYcUTWx125srgWium7n7wGiMpgqOnitdjOgbztJbazw0O41
         My/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180006; x=1792784806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+VxrDVNdVa6yFhA5w5ziLBUXWol4faVGP6JwE2bNX8=;
        b=gBmRLp6O5o5q4MG4WVnH3DBSigE/MeY/8sHC6voaa0DDVI5z6/1TsJt9pMrSVsnByd
         J4SS4NPLX3I3nwOtd6rPbPKKmfrZi68Fd9tVghp93P7dquWHQXpXK5mmryfV2CjXVeVa
         jF7FNA5W4fAtiqTyZQltR3rNDn7p0iBRSqEaFv2/1KegMMv62RatcBnsp0TECexSnKS1
         lSEhRXFUPwoJLUWwFV5Tf6byzp5vOW0FAbT3FwVE+nijlBdI/NU3NOy68itPELUhEAZW
         AHZ8AioW23UoH9ce/neYi6P0GO/pVep+QP58AOsnWh7SjwhLXZ0E/2BHpLvWL99AqyB9
         bOjg==
X-Forwarded-Encrypted: i=1; AKwUvBzSEQlIhQw1hP/gSiAMj5d4Tf7MGYHoX6mW7fpZjitS8amKUWRM3Xi3IXpfQigoDWX/+/8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLvFiv71LOXLVjbwRaKqSaY87O9q3iygGpGHKGPzl5SFrEHCou4
	BWGBsTxBWhOMvNM4SDxTEhnAc5bMjyTdq6ajVw8BSeCD85HDhzB9/Wdsq6BbZTgNoYCx7Z4rmSn
	iHxUGSTOmtxneT9bog13ip3EuhMw0NpHSpfOZLVHoVTaQ6HSsaeS9cUx9pZU/x95OJMC2KKa6qF
	pEFFhKaruvI/4sK4IjxkedyD5y0UQ9zw==
X-Gm-Gg: AYBFou1ZjGBnyWYx2EWBi/xwWx3REM0rhazCJpt9MeC7/Bmt7QDMYbERGqloWxEDfLu
	Wzkt9ADznZd7KK79a/SEsMMJyHK00sx6U8lq8WZFUJUiqVdRX6MlGMlQs+RnCm5ml+qKg7mSPoD
	X0uZuJo5FPgP56BPcnTXvoyN4JRTCmvQgzgdAmIG8hqMQTuf38RBZtD+UKzsjNbWgqIkizLkMK8
	zqeI11YOL8Zxk0QWEiTt63DlSzQBtLkp1piTZFTz7R/TjmIDlGfa/uDduLppoFYXIvyrKwlZZY=
X-Received: by 2002:a05:620a:1a28:b0:93f:94b:81ce with SMTP id af79cd13be357-93f29df9e9cmr154460685a.81.1792180005646;
        Fri, 16 Oct 2026 12:46:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:93f:94b:81ce with SMTP id
 af79cd13be357-93f29df9e9cmr154454685a.81.1792180004914; Fri, 16 Oct 2026
 12:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013183500.261229-1-peter.hunt@opengear.com> <20261013183500.261229-2-peter.hunt@opengear.com>
In-Reply-To: <20261013183500.261229-2-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 21:46:33 +0200
X-Gm-Features: AclHuK-CR9XEUZOvZ07wl9FWbZnEXYQmRoc2w77oysNymiE6oO9QzUKYzXBBsJY
Message-ID: <CAFEp6-2jxY3R3FWm9oWJNtJ3zLfRkEDZ3pxb=T8qNnNLorASiQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, Daniele Palmas <dnlplm@gmail.com>,
        johannes@sipsolutions.net, mani@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B4osQ+tM c=1 sm=1 tr=0 ts=6ad27f26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8
 a=qh7v8B4ApeZPtt9jo1oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfXxh7/hOiNQgKU
 KO1+fkr5EfrfAKsZyPrD1YnBaqC54YEB7wb6bwaSJgUjKJ2lcjvx+u/BYTdA+wT4zQw2TO4yu/K
 pQrlsGmw3+KOGFyX+1kLF8ZkE9oABX4w0w28CKsKCbFd3wfYLCv76EsPQS3No85gLVTEt8M/u4U
 nXLVG5BPOMavPmC922Oeb/8Y3bvpdA3954IXmgBHhPSEsohvenm9pZedwangGqnYpwm7BriXCzc
 WitLiIH+w5XQv/MnnktN+h7pD8p+gw9B/MzYWD5XvJHltWICtzU5b/lv+DnbAq2X0ZyMLbEmw4U
 hI8YOE9HGqB22lpEbbELS78zd1UJvsxBpDS1tYaa0Croa0dR8QdonJaGTpkBIjAi3m7jeUncxhk
 uf5JWc9agouLq/lzAQANefWRgmSXpEUdk94pWUEYyqvfWSau/8mhRZz98dPnSs3PlITCyL81SJg
 q9mybfTqPc+r9TO85uQ==
X-Proofpoint-ORIG-GUID: vP4e-kcYQc_ifYFhrt4cFGdqCAiLSDTS
X-Proofpoint-GUID: vP4e-kcYQc_ifYFhrt4cFGdqCAiLSDTS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3OCBTYWx0ZWRfX9Ilt1s/fnWe5
 /tzrekNEGl6f9+jICjKHRzSYrPYCNwTjbR8v3E0J6ZtEBOpriMeSi1tbJXXQZaz14C0ocieg2yE
 Csl93Mha22wY1IHI6fL3dxxcgBg0Tu8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160078

On Tue, Oct 13, 2026 at 8:37=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> The WWAN character device emulates the TTY modem-control ioctls
> (TIOCMGET/TIOCMSET/TIOCMBIC/TIOCMBIS) for AT and QCDM ports, but the
> result is only stored in port->at_data.mdmbits and never reaches the port
> driver. A driver therefore cannot act on the host raising or dropping
> DTR/RTS, even though some modems depend on it (e.g. they withhold
> unsolicited AT result codes until the host asserts DTR).
>
> Add an optional ->dtr_rts(port, mdmbits) operation to struct wwan_port_op=
s.
> Drivers that implement it receive the TIOCM output bitmask so they can
> assert or de-assert DTR and RTS independently. As in tty_tiocmset(), the
> wwan core keeps only the output bits (DTR, RTS, OUT1, OUT2, LOOP) of the
> TIOCMSET/TIOCMBIS/TIOCMBIC value in port->at_data.mdmbits, and calls
> ->dtr_rts when DTR or RTS actually changes, gated on WWAN_PORT_AT to matc=
h
> the open/close raise/drop behaviour.
>
> Also raise DTR/RTS in wwan_port_op_start on first open of an AT port
> when the driver implements ->dtr_rts, and drop them in wwan_port_op_stop
> on last close if HUPCL is set in the port's termios. This follows TTY
> open/close semantics, although the termios baud rate is not used, and
> means individual drivers do not need to implement this themselves. As on
> a TTY, HUPCL defaults to on for AT ports, and userspace can clear it
> with TCSETS to keep DTR asserted across close, for example so that
> closing the port does not end a call on a modem set to AT&D1/AT&D2.
> TCSETS and TCSETS2 now only commit the new termios when the copy from
> userspace succeeds, so a faulting call cannot silently clear HUPCL.
>
> ->dtr_rts must be called under ops_lock, which serialises port ops and
> protects against port removal (removal clears port->ops under it). So
> that updates to the TIOCM state and the ->dtr_rts calls are serialised
> together, the termios/TIOCM state now also lives under ops_lock and the
> separate data_lock is removed. The AT/QCDM ioctl handler only holds
> ops_lock while it reads or updates that state, never across a
> user-memory copy, and takes it interruptibly since a driver's blocking
> write holds it while it waits. Ioctls that do not touch that state, such
> as TCFLSH, TIOCEXCL and the FIONREAD fallback, do not take it.
>
> wwan_remove_port() also drops DTR/RTS before ->stop() when a port is
> removed while still open, regardless of HUPCL since the device is going
> away. The raise and drop paths go through two small helpers, which do
> the AT port and ->dtr_rts checks and pass the driver the resulting
> bitmask.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v10: Only hold ops_lock in the AT ioctl handler around the termios/TIOCM
>     state, with user copies done outside it, return -ERESTARTSYS when
>     interrupted, and leave ops_lock alone for ioctls that do not touch
>     that state. Word the TTY comparisons and the ->dtr_rts kernel-doc
>     more precisely (the baud rate is not used, removal only drops the
>     lines while the port is open, open only once ->start() has
>     succeeded). Both from the Sashiko review of v9, still using ops_lock
>     only as agreed with Loic Poulain
> v9: Raise DTR/RTS inside the existing first-open branch of
>     wwan_port_op_start(), and drop data_lock so the termios/TIOCM state
>     and ->dtr_rts calls are all serialised by ops_lock, taken
>     interruptibly in the ioctl handler (Loic Poulain). Mask
>     TIOCMSET/TIOCMBIS/TIOCMBIC to the output bits and only call
>     ->dtr_rts when DTR or RTS changes, commit TCSETS/TCSETS2 only on a
>     successful copy, and describe the calls in the ->dtr_rts kernel-doc
>     (Sashiko review of v7). Document in the ->dtr_rts kernel-doc why it
>     is AT-only (Loic Poulain, Daniele Palmas)
> v8: Add wwan_port_raise_dtr_rts() as the counterpart of
>     wwan_port_drop_dtr_rts() and move the open-path handling there, move
>     the AT port and ->dtr_rts checks into both helpers, use
>     scoped_guard() for data_lock (Loic Poulain)
> v7: Drop DTR/RTS on last close only if HUPCL is set, and default HUPCL on
>     for AT ports. Pass the masked mdmbits rather than 0 from
>     wwan_remove_port(), via a helper shared with the close path. Both
>     from the Sashiko review of v6
> v6: Rebase onto net-next. Snapshot mdmbits under data_lock before calling
>     ->dtr_rts from wwan_port_op_start()/wwan_port_op_stop(), rather than
>     reading it after data_lock has been released
> v5: Change ->dtr_rts signature from bool to unsigned int mdmbits so DTR
>     and RTS can be driven independently; re-read mdmbits inside ops_lock
>     in the ioctl path to close a concurrent-ioctl ordering race; add
>     de-assert call to wwan_remove_port() for the hot-unplug case; update
>     kernel-doc to note the op is AT-only and describe the mdmbits argumen=
t
> v4: Protect at_data.mdmbits in wwan_port_op_start/stop under data_lock;
>     release data_lock and acquire ops_lock with a NULL check before calli=
ng
>     ->dtr_rts from the ioctl path; gate ioctl ->dtr_rts on WWAN_PORT_AT t=
o
>     match open/close behaviour; reduce boolean to TIOCM_DTR only
> v3: Replace ->tiocmget/->tiocmset with ->dtr_rts(port, bool on) modelled
>     on tty_port_operations.dtr_rts; raise/drop DTR/RTS in
>     wwan_port_op_start/stop rather than in the driver (Loic Poulain)
> ---
>  drivers/net/wwan/wwan_core.c | 172 +++++++++++++++++++++++------------
>  include/linux/wwan.h         |   9 ++
>  2 files changed, 124 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index ffbcf11e4e68..7097b58dafde 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -25,6 +25,10 @@
>  #include <net/rtnetlink.h>
>  #include <uapi/linux/wwan.h>
>
> +/* Modem control bits userspace may set on an AT port, as for tty_tiocms=
et() */
> +#define WWAN_TIOCM_OUTPUTS     (TIOCM_DTR | TIOCM_RTS | TIOCM_OUT1 | \
> +                                TIOCM_OUT2 | TIOCM_LOOP)
> +
>  /* Maximum number of minors in use */
>  #define WWAN_MAX_MINORS                (1 << MINORBITS)
>
> @@ -73,11 +77,10 @@ struct wwan_device {
>   * @start_count: Port start counter
>   * @flags: Store port state and capabilities
>   * @ops: Pointer to WWAN port operations
> - * @ops_lock: Protect port ops
> + * @ops_lock: Protect port ops, and the AT/QCDM termios and TIOCM state
>   * @dev: Underlying device
>   * @rxq: Buffer inbound queue
>   * @waitqueue: The waitqueue for port fops (read/write/poll)
> - * @data_lock: Port specific data access serialization
>   * @headroom_len: SKB reserved headroom size
>   * @frag_len: Length to fragment packet
>   * @at_data: AT port specific data
> @@ -88,11 +91,10 @@ struct wwan_port {
>         unsigned int start_count;
>         unsigned long flags;
>         const struct wwan_port_ops *ops;
> -       struct mutex ops_lock; /* Serialize ops + protect against removal=
 */
> +       struct mutex ops_lock; /* Serialize ops + at_data, protect agains=
t removal */
>         struct device dev;
>         struct sk_buff_head rxq;
>         wait_queue_head_t waitqueue;
> -       struct mutex data_lock; /* Port specific data access serializatio=
n */
>         size_t headroom_len;
>         size_t frag_len;
>         union {
> @@ -374,7 +376,6 @@ static void wwan_port_destroy(struct device *dev)
>
>         if (dev->class =3D=3D &wwan_class)
>                 ida_free(&minors, MINOR(dev->devt));
> -       mutex_destroy(&port->data_lock);
>         mutex_destroy(&port->ops_lock);
>         kfree(port);
>  }
> @@ -653,7 +654,10 @@ struct wwan_port *wwan_create_port(struct device *pa=
rent,
>         mutex_init(&port->ops_lock);
>         skb_queue_head_init(&port->rxq);
>         init_waitqueue_head(&port->waitqueue);
> -       mutex_init(&port->data_lock);
> +
> +       /* AT ports default to HUPCL, so DTR/RTS are dropped on last clos=
e */
> +       if (type =3D=3D WWAN_PORT_AT)
> +               port->at_data.termios.c_cflag =3D HUPCL;
>
>         port->dev.parent =3D &wwandev->dev;
>         port->dev.type =3D &wwan_port_dev_type;
> @@ -679,12 +683,44 @@ struct wwan_port *wwan_create_port(struct device *p=
arent,
>  }
>  EXPORT_SYMBOL_GPL(wwan_create_port);
>
> +/* Raise DTR/RTS when an AT port is first opened, as a TTY does on open.
> + * Unlike a TTY the termios baud rate is not used. Called with ops_lock =
held.
> + */
> +static void wwan_port_raise_dtr_rts(struct wwan_port *port)
> +{
> +       lockdep_assert_held(&port->ops_lock);
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +
> +       port->at_data.mdmbits |=3D TIOCM_DTR | TIOCM_RTS;
> +       port->ops->dtr_rts(port, port->at_data.mdmbits);
> +}
> +
> +/* Drop DTR/RTS on an AT port. Called with ops_lock held. On last close
> + * the lines are only dropped if HUPCL is set, as for a TTY. When a port=
 is
> + * removed while still open they are always dropped.
> + */
> +static void wwan_port_drop_dtr_rts(struct wwan_port *port, bool hupcl_on=
ly)
> +{
> +       lockdep_assert_held(&port->ops_lock);
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +       if (hupcl_only && !(port->at_data.termios.c_cflag & HUPCL))
> +               return;
> +
> +       port->at_data.mdmbits &=3D ~(TIOCM_DTR | TIOCM_RTS);
> +       port->ops->dtr_rts(port, port->at_data.mdmbits);
> +}
> +
>  void wwan_remove_port(struct wwan_port *port)
>  {
>         struct wwan_device *wwandev =3D to_wwan_dev(port->dev.parent);
>
>         mutex_lock(&port->ops_lock);
>         if (port->start_count) {
> +               wwan_port_drop_dtr_rts(port, false);
>                 port->ops->stop(port);
>                 port->start_count =3D 0;
>         }
> @@ -756,8 +792,11 @@ static int wwan_port_op_start(struct wwan_port *port=
)
>         }
>
>         /* If port is already started, don't start again */
> -       if (!port->start_count)
> +       if (!port->start_count) {
>                 ret =3D port->ops->start(port);
> +               if (!ret)
> +                       wwan_port_raise_dtr_rts(port);
> +       }
>
>         if (!ret)
>                 port->start_count++;
> @@ -773,8 +812,10 @@ static void wwan_port_op_stop(struct wwan_port *port=
)
>         mutex_lock(&port->ops_lock);
>         port->start_count--;
>         if (!port->start_count) {
> -               if (port->ops)
> +               if (port->ops) {
> +                       wwan_port_drop_dtr_rts(port, true);
>                         port->ops->stop(port);
> +               }
>                 skb_queue_purge(&port->rxq);
>                 clear_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
>         }
> @@ -976,92 +1017,109 @@ static __poll_t wwan_port_fops_poll(struct file *=
filp, poll_table *wait)
>  }
>
>  /* Implements minimalistic stub terminal IOCTLs support */
> -static long wwan_port_fops_at_ioctl(struct wwan_port *port, unsigned int=
 cmd,
> -                                   unsigned long arg)
> +/* TCGETS/TCSETS and their termios2 variants. @size is the size of the u=
ser
> + * structure, a prefix of struct ktermios. As for the TIOCM ioctls, user
> + * memory is only accessed outside ops_lock.
> + */
> +static long wwan_port_termios_ioctl(struct wwan_port *port, bool set,
> +                                   void __user *uarg, size_t size)
>  {
> -       int ret =3D 0;
> +       struct ktermios termios;
>
> -       mutex_lock(&port->data_lock);
> +       if (!set) {
> +               scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port-=
>ops_lock)
> +                       termios =3D port->at_data.termios;
> +               return copy_to_user(uarg, &termios, size) ? -EFAULT : 0;
> +       }
> +
> +       /* Commit only on success, a partial copy must not clear HUPCL */
> +       if (copy_from_user(&termios, uarg, size))
> +               return -EFAULT;
> +       scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->ops_loc=
k)
> +               memcpy(&port->at_data.termios, &termios, size);
> +       return 0;
> +}
>
> +static long wwan_port_fops_at_ioctl(struct wwan_port *port, unsigned int=
 cmd,
> +                                   unsigned long arg)
> +{
> +       /* ops_lock serialises the termios/TIOCM state with port ops and
> +        * removal. It is only held while that state is read or updated, =
never
> +        * across a user copy, and is taken interruptibly as a blocking w=
rite
> +        * holds it too.
> +        */
>         switch (cmd) {
>         case TCFLSH:
> -               break;
> +               return 0;
>
>         case TCGETS:
> -               if (copy_to_user((void __user *)arg, &port->at_data.termi=
os,
> -                                sizeof(struct termios)))
> -                       ret =3D -EFAULT;
> -               break;
> -
>         case TCSETS:
>         case TCSETSW:
>         case TCSETSF:
> -               if (copy_from_user(&port->at_data.termios, (void __user *=
)arg,
> -                                  sizeof(struct termios)))
> -                       ret =3D -EFAULT;
> -               break;
> +               return wwan_port_termios_ioctl(port, cmd !=3D TCGETS,
> +                                              (void __user *)arg,
> +                                              sizeof(struct termios));
>
>  #ifdef TCGETS2
>         case TCGETS2:
> -               if (copy_to_user((void __user *)arg, &port->at_data.termi=
os,
> -                                sizeof(struct termios2)))
> -                       ret =3D -EFAULT;
> -               break;
> -
>         case TCSETS2:
>         case TCSETSW2:
>         case TCSETSF2:
> -               if (copy_from_user(&port->at_data.termios, (void __user *=
)arg,
> -                                  sizeof(struct termios2)))
> -                       ret =3D -EFAULT;
> -               break;
> +               return wwan_port_termios_ioctl(port, cmd !=3D TCGETS2,
> +                                              (void __user *)arg,
> +                                              sizeof(struct termios2));
>  #endif
>
> -       case TIOCMGET:
> -               ret =3D put_user(port->at_data.mdmbits, (int __user *)arg=
);
> -               break;
> +       case TIOCMGET: {
> +               int mdmbits;
> +
> +               scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port-=
>ops_lock)
> +                       mdmbits =3D port->at_data.mdmbits;
> +               return put_user(mdmbits, (int __user *)arg);
> +       }
>
>         case TIOCMSET:
>         case TIOCMBIC:
>         case TIOCMBIS: {
>                 int mdmbits;
>
> -               if (copy_from_user(&mdmbits, (int __user *)arg, sizeof(in=
t))) {
> -                       ret =3D -EFAULT;
> -                       break;
> +               if (get_user(mdmbits, (int __user *)arg))
> +                       return -EFAULT;
> +               mdmbits &=3D WWAN_TIOCM_OUTPUTS;
> +
> +               scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port-=
>ops_lock) {
> +                       int old =3D port->at_data.mdmbits;
> +
> +                       if (cmd =3D=3D TIOCMBIC)
> +                               port->at_data.mdmbits &=3D ~mdmbits;
> +                       else if (cmd =3D=3D TIOCMBIS)
> +                               port->at_data.mdmbits |=3D mdmbits;
> +                       else
> +                               port->at_data.mdmbits =3D mdmbits;
> +                       /* Only signal the driver when DTR or RTS actuall=
y changes */
> +                       if (port->type =3D=3D WWAN_PORT_AT && port->ops &=
&
> +                           port->ops->dtr_rts &&
> +                           (old ^ port->at_data.mdmbits) & (TIOCM_DTR | =
TIOCM_RTS))
> +                               port->ops->dtr_rts(port, port->at_data.md=
mbits);
>                 }
> -               if (cmd =3D=3D TIOCMBIC)
> -                       port->at_data.mdmbits &=3D ~mdmbits;
> -               else if (cmd =3D=3D TIOCMBIS)
> -                       port->at_data.mdmbits |=3D mdmbits;
> -               else
> -                       port->at_data.mdmbits =3D mdmbits;
> -               break;
> +               return 0;
>         }
>
>         case TIOCEXCL:
>                 set_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
> -               break;
> +               return 0;
>
>         case TIOCNXCL:
>                 clear_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
> -               break;
> +               return 0;
>
>         case TIOCGEXCL:
> -       {
> -               int excl =3D test_bit(WWAN_PORT_EXCLUSIVE, &port->flags);
> -
> -               ret =3D put_user(excl, (int __user *)arg);
> -               break;
> -       }
> +               return put_user(test_bit(WWAN_PORT_EXCLUSIVE, &port->flag=
s),
> +                               (int __user *)arg);
>
>         default:
> -               ret =3D -ENOIOCTLCMD;
> +               return -ENOIOCTLCMD;
>         }
> -
> -       mutex_unlock(&port->data_lock);
> -
> -       return ret;
>  }
>
>  static long wwan_port_fops_ioctl(struct file *filp, unsigned int cmd,
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 1e0e2cb53579..23a8a8ee473d 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -57,6 +57,14 @@ struct wwan_port;
>   * @tx_blocking: Optional blocking routine that sends WWAN port protocol=
 data
>   *               to the device.
>   * @tx_poll: Optional routine that sets additional TX poll flags.
> + * @dtr_rts: Optional routine that updates the modem control lines to ma=
tch
> + *           @mdmbits, the TIOCM_* output bits (DTR, RTS, OUT1, OUT2, LO=
OP)
> + *           currently set for the port. Called when the port is first o=
pened
> + *           and ->start() has succeeded, on last close if HUPCL is set,=
 when
> + *           the port is removed while still open, and when TIOCMSET, TI=
OCMBIS
> + *           or TIOCMBIC changes DTR or RTS. Only called for WWAN_PORT_A=
T ports,
> + *           as only the AT (DUN) port carries the modem's virtual RS-23=
2
> + *           control signals.
>   *
>   * The wwan_port_ops structure contains a list of low-level operations
>   * that control a WWAN port device. All functions are mandatory unless s=
pecified.
> @@ -70,6 +78,7 @@ struct wwan_port_ops {
>         int (*tx_blocking)(struct wwan_port *port, struct sk_buff *skb);
>         __poll_t (*tx_poll)(struct wwan_port *port, struct file *filp,
>                             poll_table *wait);
> +       void (*dtr_rts)(struct wwan_port *port, unsigned int mdmbits);
>  };
>
>  /** struct wwan_port_caps - The WWAN port capbilities
> --
> 2.43.0
>
