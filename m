Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093023;
	b=gKw9CwzQrSUYIhfzTTNf04HoCHU7G+4wa4wDot8dq6C4ua2ZVLZqeFQ7mwmk8DTlUivr
	 RenPCJWj1l5r5yOrNU1km0OWk6N2IxdAF4nNcT7z53CCxDeFKdKV/VVdTIqxctVKtopuO
	 iuL6xusv9l/dWr+Gpw1+OVmPbVKhKpoT2PPcK+DPHzb1sHYhiju29IfbZmS0h1NArwO/X
	 AerDvHa6JUHMxy410AScDTTPGtER8rv3rU80++SA19kg3AqAXR6ug35ISm65oDRGOs34T
	 m6xkDsLhZLbi6PVL3gBgjLC5P6zxeYxgJBvpsHblN5YESIQl+mOM9k4/QxtVdQOqq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
	b=1QqMtu8y4sHjhrjJTeON1gcmicvOsJmOmXDjv0UUtAirJq45viWqS+/Az6PlXDplW3Ih
	 JgJb4LqIghoMXB37O7Lx9NuBceBaYyMjuSsMBROgPKnoRvH3zuToTznorwQ/ZM1wq8D9m
	 KZgotZXlRz/KvmJphqBDeV7aolFU6kSv435x5O5ea1MrB925IcROSafsj9G01SY8JxHE7
	 nskUxmeVdzLGFFZQbD8Q+9G0y8NY74WbiSq2qujfuQ9TWXHgdo45Se1EqZZmLHtNFDinJ
	 HAynKwWDFIRkUei/jyaQWYCgGC8eYbPskPAwrT5XNcDQ9l/gEn7gRXj4f48Jnn1GTqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3hWVpBU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B5606A326
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oBnV9XRN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3hWVpBU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkNLM2219654
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=; b=oBnV9XRNseDfl5P8
	2AscwJxNZGf20yy6EJFwl3Zm3gjUkPbkGy+EOIa2qpQ1BM0bJCsmhZTiidPWYwi/
	y0OcXHMgnn2Wbo1hxB+UbsgFJb5iYfX0hYmw3+t6EyUo/mkWWxI+G62pX+qE5Tp9
	4+X2XVG62d8B0H8bqdN5TND2DDhCPYh74yspvPaqJTQGLwUktWx47Qpv4YMmFTx0
	ooNYWnUAmGK2rfgIqn4PJJfhVP2L7kwRs2n0jzrCxfNH9vDtOVrj+VDyAmGi+Naz
	UwWRud5F9UecXjDeeFCDeTk/9PirC1a0tsNoufyDkuUju+Yyp/9yHRk9dkju9tyB
	5uQAOA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uux9kqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 12:57:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so5362191eec.1
        for <mhi@lists.linux.dev>; Thu, 19 Nov 2026 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795093020; x=1795697820; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=X3hWVpBUBim9gpCGZgTsQfB2/dPu0hSN/d2pVFaxLvXHM4NI6w4b7uFIFj+XjmDOse
         i4BBRTGxHgUFp/nI8y/vqzvzO9XngdOQbWVA5xaKQ/hyjOoQoU+CxPnHF36Cn5JIgSUa
         z/swjXSAPPGEByiZYCW7vBWhVe+OvVcZB14Fsu5ECddDjaLFG+HW9/inK/OQ2lRUf5md
         xgqtoOiVxmKwtgx7vb4Vtstwv+cO0rxLRDLtgkbmZ50w7TYHhe1R72o5QZemtGACb+VT
         kchr3sKkX4MbdTgm3XyehhOV+e4WZcu5OpaON0aITogY9cOMmL+U/B98GPGPljTHMEQL
         C08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093020; x=1795697820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLWNs49Qkh88os+S3rSjxS5Ge8dCLFObLWe3Wwl6iAU=;
        b=nhkrnEo35RAYQtiZ8NB68fO+KHLbZ31n1kUMjP029HA4gc5sOh0V05reqZ1T6zQTFO
         9l9IjyjVbErT4sbkRknzc5seAbwnA4l0AFWb0cwAZ+qwCPUc3N+wDLl+mF1zHDHhJpvP
         9Eqi7EXKRO6+jXJuWwWIYWxU/x1NcoHWsXx7S5l/h91vmSZUj0gOVtflywpNVDR7vgDI
         S2AX8cqFPEn8tSCW9v9c35ancvVNEXKTo6njWiynhkFMJ5ZW7p+rnUB8/r4nM2JvE9je
         IbfbqmRjhcMFbRMY5fUqqnZ5m4Apl/pC0fNjcgCnqP3tDsNqoSf2w34jUCve6zjiYlg1
         CzWA==
X-Forwarded-Encrypted: i=1; AL+hErF31WgzgdI9Sw7o3jU16I+BqApp4thvcFq5bMMDHzRvYWHS21rTNutQiunimaUnZJebhNs=@lists.linux.dev
X-Gm-Message-State: APuU4Z85J4Ts/a8WAL/pH61MhNMqHVm3os50fSpDNCZeO+IKYqATUAJ0
	lwCxZqyGj5GYSAPxZdG5YHJgT79wQszGEXMz8XMKVcS4STSZ8ohv3AXzVgxTOVdZmDs3HBpltOn
	8h0B7D4ICVDqfJhFn8WsImBLfzUzjpoCCskVTnAno1Jjxfw9madxAqPo=
X-Gm-Gg: AZFdTZelbFKuY9WfLmBKr7hA/n56vAT219w4d9k7rAFNW6zuMyoCDQTAXgDuihJvZ+d
	bDuTKZy3PgBBrLSUkqV8PnpZeA82/kDRnfnTyIQ9/PYnsJ4p6I1LTN+5YeAUDzZf4pRLgMbJSFS
	SOwmhK14NG1qY8tkrOJm8sfIhayQ4DnsHKbXj88RAWMom6dN1Tacls1LtOh4yhLhLEx7JCcbBPh
	eXwWDdi9J5hFDbYwaAyMwGyMFb7nCrlq+iqahyXVaM9rWvDVKBj6cWOTJtAFzQepjzqte3Gt8Rv
	COBSjyt++9QerEVKr0dT7RjfKR+BzThvFcsic3uk1Tp3HlHZNZ1H0on7jjkviia7b3B5L9eY+BL
	/AKZ5hYR1djkfeuBhfnjSFDJP2I8KuqZseMBEPvMzI+AkrErnEIZrA6htSUyrLXUWdwVAm8IoWY
	yWCy/0ZLXa
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958719eec.22.1795093020386;
        Thu, 19 Nov 2026 04:57:00 -0800 (PST)
X-Received: by 2002:a05:7301:4b08:b0:36c:b138:651e with SMTP id 5a478bee46e88-38280a3c809mr4958700eec.22.1795093019864;
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm18529369eec.28.2026.11.19.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:59 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:26:33 +0530
Subject: [PATCH v6 1/7] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Post: <mailto:mhi@lists.linux.dev>
List-Help: <mailto:mhi+help@lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mhi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bwscale-v6-1-9a9a715fcb46@oss.qualcomm.com>
References: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
In-Reply-To: <20261119-bwscale-v6-0-9a9a715fcb46@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795093007; l=5883;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ym0w2JFu4Q8J6SLUhmOn7q9U3/O2c9O+f8dhYs9nmZk=;
 b=GKA/21jMYBH5Y5+9KJeS83+AIQ1zL5YHNq0gXkifEGDCeF/dctt/LHjNzfDkOJyveKlXI/nLH
 qP9dXMNA6ynDswC28JhwmChVx+Iz5srSsrFpQNqJaXTrRR71SdZjLoM
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: ODm6qB0zK6h0bscaix9QvZkyV1U51wmu
X-Proofpoint-GUID: ODm6qB0zK6h0bscaix9QvZkyV1U51wmu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX9DlI9+3+yErj
 byPHGEOqsl0Zzw3e9QMUY9hAHSV1N0KiiS+RjX14rlRvm3f0xGAtLm5nsq4xf+G68Aeaokp1KR2
 nhCp5MeBT7azHsFjyRPZ3QmmrEp5cmw=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6afef21d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=m7h7XtmfQhPoxq-7kmMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MSBTYWx0ZWRfX39P038vtDf9i
 GGDM8Lx2QGJ1CkVoKnzO8+xsQJ3c8Yxk+zhPnVsAyErW2GajZs29zMxFVqZKvgylu1U3AgmAO8v
 2YuD7B9KU23S7yz1UGZAtViYQJZChXXe8mhXPtecQmOCJqLkG+owfO8qK3OhRlENMrxPB2Qp8Qz
 rGdxVzcLfVlgvljqg2UkBIJhEwQk+Ggc5RHBvj5WT0OTb0DwpBoVXbnJkoxbZ9cKPN1QGPVPMaW
 u91jknnjvyRt+4FaI7AKW1gCNJhTjLAN9izDZw5vPESkXxLk2vrb74FHpICPqeivyT/tiMHJ7cd
 bGc/F5FqHzXXB0H+0+8aF4ZF+/4BLMO9HUBNyYBFvC60va9D1FwM2Hh3kEcDp7LhmcvfZS16Cey
 5THbmm/YHWDbgnTjSRJxmr5hwFn+U0AwNK7ZYR0f+CAYAUC7IX6oPDBxxc7mkzttyPQ0aHPnSdB
 ibMBlRaLOEpgO+2NNZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190051

PCIe host bridge devices may need their operating point raised before
retraining to a higher link speed so that hardware resources (e.g., RPMh
votes on Qualcomm platforms) are available at the requested data rate.
After retraining, the operating point must be updated to reflect the
actual negotiated speed.

Add pcie_set_opp() to look up an OPP on the host bridge parent device
using a key of (total link rate in kHz, LNKCTL2 Target Link Speed
level). The total link rate is the per-lane rate multiplied by the
link width, so that OPP tables can carry separate entries per generation
and width, e.g. Gen 3 x1 and Gen 3 x2.

In pcie_set_target_speed(), call pcie_set_opp() before retraining only
when upscaling (speed_req > cur_bus_speed), since only raising the
operating point requires pre-staging hardware.  After retraining, call
pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
the votes.  Both calls are skipped for downstream ports of PCIe switches,
as those are outside the host controller's scope.

Some controllers also require ASPM to be disabled around link retraining.
Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
pcie_set_target_speed() saves the child device's ASPM state, disables
all ASPM link states before retraining, and restores them afterward. The
child device is used because the ASPM core ignores requests made on the
Root Port itself and configures the link through its downstream device.
The states are restored with pci_force_enable_link_state(), as a
plain enable does not undo pci_disable_link_state().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
---
 drivers/pci/pcie/bwctrl.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/pci.h       |  1 +
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 3b1122461ffd..c1e749df5bbe 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -28,9 +28,11 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci-bwctrl.h>
+#include <linux/pm_opp.h>
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include "../pci.h"
 #include "portdrv.h"
@@ -98,6 +100,37 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 	return pcie_retrain_link(port, use_lt);
 }
 
+static int pcie_set_opp(struct pci_dev *pdev, struct pci_host_bridge *host,
+			enum pci_bus_speed speed)
+{
+	struct device *dev = host->dev.parent;
+	struct dev_pm_opp_key key = {};
+	int ret, freq_mbps, width;
+	unsigned long freq_kbps;
+	struct dev_pm_opp *opp;
+	u16 lnksta;
+
+	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
+
+	freq_mbps = pcie_dev_speed_mbps(speed);
+	if (freq_mbps < 0)
+		return -EINVAL;
+
+	freq_kbps = freq_mbps * KILO * width;
+	key.freq = freq_kbps;
+	key.level = pci_bus_speed2lnkctl2(speed);
+	opp = dev_pm_opp_find_key_exact(dev, &key, true);
+	if (!IS_ERR(opp)) {
+		ret = dev_pm_opp_set_opp(dev, opp);
+		if (ret)
+			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
+				freq_kbps, ret);
+		dev_pm_opp_put(opp);
+	}
+	return 0;
+}
+
 /**
  * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
  * @port:	PCIe Port
@@ -118,9 +151,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
 int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 			  bool use_lt)
 {
+	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
+	bool is_rootbus = pci_is_root_bus(port->bus);
 	struct pci_bus *bus = port->subordinate;
+	struct pci_dev *child = NULL, *dev;
+	int aspm_state = 0, ret;
 	u16 target_speed;
-	int ret;
 
 	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
 		return -EINVAL;
@@ -130,6 +166,27 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	target_speed = pcie_bwctrl_select_speed(port, speed_req);
 
+	/*
+	 * Host Bridge resources may need to be scaled for targeted speed
+	 * otherwise link might not come up at requested speed.
+	 */
+	if (bus && is_rootbus && host) {
+		/* Get function 0 of downstream device */
+		list_for_each_entry(dev, &bus->devices, bus_list) {
+			if (PCI_FUNC(dev->devfn) == 0) {
+				child = dev;
+				break;
+			}
+		}
+
+		if (child && host->disable_aspm_for_retrain) {
+			aspm_state = pcie_aspm_enabled(child);
+			pci_disable_link_state(child, PCIE_LINK_STATE_ALL);
+		}
+		if (speed_req > bus->cur_bus_speed)
+			pcie_set_opp(port, host, speed_req);
+	}
+
 	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
 		struct pcie_bwctrl_data *data = port->link_bwctrl;
 
@@ -154,6 +211,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 	    !list_empty(&bus->devices))
 		ret = -EAGAIN;
 
+	if (bus && is_rootbus && host) {
+		if (child && host->disable_aspm_for_retrain)
+			pci_force_enable_link_state(child, aspm_state);
+		pcie_set_opp(port, host, bus->cur_bus_speed);
+	}
+
 	return ret;
 }
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9cbcadd08f3d..352079393edb 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -673,6 +673,7 @@ struct pci_host_bridge {
 	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
 	unsigned int	broken_l1ss_resume:1;	/* Resuming from L1SS during
 						   system suspend is broken */
+	unsigned int	disable_aspm_for_retrain:1; /* Disable ASPM before link retain */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,

-- 
2.34.1

