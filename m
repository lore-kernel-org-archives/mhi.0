Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193134;
	b=wI88tPrIxQh9NGWq6YhH4G6Yr1HeDArUlCezWJvNtRQaiUc4SMU+b0yMU5/Br/WitlMe
	 0s4h6Zt0AEPth3LmbFLS2/aQLxd2+JviJbno/5USi8+Gmg+aq/P0o61LLZwt7LJAQ2Jn/
	 L5HLVMeiKl+tivOrufvo6bEOYS5VukU5rTfVKOlDRyqBxG5AYZYmuonIutgGuG2dmSQBs
	 /uGo0m4C8vLBnAwwIxoiZ0HmfOvr25r22Jhuefm5bXgntzLvamlOovDw6oZ1hjn2zHIB5
	 G8vUJobWL1vQg9O0q8K6nM6W9iiTffN1yQokNkrcN+HCn+OyieD9jBUFpuhr0YJSrJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
	b=eJEZQnw1Xgzi2t+NcimUCYdvlBWf/i7ht/LwdLi3aVwEzV8TyPxWLFXvOQBCnDHmx1wx
	 23jbN+YagOGcwNR3DxCz1a66sG2iGh49DPCrlPNPxoMd2FA4SsBBvQk3e2owIo18uDJXZ
	 TXE+bs+njrTqefc0lJnM3gVZkhwddEWCXBhiRU7EyB13ZsfizgL3v8btpWBQUX7MWo7Nd
	 raIRr5gwTomEp8ImvkWCZtBoH3wlzResq01k/TLzsU9y7mfawlLrIsmQRJBZ5nFcE/LC6
	 QWUcsbEpjWDQGCBuiNGMcC6Mri7TrvNZ9y9WF1A5MwOpN7boS97rGKWcJ+j8hOXN2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4SgVwVh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSOzowrn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E97606A608
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 16:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E97606A608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4SgVwVh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iSOzowrn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfUU31680177
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=; b=Y4SgVwVhvElqL7gM
	AuSh76nTy6d07wAWzQzAByaL8WNeDbQOQT5zJS5pta+Ws1fYjmdZjPnBJxgiL4w0
	GhPfMtuR8uCYU/RRAt94Iob+xSvCO+qTg3rNqUAL+y8lLKHkpF3MZ7Saxn0IGnDI
	EKntjdJy5BWBvejh1PTSi4ssjKiXLm7z7sefqI1ak3dVrUaoTJroQs01a1DbJUB/
	Uef+g1a7fB7tv05HUU8m+jo3yxnV+BoJn9y3WB2JUKJXwrlmoLjkQwIMp6sq0Gk8
	1A3AKDO99MtLsIIVOXYBTaaOg89Us31EPpaSR+N+hosLbOmXyZHoKOcWRHNg9rJ6
	pZi97A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5vpmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 16:45:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1665390eec.1
        for <mhi@lists.linux.dev>; Fri, 20 Nov 2026 08:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795193132; x=1795797932; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
        b=iSOzowrnWa13Fb3g+eIed/bTF1RSkDX+VgN3GqNPs+SYy5kkUcVxtZusIVONzmq4q2
         uSVzBEyZ2beQV9Epy8iElu7BT/xQZLipzH2j7hEhnV2JehZQqQwyPir2BZ6qihGnn/O2
         +I4yQOdSowfP0yDiYaG0Q552qTioVMqeCpxKVLv7S0CpBiVoakMFQVcI8syS9HASeIzq
         FSYmdM55N/q3J7GP5ZvMQ8WJs5+89c7ApMsSeN/vWnkv4VATrClixbs62Yild+48Onxx
         FD7TJfzfyiyEgULBWWi9k2kZCg+uYqrIo59tqYi8mXNOih4FkCS4xUGir4EhD4OK/p90
         5k4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193132; x=1795797932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
        b=Ug1MRTADwRUqymrqCh29d9VJZuA6Eu8CevSren4Y6nKUzCzhl8oyyB7w97/rHP/BoT
         B0X92TGXE8Jt9w1W5s7bu3YWwbnsZ7e2YNUoa1L65wkRxxd0BbZdItbk5A/cCSIDuK3h
         Df5yvfIdGFKcShoKcQpaSeXqKziE3So/nMMSpbaIIjldEvViVlsPXzgUbQZ72GpV78qd
         0tEsOVSvzP+ekM2ymBtCrZjxJKok6pcqebyIq7F/Eqd86XOVW9WpVClfNXHr+eLmMORO
         oGuGoD1/Cm1725FY6v1hnVCV/xdaz+itwQgoQYh45k6ZrTMz7UVHX7yhnNlRwHqUm/hw
         HHqw==
X-Forwarded-Encrypted: i=1; AL+hErEE75S1TEBk8h3WlzsDAcCsVf/ggQIebBvc4qhIHck6axwYbCDTu/G2UGimSyYQaNZyicg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZwRjOzV0BlVnEOGKD3DkRXO3jgwKcupJ1plaSXnuNypp9SHD1
	Y3abkHP5I988fIbTxupEO7CFcC2qbpCyPXCOPlZp9JbMB5DYqXstCe0bMzMmEBh862yRsyETY5T
	RtViHCJQr3u95ByqGsupPW9MftOiAd8H20r3VjLhGbiFjQvJP9VyhAg8=
X-Gm-Gg: AZFdTZfOYmyue5Y3x+PKvFpen9Dq7PqxwAV3DSWBjKpH5pn16RiTwuhz9rGKWiNTnnB
	zRVkg7go5ZxtjfqSv9+X7QHNcFGiLMAL4GhitBV5yXCr/HqLRrHrtyYHKpXefvWYrXNExRt5vza
	pEICdHEwnwzpqZwKp+BuKLs879ZORi71ibl8yVTjoq94FzZN5B4whO7vUZTaknUO2tkkaihj91W
	1y00lun5tpMlzSVy5BnYseNXlqc386+9bYRieqg/q3xDqk8OWQ/TRjsYstsfG6LOCG1GDvCax0+
	0qfGTg3/tlYqMRVsRCgcgb09HlzrBy1txYgyWBircSuBnGowmSQccbUtG/W6hnf4Q+rH0+Z4lb8
	YR+kdyGIstWQFukFVUq52jno13RQqABqk+y3gD9FZhFQAnCG2FM1VwHicnEdJ9uTEQqRc6sjBQ4
	a2AG+nGP8lU+/WBlNj/ezPMTQ=
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr3430893eec.38.1795193131903;
        Fri, 20 Nov 2026 08:45:31 -0800 (PST)
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr3430845eec.38.1795193131141;
        Fri, 20 Nov 2026 08:45:31 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm9309301eec.9.2026.11.20.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:45:30 -0800 (PST)
Message-ID: <ca6de262-80e3-4c38-8f3c-122712d3f54d@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:45:30 -0700
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
Subject: Re: [PATCH] bus: mhi: host: Only expose controller sysfs attributes
 on the controller device
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111115659.11943-1-slark_xiao@163.com>
 <826c1746-137b-4a5a-968e-8e0449a25e78@oss.qualcomm.com>
 <3cb75687.54e4.1a1ed794488.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <3cb75687.54e4.1a1ed794488.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX8kkieRXhLwFk
 uXf1eC5ehtlBQs4JKFlrnEH3anzTOrL3RKr0THByHjjOdHsqU663Gi345u7wn3GZEayXpLPn00I
 CT6c4p0o+236A2DB8SmsUDg+Ijjt/Zo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfXxxzts8DW9A8L
 2p6LaH6a85/grIYIGJGm5ne4VEAYWl5N4OyRGVVOtKcaDEXzavFHhkea4NNiSKy0Xg0csDq/rOD
 F9toD66D5otjuj/4StEyiJ4hB8DKGlccWhr7ybLz2a2EzjZaVznGp8lSYurJ8EtY45Xm9mzSwUr
 /zPvVdT9fO/PiV+FvsaERzJohP628xi3bg3i7uSX0nB9OvrpAQyWqQLTVCk7MroXB1ClQROVWWs
 VSlnLdAr1ywIDVnShgyq7Xm1tbhWYXHz8HK7D4LHsLYdNNLfiypclu9EGbH30umimU2UaoL/PxI
 iYyibiU3HwJI7cTWaEBrYK3GfZG1Fz1nLme1m6db9MVV5q4xLZKO96SxLPhD2Vg156OE/wfGIsN
 m1fkuWBb9OcdeMeMk8EYrzTrw2ia9zyxhzDOAy8q+9eHayycwX9yexs0502JPG5EC87LYNjPHBD
 2PmXcnUBsoNPpiC60rw==
X-Proofpoint-GUID: OFfdOMZMmh621zSHBLgNeL27PQL7BHmc
X-Proofpoint-ORIG-GUID: OFfdOMZMmh621zSHBLgNeL27PQL7BHmc
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b00792d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_J-3HC_dJu7vbrgoKJ8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200066

On 11/18/2026 12:05 AM, Slark Xiao wrote:
> 
> At 2026-11-14 02:42:46, "Jeff Hugo" <jeff.hugo@oss.qualcomm.com> wrote:
>> On 11/11/2026 4:56 AM, Slark Xiao wrote:
>>> The serial_number, oem_pk_hash and soc_reset attributes are registered
>>> through mhi_bus_type.dev_groups, so the driver core creates them for
>>> every device on the MHI bus.  MHI client devices (the per-channel
>>> devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
>>> each of them ends up with its own copies of these files even though
>>> they all operate on the same mhi_controller:
>>>
>>>     $ ls /sys/bus/mhi/devices/mhi0_DUN/
>>>     driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent
>>>
>>> This is wrong for several reasons:
>>>
>>>     - The attributes describe the controller, not the channel.  Their
>>>       callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
>>>       or issue a controller-wide SoC reset, so writing soc_reset through
>>>       mhi0_DUN resets the whole device while looking like a per-channel
>>>       operation.
>>>     - oem_pk_hash reports failures with dev_err(dev, ...), so a single
>>>       failing controller produces one log line per registered channel
>>>       device instead of one.
>>>     - Userspace has no way to tell which copy is authoritative.
>>>
>>> Move the attributes off the bus and attach them to the controller
>>> device only.  mhi_register_controller() now installs the group via
>>> mhi_dev->dev.groups before device_add(), while the channel devices
>>> created by mhi_create_devices() are left untouched.  No functional
>>> change for the controller device; the files stay at the paths listed
>>> in Documentation/ABI/stable/sysfs-bus-mhi.
>>>
>>> Note that trigger_edl was already handled this way, through an explicit
>>> sysfs_create_file() on the controller kobject, which is why it never
>>> appeared on the channel devices.
>> I agree with the rationale, but this does appear to change uAPI. Are you
>> sure no one is using these on the channel devices?
>>
>> -Jeff
> Hi Jeff,
> For oem_pk_hash and serial_number, all interface returns same value.
> I think there is no need to keep these interfaces under the channel
> devices.
> 
> For soc_reset, it write the register directly and it works for the entire
> device rather than a single channel.
> 
> So I think there is no problem to remove them.

These are uAPI. The golden rule of the kernel is that we do not break 
userspace. It does not matter that their existence is a "bug", if there 
is userspace using them, then we must keep them.

I could agree with you assessment that having these items on the channel 
device is a mistake (and I do), but that does not change the rule.

So far you have not provided any data to say that userspace is in fact 
not using these, and therefore removing them would have no impact.

Without that analysis, I am sorry to say I am uncomfortable proceeding 
with this change.  Mani is free to ignore my concerns and apply this 
patch at his own risk.

-Jeff
