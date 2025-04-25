Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9918C337
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597509; cv=none; b=puskSJ9ZXxbqV9aQu+lLPBjLdbPyLgEZZYqZJuslliodVKQGhAlvquDywiJ/zwJdd5UBeLMNLu2bmfhaFGYIQiqSuggPZlR6IDtY7dd3yP7CwRE+1BudzxsP04/r4MEyY/Dgf5jutNB1VQjr3E0XO+2HRL7YgFoEjOlW9eEzOIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597509; c=relaxed/simple;
	bh=+/8Yh07lfUl5DKdieZ9w0ZXCqxUF7G/lRWkdCw2p67A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKvrHk6Ic/T38wBvY0RPv6W2vgx7YLqjRKT+vQqT4tprzNvlHfKJMG7C9vd+rj4xe+U6W3E8G7OvmGsVrqEelsWn5PdgDQc+ZYU7NNQXMZKP5MIJFMtapw2U8pkyybQjD9t1AHakqhCiI3LcMrNYRLhFAEnxGRM9Twd93mXgI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCWTFiao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCWTFiao"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TCqK012105
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnNzERhcGyh2Owv/6eKknOObqZSSYklEr5mmljO5Zr4=; b=XCWTFiaoWSVHm+Bl
	Ui6Z+JzH9aMlK7ZSdsC6PbdCIiy/U5w3kGXUc5KDi9x0tpVYnq11s3APEYa3pVyp
	tGiHWSH77uKVhUQfZXDoHCiPTzy8p65pafB8FQZiKUwL3XXqwI6OoD/X1ipnpR/f
	5SyhiNBpcgIFQqzcQLA63YhMvt8dg9Hnnhr5xDaPae62J4fh1Qhwx3tL+mp9jIuR
	5aDShS+3cI0buGfMXZfADt6DQ3jkvaMs+ic5SR/vHON+ryAApJCx0PV5JfhJWB2q
	3OhIOeYtmQwaEYulZ+Jw/GYSf47/+bp/PQtxt17+WlF7LLm9UciRsdn/CeJTleVx
	SMZgYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh19h97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 16:11:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2264e5b2b7cso22876085ad.2
        for <mhi@lists.linux.dev>; Fri, 25 Apr 2025 09:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597505; x=1746202305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnNzERhcGyh2Owv/6eKknOObqZSSYklEr5mmljO5Zr4=;
        b=nZhNQcgA+Z3fU2/INZd3RXIMwzEvQ6JF+sTZCwPKr5BeuOOsBZTK8EG1BpLfNlPECU
         v6kry5RU2JFualfRa2/i4/mmaqvq6uMYNAuB/CkM52c1OHMiffAbuIns3VfXj8nmuvj5
         cTaq04a2GN3XCzutBnElCTT7HhFXkfQNa7b99ruE4MYMTeA09+IlYPxZe2gYkwEmvGGv
         qrNX+Haea6Z6X9JxdkLNldVXI1bKbISZdZn3LgWVS92yVfbCJImzn/jvYtY+6duLaKb1
         mZdS/zkJTl5dtZPKs+HDpFMIHioMoiRX7zW0lZKWVoe2S4lriovoV1GFI72ZGk4LQA/I
         EjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvoG3kOOFNrsBZycVeUIBb59TZr0ekhHXIzXzI9gflsmSu0XOjOWtlaby0L2XvcTyaQj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbcoZf0uq4OV5+tEXn1kLUTZF8ZErSES4TK9McEQZcpHTXiaKU
	IqSHg7uAlXRrqvYLxa+LvOJpGUZdGMxSuDboRuYgJIZTGWDbCf9sE+Ga+mR/6zb6Z/JXP4Onz0V
	2XBUJQzkpq/XoR801ilboMldK/wB1kvFr3BPiXqhWDrPCMdi28Wg=
X-Gm-Gg: ASbGnctZPrHDpRXzJL6oQiFXK7eB5W3uTXSRqahW9Sg0tjJoZgaO/7HA4MX4YMamOgu
	bZ2WYLbUzxlz0KWeZVSy7muRjEgqKj+qPHvcnwSz2QZz/l8W55R0N6DROl5upZlFkpaDSsKDt4k
	mIC6Hi0d05/1cAGi8KZKAQsh2q/gr1j3lzd9KfPVur9DpYwrdJVhsplAdHLdiglLCi8HFBYlndo
	J9e1U2p/VEL9CWAvQUWypfU8xY3/VHCYTLcW/0CtMX4e6UP7E+1KyDN/RZO8iYepBrbSyi5d20I
	RCipcmldF3zc6CyhdGsI3JnDs7C05/T/cM3WxPFHcWSeCWhy6UaZS3OXOkSWig==
X-Received: by 2002:a17:902:ec92:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22dbf5faca9mr44837225ad.28.1745597504744;
        Fri, 25 Apr 2025 09:11:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFekcn97IqHwbOVfQF3TlCh7LHX8WL4IUgEpGEAWbusPOs4xYrJuyblfITWXSM0yZls1RRZUQ==
X-Received: by 2002:a17:902:ec92:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22dbf5faca9mr44836865ad.28.1745597504340;
        Fri, 25 Apr 2025 09:11:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52168b9sm34212775ad.226.2025.04.25.09.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:11:43 -0700 (PDT)
Message-ID: <62f86d8d-e196-4d3a-b432-33da98bc5db7@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:11:42 -0600
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <qjgzfuzb57etwsblgsdnek6pmw4c5ickt2yaiprqzskhjwr2zb@vwstguwle4m4>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <qjgzfuzb57etwsblgsdnek6pmw4c5ickt2yaiprqzskhjwr2zb@vwstguwle4m4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Nns48YDi-RmJG_6cSEjlilJy_RycoqK_
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680bb442 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=IKrzTq33Tt_Lt-Vb28wA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Nns48YDi-RmJG_6cSEjlilJy_RycoqK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNSBTYWx0ZWRfX/T2JYJL68/FL Lnw7qYIWsYDQJ1V3ojv3RJrNWPp7kZagv4zMyUhM5Hf00XXEQvOzMUKZ3Padu8sLqHeUzKi+oWW igU97Diq9ix4iSpcGGZWX1hVsIiljf5FNY8HEuOzVCwF8K+SDGKGSvf3vXSFXJN7PVp6OxF2xlI
 0GJ1Jc3QGjCLRXyF4rigzhQPoUdZJtl+HIUnokL18S8vSE3M3nojEIh2nlLCjZxOuR6HZlwJNjW O4yFcoGBXdB1MI8pjLfsLzoYEf8TqxKT4eFixq4GjD76AeGof5XnHjXv01RZ/eozwOV3II8IEBP 80CkL2t5AWqYytQmOgqiCClwPAzAcBTLBmEQeTjb6rD+80kPdB02IIIAbV720bG+mEhD5t19ulJ
 xpofxd3rg7Q+tLEJmwKKwq53NGAglAF42Sk2S/O0T9uJDCtV6il4laLAKuQ+FW/Vav8i+Alq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250115

On 4/24/2025 11:40 PM, Manivannan Sadhasivam wrote:
> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> MHI control configurations such as channel context, event context, command
>> context and rings, are currently allocated individually. During MHI
>> initialization MHI bus driver needs to configure the address space in
>> which this control configuration resides. Since different component of the
>> config is being allocated separately, only logical solution is to give the
>> entire RAM address space, as they could be anywhere.
>>
>> As per MHI specification the MHI control configuration address space should
>> not be more them 4GB.
> 
> Could you please add the spec limitation here as you described in your reply?

Will do.

> 
>>
>> Since the current implementation is in violation of MHI specification.
> 
> Here too.
> 
>> Allocate a single giant DMA buffer for MHI control configurations and
>> limit the configuration address space to that buffer.
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> Other than that, patch looks good to me.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> - Mani
