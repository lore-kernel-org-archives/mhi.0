Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB977379EFE
	for <mhi@lists.linux.dev>; Mon,  2 Mar 2026 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430652; cv=none; b=gObbCzQ/OpRiBOriKUXYxkmR4sFuAYnbf2okRVH6rWGRYrFJSrXco6gkqOFxjuYabJ3b507Z/FOmnFQgJYW7xVCY3pbRm7zJ083ZGLJTGIhShdxg27XVytQmK1Z/fhKSblwSBMi0/MCqvUXtdU1TgrNQdjfyaLa7U6NGZEOki5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430652; c=relaxed/simple;
	bh=Lju4CWP3V8ABLB9X0SzpJ74BRzmxxmjnvWfRf+lmAZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSNJGLG7nS1GMMVV8b84eKNaYxOgqBr2Klk0KY+GFVtNqEA/rLK4QC/ZUApE04QHqHGY2G2MDddTiMbnL7tQCPQPQm2jbZgX1cpSzBeV/+e+AOjOY2DYvBQQQuNdGAPAihwVrCEdU6y5nIVdBxlzGemiWyOExuGlNEXc42Kg9aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aG7zdkQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/j18wP8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aG7zdkQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/j18wP8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621HbUTp2159953
	for <mhi@lists.linux.dev>; Mon, 2 Mar 2026 05:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J1C4lzpd3bnHoLcJu0iuRLe4fMG9cPL26Tz
	5T+lx3rI=; b=aG7zdkQjnT7fIMbx0usGgpjqHRjHguZPe7O7mwOHz+G0dwd93yv
	ateTOcs/C9nJ+7V3qIlvcyLr4MLEtjphtaSJ1cBSVRf2MqeaWhLvCDgc14jko0Sn
	WTULyynOMU8ArnuI1iFwSPjLqRZcT6CrBx94rcSr/Z3Nvf8PXK82Z/+tXdbdxPuL
	5j1TMVUNIMUKXTrdRviMlQqUqQ6tVCgL1tnIun8mnf2BAAGSdMwMzUQxAiXg4v6V
	aOYCb5viaN3hjLLKAnIILmWUF6kTF25EeEUWNqL63aaNybR/9AB4PSut0RMq7xdH
	6zKb+DUob/vlafuK2UKCD9VGHeyjp5+96sQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbasu8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mhi@lists.linux.dev>; Mon, 02 Mar 2026 05:50:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so28693265ad.0
        for <mhi@lists.linux.dev>; Sun, 01 Mar 2026 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772430632; x=1773035432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1C4lzpd3bnHoLcJu0iuRLe4fMG9cPL26Tz5T+lx3rI=;
        b=j/j18wP8EbKPddp5oKsKFn2tyPV4vGK3jSpOVQy4c3bzrC96CKBnTgMui2B/VHTnX5
         Txvc+ofxwcGORempyosTT9QlCT7Zg4uknX78fF3G21kIWHcvncgcT6M9HEoP+/8wFbwm
         D+CRlZlPOCRvswaaFAtPQcPq/clBWL0MduSIR6dasjGhhiQCSe3LP0XAN7hKIDg9/mPm
         KW5Z/gw1YKujhz4I30S+rasqkLqAFEOUfTdyIQWUKbDXvMwpt4mE1RMy6ihNWCkt0+Ye
         Hry7YicSkYjzfJsij4P7epwGjJxk1L6fP/OjfhIdsZ7yvSPVESBswIPW81nhL7AQjG2S
         A4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772430632; x=1773035432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1C4lzpd3bnHoLcJu0iuRLe4fMG9cPL26Tz5T+lx3rI=;
        b=OTZYeSb2ZSyGpXXt+R0c8JiExut7Kh5UIbZzOLqHU224TYgCvZ9dEbE0Ih1vMAxRlj
         EF0X3Z14mdo0pfAiAgcgKfzIIo65ABWvQGAFtwF4YPr02SxP6E8EE2Yi2M3TaLW1dBxf
         iDSoaN6rdeHoYZ2mFHs7MFXTPVIqueMfVs5hnt/s8RIdzMQdASxlTyIsvWEuCbnKJ5H7
         ZVXnFzWPwZeWEJDcsDYKBro2gtr2uroGJ25Tvd7YZbzHNsK8uea7yOkmBGD2XhP5FiVd
         0hQ5vSF1/aOxdhlBjwNHU3vfaXGCzF9nSdiWcTz8/eKSgI5rqhrpej/RYvqOEL2cLl8b
         W/EQ==
X-Gm-Message-State: AOJu0YyFmeXE3gXg8ZjByR7thCgE3alF3ea5IgJ8daJ1Vfqc14IOqZ0l
	yXKnNEPmw3xGyJumDZ5A2/uOGcrl2P6R6jPbCW1GN9xeGBTx+q1FVLbePDX1b8B7AklEj7rH+br
	yxw7L3qhoiESgtyvWHB9BmovkHbJ2U97rq22xyKDUjBEPyCESV8M9AE8=
X-Gm-Gg: ATEYQzxiguyYKwOG0jJ+sRhYdgcZN4isSqymgtdfNbWBIFhiTmOBxCuDTj2ebkwOpEM
	sf852Dpw7Tqgy95FZiCwGQ6WNFrnHXucEi1mMFE0gEd3wfzRA6g2MeKCcftLKKe1kTZu5zNw57y
	94chhIKjeGaJht2zuB/1VmM2jPg9F7eXJurUUeRftij28jA2wnQUBzyaOKen1XpSQWPqOr5wJVP
	jT2E2bsRtapNsyoYO5gahcuZJmfiBTxuXILBBVcAPtYtj1RzUlXx0koCZBD9J7HnKxnOqfsyakO
	GClJygYUCxAS1eJiTRZ/RdgFHrJ2E+DAPk0a3xduer36CBRh24bAqw8MevI0gs4AgaANEpW71fb
	m2Gu57SdV8d3TLD5G+et2tCaPXZ0zvNUDIuBTFFHRMXv7vyw=
X-Received: by 2002:a17:903:2f46:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2adf78db637mr150838065ad.5.1772430631687;
        Sun, 01 Mar 2026 21:50:31 -0800 (PST)
X-Received: by 2002:a17:903:2f46:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2adf78db637mr150837705ad.5.1772430630877;
        Sun, 01 Mar 2026 21:50:30 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:40ee:341f:1665:8aed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3a9baf93sm64857195ad.27.2026.03.01.21.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:50:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] bus: mhi: ep: Test for non-zero return value where applicable
Date: Mon,  2 Mar 2026 11:20:21 +0530
Message-ID: <20260302055021.8616-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA0OSBTYWx0ZWRfX+BqBVWLWJcxG
 uFiJuxPQPuuS9P1PWo91aIuYgm1AL0c6arElVQcOpLMs/L8J5CaR7v4G3gcRH25ei+Q7HTTqFN4
 OungDt80PRgZWB3B4s/kX6u08pQXDDlU8TPXh5imrs60kNlUD7VjlexzvqjxPO6fHh3PTRu3Qme
 8/q6IFUi3CnQK7bnjGnsaVSUIovvIQjs3H6ASIwbYbdpe+Xlb9iyjhRrS0GLhqg/eagZm0805m1
 O7TjwXxDbhcXztsdAp5G6PzH+AkaPW5qTtWOydFuw4L4Czsu5LoIWh6yhz4qRLYIUhex9BRK/0E
 utXY/P0UwDBYFFfjk6VOftkKSxB/5cEEL0MmJKT+3ys6xQxkGRzcjNsUtpYuAMv4pYvOCLX+5Gd
 u8ijqmT80wDnTxG84YonIlYrFBArYEEJLkzHxW77LLvisYpz0W7btV9ij/pK9VSXiBJFwMT0Otr
 wk3yyMNi1KSwOW9WCpw==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a52528 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sJQNH4r01jd-CmyNH9wA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: PtcehfxM58Om2xGJPU-SDs-UX6BAVwNa
X-Proofpoint-GUID: PtcehfxM58Om2xGJPU-SDs-UX6BAVwNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020049

Instead of testing for negative error code, just test for non-zero return
for cases where there is no positive return value. This helps to maintain
code uniformity.

No functional change.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/linux-pci/20260227191510.GA3904799@bhelgaas
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/main.c | 10 +++++-----
 drivers/bus/mhi/ep/ring.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index e3d0a3cbaf94..0277e1ab1198 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -367,7 +367,7 @@ static void mhi_ep_read_completion(struct mhi_ep_buf_info *buf_info)
 				ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
 							     MHI_TRE_DATA_GET_LEN(el),
 							     MHI_EV_CC_EOB);
-				if (ret < 0) {
+				if (ret) {
 					dev_err(&mhi_chan->mhi_dev->dev,
 						"Error sending transfer compl. event\n");
 					goto err_free_tre_buf;
@@ -383,7 +383,7 @@ static void mhi_ep_read_completion(struct mhi_ep_buf_info *buf_info)
 				ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el,
 							     MHI_TRE_DATA_GET_LEN(el),
 							     MHI_EV_CC_EOT);
-				if (ret < 0) {
+				if (ret) {
 					dev_err(&mhi_chan->mhi_dev->dev,
 						"Error sending transfer compl. event\n");
 					goto err_free_tre_buf;
@@ -449,7 +449,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
 
 		dev_dbg(dev, "Reading %zd bytes from channel (%u)\n", tr_len, ring->ch_id);
 		ret = mhi_cntrl->read_async(mhi_cntrl, &buf_info);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(&mhi_chan->mhi_dev->dev, "Error reading from channel\n");
 			goto err_free_buf_addr;
 		}
@@ -494,7 +494,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
 	} else {
 		/* UL channel */
 		ret = mhi_ep_read_channel(mhi_cntrl, ring);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(&mhi_chan->mhi_dev->dev, "Failed to read channel\n");
 			return ret;
 		}
@@ -591,7 +591,7 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
 
 		dev_dbg(dev, "Writing %zd bytes to channel (%u)\n", tr_len, ring->ch_id);
 		ret = mhi_cntrl->write_async(mhi_cntrl, &buf_info);
-		if (ret < 0) {
+		if (ret) {
 			dev_err(dev, "Error writing to the channel\n");
 			goto err_exit;
 		}
diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
index 9375b16ff2a5..405ce16c02a8 100644
--- a/drivers/bus/mhi/ep/ring.c
+++ b/drivers/bus/mhi/ep/ring.c
@@ -49,7 +49,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		buf_info.dev_addr = &ring->ring_cache[start];
 
 		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-		if (ret < 0)
+		if (ret)
 			return ret;
 	} else {
 		buf_info.size = (ring->ring_size - start) * sizeof(struct mhi_ring_element);
@@ -57,7 +57,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 		buf_info.dev_addr = &ring->ring_cache[start];
 
 		ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-		if (ret < 0)
+		if (ret)
 			return ret;
 
 		if (end) {
@@ -66,7 +66,7 @@ static int __mhi_ep_cache_ring(struct mhi_ep_ring *ring, size_t end)
 			buf_info.size = end * sizeof(struct mhi_ring_element);
 
 			ret = mhi_cntrl->read_sync(mhi_cntrl, &buf_info);
-			if (ret < 0)
+			if (ret)
 				return ret;
 		}
 	}
-- 
2.51.0

