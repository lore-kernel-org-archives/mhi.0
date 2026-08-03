Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1472617
	for <mhi@lists.linux.dev>; Mon,  3 Aug 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772674; cv=none; b=AfrRi7681Z2zYOTrB9XfOYOwkNzQfYszONZNu2aP8bdDZEq+Cq+ZC2M8yPHlVGXUYjcjyxPG2iTW6tKU4n/bQPJw1YAgOzjJkET6Cx7Y3jREnXD/Y3b/W8Xs2JrUz589wTzeqXY++1Qu8E08yvc6ALAmDdJofZV+RqgUkoQSj2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772674; c=relaxed/simple;
	bh=/fmB7Ujz5KUozMQSO1nSxFvk2smNKq537zuc49d4Ip8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkL7oVbChQ0wO7/vUg/qVgzoV4MqmJtSk487JEoObETDGU2lXC91Uepm2MNRmWHAQ/Ov+AdFFNL/OeAEnmuJmHcfhWw2rMI5zX0RGpbXrQ60sLheu3SQFokfg6LNaoZOQ5Ug4HMthqTNti+ZXVfQMdy/31M+ZjC5V0QGZeKTEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9poywF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CZN+06pX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9poywF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CZN+06pX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673ECKoe241784
	for <mhi@lists.linux.dev>; Mon, 3 Aug 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvZMTQb3sKuilMlizVd/RUgZzAHN9JyDHjQi4foIjuk=; b=N9poywF1Q4ssOAhZ
	S1ibNJtQXlEJOqp6teNcnwYVoTPAByZBy76dS4kNd/w7rOdVCn5jBnHHdhYsQjdj
	zHLp3A3pvNaS3DHu+rL2O8FKNSQzhUpGcydmSiD7JUYzkbV5lTs8zaacoFJnRnmE
	xD5vT6s4sfaRPOgL/2iNyVZ97i2bqBUuydMWBhu7Fvet5pAoXqto56PCe7OVxPPE
	eWhfgXzQ0RknyMkPIctVI26CJhyNfzcgvvC+BPuAW1gyblgRJSdZAdpunQSlHRhJ
	Pdk4IMJumzFLFVXWD2zey/UUZw08BiTPjdVAd6O9p/qq1W7k5Hr04aljPo7eFfFp
	mw6xnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxbjvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 15:57:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so33535b3a.0
        for <mhi@lists.linux.dev>; Mon, 03 Aug 2026 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785772671; x=1786377471; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvZMTQb3sKuilMlizVd/RUgZzAHN9JyDHjQi4foIjuk=;
        b=CZN+06pXkN6xG6gStnUhLBIrwjm+4LPOg04w0X+v2wruMw+tbMxGK/fyCUQIWzSCDf
         7zul9k9kHz7WEdVli1wE3kRdSa2fx96S12CBHq0jhldnwCOamG3vTorN6paFR/qpeWRr
         fY8/SA5i36TkPtmgCzFwrmmlQa7czDZVOtgQMNd0PG5I20tJd7HfY0AEGMlCUfxmSC9z
         mNY1OtwJ0FC33J0kLfN0dDetE09IoE5ER5i3iZpTEtre7abAEnq7042l3fHp3aWN8bMG
         v0xQgFRidYvVroPR/Bs4UZegt7G36eMrQ/L0mz1l3Ov+EZgKEG7eU+MeodFjXCBzpkt/
         LQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772671; x=1786377471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvZMTQb3sKuilMlizVd/RUgZzAHN9JyDHjQi4foIjuk=;
        b=o3OvHVh0GJCG6K1lXIRMNspeN40oSt3dzA+egOnbZrFlSXHrWmz1TAaOBKnRraGsAg
         BP+BeT5TY6uaib5BLRkLa7aX3EKX/3HjkqoWYWvCet9tDvg9S57KHLx6Kvxipy1miK81
         4Usoz+vrM3mNOptJ4fqyd7Ud4hBQDEYHftIwlhuMc05CWqSs2afqWrv5h/bzTLmFdiKp
         R5XvQdKfhO1HH+E/OWbS1JohUGMEgpOlMzQQxxUItSrsZLNaPWUHmQ1eZJgVX3Bfw9pp
         KgbXTjQfJ4bIbHf+HDEi4gjnT9hyyaDgwYkmW7WI8SPGubZWcpHHcaIYqAgpZgW1frNv
         +3NQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNuzowex/5fOXgZFqLftIDdiUMAwTbxMTFIoBlpbms40ZePsviEzl3FUIQ7/qM0pPMbkg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuCUP4IVhoEqsO8wRnQirnjflYkypwYQw+6XJvzRnt6121evMS
	x7Mdp/+vVZ+TDgEWw7D6/oRUdpWmgknEVm5pablkBXDI3U+Vku60mTfLS9jWEjLHFHtOIqJj8rM
	IBrPxxc+dFSm0MWcNonuU76LHn2+tFWJzhFkSBNcWnpJC2rADF5rxCdeyWEqzKek=
X-Gm-Gg: AR+sD12pF4dTsLp2VFPzWfNbtH4R3Staj1Kp5FqVCE04EO931bccFat+buCTnf8bgNk
	mPcAq+3Njys8i+ZBtoS8l51mn7NUXqJUCZhTm4aS04oi5JJ4UpxQXnJVV2Y3qE5vvKIPDfX3W/r
	XQpEMpCWlWWPwzpPNkmlc6+X7FC9V+dPBW0iw8j1QMEUp0LqKxvwigXfkDXRDzcJAE8eLu5IJzt
	6JDhcVqIKWadRYV68U77PkBG9UjLWCXu857zTI8fQYN982DylNUvbDKqHFHRrsxacKqajf6WZc/
	nzDt2ceiUTSxOu7kGXfy/92VLhLlCRr6LXn6ISwAs87NnHsnF+cBpN7+kPYhc8VVIgHw+ahwHr/
	L/grcWj+ceefiOpu/ke9t1e/GUtPEI+w2s64TUSMkojBAsYUXkbKPYA==
X-Received: by 2002:a05:6a21:9185:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cb6c75336bmr125704637.5.1785772670672;
        Mon, 03 Aug 2026 08:57:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:9185:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cb6c75336bmr125661637.5.1785772670126;
        Mon, 03 Aug 2026 08:57:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e70esm64951283eec.29.2026.08.03.08.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:57:49 -0700 (PDT)
Message-ID: <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:57:47 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
 <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z2HLn0dz9_Wl92ofnBeA2J6vhowJziaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0MyBTYWx0ZWRfX9nlaYFwp+Vak
 YFusMu3twto1w86OZ8DuB+eLpHpkmGDtAScieNpbzZ3EwsGBfR6/kM705z4LOA0qmkUDR+prfnh
 /t9bjlBbhakcDThQQ4nH3CdlUaurchfqbZ4ZVHnO8nZZqBydZtsJHlQ1kXEhJ514+NPUkBGpfyQ
 jEjx9TlsYTDV/NfXXvJjgMILdPpIZTMVqGYkdAhAxy0dA+U5UmsilURci/NT2SOQpyCZUgbSAHx
 r5235+gqMj8XPizf6efr+em65l/TzubhKLuTzUx8VNUteSxmA+qZ/8fJfZZcrHTROg8UtBTU20k
 BQDYkspauyke7ZLDTDs5jvv4mB0I/+BZFYZ9uwbBZzysIP54T9XtvlxnasDegL4gi9q+L+/wbzY
 N4ezsOn88F6ubqteA5zzBZoUm/xVMmjzO7WyazkubpZKPpwlkiOVrUMpkvMjXFhtEo0xg9AQpPe
 vfmmOGdo5M7HpmYkoCw==
X-Proofpoint-ORIG-GUID: z2HLn0dz9_Wl92ofnBeA2J6vhowJziaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0MyBTYWx0ZWRfXw3qUq74CKvx4
 U8ORHyzscLfYevJDF/6lHaGkBeFDhMtufk9ETVagkyFRNoQNd/06v9S6QApiktuAAODWGN2seoR
 6HcAGrir9RysE//kw72ivnNRE9YGRMc=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a70ba7f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=balVh9TWn1L6BMhRoM0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030143

On 7/29/2026 11:19 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
>> On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
>>> mhi_soc_reset() tries to reset the device by writing to the
>>> MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
>>> that the write gets flushed to the device before returning to the caller.
>>>
>>> This may lead to the delay (if implemented) on the caller to be
>>> insufficient, if the posted write doesn't reach the device before the
>>> delay.
>>
>> Interesting.  Is the delay tight enough that a few ms will possibly blow it?
>> Seems like a poorly defined delay.  All the devices I'm familiar with take
>> multiple seconds to boot (with some variability due to ddr training and
>> thermal constraints), and if the reset triggers a crash dump, then its
>> easily tens of seconds.
>>
> 
> Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
> questionable. But this function itself doesn't implement any delay. So your
> comment was somewhat confusing.

The delay at the caller of the API referenced by the commit text - "This 
may lead to the delay on the caller to be insufficient"

I looked at the thread referenced by this patch via the closes tag, and 
while I can follow the virtualization flow, I didn't get a good view on 
the specifics.

>> Regardless, since this reset will either kill the pcie link, or disconnect
>> the SoC from the link for a time,
> 
> No, this will not reset the PCIe link AFAIK. PERST separation logic available in
> the Endpoint should make sure the PCIe link is active while the SoC is
> undergoing the reset. Otherwise, if the host tries to access the device config
> space before the device is ready, it will blow up.

Reset separation (PERST separation is one part of) is not always 
enabled.  PBL won't enable it as it requires loading the reset sequences 
to the PMIC, which is outside the scope of ROM.  So, if you have a 
non-flash boot device, or a flash boot device that has a 
non-provisioned/otherwise corrupt flash, the EP may be sitting in PBL 
from cold boot without reset separation enabled.  If the EP is then 
passed to a VM per the related thread, a reset will occur, which will 
take the link down.

Also, if I recall correctly, automotive products do not enable reset 
separation at all for ASIL reasons.

If the link is down, the upstream component of the EP should complete 
the read with an error, not cause the host to blow up.  The only host 
issue I'm aware of is if flow control credits get exhausted, usually the 
host will watchdog, but I don't see how this patch or the situation it 
addresses would trigger that.

> 
>>   I've been trying to figure out how this
>> change might break, but I haven't found a scenario, so I suspect this is
>> good enough.
>>
> 
> This change should not break any devices as it just ensures that the posted
> write gets flushed to the device before the delay.
> 
>>> So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.
>>>
>>> Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
>>> Reported-by: Alex Williamson <alex@shazbot.org>
>>> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>>    drivers/bus/mhi/host/main.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>>> index 53c0ffe30070..4d458396233a 100644
>>> --- a/drivers/bus/mhi/host/main.c
>>> +++ b/drivers/bus/mhi/host/main.c
>>> @@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>>>    void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>>>    {
>>> +	int __maybe_unused ret;
>>> +	u32 tmp;
>>> +
>>>    	if (mhi_cntrl->reset) {
>>>    		mhi_cntrl->reset(mhi_cntrl);
>>>    		return;
>>> @@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>>>    	/* Generic MHI SoC reset */
>>>    	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
>>>    		      MHI_SOC_RESET_REQ);
>>> +	/* Flush the posted write to the device (ignore return value) */
>>> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
>>> +			   &tmp);
>>
>> If you wanted, you could fit this all on one line.  word wrapping for a 3
>> char parameter seems a bit silly to me, but I suspect this is highly
>> subjective.
>>
> 
> Entire driver is still 80 column width, so I was trying to be preserve the same
> pattern.
> 
>> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>
> 
> Thank you!
> 
> - Mani
> 

