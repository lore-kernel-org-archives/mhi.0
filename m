Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476413644D4
	for <mhi@lists.linux.dev>; Tue,  2 Jun 2026 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420224; cv=none; b=DLMRCuMVwsQOt/hwOo/QbB1xdI9pkEaokpOt7PZGFlBN9w4vvJde30I14W5jo9fJVSG4vdDXFBYONalzZ3mdBpTHw796ZRZeuVEO21TksEML+6e132mJUiy/vogoM5c5C5GlKCGfb7k4tf4AOjV+c0+K2x0M6nq8Qur90XdI0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420224; c=relaxed/simple;
	bh=EtD5/9vaC69fMoxqqSkuAD764a7iBGKyoM1iNno7R5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cotFLdo9vgG8FgiZ1VkfmOHYCEQWoRPgdU2cJYaRZuNBkBLE2gZo62tipUENHAFHJOFeO7Kw4Vwg209AGoufkwoOopLPiJOxcxhgX3lNfx+oPcDE8ob2doHdJGD5D76qsEMoZcbZ5IrUksqt0Tt5kuzDuWoyla85vbQE4q1C1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvGqCcDN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cN4yzy4f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvGqCcDN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cN4yzy4f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CXvOg2688188
	for <mhi@lists.linux.dev>; Tue, 2 Jun 2026 17:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=; b=RvGqCcDNYtozPEiS
	CYLS/1v9wUP7ra0dhlJpkOOhOO9laDsk8pM9hPeXxK2WSDfiJHmrX7eFDeIFjW3R
	Vgw8CYBJaPcJFi2nEQU4j38RE6pFJj87Loajsn/11q7Ti2dR1likcCeJs92naRtY
	Q9lv2IuUqBxXxgwp9gDI3i2H/qdn7wzTWmWW3xr1EQ423C8Rhv+53dkRve0d+xBy
	Eph0XrYHFm+6BXqeZQAtX0KWK+FIA4NgaCjGLSZikyRuE6b9oDJ1jbk1D0Ec7M5C
	CcRXcOkAQDdJZe/GvFazntD3eFruKEWa6xGnpg/FtEAdzmtYkc9uy+3qxq4zvwAT
	RUqbOQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsjaaqrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 02 Jun 2026 17:10:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304efad654dso200546eec.1
        for <mhi@lists.linux.dev>; Tue, 02 Jun 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780420217; x=1781025017; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=;
        b=cN4yzy4felVxrvPkt12idly0au5uswaOloVWMSjqASqnz3MyAWZuPkF7FQ/gdE6FWZ
         iUYaD2o1wBYPK52quN8R2RppyjQ/gvkCdDYZCXuircEA9gnYAEW12RROGoXTU+s96HY2
         xsVAqlkuUhjMjkPDBhAy6SuFycbQEyVwnfvW1aeuzLHv5bPulVEOFt6MaLF/ZHp65GyK
         FnKP9H/dhG4ENPuT52/5RrOGbq5YS/kHIfV4T9Zc3yV+z04wyvcFvMvTrIH7RWLjD7yF
         fuk0b6X75hEOvrC6xO19FwMjK85g3fNsGCrglTMNKH28GaAz+FRCTD7UJWIvkVbhkHnF
         hTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780420217; x=1781025017;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=;
        b=MVbJzY6OE8jYNnFOEqSsjxYIVMUU/poE+LtEVrzL6KcwALl+K9KMz936Nz9nDmdRmA
         cMlPNR+Pi/nLCLsfCWZ2ajxaOUFnpza6cNZzZQbv/twXl59Zy9TXT021FeH0JH4RhbWD
         m5655iqKTwAA3eDbpJUQaevJj3ZQnEyk48Av0U3kym1ZzslD5xTeQ2YqrCAOGjgCQw0S
         vkrDYCmpDZGzbZ4B7Sp7L/gsoiOtgISZJLyYJE3baoZTAbWLubrYKw3fn6Io6FYU9QG7
         6U9ZyY/VOlwsfl1S88gIjHTIgOTKrniMResld0zWXPZriRn+uf/h9qaDEmsoxu2mee1V
         jCXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+StZ2KcQ1kvXOyuXDPRNmuZMtsa63sd+ouDNd09DJbm9ZT1VzxmTzTOUZkoVgrfOnOboE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOzkT83a6nSW9ZEiL87nWB7mtHDUsDionsVwbAr+LrTFXcmjsG
	D6ONU/KqZ5i8Cq5bEWTG32WcHG/GkuYIjWz2WCdoPxeVS39+qL+jjDUj08xy01cE83qhokTftvD
	QE4spR1QZlUyGklM3ux+HLh55bJ4RB5T3CRUwbRhzwTjwNjZdbyPnHcs=
X-Gm-Gg: Acq92OHjXhvFi5UYsIffNHVNs1I1Al3g4jQtugZTfozNzhgx111XY5l5eh9rbRVpAGf
	3eyWDRRLfBONK0qrHNarca19wXzmHFt0ZqAKqv3Nyg4agsBdeXkSONuzVXETpkSZUjBEtQN6mvV
	2ALYcxiHGv31F53t6syJdLvBC4NZSyNIlGtlauUU1Ng0MfDh1KMZ1CHspFsOrpEAW4z7Mz47AWm
	obCL6W3xabCu+Y3jfqWxf3dUqq/GcWIXLjKd7AoM1FQFbNS89Yo/+6v1mawvh1ylfKZHp90kcsp
	oT4G0AEDlYonQmJ0/GPdbQ3FpK1oEK/ni+FMuyorAKauKVTWHgi8qQh8lsM/E/U/jjIqskarBEO
	lovpDhUhhBf/rnYlz0uk5TVEroYPLrF53LF66OJNG6tTEEuMwrlLJJ3xSB5TUW5HzhsjcOBEfmh
	2Gy7h5kPxdXJUFdtb958IF2n1H
X-Received: by 2002:a05:7300:ef83:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304fa74682bmr8020175eec.33.1780420216914;
        Tue, 02 Jun 2026 10:10:16 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304fa74682bmr8020119eec.33.1780420215911;
        Tue, 02 Jun 2026 10:10:15 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm12470560eec.18.2026.06.02.10.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 10:10:15 -0700 (PDT)
Message-ID: <dc836218-2f18-4465-882c-c41b5289c379@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:10:13 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] PCI: Add device-specific reset for Qualcomm
 devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
        alex@shazbot.org
Cc: jjohnson@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260602160024.1171949-1-jtornosm@redhat.com>
 <20260602160024.1171949-3-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260602160024.1171949-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2NSBTYWx0ZWRfX8DmWjtCPjBKK
 7ZJCferWOK8mZQVHRk1j/w9r2V7PppVgWEFUQQSYGf6yNtUjK2oFJc1vtt21iAJERKxlTvNd80A
 8RJYNAiJMBqdriu/GH8uMIZjiaibrs/MSOcHhOqMhmPKpFvnwffki0qx0BTADBmgoUJ76fnoVwZ
 N8gC7qlGbdmxEj8UvBZJM58q/d2OEVNwr+8bf0kWHAB9Sc80AXw312uZv5fLTYWrusflMaKhUjS
 H0N/uChYMdpq7wabeyFymzbA9Tob01MC/y7qXS7+fKHFpbzgHs+YMwEsekT9lBCqdrwtPG1dbAU
 izAbjO7W/bR+/crbEYb/IR/WwO3/bo4RCu2Y+BV+86vpP6y27pDqkVp4AK0n4ZfVbSDqDXAF5X/
 L9oiNqh3nqVsvvRcMkdHTje2cFgda1k7lOlge/OBs8mAYRw/CTNUw4rrZ72vqKDFrWX9iPxFMt7
 OCi1vPEC04+HVtfw7qQ==
X-Authority-Analysis: v=2.4 cv=Ld4MLDfi c=1 sm=1 tr=0 ts=6a1f0e79 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_dsfnS01iu48ROCZzqsA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: cM-6eOvoEpZmzsMg_RFROsTX2Y-9bzZH
X-Proofpoint-ORIG-GUID: cM-6eOvoEpZmzsMg_RFROsTX2Y-9bzZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020165

On 6/2/2026 9:00 AM, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (ath11k WiFi, ath12k WiFi, SDX62/SDX65 modems)

Throughout your series you refer to ath11k and ath12k as if they are devices.
They are not. They are device drivers, each of which supports a large number
of devices.

> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - ath11k WiFi (17cb:1103): Normal VM operation works fine, including

17cb:1103 is WCN6855

>   clean shutdown/reboot. However, when the VM terminates uncleanly
>   (crash, force-off), VFIO attempts to reset the device before it can
>   be assigned to another VM. Without a working reset method, the device
>   remains in an undefined state, preventing reuse.
> 
> - ath12k WiFi (17cb:1107): Same behavior as ath11k.

17cb:1107 is WCN7850

> 
> - SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
>   on first VM assignment without proper reset capability.
...

> @@ -4252,6 +4268,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  		reset_chelsio_generic_dev },
>  	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
>  		reset_hinic_vf_dev },
> +	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_d3cold_d3hot },  /* ath11k */

s/ath11k/WCN6855/

> +	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_d3cold_d3hot },  /* ath12k */

s/ath12k/WCN7850/

> +	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_d3cold_d3hot },  /* SDX62/SDX65 */
>  	{ 0 }
>  };
>  

same guidance applies to the 3/3 patch

/jeff
