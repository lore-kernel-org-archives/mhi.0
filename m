Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9D22538F
	for <mhi@lists.linux.dev>; Wed,  9 Jul 2025 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064796; cv=none; b=ESONrzeer1YIkJfP97y1tLtD4wyOSkAvL/Ny/i/2UiPBcLvmRHJ67pZ3p3ZAnSZ52IRxtaJ8Ca+NLDGqfnf5ut3jZd8NrOuUvPlbhfL2Da/wZ2KHjmsC1MbG1f9uuxUghilTUZFedC8uMKfsBSbxXR6FNzRVzBqw0nqxwzf5TfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064796; c=relaxed/simple;
	bh=CzTpBjA2vitR+omBvLXiUIC3L2PGyotOkHTVKMqAEec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HabgPN0+p3xNDhVTrf/frLzDyUQWXl8fb4f0g5A1NtnSn6qusTpPWlFsutiN5eC+LU00PsIK1IzDn4J9qwQbmCj1KzZREY5piq21ghIT2B3r3eh7nOzCESndb8MluopFlhY6f356/838zKjogagDPUM3evPEMCHDQVgGEBTlgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drdx4gKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drdx4gKN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697hRqr011366
	for <mhi@lists.linux.dev>; Wed, 9 Jul 2025 12:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4JeUBjGXjiulqpr8ObtMjmD+OAC5jcVrNpe3NW17TQ=; b=drdx4gKNJBEiVjKa
	pFzbQ5pKPXyrrXPMylxglnTaYC5rvnvPvEE1jIX1VOgObjerKAlkVUWIs54yaTKa
	giz5vaoOdlDUKMe33JGPz0AfkwTmcZPVIqUXcK0ErkBHlXYs3qNgt3++8qHm3v9I
	T5/8IK5yLxUgE+xYwVH0F35FHemlOeqr3kPefKSspmdYFAZs/EqoC07NJmEVBfbT
	TXxl9uEJPQtU4+rMMp3hSiRd59vsUycUOF+tWFSF8PFULdaXg6vEz/XRwY4o40zX
	UWB9CXGSkN6rm/V/BTsByrL/83AzAQjznWIiPCxd0XqU+lUxatm1B3Fw+tt0OgAg
	uE5KfQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9q0y6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 09 Jul 2025 12:39:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso8251207b3a.3
        for <mhi@lists.linux.dev>; Wed, 09 Jul 2025 05:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064793; x=1752669593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4JeUBjGXjiulqpr8ObtMjmD+OAC5jcVrNpe3NW17TQ=;
        b=THTZGEMF3JmY/wHwQlmHoBEW2jJvyqF9Y3AJMdu401I6KszRaNKP3YDkQGfrwT6Gp2
         rb9BemFaMQ9fS7W5MRO1r9wgx6s28ui2z6b3QS5HCT263nC+YccU0eiqz9M9jAIpPqIB
         kTRQzZ8cYo1V6viX1gOTj5XBhqSRFfJ2CkSJOmxEmSJBgviQ3RJgdUF+ISGF+Yoy70aG
         Nly+wu07hEt4VsoMGIZ5vf29zUes0ULMvqSeh8INPzTKB/O/QqeJfo03lX+B4NhjbiD8
         MYC7qavFruqGBryRUWSHlE2Xt3oC3lqgP0P4/7cjDloJJYw/HKDGllqnEiVVMyuebbHZ
         a6iw==
X-Gm-Message-State: AOJu0Yxs9NYwxD8zCuI65v4xYJKPcZgGEMulqcYiVOPp7y2PVGc9gFeC
	kT/ZB0nDmgDgRwiAzDJYHyzWMw57iNFOc688llvlIp5LTMMbwUCr2Bkc668ZPT5W/L04rqAebP9
	RVtkWgB3ldLY0RMMA2mgHGMDqott56gEobvQqurobI4d+EGGS2ke/4lWGPsd/FNE=
X-Gm-Gg: ASbGncsiav9aibemn6Qde+iRXtU88SZYCYnBlVUBeNUtlhTz5t6W9McgQt8Z7PpOhzV
	AuzTPgWrodOQceQk8WO30ETuxshB9tudNpU0+9yYPr2/BJJYcSg7vskDDTCqJCFaHP/aDXZ/Nfh
	Q6UbmWLyTKOUd79o1UpTyclhcthLT6TPhlYtdJsQcCR6TmUuhQN8W2lRrJ+QU8PzbY0NMZZGYBE
	zIk4kM+1bdBddgodD60QnjKbPGN74WzKHOc2HcHL/SOAcdB+2XWDCCkDbx96bCYxT1dzn6qw2vQ
	gZQFDMxhTwWv/6gQCtAkp0VlG7lnzqSDtgeI7CDzyJV2HGAQtjyJ
X-Received: by 2002:a05:6a00:2445:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-74ea644856fmr3569753b3a.6.1752064793503;
        Wed, 09 Jul 2025 05:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK7VBdZMMbsnBq4tAIekTkIsp6YkexavIr8EuGi0wWr9Tw52la/RWx1TJ63OSStOPaGoyV+w==
X-Received: by 2002:a05:6a00:2445:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-74ea644856fmr3569718b3a.6.1752064793079;
        Wed, 09 Jul 2025 05:39:53 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429c46asm14970330b3a.129.2025.07.09.05.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 05:39:52 -0700 (PDT)
Message-ID: <7ed53821-c86a-41f0-bb99-ff43ebedd680@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 18:09:48 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] bus: mhi: host: pci_generic: Read SUBSYSTEM_VENDOR_ID
 for VF's to check status
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-3-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-3-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7N-YWVjKPpNUKDhh-XgN6yUuqvYBM2u-
X-Proofpoint-ORIG-GUID: 7N-YWVjKPpNUKDhh-XgN6yUuqvYBM2u-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExMyBTYWx0ZWRfXw35CmuCt5Mvq
 3Z1JBWGiKuPEoRvF8jq80X7IUctXKD/VrOmjvWfSmzCESUp0JfBd2HBgoGEWKp7WIAJr3SkO19D
 nKEyxb+qm6TW4CCCP4mHSEnv8iBmE4V2ZoAAd30e69m5EAywJQ6YIo2XZcoijkPTP175Zcoov58
 +IkF+Gd6rfk7zghZ1qEKkMk0bytcc5BnBYaR1cwZgUEN5j4MP9pT+tT9dWiQgP4kdIViwe/bPRw
 bt5XvfcilOu/4+9s2THsxHbNlc2T3cIVgJX0iyWn+fV6P5esc+4gW1b7ls+4g2rFNxNz+nMW+QR
 0SOw+Kl/zS30Hp21JhtrM+EHN0hTNqh5bp6h4coeMwTsXFy/VGvJb7sHgcS2JUEcccTnVka2KLM
 9RQF8wxfxKgXrh3P8ErP8IS4LNMIoIAexGSYXOZqZA3vXbLw/X/GMphPizvfOLlzwwpE+08S
X-Authority-Analysis: v=2.4 cv=BM+zrEQG c=1 sm=1 tr=0 ts=686e631a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zv_5qE797hUBxoToDSIA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090113



On 7/3/2025 8:39 PM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
> when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
> SUBSYSTEM_VENDOR_ID to check if the device is active.
> 
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 22de02c26ceb946fb618d962ac8882d2db1be6b4..938f37d306a18b9a47f302df85697f837c225f0d 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>   	u16 vendor = 0;
>   
> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> -		return false;
> +	if (pdev->is_virtfn)
> +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
> +	else
> +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);
>   
>   	if (vendor == (u16) ~0 || vendor == 0)
>   		return false;
> 
