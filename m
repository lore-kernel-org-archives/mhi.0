Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980B3B9DA2
	for <mhi@lists.linux.dev>; Thu,  8 Oct 2026 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439855; cv=none; b=qeD3JLFCLM86CfSWcU8uNP88f8FyXVEwnsZSgSxln0M13OvLKfM0JQlQwA0Jrnm9MzxDD+wI5RXrEAcrpZyzel3ZIMqu4dwBd6a2LdLcyuab1Gm2p1gohH71VxnSDhH7YWG5zXwo4DBYFXckV1qTqUzUGfFfYv0+uuOZeVwSuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439855; c=relaxed/simple;
	bh=9sm8KXWdUgCKJZiCqooRJIQAmVgG+nvnpuC5U/+qK1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0Fi1sqX8VR7HIdTWt/aV8LKl5Jfe9NnH6nC3+Og4Z4DVG5ggi81cixh3NTaEjXPfi0JN9Bt7vI/o1kqLLHsNQjwWrATyjZ8TvDTWPcp+KBlY4gIhbyk//FcHSMJBxp4pZAagwZykuAdxqMCVu/Stb8GM+RCZ3dMGXoUSSAQmsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc4000Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4LYT5CQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc4000Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4LYT5CQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUl82895417
	for <mhi@lists.linux.dev>; Thu, 8 Oct 2026 06:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=; b=Dc4000SimgsXN83I
	YITP31k18mKS8yvh2N0PkMiaGpEDdJ1SJkyWtWR8nd8dNsK08a+3gMNEiOkvWil+
	f4ghUYYHSZSMorWYDYWU8JFLvLgghY3cIyOyKguNn6rcz3Yn4Tjok5whiWbOjXgK
	H39+T5pc/gsps0BY71Vgfx8/2brr0pASt9UhMIwoE1GPgzE+RaYBSDajq2qrBMar
	jR7f8c46nQwVFeP773jhNDSL1xmLKrNZ4awcU+2uSweWbNuFELm494VU06PrkbIY
	nWzcf5O5T6yCObzS7izBeZhsxeUjQ/qExP79TwM8XwWujinvUluVIagcz+I2I3UU
	gbeEew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8ydm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Thu, 08 Oct 2026 06:10:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5815728a91.3
        for <mhi@lists.linux.dev>; Wed, 07 Oct 2026 23:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439852; x=1792044652; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=Z4LYT5CQMcNIZNT2uR8JnP/E04JMVDvCIylKjHSiIulDrwrqCUPhIWKmkUw0PQ+Xlt
         6bVMNGp1+4brerzspIz7ST2Xzx9pyXj4WdJT9d1L5N7UxEfMh1A1/XFGjjDu6T/tA5ms
         OmpJA/5FE3YEhsi6wGy8sHho2LzhjROsZtND1t9OCMRl+kPKpaoiq0UgB0bQ4ej+Uegg
         aZqEGz5hq+ea94TmOIFd8mVV5YmKfhOUyCgq7sP/LbZJL7lDS7L0dbEDbzPJEIwlkhyS
         JLBNxtd4F7MG3MGpq894fkxZRZbmvkA8BbFFiEzhvHZqSLqY7C7LvqHWYGGmUHPxJMJ7
         BAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439852; x=1792044652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=LO7zu9R5fNYhDJW8OQ6rhf9jGY5WcM8OvRKtG/LMtNxjubJyT18vqQBG3zmmjoluCH
         YK6vGXV3GLneZhSKvrQXG3JHb/kpxVnYSuzQ0HvRoFoxYtwSNU45dypc+ePvSIPw6eQS
         d2gb/yqFEXRFYFQreMn2Kd3xg2hSi5aDiDHlY6M8gUuhZriG9gdm8PPCMEublLFvZSbn
         GWEosmppWBhz6qSVfMZi5BNEXokbXglAuz5Sg9pobmqq590H5lgT0Hi+cGTtte1hg/Ju
         GBsVqn7qK5mznqaJbEm4Ef1XDn8os48AuR1RAGW2JhTPRrEt4lkrnht9V42m0+hnAtZ2
         Ex4A==
X-Forwarded-Encrypted: i=1; AKwUvByYDo7mBlqE+p/3dv/XvAaZb7SOpNT/GAo4iH+dgUKG1VDX8nXjuKR/+J5CVIIhOyqYhdI=@lists.linux.dev
X-Gm-Message-State: AFq9FYIu/IEevAMfWQKRXQuydlm4PuIAOca5E1qv/7pRsiLCceTOslu1
	sUeZHDmvJYc/2rw5SwTh1i4WpKGGUtNtGMXr18o25aMlInIrsBt+0JccXDLZaH1LTdyokn0ga4r
	TB9cJXdP6PG6rTYcKz9D/c8K7dRRYsJVQLzghq8zu4BQzYTGJZKu5Dos=
X-Gm-Gg: AYBFou3k0AptfcWI1Cd+ZGrT6JuTuEMNXUw2nVuAtySUPSXnyM4w5qxQZVN9WH8zPrm
	bCOlQF+8oaiYAKY4VujIYOvnRcKsTjpDWJT2vITdBO3hf1Qv2mt6i/l7domQjdH286CV6ewwkry
	hH58361Lkj12WXkqIOfHTZPiUfyGNPH0yo8R15TYpEVLRavN7rWvsAABTNiYiCoqF/YhBkXrDlL
	XFXgOZiCMLO6IEAHDqS4FpNmW+BtIC3YNz5fsoY8qVMo5A8/J3GSYeja0X+0mFiyNKhcNKEkCsb
	FdqTnb9TUR69U+0n7+p1jEgBCRNg2jYOQv6iQecRBQ1S9eflikYOOXBQu1uD9n7TCubCB7QRFV2
	qb+l8GrVKExTlzjHBebRX89eVSyiOQOs=
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492339a91.41.1791439852119;
        Wed, 07 Oct 2026 23:10:52 -0700 (PDT)
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492280a91.41.1791439850602;
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc6e23sm2785258a91.14.2026.10.07.23.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Message-ID: <f69b350a-63a6-4a66-afc7-8421ab86877b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:40:45 +0530
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
 <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xErlvDqGj5b49PAeY5Kz1IcZ5TsUeuqq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX+k1VUGyEcDAI
 4JE/POt35nplrhzIck+q9bXYwLikomfznycNJr+GXGdSyttho5Sn8sTViD8871GP7lwn5/XK50A
 /4NtRefft+upR3xx82HoDvOPg0/bbew=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXyEXOc1QpZGvO
 /gv5hI0DkpjzLV1kenYMKKTPsa3ruGSKIEqXuHZZH2sDayRwP+L4yYA3jqeMelRhnY10Fp/xLyd
 ejf7G8m8Mv+18kPljgKEWp+TUmifaB4hOjqCfyuyENjQan6m0wLAA8D2+y6tLNqQWzOLDu2rzJf
 bIqh6rcBgRfZCoyTXsVmL5eZ/4BKaZuSO+fDlWlTtSKG78QGEPoHz5H3TcTEsc8WwTidc3Y5syw
 xhwHjaH8euRrCK/h3pMvzulQgLsYzYKikggoJuJK1eCOQ4N6rWN+CKZdisLfJnsL/kPxq10gn4h
 15Fgs6sXDbYBG5ZWnK4UKZRDbgJoRqR1YaQuE++XqfTgCE+1q6wwvaVbOmadaLfTzbOjHmfQk1F
 ZV42mi0QRmXaYCFnaKzxD5fUsNZgbNYT+DqyryJUwLy+B67xC4iB0LcBzeJCnjmR/KK0Rydyvor
 yJ0SQbWA5XUHK561Z6w==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac733ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QPSRtYdQVBWiSw6D44AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: xErlvDqGj5b49PAeY5Kz1IcZ5TsUeuqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/8/2026 10:16 AM, Randy Dunlap wrote:
> On 7/1/26 3:37 AM, Kishore Batta wrote:
>> +The packet flow sequence is as follows :
>> +
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
>> +
>> +2. The host sends a hello response packet with a success status and sets the
>> +   mode to image transfer pending after it receives the hello packet and
>> +   validates the protocol version running on the target.
>> +
>> +3. After the target receives the hello response, it initiates the data
>> +   transfer by requesting the size of DDR training/calibration data.
>> +
>> +4. The host sends back the DDR training/calibration data to the target.
>> +
>> +5. The target decodes the training data and does not find valid DDR
>> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
>> +
>> +6. The host sends DONE after receives END_IMAGE_TX.
>> +
>> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
>> +   not received all images.
>> +
>> +8. The target executes DDR training process to generate valid DDR calibration
>> +   data and prepares to push back to host.
>> +
>> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
>> +   to the host.
>> +
>> +10. The host sends a hello response packet with a success status and sets the
>> +    mode to COMMAND_MODE.
>> +
>> +11. The target sends CMD_READY to the host.
>> +
>> +12. The host receives CMD_READY and starts to get command IDs to be executed.
>> +
>> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
>> +
>> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
>> +
>> +15. The target sends RAW_DATA with the payload which contains DDR calibration
>> +    data to host.
>> +
>> +16. The host saves training data in the kernel buffer and exposes to userspace
>> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
>> +    IMAGE_TX_PENDING to continue booting.
>> +
>> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
>> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
>> +    repeat the packet flow for image transfer to get all booting-required
>> +    images.
>> +
>> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
>> +    packet with a success status to the host.
>> +
>> +19. The host sends DONE after it receives END_IMAGE_TX.
>> +
>> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
>> +    it has received all images. The process has been completed after the host
>> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
>> +
>> +Subsequent boot scenario with valid DDR calibration data
>> +--------------------------------------------------------
>> +
>> +The below firgure shows the subsequent boot scenario with valid DDR calibration
>> +data process being loaded from host to target.
>> +
>> +.. code-block:: text
>> +
>> +                        Host                       Target
>> +                          |          HELLO            |
>> +                          |   (mode = image transfer) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          |   (mode = image transfer) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |         READ_DATA         |
>> +                          |   (img ID:34, 0, offset,  |
>> +                          | size of DDR training data)|
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         RAW_DATA          |
>> +                          |(size of DDR training data)|
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          | Subsequent boot scenario  |
>> +                          | (valid calibration data)  |
>> +                          | DDR driver configures DDR |
>> +                          | using valid calibration   |
>> +                          | data                      |
>> +                          |                           |
>> +                          |                           |
>> +                          |          HELLO            |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          | Boot/Load rest of the     |
>> +                          |    images....             |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          |(mode = IMAGE_TX_COMPLETE) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +
>> +The packet flow is as follows :
>> +
> s/as follows :/as follows:/
> in 2 places.
ACK. will correct in next version.
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
