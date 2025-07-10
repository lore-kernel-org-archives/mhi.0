Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F125F796
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151618; cv=none; b=WLONOiZqqqSOkJj1+ps2+PlNQN+Jye60KgoN/4tzJ47GHEemlxvejSTpo9apnmKfvA3Q7wqnImggLSGFoUPzKI+mojPQ9zAC9vGLtPiOuKwRwHsonQuWypHVRjbqLTvPN67km4T1aWPm9E/m7Gv0UUoEceTqIACTPjgmDmvwR+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151618; c=relaxed/simple;
	bh=na+u8g59eooGkQR29QZfM0thwy/I+CVeSWbBhPqsdd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea/hNZ5P4M7125da1+PmQMYENrJ2dau9kyDtGD9Galvz3P5GqU9UT7emBNEuwMQsBGPOz5FTVJvLKeMSnSyRHzZ2j4C6+TZM3szJ96kbw4QuhWqwsI1vd7rGywLqvmV6ePkWJe44nEs3q0Njy1Nhd+V5mTun2Rz3RpDXzvinHnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFU94fcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFU94fcN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A900VE016172
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 12:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtA4kuwweCCzbSwKPwc94SCzNcShIngig3W8sfl7IDU=; b=hFU94fcNH0RxHwCg
	HFGHrz6MPMYYMndzbGlACDmvwsDGTYSijgIVdSvK1+4Q6rm4k7EAh02keip5wKfv
	oJ27WAMVSi+ZeYZSjdGXHj5aH9XnBsptU438zEAHuzr1O9J8drCeEJ3muG1qXSh3
	/MlAPX9kqou7Aj6Q6kWFQ+mXImW4jQnmweZIKVzUC5KYA/0bMPm8qPWeczWlf/6U
	DYKCMmowZznvWV89fjL7N8a9rgDK/e3L7n4iB5pVv5ccRCtFMUGkaBrR5VfgiGrB
	YQG892Xi12iv70HKn/uPZn2RS8hwxz0vhG/Hxe6nmQms38szSwQStWYvqsKkx7Fh
	/6Bfow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefreqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 12:46:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso26126585a.2
        for <mhi@lists.linux.dev>; Thu, 10 Jul 2025 05:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151615; x=1752756415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtA4kuwweCCzbSwKPwc94SCzNcShIngig3W8sfl7IDU=;
        b=LFCI/+r9RpjknW+MYyWuu0yFWQu+3+oCXl8MkaAJuP1p2HnrApO6H311d0aYN+p0F1
         ASYocXBysJf7l8Nb3DkUU+yFdx06/XLywaVswZ0gJjYy9BQKZjfOW4p+8AmNgL8MFlbh
         /ooex8UHGqJZRz+cup0S2QkUTRX2igt3O3dw9sCSj5M24J62H4PEqpVn8mzIe1ti6+ez
         PZFPJlgJAbog9v5eDuVFWeOKnwBgDDvvjpd5fhy4Kq7kJ6oIBmLS7MmYhYLNH+EcqYK7
         SJU6uw/kOdnMcQd5ydNLyYMGOtsnMOIfxAnrZJflnDeKfz01AeC6b87/foDoGtJLzPYc
         oVDw==
X-Gm-Message-State: AOJu0Ywtf9LWgEfQXqb52fPBHqcPs9FHzFHP5FYGgQ8Iqyu6RKjO+rfB
	emf2ZQQ8DKMjPJzukvd70oQT016fqkAURKKiP20Fnig2m4SEgY2CcQcl00+yHP2diZBDE534dF9
	7XmrwBszt5JRqG2uZiuQ3L/JWJ50JuPq2yU9MysRXOdBf77lsOATxT9U=
X-Gm-Gg: ASbGncvMam2/2KKhXJMmk93s7XQoobhwwzKIOEElda4QkcQgQ2fgGu7TnspUttVpYda
	bzOHQMxNtUig5pO+IspZ9teIn0G9g08gPxtjrzJsYDKIi1a+VpuCfzu1Nk7nXoTExV+ECs+FOGr
	1J8CS2rdXw6yIJJ5pKfHmqs+QFvXDjWCikwbChlgFa+Z2sgXXlPLj5xFej388G8KZOCVDF1N5eI
	MHpTcp19ehSZbLrk0CuTKlIX+cZ1zQsECkXmRuYQxm0Ut2X+GBFY833C4YIFbsSGYyre4ySOB8p
	5yL1fqMJW7p4wEX08kKMao6TROknkEUuXHYcv5Nce1fKEzr+b8kd3M44/b7sVgjZYwfL9rkaT8y
	/HgM=
X-Received: by 2002:a05:620a:488e:b0:7d4:4aac:33cd with SMTP id af79cd13be357-7db90552afbmr345643485a.13.1752151614543;
        Thu, 10 Jul 2025 05:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2fKFA127cNTfsAIaYwVMHS86Ycrn1vr4U6fqBaR9/PrG8hz7GzSfVNTjRbbEfFWJGJLsDug==
X-Received: by 2002:a05:620a:488e:b0:7d4:4aac:33cd with SMTP id af79cd13be357-7db90552afbmr345640985a.13.1752151613874;
        Thu, 10 Jul 2025 05:46:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7f15803sm127935166b.70.2025.07.10.05.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:46:53 -0700 (PDT)
Message-ID: <f80d4e32-0f28-4a90-9db4-05c95e260658@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:46:51 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] bus: host: mhi: Need to honor sys_err at power_up
 state
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-5-4bd862b822e8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-5-4bd862b822e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwOSBTYWx0ZWRfX1XIwhEpIPl+X
 nklZt1NDzWspsQC1hrww9hoDLvD0jbidzmPJp577T+V0klEVntDbT/k1NDIvz8q/KX7wksIrEu1
 E61ZHDE5ZZ6/ocoOf3Y/2PVdEzSIVh2vmyB60gmb7Rx3PGMYUgDihzpf5mz3egac/EIwRbxzViB
 pmHDWWb+7DVrMyetUMFL+PLse8U4gjy3n4xo7hm6qRFTFEbU3WfUIret2NmDST7P5H5Qr9Ej7oJ
 f5AUyVRdoIJE7O9jV1yr5oqurmx9akfuM9XX+Sa4Ke7UllmXH8ZKNc6d2ziFS1rgU7nJbKlT9iD
 OK0LGeqTrPJ9rCIzLIUNaU2qr6uQ0Gs7/NAfYHPC8hbC25lIqbcyQxFLBheBoxvQxFTc7biPnPG
 itVvhkf3nrRQ079o75sclSc3dEbYBmEGx7FdcpX/9GufqZVQIBlvHAPI9iQDZppolmBafzCb
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686fb63f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=oYOKNLqQD3L5wEaBywQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Dfsj5hwhmyR0yI15EjAn1YndeEbxX9e7
X-Proofpoint-ORIG-GUID: Dfsj5hwhmyR0yI15EjAn1YndeEbxX9e7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100109

On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In mhi_sync_power_up() host waits for device to enter in to mission mode
> but SYS_ERR is an valid state, If device sends an SYS_ERR host will bail
> out for wait_event_timeout() as MHI is in error state and if MHI is tear
> downed sys err cant't be serviced and mhi can't be recovered.
> 
> If there is any SYS_ERR, sys_err handler needs to process SYS_ERR state
> and queues the next state transition for device to bring in to Mission
> mode, so mhi_sync_power_up() needs to wait for device to enter in to
> mission mode.

This is very difficult to read, please rephrase the commit message

Konrad
