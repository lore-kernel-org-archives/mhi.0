Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC8199396
	for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 03:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745466123; cv=none; b=LwoZdWcTDsrCh8jKhydwsELhvK/QqHqVDIemBlKBGdKLL4kBcAGQ9Nlj88fn/8Y2Qv62BOr40P1h8Op4Tqnacg/YVbofQscQqo/aW+KzyTGjcAopVlmT3DMzLwt5WZBDBJ4l5nP5ghU7YnNNxOdbstjwAwDKiAmo/Xs//ULh918=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745466123; c=relaxed/simple;
	bh=5W5BzrM0WJ2w2/awm7OdlN3N7vhNPwVIM9GxFCZMoSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPkC/N4VVt8WiWhpmrDHtvw/6VjlqzOcDUePkfcTHSheC++YTMFT8OYA41XMXAefPkAM5d24PC9ijHy+CYJtOTsxvCKavh9QSmypC2aQer+n2fkiNTUTlorlZoOnpoTAn9+A8InkbSlx911HCJmOz86ilZnOSg1NmCTEsrSdeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psxIBmSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psxIBmSf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FIN9031170
	for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 03:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WVGQdRDptZRHwzYC6DE/6A3DK+NpkbVSSjhazIbydo=; b=psxIBmSfRCh1dimp
	/CWyAQ59GFvUcBRHLZO+wJYsMRMaTqyRvTuuBwzLKuck311Tlht3tPIWEROBrDZ7
	ROyxBJRGVFVGjC6filgx86qmrPVw3EpSkzz9AB5pEMFiCfkUA+JMDsj3znPYrFDj
	dFb38E5G0lJb5aqPaePFtZdCEoX3tnnejnUKhMgkFt4bhIvW2MO0rp3lDXF8CfMs
	4M+ioxIzJd2KiCJwlSUiBoyQ2O5ekP9DrJBNygxRe3LB5a9oWHcxyEZDWKxD9A/E
	lRghl91t2C8MPJ6VRIQICFNtgWC8wDq0qTEnaXQRnFooyeq+vhH40IcCEp0BSO1V
	lc8FwA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5c3uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 24 Apr 2025 03:42:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b15e08f1eb4so184035a12.0
        for <mhi@lists.linux.dev>; Wed, 23 Apr 2025 20:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745466119; x=1746070919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WVGQdRDptZRHwzYC6DE/6A3DK+NpkbVSSjhazIbydo=;
        b=wUBd6cjyc9z9g7IRGJgrhxbAFu+yT54s7ogquE6I7/KvKcTAV0gogFOQgWlM5HyoJn
         DFzp1bHGvuxQ6iYDaWwrGaGluOXDMylRj9tA6+1GVMLE1BBiCt98GAIrHG0nY90GsRjt
         WGX2Vd9sz0s/0jkxyFSzgZj5lNP0hMpUWTMypp9VBbM0f5Gr9XzoIV3IWQ0X2otyCHx4
         yhg9MdKmamScB+sge7mXYkj/A5P0IE3JhWoGOhFlYmpG9a+pt3/uo9UM2kCzA9RSkHn5
         h9ZzQYiB5UwnAyKeJJ7gjG6Mw7ag5t224DDSy/QDfcxvfTvYSo7JLXn0eY9c1JEjP+R/
         HtNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjTF4ANIGs1+HTd8vaRnGD3hRT/abA2rhYnLLq7DJUkN41z3AiITRw5sdZemqeB1nntvk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb25yYUHsHQYYti+Lz7s3lIIk6rRsDAYrff6YVPPD068nLeCMZ
	tuJzWITuADtw+5W2oL+YEg3cebtbmY03OECHxhm0mpIJqG5nq0VqhSMhc0HRlAofJN63UbVc8w/
	IRDhNwM5xEcJqDrJhiTU4I02TKxbh+xvnc3zK/0YcinBVt81WDGc=
X-Gm-Gg: ASbGncuRIK84kjcRgsNr8PSmq9pg+2aNgMDpUtE6iowVXzg/O86U0w4Xm1u8XjA2YrA
	5/hRpgNPQf6L8SKU8Jf2BFh8emM73Lo2bLu5uWfZaiiIua4nkYGJPs0sht0KFv16Zk9AyEUHk+V
	hkmx/GaOxL1MUf/dYY8+JjbwkqgJrsI2GuicU1KOZIjqW4/4nW6vTAaJhzz7QJBgeKth1Df0mIl
	yjfS+Z8hQXZ0lxPA0XiWQkBu+wYatFmcQUXQmAeeDVqh8VUzmbtY6JfHjKSCDVBGWfqC+Zxr7Km
	3MhAMWEUJtwtBziUaCfAhzE5Hr/11Fx6P1/WRcQsfA==
X-Received: by 2002:a17:902:d482:b0:223:42ca:10ef with SMTP id d9443c01a7336-22db3db0198mr15102065ad.43.1745466119212;
        Wed, 23 Apr 2025 20:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAfBqeEt84G/hl7FYyPFMX8qDUFIFcn5o+9S3uwo2qD3XGpoSr7Ddp6LVoju3RcNuijFCLgw==
X-Received: by 2002:a17:902:d482:b0:223:42ca:10ef with SMTP id d9443c01a7336-22db3db0198mr15101775ad.43.1745466118666;
        Wed, 23 Apr 2025 20:41:58 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d77120sm2670815ad.14.2025.04.23.20.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 20:41:58 -0700 (PDT)
Message-ID: <96c98cb6-b9df-9b44-3151-98ef4ea7134f@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 09:11:55 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [bugzilla-daemon@kernel.org: [Bug 220020] mhi kills hibernate:
 Lenovo ThinkPad T16 Gen 3]
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mhi@lists.linux.dev
Cc: lenb@kernel.org, quic_qianyu@quicinc.com
References: <7y4zwx6cuco5mwkx6zqaz5cox5ken2xjhcxmv4zcftkjcekwak@qijscxptonne>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <7y4zwx6cuco5mwkx6zqaz5cox5ken2xjhcxmv4zcftkjcekwak@qijscxptonne>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyMCBTYWx0ZWRfXwewRVQN3CIKy i0zRD9riyj9+r8kq14wExjG8Ij2nyYooHJCJcLRqw5vhXkGsx4gopkAf68vI/tHY6CLFs0iZgbu VQPCIFh6cCjkS7eogkkeWqB5q/QrDA8w7B4FDNq8MvwgfWVcAIYXG2DNS3DXAar+zx1GUWHFWjs
 aMTADK2I+7Nd2CEhSosI6SnsIwdH89wL92Dv876z7HfagIH+qH5OGuqJ1EJxdjBklPELOAWWpW0 Q6hr+EdOA+mBG06hHzBz5h6MGLJ8E2y2HbBPYxf3xae26Hd4f4HRSvD/MMSGJGY7g/8xN6947RW sf2tf9c3ANM+ENQgKMAFWOWjAI6pJie4aslVie/BzATpBDJj72NEMsgQhjLRXT5cPrl+hlpRS3m
 JN4jnKt65agpmRMRu0iv9bB4hMB3cU6snbmiRS2lzKymnOSoiqreaR9uPBOmblkET6UDoK4w
X-Proofpoint-GUID: l5MADTR0krqy5cTf4SY16ahpUt-w0UyT
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6809b308 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=BsVzi-zijSQA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=zrn4fUwd9DW4q5oO1LQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l5MADTR0krqy5cTf4SY16ahpUt-w0UyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240020



On 4/23/2025 6:50 PM, Manivannan Sadhasivam wrote:
> Hi,
> 
> Forwarding the report to MHI list and Qcom folks for visibility.
> 
> dmesg log reveals that the WWAN PCIe power is toggled during the 'freeze'
> process even before mhi_pci_freeze():
> 
> [   57.550960] ACPI Debug:  "WWAN _PS3"
> [   57.551273] ACPI Debug:  "_DSW PCIe"
> [   57.551413] ACPI Debug:  0x0000000000000007
> [   57.551559] ACPI Debug:  "PCIE Sx DisWak"
> [   57.563142] ACPI Debug:  "_PS3 PCIe RP0x7"
> [   57.563398] ACPI Debug:  "WWAN _OFF WWMT Mutex:Acquired Try Done"
> [   57.563553] ACPI Debug:  "WWAN _OFF WWMT Mutex:Acquired Done"
> [   57.563699] ACPI Debug:  "PCIe RP LTSSM at DL23 Start -0x66"
> [   57.580049] ACPI Debug:  "POF RP 0x7"
> [   57.580237] ACPI Debug:  "PCIe RP LTSSM at DL23 End -0x48"
> [   57.580391] ACPI Debug:  "POFF RP 0x7"
> [   57.580551] ACPI Debug:  "PINH GPIO=0x14040B"
> [   57.581314] ACPI Debug:  "Calling SPCO method to configure PCIe ClkReq Override"
> [   57.618093] ACPI Debug:  "PINH GPIO=0x140096"
> [   57.629350] ACPI Debug:  "TB2F 10"
> [   57.629515] ACPI Debug:  "WWAN PWR OFF"
> 
> <...>
> 
> [   57.894452] mhi-pci-generic 0000:08:00.0: PM: calling pci_pm_freeze @ 4473, parent: 0000:00:1c.6
> 
> <...>
> 
> [   57.894526] ACPI Debug:  "WWAN _ON WWMT Mutex:Acquired Try Done"
> [   57.894618] ACPI Debug:  "WWAN _ON WWMT Mutex:Acquired Done"
> 
> <...>
> 
> [   58.000702] ACPI Debug:  "Calling SPCO method to configure PCIe ClkReq Override"
> [   58.001323] ACPI Debug:  "PINL GPIO=0x141082"
> [   58.002417] ACPI Debug:  "PCIe RP LTSSM at L23D Start  -0x1"
> [   58.130941] ACPI Debug:  "WWAN PWR ON"
> 
> <...>
> 
> [   58.286837] ACPI Debug:  "PINL GPIO=0x14040B"
> [   58.288245] ACPI Debug:  "PCIe RP LTSSM at L23D Start  -0x48"
> [   58.338206] ACPI Debug:  "PCIe RP LTSSM at L23D End -0x33"
> [   58.440299] ACPI Debug:  "SLP TR2P 100"
> [   58.440784] ACPI Debug:  "WWAN _ON WWMT Mutex:Release Done"
> [   58.441222] ACPI Debug:  "_PS0 PCIe RP0x7"
> [   58.454172] ACPI Debug:  "_DSW PCIe"
> [   58.454463] ACPI Debug:  0x0000000000000007
> [   58.454737] ACPI Debug:  "PCIE D0 DisWak"
> [   58.579404] ACPI Debug:  "WWAN _PS0"
> [   58.579725] ACPI Debug:  "_PS0 LASX Delay Time 0"
> [   58.580222] mhi mhi0: Resuming from non M3 state (RESET)
> [   58.580228] mhi-pci-generic 0000:08:00.0: failed to resume device: -22
> [   58.580262] mhi-pci-generic 0000:08:00.0: device recovery started
> [   58.580519] wwan wwan0: port wwan0qcdm0 disconnected
> [   58.581008] wwan wwan0: port wwan0mbim0 disconnected
> [   58.581356] wwan wwan0: port wwan0at0 disconnected
> 
> <...>
> 
> [   87.123353] mhi mhi0: Device failed to clear MHI Reset
> [   87.123753] mhi-pci-generic 0000:08:00.0: PM: pci_pm_freeze returned 0 after 29229292 usecs
> 
> And with 'test_resume' I don't see the power getting toggled. There were only
> 'WWAN _ON' logs. So this might be why 'test_resume' worked.
> 
> @Qiang/Krishna: Have you guys seen this issue on any ACPI platform?
> 
> - Mani
> 
Hi Mani,

we haven't worked on ACPI platform yet, but as you mentioned
toggling the wwan power before pci_pm_freeze is causing the
issue here. As part of pci_pm_freeze the device will be
runtime resumed and mhi failing in the runtime resume.

This may be looked from ACPI perspective.

- Krishna Chaitanya.
> ----- Forwarded message from bugzilla-daemon@kernel.org -----
> 
> Date: Wed, 16 Apr 2025 16:50:36 +0000
> From: bugzilla-daemon@kernel.org
> To: manivannan.sadhasivam@linaro.org
> Subject: [Bug 220020] mhi kills hibernate: Lenovo  ThinkPad T16 Gen 3
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=220020
> 
> --- Comment #6 from Len Brown (lenb@kernel.org) ---
> CONFIG_MHI_BUS_PCI_GENERIC=n
> 
> is sufficient to work around this failure
> 
