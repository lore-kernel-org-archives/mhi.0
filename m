Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D0E168
	for <mhi@lists.linux.dev>; Tue, 14 Dec 2021 00:07:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639440461; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HrkidRgCOdsW30/DkJv35RJ0R+GZ61VAFBn0ww2cif0=; b=YtbagnxetZbQvij8L539X68JG8eqL/0uycQN23LZp0OqCcaysDJAHeMARG7WEdCAgkhzOL38
 BKPj33MqEsjRUSK4EFPfcfqSQjL+4E55zhOMoIPOBJZtmesJ+87yslE2a2hvZqhsEcg9Af04
 4syT3PU//7cqmp9uZQIkFg2SgwM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIyZTBmZSIsICJtaGlAbGlzdHMubGludXguZGV2IiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61b7e048642caac318d2926f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Dec 2021 00:07:36
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id A2A97C4360C; Tue, 14 Dec 2021 00:07:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.114.105] (i-global254.qualcomm.com [199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hemantk)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B793CC4338F;
	Tue, 14 Dec 2021 00:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B793CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [RFC] bus: mhi: core: Load firmware asynchronous
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Mario Limonciello
 <Mario.Limonciello@amd.com>, Richard Hughes <hughsient@gmail.com>
References: <20211210161645.10925-1-linux@weissschuh.net>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <403e93df-5b3c-acb3-2b65-df9a7834a9c5@codeaurora.org>
Date: Mon, 13 Dec 2021 16:07:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211210161645.10925-1-linux@weissschuh.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 12/10/2021 8:16 AM, Thomas Weißschuh wrote:
> This gives userspace the possibility to provide the firehose bootloader
> via the sysfs-firmware-API instead of having to modify the global
> firmware loadpath.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> ---
> 
> Please note that this is not tested yet, as I don't have access to a matching
> firmware file.
> This submission is to gather general feedback from the maintainers and then
> Richard will do the actual testing, while I'll do the development.
> 
> This patch is should not have any impact beyond moving from request_firmware()
> to request_firmware_nowait() and the involved code reshuffle.
what are we achieving by moving to async ver of the firmware load ? MHI 
boot flow can not do anything until BHI load is over. Is the intention 
eventually to enable firmware fallback mechanism  and manually load the 
firmware ?

[..]

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
