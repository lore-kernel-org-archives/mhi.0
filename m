Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46995171BF
	for <mhi@lists.linux.dev>; Tue,  8 Aug 2023 21:14:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 378KGqpc027076
	for <mhi@lists.linux.dev>; Tue, 8 Aug 2023 21:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=PjCp53eLrHwRgerfoqW5a0/j7SrIRJEmNWsvTr13l3M+HObiu8I9fhiT/Z7C8+b+XFXB
 YXudJOi9US1i3CxfpEhdWtBZM+477mZHKpZHiwyfzWdR5iHLmQWimkDPOg4OYkJNwsWi
 7RIq36Q6tsA/r+myqd7vP4wxgt/n8tQxajBc6xFbPD79ZBo2Ds69iaZSz5oPLKUld1qh
 zRxM3XyD8gDLGuNf6DBvoIRH5zxzqylE5DR3R40D2TYZH8xO2WRW57X5pLwsoB7kXqO/
 o9XlwluHgSMIQgmQQ/gZnXnB9LkZhMF5MNCPi85LOo8YGd71neXdMETXUBf9t2UOFPUM Mw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sbp17h2m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 08 Aug 2023 21:14:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 378LE2gB013706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <mhi@lists.linux.dev>; Tue, 8 Aug 2023 21:14:02 GMT
Received: from [10.71.112.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 14:14:02 -0700
Message-ID: <4ed9f118-05a5-4ad6-8f53-08b8e4d374ab@quicinc.com>
Date: Tue, 8 Aug 2023 14:14:01 -0700
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <mhi@lists.linux.dev>
From: Mayank Rana <quic_mrana@quicinc.com>
Subject: subscribe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: 
X-Proofpoint-ORIG-GUID: DuzdUlrRk2uJiytG2lfm-bbYbd1T7mRb
X-Proofpoint-GUID: DuzdUlrRk2uJiytG2lfm-bbYbd1T7mRb
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 malwarescore=0 mlxlogscore=345 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308080188

