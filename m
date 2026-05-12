Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9047A39934E
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596106; cv=none; b=icje8tPrmyZEDu6bWhU38CD3PU1Vq55JDlDCNvo3QfeBiR2pioVrxH06Axd/R68ZRL36JocIHODkVCYxErkvZPACTtSqdwNDzNLIyNkErfxJ/AcMtZlSbkCepAc9lU4Gj/eF+DJqLjKqQWmOCpNoOm4LRrlSBk1teL7TlA3ASHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596106; c=relaxed/simple;
	bh=uLUHB5KcluqX5M1aWulElpZ4/ot9grCyM6SfFXscUho=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pcIkzbNNelYok8xX2tFhvgSjVKkHPL+hRNzqBTDJQ8IxWP37biKbseaoQHK+G3LR10rqyYojIq3nGgABPC/n/XJ4upI+kaKtmmy4gp8LenwUN2MqqegkcjM/fYVjChGWV58nYKL1/e83MU0iQBiPouZ81qFQWysEVeNTNX/Z9mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqB9MqyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyNR4jbk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqB9MqyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyNR4jbk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCKvdo545069
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qEkfNJ1fR5aqnsSsugHtlbRXrkH2B4NHC6uM/3ZtOQ=; b=LqB9MqyMTLiGppAT
	3ehaDQ5u5tW+G9NiPhz9v2dys8Z1ej4FnSfPGLBNBZzB3gCVoFJiiTby6eByzN8h
	WLq+1FB2G26LAEDkjjH/ziv89/4TklUTUUDbDQtFArqNyVMJcxP44PQSf48YoJj7
	mB7J+ZxI0JkemA5qCfWBGElsSw+AOH1WfOXJG8uH+GjgaUCTXsouXzgKgX93l41C
	eteaMq+MDpz9QvORo5nYhx96bGhfxvr6XtTDs9soHFQYmclNauSvRUS/120WCcjL
	y969+OSvvOkL7vyhynq25rDSuExU+HxK/kpeAqx2x+2ZNUozbtU+hHmnqjHjaFGR
	dzuC3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444srf8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:28:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8271fb4407so3400489a12.2
        for <mhi@lists.linux.dev>; Tue, 12 May 2026 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596104; x=1779200904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qEkfNJ1fR5aqnsSsugHtlbRXrkH2B4NHC6uM/3ZtOQ=;
        b=WyNR4jbkcIhnIuef6/kegmOaPAkXCZq8FZK2PGG7Ezu3YR+2WYxUWboOz894pEF9aF
         siu9P0DfM+vDWyy/g7lToL568oDrHGDFB4ZuKD2c7GjZU8CMzlDuAOOV9qiDTnuNnEum
         MbckbHrbeQDVQPs+PN7AfNkUsvyb9FxJEBEsRzwMUEPrJlMKfKFm0mEnZH1+HeQKhbAW
         YOCGkBHgmOSebbGYHjMpro2whCfnbBWRKioWPPBSOzjx4Xf7eKON8S6TvR4UoYgPL3lf
         1s6ax0jjiF/R9Dr0PCCyHZB5JbxyaQWLas6ZR9RJicnR+vfnscxkUHLASke1nRse+/n2
         6Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596104; x=1779200904;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qEkfNJ1fR5aqnsSsugHtlbRXrkH2B4NHC6uM/3ZtOQ=;
        b=X4s36awvqbBQZoiTIEiAnv9UlHZrKiXA6LRRM3bS9VusXLNaZnziVNo7mBuD7tEejl
         pGD4pFS5jROsFYqvVPXXk741FbKIhMvLyai1Q2qFf25/m9He/Uy5Cma3SubseFGwv14I
         ujG0VkCbVzTOsAr8fnEY/jwDWdZxCtdKTdVSzi/odpRf6wo9Fz3VsoBYvrv2k2xn5BSr
         N2ONH4upU0ch70xrfNU+sVM81KSU4fiHvUMHEE0X+qV0ffsddxkOEn1lGfEBPJxXORS4
         Cbe3rV+pjeTag4QQM5+yGjcCec6jU/NasQeEov0CWbckxBPJOlzmjI2GCKxeUhXIpHF/
         nKng==
X-Gm-Message-State: AOJu0YwuR9HK6WVKHA57VvhlSwTid0+/cW3wcvzoM6w5d2hDrPgcWs7h
	CEJqlAomeEhNe+oHrMVSzRdCD3IeHQS36pMNti2OotHjhyvDxuTbnMiSWjwTXxZwZwJ/Iw3N33U
	EPyQE2ev+wgzSBAlm0LCslEc30WvKg7+tH1ecoNFlEt1SuFvhGO2RHSk=
X-Gm-Gg: Acq92OH3Mh84KSx6fedrImUEfHPKTAAq5A2peqNVnPpR8SVmc2In0nQ7kuXgtU/EUop
	qIDTc758Cd5fABHSTqNdt+RHX7aBIQgTpE/EPo3DlANO3NKEZ6iYYTdMk3upgjLtSxWAUy0hD2f
	htr3B2eaU6hDqEzQLyxD5chLMzyBefMApm1rVTMhunzR2B2uz2EEEdHVtSrhvkneDX55M9lnBw3
	+NeuzzZyW2q8jfhZQrTtCs0AW4Q5i8fzBnfhxuVxJOhWUpRNa/lSVxj6qH73Cc+/KVRjyujB/DD
	k1dj9xAJzd8OL7hL8aYk5S8QvXgVl/UlqpgS0+MllDWzvgGNEGyDmtimpqaWxZoDjmUlt/iXkCb
	/1Ny03Xn6HTY/H/l0LyG2/cGKAhPcoeOly8tYhC0W+FbF8LKqhRE=
X-Received: by 2002:a05:6a00:2d06:b0:835:388c:9764 with SMTP id d2e1a72fcca58-83e3b7b4579mr14752348b3a.37.1778596104123;
        Tue, 12 May 2026 07:28:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d06:b0:835:388c:9764 with SMTP id d2e1a72fcca58-83e3b7b4579mr14752314b3a.37.1778596103601;
        Tue, 12 May 2026 07:28:23 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbd995sm22203491b3a.43.2026.05.12.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:28:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mhi@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>,
        Javier Achirica <jachirica@gmail.com>
In-Reply-To: <CACixm21q7b_diEx5COZxVZm9EhZ0hnakM_WBjEWcCsznfWeniw@mail.gmail.com>
References: <CACixm21q7b_diEx5COZxVZm9EhZ0hnakM_WBjEWcCsznfWeniw@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: round up nr_irqs to a
 power of two
Message-Id: <177859610159.30625.14519040364577796205.b4-ty@b4>
Date: Tue, 12 May 2026 19:58:21 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: tiYaX3jBvHNbXPrU9-LZsbv7yUeDTEzs
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a033908 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=GZDNYFZUksWQa33F:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=O8H14m0tzZsAWN9Q8MUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: tiYaX3jBvHNbXPrU9-LZsbv7yUeDTEzs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MSBTYWx0ZWRfX76Szkh7LqIf0
 gGHlX2d/uIv9T/x1KqH1OgOfe1FmpBgsSAcZMd6tg35XQ3Y9DaerT87DOz6fh04K63pzKyrtYXo
 KiKdjNabB/mT/6F8kxUXv2Tijsle0j3BnDaCBi0JZ4cUvm7OdqbozifXB96OdHQI+kluxr+ERsu
 139YWDqgjL1P8mnJMxRYUu6jBWNFdcXHYc1dN64ZAahb72qI6LFzm4E0vFGlhKgQmR9OsVmxhDy
 BrVuPIRTBLyHOr7cZzAcZ7CwBB4pVCxzNN5QP8UTBU6EbJXDlYssuoc9KwlUyKdagNX1pNCzKOV
 od46Ct29iHHQMa5nlUULtLKOTjPMlWseh+WLIlHSXlDW02VHZqs9IXPdOPaPNLYpGf5u7mOZ4gA
 fOCOegJpNDFI12WT68FkYwywcRgUFXyEkaVFFmziq9Yxwx/zOr2VhT++X0pbG6p8qUeXZDBmlmU
 973yywMQweS7L9ZbRDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120151


On Fri, 03 Apr 2026 12:30:03 +0200, Javier Achirica wrote:
> When an MHI device uses standard MSI, the PCI core requires the allocated
> number of vectors to be a strict power of two but devices will only ask for the
> irqs they need, so they might not be properly aligned.
> 
> Make sure a power-of-2 number of vectors is requested.
> 
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: round up nr_irqs to a power of two
      commit: 86f6dc05ea051fa03ebc03174bc00f734593465d

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

