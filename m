Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794998457;
	b=wgSpqIW1MIF3M75bVm/s3YF/ZhNHsaw5zYydLXya0uxI57JmNofOe42T/2GBV0Fc7PuM
	 2nJlrWz1K3w/rz65PTO2t4O/v2aY/BZiVosTGfVpv+hdFDH1n47RYgY8fBzAoKHHdE+S1
	 nxY/lAWauaRTz8FdEaX1jsz9FU+23jtq9luMnt7dncKTvlwPeUQFoVf4tsTqcGoRek/SA
	 4cHrsPiZcHhtpv4ixHybc3hNOw07LW5mNptRpQSRVCbGlOOTk06TtqjjKF+Jy7baX0wg6
	 kYWG3bzIUjfiZXOsrlVoH3WAlKh8EFnWpMQETzbU1DZJAKIImAPPn+Y65xJnHuWcZwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
	b=KFlvjtO8sCyUhFq1e1YPLQOsnKwkccof0rkgJEXtbQI+4zsLFnnkDHViMYE5YRA+Vu63
	 jaSxwKP5Ce8zK5AsjGmixx//GhpIDje/e9dYRWvW6kwBlc+9JSBn5obBcGWBin79IVJew
	 EnsoUMu4Qcyx99YwHhsT1IlZBMXbpKiiLmgG0Id4YmMOrSkVWVSHXo9beJuzYfFZdDfbg
	 FkS0sUbvrsDr6QdTZ6AARFrPpgKFP8pbRTBCzRmPEcV3xChVpuf33tYeBbld9CTNp7Jbj
	 9GrndfI/JJ9V7EDkJ6Gq8vJa247Q4lIG1KwXBlFqTVapAZVY41as9avM4kalXQqxdFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j/ybjMYZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hVvEANjI;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475D606A325
	for <mhi@lists.linux.dev>; Wed, 18 Nov 2026 10:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7475D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j/ybjMYZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hVvEANjI
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9k39f3353922
	for <mhi@lists.linux.dev>; Wed, 18 Nov 2026 10:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=; b=j/ybjMYZre/ILIML
	M7NzlJXQ6554KatR3DUAICoHEr9nyzyi3yWKwug8MrN5O5zwBpwdn48YBC5GC0RR
	hY6pFXHBgwmF3lpxeoJG0e0BxeTV+PZX2s6baNmOe9aIpEjVZ9QDvAzFKGKSqW8s
	5e2J3q0wcdvrOT2nxRpuc2a13x/0AfL1umSpHZTPV0D3EsTqqddvDi1JBuQg85ES
	BnlIvM/R+R6fS/enzDvRzjyNxbq0hdsWLxNUXum8JumSMtXYivf/H+EyuwRyXGWy
	J+S31BFYPDgWRW3NNXGH3a6bKtVNAGBLo8iEnwCWvSZkR6F4b253396Bl0qfUZmM
	s4kpWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatmqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 18 Nov 2026 10:40:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so93163285a.3
        for <mhi@lists.linux.dev>; Wed, 18 Nov 2026 02:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998456; cv=none;
        d=google.com; s=arc-20260327;
        b=RyFhrMiSXiBVFMCjbndvY4A5VlReWhezmGbuZesZlNNPXeuV4zcQpviEIYNpYQZand
         +2AKysvEy0H+xopd0hc3nryycdV5jEFT61btVtn9C2XTb9OefyYrFW/oeEBJVny7fs6g
         LVz58AsgR3wXAAurT6kXWpLPcu8wIyqPCdAaz8URpwerf1l/OvFxCgJIk6zmcYLX+mQ2
         YfjdklITtvKvkcMZuGAWa40BwdhQMxgYFPo5cTLr2Wi/0k26PEghTMGIXMob4JFnKGYc
         DyesEDf1ckG3+iblSjsM9Y2KgoE3TdtQMbz7WJdPIHYefT/W3ExFv/5vZB0MPCYmmjbx
         Zf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        fh=ZRDwcqRPJZMkX91DDvzvKQtbse3Y2rWnbeGR6nyFMZE=;
        b=LnzsJQnf7yM7BEWLKiOdukBYe4ojCgQ4/iRn73+iRAKnqBf0VOElu6/6NQ81b/XSJY
         3CHO3RMPktdZPZiOxTvql8t6GAubVXXvAJ3PxfizWvXfuNwZe4c5wdTQdxgpKV24OVF/
         wUEGqZYacYNByWziyUZsh0kPEdC6SXIy1eK/09Gow6t0psexSs6LKCCxy1vsNERyG9/J
         cIMjSm5MHz0n9AXjnH7KFQllSIwX9wpzdCeGRpAO4HzsuDLqAR5EVLQh1bP87vm6a+mf
         PlCzvr6ZAOtQvLmgwrc8Ol0myb9YRfsWqUeuTHr8/O8JFykLj9/cMThGH0zWeOQQR08q
         gnlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998456; x=1795603256; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        b=hVvEANjIPMeaoMJCVQ/Q2N9JxIMQjWVoYyVo63CKaXvUZvtWWEV3iRY/p+dnNQs5LT
         xcyGU0pOi5sIWGPhaWpKeb0PJWHFH6RFLXQV5YBiAIWQfUtnpSiUVSalkxWfQlOhYyyg
         sFON/00DvnKPzAmXqyBCkKc2PhOUkQqB03fBu48GYFp0Rq6+//3dWgvkm5zzq2jRbOBL
         tXyO9p62iToPv8GaCJ7PmUz7OAqI+WCFh3BXbf9d7YlRIsNdeac+9YtG5W0SopygMA5h
         7T2//VHVh0vvhAoOsA3DrlLiKtpiz/C0NWPzNXZY2DLR5szTyDW9/urEht5cZ79oGKL9
         sxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998456; x=1795603256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        b=K1CUg+nvr92Qm1n9L4pK85yV/BcIwVX7Ziivz25LoQ5wsabZZVSerqunnM3cKQnV6P
         pbNfjLjff/QxgS7RTbaxNd99CJ4ypUuuZzG7RC3MueHIZjOQw+NKCOL0mEKU4ok9rQS8
         IrViWZY9RSeHh3D0KsdQObiOAlKgCB2Z5MCFPjnxUwYzOPUcIqUHDta49QP/ueBUnRyQ
         lTgYFufnVZsSCVe4kjKHJM/tL8/QD6jKiCqCGvWY4/QdlG51o6TAVnGa17GCXYF+lHiW
         dRImqb/tsbOViNqtUXnCLcN+X7LyvZMecpjpllX9h5uh7Yvdz3bq7dHlYo0lFxcj5L7M
         8FYw==
X-Forwarded-Encrypted: i=1; AL+hErF4rrIbnl4zzQeaZIVjrXaAcKje3t6aJ67FHUVV0c5aUDhBSTBYEipK28a/2dA+23txQSQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/taDABdAP+Qq8QfmBxB0L5Strprp3OgoHSvl/Pyl+hAiHgSpHE
	lCETJBwi1BB66S+abh3V+AYRP+hqOFQcE3auCJFxCBPkWRC86qAUOTMBPt432FyMO+9wN94oCNQ
	WCJ/Battv2jcEkMRLWyzjzG4P3LlfgEc4M85Xoa8s2RSJOJtsmgdlsoJfkDgXvceuU4oQEdlh3s
	biI6qQayjuG071LXVvPMGg6M8k06l0Wg==
X-Gm-Gg: AYBFou2tXbNFVyFEoZzNk/u6Y3dNHnI6herOEHAwTQn0L52WThXrQWRiVqyZt8weooe
	hUg23ljXveWBTD5lAtGX8zc8ntovEIMy5PGwcniuG5fmdtAxgNwPPF9UCC/YUsAOn91JHwdXPdI
	Bx8PQts8sESTRf0CjTRXT5JiKLS2v/PD7ZRAuMHJVY0SzX9mbWlHCZZT2QXvwc3CR46j73CfR3O
	6BXJb2bjs8whvL5Pu7YbaHhrBoAX4T93gUI9WrZhPI3tf0tIDwVz0cjsrz8htPQzPhRktQ7jxjC
X-Received: by 2002:a05:620a:838a:b0:93e:78b7:fa4e with SMTP id af79cd13be357-949995d052cmr388639285a.37.1794998455576;
        Wed, 18 Nov 2026 02:40:55 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-949995d052cmr388635585a.37.1794998455024; Wed, 18 Nov 2026
 02:40:55 -0800 (PST)
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109110352.1621-1-xing1989093@163.com> <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
 <20261118092814.2275-1-xing1989093@163.com>
In-Reply-To: <20261118092814.2275-1-xing1989093@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:40:42 +0100
X-Gm-Features: AclHuK-FT1CuXYUdW7m-nWwmIULm18l1osWT533MIe5VVPgbaeB-OtNzu3MF4w0
Message-ID: <CAFEp6-1pJd_==NodGfp1X=P=wsxbBowezg07DJpJfd6GtB_=pw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: Hongxing Xu <xing1989093@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd80b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=Byx-y9mGAAAA:8 a=9cDAomjR_99duVTWh8cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gbYX16K8P2TWpqp45uAzzAIBBTF73095
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MiBTYWx0ZWRfX5Kbh4hnFNbQ3
 9hjKqjVZs44gor0dmzwMabfMNsoXK2yrJwEOE2fwY3qndEnh0VMthuNHq0R+4uWpmxZRilO1f6H
 Jdv2SvO/1AJCKWxIMBCVomVcXj06PuO7k513ZpaOQJvzml9mRBFlmEhVmvb4FUTT4sHhQiip3VE
 NPb9YuWkgg21CLtCysoy6LYj8DOE1B4oLgvZ+idQTRTWI342op0CnbIuRRJQ742zfC92DuVU2rZ
 e14JrtHLfygisPMpDvx1WoO7XuCva5FHy6bhrHkhee7II6p4K+ZxBu5ePO0V0cJ0Nwkk9lbtBOZ
 V9mT/RXRYRJV2Zse9hSmDzOlrHMg1kvmsmPS260MHlo74BFt6dF7JD/4wyfBOi8H6cUtujhmd3Q
 hTdqcWsdciLbBRypnrHw5FTK1SeMHOk/HegIzANuSFdf6u28f6QuDCi2mxB+2cQADpGxJfIN24e
 Xq1HuC25IKDO/VjC+NQ==
X-Proofpoint-ORIG-GUID: gbYX16K8P2TWpqp45uAzzAIBBTF73095
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MiBTYWx0ZWRfX9lRagizLy+WS
 37H//hjoIMc2SMx4aeH/W2VBK7kdeKJYG4TrdgskHB1SLAJEMDp1NBa8zmtyjpiFTSM/QJrL1rW
 6RuGdX/XiN9CG0uVNqtz5xOYVnQFkpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180042

On Wed, Nov 18, 2026 at 10:29=E2=80=AFAM Hongxing Xu <xing1989093@163.com> =
wrote:
>
> Hi Loic,
>
> Thanks for the review. Let me check that I read your two points correctly=
:
>
>   - The reset method should not live in mhi_pci_dev_info, because whether=
 an
>     ACPI method exists depends on the host the device is plugged into, no=
t on
>     the device itself.
>   - The driver should instead walk a list of methods and take the first o=
ne
>     that is present, from the most generic to the most platform specific.
>
> I agree with the first point, and with the idea of a list. But I would li=
ke
> to suggest the opposite order: platform specific first.
>
> The two entries are not two ways of doing the same thing, they are two
> different kinds of reset, and the spec keeps them apart on purpose:
>
>   - _RST under a device scope is a function level reset. It must affect o=
nly
>     that device, and it must leave the device visible on the bus, so OSPM=
 does
>     not re-enumerate it.
>   - MRST, referenced through _PRR, is a platform level reset. It power cy=
cles
>     the device, so the device comes back as if it had been removed and
>     re-inserted.
>
> The spec says a device should use _PRR when its platform reset cannot sat=
isfy
> the function level and bus requirements, and that a device may expose bot=
h.
> That is exactly the situation here.
>
> On our current board, both are present. The function level _RST succeeds,=
 so a
> generic-first walk stops there. But it only drives the link reset signals=
; it
> never removes power from the module, so the part is not really reset. The=
re
> is nothing on the host side that can tell the difference afterwards, so t=
he
> walk never reaches MRST. A method that exists but does not do the job is
> worse than no method, because it hides the failure.
>
> So: would you be OK with trying the platform specific entry first? That i=
s
> my suggestion, but if you prefer to keep generic-first I would rather hea=
r
> your reasoning now than write v2 the wrong way.

Yes, from specific to generic method sounds good.

Regards,
Loic
