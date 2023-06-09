Received: from pv50p00im-ztdg10011201.me.com (pv50p00im-ztdg10011201.me.com [17.58.6.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8A15AA
	for <mhi@lists.linux.dev>; Fri,  9 Jun 2023 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1686321845;
	bh=CY8s07ypV5krtUwSmbPxJXUTAsPd9WgEEdu9C5VBRc8=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
	b=oMQatZKhcCUdUWmylcG+gVoA6xxXtVjCBxCeTgwg2D0WZf+qSE1iPpxdRdlVdWmex
	 KhQIc+FkB1q1yDkE0Yp0V4pvDK05MeZnZ1SvKA1gtMBRvLiqlZrC6bXKzZ009X1QB1
	 6U0Ox/8T4ZG2Z7o8zqBjU7x00k3NpFPpAni8Y0Cy/HbbaID0dk6vtHHe6RDBvAkY9O
	 m4kYCAXv5iUSnQWis1yskxMXwlkwDVPkHikKtZb+jYgBDZ+/lXitZ9upWvrSry5Xq/
	 KxI/hg4nkG2XQkhZWKNb7gcBjVd2Ayr7v2TSPsGY8DF6GIbyN+vKiHpPWHBCE4flUl
	 zdz7f7GRLHXDw==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10011201.me.com (Postfix) with ESMTPSA id 379D1680309;
	Fri,  9 Jun 2023 14:44:03 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Abdurrahman Eksi <eksizadeeksi@icloud.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Date: Fri, 9 Jun 2023 17:43:59 +0300
Subject: =?utf-8?Q?Re:_=E5=9B=9E=E5=A4=8D:_[PATCH_v4]_bus:_mhi:_host:_pci?=
 =?utf-8?Q?=5Fgeneric:_Add_support_for_quectel's_new_EM160R-GL_prod?=
 =?utf-8?Q?uct?=
Message-Id: <E8738161-65CE-40B8-B8D5-00DA6A21D367@icloud.com>
Cc: bhelgaas@google.com, duke_xinanwen@163.com, fabio.porcedda@gmail.com,
 jerry.meng@quectel.com, koen.vandeputte@citymesh.com,
 linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org, mani@kernel.org,
 mhi@lists.linux.dev, slark_xiao@163.com, song.fc@gmail.com
To: duke.xin@quectel.com
X-Mailer: iPhone Mail (19H332)
X-Proofpoint-ORIG-GUID: BS1t2JlJDTl1OhGfB3OLP2Hnq1hn9-jr
X-Proofpoint-GUID: BS1t2JlJDTl1OhGfB3OLP2Hnq1hn9-jr
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=848 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306090123

X

iPhone=E2=80=99umdan g=C3=B6nderildi=
