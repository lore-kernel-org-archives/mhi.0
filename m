Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7806B2CA4
	for <mhi@lists.linux.dev>; Tue, 14 Dec 2021 22:55:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639522520; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=j5mv+bwGF9Jb+6wwuoo79SpCjZvRHCfajqRMmmEmvBk=; b=r/dmdXlQyP3r4YEEgEnIKCzJoSpBdA4Pr025HaBJvJ9bUllJ+tiWTAIPvonEpenhMa0QHBz0
 2FhlXTyDiKlzHkdrNrv39zN/GPrTIdqu5qTLHhbeMfP6HH++viHxvfh/jNivXtLEMngBc2Fl
 fB8BD5Pz6ZlG9msUiep14eLVrV8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIyZTBmZSIsICJtaGlAbGlzdHMubGludXguZGV2IiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61b920d75daaeec7972d487f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Dec 2021 22:55:19
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 18170C4360C; Tue, 14 Dec 2021 22:55:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.114.105] (i-global254.qualcomm.com [199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hemantk)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BF48C4338F;
	Tue, 14 Dec 2021 22:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1BF48C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [RFC] bus: mhi: core: Load firmware asynchronous
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Richard Hughes <hughsient@gmail.com>
References: <20211210161645.10925-1-linux@weissschuh.net>
 <403e93df-5b3c-acb3-2b65-df9a7834a9c5@codeaurora.org>
 <02e32c9d-79d2-4237-bb6b-8bd27029e7a9@t-8ch.de>
From: Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <6c805ecd-4542-5533-7852-ecd9cea27955@codeaurora.org>
Date: Tue, 14 Dec 2021 14:55:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <02e32c9d-79d2-4237-bb6b-8bd27029e7a9@t-8ch.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/13/2021 10:32 PM, Thomas Weißschuh wrote:
> On 2021-12-13 16:07-0800, Hemant Kumar wrote:
>> On 12/10/2021 8:16 AM, Thomas Weißschuh wrote:
>>> This gives userspace the possibility to provide the firehose bootloader
>>> via the sysfs-firmware-API instead of having to modify the global
>>> firmware loadpath.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>>
>>> ---
>>>
>>> Please note that this is not tested yet, as I don't have access to a matching
>>> firmware file.
>>> This submission is to gather general feedback from the maintainers and then
>>> Richard will do the actual testing, while I'll do the development.
>>>
>>> This patch is should not have any impact beyond moving from request_firmware()
>>> to request_firmware_nowait() and the involved code reshuffle.
>> what are we achieving by moving to async ver of the firmware load ? MHI boot
>> flow can not do anything until BHI load is over. Is the intention eventually
>> to enable firmware fallback mechanism  and manually load the firmware ?
> 
> The goal is to provide the firehose bootloader (qcom/prog_firehose_sdx24.mbn)
> via the firmware fallback mechanism when upgrading the firmware on the device
> via the firehose protocol.
> 
> This bootloader firmware is not part of linux-firmware but provided as part of
> each firmware update package, so it is not installed statically on the system.
> 
> I will extend the commit message with this information.

For my understanding i have follow up question. As per the kernel doc
https://www.kernel.org/doc/html/latest/driver-api/firmware/fallback-mechanisms.html

If CONFIG_FW_LOADER_USER_HELPER enabled but 
CONFIG_FW_LOADER_USER_HELPER_FALLBACK is disabled, only the custom 
fallback mechanism is available and for the request_firmware_nowait() call.

Custom fall back mechanism says
Users of the request_firmware_nowait() call have yet another option 
available at their disposal: rely on the sysfs fallback mechanism but 
request that no kobject uevents be issued to userspace. Original logic 
behind this was that utilities other than udev might be required to 
lookup firmware in non-traditional paths

Your patch is passing uevent flag as true which means you are relying on 
uevent to be issued to userspace. How do you plan to update the firmware 
path ? Alternatively firmware class provides a module param to specify 
the firmware path /sys/module/firmware_class/parameters/path.
> 
> PS: The current patch is missing 'return' after calls to
> 'mhi_fw_load_finish()', this will be corrected in v2.
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
