Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945C6310763
	for <mhi@lists.linux.dev>; Tue,  3 Mar 2026 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502219; cv=none; b=DrGhywAVWwkDmAbMk7xjs4nG45rLarsDIwxTXiQYTvI4Gp5x9lXp8w5TLU5+mlfF9/md3nXBJPj9Y/Nhz5k8OGtDxH+myEKnATAMNV04Id6biQ3PPkafNCqyhR05IE8SoCTg9VypR7Ahz7GM9dd1FKomGUTRJpM3LDzEbqCz39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502219; c=relaxed/simple;
	bh=i4jKsvabsQ1+RXbVYAM6h40AITuGmmIfVt7gRKhfmLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvIFpr7ITCezvjKmCLjEXzDDe0xje8lXSbj9rJdv3Ruvw/zah2ztEO1z89LHaqsJwKiwWsV3H7QoSa5LbHcsrYU2ISgIzseSy6TeapDgrFr96TBQ+f1r3fTwChWUhAcBkqQfVHCZlkCxsco3AAScfi+c5ZTwXxbINzGYlmRy+VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdKPqX1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TtdV5bLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdKPqX1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TtdV5bLH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622Konmx1675548
	for <mhi@lists.linux.dev>; Tue, 3 Mar 2026 01:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wa8JYJ97vCRvUAnb2y8s1hFO
	Xb0oIDwDms0q0c0b36w=; b=JdKPqX1K9NM9kN6DfxloxPkOSgLkwDNhsSwci01Z
	IPnRnC2BkxwjXR1MPo1m/pYjSV5PMyzTaueRt6wEpR+2kgZDDceDDMYslCjUOz7Z
	pryos0GeeXlRU49ghlHBTmy417PvmpHG9HEBljJw8zZI+9ZA8qYmLJg9fGseYyjx
	k0jRmdYZIPvjQZfeSPD6552wyfWpaQRSskNbWwQYcB3issI7yRScaXLrZX+MDlK+
	R7CjBp3l7RQUw72TCyLZuoz/TAR+7ex+buvotD8GNuk9oT2TnqAIyru+X7p9jOWi
	Q8wPjmJkSJez46/JVKEOSlkvMvLwSqMFYsV6uXtSneeucQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxs8qsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 03 Mar 2026 01:43:36 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f0bfd68a3so26301537b6e.3
        for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 17:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772502216; x=1773107016; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa8JYJ97vCRvUAnb2y8s1hFOXb0oIDwDms0q0c0b36w=;
        b=TtdV5bLHrvusbFMMoAoBb0SFz35oVQkQAHlv0QcvXMF8Ht0p93IZR4XByIQ6+a3Vc5
         cIC++mgMEzRIOOUKym6pRXxVPqkWy9jrBMnArLVNv1cHIIV+dsRmxW3XQNWoVq66iTxT
         pSYOaYjjLQvTp6867zAJm+BDRZuVvTDRU1WREHM0ZUQCLvcdjSltKkPPHlRtfbbYHAXI
         n2Te/uLNiBx5dSH8K2bdsEtf88+SRKZhkYsLK+Dy/B1P3o3ZQVvVfJdWDYjt6b7M8hkU
         tZL8/8SZkWf+2/Ztvgx6M2mYC3rOS87D/Sy2Am+5ed1W9dDVp26d0fZu6AONeu6DiED9
         xjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772502216; x=1773107016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wa8JYJ97vCRvUAnb2y8s1hFOXb0oIDwDms0q0c0b36w=;
        b=PK58Bbinm4r/M9gSAvlHMhL9djFr2lm/qTMdyOSUiyIZfsey1+2j8rBPVmjEyVIMKk
         oNK+9cAIVLhoWcO3+2fKVHEeqCKbgvx3XxWn0kw1VNTYd8NcuehMu1ds1QOWZ8n4DDHT
         DqnTg6nEeVl+xNR3ALmm7vnyqXJWKCuy9+HAEmyguLBzxQteMif6LIJlO2IrLqscZSuJ
         vAwPWotloy7JpV9exMvIB3ojQ/RFMU2S7+uf15WxJId7f0cYDGu5nTYdik94K5FFbTaj
         eVaGqirDMtQMrekBs1T0Rj4U/eRBdfeHKg7Wuor0fHN2ObUO5l79vwH2UCYLl74ttIAg
         +3xw==
X-Forwarded-Encrypted: i=1; AJvYcCUvvxJ9tNR4YlfG1NhONgxmphBIq7vFPKs/QUU1IqtURpHcadU+gAEK/EJ3/qOnbXG4ZBI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKxxERTMVITk7Iyi72ZO26ngvu5fU4mbaWX2rDPgj1ydXaKvfa
	LOBcrCrEWz3VBwocJLlK/xQiARWRBjUYwPKj3Ygc/SZPYUqR1YDqYoLZcw1gI0XKHsLdVYy5dSO
	d2s21+xDx0Y8Qk7RYhIsxiiIyKWGB65NtwOjiu3h7ZOcoyP4ycjdeEF0=
X-Gm-Gg: ATEYQzzQ2YvJIaXv7961ow2+BhFsX3HoGdqfPC1Me6E5v/w0uOkzSIZIncbJtcQhv6T
	WV2na8lPuBWcvqm9zAy06IB7yJHrgx1U9+vq90Y3E3A1r+pB1dWVI5SXiva1Fev05KzZGVTHwd3
	ZuAdaEg4Elk3LNuVlM4uS8OBXKergLUPs9HFV2fEdQU1E01LCDAwlH/Z1LwQxeG8jW8J1Dbz2PT
	CNw51ryPoRmfzGU2EsQ4EihalaT+GGFfrnxfrnDkOSnaWciljtMzwopAB53suEYo1V39ZS/2eBO
	jicoh2vQkkY3ebR1gYXpAu75EAxz2C95sR4OY2NOBJ04yeasVBFiqGXSDkHI6bg8zF0EXfK0iRI
	SaQLMYCvU8UR84Bd+LP1jWLJqyooJsHACLLdJvOGCUAsQQfq395WqGVv1gWRNR1cWwgap
X-Received: by 2002:a05:6808:1b28:b0:45e:dbc8:7b18 with SMTP id 5614622812f47-464bec215c4mr8174463b6e.13.1772502215927;
        Mon, 02 Mar 2026 17:43:35 -0800 (PST)
X-Received: by 2002:a05:6808:1b28:b0:45e:dbc8:7b18 with SMTP id 5614622812f47-464bec215c4mr8174452b6e.13.1772502215536;
        Mon, 02 Mar 2026 17:43:35 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm8509256b6e.14.2026.03.02.17.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:43:35 -0800 (PST)
Date: Mon, 2 Mar 2026 17:43:33 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Resume the device before
 executing mhi_pci_remove()
Message-ID: <aaY8xfPF9j83aM5X@hu-qianyu-lv.qualcomm.com>
References: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TAjSCzFuSIqXRsbHnCc2zLz_WXhKRDsW
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a63cc8 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mZK3EA3oJS9YODrgi44A:9 a=CjuIK1q_8ugA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: TAjSCzFuSIqXRsbHnCc2zLz_WXhKRDsW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAwNSBTYWx0ZWRfX5w60pJfdLBjI
 xgQ/7UUOT5hnb3Rebi+ZtLpxoSn1Z4gBEw3EcL3OBEUl9gp9EEQvegsTlqQtCRg1/S1Nv5MztfM
 XUpLFVeio4PKOwfROPGSZHrYnkuhWlhlMKg5eCKSSQfsrMSpVHFgJSxvkwxwuZnINvvcW1D4dFg
 RUC9kVhqSVkavdGEfTydmKN6/iNDVPcDTBvMI2uzhn8981fJL3O1u9IkSdSfWyMOPbrsAfychVh
 yBW4nH3Deg5jzbHGTk7NHqBRn78j33xEQAYSUCAD6+Ymn/o5j7Uuh0youyJZwKq4lVCHf5rtHEJ
 L0yry+Z9MTBhzwB6886Oym8tykwIGismVh2UKQpzNfn4XzQ1+MRXliIuLNgBj1WGdE6M7iAsvuB
 hxALzVVaGSdmsOHDSzVf0gYW3ddD/Gv8e1BJuZmUcl6TUBptuvzPysQtiixrUSoQXoYxbBOAPhh
 Y6zJ91SmjD/weOeFLgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030005

On Mon, Mar 02, 2026 at 07:11:16PM +0530, Manivannan Sadhasivam wrote:
> mhi_pci_remove() carries out device specific operations that requires the
> device to be active. But pm_runtime_get_noresume() called at the end of the
> remove() will not guarantee that.
> 
> So use pm_runtime_get_sync() and call it at the start of remove().
> 
> Cc: <stable@vger.kernel.org> # 5.13
> Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 425362037830..fe3aefa15966 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	/* balancing probe put_noidle */
> +	if (pci_pme_capable(pdev, PCI_D3hot))
> +		pm_runtime_get_sync(&pdev->dev);

Mani, I don't think we need to resume here. See drivers/pci/pci-driver.c.
PCI framework has called pm_runtime_get_sync before drv->remove(pci_dev);
Is there any other thing I misunderstand?

static void pci_device_remove(struct device *dev)
{
        ...
        if (drv->remove) {
                pm_runtime_get_sync(dev);
        ...
                pm_runtime_barrier(dev);
                drv->remove(pci_dev);
                pm_runtime_put_noidle(dev);

- Qiang Yu
> +
>  	pci_disable_sriov(pdev);
>  
>  	if (pdev->is_physfn)
> @@ -1451,10 +1455,6 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		mhi_unprepare_after_power_down(mhi_cntrl);
>  	}
>  
> -	/* balancing probe put_noidle */
> -	if (pci_pme_capable(pdev, PCI_D3hot))
> -		pm_runtime_get_noresume(&pdev->dev);
> -
>  	if (mhi_pdev->reset_on_remove)
>  		mhi_soc_reset(mhi_cntrl);
>  
> -- 
> 2.51.0
> 
