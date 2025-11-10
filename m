Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B3194A73
	for <mhi@lists.linux.dev>; Mon, 10 Nov 2025 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762758828; cv=none; b=MdlpcPisk64hkYdfAXCWAAkC9T7GSs9KKY92oU/AIGqMM7Y1iD33YniEGb8hrrQXSCdHRZSpDwi2oGwxZqnxpoi5+7rr45UTBiO23369ltsVHeiGtJlouYE12PRXMugCDpoCDZHm+uH4530mybFv0eWV+STEnu7/P9IGqxZxZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762758828; c=relaxed/simple;
	bh=aP90UFdql0oDm4M3IKd3hjBXMgT+QNuJeGXRkHBd7uM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nOlNWta09i8s9Bq8tzJXAaQ7PF59WjPXs4tX7/GoYB/2V8WBitK1q+GQN6iFdxkTbscAUI+h2U8Q6hM0OMb+8wlj3whW6CQRhlsALxrmFhLu+iDHMEGbobWloCRKk+bgoKMkccz4fFW2FFETIKCOGC1qOKI/EUVsYzm+9CpEzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ds3Biz6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KF05XSyS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ds3Biz6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KF05XSyS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9LbZTx1413852
	for <mhi@lists.linux.dev>; Mon, 10 Nov 2025 07:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0u2kfrzFgA2dlZWSM638OT3Edc5mlVUf7StctKj94Qg=; b=Ds3Biz6WpGS6TTVj
	ZPtsXLMuRP/tFyCJ3GWZkDztudelWLciRKkb6as/+fk5J7auLMJmyRiV67nxflxh
	wqLabZjpWz0WeDwpDSVOpYMq/YNb06LsXZsfryUnkbRwNzNF6pszhk71p9L71Eyk
	d8VCCceQO0cvJ0hCsKsIeBNqnfXQsFu8QUhkz7llChyGFjs147hUXfJbTuTKZ6IM
	jvPxaaSn6hnydst5Bc0KMp6Uu5qxleRLrknvIdlJg36zNKXWH5Sjnqd8M5CFHbMK
	y6GVc0nr9S+0ymrN0zdWpDVI6jX5No2P75dDnzqPo0ZxzCI9TSaaKJmaXF7B9ian
	iOFqCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab2nxh2qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 10 Nov 2025 07:13:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b0a870d3ebso2787526b3a.3
        for <mhi@lists.linux.dev>; Sun, 09 Nov 2025 23:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762758826; x=1763363626; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u2kfrzFgA2dlZWSM638OT3Edc5mlVUf7StctKj94Qg=;
        b=KF05XSySH3CEFGErXqxPM4NsKpHthw1lP8Q15qqDrslGZM8QIKl+baBVBUIcMT8TUi
         VsIEGXMlfTSaW+y3Sk8xZ0nmxf42fQPs9IgXLCGRIwhfThJbwhPygRUavw2OjVSXTp2g
         cc2JODO0Q7EBfYN3CjvJzaqYaIWsOqxbChNvr5vh4MnpNzuC5iYa21La55sZ5N8YQsBA
         hHWPmGL/KDDw7BwfKpvIRBeyO2xQFl+g4C9pzIHtAky2QUXf0br1CN/fKYWzYva4dYJ2
         3Si2gR0lJM/fC5v1kwFZBeZOa/YIU5cTH7hl5m5qXeU/MMeBFsCjZlsQZOvsc1WgMjL8
         wRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758826; x=1763363626;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0u2kfrzFgA2dlZWSM638OT3Edc5mlVUf7StctKj94Qg=;
        b=TCsegth8k/NGbFQ8SR2pNrbrpU7ESHvY0aqyOH3krbhHJGOtneGP3/myU7036Ofr/P
         inwN2ZEzb2h+VcyvfeycWLIWq1u2VpIDSUfwKKHWobUict4oiwZ5mZLVyNpni+YrDL3B
         uXReiy18QpZPEeN+GCA6NrEfo0B01cJZiId9MK3uND4APN+jnQSI9CTScGOrOLyuZ1v3
         oPHkZWH0v5joFLz98dnampkIwdKsB+eWJm7CcM7agrAFj8b9/nosvbtsgA+f9umLXWWY
         0HHH/U3IwTx8oiB92OcqEZORBEjRDDBsjfuwEXSbsFd9aoVyYEfiGigLe1ac69qTDX6W
         bMHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzvpvJLxa41wyBzi+0MAjWXEMWrNF4Xw0E/x6PWqF5bxdisPQZ7vI0/22aJtShHEKU/OE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/P+jx5la0uMRUQg6RKw4ZWTM9dGBNOtoIzeulqfEBBMUhm1D6
	ouY4c7LX5s397OfSnB/CvlGiOaY2mWHJ+9JBAgfafy/EG5wOb7+n77y9aeGrCpM4pmBMAse0DJQ
	yavTCQ40sj4b6flvxO0CKCZL4iZdu2Qnf7MKoyyaSKK5ddgvL3XHbUr4=
X-Gm-Gg: ASbGncuU3Z0ckfYdQ5LyOCtc03Y9XduZSQwW+VHogGjPAtYxSqUfYI23l0EHqVVbaih
	6RCImSK+hzIwr2zgUzCZ1SfdxO2cVgiqdUMElLbOb8VgZxph/a307GsRk69Bt7W26BqRU3BPW8B
	Uxt6xVAvc5tY15hzvk7LzgA0QITGZF8npmOqSRns1qJaYD2TJI0sLtAuAXpnlP7qhdjQkFORTC3
	+ueLMvs1LwC8kDFJQAhBEjyJ/RPhPh65sU28HOFCyAesBaOmkdknUY0C+0vDuqpIC7LE++HsY4F
	jXAr/AeAqFOlk55AFqcDLKfJi1vE419cFdtTqZM69+N70d3zNv73iGUhpGGIovgyGvohUOm16iX
	eJ8dtYxapaFFDLbpXaVl8l0OKzXEBRP8=
X-Received: by 2002:a05:6a20:3d84:b0:342:6c97:3693 with SMTP id adf61e73a8af0-353a3963648mr8974964637.47.1762758825665;
        Sun, 09 Nov 2025 23:13:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1C5fouoELxALLyfIlIbLBUhu4F78OELcJ64xUUUD4/zEp1jk85tJkItOENf41QpFQz1AJhw==
X-Received: by 2002:a05:6a20:3d84:b0:342:6c97:3693 with SMTP id adf61e73a8af0-353a3963648mr8974937637.47.1762758825119;
        Sun, 09 Nov 2025 23:13:45 -0800 (PST)
Received: from [192.168.1.2] ([2401:4900:884c:92ad:3fef:1d6a:49a7:308b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8d7eedcsm11924004a12.2.2025.11.09.23.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:13:44 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>,
        Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20251106162430.328701-1-marco.crivellari@suse.com>
References: <20251106162430.328701-1-marco.crivellari@suse.com>
Subject: Re: [PATCH] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
Message-Id: <176275881845.11063.4284661115624687.b4-ty@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:43:38 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: vMUdvua9gbAQoQ7uPIJ0JrRJSJWMA58M
X-Authority-Analysis: v=2.4 cv=DJSCIiNb c=1 sm=1 tr=0 ts=691190aa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DXX0947HJyerphLxgaYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: vMUdvua9gbAQoQ7uPIJ0JrRJSJWMA58M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA2MiBTYWx0ZWRfXwWarRXdWN0ms
 QCkC2ZZk/nkyUbVAHKjZfE9yIgCBqGvS4X7wsFYS+C3ZMGAVpHvtYJoB5qW9j6JofChom8F3koE
 kvEr/BZIgsmBd9sn3m6yXVxKqhT/c/M1SXIhLFVZnsTtxdsSZr9HR0Ebrg8OhOCmo8+TNQ+N9TQ
 6njr7oOdNROpUUaogiPJJSRlJ46llQhAeMIRmNDaxSFEFK8/614PjvfsfPfMkaIS92Y36ZVAtje
 xbCjSp43whYq+kKguShR4XNde9bRASn0JBb5WrROaJ7eMRQDxZa+GKIj9NjD/VgSZbEGTqggcTk
 ZbyHD06wmvrRGgBjwJ8zua++3CInMb3P6HOHFFKaDjUzYaWlgKgQieJcDcPdSvHRgFQdfIpkNIa
 6tyY1Ib1t2AAFYD63xTb4//psSzu2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100062


On Thu, 06 Nov 2025 17:24:30 +0100, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
      commit: 9e24bdfecdb071a3a42fb74be1ab503c958e2740

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

