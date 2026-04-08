Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE63AB27C
	for <mhi@lists.linux.dev>; Wed,  8 Apr 2026 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640154; cv=none; b=qIq+7GXfrfG9V3llykyvfr1osBQZEUMLWeHfHlajI98L8J33I+eAxe3AGNUg07wru515NIN6zb9brbbrUATQQPeXpm5YBV0mt/1oSh9ETR+erMX2jmtC27elYATPW2zI1gmEimD1Suno+RTXspgKAQwvHwnvgu8THue5KpmBY7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640154; c=relaxed/simple;
	bh=2BhclhT9Q97T00HiP8qg5wipFD+trhNuHjt6zEKFSGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbsddPpetVIL3hDMOViWScnoC8Kck0wGPtHL/blKmZhsynzhdUGmNx6bVdgmpjnXgUtheCn9ws/PtkbQQzFrlTFPju4NXev/5zf3pXkyV9dJuDWdxW2mBBG5i/4W4dsprbBntxaQ/DLWMm/WaSxx524mNlWe6FQc9kN2SyWQ3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBt7Mno4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D64g9uEC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBt7Mno4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D64g9uEC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387v9vP1796070
	for <mhi@lists.linux.dev>; Wed, 8 Apr 2026 09:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bf4TqWgXnJv8MV94k4Uut8ha/7y7QGO4q5QmtTQZ5AY=; b=WBt7Mno4FyOd0GyH
	go2ych4Xzh0POTbQH+0wvwjK+/LZbxzli//giAnGuzmrUt8SyY/hVHUcHDWcQyyO
	CWYaFwvjwf388BtESF7DbHI5uQoSGimmcSZPpY7CNohu9HVqQKbkF0CZyPu/kzcH
	q8w8bp7WTAqn3Hk03MjiCM4TkZNKej6q8t4raSmlv0lkqGjiZBMfQHEXhMxs26uV
	0+L4DzKpRMHm6K7IgF23MY0ITG1i71hCLdGP5WLawfav6DslA63MzYTdD5j24qZq
	7UB6zNkftq39qAK3I7x03P+2KSHtYvHLYlw01+jfD5MgxgTSnt5SgobFNbnC/XVU
	mhfOvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51dbd6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 08 Apr 2026 09:22:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76ad3b732eso9107054a12.1
        for <mhi@lists.linux.dev>; Wed, 08 Apr 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640145; x=1776244945; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bf4TqWgXnJv8MV94k4Uut8ha/7y7QGO4q5QmtTQZ5AY=;
        b=D64g9uECwrrIol3iey9KXchLRJuEhCXXntCjZe7sFQ/0K2y+g5Q/r523biBphoUlyi
         oBL5yLsPj6YiSLKmm2LgqivoLRaUD7gsrgVl7i2HjftCpsew8vKV39qM9txlBKDVndAS
         fQ3cHHjkOtMmkAkznFKgMsKQkXAQuFEaUV7dcmQNzPgJNpzv7dJkMmLlBAUaZEjyu7bf
         vC+opGzpW4helpF+htJn3RgNI9BhSSTGUpZlehVcDZDXiGUhIZ6O+t8urOOxYVc0hdBy
         Ye/awE4Im1b6mcic4NWTu0BeX7cLP7He0RvjJcU+8QbHwJ5LZ+D+VqpNRofXyiPMSlH/
         /TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640145; x=1776244945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bf4TqWgXnJv8MV94k4Uut8ha/7y7QGO4q5QmtTQZ5AY=;
        b=enrC/uLC5/JOQjt2fGGVD/r8aifNwchb3ocz04eLuL+f4vBiEeKQRQnrbBFDLnZUIi
         N279Kico5ed5UMvnsEC0zTbY2JsCEZMWc5RuM2bfyJqeDzspw49GNFBFGWJRWlTCHHgO
         6tr/eZxTIYp0ULRf+vcWpRnIVjHQEyTjyhGRMCAw5MDztDIcccqiQgl6qdKR4pNcSwUG
         tKcuDBuq3lM4qNYXV08iATa0slx4guKwRgp8M9qQX4dM9oK7aHpieGCvkO9lVDjYH9GS
         q6v0Moak9ITfuMdrOt6B3NvCW9JessSIwmo3MTNYS+lwILxtXJUM6EbVGmv2jkmOE4rX
         kbxw==
X-Gm-Message-State: AOJu0YywqN8q9vfX+XeVjxdJq4TZokRgUMXFEFy9T2TDYVcyGlonYemA
	x4fJBlngPpUsI6Krn9VX5flJm+BL1Cqwl8NzI102SSs5Zvqss1c6kVB/kR6XhmR3wmcuwg4L2+8
	6c2WZb9Y3Mc3bycYIxbyZmbfnDDBjYOGGp9n5GE2i3d2LxUzulBtVH8w=
X-Gm-Gg: AeBDiesW0O5AqpC9s7dmEJmA5JkiEAr3chvGvNrrXx5Q4JRi6aqa61CnllErfrA0Ca4
	6exS6SSJAi4lij2D8o03tvG8mk/qmw2hayEzz36Q7BpIKntlRKcKtGdH3vTh5e+VJ5+N45mk05K
	oWWQcQUCzgu6NrLk7zcBk7fTxrALzKoJuIsWajUyPrS+uCl+1sQeYNWunsAaRTedlZN+XB2kNIB
	0dq8sUcocBNTkK+gG+f4XPYEkDmy+NPU60sX9gjkjs3jgDgL4pxldqiWEuqDxUiQkxnTWybDAWt
	2aM9XVt2mYkmCsN2I++zT7PW6P9ZpZMNiZgmLz2m8iCQnjQwoDqeGFduxcLVtmECFZizVkh0kke
	rJu0stsPaSZ/l961NWAGtn6TFMWMOuSFsQgRNc83CKxWgi3Xe+26IaA==
X-Received: by 2002:a05:6a20:432b:b0:398:92ef:1d95 with SMTP id adf61e73a8af0-39f2ee70addmr21171907637.21.1775640145160;
        Wed, 08 Apr 2026 02:22:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:92ef:1d95 with SMTP id adf61e73a8af0-39f2ee70addmr21171879637.21.1775640144653;
        Wed, 08 Apr 2026 02:22:24 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659bedesm17266512a12.30.2026.04.08.02.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:22:24 -0700 (PDT)
Message-ID: <6c48fed6-27df-449b-9e43-00a68e45b9ba@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:52:18 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] bus: mhi: host: Update the Time sync logic to read 64
 bit register value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
 <16698a59-1a2f-4816-98fe-56b125be669b@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <16698a59-1a2f-4816-98fe-56b125be669b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kdxi6Lt39PC7e1o5ctscWP4Zr7EOYZN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX3quKaWq8XuR4
 1SI8jIe9D76FG+zJNc1KzGLItTdfFAnDmCHgV1idFM9YxOyUzkwIMxjQ3MoGynTLlNUyUMP+q6L
 ikBJFTV6y7vWbHOgXOwxNWYSfzHzuplHSYE6dDQeRHxwv1/W4zmMmtBawjURbyP/Mmblg/M/7Qe
 eSVqdDkvHKjVZ0Cgn0nV5CESYRmcpFBh2V3qfgBlYt5VVtjrjH9J9tH+qiWa231OLuozmtJ/r9U
 JQQHztutubs0Vp2yBtSnKg8msEYR75m+7daPUDV/+6MpG8VAUnxmuubYYwoXPyHunc2nt8LxKdG
 Hco08Fl2j5HR1BOXo8tfXl+zasEHzmRtSe/Ok8iapc/OI04hG0mKDMGjFWonvLh6+li28Glanbg
 9i7wh4e1OG98vqASmT+jq2oIpQ4najS5YPHxaKJUAuS1+Vo8mYmzcAMvUTRGqaeTkC/xf58Tvjf
 izQca12FEvJprloS6bA==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d61e51 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cgR8ezsCSdHxW5zDJ1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Kdxi6Lt39PC7e1o5ctscWP4Zr7EOYZN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080085



On 9/2/2025 2:44 PM, Konrad Dybcio wrote:
> On 8/18/25 8:55 AM, Krishna Chaitanya Chundru wrote:
>> Instead of reading low and high of the mhi registers twice use 64 bit
>> register value to avoid any time penality.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/bus/mhi/host/main.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index b7ceeb7261b708d46572d1f68dc277b6e1186b6e..f628198218ef9dc760bbfc3ec496603d1a45dfc1 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -1719,6 +1719,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>>  			       struct mhi_timesync_info *time)
>>  {
>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	u64 val = U64_MAX;
>>  	int ret, i;
>>  
>>  	if (!mhi_tsync && !mhi_tsync->time_reg) {
>> @@ -1756,15 +1757,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>>  	 * transition to L0.
>>  	 */
>>  	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
>> -		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
>> -				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
>> +		if (mhi_cntrl->read_reg64) {
>> +			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
>> +					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
> Since you're passing mhi_cntrl to the read_reg64 function anyway,
> perhaps this could remove some verbosity:
Hi Konrad,

Sorry for late reply, in pci_generic patch we are defining read_reg64 only if
readq is defined
in the system.  As per your suggesting if we go define mhi_read_reg64 always,
we need to
have #ifdef inside the mhi_read_reg64() or create a new function  both of them
doesn't look
good better to have this way only.

- Krishna Chaitanya.
> int mhi_read_reg64(...) {
> 	u32 val_hi, val_lo;
> 	u64 val;
>
> 	if (mhi_cntrl->read_reg64) {
> 		...
> 	} else {
> 		...
> 		val = FIELD_PREP(GENMASK(63, 32), val_hi)) |
> 		      FIELD_PREP(GENMASK(31, 0), val_lo));
> 	}
>
> 	return val
> }
>
>
> Konrad

