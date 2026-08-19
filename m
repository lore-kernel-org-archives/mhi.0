Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F63A3821
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132892; cv=none; b=BiB82NQopFSwOdeee/uKiT9rG0x3CVDrA8B5KQOZeAkP6btp8+atxlevc+BOYr50t0QZID9AE/I6Q/K7oTAGQq3/gwYtd8O2hVjTsLB2c4iXp0iKwvRasegqrJXCJ++VXzWHSbQb9bAaRJgyCMjjPHhWmBc5zT818dmXQ8y+yzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132892; c=relaxed/simple;
	bh=hzjsG/UFK3xGq69qyQJ+CCQJo/ZUjvghHqH0/kNQHmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WD0Fhgk5b6M6DP1oV0QZoejDzSvoay3zcoklVtEOzxpFDOIStHEaJXKIfvmb2C6ATTRcjcCSGNFlxXL6m4Zh8ahUxbhvpG2FIur3COSkgbz66XIoSx4QLARgeMVvgwWd1eFzUv4qtKr7OiNTZ2DuPJvYSuQ/xDthsx+fWnCJ8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OajG3Jtt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIv0YCTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OajG3Jtt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIv0YCTQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z4v8026729
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/1be8aM5TXGlubA/GJqZ/wk5hI8mCiMFIwpW4onUJ8=; b=OajG3JttXLjOZF+r
	Uqq3yyeACNN9GqZvOBefwGv3FfvcmObgobj/cdR2IDsa5YEU1V9RYPIQIfRvLK7n
	VJub765fttSMXfnjVqPedL4k+ugSFnULiggghUp8SNJFEnUys3zhm6b2Mv1RFeeI
	bgPZK8A9u+G7yVf9uM4VaoRMbIv2E2Nl+lRd38dJQkiL16c6Um5R4lZAyFpMuWca
	MrsJgYQRbGf6FeQ1m4sP/Ga+UQ4c41J4ClXAFd3PIN55IlIPT7MaOAfFHRAEQ0Qm
	iEdfRM0/tZQIDMuiAaMi3QC06npsG4blwXZeHz/H2qbcHRutQOHLYVJEhcDIPW34
	NvY4jg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfptf31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 09:48:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so1237731a91.2
        for <mhi@lists.linux.dev>; Wed, 19 Aug 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787132889; x=1787737689; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/1be8aM5TXGlubA/GJqZ/wk5hI8mCiMFIwpW4onUJ8=;
        b=BIv0YCTQxVxP3yzBl3e79TjKftrf9qy1N1hDh+luxCKxuMk3I0yxNR5aVs+3W8kDGr
         Eqg22o7CO60WccYc71IFv+Ygmr3KTd/aZgZknPsmBpZwuKH2iG5wrEaZIMNlcA8oDBPg
         gFsXQbzp8nZG98KHPhUTpmsyaFK69EZErd5U5iQCsXTNqYr+hEy5UKEttJoWSWJ9fikK
         qrLzIyqjNNhybd1ne0Ys4sCfUvqyeoBHp7FSlNuJ9NdFp+tTnY+Gt8d4+DHwDb61BH+0
         3jszM+YRQdEQxuZVStY7564VDR4vmXDLllKvA3ymbosnim1aU48YSkcmhnbW2VXN/+qm
         1N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132889; x=1787737689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/1be8aM5TXGlubA/GJqZ/wk5hI8mCiMFIwpW4onUJ8=;
        b=hnnHrvt7DLBgF+BBywx1JMCVv4R8FvCBT+m3Cq5VekefSqUwS+PkusQ02nh0s/onRN
         lKsoD+eZMR1Ft0rltJ31yqDp/qh6EjtKEiZBFKE9v65rOfzyf48sIPBKx5k2iSW3LRJp
         YDkgLFVpicz+UiQFv9SmpYy1omtkREdVACdB0W9y3OdLd+ijnEKYB/NY2SXhZxA42Vi9
         anaAvX8os/bGpg67XimtkxKk9s34xHy/xLOgTi5T2GfX1xFWIxo/KRRzWY4Zs+ZoMu/X
         0wNYm1wyIoK6oPbsFl15/onaBtFh6mX0G2PCNaclwXfSlSBobkzVcRBrpjt2XnA/Kmad
         CpQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9YdDxRwfk4Vclev6KHz4QY32WW+PaEgswh9Ql0BJsTBDcanzxEvI4LtgukrMNR+pvYA8=@lists.linux.dev
X-Gm-Message-State: AFuF++kBWDtFVyZ+eUy7O6Mf7DCfbNmd5Kid6VSTIV4qLQKL7BSOuECx
	F+dEu4CNwOQ2wzwWI0j21VLlUEFvTvMfjmYNmRm5Q4kmNa9KOOCIYpBtl7zA0XB/P5/JKI08hbK
	nDkS/iS7npw/DWnKeSPaHxLQVSvQ9aRJFpR/7UxMo1pmO2+UanaN8I4IaRFOcx5Q=
X-Gm-Gg: AR+sD12Ku2jz/hOmtScZO8nbN9lRUGwYP1VgGxUtmqRLh0DtbcxeHq3kG8JB6qbLXpg
	nXwo8hHD3MjQFgqF8D3QngX/RDnL5cyzU/c6TXUlgvMT3QhTbj3UEMVIOsWyUCRk+hwKytsW8Ue
	W8+Ee/wFk16NmLCBxvUAFH3wCIyFaSb2F9iZxTq1CttxB/Hb83nVPGV7sEsm4vOXe2eM2DZsscw
	Kr15ZcbqwIkSAhhmbsnnKd//7gK/+WcAlUVXUiEJOOTbkOxV6/DIJdl/FfWdfti/np+aWrI70vo
	JEixyLcAUdgiu+DUywBHQy7wrkWWgq56mZsEwZprTOL0eNSum8yab9Wy/sCk2xF5knrXjxgMwqV
	R1K1AAS4FR/nyqqlnyXhm8sKsSeVcQA==
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr6302037a91.13.1787132888800;
        Wed, 19 Aug 2026 02:48:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr6301962a91.13.1787132888341;
        Wed, 19 Aug 2026 02:48:08 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb304easm2033003a91.14.2026.08.19.02.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:48:07 -0700 (PDT)
Message-ID: <3dad5ae0-d5ff-4de5-9d02-2ccfd2a10127@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:18:04 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
 <aoQbo-k7QA5YpUNm@monoceros>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <aoQbo-k7QA5YpUNm@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C-Gg07GQ5YI3lICJ32MUenk_U-A99N7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfXxOKffJGwLYn1
 rDclwk3USJKAKPALntLMOkZE4uUNCImMXh90kqyqlIJ3ltrCoFReo4aNvF/HQSTtsRWGxwyAfzz
 C+u6N1c70gU0nhG2IZEDqDHTM9oG1oiCd4VjV2Q5Zg+ibHqnHLPa/D8865IcOfDxaXOpndvFmgG
 +efv8yywbyPCWXspm10ZIu7k9K+/5oD+ciVbPV8b88eYG/f5Ec88Mozm0UpvJ6N6WNdnA+Ysidp
 0o/WpToeVEuv0JbgUARkT7FYTKvtltcz9zbPIfRZBQd4sexc99SEhjNf/3b4ZfkFnV1JZ+2QMUW
 DtJS1BO9CqgMBFsJWolytn+tCnXdJ0ETHILDEEOLIHjn/D75U83WuhbGNGY7bq+ke2Av44vwvGP
 zJt0CVdgo00M6o2gFagMP6S3/gnxF/0sIaHiLFZfjUGB6ncu0QE33EeX9Syoj/wtEdoTWUBSpTp
 bKmN/NeyYAqOm4UQwFg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a857bd9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UIBoQwfrnP7GMt42N9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: C-Gg07GQ5YI3lICJ32MUenk_U-A99N7T
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfX07YlbU2o+Au3
 M13XDCyzbvqnLSBT3RhDeaVPhSzNam+FxEbkUhDh1gVd28qYQlZt98Y1u6uUdKkrgd/m2yxo4KZ
 P+Xwf2E4Kh1pUad3HEuPcKPdQrrqdWE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190074



On 8/18/2026 2:20 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Mon, Aug 17, 2026 at 03:44:34PM +0530, Sumit Kumar wrote:
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
> Please rely on <linux/mhi.h> to provide mhi_device_id and drop the
> inclusion for <linux/mod_devicetable.h>. The latter header is ugly and
> should go away soon.
thanks, Will rebase and fix it
>
>> [...]
>> +static struct attribute *mhi_loopback_attrs[] = {
>> +	&dev_attr_tre_size.attr,
>> +	&dev_attr_max_tre_size.attr,
>> +	&dev_attr_num_tre.attr,
>> +	&dev_attr_start.attr,
>> +	NULL,
> Please no , after sentinel entries.
Acknowledged, will remove it.
>
>> +};
>> +
>> +static const struct attribute_group mhi_loopback_group = {
>> +	.attrs = mhi_loopback_attrs,
>> +};
>> +
>> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
>> +			      const struct mhi_device_id *id)
>> +{
>> +	struct mhi_loopback *loopback;
>> +	int ret;
>> +
>> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
>> +	if (!loopback)
>> +		return -ENOMEM;
>> +
>> +	loopback->mdev = mhi_dev;
>> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
>> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
>> +
>> +	mutex_init(&loopback->lb_mutex);
>> +	init_completion(&loopback->comp);
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, loopback);
>> +
>> +	ret = mhi_prepare_for_transfer(mhi_dev);
>> +	if (ret) {
>> +		dev_err(&mhi_dev->dev, "Failed to prepare for transfers: %d\n", ret);
> dev_err_probe() please.
Sure.
>
>> +		return ret;
>> +	}
>> +
>> +	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
>> +	if (ret) {
>> +		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
>> +{
>> +	/* Blocks until any in-progress store() has returned */
>> +	sysfs_remove_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
>> +	mhi_unprepare_from_transfer(mhi_dev);
>> +}
>> +
>> +static const struct mhi_device_id mhi_loopback_id_table[] = {
>> +	{ .chan = "LOOPBACK"},
>> +	{}
> { } (i.e. a space between the curly braces) is the more common way to
> write that. Please also add a space before the closing } in the line
> above.
Will fix this too.
>
>> +};
>> +MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
> Best regards
> Uwe

