Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4060329E59
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766553198; cv=none; b=hTXTxb5DPzIkOgceVqcdzl/m7qvAvaWTcnnwf2wdWLeUSCCP2//ZPaHq4bGWMhykxPBDZqDbNId9Zk8d1kqTynMoune9DKQEm5Q8O0i4EqEpbzrBwsCKksVgO25cTjNl4Pdx47YEOdz/xS3ZPpfi31XjrEN0CGx15rvw8gH+KX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766553198; c=relaxed/simple;
	bh=AmcyP/+YXSCcHKikxMnVGBA+e4Bz46fLGunmefIhtz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g+ycORF4oOF/UyWJ8BKXTqwXsozENszZca6v9L1c14AxtHHOFq0Yz2NixT1yttkmPp9dg0aZHEtEH9RzsezGZI0NWfOBLZyxw8IuTH/shDW8nirpGEE01qqgpAJ/4ti9FE6LmICUc9sZE1sactfMtE/Q/G/Itew8Sj75Dks7p8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJY+6/3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiCi9iRy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJY+6/3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiCi9iRy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJrSCb721758
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 05:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UNg2g4sJcl7CEJLjxJq/A/18qedgH/ARFWQ5YzTQ5dk=; b=pJY+6/3DNpUpw4uk
	xuMvxMHQy9W+uCHPSDm2Hi9XlrlzpMuTSzvC23LtzmvN3UyBQ0p1fLuLqe0PPorI
	q07HAaJ0qtP/lOwnn3JcFv+sZVvEfMD2z5jkQIFf5prO12eIQ9b1VU2h0BLI0psk
	aWVbs5N9s6+lsYwIiZJw7+QiQzhXw2wJaPxPpI1MlI0nJ30bsc4NOqiCUqieAuad
	GdqWzSDeVzx5hfpq9pD6DJMdfImbo8BC0WTDwItiePHvCOuza8eN7bCkxDWuNccJ
	Jc7D1S+e/p2i5JxQffuD+h9kHQlAYo8WSv7w5poQg68UVX+/PusBxM7JE9BEnh52
	T5z4+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt967v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 24 Dec 2025 05:13:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso59776615ad.0
        for <mhi@lists.linux.dev>; Tue, 23 Dec 2025 21:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766553194; x=1767157994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNg2g4sJcl7CEJLjxJq/A/18qedgH/ARFWQ5YzTQ5dk=;
        b=RiCi9iRylxjxnLJCibifgm005dbzys1BHDnwD+ZGhtkZvVmN3beFZzKif8qtmrtOcN
         QnPqVRdWb3fApa7ZXSC99gFAfE0wjvs/fveyh27tnnH36FqFMleFjE3oZ1qJ6+7UkELj
         ovIWXlSfVLzyH/dE/U3tcA4lWnjj4BfQlrDBSsecnDdwjGx3tNLm6I7sgOMhJY4Dff21
         C2LulC4ClxXKDvkhjMW0gYUOJk3sch7nbKY7Ie/4lilUHUhTr+62xDZVB9RUyF3kWTlg
         GJijfKOnfOmaA9bIwVRvPjdXgMbAniqP7JhuuIuL0ihnb1NWdu2SUd0zeNHAx69j7f1m
         lv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766553194; x=1767157994;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNg2g4sJcl7CEJLjxJq/A/18qedgH/ARFWQ5YzTQ5dk=;
        b=HFb5+FMXBB2v8WgAmoH2iyn/wF8S8hjSvk5y134RVj75qeMaqvM2rPfAfv8uh5gRMW
         tAYHJb4d0oESfeJ9tCnM1JFGV2mVg8mk761VL6Qb9evAuii8EBgGtQAgqsnjrsQ5HbAz
         ZvoyQSyDF2p/So+Z3Hnd0XLNfaqVRli5bKCILltpHxMXMF3z4rWAdKSBXVkPfba7Yk/S
         b+vcMSZSrnMm5QNqqeyjdVApFjSJ5TKPn+VZaw14QSzeHMxLv4oU0bMXvoMWy6oVMANm
         TWT9Y7YKDn0LFQh9CsdgCmEcEAAGUXLHPfFR92qAnpWYqTWz1rdBjWoNroNMtNYrZ+Lr
         iGkA==
X-Gm-Message-State: AOJu0YzMRGLWXk0ActqksfH8LXRpJ80yrn4QDYDHiLLbmgdC/J7yuvH+
	MunJVDpucGkT+Zbgrnmo+gsVafrvjPdejBtkLqYMJjWrU1GUXGj67H+0mVzZWWA94HUmm6SnA7M
	sjOrI7T0KOgV1rhnh3yhiPtdYdAVQMqc56YGb/ch+e+u5nQVJlAoM3xtroUkixPs=
X-Gm-Gg: AY/fxX7oVwOgEgcStFCKdPByw7K8+AnM8YH8dol5RjqKbY5sUxCtxJ9r6y7e6JGFbzt
	ueGHU3AXhHdXCGJax3NbAONUSvn6Du8OyrUvojix9RwnJI3XkEECUmitfTOzockn5OwpWWyHV97
	qZkXmFeFCJ5T+DESfEL52BlmYMb+G2SO+uXNPRIHgAa6s0iRoUsv6mnyBRAan5N8i/YOnK0YL9j
	Nqqi4YGCtExc4/zGQuZptih73mEt0pLjiPYVLUmxZs5Cry8lvQTWunkL1ucDjP7EKQ9Kfs4rSGw
	jNxyiz0rFZvO7etJJ3E4OBq8/Mj6Ui98hIOE64UKdQYm527k0OvwlrbKOeoM2MHbEVnsjrJqW5+
	OErYoanbmtiyELbPt5P3e8fLFtEvgY6jZsEBOQXDI
X-Received: by 2002:a17:903:19c8:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a2f2a34f96mr147292065ad.44.1766553194405;
        Tue, 23 Dec 2025 21:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjImWTzVXni9uo6xBuyndgwIbfmnboPlYngHRaM9Yr+XDGTGMMtl2apXU6Icj8XduLiszmwQ==
X-Received: by 2002:a17:903:19c8:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a2f2a34f96mr147291835ad.44.1766553193911;
        Tue, 23 Dec 2025 21:13:13 -0800 (PST)
Received: from [192.168.1.102] ([120.56.200.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d407sm141763555ad.72.2025.12.23.21.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 21:13:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20251223-wlan_image_load_skip_512k-v5-1-8d4459d720b5@oss.qualcomm.com>
References: <20251223-wlan_image_load_skip_512k-v5-1-8d4459d720b5@oss.qualcomm.com>
Subject: Re: [PATCH v5] mhi: host: Add support for dual ELF image format
Message-Id: <176655319182.6748.16911580360002746878.b4-ty@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:43:11 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694b766b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=31AEnvkI3DvSdtIumApubw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nt1Z7yP7Ej6Vv7KpVVcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: UDKn7Qkpi3Y6BitmbYd2vyiyYKpkaqeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA0MSBTYWx0ZWRfX2MwsVF0uRHvg
 Hcjs8OB9rmUUlt7uy0ZjUQ4aoP+v47aW8ahdM/BXVZTNmxh2ed7LUI/i90rfS+mXFVajy/ii4ER
 Zb9mHWsj3lKvsRyCc+UkKNEWbLvrJFHoyGvL4unohksfLBmyt0ri7mUdCSID1Whao6XyK5sgzlA
 gxHwoDtjNcuH0nDnC9B0CsazXEFPF7Iedjaffdvc+MGKMdqCPxq58ENtys4hp4WXpcRY0WfAY64
 JuEVgG0x+oY00ObvEBZNCgTHegpsuSVCbeZwHEjwEsGEAjwDMYR4+YGSoVfH8G84CzstD7seVEi
 ZB9r9rWaUZvglnBzlsYCt56focKkOU4ZisJ6uBf0tZluBo2AOE2D+0ap2DxYTfxYgXTsHcU4IV9
 RVHAgADt2HNLsWbTMVMnfyOPt73HDLbH5tWvibpckrEb//qf6zLhBbiQDyluAb/9V6E124XhG3o
 QAEu6tmOnqnvdqzNWog==
X-Proofpoint-ORIG-GUID: UDKn7Qkpi3Y6BitmbYd2vyiyYKpkaqeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240041


On Tue, 23 Dec 2025 19:05:26 -0800, Qiang Yu wrote:
> Currently, the FBC image contains a single ELF header followed by segments
> for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
> supported devices (e.g., QCC2072) require separate ELF headers for SBL and
> WLAN FW segments due to TME-L image authentication requirements.
> 
> Current image format contains two sections in a single binary:
> - First 512KB: ELF header + SBL segments
> - Remaining: WLAN FW segments (raw data)
> 
> [...]

Applied, thanks!

[1/1] mhi: host: Add support for dual ELF image format
      commit: 820c866c42de99e7d65c7bd1f591f067dbbe3cae

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

