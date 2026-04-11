Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C010D330656
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895147; cv=none; b=p2jUARAKjkWxzh9jt4wowBWsqzwoh7/RTB+AOOjKTmgGrJJhppTLmLTpQaL3Iik34bld/u+Z8AEVDx7YdyC3inhuDNLVh4FB6Z+H7d+FGqdq23j+Iyr+Mb3ZXcFR5muO6nrutA8H5oprEIobcj6pR63wE70Q9vFraxBj+D3UG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895147; c=relaxed/simple;
	bh=bNm4FHJN/H7CAep6Q4VeTzZQ9jW7ATrrShBqTZTmcd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ry4770yQJhcAhyXqi7mW3AJmbZuMjtqXrSByXpmgHXjt6zH1kw2grPb3zs5waVAIq3Z8sIUHe+jE9eXm34Ax92a6abWyCaxZk0SPuVtOgJgOik/LW5hbmEu6t4v5Nj99iUOq96XbuhSNT51toJ/rAC3VXvE/3edvFicz5LUoLWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sqehe7xt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gdeq9os/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqehe7xt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gdeq9os/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B404C7516627
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqnBZH3Vk86Qatjz2YHaFg4xbKbquw6POFYBokCnei0=; b=Sqehe7xt2O5emA44
	X7/NvqJ47XykNDRqG0DpDHPFCMdeBZ6fZPmqjeWlB+ZUr3/3vnZbC0o0aZHwnwOI
	AYVqLbpVjojA5ajS/6eBsGsqGYfTNswIuOci7wFnZnNIsIRlGOzy9McrAEwI54oC
	20QJqUWpt0xnQcro5rIEe2ALgl7quSh4GgJ/xyiImZ/4smB/yXw6vi15EpZL3vTu
	b+ofDbFMJEG9FPBXV+CyYfgI4+QfnxFMTpBpo+a67I7RRXOAKrravYdb1W+TRuIn
	yLwEXyt5IRsnN2u5aQ6G6m/wwkrmZbok7rkv/TcT8Vtu1ryovVwGQWOFwU8b12cU
	L1z4Xw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtgc1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 08:12:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b06f37a7so1481959a12.0
        for <mhi@lists.linux.dev>; Sat, 11 Apr 2026 01:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895144; x=1776499944; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqnBZH3Vk86Qatjz2YHaFg4xbKbquw6POFYBokCnei0=;
        b=Gdeq9os/+HO2oqELwl1spDqD3DJJh8KoMEcHeg98/P4/d9d8UP2t0Hmi5SHcXX8byC
         8L6fkO9mGiZH7GQ5+xt5g+BbbZu7d77aqqpDbXFD3G3eevC7xTfSfT4OTjiA9DTBNIUF
         XK0yJNq+lCN9mt8um7qwUHYtnKRCPRfkJQY1+5M6+XCMUNtI5CmmJ/GaF+9VgGyTGz+3
         Rd/xjNDxkfE4uXoqjocFj4ij/j/ksQEP9V/NrIlO6DtZuy6vTEJzn8JeQbxYKJxJ7dDM
         NdABWbIDVlJ74bQPI4wxqwd733xQmF4sL6HgHBehk1L+ue2M0TG95K6dCI8ehjqnwLZE
         rnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895144; x=1776499944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqnBZH3Vk86Qatjz2YHaFg4xbKbquw6POFYBokCnei0=;
        b=D+apSESRilYKJZUNc98vLwpxiI8shyOyi+9FMozMnd9Vxl4cmgyM5BhUvU1NkZvKE5
         E4XlSfh86aP+JOsUMH0afYVf/K7XtSYZuSi2Xr5HU/N0wD5v3CQ9KWsnJ17wRepBt4Jy
         znPifm7WuBFAfiQyl0VGW7o2ttTCHJd6be+L4Zdb8f4Lt0BZHmZFGD62fshilh2X1+rR
         ymMN6bMBpylrUZxwkzq7R4ulSP/YfqhitLRCgiHMOmced0KHrBK9gHGucVQgHV9a6cTI
         CSrESzHq9aih8UwxgSOdqZsqmXC/CgEaUGXHB3r9kKZ1GJpZGLnSljXOHoeHZUGjSUHj
         PGlg==
X-Gm-Message-State: AOJu0YxiEv0VtW6aI4T0S8C4ZjTzFnzoxghJbAVfd+QBtbmnmwR704B7
	7rtvXDMVMyfaA6Rhc5tDp45yEqCTe50T76skJC+HNgiKjEtEtSmXLdArvVOunTfMhDEggNtgK9a
	kC2yqjEGcHX4YURcUtr9q7f74AKzGI3zNKdzGkXk0y4NbO+YUhSV/uY4=
X-Gm-Gg: AeBDieu+ToRjeO8V2XG4ZWJS8DFeqVqDva4A5xyxaDII8DjMGW8XhV4Gwuu1QknmrpO
	GTj6zWgZzbzcLEFYkZxI3KBV0YL38f61kznDN9K3Cxprg4PcAO82geaYnbKWQXGITtWM6cPAgss
	p2hmPxFGYusDVf8TXIGlPNXc0he82S0fZaa32ORZwNjD/fTP5fmVW9iky0oyIMTdkW3ej3pNUwN
	foXszwDhxztH0k1m8/hMIB+1r/6/Pb4zQnlLhrijs/JCCeQygIYmIA9IdkIqCbNgT8na5zRx+E9
	Xc6O5PraMNgy7gzeDlczN4LGnLvtEQCuKV37zO/kGwEaHcTXLocx2hiakF/cYx1yhPUe1+hm6gP
	SMWAN1S9pPwFCi23vkSj1dLE3ezsBbj/YYfXErVVb/LS9/yCE0NY7e9H1
X-Received: by 2002:aa7:9e9a:0:b0:82f:1f49:dfde with SMTP id d2e1a72fcca58-82f1f49e255mr1381769b3a.37.1775895143689;
        Sat, 11 Apr 2026 01:12:23 -0700 (PDT)
X-Received: by 2002:aa7:9e9a:0:b0:82f:1f49:dfde with SMTP id d2e1a72fcca58-82f1f49e255mr1381752b3a.37.1775895143172;
        Sat, 11 Apr 2026 01:12:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:22 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:04 +0530
Subject: [PATCH v2 4/6] bus: mhi: pci_generic: Add support for 64 bit
 register read & write
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-4-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bNm4FHJN/H7CAep6Q4VeTzZQ9jW7ATrrShBqTZTmcd4=;
 b=lHGF/AOsZKqrQwdWZ666QbhuwoZM1jYW/xq9sKJYFmvB3YcRlxXeE/Jgko5De/O6vbkTF7H8q
 rx+F5WuZDtCAyoCAVbNpUS0Rpd4PiKpRGWFn7bnRUbKzu2uXYVBtn5b
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da0268 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MXGvhfJtNsboA4ndukAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: MrdZ1Qektb4OXsuLwATIxjHszEOuKCBT
X-Proofpoint-ORIG-GUID: MrdZ1Qektb4OXsuLwATIxjHszEOuKCBT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfX/ts6C1SDL80Z
 PAXrQ1itDo6u6Zt6J7rmBZTUPmfQ/YN9wFQU4qE6Lb6ahK2jQo8UltfoRBKwkA3lJE5blDKqw4V
 TiXRCT3B7gdHrZsZe+gvL8szstXYEZ9+/Nu1rfE1wWhJAMBYZQdXy6WjhBmBZjhlWJgEh/7+xQG
 l6UdHVcim8syU87ygRQQhLzpWAFEXPrNX3sFAS/Q7Dfuz1Tn45aakqrrgWJ/1dBLPJ46iziZqUM
 OAb6hM5FS/4oogkgO5GiHsh1iqaCt5K8Pg9N2iT8a5q/1BbFPZ01mnvXUK1V8F7dxR1GXFxHKaa
 jZ6gvFSEkWlVfGeXl8e+69GDD1mqkKkgZJrzQB6k8/8EqLlC1421agwiIaIiNpcQOhUz2IKfMH+
 I3inPWxdRieMrCroas1l3pPqGNVh+MSYWTTtel1Wj1tr4gerux7tIAPZPVX28asBStKkjE2eq3/
 yX8+w4YSYfWCk6xw/4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110062

Add functions which does read and write on 64 bit registers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0884a384b77fc3f56fa62a12351933132ffc9293..b1122c7224bdd469406d96af6d3df342040e1002 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1046,6 +1046,27 @@ struct mhi_pci_device {
 	bool reset_on_remove;
 };
 
+#ifdef readq
+static int mhi_pci_read_reg64(struct mhi_controller *mhi_cntrl,
+			      void __iomem *addr, u64 *out)
+{
+	*out = readq(addr);
+	return 0;
+}
+#else
+#define mhi_pci_read_reg64 NULL
+#endif
+
+#ifdef writeq
+static void mhi_pci_write_reg64(struct mhi_controller *mhi_cntrl,
+				void __iomem *addr, u64 val)
+{
+	writeq(val, addr);
+}
+#else
+#define mhi_pci_write_reg64 NULL
+#endif
+
 static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
 			    void __iomem *addr, u32 *out)
 {
@@ -1347,6 +1368,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	mhi_cntrl->read_reg = mhi_pci_read_reg;
 	mhi_cntrl->write_reg = mhi_pci_write_reg;
+	mhi_cntrl->read_reg64 = mhi_pci_read_reg64;
+	mhi_cntrl->write_reg64 = mhi_pci_write_reg64;
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;

-- 
2.34.1

