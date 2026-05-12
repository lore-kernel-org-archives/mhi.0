Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BD3B4430
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596414; cv=none; b=O1D+OTxKS6/WdmT8uWiMCpxleh1tpTgFzdSeTWqjdvcx6htXH7/Uu2POuMx8a1mNuk8IS3+kRJFwH7IH4PfEk3h/6jMN9dzrn1YhNoKXx+0/M8Gy+0dYjZqipKkDt8dUsmTWb3WLE+hUmrWwFpkbeyiS6uJWA+HbLKNDCBcBncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596414; c=relaxed/simple;
	bh=66E2R+IfJ1HoNzP0tot6+oyALpG4CzusyO30QbGdznU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HL9f40SZhA9FBjBm+NPLnwQYLmn2HTw3TRJ0ansPeunVz1KCuur2AOgG/WQDr0wNocTWID9rl3Ez+K2zPxjJNYO8EGhL775pYSO/IrX1Q5q/mNL/jW5SCu33fJ1ztGTb6w+VD7kZsUJqQBOllfMqTTNdmbSMdbtI3RQ/rfGgWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWOZ8aEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ic0uox0F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWOZ8aEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ic0uox0F"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4PV53320938
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UqT1tdnjdLxJ+7v2qQe7AJIJhtIzLjmsJXo+lXS5p0=; b=bWOZ8aEzgffOooif
	JFJ4xONs0lsszQHaBW77//p28Iyd+4y0Q9gTTA2vW1ZPT7E2jBKX9lO4h/b2Ww4r
	QEt952+rBmdfBvBQdtQwILb0pgMjD+862XHonnD4WJyamys7qIvIxGhOIlqDieZk
	QOVCSNwZfL6HxGsK95NVi8X5rA2xWFJ7/IU5iobuc8qRj8EnuoLxCjPGGhQCxLHH
	wxKXaFiNYRilMEvkuP6m3ITORSPrEd1hdSJzB0dFrDI38zGilIlW+fXZQAvW4fOt
	9CoYDEgA7mjaNxCu5PSdePjae0CkVpLsYmSpFHH3dsEoW5fuGERiCz2yFd3NVyVp
	fX3BGA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1rh3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 12 May 2026 14:33:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c827b1f222bso1792760a12.3
        for <mhi@lists.linux.dev>; Tue, 12 May 2026 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596412; x=1779201212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UqT1tdnjdLxJ+7v2qQe7AJIJhtIzLjmsJXo+lXS5p0=;
        b=ic0uox0FNOF+ncWfL1bIn/fzcIc4nvJf8WaQL6qTNaHcJatT1NFlt4Gihm79zq2qJT
         dZuXHFC6DBwS5aBaTIilrR4pmfKB5S3RbGy1eRHUdVAp+0JQpOWDJiVwjfCHhJKA1W6W
         pBIyik5hnnADrrnaxvwYQon03nE+gp7DCrnWLuObESOCKBpfmzrRJQbYNQwEivSxEJ+i
         XmpBIC7WLVhYOgz8hVq6IE9Fq/CUomqCS4+XUGlH0PldCy7nZAp8hvdmWCLNgRlpsQoV
         rUt0Yv37BRIC4YI4y4UDOMaNhoxlk/H8AgZmpNDWDKLFn5Q1+fkXcL9gkyYrexGL0Tnt
         NBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596412; x=1779201212;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UqT1tdnjdLxJ+7v2qQe7AJIJhtIzLjmsJXo+lXS5p0=;
        b=EVz9ofOAR8fpipIcQls5Mqq4TFDz8JrHuzn7Z8n/sO381hJr5FDK68FXiWTYXCjQsy
         GwLj5D8cTh0IqL+TjZ37fRqc5bHu3882laz1S1O+MmtF2LO/iMlH+Sivt64Q5WBEQIRh
         hWe+C2Ge1F4++RTrM5wMMpyqKsi+fJNGiW9ceFIwYJ37XAwJY+HWalJos8tPle+tnFZ5
         O5iRiKi4NrLwpc48piliL10NbfcYSJjDi2vwsaw41NCRkQ9qCFGNox9EG2i8LFVSa3+O
         HNx6GbJjR0OalSie6iyZRaZgz5L6ECszgsR+SX3Ah88H7MoDT2Ed2gcHgwOCZ7gKovlf
         eqkw==
X-Gm-Message-State: AOJu0Ywc8b9CYsHGoPts8dMFWaFXw8gPr9ORIYY7wWhP8N1TFOVtOvAf
	UGlKeSlfIi/knzKYhbb0OWahoyaM+O0WV5qPgqRlrIEVK5UkmiN7DquBJEzVfoUwDkSiQlRPOOx
	g98FNsHKxuXlQVrqGcE3bENOoEmg8Or4svm/TlDSyVD7VJ0wBu3bTv5g=
X-Gm-Gg: Acq92OEr3izqBPg+pcMuJZJBFqloeFW4Yl4acHuLZlDRrWibcXJjkjevFmSjissyerK
	oavAKPnDyYQnP/LYX89WDMpOJeM1d1ukjFbG1AbL/zsljC+8wEVy9xj7f0Qa9tpqhbvTUR/K0Dg
	kH7HSDH0WUtYwAV2NuVgHp+pRBEBc2ufgmxFFlCGivX/y+rZW29VsQYw5RaraZkm+knY3A/VFr1
	R8AXl6m7/fLwNqv1k/NBdF/H5kiXmrf8KpE8dsJeAnzvQqwN5bSG9jr3cfIzCX0HmHWVa+CiU/X
	Ipte9gOCgmaaj2R3xkvX6iyQg/q8DP+Q+UGbm/rIKwB840mwIUzWD+jL7X/iT9qn/BVXG8rRbyz
	vI64jArahwM2VQKxbFlaZJPo3VAJRhCv/h7rl1lacTEOrRt/Y2g==
X-Received: by 2002:a05:6a20:7f9f:b0:3a3:aeb2:73c9 with SMTP id adf61e73a8af0-3aa5a8651f9mr31162731637.22.1778596412098;
        Tue, 12 May 2026 07:33:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f9f:b0:3a3:aeb2:73c9 with SMTP id adf61e73a8af0-3aa5a8651f9mr31162699637.22.1778596411501;
        Tue, 12 May 2026 07:33:31 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.49.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm12312113a12.8.2026.05.12.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:33:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260512112458.1048999-1-dnlplm@gmail.com>
References: <20260512112458.1048999-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FE910C04
 modem support
Message-Id: <177859640917.34096.1131987035700865289.b4-ty@b4>
Date: Tue, 12 May 2026 20:03:29 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: _O_U-Ux8ZOfxc2RNowShVVGzstgwnxG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MiBTYWx0ZWRfX2aLUj5X84LY8
 IIkXhINpgizfki+sG6bbFK2AgJtDbeiH1BDWbi6ggIErHiFMTh6fMFbG2sIVe58DTMXcItJ+EoC
 3c+IMlezT9IFHiVD0hTwZC29ZIAzv49i1TAMTEuCVDqAg6pA0Ya7GUJrYA1NhJKC7DrjmwGhCYw
 MDfXiXyT0pl/EB54W+hwCopwUMbBw2Iv7l0d2cNM6jwF8vhoXd97wldaR2FPhSr4lryWIcKdPqJ
 o8lBggpjI2hYKXfMAxR6TChPVM0PTRq0Ybez9ZBzEm1uPoWLStKvuOspXAW3Ypk/zPukBbv17Qs
 hVLYn09wdvfkyzb2mbI/IBFdvzfGDZNcxE9kaDutKV6b6OcpHfogjukbj+ezuL6NeYKPKeBOppM
 Np4qoFUcz41YKX9cvzCu2GHRTT7RbcMgcGnJgZ36NTjGfjg3SivV6KanYke6Zy63IhcXWwh0nEu
 jWzPsJtlvFoc1GaI9PA==
X-Proofpoint-ORIG-GUID: _O_U-Ux8ZOfxc2RNowShVVGzstgwnxG0
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a033a3c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=NvllDC1TEbtqK149wpmGsA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VJJ6c6LgywicNbbkzIgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120152


On Tue, 12 May 2026 13:24:58 +0200, Daniele Palmas wrote:
> Add SDX35 based modem Telit FE910C04, reusing FN920C04 configuration.
> 
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>         Subsystem: Device 1c5d:202a

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Telit FE910C04 modem support
      commit: 5096977d0da4b4176410f12d79716568858ea3f9

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

