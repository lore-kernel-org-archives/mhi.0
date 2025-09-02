Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716F2E06ED
	for <mhi@lists.linux.dev>; Tue,  2 Sep 2025 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804494; cv=none; b=eHexmIAuEEnJVub8mJQFD2ElC4f8vEZ5rYg2gZ3NAp6dG1IQygzt1UhGALjHiCC2eFIwt4b+TDYWW6KtfauA80hN+ZRys+8FTrVT/YbJgR7FEMoQPrnlhqrzHrDP+MfTSO2K5/KFx4GuNT3OjFV/YXgtXFe4ksE4pVK6dQum8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804494; c=relaxed/simple;
	bh=Sv5rjcMW0XRL3T4QTlzK6bGt+YKcn27Pk+A4Io6DRG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckyYcMWZT0qjJfEhXL7ohxKo265wQVclpaGjFnTOwmYx73Ki6bu/RW0MQtfmzN5GCMnATlQIIJ5TCVlEyleRyvI0MSotBVbKboPB2C7vpl8Su2Gj92URGJ7cBYQb0rKd3LnGr/qFd9kUHqZVLECfqpB6oyiNJcEicZac7Jxpkf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqJ89l/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqJ89l/X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RoE6024996
	for <mhi@lists.linux.dev>; Tue, 2 Sep 2025 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO1ghtzbf6msdOeC9Wq7UpFQnYphPOPa6N9e0whQQw4=; b=lqJ89l/XL7eohyXm
	B8/rx5P7wR+PqB9DzMZasnXgDSPmlEoK0i6/51pgt12C+LHKoT0bJF/KkQyXl9U5
	/j3cmOREMAt54FT0DhrgbglP+buY+m6sudUohFCofhElnTMcSRVAvRFXIVmEHoWh
	MVQVFJSCboTZr8znRg0t9C7Ey52df/8ukG8fFVbYGBts2SpLHlxo9yMaT5ufsWsK
	gj9vNI3vMtbR0GZ/ExiSL2nmQ5bgBHeT/Ar25Y0+CQIvigpZuC2KmD5cCgMugjr6
	7QdNBXVkGEubRGSogx2YmIHaqTnk8m09pdDdlL6QtWXrEoXbfhxNe4mzDq2XJjvD
	sn72Nw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuy973-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 02 Sep 2025 09:14:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b32dfb5c6fso10503431cf.1
        for <mhi@lists.linux.dev>; Tue, 02 Sep 2025 02:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804490; x=1757409290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO1ghtzbf6msdOeC9Wq7UpFQnYphPOPa6N9e0whQQw4=;
        b=IjDjLiPH4Os6WtzRHPQ89iq0ji9fJ8Gs/7sYlaSiPyYuIHdhBCqGVLPvd/2S/hO+rI
         L0dpW7Amb8JKBBwthUPiEiVfkWbdXRVunB1HbZHpCvWeM80Cl65+vcEG4baaYyxSAd0s
         2/El+9Lux6v1Ozcq+URto5MpFOxjSUpvXsfn96pdvT7VW0bH1ljH4mHxb9QhsTc8x05b
         idgKlMJqlmcLRuzk4+EYSp8dH0oFEdiHRXai+VCbAoMDPUiCxaqSgjANZFRR49v2no/e
         UQDEfFiwLQz7wQ8dC0dgJy82oFekrO/qGhJUtd7qE6A69PKUtYViqi8Po4TuQxJe8Pt3
         VUMA==
X-Gm-Message-State: AOJu0YwaAJCy2K88FWrXdklxVvinBcPEUpMaUSm5429/lEBV1J9nmKdl
	v0VEiO0fAUC4i7RCPbaZpxRaBTqwHBUWfW02WkDU2eAkv9D2FEZQNK7dLLaf/89JxF3Tbk2YOY/
	xytcMS1amv1et2XYOJKa2cUplKOSw6xCWosxe44gu4Ne/KjJTI8cl/3s=
X-Gm-Gg: ASbGnctm6PfFKSOqGiVsU/KsFRcQ9fLmZ1v1W6S3v5VQOw9mjFTXWvKqHkFNpQUSKph
	O4FylqGfKy5v4r43GOQI69V3+Bl3FjO13CHvA8xC+s/wyktkWU5wn4Sjplh6iQX7Sz6ZeX7IFRq
	c3QYWTdp079uTDlmYoBWPbS+A5zynZqDrZPVNdAHRqhU/zDZinn4btOLXa1YXg7G6Q7kV8Hiwwi
	U0X5lH8me1z8KnoqSjnQjBj6t7AcANp5pbSxjqzCB6PGSYyqFKwvPF8R0+XmWcU1xLOBvFlPpgl
	JH5LZpC36aysL3HlMUa/eXTVuIDWPsv0ItmAvnE1t6j1hqIc9Xr7n6J+jUPqWkeikinxiSiHPIh
	USbGLc8owSkNF6L3xxCTPzQ==
X-Received: by 2002:a05:6214:5083:b0:70d:dcc0:75e with SMTP id 6a1803df08f44-70fa1e3755cmr93720526d6.4.1756804490104;
        Tue, 02 Sep 2025 02:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxjzG5x24toM7rERz1x8tefpoUw5nxnJ08BKoZmfBLD2lh1HYnUpQ1tPf3aK4LYj/wz/d7A==
X-Received: by 2002:a05:6214:5083:b0:70d:dcc0:75e with SMTP id 6a1803df08f44-70fa1e3755cmr93720336d6.4.1756804489632;
        Tue, 02 Sep 2025 02:14:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ec8516621sm192683a12.26.2025.09.02.02.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:14:49 -0700 (PDT)
Message-ID: <16698a59-1a2f-4816-98fe-56b125be669b@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 11:14:46 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] bus: mhi: host: Update the Time sync logic to read 64
 bit register value
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX3iP93hTY34dG
 ZjHRJJoQSqBflHLalDsqXH2C3j0i5vUaBKnMCXVgB1J3SHNHEYNCGp4W9oGeZHdeO/2HG1h19rK
 qUZmIAG9PJ4Jybl22a3jh1xfhy/S9Wkb4xgj4kz1aSk1xeZ6rqLE1XW7NVHhRna9oJoQDURVfwm
 IiDrpC4nYpyA+uJWST/6Fry7JR8Mb+ekQRZ1DcqIM74bZxe13mAJNpLp1veoL+zt+docMTwA/YY
 0xVD1XklnaKahMzbwTUO28BIj3xnbzJf/oWVw7HAs5RP7vMhpYnV0mqpaOGti56Ta7BeBn2vr9a
 FzDOY83JO0akTMFzFO27s/4qM1nStqWgl8q8sO+DgxRikWAF7vL2uugtrlQUWZFQv3BMThff4jI
 s3t6hzSX
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6b58b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YtfURPx0HkL0cCzLSeoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: EaF5wePkIFZVixOLlUZWMtOAVyvVuBld
X-Proofpoint-GUID: EaF5wePkIFZVixOLlUZWMtOAVyvVuBld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On 8/18/25 8:55 AM, Krishna Chaitanya Chundru wrote:
> Instead of reading low and high of the mhi registers twice use 64 bit
> register value to avoid any time penality.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/main.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index b7ceeb7261b708d46572d1f68dc277b6e1186b6e..f628198218ef9dc760bbfc3ec496603d1a45dfc1 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1719,6 +1719,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>  			       struct mhi_timesync_info *time)
>  {
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	u64 val = U64_MAX;
>  	int ret, i;
>  
>  	if (!mhi_tsync && !mhi_tsync->time_reg) {
> @@ -1756,15 +1757,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>  	 * transition to L0.
>  	 */
>  	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
> -		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
> -				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
> +		if (mhi_cntrl->read_reg64) {
> +			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
> +					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);

Since you're passing mhi_cntrl to the read_reg64 function anyway,
perhaps this could remove some verbosity:

int mhi_read_reg64(...) {
	u32 val_hi, val_lo;
	u64 val;

	if (mhi_cntrl->read_reg64) {
		...
	} else {
		...
		val = FIELD_PREP(GENMASK(63, 32), val_hi)) |
		      FIELD_PREP(GENMASK(31, 0), val_lo));
	}

	return val
}


Konrad
