Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC702980A1
	for <mhi@lists.linux.dev>; Thu, 15 May 2025 09:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747301949; cv=none; b=uvqJNSSp6pcmh1619E3sDPNbw+yRSHZVV/dPRuUrLE8o1yzX57WCiaiLLg82/Y7XtulHWrYsVt+1At+ZrQmhXd+Vld/qrx5xC/Uw1pi+DYDECf8SKxQc2gV3sRwjseqEJUaNHAZKMvic3qrBNIQNUHj2knVDNdH6iSWre8TzIwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747301949; c=relaxed/simple;
	bh=9ejqJdAfRQgrUf9I1IYQ+fYB+UCPA4s+oqy2FZnf1gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnQIc/YkShVVmV0rqoxlvU9yUihxPZTEbA7u6HYQp4gCt2tmZggzSeThMtJQ2WPPr7N7KYMP85ljqGrx7pJ1Lyfg+IW9n5B/kvVGBFE3olqm0tBj2yeAu9rxi/W7da7I9NNZ89M6bl+6GlSselHvFXwUsGLa3VtuY8UuygM6NkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1ohjsAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1ohjsAJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F975W9002615
	for <mhi@lists.linux.dev>; Thu, 15 May 2025 09:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bL9+c2xXU5k5XoAxcTRicJ96o6n46XiZLKCVzMJ4Od4=; b=D1ohjsAJx7vnpRqQ
	nGtnDlFfvcIfk6C/3pGEO21BzjJSfKyVo6zgi1coRu3y2gJFEn76Hl6k5V/Y+Qbn
	XXOlj8k58IvLrA5g0syv3b0LjqPxhCB2jAkWsw1K4L9UiJceBiv81aP7M7YdbcDn
	7kv7nNS5w1Q+zaRzFp55JRrtv/RxN/SOs5AP1k6SZssSMblF3tKybnq6iBgBZ8kz
	lmLOAStyNJBaYAUctQV1wST952ZzCMeek7cJHkZP7RtH1JPXMHBfw2uhB/OjZPc7
	Y+9J0Crvf5TQdZA547FWi/Ri7DBagpgJ54ArULHIXouf9/m7wdYst1Q2zearaqaa
	HF5RhQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex5pe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 15 May 2025 09:39:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso123848185a.1
        for <mhi@lists.linux.dev>; Thu, 15 May 2025 02:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301945; x=1747906745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL9+c2xXU5k5XoAxcTRicJ96o6n46XiZLKCVzMJ4Od4=;
        b=xPBeDVfP8YFkBGmLuOKofoD9kgZzhrI+8gRVpVHn+9RkU67lmxGiWxDobulW+ODlVz
         5wwHfdVlKr8pNAYU4ugAn5KB7GepMKCoHzowaiZLjsIv5nfGJ1+RKnpCaEm/VQwjIFsj
         4F0GkVFYLMBXWzBQuyD6kDgLujqMTP0Fxew9pn+pe9OKm9hvFZ8w1MAJ0yCVh8c6QcwU
         J4KQvylJ+h0K4PKrZ7aT7ZRzpjx33TbOk4u5I4mZ0ZwOHQe1+lYGsqG7U8qH5rKfnAbB
         n6UiV1oIvQf27HUx9zwhTRrK0t01od8Ulad5ArY2bfdKp6kbiGvVanpmUs9q2poU+NjW
         4xlw==
X-Forwarded-Encrypted: i=1; AJvYcCVHkz9Lnd4zcG06mI4QBFRePkbRXiBCxXbp46/pCBgQ4ssd/UZh4UXg27ZK189xkUPBjmU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGWUfhP3GssHbj/QL9S6gWwXR7QAGxMARxR7w671wFaYE0MQ/Z
	4q4rT895lX7+UcvbvvDHFzZ106SLsb0cYMlMbvYdHJk8aS4eMmoq/6qqm/oncjDCpUy2WLSVMdY
	tUHutBve0SSxWGSC2Ib6CYsy7fM1Uuf4hHSfS++6ERY0urv9O7G9abg1Otl73pm06V7nBdndT8m
	ZHU0KyR7/OWdO7wogeAPutuHQEF0MHH56J3BCd
X-Gm-Gg: ASbGnctxMyGMqwvL53dj1A473smr2rqLHWsJEnafLUKEhC4zCwHZQzDztD4ndkSR/PJ
	MrOjOXnilnwBpbGy0okIGSDLASMfqngyyfbq/+tsFXTcTVst41Xjiehbud8yh/5LOgK+XaQ==
X-Received: by 2002:a05:620a:1a82:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7cd287095c1mr905368785a.0.1747301945422;
        Thu, 15 May 2025 02:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyV62VENdLqtRSifrIKA6KP6Y3yTlks4d5BUqQHnKQG6N7iNSmmL8F8/t3ZkGxdMz6pGca1xp710WlixBqn6M=
X-Received: by 2002:ad4:5c4a:0:b0:6e8:9dfa:d932 with SMTP id
 6a1803df08f44-6f896e43ddemr99261156d6.15.1747301934332; Thu, 15 May 2025
 02:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515092523.1724845-1-alexander.wilhelm@westermo.com>
In-Reply-To: <20250515092523.1724845-1-alexander.wilhelm@westermo.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 15 May 2025 11:38:43 +0200
X-Gm-Features: AX0GCFsOZFI3I3BpJIcmBKNgB5jKB8lh3ycdGBJIaVElQBON7ejoXw8NyllxZxo
Message-ID: <CAFEp6-3-25sRUvPbeX0oH1pVyRt49gvdVw5eMi1_azzPdYUjDw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: fix endianness of BHI vector table
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA5MyBTYWx0ZWRfX0yw5SrWgImx+
 YfC7gvBJKix3kUx6Q11K1FS3wVH3crLUub9CmUlbnyDnXtlg8/1MEloeEiqEQsn5fJGeV0pycEc
 P63rwU2Jg5p6ovxbRAh6xzkkPrfejHwTlnwlPSme7WXW3/XDL8DrcBMneByA/yEpXLQLbZVfv5B
 eO0TiF9sDQIwVAbc15js116YAY5BB/88unUy+20S1vRVcQSxJ9d0w8t4g0hSyZwBsL4IyNpS+4A
 Yjlr3+PMQ3z9XwlnvQ0vaLMMJksgPvaN1Q2OMsxy6tv1/r+3E3gjh3dIi4pl/RR4v2jqaUFyNqI
 ZqENjmU+xvTguKKz/Jp10PB+szPxuoJZntfrAR9hgzjv2BQ2vEQRIe/LEDGEnc7qDbWs+gVKm+d
 Rc003xkPbjvJC89L6eOVKSwhj+E5iwAdGzeY8g9o7h0O7KO5WIKfZBblZN857L+FHnQAQjNT
X-Proofpoint-ORIG-GUID: 6WN09IS9ko7ZPgytM2eDQo_Mxg24fB-0
X-Proofpoint-GUID: 6WN09IS9ko7ZPgytM2eDQo_Mxg24fB-0
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6825b63a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=N9GNhs4bAAAA:8 a=r3g6jp7oTuNtImPevnoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150093

On Thu, May 15, 2025 at 11:26=E2=80=AFAM Alexander Wilhelm
<alexander.wilhelm@westermo.com> wrote:
>
> On big endian platforms like PowerPC the DMA address and size are require=
d
> to be swapped. Otherwise the MHI bus does not start properly. The followi=
ng
> example shows the error messages by using qcn9274 wireless radio module
> with ath12k driver:
>
>     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff=
 64bit]
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>     ath12k_pci 0001:01:00.0: failed to start mhi: -110
>     ath12k_pci 0001:01:00.0: failed to power up :-110
>     ath12k_pci 0001:01:00.0: failed to create soc core: -110
>     ath12k_pci 0001:01:00.0: failed to init core: -110
>     ath12k_pci: probe of 0001:01:00.0 failed with error -110
>
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/bus/mhi/host/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d..205d83ac069f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -31,8 +31,8 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>         int ret;
>
>         for (i =3D 0; i < img_info->entries - 1; i++, mhi_buf++, bhi_vec+=
+) {
> -               bhi_vec->dma_addr =3D mhi_buf->dma_addr;
> -               bhi_vec->size =3D mhi_buf->len;
> +               bhi_vec->dma_addr =3D cpu_to_le64(mhi_buf->dma_addr);
> +               bhi_vec->size =3D cpu_to_le64(mhi_buf->len);

Ok, but then I think the bhi_vec_entry struct should be fixed as well,
using __le64 fields.

Regards,
Loic
