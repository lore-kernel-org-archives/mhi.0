Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CB469D
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647754; cv=none; b=dW3bukyaC1LO9Ol8Nx0Lis8ubVsMeQCrOBRnvOb5VzOxkv8l/o1DH61keuTefwMPS4JADH8OD+X2tIYihW848OiG8n6kfMgJFgIBHVG3VESbX5jpda9gJUhlCY+Y+VbUZ6TkSeYx+7/KwCRaLsGbIYdtiHUeHCyRfLCs7Lg3FEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647754; c=relaxed/simple;
	bh=E3NkA6uH614ySqMHBo8o678d+83U+3iUYauudgnzNVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b1jFFv2VlXsYKm3vtBKMJsyHjG2jXzBZLO8TNLv+JmDtdIkvY4HoLUtyxqw0rMzO5VV2Rpoy9SMheF+LOE10L42Gam2Mq8mhbrL8saPPR6WkY+LAyT0zVB3bSVZhiT06Gez6kPZBEbsReZHWaqE0IiK0djnRC56ADOQAr4GPmAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu9CU4Pb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu9CU4Pb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8mwP8015603
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Xdkk5ppMUCw7u+31/KTTq
	mStofyaJ7T2kwr9altaWU=; b=eu9CU4PbEUXefPcWbAyWOs01/AyR95FGM1YrA8
	dGkR4fizbmtGnQUy+L4n4d0UutUDOduIyFxuQMn+xcZX++YeLwYi0zQR35gYFsV5
	OC8rVKFCiR3D/rkHZ4bvWySE6R5RxhYa04+fmtbBAbexyNoMzImcLMwIvCOyz1zB
	wwq1vlES5R7eTveMADNzEMJvS+2LaHg0C3QmY9CaMW4y7+WIcv7V9TLSwrH5fHZD
	DTFEK4a8ABRExlFIInDto75SgZmdLJqnNUOhSK4ADoY3cly4fH7pgqbup9lTEn+s
	UQxwFYEr1iAIaFZIsTj1HJgeHmbAnniipriynh+xPDM4iOqA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnykw29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 19 May 2025 09:42:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742b6705a52so3062015b3a.1
        for <mhi@lists.linux.dev>; Mon, 19 May 2025 02:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647750; x=1748252550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Xdkk5ppMUCw7u+31/KTTqmStofyaJ7T2kwr9altaWU=;
        b=jEkQxHFr1xW/qPq/rQ9zqarCo1JnF797SRlv4Rkz1nVzwCI944OV8D1gb9kTxEgy3p
         k6NctwXVBpfc5PBVG/xsC88Y9BlClbc5jdxyf0RKH/pbZlVQoZOZ0acrTbDagWZSwK+d
         oJTgIVtwzjKJR6tYw7SMvJj3eF1X87Jfwe5UINP/Nn8FG1CtSIv2Ha3h7OwTXg5UVbj3
         ooulvZsBNczdlPDP01RP0ky63IA/xS4GFdq7NnerJIa2VN16+Web6VinjCrGruwuh6Kr
         aemaSxrKsZBQ1G5vNvV1IbRkHV4ualR2VnocWdfvhMVCkyJbcXGmDqlxlQO8q2XrxnB0
         23sw==
X-Forwarded-Encrypted: i=1; AJvYcCXRcTginDGQjWr0Wo/NY6vozTnDppM8ymFSsxmawmb7Y4leTjxQ3dHyzaeM5nX7mGfPRoY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVovSHQ4IXBEzxByK0t6OvSgpGPOOvoClx9mei8Cnx0kYISMwd
	9Df1uHTWFuKaJG1hlF3wBDj+aFagINl+2XqCjxFtjg1EGMjR3z7tlwfyJZB/2Old+RzVv12BbqF
	vBCcVB0c+127gEepH2tgwYOSTfLZqlkcwQ1VXfqysUvv1TEcPmaibUm0=
X-Gm-Gg: ASbGncuz0ixfW0RdcmdYTx5IAQJU4+NRp8THQ6l8JBc6z9n4O+RGCl4t304o7xTjnZG
	3N+7c2ZbQvlrfBwK3yQc98oIg2JpiUOWy2V0WvFXWjQW3mfvjMI8ctGxB8vYTj1iaxXKrz4hUdz
	zS7ibJjRfm4uiB13kNBnwRBaIjSmzWMg9rx1MwMDWmxJLbgnelIHFWZaSRA+UQmULNwJ0BX/5ef
	aXqP6QPPNmA0lrNRfZdlgMzgVhK6EFcVHEQUaGaOq69tSxZZmP2wIhnv4kAFF69kJe4Z2YwUZJT
	MoNshdeZKlhWsrBeNR4P8qNkYLgjGFPQwf8ovuXzYSezpyg=
X-Received: by 2002:a05:6a00:a06:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-742acc8e94cmr16949374b3a.2.1747647750230;
        Mon, 19 May 2025 02:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoCNHIy8vm7UNK06bHoqEfkocfr01VDi6iYCVtGhO8fkUV8H34cgcNYNSP8u4+8ZFmO53vpQ==
X-Received: by 2002:a05:6a00:a06:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-742acc8e94cmr16949320b3a.2.1747647749707;
        Mon, 19 May 2025 02:42:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:42:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 00/11] bus: mhi: host: Add support for mhi bus bw
Date: Mon, 19 May 2025 15:12:13 +0530
Message-Id: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPX8KmgC/23NzQ6CMAzA8VchPTuyD0Hx5HsYQzYY0kQYbjI1h
 He3cNEDlyb/pvl1gmA92gCnZAJvIwZ0PYXaJVC1ur9ZhjU1SC4zLsWBdS2W5lWOA2uUUDzXWa6
 EAbofvG3wvVqXK3WL4en8Z6WjWLZbShSMs8LoWti9NLURZxdC+hj1vXJdl9KABYvyB9Dff0ASc
 MyLSiuSuWk2gHmev5ZAhGnqAAAA
X-Change-ID: 20250217-mhi_bw_up-f31306a5631b
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=5246;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=E3NkA6uH614ySqMHBo8o678d+83U+3iUYauudgnzNVU=;
 b=/lyU+5ydxEoQf3CrCMazF+8+/lgCqzeWYYIHuE+LMKA5vLfcz15M/CGdyq92AMFU1qdQu3173
 U7ZTed1Gw0lCrGIIKbJ6/caEFmvdkEmopnoewqoF5QA5DmGGkEhNYDX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX8j3ChkMQxUdP
 j1mshRLBmD/ZwMwyPJKOQ3TiBsWF+4NmXYkZEzI4lnHuQfp+2Zd4vMe2E3YMAOZO43KUHwGb3/u
 OE028OfetbEeIbX9fuAHY7RbjK+OV3hteE0FTSwNRIY64RfbEj4JbzEALH+bzyChT3HvJD8eUgj
 38xpwDcLpiowEpY3o0V6LZSgT6Qq2rZziVGkH2eFDYTiTGik6OSoqZLMrC9Geb2JXk3PwKCV7xZ
 ddXKqcq6iKTy9wRvd1c2Tgnl1WK7eOty2GtV6Z8T4NvxZ+/ZUBgJMiut5HGUT0EJ7cSUuGP6Sk+
 vwQROcFfLVZk+lA2KVKPvXg8BwMxO9RtWBuw9qOPhvxjo7reLjrBWnkPDqQrJP/IcG0BsonHYG9
 yDgrSLS/EaxxLA2tUSKFmHgSdvEdvgWbmy3K04aJ06Wj0sXe08CePr3Q/jvI9jxDmt590a/t
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682afd07 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=a1UGM4vktcZ-V-6vu5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: XVO79d3tng-YTuF5sUBW__rQ_7VoatIT
X-Proofpoint-ORIG-GUID: XVO79d3tng-YTuF5sUBW__rQ_7VoatIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091

As per MHI spec sec 14, MHI supports bandwidth scaling to reduce power
consumption. MHI bandwidth scaling is advertised in devices that contain
the bandwidth scaling capability registers. If enabled, the device
aggregates bandwidth requirements and sends them to the host in the form
of an event. After the host performs the bandwidth switch, it sends an
acknowledgment by ringing a doorbell.

if the host supports bandwidth scaling events, then it must set
BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
doorbell that will be used by the host to communicate the bandwidth
scaling status and BW_CFG.ER_INDEX to the index for the event ring
to which the device should send bandwidth scaling request in the
bandwidth scaling capability register.

As part of mmio init check if the bw scale capability is present or not,
if present advertise host supports bw scale by setting all the required
fields.

MHI layer will only forward the bw scaling request to the controller
driver, it is responsibility of the controller driver to do actual bw
scaling and then pass status to the MHI. MHI will response back to the
device based up on the status of the bw scale received.

Add a new get_misc_doorbell() to get doorbell for misc capabilities to
use the doorbell with mhi events like MHI BW scale etc.

Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
which will called by the mhi controller driver can sleep.

If the driver want to move higher data rate/speed then the current data
rate/speed then the controller driver may need to change certain votes
so that link may come up in requested data rate/speed like QCOM PCIe
controllers need to change their RPMh (Resource Power Manager-hardened)
state. And also once link retraining is done controller drivers needs
to adjust their votes based on the final data rate/speed.

Some controllers also may need to update their bandwidth voting like
ICC bw votings etc.

So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
the link re-train. There is no explicit locking mechanisms as these are
called by a single client endpoint driver

In case of PCIe switch, if there is a request to change target speed for a
downstream port then no need to call these function ops as these are
outside the scope of the controller drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Move update speed logic to pwrctrl driver (Mani)
- Move pre_bus_bw & post_bus_bw to bridge as these are bridge driver specific ops,
it feels to me we need to add these in the host bridge driver similar to recently
added one reset_slot.
- Remove dwc level wrapper (Mani)
- Enable ASPM only if they are enabled already (Mani)
- Change the name of mhi_get_capability_offset to mhi_find_capability() (Bjorn)
- Fix comments in the code, subjects etc (Mani & Bjorn)
- Link to v2: https://lore.kernel.org/r/20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com

Changes in v2:
- Update the comments.
- Split the icc bw patch as sepertate one (Bjorn)
- update the aspm disablement comment (Bjorn)
- Use FIELD_GET & FIELD_PREP instead of hard macros and couple of nits
  suggested by (Ilpo Järvinen)
- Create a new function to change lnkcntrl2speed to enum pci_bus_speed (Jeff)
- Link to v1: https://lore.kernel.org/r/20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com

---
Krishna Chaitanya Chundru (9):
      PCI: Update current bus speed as part of pci_pwrctrl_notify()
      PCI/bwctrl: Add support to scale bandwidth before & after link re-training
      PCI/ASPM: Return enabled ASPM states as part of pcie_aspm_enabled()
      PCI/ASPM: Clear aspm_disable as part of __pci_enable_link_state()
      PCI: qcom: Extract core logic from qcom_pcie_icc_opp_update()
      PCI: qcom: Add support for PCIe bus bw scaling
      bus: mhi: host: Add support for Bandwidth scale
      PCI: Export pci_set_target_speed()
      PCI: Add function to convert lnkctl2speed to pci_bus_speed

Miaoqing Pan (1):
      wifi: ath11k: Add support for MHI bandwidth scaling

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h               |  20 ++++++
 drivers/bus/mhi/host/init.c            |  90 +++++++++++++++++++++++-
 drivers/bus/mhi/host/internal.h        |   7 +-
 drivers/bus/mhi/host/main.c            |  98 +++++++++++++++++++++++++-
 drivers/bus/mhi/host/pm.c              |  10 ++-
 drivers/net/wireless/ath/ath11k/mhi.c  |  41 +++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c | 124 ++++++++++++++++++++++++++-------
 drivers/pci/pci.c                      |  12 ++++
 drivers/pci/pcie/aspm.c                |   5 +-
 drivers/pci/pcie/bwctrl.c              |  16 +++++
 drivers/pci/pwrctrl/core.c             |   5 ++
 include/linux/mhi.h                    |  13 ++++
 include/linux/pci.h                    |  19 ++++-
 13 files changed, 425 insertions(+), 35 deletions(-)
---
base-commit: fee3e843b309444f48157e2188efa6818bae85cf
change-id: 20250217-mhi_bw_up-f31306a5631b

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

