Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA12571A5
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151393; cv=none; b=FOUHu71X/51NLcCy90ACazcecO2Bq404Ra/isQOqcetFLwrcDJoTU0ou56qB0bi61HL1nV/WESsJiqVwmu6ebKGq08MVhqnazIij22OenjBh8xRaDtbr/cq8Eu8nyMc/cQ7mKWo1SUMoYR6s+GwygETH8FEvgVM1YlTb2HyEZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151393; c=relaxed/simple;
	bh=qBFhK1afkV4m7aBBOosJ2f1pVgbfITnIKsst8TKTNfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqMKtWnS1PkfX2qxv4dFN7/MAlAEfDfiuOTj5CDE0HAbNVKOQHzEPXA2yY9Kxdh93GCh9O/bjgq7N2djhqS2UDuw2jEOPNVm2oD/AzrHny8CMKqiGJLa6WSbqW6ayGnBpfEMdoEm4KerEipers6XOu7XD/OaZv9+z//ZU8ceyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2BHkvSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2BHkvSI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9UNBV013096
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYTkxuuxHpA2VyCMgJOS//3tQMwdPfUJSgKrXX2iCCg=; b=C2BHkvSIoZJSOXZq
	CXdYM6tfFv8SDXPQqgpBnuN2gA8gAmbQ7qwNkYdtyb2/G+ns9vkVaXghhAcbgSXt
	5rFQwYga9olvEOu5CTiqi5mRxF/YLbFkfZIToEVnqntoZvNdgWEJoLTB08ACEEiq
	jiNuRu+5vais+df93bme35RJOKuqNDkc6bTcpsPubhbdG+FClqaApEfVVpujq7EZ
	sZ/lBLSbVqj+ZufwPlIdVtdjiF0+cWIwvDCyGuqHfouP4goH5ua4J4lwvd9DakMx
	gBVfzNJwJQ4hhDPjwwvoEeuMGJzDpYoNWLfVUw/6XgGI2V61qEsV45cJX8CtaQxk
	so3g5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn8g06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 12:43:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43924a1bcso2268901cf.2
        for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 05:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151389; x=1752756189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYTkxuuxHpA2VyCMgJOS//3tQMwdPfUJSgKrXX2iCCg=;
        b=s7jQZx7mdqSw/DR4GNMvNbthM8Mv0jt3nf89J+jGVY7qcC4JZsOnBcpw9JQJABAFCg
         I+hpz22j9OzzHTlSy7qHIfi1VfSedYSFGNd6AwcOC20mwBdcLMlWyyasaCSFWFAUvDtb
         GhNHk+v2185qXPyFe4yFW2zFdPs/LZryvFAgNHi6dQzZbIQFB3XtpX0CSU4fjmiNpEIU
         ki2lwycN+/Ct/vExsGvNV0ny+/R+wNrEYKAeMlRAC8mx0ZJ3vMv9aHJGb2vbmNJtOafq
         NBkXVED++yqR1FOJPqdM1ECSnUjHV+TJqZS8BNSHSBd5quJJNr1iTZCUCberd328oRON
         ew4Q==
X-Gm-Message-State: AOJu0Ywtgrst28Q4Du0f6HqjsHBXod406zMD8pkEHkOpxSKZWCmZYNDh
	R+dutw0K8OlACHVER78Zdz6j05t24jhUSXb1NCC2UIeZC71Q0GKVRpRD1bxAzQ7Zc0HiJBSEhtA
	LSZZx2AfrKp+tpEnMnG64D/DSf5wp62A/VaigeQWWPFdcly51kltj2yk=
X-Gm-Gg: ASbGncvQDPuQKSp1Hrj9SL3zarsCitWioUSEiiFnG3TFK4Bq+oE5HIH7LVT5AlRrMIy
	1H2Nu5XCKiXcL5gTbUIgnVCdeNfziaZVxdtNDF91PBK+3ucDndqxcAM6HBj4fEENdByx1rp0yaf
	v3j8x3XVhfh6uIvYhPOKf3rBuzi2vlD7BDgptWzZ9H330XYPMP6HmAiPVMz6PM4z5xZIpkDO2ZY
	/Nj70koJX/Bcn3dZ8kdW/C50r3nnz/UmQmGht3p2gHOVswbPIefudwN0A73vtQlL6rvcWF4/u/6
	LEo092QSHO/Xn2nbjwq21Lhw+3OGB95lwqVkx9N2L9eBnKh0C8LZkQ4fUhdz8P0qgLisv34kEAv
	H2/c=
X-Received: by 2002:ac8:58c4:0:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a9dec22598mr36676111cf.1.1752151389317;
        Thu, 10 Jul 2025 05:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRbTSEuEeV2umL8ashTgvApRLmR4nY0TUzJVh0ThLvKrhyZgdrRc12SQWS6A1FRWNQ/HFWnw==
X-Received: by 2002:ac8:58c4:0:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a9dec22598mr36675821cf.1.1752151388712;
        Thu, 10 Jul 2025 05:43:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294b5fsm124039166b.125.2025.07.10.05.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:43:08 -0700 (PDT)
Message-ID: <684a8db6-ec47-44da-baca-1b16a33002a5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:43:06 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-4-4bd862b822e8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-4-4bd862b822e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686fb55e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=H9ftyYl3DrAdAmmota0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6UqOssYnrgExMakiHSQXVxG4j0ixx2XP
X-Proofpoint-ORIG-GUID: 6UqOssYnrgExMakiHSQXVxG4j0ixx2XP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwOCBTYWx0ZWRfXzt2d6BX4Qaww
 G6daXKTJx5Sgwznu4ms63kX1omnqAHcX36FxImoiQND9beCnyxWXb1E2sNe973CD933O6jNJewx
 YxRewkPIMTUJYUNmXpB6bxXuTIQS4YW688oN3azSX1YL6o2bDOrFzsMOrcfIU1BxQqIAH16Krw2
 7lFBdBj8D7J7L7NyV70ASNreLKzq3mmVibwfQ0L2tpjmRmCnxyB4cmfqnpC7Rg+IAXLNSrV5xNr
 8wCUc39RqFfSFYNaiKFChba2TyMVCAAnUTxKwjtwYPi4LMyHK7XKZdeUZGxCDr1t4c2x5OoC6oJ
 BcxlD3pEaL4cPtp7ohgC8l8a9iDfUOLwSBee1JYGt32audua0jCg/TYEOuTiB6vJtncEk5s6AAv
 36EvUlCUDZYpH5zIm1WHrS3ehX5dxjMOk+oiTdVFnly1tJqN6Fk5oXUygzlR0XENaJBlWOxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100108

On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SR-IOV support for PCIe devices.
> pci_sriov_configure_simple() will enable or disable SR-IOV for devices
> that don't require any specific PF setup before enabling SR-IOV.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 2d1381006293412fbc593316e5c7f0f59ac74da8..a64b5c365c920ef2edfebc994e82d6385ad7ddbd 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1640,7 +1640,8 @@ static struct pci_driver mhi_pci_driver = {
>  	.remove		= mhi_pci_remove,
>  	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple

If you add a comma at the end of the newly-added line,
future diffs will be shorter

Konrad
