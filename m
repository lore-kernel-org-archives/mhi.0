Received: from fallback21.mail.ru (fallback21.m.smailru.net [94.100.176.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98A46A5
	for <mhi@lists.linux.dev>; Sat, 30 Apr 2022 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=YqeXQHSRSMmrcmgeTcHSBGu8wJZiQRm7iAbJ2Yyg7wo=;
	t=1651315285;x=1651920685; 
	b=cLIRap1bQeBXtkxlTCGfK/5kbGkIT+kLgxb6PPUB8lg/JmNTO72l7VAHgzre+GDOtaCvk+naiYn55GtdZtZg+2wcPXYLfgQW5qaCIMZ13HQXS5FOhL9c9nMD/pTzEWtiRs9HSNXiCi6cQdVd/CwwN0Q/EwU5lR/sVoShPiiEAq+LYB5pnS206Q0O2MPObPi+FhQy6MzTu0lN+vfwDSRVpobKgBe52LZSAF8D+Hsd+7Wd1968cqxWH4aZT/I2Qv9e3F2G8pZHE/6PxHVbARZNd/VgRiuhEtRfwHNTvnKbaQMXNlaGxIWHEjYehdaqQsrzs6ckeXQ6nggnA4hQ1IG4Fw==;
Received: from [10.161.100.15] (port=37026 helo=smtpng3.i.mail.ru)
	by fallback21.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
	id 1nkkR1-0000aU-G1
	for mhi@lists.linux.dev; Sat, 30 Apr 2022 13:34:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=YqeXQHSRSMmrcmgeTcHSBGu8wJZiQRm7iAbJ2Yyg7wo=;
	t=1651314883;x=1651920283; 
	b=i8DNLPQEtvmWaOgwNeoL6gde9ZhGPUjJx817osfhrgC8hYuN76ciB09foDhToYyWoLDkSBaf2C5JTlV2ZsgpPHxzYI4L3hTpvrX0vaTGtAoRoBB8A1yhFNhVx9xe5YTAS+aIZsQ7OcNq8WPx+HabyF3qz4azn5A0OXZf9If38YEDeM/v/qO0A3UX/LdS7UGt/YDMG864NCAZjJawgrlWpsxdmJdqhUp9rZeenc91tcSgKMEHpVfTXS/HzlaXxZy7wi1RCuIEeAhmqy1XIlAZ6PJi+gDpsG8gnW0gT1OOu84ZwWwXjd12ujG5aPKnRkHkiiJABIWDhv0lUNNKb+WY/g==;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1nkkQr-0007vh-9r; Sat, 30 Apr 2022 13:34:33 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: mhi@lists.linux.dev
Cc: manivannan.sadhasivam@linaro.org,
	quic_hemantk@quicinc.com,
	bbhatt@codeaurora.org,
	Maxim Kochetkov <mkochetkov@airspan.com>
Subject: [PATCH] net: qrtr: start MHI channel after endpoit creation
Date: Sat, 30 Apr 2022 13:34:30 +0300
Message-Id: <20220430103430.37349-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD977B76FDA87AFA8B9DAE8E32DB917F83661DA9E55EE4E32F9182A05F538085040717CD4711BB884E76EDCC94696723E00067449E550149C5F54A90CAE50B2239C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D3BE5B596754B8C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE789805A6418246A1AEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA61674E6FB8712455456E70F3FEB3CF83F20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C078FCF50C7EAF9C588941B15DA834481FA18204E546F3947CB861051D4BA689FCF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE493B89ED3C7A62817815705F49E3A860CEDC4224003CC83647689D4C264860C145E
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A50A491D509C7250F235A26A1B860E808CCEFE9BC5AF28B39B1881A6453793CE9C32612AADDFBE061708084F7977F5670A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D5333F7A9E5587C79A693EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344888A9AABCDD322534FCA0B9DA5DC01AB72C8D7C964BDBDECA5C726F39075D59644E8C07033ED87B1D7E09C32AA3244C78F92FEC73655C4F1F977AD87A93BB833A76366E8A9DE7CA83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXh/LzECw/Zqfme1uGRGNHL1
X-Mailru-Sender: 689FA8AB762F739339CABD9B3CA9A7D66D550961C9548C5F22E8B6C58D40E7B398CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B43AA9A89F3DE39AFE8AC1265785075D8D327EDA2A8B790EDF049FFFDB7839CE9ED9EC5E0AAB34E4C0153971563A0A3E487088C25F89E3A1099AF769F7F8C4AFC9
X-7FA49CB5: 0D63561A33F958A5271E1E663CAB5E2E61CC5AB4AA9F6490CD5A6FCED8F4251DCACD7DF95DA8FC8BD5E8D9A59859A8B697C12C9E82E3FF88CC7F00164DA146DAFE8445B8C89999728AA50765F7900637FE0C267D7D9174FA389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8FD04FE2AD1523FDBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7ACF3BB88B10F35FF731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A50A491D509C7250F03B734486F19CFFF15A1E7DE6C1E5FB2B1881A6453793CE9C32612AADDFBE061708084F7977F5670DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojpu98ZoqON0adVUmVBdtnww==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

From: Maxim Kochetkov <mkochetkov@airspan.com>

MHI channel may generates event/interrupt right after enabling.
It may leads to 2 race conditions issues.

1)
Such event may be dropped by qcom_mhi_qrtr_dl_callback() at check:

	if (!qdev || mhi_res->transaction_status)
		return;

Because dev_set_drvdata(&mhi_dev->dev, qdev) may be not performed at
this moment. In this situation qrtr-ns will be unable to enumerate
services in device.
---------------------------------------------------------------

2)
Such event may come at the moment after dev_set_drvdata() and
before qrtr_endpoint_register(). In this case kernel will panic with
accessing wrong pointer at qcom_mhi_qrtr_dl_callback():

	rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
				mhi_res->bytes_xferd);

Because endpoint is not created yet.
--------------------------------------------------------------
So move mhi_prepare_for_transfer_autoqueue after endpoint creation
to fix it.

Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
Signed-off-by: Maxim Kochetkov <mkochetkov@airspan.com>
---
 net/qrtr/mhi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 18196e1c8c2f..17520d9e7a51 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -78,11 +78,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
-	if (rc)
-		return rc;
-
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
@@ -96,6 +91,11 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	if (rc)
 		return rc;
 
+	/* start channels */
+	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
+	if (rc)
+		return rc;
+
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
 	return 0;
-- 
2.34.1

