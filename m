Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194024B26F6
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472807; cv=pass; b=sP/BsZXj/BmMp6eV/dORAMtaO+36ZslzV68n0DxI3L35OCoUWWDRiVtcFF4bK+pqoS4lCOt0bkg5nLJEzqKWgLYGNUBgoftW3oex/P4r8Qjde2Ar79bIdyAjZ5EfCjlAXFOAfo8MdQdVBbuGnxsL9gOoc6MKt1Y0DGx+Wu5PH44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472807; c=relaxed/simple;
	bh=Mtp5bsaUmX/s+WnZtwrAzzfDrBqtRRb5bfY+/bnQkEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPIjWzV7W5LRzLCzP63WISaohk609UgIdZVpPrXoklfrFYtsFFRKUC9vC/2vuyCgIb8F5k7b7ofoRR1w3skqQOIrsSgKht6aLdhb0gC/JyVJFgYvWuHv+pDNIjU1hQ+JGZUCd96R51d4Cdpb6EMRch3Ar9kUpJziN4jGEdSjFus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fs+5CIuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4lWgtMj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fs+5CIuL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4lWgtMj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVNdI3121363
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 15:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=; b=fs+5CIuLFcpDjBzR
	at7VKHOxnae6JNHFqwD5XCNkJK7k72fyz7iYFNVpbSzZnKRkZw1iJMG+Yk/OEsNZ
	JusLXG/w5fQvrDfmW5xef1Cqf+zQmNAn+nzaH0Ezxj46mWENKiSQvBvg8ieJd+YZ
	8k+Pj1Quvgp3xTThwa0Mbw5vITg5VdzW1BoS3h1Y3tPsO91AUiKeXV837Q3BOpxI
	8fVCDHWrrehFgx03nm8/PsFV4lfywEZdNOb3MQCyna/a8meaVF4p0gl5el6DoDgY
	/N7XhXWpUIaLV+OdwRsirlE54/hzZb98jjVnk8kYQ3aX/+fyQyiBYNF2Edlz/GE4
	MiAhAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2ukvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 15:20:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91256a7b7b3so91773746d6.2
        for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 08:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791472800; cv=none;
        d=google.com; s=arc-20260327;
        b=Y49tRtqOZWJnOXyzon2hA/OVnxO67+l5YYa4M6U+zS6M1pyuZwALTFTUxf6k39mw+Z
         gN/lXLohyRP+9wV9XCAZbZaFTSIqubv2MM2uj11ANlMDK+sB+Hv46D2ERijUxSMdiFCH
         V4zr/tM+LJZ/ZBlXruReYoeI9h9KPk76QJIrSCKkOlwNo7+4H4+h9G2PTmvHh/vkkfrz
         JOV4GjV6LZFHxMzGQa6XndOq0rJlAkKW9FwIAABuvhKC2F0mtPGvHlZQH/lA+LCte1d3
         6Th05C9WcaCvsKuS0k4KTQ1grHxJYwo2koe9xPzecXNK8g7BoBT8WOn80CVvsJC/uxBy
         USAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=;
        fh=CwPP36kPkMkCMxw1ser52MLhOysPzADPIfxpT3vfZdE=;
        b=KWEjqVQan/wQCgn9MypD2O8jxkzNf2pJJWTAxgyUkEd9GfBfgTgk07s6FsPVL7zzjF
         YFqCChICgISIXKXUstHY01GAemsWUBuTCZ4tGgis5bSDUpXfLpX80FZxcZRR4b4DQJa2
         eRcMEjJTWOPb+3iGuatbYNb/Lpf9jHTe84iSnHVohRJjfiGYfeU16Ru3cYepR0I8MdUt
         qAPaSQ+Ieg+IPfKGjOE2t89V1qgKFMDOXlqZGktMmb0T2qKB3R7nUqh5MehHGKzOfbmJ
         g4lMgo/0xNKpFXFQkYjJ/6TChKONUqZ4UQ49xHqkZBbhZDQjPdcsVYSRU2j7g4Veerfo
         mAlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791472800; x=1792077600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=;
        b=G4lWgtMjh9U/c7D2KVKWBkTTM60wzpuddVYgcq5KaUxxkwSLiN14eMFUmK/OTolvNK
         3Ugwh04T0Fdj7bj6H58RHbDS7+UF7R2Fvudx8lCuqCpGRvcn4QtdLb8FVvEX4v45HkxJ
         /6kh5mXlYK7sKCQi9WvVAtV7erq43TiLXKNoQ4SK3V8jO2ck6KQNSz8kjO6UtZEKy/oe
         8ufIws/3chUHl1bvd+68o0SfBi9wL33H8WoVtef8nWqDt2bjdNf5uWoWPWHjM9X6FFNF
         qlyj2grmPGBm+ExUJlZi7Tfm0sp17WVgUpjyT0Z5S3TzQFpBgwS3oz/gsC0VHvcNDsg0
         pV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472800; x=1792077600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xO6HRIbaR779RI13y+o0Nr/9NK+qGmYcAQOWWtcfvJ4=;
        b=PNoIMCsTF3TOB0I7TNSwfBOA6XNb9jkGT8Qt6CTPUbxOItef658GBuAzFoftRrdy2l
         tvssvNzzTci0MhSAHRbL8JO1k2E8Ck52y4SrZouyCXNy5hOZbrTVc7tV+lyEV0TQoCM4
         ArhCx59du0GZcdr7ZecO7DLrPSt7TcQyrQvNjjaO4XBw6n6WzFnJmYLMkzyGoqmLgdCT
         vPn7wizUgMFnH/eP3RFQQ8Fa1HhQA2rEXHeoHxdVt4Z5YNNCCDa4t1JKWGHFbgsrjHgt
         hyVvGiXvzjJ9PTTwftpnLPI0cA7dhjiA8o5PNUyx/oct7AHG+PqsVBYEMm0LkeTFAc0g
         yb1A==
X-Forwarded-Encrypted: i=1; AKwUvBwA1YtjixgOB46KWEFizb1tLaZl5TdjapztYZscOs6RJGlepperm5UY3RK0H9nYWXlssmk=@lists.linux.dev
X-Gm-Message-State: AFuF++lMwowjmmiGxG5rRWR1PNbDVmKxn5qhMIUlDfqJ59UXmOYhAKjn
	Hv//tJbGI/ndrPJ4MdeyM2QxkKBzZRV1a+7k4WDSSL48c9ycC/VvepDb6TSm7C7s9aVGjDOPyna
	BovxqHWZn9GgVFGs044UQLS9NTNWwzK68ldH7ufW2N1deGsrq30xhMd5iXNg3bT0lW+NP5KmJZ8
	b/pOyXl9t5uoezvDiQl7sAlu3JW/LGUg==
X-Gm-Gg: AYBFou0BnJCNiUhdLxHY1/i2m+pyGcH12P7sDXV9ZQ1b/NOzX67Mdtg+KMx1hHfeXph
	/0G67g/+4KwfsvVs0PyPT79L/DuWDN2LVePzUmlLUuigWQhEn5nI8m0i6mo7ydUTzgWmutVfFRc
	twB+oC3s4Gngjg8fLjAms7KxINddWcOLtYJOa9Jsm1KppVUrfw3DUaZtOY7lNWuORaxbCaQ2Hyy
	l3j0IJTAhGrL5/dBMBMV1UJ3Fnfr33wj+LPpXDPk//9IWdJZ9Lo2o0X+0JV4B3Aw7fjLIemdr8=
X-Received: by 2002:a05:6214:5d13:b0:912:488d:33ac with SMTP id 6a1803df08f44-919979319efmr107076086d6.17.1791472799510;
        Thu, 08 Oct 2026 08:19:59 -0700 (PDT)
X-Received: by 2002:a05:6214:5d13:b0:912:488d:33ac with SMTP id
 6a1803df08f44-919979319efmr107075616d6.17.1791472798756; Thu, 08 Oct 2026
 08:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007182238.1154851-1-peter.hunt@opengear.com> <20261007182238.1154851-2-peter.hunt@opengear.com>
In-Reply-To: <20261007182238.1154851-2-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:19:45 +0200
X-Gm-Features: AclHuK93Uq-IFjmeH-9lFHtazJbB-UGdgh5WgvVUomru_SE4CNqvEhX_yndO9b8
Message-ID: <CAFEp6-2QsKyZfEdSotVPhxVNOyRzncUphqLY5cRwHXGJiEbzuA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: wwan: core: propagate modem control
 signals to port drivers
To: Peter Hunt <peter.hunt@opengear.com>
Cc: ryazanov.s.a@gmail.com, johannes@sipsolutions.net, mani@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac7b4a0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=t2vznHeBAAAA:8 a=yR1rUuH2P9_sZCukppcA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-GUID: v3vv-8uSVbAAAyNfGryt5djpsnrQo5D8
X-Proofpoint-ORIG-GUID: v3vv-8uSVbAAAyNfGryt5djpsnrQo5D8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2MSBTYWx0ZWRfX50UJYw7jufTO
 vH8X+2ujptsAWC3RwrgKLyKJB1/n0+jeYAeAZ4wF9jf3UmWinF/TGcUfLlbai3HZXQiL96MLZlu
 rzKCHlQpwbvPQ0klFLY+lXz1UMMUrwg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2MSBTYWx0ZWRfX6iEMxJ6jcj52
 VFWTV3hPCdY8Cps4mEykizjSCvrPBtDvK0tUWAOzCNfKxZlkns2Le1bMnZukyFcvI7SKE2kMiAD
 ADXeEhvaa+cbqAFzzS6+de0Qefg2iInypqEfViyPMok7nyVE6uRA7cyUwEQoTM2pxeQ6PosviXx
 W9Kc+PqcFurFyPl35dB/oSbEWChwAMOc9Ps4gOnZwy1YVEjN5OGdHmL5CbI9g8EOh1EZo3lJ8sS
 ZVm89NPWDwGDVHDt0vTMMXoe1w9fjn5tEuta//UFqwynw+Mxo7YmFqt6MPbLVCikBNryfa4Z5Rn
 Nr4G52pzTs3roVV1O+h3BpxQgEvLmax5TesZN225CzcNgLDzBc5KF1NNCCJJYAlZr/qr/kQaMup
 RiPQWPFdTSwNk8cva0aW/NGFndPNdODtt2wuqBDjitZqW0UzM/1ifId5rWn1REYaKinoudfe17U
 RKBEzz3CzU8oYiJnMLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080061

Hi Peter,

On Wed, Oct 7, 2026 at 8:23=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com>=
 wrote:
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
> Drivers that implement it receive the full TIOCM bitmask so they can asse=
rt
> or de-assert DTR and RTS independently. The wwan core tracks the full TIO=
CM
> bitmask in port->at_data.mdmbits and calls ->dtr_rts when it changes, gat=
ed
> on WWAN_PORT_AT to match the open/close raise/drop behaviour.
>
> Also raise DTR/RTS in wwan_port_op_start on first open of an AT port when
> the driver implements ->dtr_rts, and drop them in wwan_port_op_stop on
> last close if HUPCL is set in the port's termios. This mirrors TTY
> semantics and means individual drivers do not need to implement this
> themselves. As on a TTY, HUPCL defaults to on for AT ports, and userspace
> can clear it with TCSETS to keep DTR asserted across close, for example s=
o
> that closing the port does not end a call on a modem set to AT&D1/AT&D2.
>
> at_data.mdmbits is protected by data_lock. In the ioctl path the ->dtr_rt=
s
> call is deferred until ops_lock is held, where mdmbits is re-read under
> data_lock, so the value passed to the driver always reflects the committe=
d
> bitmask under ops_lock and is serialised against concurrent ioctls and
> against port removal (which nulls port->ops under ops_lock).
>
> wwan_remove_port() also drops DTR/RTS before ->stop() when a port is
> removed while still open, regardless of HUPCL since the device is going
> away. The raise and drop paths go through two small helpers, which do
> the AT port and ->dtr_rts checks and pass the driver the resulting
> bitmask.
>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>
> ---
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
>  drivers/net/wwan/wwan_core.c | 69 ++++++++++++++++++++++++++++++++++--
>  include/linux/wwan.h         |  3 ++
>  2 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index ffbcf11e4e68..4206649d4b45 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -655,6 +655,10 @@ struct wwan_port *wwan_create_port(struct device *pa=
rent,
>         init_waitqueue_head(&port->waitqueue);
>         mutex_init(&port->data_lock);
>
> +       /* AT ports hang up on last close by default, as a TTY does */
> +       if (type =3D=3D WWAN_PORT_AT)
> +               port->at_data.termios.c_cflag =3D HUPCL;
> +
>         port->dev.parent =3D &wwandev->dev;
>         port->dev.type =3D &wwan_port_dev_type;
>         dev_set_drvdata(&port->dev, drvdata);
> @@ -679,12 +683,52 @@ struct wwan_port *wwan_create_port(struct device *p=
arent,
>  }
>  EXPORT_SYMBOL_GPL(wwan_create_port);
>
> +/* Raise DTR/RTS on first open of an AT port, as a TTY does. Called with
> + * ops_lock held.
> + */
> +static void wwan_port_raise_dtr_rts(struct wwan_port *port)
> +{
> +       unsigned int bits;
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +
> +       scoped_guard(mutex, &port->data_lock) {
> +               port->at_data.mdmbits |=3D TIOCM_DTR | TIOCM_RTS;
> +               bits =3D port->at_data.mdmbits;
> +       }
> +
> +       port->ops->dtr_rts(port, bits);
> +}
> +
> +/* Drop DTR/RTS on an AT port. Called with ops_lock held. On last close
> + * the lines are only dropped if HUPCL is set, as for a TTY, on port
> + * removal they are always dropped.
> + */
> +static void wwan_port_drop_dtr_rts(struct wwan_port *port, bool hupcl_on=
ly)
> +{
> +       unsigned int bits;
> +
> +       if (port->type !=3D WWAN_PORT_AT || !port->ops->dtr_rts)
> +               return;
> +
> +       scoped_guard(mutex, &port->data_lock) {
> +               if (hupcl_only && !(port->at_data.termios.c_cflag & HUPCL=
))
> +                       return;
> +               port->at_data.mdmbits &=3D ~(TIOCM_DTR | TIOCM_RTS);
> +               bits =3D port->at_data.mdmbits;
> +       }
> +
> +       port->ops->dtr_rts(port, bits);
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
> @@ -759,8 +803,11 @@ static int wwan_port_op_start(struct wwan_port *port=
)
>         if (!port->start_count)
>                 ret =3D port->ops->start(port);
>
> -       if (!ret)
> +       if (!ret) {
>                 port->start_count++;
> +               if (port->start_count =3D=3D 1)

You basically have the same check above
> +                       wwan_port_raise_dtr_rts(port);
> +       }
>
>  out_unlock:
>         mutex_unlock(&port->ops_lock);
> @@ -773,8 +820,10 @@ static void wwan_port_op_stop(struct wwan_port *port=
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
> @@ -980,6 +1029,7 @@ static long wwan_port_fops_at_ioctl(struct wwan_port=
 *port, unsigned int cmd,
>                                     unsigned long arg)
>  {
>         int ret =3D 0;
> +       bool call_dtr_rts =3D false;
>
>         mutex_lock(&port->data_lock);
>
> @@ -1036,6 +1086,8 @@ static long wwan_port_fops_at_ioctl(struct wwan_por=
t *port, unsigned int cmd,
>                         port->at_data.mdmbits |=3D mdmbits;
>                 else
>                         port->at_data.mdmbits =3D mdmbits;
> +               if (port->type =3D=3D WWAN_PORT_AT)
> +                       call_dtr_rts =3D true;

Any reason not to just call dtr_rts() whenever the callback is implemented?

>                 break;
>         }
>
> @@ -1061,6 +1113,19 @@ static long wwan_port_fops_at_ioctl(struct wwan_po=
rt *port, unsigned int cmd,
>
>         mutex_unlock(&port->data_lock);
>
> +       if (call_dtr_rts) {
> +               unsigned int bits;
> +
> +               mutex_lock(&port->ops_lock);

So now we end up with two mutexes essentially protecting the same
state. Since dtr_rts() is always called under ops_lock, and the ioctl
path acquires both ops_lock and data_lock, would it make sense to drop
data_lock altogether and rely solely on ops_lock? That would also
allow the ioctl handling to be fully covered by guarded ops_lock
mutex, simplifying the locking scheme.

> +               if (port->ops && port->ops->dtr_rts) {
> +                       mutex_lock(&port->data_lock);
> +                       bits =3D port->at_data.mdmbits;
> +                       mutex_unlock(&port->data_lock);
> +                       port->ops->dtr_rts(port, bits);
> +               }
> +               mutex_unlock(&port->ops_lock);
> +       }
> +
>         return ret;
>  }
>
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 1e0e2cb53579..57406139304e 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -57,6 +57,8 @@ struct wwan_port;
>   * @tx_blocking: Optional blocking routine that sends WWAN port protocol=
 data
>   *               to the device.
>   * @tx_poll: Optional routine that sets additional TX poll flags.
> + * @dtr_rts: Optional routine that updates the modem control lines to ma=
tch
> + *           @mdmbits (a TIOCM_* bitmask). Only called for WWAN_PORT_AT =
ports.
>   *
>   * The wwan_port_ops structure contains a list of low-level operations
>   * that control a WWAN port device. All functions are mandatory unless s=
pecified.
> @@ -70,6 +72,7 @@ struct wwan_port_ops {
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
