Received: from pv50p00im-ztdg10012001.me.com (pv50p00im-ztdg10012001.me.com [17.58.6.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391EF15AA
	for <mhi@lists.linux.dev>; Fri,  9 Jun 2023 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1686321748;
	bh=CY8s07ypV5krtUwSmbPxJXUTAsPd9WgEEdu9C5VBRc8=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
	b=g0ZSzbQBlh0fCfHrXFNLdgRx+0HcvSxltAymOJr29Q5lCYcG9Ye7Jzyn/KAPrvnxJ
	 NY0jPg/QpkXFBzscuZz7Id3UI4j11dQ+LTQFJP+coQcyF0BsVQSBCv2JiXRohCnHsi
	 5/LNNVDrdyS0pGXRgA5WBPGl49czOwNUlIdeQX2JhAMP2IU+0sdg+99f6dQ10WeYI2
	 8X9LRJuZYSrYiBvL9+Xe4QWgnJ0Zz5BLlQ6N5+xkYJdIiYbZlUDmxf6Ntq1elw7Nvi
	 0XYK74JkmEWW7kZfee2IzSQXD+OgtND9SfxG9Y/+X6rrMEJoOnmFfbZGbCOMmV6ZR3
	 6piAXS/R93dAw==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 7154BA02E9;
	Fri,  9 Jun 2023 14:42:26 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Abdurrahman Eksi <eksizadeeksi@icloud.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Date: Fri, 9 Jun 2023 17:42:22 +0300
Subject: =?utf-8?Q?Re:_=E5=9B=9E=E5=A4=8D:_[PATCH_v4]_bus:_mhi:_host:_pci?=
 =?utf-8?Q?=5Fgeneric:_Add_support_for_quectel's_new_EM160R-GL_prod?=
 =?utf-8?Q?uct?=
Message-Id: <8640F4DE-6B68-4E35-B779-1519BAAB6524@icloud.com>
Cc: bhelgaas@google.com, duke_xinanwen@163.com, fabio.porcedda@gmail.com,
 jerry.meng@quectel.com, koen.vandeputte@citymesh.com,
 linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org, mani@kernel.org,
 mhi@lists.linux.dev, slark_xiao@163.com, song.fc@gmail.com
To: duke.xin@quectel.com
X-Mailer: iPhone Mail (19H332)
X-Proofpoint-GUID: PEUjI3x2ooztbEPiKjru8NSzWGTVMVGS
X-Proofpoint-ORIG-GUID: PEUjI3x2ooztbEPiKjru8NSzWGTVMVGS
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 clxscore=1011
 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=848 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306090123

X

iPhone=E2=80=99umdan g=C3=B6nderildi=
