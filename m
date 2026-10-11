Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7921374E42;
	Sun, 11 Oct 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727325; cv=none; b=Bh0w+d1VL6ZuxeopgNKGjICY3/emr+01qydbZMW+dVF3hHt4E0pzoF380dssXEEEF2yUhgs10zvG+yL9MsmQn58c1sGGg52OFBT1cQ/CVhuHUNM90Q6tRp64YbZvQge04okvNOpydzM+ScdHAbtv7FNjqsUxZQdlWD3x2gh4Mp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727325; c=relaxed/simple;
	bh=skbTylf7Ac9487faSt9TOPnFiodTHbJbwKCQhZ/XlVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlMOnb02/ijEVT+I8K96KKbKaYEbkbee0zgv+jMYzjttelA9Z6IeWBmfZRAcLGQ1huZb+fkdL5g7PCtA8+NzLyrP70bAaqDgf9Jg6DHm0j6n+NGfvJhCHqJpctARzHyGKM7HlS8UL+2z+oCrRwuSsD51z6eNqlzBkPgoxKsofeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWgfbvtF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWgfbvtF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9425E1F0089B;
	Sun, 11 Oct 2026 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791727324;
	bh=+ikNvlVdKX+9yfN4XUddpeSCGxXA1JBv5jFiuPPochk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWgfbvtFOh0tau+ZICH72DJhTuX76OJohIDDJufbZp1Y+gFR762SI8F6dqWs2Qbjm
	 Iu2gXP++oKaI6HgH7gjIZMwJ4n5LaiGLahjJKOAkYZrtUjDUg91IDo3jkEPq7nm6yT
	 ZCiBKg6aYN2yRXSsNXDSlm3lqWQEM1xh14gVX7pyuD06QK/sNWUvJlVO8gXOd1pjzD
	 hQgXD2O7BAWTOP5LKYxmEN+ZxsUbyB2Ms9z0TsI9JbcXiolVBAH9Vm4DBT2uv9V5Mc
	 dFm+b/Jldgk3iSfXS1U34hP9HvUqZ6zowwlkOCzoxFQA3kCLAldzeLImqO5h2mvlNm
	 JMgeT5qEqJqGA==
Date: Sun, 11 Oct 2026 19:31:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
Message-ID: <asuWvXQADsOkS690@debian>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
 <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>
 <xji3thurj6lnez56opmh5xoxzjiwtlh4o5qd6iqokbqkcb4rxu@mblahsfmtioz>
 <d05a60d1-3787-4318-b28d-9901d7fd7a00@oss.qualcomm.com>
 <2cc22f12-25c2-4e01-9375-653b39d8b62d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cc22f12-25c2-4e01-9375-653b39d8b62d@oss.qualcomm.com>

On Fri, Oct 02, 2026 at 09:57:21AM -0600, Jeff Hugo wrote:
> On 9/29/2026 11:56 PM, Sumit Kumar wrote:
> > 
> > 
> > On 9/26/2026 4:36 PM, Manivannan Sadhasivam wrote:
> > > On Tue, Sep 08, 2026 at 02:57:22PM +0530, Sumit Kumar wrote:
> > > > The MHI specification defines a LOOPBACK channel. The endpoint firmware
> > > > echoes back whatever the host sends on this channel. Without a host-side
> > > > driver, there is no way to exercise this channel to validate MHI
> > > > data path
> > > > integrity between host and endpoint.
> > > > 
> > > > Add a host-side loopback driver that binds to the LOOPBACK channel and
> > > > expose a sysfs interface for data path testing. The sysfs
> > > > interface allows
> > > > users to configure TRE buffer size and count, trigger a loopback
> > > > test, and
> > > > read the result.
> > > > 
> > > > The new sysfs ABI is documented under Documentation/ABI/testing/, not
> > > > stable/, since this is a new interface without established API
> > > > guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
> > > > documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
> > > > being covered by the same MAINTAINERS entry.
> > > > 
> > > > Co-developed-by: Krishna Chaitanya Chundru
> > > > <krishna.chundru@oss.qualcomm.com>
> > > > Signed-off-by: Krishna Chaitanya Chundru
> > > > <krishna.chundru@oss.qualcomm.com>
> > > > Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> > > > ---
> > > >   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
> > > >   MAINTAINERS                                        |   1 +
> > > >   drivers/bus/mhi/host/Kconfig                       |   1 +
> > > >   drivers/bus/mhi/host/Makefile                      |   1 +
> > > >   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
> > > >   drivers/bus/mhi/host/clients/Makefile              |   2 +
> > > >   drivers/bus/mhi/host/clients/loopback.c            | 287
> > > > ++++++++++ +++++++++++
> > > >   7 files changed, 349 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> > > > b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..9e47e8443f309199691a50d70adadf84f3237037
> > > > --- /dev/null
> > > > +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
> > > > @@ -0,0 +1,40 @@
> > > > +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
> > > > +Date:        August 2026
> > > > +KernelVersion:    7.4
> > > > +Contact:    mhi@lists.linux.dev
> > > > +Description:
> > > > +        (RW) Size of each Transfer Ring Element (TRE) buffer in bytes
> > > > +        used for the loopback test. Valid range is 1 to the value
> > > > +        reported by max_tre_size. Default value is 32 bytes.
> > > > +
> > > > +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
> > > > +Date:        August 2026
> > > > +KernelVersion:    7.4
> > > > +Contact:    mhi@lists.linux.dev
> > > > +Description:
> > > > +        (RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
> > > > +        Reading this file returns the upper bound for the tre_size
> > > > +        attribute.
> > > > +
> > > > +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
> > > > +Date:        August 2026
> > > > +KernelVersion:    7.4
> > > > +Contact:    mhi@lists.linux.dev
> > > > +Description:
> > > > +        (RW) Number of Transfer Ring Elements (TREs) to use per
> > > > +        loopback test. Must be greater than zero and must not exceed
> > > > +        the channel ring capacity. Default value is 1.
> > > How does the user know 'channel ring capacity'?
> > If the user enters a number greater than the ring capacity the error
> > will log the max num_tre value.
> > Would you prefer having a new sysfs entry similar to 'max_tre_size'?
> > something like 'max_num_tre'.
> 
> Yes, a new sysfs entry sounds like a reasonable idea.  Having the user
> guess, and then try to read an error log which they may or may not have
> sounds like a way to cause frustration in users, particularly for any kind
> of scripted use.

Yes!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
