Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D7A3E40EA;
	Sat, 26 Sep 2026 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418192; cv=none; b=AUs/CrbwtxU5lXxosMLV4bg/VKMg23L+p7jP/StBT6g0fxSPVN4KKFT27mh6rHZp0bzhA+vLCuF02ARig7obwcYkVgDpKe/nRbDd3qmHhRWKptNsboliGLYhiuIZPos0MXnTzHAh/DO92c/Rm6s3WYWeH42808nGysRVnUd0K9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418192; c=relaxed/simple;
	bh=EZfAUbqYJ1PM3Z6EN+GlZo+sS1PxkN+Tq7cm8zBSYeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3Nd2UpqqlWA8zSid/VpRvzM4AvQXht3ikI98YH7zHpSfwxlCXFWUq12YXKhhBd/PUhcp1jnzMjBaW6EAwIHx7TESIWkcnQge+NitfV2NjK2xQB3FAzNcMB94u0nHDQA+8raJLCNVW8lSN9uvT1BqMc/wrgBKkSvpB1dnH3ct9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdzGwDGU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdzGwDGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164451F000FF;
	Sat, 26 Sep 2026 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418187;
	bh=ncaWjkTBpsuz2fmg5NCaoCKERmm+zRTCeF/S7YISaZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KdzGwDGUQ/CbrtXngjy9wN2DpIyGA7bqJlNjVHqrgj5+sH6omk1FadPXcgDRfdkqx
	 1/+SAInFGI/4HDg7Y6HqjbbxPYau9WQ5rlXA3NtF0DVhnzNxJRXvji8yHMJlxKuAXH
	 Ci+62rMKd2FwTERWLgVYf+wiHQPzt7K+0xA5BIoWvjHPG3r7a+dlU5uGI6un/oFX9M
	 sVWsdHOBDxvcAyHEdG5x00PWOpRG39Nt14TD4gAxlSBUaDbM3KzPlIX03QqHKYTyFc
	 5httPN3HK6Kap2FXr/aB9q0Hv3nvYdCnN8y+0uelNMUpt6nRJokxUVq+FQvjx4S1e4
	 E+LuC+ro1JJGQ==
Date: Sat, 26 Sep 2026 12:22:55 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: zwq2226404116@163.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vpernami@quicinc.com, krishna.chundru@oss.qualcomm.com, 
	jeff.hugo@oss.qualcomm.com, Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH v5 1/1] bus: mhi: pci_generic: add Rolling Wireless RW151
 1501/1502 PCI IDs
Message-ID: <36lpjhgapjitezxr32igozbwcy5vyqzcoqes644p2f5dndsm4y@kqf3f5yue6hs>
References: <20260702100013.545593-1-zwq2226404116@163.com>
 <20260904044612.6334-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904044612.6334-1-zwq2226404116@163.com>

On Fri, Sep 04, 2026 at 12:42:44PM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> Hi,
> Please find v5 on top of v1/v2/v3/v4. It adds PCI_DEVICE_SUB entries for
> RW151 sub-vendor 0x2099, sub-device 0x1501 and 0x1502 on QCOM 0x0309,
> continuing the 1500 series.
> If you have any comments on v4 and before, I am happy to address
> them. Please also let me know whether you prefer incremental follow-ups
> like this or a single squashed series before merge.
> Thanks,
> Wanquan Zhong
> 

These comments should go below --- after Signed-off-by tag. I've fixed it now
while applying, but please follow the patch guidelines next time.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
