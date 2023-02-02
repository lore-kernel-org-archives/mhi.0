Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DABF882A
	for <mhi@lists.linux.dev>; Thu,  2 Feb 2023 16:17:20 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m7so2179740wru.8
        for <mhi@lists.linux.dev>; Thu, 02 Feb 2023 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZlhJXFZeHOJpXsluB4gKEBcHyTQIjzjERsQJS6txws=;
        b=HwPzToiwTRUc9EL9+ss2T8Q2OF2I+TiNMRAOrP55toE5Zh8DWEcO1anQyLLZsDMllp
         7HYZ8AohYQTGyLPAWuZlcyMFEynSgBEW+Mc2UiWR4L3ToV6JtrGThDRkLrX0IK5O8zpX
         FU/Ixt7Vrz686n0YCcIaDR+o0DyAq3mxgf0LuxAGTBbsgGs9B0HXqGrwZ2xvQRK2Xa+3
         fNIdsWq2Wdu6MLD3BKV8RkW4JKgZNeKX22j/khQ6Wy+1OwNV/07/DJdWsTflafRsW0TD
         SqiJTPwfJTPzMXR9U2BenOXOUuq99MeGvO3rE6VyzfSlHF0oSr/nNgdQhmFN29hPpLCR
         Fp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZlhJXFZeHOJpXsluB4gKEBcHyTQIjzjERsQJS6txws=;
        b=nvfqzcxF5HevP3MHNuDA9pTsxKbyvA7Ita++yS+IMb0h88hifXBjvTAwGu7wGnrVeQ
         zodx76VelGKY4dAf03sFknKSbTOaBkDe0wPTOgdXMlaIjplKPxTm0K1C6hiz/oGfnN0Y
         cmm0nPxseRmuoiyACJM56Ms77jUDcEIua5QHT7plSO56qul70r4xKsi5n0sZjjORvUDQ
         YjG0oz8qtWlC1Jy2bTf+A6V9P/fVP++KKhMTDH4oO+MVX6kcbP3aFVewGj6YPjY+JtFW
         GMZvIAgP/THOCSU12fe/ib/9glWIeieW3JRkDdWBZPVtpJpy2nw9/HlqFpBGUjNp+0nO
         2nXQ==
X-Gm-Message-State: AO0yUKU+nDcKVi5cVj5L4otY+JisZMsMIBfQgfu+aDorIdnfeF+SYx3w
	xwCVX3dmsyQ+/rcF+rK1vXg=
X-Google-Smtp-Source: AK7set/GB9OVhlqYH2KCrywVqk9YlxbBboi5s9h1YETYuDxV0ZmPf4tyXHJ7dALSOKSua5jY3DuV8g==
X-Received: by 2002:a05:6000:1f14:b0:2c1:28dc:1551 with SMTP id bv20-20020a0560001f1400b002c128dc1551mr5678161wrb.1.1675354638499;
        Thu, 02 Feb 2023 08:17:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d62cf000000b002c3c725bdb5sm1596512wrv.117.2023.02.02.08.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 08:17:18 -0800 (PST)
Date: Thu, 2 Feb 2023 19:17:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, mhi@lists.linux.dev,
	quic_carlv@quicinc.com, slark_xiao@163.com
Subject: Re: [GIT PULL] MHI changes for v6.3
Message-ID: <Y9viCijUV3LvQZ8C@kadam>
References: <20230130082131.GB12687@thinkpad>
 <Y9vczrEM8Rcb48wC@kroah.com>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9vczrEM8Rcb48wC@kroah.com>

On Thu, Feb 02, 2023 at 04:54:54PM +0100, Greg KH wrote:
> On Mon, Jan 30, 2023 at 01:51:31PM +0530, Manivannan Sadhasivam wrote:
> > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> > 
> >   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v6.3
> 
> I get the following error when pulling this in and trying to push it
> out:
> 
> Commit: 62c0f48fa940 ("bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()")
> 	Fixes tag: Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> 	Has these problem(s):
> 		- Target SHA1 does not exist
> 
> 
> Didn't you get this error also from linux-next?  I use the same scripts as they
> have.
> 
> Please fix up and resend.

Somebody must have done a rebase.  It's now:

Fixes: 6de4941c0215 ("bus: mhi: ep: Check if the channel is supported by the controller")

Manivannan, can you take care of that?

regards,
dan carpenter

