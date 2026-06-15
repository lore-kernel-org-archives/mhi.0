Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFD3C06
	for <mhi@lists.linux.dev>; Mon, 15 Jun 2026 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781496440; cv=none; b=MualAEiH+xQS0o+7G0WswTgRvTvJDP5MLesiZhjo+orh5mvMdUtitcrZkYTReRGNSPfV5/uj2HiqEb4uqyjDy0/pJ4NrWUcwHjlKDI+Fp4FxE5DhslGOU3WEQCFbGJaMfHLRAhibndbIBOZZJZ39DLduprDNap1+mfYSa9a6OTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781496440; c=relaxed/simple;
	bh=uIOnfKo2h7zAEA64UfE4jeAAFtzp7e2deMojPvKaOLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npowi6eLVYxzdw4AXDYFCsJ1bbJ6U45zktBQFFv/E4gSTmkGSw5rB1BC8WGLX7Y1eYhh20AzSkw3lHxOxLxptD57d4zEacDWFh8ttfzKVRJ0TOUjTiCfB1a17Mg9Y60HxDn7tKRNS/rvzelftPCN4L6P/VeFITwzMekYN8/i2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWh7m8mA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0Ma3Gjm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWh7m8mA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0Ma3Gjm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1hsda2646490
	for <mhi@lists.linux.dev>; Mon, 15 Jun 2026 04:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzTkqC16zOHCuTnK0OQk33CLzFmITZjYwvMS5SR0uBQ=; b=MWh7m8mA0GbNtmGC
	5fbPgKSbrMvi7kUDE/U7BbWQh9Ipb0EZxGck48CJ1v/2Hc789Ty0meElxJapV+ux
	bCFDSVLmkcSI5k87Lw0K849cbZVmjHfXvtNU8x70Y8JTu6Ii1j2WXZDUP/XAlgX2
	wrPg9Sv1KD+VQKyOJcrb64RkkymAPixrQCrxv9ZIC0oNgl3HpLKjnJgV4CdWhvnw
	H+fs58aWvmJIPfKviJxiH8Ce4UgLyBI4EGBx4YUwMEuD2r8iW2lOv0ilX7094fe2
	Np60bWF+IT9bv14prNtiOkC9S/GQvOr2mw+8o/AYm5oiHR2sXaRaQtKanpKxui0F
	iIcITw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryybwb54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 15 Jun 2026 04:07:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b54cf2so2167237a91.1
        for <mhi@lists.linux.dev>; Sun, 14 Jun 2026 21:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781496436; x=1782101236; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzTkqC16zOHCuTnK0OQk33CLzFmITZjYwvMS5SR0uBQ=;
        b=H0Ma3GjmfrphLeJnFmi4pkVEdloTAf9DDmkNBpLvnd7WxQJ0zYkY3LrcQcUKK9Vd3R
         /c9psns3Q97Tx2iTXwLgt6h1yURB21oqVmLFQC0RvoHlxOK/trEUaXCOKj3bEdfcPzH2
         MxQXtRIjwJ2x4xzAYlk7mRcRhW1vYGxFntpmTiaiea4UHBTrGVp5qGfhTJCEZgfCq4s7
         xNfdppLImknFGxC2MuUds9bw3bTF7FoBTdnlKdB4pCT8uR/x/ZlGdNkz/CsziDOgUC6e
         7ZXi0NcveVDkGiY2R9Kf6x6SuNAxaZpaQbNWaGLgGbs32nCHhzppOatLCkaSvlm140lD
         I0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781496436; x=1782101236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzTkqC16zOHCuTnK0OQk33CLzFmITZjYwvMS5SR0uBQ=;
        b=UZmBqSk1V+tA2jAQHd6j4g2KNl6b3xVwa5biJgdia3kLBXAQb1AlN0lLFnT7MTGcnq
         fnG3twhjQrJHVTJ/4zdiD20P6vm3hQOGm6Oovt22KqBKMmlv+XMKRbkOoGwwV7NbN2d3
         D06ZTYc5NAVlXd5J7l30CzKQgss5LaeDYXVgFoQB7eIEh2NcQFlZ7EmjdS/4mpuR7xxY
         AoF9SmQEoEpVl6wtUjsGH66O9KbLXUh/dHLZU/2cugwgA26yZi3NMialJow6g7vpmkxY
         XwX6xVpldYlE9jZW+SyrqyKVLrxX0t3lvzYlNKQhbBxefvNrZwoZTSh7VSGMtyYkrf/F
         1uow==
X-Forwarded-Encrypted: i=1; AFNElJ8UPpG2vruFedpxTrheUs7XWL/gerBDqBzzGueGlYVf2333AeTHxlbugu7+zIMIg8ZzpsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK7DTqejR5So9U+cV2aisHKQBXpL0eSAbrSPNoSi3ExvyeYixN
	jKwsWQdcVV33KDRFZcwwdUZt/WmGQGcj6j67pz0ZaAxT22+OUYq2AZESUJZirrR0oj4pXx3yq64
	HNc0vzstE+7/flHynJkLWo7A+jHTRiLFkmR9+Di1c6+jLV67FtOP9nbM=
X-Gm-Gg: Acq92OFGrIkdOgojNte+hj3Cuxo6exuMEPiy3YznBPyqlVbwleBnhQUDfIab4RDI5o2
	W6rzsm0g6XjLxro8/hRsi+E7zosL9wTbNk8B3tPIm6qLIqJGKT1uxBWhJrMTCYZDsMJ16GmPK1h
	Cp2vH2FJPgbeUk5tam+kXLHSyGsxsAedeCW5MWN6l6HsQPhSGqoAIi1T1+TMe1yWEit9eECFUf1
	EeD/K/2ShYj3jrr5EqlXknU6p+GHYrIrGIw+dFP4yuiGseVEdAavSUX7Grnvmozl1xdw9Y8ooyP
	bklHMHxnEM89AwzI70ln2Oj8xq8tiD5oP3ANGEoJ6LgHya9yDDXPPHBRksR1RUFRmfxhjih+n1B
	QhB1QAeYbK7/2zuAXmV8hkLRt7Jj4Aam4kzGKrNGgD4DN7Yi4jhpL0Q==
X-Received: by 2002:a17:90b:1cc5:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37c2bd08184mr9382387a91.19.1781496436343;
        Sun, 14 Jun 2026 21:07:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc5:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-37c2bd08184mr9382349a91.19.1781496435840;
        Sun, 14 Jun 2026 21:07:15 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1f07d77dsm8730067a91.6.2026.06.14.21.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 21:07:15 -0700 (PDT)
Message-ID: <cadb7c5d-d856-4217-9c02-98ba37713897@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 09:37:11 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
To: Qingtao Cao <qingtao.cao.au@gmail.com>
Cc: mani@kernel.org, kees@kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Qingtao Cao <qcao@digi.com>
References: <20260603011333.3306102-1-qingtao.cao.au@gmail.com>
 <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
 <0d3e4046-42d5-4f91-be85-8681215e84b4@oss.qualcomm.com>
 <CAPcThSE7wY7Zm=H5npSdCqnEFv0VEMP=3x8UkyJqwfqyEscBsg@mail.gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <CAPcThSE7wY7Zm=H5npSdCqnEFv0VEMP=3x8UkyJqwfqyEscBsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NswHD_1zrsfZLFBPWFYJquBLGArv6Pc9
X-Proofpoint-ORIG-GUID: NswHD_1zrsfZLFBPWFYJquBLGArv6Pc9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzOSBTYWx0ZWRfX25ecdD8hpjFY
 uuEog30YOoFMtk9A9B4KX08kkPJTzPp8POXYuA+JmfMcj6cFdInwck7VswZS5xA0vteoNPKRbiv
 h0qIVTN3Od+mQIZA6llLywzBLYcajmw=
X-Authority-Analysis: v=2.4 cv=JLYLdcKb c=1 sm=1 tr=0 ts=6a2f7a75 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ArX4OyIvYgtutL6DSBwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzOSBTYWx0ZWRfX2t+32cPS6S7e
 B3VNmXg8TkbiPvc36nNJyvUISTJSCw65rOWs+An1rUgX9d21Gg5UhqiJeCPgFGM8JOrwspfk4b7
 sqqgeC/WYCOncyCrkk28JX9A9F1VIFEqJS6AA7jL2KZcv7c6wowy06tzy727OUK9VH42bPx9bCZ
 Eiw4W4rlQA2T+MQDQpuB9crcdklPfmGhSAeC2rrheRySRyVOPSQJkRic8JrIJSS5KCZGzDYY0VH
 JBzJrLdbHqlFODZgDL8PD3e2dJ/HzVJBKF4Vd5+fecPjaPatyILuoW/9gID/gCkUVHYea3WGLMW
 X70z6zApwRNDLnNTdbjQmJJkXxV3fCTZzMv86kmbG8eewjvCDGZ5SUejibpQOnmbGhiDXYo/zk5
 Q8QYUcmWpARSmExS7iHgRzWffAN/ukNUBY6krnzyL8tI4khs4C9kEpjxuXheUL5IswJand59k+u
 WpsrV5RmjnS94iUr1Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150039



On 6/11/2026 4:29 AM, Qingtao Cao wrote:
> Hello Krishna,
>
> Thanks for your reply!
>
> I am using an old 5.17.0 kernel and Sierra Wireless EM9291, the MHI
> pci_generic.c driver was modified a bit to support it,
> which is very similar to EM919x and the modem_sierra_em919x_config
> descriptor was reused for it (thus the timeout_ms
> = 24000ms, or 24s applies)
>
> Without the proposed change, the AT!RESET handling will finish after
> timeout in 24 seconds, whereas with the change,
> the handling can finish in about 11 seconds
>
> I was inspired by another earlier commit to fix MHI_STATE_RESET handling in
> mhi_pm_disable_transition().
>
> Warm regards,
> Qingtao

Looks like device is clearing reset state, but we are not getting any msi
to trigger mhi state event. As MSI is not expected to send msi from the
device after clearing MHI RESET.

Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.

> On Wed, Jun 10, 2026 at 10:40 PM Krishna Chaitanya Chundru <
> krishna.chundru@oss.qualcomm.com> wrote:
>
>>
>> On 6/3/2026 6:36 AM, Qingtao Cao wrote:
>>> Bring forward the idea to fix the power down latency in
>>> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
>>> so that the transition into system error (triggered by AT!RESET)
>>> won't have to return only after the timeout of up to 24 seconds
>> Hi,
>>
>> Generally we should not see this delay, as device is actually clearing
>> reset. can you give more details what is the device you are using and
>> kernel you
>> are using etc.
>>
>> - Krishna Chaitanya.
>>> Signed-off-by: Qingtao Cao <qingtao.cao.au@gmail.com>
>>> ---
>>>  drivers/bus/mhi/host/pm.c | 14 +++-----------
>>>  1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>> index f799503c8f36..9d29f1591a45 100644
>>> --- a/drivers/bus/mhi/host/pm.c
>>> +++ b/drivers/bus/mhi/host/pm.c
>>> @@ -651,21 +651,13 @@ static void mhi_pm_sys_error_transition(struct
>> mhi_controller *mhi_cntrl)
>>>       /* Trigger MHI RESET so that the device will not access host
>> memory */
>>>       if (reset_device) {
>>> -             u32 in_reset = -1;
>>> -             unsigned long timeout =
>> msecs_to_jiffies(mhi_cntrl->timeout_ms);
>>> -
>>>               dev_dbg(dev, "Triggering MHI Reset in device\n");
>>>               mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>>>
>>>               /* Wait for the reset bit to be cleared by the device */
>>> -             ret = wait_event_timeout(mhi_cntrl->state_event,
>>> -                                      mhi_read_reg_field(mhi_cntrl,
>>> -
>>  mhi_cntrl->regs,
>>> -                                                         MHICTRL,
>>> -
>>  MHICTRL_RESET_MASK,
>>> -                                                         &in_reset) ||
>>> -                                     !in_reset, timeout);
>>> -             if (!ret || in_reset) {
>>> +             ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs,
>> MHICTRL,
>>> +                              MHICTRL_RESET_MASK, 0, 25000,
>> mhi_cntrl->timeout_ms);
>>> +             if (ret) {
>>>                       dev_err(dev, "Device failed to exit MHI Reset
>> state\n");
>>>                       write_lock_irq(&mhi_cntrl->pm_lock);
>>>                       cur_state = mhi_tryset_pm_state(mhi_cntrl,
>>

