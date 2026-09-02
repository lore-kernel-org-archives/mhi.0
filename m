Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0392BE7AB
	for <mhi@lists.linux.dev>; Wed,  2 Sep 2026 05:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327063; cv=none; b=OvZb8AFOX9kKhUShLur3GdNhvFIn9dXZQc6ElfXou8NUe7vQAbe5usxlxXACtLpU0h6o/Rh7KcxcfkpE70w8ID3UjVODyrf+zNbg45L8Xd2MQicnzeKEddHXnOo9WB2mG48wZ79sKIbvYJBdvQLFlAxzvfptqMluWarfC3Wp0as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327063; c=relaxed/simple;
	bh=EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hON7f7vU5yX04Ob+XyJgGgZQPBYm0fhXQE2qvZXlNUKg+r0vJ/2wgrjhdGRPbajXqZ6pHEU3ZbRsj/LyNFoFhmSOqGjV4XykodRrwjJGzqOZG1yphUDfEYMjIU5Iec1XuoMe4xpzl/iH+IVd/jD/luTeZeBrfGA5CiiPvq3qrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2jPeDiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPgUB6BV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2jPeDiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPgUB6BV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824fvPr3108374
	for <mhi@lists.linux.dev>; Wed, 2 Sep 2026 05:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=; b=c2jPeDiTCeOUZ+Ms
	LDfvknHx3w8HS4tzLQFo8FeefuE26hYIfDzmCR63ke5HsTrJhVNRJ4izfpXB0ssw
	webIHA/6bABWsLA1p/ztDuFgHvg1mkJXMCDTkhmkQP3IGyj7VCPugPCCD+1Oq7Oe
	GKwl73PE7usS1R0M0BFMgfEmqQwzWrKy2dI0rZbPKedLcZDptd4JdDT+Ap5zr7or
	Xcj9TYijr4hxx1KlLlOSR1iT/240UHSABpzX0lHN4vfOpdyXfvXJSNYZVlnVAgcA
	OQaL+qvn/miYq+lTGRaGVsYnHHepG14/UNsfuRW4Uht9HuVYjLcLQQFZ8OMwvjOS
	GVLutA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpasvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Wed, 02 Sep 2026 05:31:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1659653a91.1
        for <mhi@lists.linux.dev>; Tue, 01 Sep 2026 22:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788327059; x=1788931859; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=;
        b=XPgUB6BVpfcynGvWq3J4jUJdlE2ihrPAGvKnWK03Hxd+xCPi3lekmH9+l++79N7osx
         2MbNA2a/AUrLhTFBUNrRSrNXoo3164XqdwpVS3GB3ieLoUCHBWdbn7TQ9XaGLuxN5vPC
         1HaXYyIENHQJ/3lDQdVHaUuinWVHwepYmwUqLtqmKWaIUZTpvseBB3RAq7uVL1mE2tld
         XDdWDAdPEGwtzi/Y5yH2YJtawCO6GRI1dPlUL5h+q45O9JQz5jILJUESTEh1R2CScjJA
         i951RB2SbWNBbmQ5icTh1A8tYBZ54cuznJng9G4PulYnfI+QxNT4DxviTXjQ7Mfahbid
         QIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327059; x=1788931859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EErxRj9UamHxjL4qovNFexC2eoDhDkme3XwtJu95u6Y=;
        b=nIRdIFQYH2zoyqegkXT9K+9c/9FhNVVBVfHAR9HmjnnKIxW1vo43ODfC2c9QBdN+2f
         3QVGFrlEvdQkFg0Ryq06f8U8ukS2En57rMqW3cUq7oHMIeOMDKGaCGoZguWtgpbS+/B3
         1oQKPAAJNnuCKu7wc7lgAskX0yX8T7O43fyD1dtqDZ7ILZcA9a4sk7tmKRsmlJxc7PAD
         /JQMCtugT9LOlozLmKp73eYUSz02MCkakpx5RoQMGHPt0q5VyFp6yzmrJbASi8TIEaZV
         IpcjVa+6nkprzwrGhN0+k0fbDXBODEhyRR8lj0ocMdvNUIx6OvlZLUccFn6Q9nAloOqS
         AM/g==
X-Forwarded-Encrypted: i=1; AKwUvBzOHJB1nrQJcWJr/+/mNSHyQGSqbk3NKN1VPKGLnNUACmJ3bMfz7Xh+vSYDIEt0hHEPalM=@lists.linux.dev
X-Gm-Message-State: AFuF++kiMoYx0jEp0LWMuFCZCf5xU3VGqRR6SNRZAup/5suAmibDvwLm
	EqwS6iqnsmKxvun9JU1auo2pQqwPslD/LSfQr90xBGOoWnZbAriIuu91EX4MyYKoYkEgx2YsVN6
	CgupOBVOczzwBO70odpFW97rZbTCBEWGvBwkdWuuPP0rctcpC8u833Gk=
X-Gm-Gg: AYBFou3RAY49+llwuK5Je95rDWzAlpi/eTPGvI4NJOCClJphIy5G6/DFa0CxZkCvssc
	2lHtsbbjYZvTakZxQHQxgtKo0+ZdFQGTaVOWKzMnpPMyu6bqNQmijbE/gYWaA6XUCREg7qikK/3
	01brg3gY7z4DGBChnju/COiEW4AZhFQEc9KIGLuywzXV01ing+r3YjddzLrL4f+OypY3BY2cu0P
	LfEziF/T4FI48KiJY92xOs6zs1AO0WfZOtMKVL14V8JCSu+YBVm47fcKvJKQThJDQCVulCu08EH
	Bp6ZNAsoOiCDtpF2LB7L7LMk6cyh6ZWidkkQPAXZSAwNPEWqwuox0H22AF8xDeaLMz+H7fp1yVC
	NaNoX/vNjU8ZgnNbjjqUaG984mOyzPERs
X-Received: by 2002:a17:90b:1c07:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39aee260bc0mr2726723a91.23.1788327059337;
        Tue, 01 Sep 2026 22:30:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1c07:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39aee260bc0mr2726667a91.23.1788327058905;
        Tue, 01 Sep 2026 22:30:58 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm5163942c88.0.2026.09.01.22.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:30:58 -0700 (PDT)
Message-ID: <774adaa9-55de-4456-9ee2-eb3c5d7ea0a5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 11:00:51 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] wifi: ath11k: Add support for MHI bandwidth
 scaling
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, Miaoqing Pan <quic_miaoqing@quicinc.com>
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-5-6dea79786b37@oss.qualcomm.com>
 <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <5b10cb13-77e6-4754-a885-92c873866ef4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97b494 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WikkZxfSKXF9q-dYMVUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lZLwutr_vEf-UG7Nkh8GBHJJqfz3klJ0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfXxoclZ/hp8GL2
 OKh+/8pcibqJ2zOHS3yZFwzdAAUCqaYXaN0CzX5qmKOim0xCjn4IjLtcwQNuKDazpplK/Hl9qdA
 EBlHL9fTySPvX3VM3d1OErWn6b6nJYQ=
X-Proofpoint-ORIG-GUID: lZLwutr_vEf-UG7Nkh8GBHJJqfz3klJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0NiBTYWx0ZWRfX2jCdV4XAB2dQ
 96ii6wjcjZLkZNC1mJc7jcJ8lthfmmrtOY7jkaWN2UXYco78/nz7DqXIgNZ1ngP2yvtxZdDmDlZ
 rFJIujOXeEiAQm0nVz8Q7k9EzU28T2lsqV7WQ3kBLBvd+WfAQZvbOJCz48U3P2w1vGdSLFoXvcO
 bOM/G69HbHDz8Eavnzq/UVovxDfGJmarjvz7u7dtkCycCsQ8P6S9Hlvtkv+d8LQIBzQJ0eiVmoF
 1KLjV4Af5pxyX5i7bOSqig8OLMheq4p580iP3A+eVUKD0wtoWzGQJmRtpZT/lvQ6NZ4CHpx5G0I
 FAlvkpJR5VcZt5mHQb4Vw/9X+R2weD5SBXLcXG/tORrEj//ALAjx39Yx6xEkkXa3lhFVNzYP5ee
 97DaDaIUXuqoGKRyV3EI3M5Lm3ua3maMW1cUpmc/EaQti7G1NI8Hy4SB9bGE4KKEZu8tAGEO9gZ
 GD8eqAGeoBf+m6kAQeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020046



On 9/1/2026 8:15 PM, Neil Armstrong wrote:
> Hi,
>
> On 8/19/26 15:25, Krishna Chaitanya Chundru wrote:
>> From: Miaoqing Pan <quic_miaoqing@quicinc.com>
>>
>> Add support for MHI bandwidth scaling, which will reduce power consumption
>> if WLAN operates with lower bandwidth. This feature is only enabled for
>> QCA6390.
>>
>> Bandwidth scaling is initiated by the endpoint firmware based upon the
>> bandwidth requirements, if there is high bandwidth data endpoint requests
>> for higher data rates or if there is less bandwidth they request for lower
>> data rates to reduce power. Endpoint initiates this through MHI protocol.
>>
>> Tested-on: WCN6855 hw2.1 PCI
>> WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>
> Somehow unrelated, but I added this to the ath12k to test on an WCN785x and
> I just
> got a single event to set the speed to 5GT/s and no further event whatever
> the state
> of the Wireless link is.
>
> Is there anything required on the ath12k side to allow lowering the speed to
> 2.5GT/s ? 
some wifi device has some limitation due to that they will stay in gen2 only.

- Krishna Chaitanya.
>
> Thanks,
> Neil
>
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/mhi.c | 38
>> +++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c
>> b/drivers/net/wireless/ath/ath11k/mhi.c
>> index a6c9ff112c68..9bff4c4bca3b 100644
>> --- a/drivers/net/wireless/ath/ath11k/mhi.c
>> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
>> @@ -20,6 +20,7 @@
>>   #define MHI_TIMEOUT_DEFAULT_MS    20000
>>   #define RDDM_DUMP_SIZE    0x420000
>>   #define MHI_CB_INVALID    0xff
>> +#define MHI_BW_SCALE_CHAN_DB 126
>>     static const struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
>>       {
>> @@ -71,6 +72,17 @@ static struct mhi_event_config
>> ath11k_mhi_events_qca6390[] = {
>>           .client_managed = false,
>>           .offload_channel = false,
>>       },
>> +    {
>> +        .num_elements = 8,
>> +        .irq_moderation_ms = 0,
>> +        .irq = 1,
>> +        .mode = MHI_DB_BRST_DISABLE,
>> +        .data_type = MHI_ER_BW_SCALE,
>> +        .priority = 2,
>> +        .hardware_event = false,
>> +        .client_managed = false,
>> +        .offload_channel = false,
>> +    },
>>   };
>>     static const struct mhi_controller_config ath11k_mhi_config_qca6390 = {
>> @@ -311,6 +323,30 @@ static void ath11k_mhi_op_write_reg(struct
>> mhi_controller *mhi_cntrl,
>>       writel(val, addr);
>>   }
>>   +static int ath11k_mhi_op_get_misc_doorbell(struct mhi_controller
>> *mhi_cntrl,
>> +                       enum mhi_er_data_type type)
>> +{
>> +    if (type == MHI_ER_BW_SCALE)
>> +        return MHI_BW_SCALE_CHAN_DB;
>> +
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static int ath11k_mhi_op_bw_scale(struct mhi_controller *mhi_cntrl,
>> +                  struct mhi_link_info *link_info)
>> +{
>> +    enum pci_bus_speed speed =
>> pci_lnkctl2_bus_speed(link_info->target_link_speed);
>> +    struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
>> +    struct pci_dev *pci_dev = to_pci_dev(ab->dev);
>> +    struct pci_dev *pdev;
>> +
>> +    pdev = pci_upstream_bridge(pci_dev);
>> +    if (!pdev)
>> +        return -ENODEV;
>> +
>> +    return pcie_set_target_speed(pdev, speed, true);
>> +}
>> +
>>   static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
>>   {
>>       struct device_node *np;
>> @@ -387,6 +423,8 @@ int ath11k_mhi_register(struct ath11k_pci *ab_pci)
>>       mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>>       mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>>       mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
>> +    mhi_ctrl->bw_scale = ath11k_mhi_op_bw_scale;
>> +    mhi_ctrl->get_misc_doorbell = ath11k_mhi_op_get_misc_doorbell;
>>         switch (ab->hw_rev) {
>>       case ATH11K_HW_QCN9074_HW10:
>>
>

