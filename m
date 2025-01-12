Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B47219FF
	for <mhi@lists.linux.dev>; Sun, 12 Jan 2025 04:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736655812; cv=none; b=AtbR5Kb7Auxa8Z45fHT+H4SD+O4FO9XqemIj67wAhc/tIDoztEUHJTRpICTeid4g+qqraWCKfqePojtJwOLoUzKNdjftzhuMMQkmZoLFXTAdQ8bNm9wsVD0HMcwa+0sHAhqYsRcKT72F7BTbSZBUXa6dHjscs6KMNwMwG2C/1rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736655812; c=relaxed/simple;
	bh=36RubHS3Cnm6huMkfjDsiWl/nxjNKQeCb1t+02PapzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rETMNrF/ynL2a5LsEOie6wkEkGHSuOkaLIG8Hu8nEDxby+IqsGaGX0wTTvjKYUB4IScrObEwLaVJ8jG8t/PwdG6vvoAqX0ntEg6soa2/6VQpdJywkbMLCb0IT4/cGZ8ucHLqVW1QLO4qvn0wUVGO/llKUl7cUEPxJj3o1OcC1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTEHJYzp; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTEHJYzp"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so5456434a91.3
        for <mhi@lists.linux.dev>; Sat, 11 Jan 2025 20:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736655810; x=1737260610; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o1iD5FXnr9tRagISbCiZ6n33Qv7hNVSaezl59sxw848=;
        b=uTEHJYzpQx6Sclw3Ouc2pa+kMByQO2VcsFK+9F6D/hcPXc0l+i/T1ftVUFi3wrg1dJ
         KEAGI3OkRBSGhBk7Oi/2F6GthE4ZlNQ8dzqB8gfdVybxl3kSOL6XQOWvS0LgqBmKJdKv
         i3mcosEcPSXi42viF6ibaZBKpTmt0HEFeXrkxyNuv57tN+xqexZcYtlCQ+kfdTpsdT1X
         AmlUqI/iDZP542ytAR+OSnbSESx19rbohZbY6cfXgeJWY4VHGroGdfywZIQrXEvySyFf
         /RKHcpXCkKLxzhkQnnRcTNDKxl8tjVHvWxIi6YF4iicfVuw8rTBQKvmuifgchtH/c3mt
         r7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736655810; x=1737260610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1iD5FXnr9tRagISbCiZ6n33Qv7hNVSaezl59sxw848=;
        b=CB+LyJUUDpX6Fq1h9/tchDAHeej+45bBWxRNmhEiz0kRyi90zXvhiOJpUHqRxaHeG/
         B1uKNP8ZGvIQ/jdNNRXjcQ3HDF8L9dyCX0djJVqeIz79KUMoGUxpSnOoCXNg3aodL4FP
         6p6xkv4KPr/4H6bIFgj+fbPmkVPKR9IyT06jLxfQQ+VHNmrvio2CbZ8/5sm/fPGqGvmO
         cgLti7itVzbdXZDjD5S4tk+IrcnrrcaKY1W5AkfIXTJm9CDFSSgHNQE5fl4juCWUuqlw
         bQslLVvbQWMuLDSXVxc7lsES85hnqZL49nzyEjCcMBcda0sUCPvBF3NFx3birADNywCf
         OTLA==
X-Gm-Message-State: AOJu0YwMpVoUfzRKt2m0ViTK5R+1hxpIa9NxcOgeNuV+j+RgsBh8VQQT
	nO7qWnSJABE7YcT/6ZL7LlyOLNV6Fhcq70QTep+rLirsty8SCQEkjVDTq0UVgA==
X-Gm-Gg: ASbGncuuWeu4Bfa0m2NUwjsqT+1hrBye47hZRWvGlxOXBjJAWqiUTUqwEY+PpMnenVg
	o7+h8deyW9pT1aqRp+yvbxO3FhFG/nPKGG6wqs3g9WmzuNVIqxX07BIyUMhCdUXD3ChLmrTHVyz
	dN9QSf9FNwWOz9NItFRKButCGxAfHgrR+IGTF/oEwlLAWVq5KNPHEQY8hRiOkc0KAypyKVuLEBE
	1yHYFX3FWEsAeCCSHvNs2uT94BUX5cHvnJgfYaKTir2pxvnO4qDZfBJOjMLNttoOQDK
X-Google-Smtp-Source: AGHT+IF3OEz850HbSNTcnLpGcYOvuZZBOpakiqJoF5m/TvFHKLFMjvbB2UauZ+EQoabKlqDmh0L6kA==
X-Received: by 2002:a17:90a:da8e:b0:2ee:b0b0:8e02 with SMTP id 98e67ed59e1d1-2f5490ac09cmr22992308a91.28.1736655810070;
        Sat, 11 Jan 2025 20:23:30 -0800 (PST)
Received: from thinkpad ([117.193.215.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2872a3sm7694399a91.16.2025.01.11.20.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 20:23:29 -0800 (PST)
Date: Sun, 12 Jan 2025 09:53:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Message-ID: <20250112042323.kn7xlgyf3olpcavf@thinkpad>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
 <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
 <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
 <CAMZdPi_OPXGkrT_4iyLF-698TPUgHu=Y5M-wVRq=kx6RWH4bVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi_OPXGkrT_4iyLF-698TPUgHu=Y5M-wVRq=kx6RWH4bVw@mail.gmail.com>

On Thu, Jan 09, 2025 at 09:50:55PM +0100, Loic Poulain wrote:
> On Wed, 8 Jan 2025 at 17:02, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Wed, Jan 08, 2025 at 04:19:06PM +0100, Loic Poulain wrote:
> > > On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
> > > <devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
> > > >
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > >
> > > > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > > > is started asynchronously and success is returned. But this doesn't align
> > > > with what PM core expects as documented in
> > > > Documentation/power/runtime_pm.rst:
> > > >
> > > > "Once the subsystem-level resume callback (or the driver resume callback,
> > > > if invoked directly) has completed successfully, the PM core regards the
> > > > device as fully operational, which means that the device _must_ be able to
> > > > complete I/O operations as needed.  The runtime PM status of the device is
> > > > then 'active'."
> > > >
> > > > So the PM core ends up marking the runtime PM status of the device as
> > > > 'active', even though the device is not able to handle the I/O operations.
> > > > This same condition more or less applies to system resume as well.
> > > >
> > > > So to avoid this ambiguity, try to recover the device synchronously from
> > > > mhi_pci_runtime_resume() and return the actual error code in the case of
> > > > recovery failure.
> > > >
> > > > For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> > > > and call that from both mhi_pci_recovery_work() and
> > > > mhi_pci_runtime_resume(). Former still ignores the return value, while the
> > > > latter passes it to PM core.
> > > >
> > > > Cc: stable@vger.kernel.org # 5.13
> > > > Reported-by: Johan Hovold <johan@kernel.org>
> > > > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > > > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >
> > > Note that it will noticeably impact the user experience on system-wide
> > > resume (mhi_pci_resume), because MHI devices usually take a while (a
> > > few seconds) to cold boot and reach a ready state (or time out in the
> > > worst case). So we may have people complaining about delayed resume
> > > regression on their laptop even if they are not using the MHI
> > > device/modem function. Are we ok with that?
> > >
> >
> > Are you saying that the modem will enter D3Cold all the time during system
> > suspend? I think you are referring to x86 host machines here.
> 
> It depends on the host and its firmware implementation, but yes I
> observed that x86_64 based laptops are powering off the mPCIe slot
> while suspended.
> 

Then the default behavior should be to power down the MHI stack during suspend.

> > If that is the case, we should not be using mhi_pci_runtime_*() calls in
> > mhi_pci_suspend/resume(). Rather the MHI stack should be powered down during
> > suspend and powered ON during resume.
> 
> Yes, but what about the hosts keeping power in suspend state? we can
> not really know that programmatically AFAIK.
> 

Well, there are a few APIs we can rely on, but they are not reliable atleast on
DT platforms. However, powering down the MHI stack should be safe irrespective
of what the platform decides to do.

Regarding your comment on device taking time to resume, we can opt for async PM
to let the device come up without affecting overall system resume.

Let me know if both of the above options make sense to you. I'll submit
patches to incorporate them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
