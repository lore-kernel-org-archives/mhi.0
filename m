Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356711;
	b=k2Aox1vYiDNapwElwF4qMrZ5Y5wPWzZnCiOa1SUjIb176vH/PRbUCgYpfOItobt/5eEc
	 FDvkD5uXKiJSd5HiVp/Pvec5iEmyIxo4QvB7rwMtwdqKfJ9T7K+t0yIvA8DfxOGx/2BHD
	 KfaBIlWXXfBt841XecZOuKnSuvDWszhjDCYbhr5spy8vrVTWRsdzv/cBZq4k44/+NRKxB
	 Y3Fxod9cp1qaBRkt1Vs8/HveiQRMEO1swZOasDq5Kwq/Zye8HUfDt4QD+g9naEjcJC3Mb
	 6UYesQ3wRP78DOnUgCwbnjBKEPrz/WMlDpwSFQVGPxswr86zHtwchWdtJKYpO97LHHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8oC/0srx6xqRCbNyy7QQjm0eV4nzgxDwMWPIyqSItWo=;
	b=nXmUot+26rpp3IFu5vCupIxio3YYZ7vtLEn/qXTcUnTMGu6u89kZbrjfLKFTTm6nfqOA
	 vte6cyahEfrqkRvxH7tPgRzSJU8bcBog5BK4LU0kgsdgJqBvVSH/sMxixVRvamjYcKlPw
	 otngFS24Z4BfXGjROzqFHV9aGXI/y7cP7lajHy/8ZfxUUcRwcOaVMm4MHWolg9AX3kM3w
	 WGU8eKrLGBSQJtBNFRmifTpx0j9Yf+hLUP0DfFvnZzRxEGh/TXdlZ+4lRBCuusyyrrkja
	 vVPbUC3Ej7nRzYWIHj5lGvEU/K5nw09qprkI/3gcDUGsZLSk4i37eMuSBQwoDijle+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPz1AyF9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UY0Mjzoe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65805606A31C
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 10:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65805606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPz1AyF9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UY0Mjzoe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FSCE1663351
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 10:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oC/0srx6xqRCbNyy7QQjm0eV4nzgxDwMWPIyqSItWo=; b=LPz1AyF92EEZzndy
	eFralOfIVN+pSPu/RDtlMNCu/05Sq0/Ym2bIp5BIXbLQ176VGKw9NKdHSpzdn0xm
	0x3QhdiKp5TWLykLHrwaN2cNaQystY00dmlrnRlv62mam3uR05YA0120v6DaWIOd
	rD9VCJGCPWmNIrzIzHILYq/JkCW2TcGsk2M8jLSlwhK9aaHU86TKq48VK09RaFz4
	m3rOZhtC3plxYaoYGuGL3W2olqyricuwyJvtgiE1DsZCde/2Q3kAxxYwcpgxPyNz
	U3EX3ivxWZY03MKQs3b1freaVQtrWklCBTJOmgbB4w9bHGfMemdNKkrkCqiJwH4S
	cnesJg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p2jph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 10:38:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so1022985c88.0
        for <mhi@lists.linux.dev>; Fri, 30 Oct 2026 03:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793356709; x=1793961509; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8oC/0srx6xqRCbNyy7QQjm0eV4nzgxDwMWPIyqSItWo=;
        b=UY0MjzoeeX0piuNAFun1ksPn8+fR4I/kHFfXHBsGBGTO5vIiy9rHQXqgksq6BqJFaT
         L2nAh2vT8D71HZHvfcbBrTYsHbEEkdYaFDvxu51zMS7ubJSn3Ma/8pgzeaJ+pf7idEVh
         cmNX3flg6NfsQirKXMjonLpakACeENAY8co08HO7KX3mn2z8S88jsxg/yPQ2P+a1sziM
         2Y3qVM49IxpdlqN0kAcSY5/dCn8yjd4VeNYs6vBGS4JieUwX/2QqfeWQMU8UIgAGzF+T
         orangNWvFWLxWCGl3412v/yX8eXjAIKTXQnCJV3l3Rad4/v7RmkJ1ZbILckIzYoKm2lO
         +MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793356709; x=1793961509;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oC/0srx6xqRCbNyy7QQjm0eV4nzgxDwMWPIyqSItWo=;
        b=gwiaCLFbPrU7fVO//r6DCTapnTYg5haBaXSGxkx03UU8YJre+hzylXETsR2IHAHMWV
         /qbrbOPZruth4YlAASeddoF6oyAeGcQivg1EswG1RJhQuY1hunLvacHtwcWzsQmj2+ZZ
         fUVpUdY/PcjYeJUvFyzdHVIEk3X6ecApad/w3reBh/hsyTpf10GTJiqGMqWt+BlXYowN
         nhMYNdqm+HS0qGBcR0Rody0/Mbm/pCqQaqL1J191svb/UJd8goPSJ8gGi7lcXCC67v+p
         rjLyqYbB1IpYl0zSOTIL6m6I7hnpB6AHrtAL7D8CdTRV776hrdpIEyN8cQb+o8yW0mwB
         gdnQ==
X-Gm-Message-State: AFq9FYK8xzp8jRKaB8bbAb5+r89OAH4xbZWy5uJo2ohzgPfw9qJ/DNEp
	pHTYxB/v+pGZSa1IhtoQykxbnWBR/6PZJ4UtNTDW8q6z51AasIETbPSpx3RcxvtpGrVw7XDQsEB
	Ccty7F+yp24it9JubRcfvFeJgS0Tg9h9RvDnlZgmx4+mFcueAyCrCVb0=
X-Gm-Gg: AYBFou0F2Si1spW2dRzm6o1ATLHWThHZFKpt/zEjOlHrSuRakJ7r1XcVuVXT0R8ZxHd
	40RWPwsEpNvTUTleICxQe+YMf4pSB/vkiZPLabMeJZG2veeFTAoC7TclxaYGcVdhq1KGmKD88SX
	Tqnc9GFJaLwZyRSnBHwxSvzsvnOpHjGB0wr0227ct1fAfe1fbFfXaWZiz8YhQtyVXBXnncSoJlm
	GstdyyhoOPmJT98Bo+uwIyTz8ee4rPDenO/LgYO2QhND4S28KTHQWPELoPmUXdVxTCaKZZt+IE0
	9ORXXccbLXjj2grkgFpUYWMidYQkNNTeRkYO6K6qMW+1VyyBtx43vIk7JzgHujQJsbg7Ahc+hq/
	yBjhUpnQQYo3Bs1r5tLCtCxWTiedcMjhDGCDlX4diQJIpE+muIChsq6DJETOfG2tRvnHS6TOlGb
	xT
X-Received: by 2002:a05:7022:2203:b0:18d:c38c:bcc9 with SMTP id a92af1059eb24-1ac56e8a821mr4036469c88.3.1793356708643;
        Fri, 30 Oct 2026 03:38:28 -0700 (PDT)
X-Received: by 2002:a05:7022:2203:b0:18d:c38c:bcc9 with SMTP id a92af1059eb24-1ac56e8a821mr4036397c88.3.1793356707829;
        Fri, 30 Oct 2026 03:38:27 -0700 (PDT)
Received: from [10.218.46.143] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm10056223c88.10.2026.10.30.03.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:38:27 -0700 (PDT)
Message-ID: <be593289-7a0f-4b84-82a5-53a5987a38a6@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:08:24 +0530
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: ep: aggregate raw buffer completions
To: Senna <sennas1633@gmail.com>
Cc: mhi@lists.linux.dev, mani@kernel.org
References: <20261028175100.83406-1-Sennas1633@gmail.com>
 <9f723291-ebfb-4bc6-8e4f-c48f33938aa3@oss.qualcomm.com>
 <CAOCq4u-nbp5COcbAJ8S27DsexZzHGNbqqXE8ktmpO_RkJ=NzqQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOCq4u-nbp5COcbAJ8S27DsexZzHGNbqqXE8ktmpO_RkJ=NzqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX288L77b2zFZ/
 mLixM0fAfmvKaEwMLUTQwYKpm7iCzH5uaMgNO2/4JnZEQbXY/qlkb1Vw8Wyw6h/s/RfZbIu5CzY
 7/osWyc7hFSJqqheOI4Q3RrlnhkQLOz6Yqotf6PYnCWNtp+4O6rwhR4pfLcuvbkzjhT4+XdEzPk
 Jch6fbz1Z4k1qMbgVmjEQkBIkdzlBkvLdppIcwgnAoA54LHLM+K8sfAU7OMS5VqnDNymuBq5qLq
 s14Yqe2LoOSGDI7F1qSPC+Yu/K3pyERiLJWlLH6Jyw4BGJtqCpvdaihNNbFm2EYDToKoWl9B0NQ
 GkxuAom79GnPaUlUtYSwLWjpFC5r+BqJ/3AyUziHgLoYCfdJQ0kJiK/RWtQ+AvhYgooQ1yBmrRG
 ZvUsvV0y5ofr7s9hjhmNeeGVIR8/HmUzHJQfWXIaEemcPAgVGmVevm6NiQe001GQ9RwbBqNAnMU
 PUd6/aAugS5N9rN0v+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX6Lh4maL8108+
 qcdhg136zRBsxznSRcdqMi+hHaaRpaCccOPZ/3gADksrznGVucGJppUTNMKCTVnWH1RgEGody9n
 weHvr3/Bm8jVVu19+VbkOZ9yXgTYEUI=
X-Proofpoint-ORIG-GUID: 3pymMAYVDDWzzG6JijENfRJDsRrIsWNX
X-Proofpoint-GUID: 3pymMAYVDDWzzG6JijENfRJDsRrIsWNX
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae473a5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dsyBXNq_OXqj4fgleygA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300042


On 10/29/2026 8:14 PM, Senna wrote:
>

My bad i didn't reply to the list

Adding the last review here

"Could you share how you are hit this? With the current in-tree host 
driver UL and DL TREs are same size,
Each echoed buffer fits in one DL TRE, For a multi tre case to hit a 
different host client would be needed
which posts smaller DL TREs.

That said, the underlying problem with the mhi_ep_queue (for both buf 
and skb cases) is genuine,

With the in-tree pcie-epf-mhi, write sync completions are in order 
(synchronous for iATU, Single TX channel for dma),
so invoking the xfer_cb only for the final EOT TRE would be enough,

Can check the available TREs before queueing the first one to avoid 
running into the TREs exhaustion mid-transfer
something like this should work
```
/* Check that the TREs the host has queued can hold @len before queueing 
any */
static bool mhi_ep_queue_has_room(struct mhi_ep_ring *ring,
				  struct mhi_ep_chan *mhi_chan, size_t len)
{
	size_t rd = mhi_chan->rd_offset;

	while (len) {
		struct mhi_ring_element *el;
		if (rd == ring->wr_offset)
			return false;

		el = &ring->ring_cache[rd];
		len -= min_t(size_t, len, MHI_TRE_DATA_GET_LEN(el));
	rd = (rd + 1) % ring->ring_size;
	}

	return true;
}
```
and use this function in mhi_ep_queue.

Thanks,
Sumit"
> Hi Sumit,
>
> Thank you for the code review. I found this bug by reading the code, 
> not on hardware, and I agree that the in-tree host setup will not 
> trigger it.
>
> I will rework this for v2 with the lines you suggest: check TRE room 
> up front with a helper like mhi_ep_queue_has_room(), and invoke 
> xfer_cb only for the final EOT TRE.
>
> A question on error handling: even with the pre-check, write_async 
> could still fail on a later TRE after an earlier one has already been 
> queued, so that earlier TRE would still be using the buffer after the 
> caller gets an error. Will v2 need to handle that case, or is it 
> acceptable to leave it because the write completions are in order with 
> the in-tree pcie-epf-mhi? I’m thinking of leaving it as-is but I would 
> like your view.
>
On the error case: I don't think in-order completion covers it. If 
write_async fails on a later TRE, the earlier TREs are still in flight, 
so if we return an error and the caller frees the buffer, those
transfers can still read freed memory, independent of ordering. The host 
also sees OVERFLOW events without a closing EOT. With the EOT-only 
callback the double free goes away, but this window remains.

That said, the remaining failures are local ones (DMA mapping, 
descriptor prep, allocation), so I'm fine leaving it out of v2 as long 
as it's documented, e.g. a comment in mhi_ep_queue() and a note in the 
mhi_ep_queue_buf() kdoc.

The proper fix is to not start any transfer until all TREs for the 
buffer are ready, and then submit them as one batch. Reordering the loop 
in mhi_ep_queue() alone isn't enough, since the failures happen
inside write_async. It needs the controller op to take all the buffers 
at once, so the EPF can prepare a single batched descriptor: either it 
fails before anything is started, or the whole buffer is in flight with 
one completion.

This lines up with a series I have in review that adds batched DMA 
transfers for MHI EP [1]. Mani's suggestion there is to rework the read 
callbacks to take multiple buffers and let the EPF decide how to 
transfer them.
The dmaengine API shape is still being discussed, but once it settles, 
doing the same for write_async would close this

[1] 
https://lore.kernel.org/mhi/20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com/

Thanks,
Sumit> Thanks,
> Senna
>
