Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1179E155316
	for <mhi@lists.linux.dev>; Wed, 23 Apr 2025 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414441; cv=none; b=QorKX3Dk+gW6Lapor1TxC3l8dA2rpeZHz8kZlMtCP+Kwc9DDkF0uXz/0hjvWGrrBT8pFAvszvJOt2hQMKYjuTWPsaGo6Icq1ZhvBca1mdNgf+pJ5N7BNUYaNC766Vt9sID5Je9diVbGVfa9q10XBaIb0/QeDa2/xHa1RH7SAMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414441; c=relaxed/simple;
	bh=bBCcJchYNvFn67J3it6ClLK07f2C0NFOdrjrZUxiLLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kssop7OOZ0kZ46Yk25eZE+Fh2Zm4k1S0GxRv43smQcKF+/nh0zFib2bWxJWsKVjChlLRBZsn+sMLSVZIGBOzws2n9dTCiDxOpk0dByyGPJ8Zoib+BfyU+LMNzCYRyONUVxgcJCoB+69SW3yXcbJixNB678EeVWC6O5Pjyn4Y+ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tisPsKuY; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tisPsKuY"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so6013858a91.1
        for <mhi@lists.linux.dev>; Wed, 23 Apr 2025 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745414439; x=1746019239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjO2es8vWTzIoGkPlpDHvF/pWDBUMDz/lSVw1h1I8+k=;
        b=tisPsKuYuFcSbIfDMzohENjh5/qPA1fCg93ZmMoUekqF10PqeCjgj101y1wYsmT7zg
         Wv0CIxym/ZuHHuCaoSnKIkXwp8Vt15wdMOWqWSvKHrX9+fyoAGlIgOhCtOg7NMWm1/P4
         Haqq2RdFmfWmFq9A+5+LYlYALlcMZ1gVGeFf/pK8hft8Efm1GOU0sLI/k43f3zNJyyDg
         psKmtls6xPFkcmZcS+/Fjpn2QvqZttvXA2+zECE3iYrMt9QXx+wECD13eO9qpkBRt6qD
         LHL0UK9rIftR6ik3sNfbpVou+odKrUw0RLskNcxlm9fifnjtSS1JLJDYJeGcwyBmbbxq
         Ir+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414439; x=1746019239;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjO2es8vWTzIoGkPlpDHvF/pWDBUMDz/lSVw1h1I8+k=;
        b=olj3clhvEKC/7HlMbxITPy2lqomXrt3uJAaqWOp0xo1d6e7zabYIr2oZtIYJi2W/Jg
         avET4qibKdos72hFrGcso0qMImy8YejaFbCWzQtQC+clFA7vZ+V980w/7IhqXDooO+YI
         gGRHDs3yswblR2TD3+Y9annx7ixcIKYXzNL5kUhi+rJx5CCK+3jm4NOjU56+TUXWKBgW
         YExTw1GnOe7nSTTMSw4tnT7NmQ6p7o73YiVzwGgUrLcetYzBm4VIigEOcI8mI/1R++La
         yAB+x6ubiO8ECmgF7s94xAr/WXZ24OA+mQU0iX4yeY34rx+aMIZ1t1qinDoPeRkoyoF/
         Vlzw==
X-Gm-Message-State: AOJu0YwQAHKDrSXHS8Vxr6rMh3rv5nSreFVvEYCsgS5VsmzJVmRhDVtF
	stANU2sQwGgVpOrwfp8WLm507+/qhjPHeBO6qmsWAtIpmS8//P3IB39Ig6meXUfdrDU34roAMQE
	=
X-Gm-Gg: ASbGncvP4wUZ9/aXA4XUhVO5iuoRjraMDl5PeLZ3pkYqNn4C3gKZcpQbFAJJGnrGpip
	U9J9L41zlecuH1eJnCXRq5KKNmo/y/JaN0Za+ExGLc1OpJXrhwIZxzV71LZh+MbPfYLoFqpUcHY
	Fby8RRS1WetiO12crZam5rhY/jY1RTal+JJ2TIiDkc1dPjzScyGgJnFyEPW7A5Uh0EMVqMnrGus
	zUNzu9v0e1mbYLpBhoSSjTnVzw2g3tCclDKoMAaKDe4Xkciq1IbiBuQMg8cc+1GiXSz0f3zyrij
	F0jkLJGZyJK4914UkX0mgKYbgFW+OfFKm1UNCOo5I8dPmFXCKxBBhHZklFiJ8cY=
X-Google-Smtp-Source: AGHT+IEu1j4C6yFLksZsCHK2T8qkc08i+ErDRmkFAAwMj0HorGsVS6QmGcHEl2PhT7YlQ+pRLfzsHA==
X-Received: by 2002:a17:90b:574e:b0:2ff:6e72:b8e2 with SMTP id 98e67ed59e1d1-3087bbc936cmr25119513a91.31.1745414439041;
        Wed, 23 Apr 2025 06:20:39 -0700 (PDT)
Received: from thinkpad ([120.60.129.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309e0d06a9csm1544579a91.48.2025.04.23.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:38 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:50:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: lenb@kernel.org, quic_qianyu@quicinc.com, 
	krishna.chundru@oss.qualcomm.com
Subject: [bugzilla-daemon@kernel.org: [Bug 220020] mhi kills hibernate:
 Lenovo  ThinkPad T16 Gen 3]
Message-ID: <7y4zwx6cuco5mwkx6zqaz5cox5ken2xjhcxmv4zcftkjcekwak@qijscxptonne>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

Forwarding the report to MHI list and Qcom folks for visibility.

dmesg log reveals that the WWAN PCIe power is toggled during the 'freeze'
process even before mhi_pci_freeze():

[   57.550960] ACPI Debug:  "WWAN _PS3"
[   57.551273] ACPI Debug:  "_DSW PCIe"
[   57.551413] ACPI Debug:  0x0000000000000007
[   57.551559] ACPI Debug:  "PCIE Sx DisWak"
[   57.563142] ACPI Debug:  "_PS3 PCIe RP0x7"
[   57.563398] ACPI Debug:  "WWAN _OFF WWMT Mutex:Acquired Try Done"
[   57.563553] ACPI Debug:  "WWAN _OFF WWMT Mutex:Acquired Done"
[   57.563699] ACPI Debug:  "PCIe RP LTSSM at DL23 Start -0x66"
[   57.580049] ACPI Debug:  "POF RP 0x7"
[   57.580237] ACPI Debug:  "PCIe RP LTSSM at DL23 End -0x48"
[   57.580391] ACPI Debug:  "POFF RP 0x7"
[   57.580551] ACPI Debug:  "PINH GPIO=0x14040B"
[   57.581314] ACPI Debug:  "Calling SPCO method to configure PCIe ClkReq Override"
[   57.618093] ACPI Debug:  "PINH GPIO=0x140096"
[   57.629350] ACPI Debug:  "TB2F 10"
[   57.629515] ACPI Debug:  "WWAN PWR OFF"

<...>

[   57.894452] mhi-pci-generic 0000:08:00.0: PM: calling pci_pm_freeze @ 4473, parent: 0000:00:1c.6

<...>

[   57.894526] ACPI Debug:  "WWAN _ON WWMT Mutex:Acquired Try Done"
[   57.894618] ACPI Debug:  "WWAN _ON WWMT Mutex:Acquired Done"

<...>

[   58.000702] ACPI Debug:  "Calling SPCO method to configure PCIe ClkReq Override"
[   58.001323] ACPI Debug:  "PINL GPIO=0x141082"
[   58.002417] ACPI Debug:  "PCIe RP LTSSM at L23D Start  -0x1"
[   58.130941] ACPI Debug:  "WWAN PWR ON"

<...>

[   58.286837] ACPI Debug:  "PINL GPIO=0x14040B"
[   58.288245] ACPI Debug:  "PCIe RP LTSSM at L23D Start  -0x48"
[   58.338206] ACPI Debug:  "PCIe RP LTSSM at L23D End -0x33"
[   58.440299] ACPI Debug:  "SLP TR2P 100"
[   58.440784] ACPI Debug:  "WWAN _ON WWMT Mutex:Release Done"
[   58.441222] ACPI Debug:  "_PS0 PCIe RP0x7"
[   58.454172] ACPI Debug:  "_DSW PCIe"
[   58.454463] ACPI Debug:  0x0000000000000007
[   58.454737] ACPI Debug:  "PCIE D0 DisWak"
[   58.579404] ACPI Debug:  "WWAN _PS0"
[   58.579725] ACPI Debug:  "_PS0 LASX Delay Time 0"
[   58.580222] mhi mhi0: Resuming from non M3 state (RESET)
[   58.580228] mhi-pci-generic 0000:08:00.0: failed to resume device: -22
[   58.580262] mhi-pci-generic 0000:08:00.0: device recovery started
[   58.580519] wwan wwan0: port wwan0qcdm0 disconnected
[   58.581008] wwan wwan0: port wwan0mbim0 disconnected
[   58.581356] wwan wwan0: port wwan0at0 disconnected

<...>

[   87.123353] mhi mhi0: Device failed to clear MHI Reset
[   87.123753] mhi-pci-generic 0000:08:00.0: PM: pci_pm_freeze returned 0 after 29229292 usecs

And with 'test_resume' I don't see the power getting toggled. There were only
'WWAN _ON' logs. So this might be why 'test_resume' worked.

@Qiang/Krishna: Have you guys seen this issue on any ACPI platform?

- Mani

----- Forwarded message from bugzilla-daemon@kernel.org -----

Date: Wed, 16 Apr 2025 16:50:36 +0000
From: bugzilla-daemon@kernel.org
To: manivannan.sadhasivam@linaro.org
Subject: [Bug 220020] mhi kills hibernate: Lenovo  ThinkPad T16 Gen 3

https://bugzilla.kernel.org/show_bug.cgi?id=220020

--- Comment #6 from Len Brown (lenb@kernel.org) ---
CONFIG_MHI_BUS_PCI_GENERIC=n

is sufficient to work around this failure

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.

----- End forwarded message -----

-- 
மணிவண்ணன் சதாசிவம்
