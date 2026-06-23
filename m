Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038C3CEB8F
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204949; cv=none; b=FMSKL2+OfHZwv9mIqSCU95eoQW6JeSB4lSxedPBkcAn1U3tRLwKeU+H2R3F7GirUdGnoBE073aLdvphBaqgiObbWZ+zjsDoR73j88N8KRJbk6AX8hG1NO1cCi/0yHUMEOvFlBsQNDV7cBhd0j6g7+a44o0j7No8n8iDcN+trzJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204949; c=relaxed/simple;
	bh=qaPg/+DGuSfby7tE/0iKsjpJAJXizhpCe6b2itH015A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ+hg2Lzfs/+gPgWIRkI4KryjeBB4pTCvcicS4kDR4xggn0HxhyungVnfOJW0NhaHlWNwRtgdlJV9mzGtx1WU/1OQKN+Eezpqh15X3ipSCt+LIUSbfZPU9pwRin9v7A7mopJ5kWbn6r1XT/qKSNtqbfb3Y3jVNKQwFVHu6rjovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n3ubBrYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPukpSWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n3ubBrYS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPukpSWt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8V39G3245123
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 08:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=; b=n3ubBrYSXQwWXHI+
	gn4nI/HCD2XOGpUVDc68k8FNLl8ckvJt4bupL2cd7rzU1Tin2PLb2rPXEosaEckO
	4G/0VFrJvimVOnmWviT/Szx0CzORjh7dT1ftcG4i6tl4+rD4E0DLG8m50AjpaXMg
	6QDM/OK3nBsZm2jalDsrHNDWxOqGfTbz4XYMUCRZka40YX3x67AEfBkWerBY6nds
	ZDELP9IcbVG2cHuwC53wFSF0RIy7k/vdXmDtkPfiyvYvt1/3+BtCDW/5fTI6Zyzq
	I0O/djCufRrhZ/Y/3VZjYYCatRvbDj4XeueKoJgV3jc5pcigEWnudrY5+w7Rp4DM
	u6gOjg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyg2ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 08:55:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8bad49b171so2228608a12.3
        for <mhi@lists.linux.dev>; Tue, 23 Jun 2026 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204947; x=1782809747; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=;
        b=HPukpSWtPMkp/Xr3zziHjs4o6ZSJe4Zj04ZtAf6qb3aEXPJ+V5bRSi9xDBoF+GWOBk
         5AlZFaIzUZDJUD0OmrVzMoNresQsl516HH56vWxTB+EIZH9RK+S2d1tG3nQ3g17RTyLl
         AFPBYMQ2IM4nctIbEtTgADIXNE7OMkW4iusFN9P58MrDPnvNRvhWy1xGoWA9t/TgcEvm
         fcB3keR0tUAS7N2TOXzD4tLQhHsncvP/BZ+tN3cqXm3xY8MKtfHAUc5lHksf861tUQv+
         4cohEdxH11zgdeQ5TXTP17U01q2FDtZmDom4l2izhjpimpcnrrM31SkbmlqTTCAf6FhG
         K3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204947; x=1782809747;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=;
        b=svToAc6ZICAxfOggmNt8ekIV3bs1KlGg423DQ9IkBQXpfB5zWldJoYPybg3P5fqc27
         fumqOqy7EvE5nE6UnZB+GMSVOoVGB//oa0U5HgfDgBFGgSUFb2TvHryrlHmgBgIfGO4G
         x/BVk1HUhuhdlL0fjIlZ8zDZTHtOsM+/KbDAHRs2MiACjdTGPFwj5H5v8RIsacinb6Ht
         ekIWxR//5s+QVYtXFUU7iDse7aqUr/z82KZDkxqrpZMAu/bJG2RpsPMRTBfZR4tHyaTY
         OBgw57CbvSBHPV5WIRFU7TQ+tOp8tTfXo9xjoNOW9wM7NPhKPn2M2/neK0jwqlfyG8zr
         DXlg==
X-Forwarded-Encrypted: i=1; AFNElJ+CrV9BYJpnviNRHLp+wgo7SVBwd9YrcnRMhaGhKv2hGO/cHF5AkMhaCpzffXeXUHQUrzI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ErEaMcGjbY6+1QJNYGYo/yg8SFjVwG5fir5tr7wXuiBb30aU
	OoPAvZYQePBRIh6W2qSY3bXNQu1EU28uVn474upggSnG0lFnsikdi2rbTSJzoqIQOkwM8T6ZOlE
	hi0FHSFfzK37/YXVuWZr4dg1fA33x7zzXySzZRJD3fMCkDlpEoC0n9Fs=
X-Gm-Gg: AfdE7cn6eR8FBeagVva0sFjrAQwaTiUW8rsUvjBhRw3RlR1h8z1uRPjfHk9aXRFOtSy
	gGPfzYgysfBQYm4aSNgyZ8D9Bbbn7vccFdBlFLt2z6LIB53cVwPbIXQrMTj9GJtew+3k2Z0RcD3
	R8hdHYkc9dsZRrtATXicMSxQyup/pjL4i2H6VDK96Ar1+rTZUgDwekZY7SDJElr1NOaq4ExbDxp
	f41FtmcNmCNRLiDUFNIC+syAv8PXV7eIuWMalUW+fccgUQ56FYpwTE41D7IGDPgb3M9vXAsqjkt
	05Tq+9iQwTsmiCGdpvIb1HhWeKqpqWKVs9V525NU7j4GEhs2y+I/6rfp2z0fuBmCBLMCBWXjyOD
	8rt/WG4/uzo8wer7DPahcKM4r4dTJWErES5+lBIRer2QMd4pIRJVJb29ZejvZCH/o0nWAOo1mqL
	MA6GgCF8OH
X-Received: by 2002:a05:6a21:4cc1:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3bb3404fba2mr20581559637.33.1782204946660;
        Tue, 23 Jun 2026 01:55:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3bb3404fba2mr20581523637.33.1782204946165;
        Tue, 23 Jun 2026 01:55:46 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3212sm10209394b3a.55.2026.06.23.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:55:45 -0700 (PDT)
Message-ID: <5abb5812-cdd8-47d4-b5a0-33f7351589ea@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:55:41 +0800
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, mani@kernel.org
Cc: alex@shazbot.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        bhelgaas@google.com, jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
        mhi@lists.linux.dev
References: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
 <20260618063309.9536-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260618063309.9536-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfXy7jUkMK7AUPS
 NOGKll94uHYwElULz5JRAhsZm/GlHFvESX6RtZpvi7w5hAtUBH2u7hbIYmHJMiooOYe2UJ5hgp0
 sT1AJfIOrARI/XiHEv4gsGfR5uchgC2yB6gVewH5MxUOC8AJnJAhsk8i4AJ4sk3k6DEZthUAyDo
 quvl0cbEsDWxDr0C2LP7jZYtbwoIgNsDw72rT4d9JBsuJ72CMl0uea1ABJt0fI3NKU0otkzHnTE
 IgXrlPe/ksX70FlG0bbzqV2rggOjI4rgjqa/agE6gndImIxiq1G7WszoBi1wzAN4Jj/KgUDt+Yf
 QHjbvtWRopURqNOfSJf9PtUhxCirW1AvjZLvZu2730HV7xIakgkMMRmu/Z00Dk9YJK+rFkoPp1+
 ymD+8wDPVA42H+QljOjuvFGac1Y4/yEF4qQdtfq9BLw1zVtj5IERc7CLciTNCX+2HsdPGU+BOmt
 8GtNA3LJ8U4lHu570YA==
X-Proofpoint-GUID: g31FuqkqbtDE-1afqKRYcONRLvdH3sFt
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a4a13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_kWzU8USZtXapjXelIsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX9bj1PW7cRUhp
 w8ciM9jz7i2f1/I9HAz0t8N5C3L34taAEriP89xgGCa662gwHCmo55ncNsU6Va1twhiNglX6lHM
 tBsdL4/bfRGbIqH3ZgigI3TDHlacHVc=
X-Proofpoint-ORIG-GUID: g31FuqkqbtDE-1afqKRYcONRLvdH3sFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230071



On 6/18/2026 2:33 PM, Jose Ignacio Tornos Martinez wrote:
> Hi Mani,
> 
> Let me clarify the exact scenario and where the reset is necessary:
> 
> * For the commented WiFi devices (WCN6855/WCN7850):
> 
> Standard VFIO passthrough flow (this works fine):
>   1. Unbind native driver (ath11k/ath12k/MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver → device works perfectly
>   5. VM shuts down cleanly → device can be reassigned → works fine
> 
> The problem occurs with unclean VM termination:
>   1. VM crashes or is force-terminated
>   2. VFIO tries to reset the device before reassignment
>   3. Without a working PCI reset method, reset fails
>   4. Device stuck in undefined state → cannot be reassigned to another VM
>   
>      Unbinding the driver again doesn't help because the device hardware
>      itself is in a bad state. From hypervisor:
>      $ lspci -vvv -s 0000:03:00.0
>         03:00.0 Network controller: Qualcomm Technologies, Inc (rev ff) (prog-if ff)
>             !!! Unknown header type 7f
>      And a full host power-cycle is necessary to recover.
>      

what is the difference between a clean VM shutdown and an unclean termination?
specifically, will pci driver's .shutdown callback be triggered during the clean VM
shutdown, and not be triggered during a unclean termination?

> * For the commented modem devices (SDX62/SDX65): 
> 
> Even worse because it fails during the first VM boot without proper reset
> capability, standard VFIO passthrough flow:
>   1. Unbind native driver (MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver and crashes:
>      [   24.024165] mhi mhi0: Device failed to enter MHI Ready
>      [   24.024168] mhi mhi0: MHI did not enter READY state
>      
>      Unbind/rebind attempts fail:
>      [  352.643601] mhi mhi0: Requested to power ON
>      [  352.643611] mhi mhi0: Power on setup success
>      [  373.442954] mhi mhi0: Device failed to clear MHI Reset
>      [  373.442970] mhi mhi0: MHI did not enter READY state
>      And requires a full host power cycle to recover,
>      even outside of VFIO scenarios.
> 
> * MHI Host driver's remove callback may handle clean software state
> teardown, but it doesn't provide a PCI reset capability that VFIO can
> invoke. VFIO needs a reset method registered in the PCI reset hierarchy
> (device_specific, pm, flr, bus, etc.). VFIO invokes this reset both during
> initial device binding (before the VM starts) and when reassigning the
> device between VMs - without a working reset method, the device cannot
> reach a clean state for initialization.
> 
> 
> 
> I hope this clarifies the scenario better. Please let me know if I can
> provide more information or run any specific tests to help investigate this
> further.
> 
> Thanks
> 
> Best regards
> José Ignacio
> 
> 

