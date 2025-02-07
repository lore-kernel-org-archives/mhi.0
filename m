Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42196195985
	for <mhi@lists.linux.dev>; Fri,  7 Feb 2025 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950238; cv=none; b=ZBaRBTPlZwbrZ/8wM3bKRpYiVi2mE7cDhLejg9OlLZRHiZAsBOdciAGRioOvsRI3xhwpW4/uzfzAmQf49i7pAxSakG0DsG+anKZEhFw8J7zZLBEHF9KKvC/52ZfvB0rsWv/SiFPwM5JY8W8TsiQK/USyeiEXmRWPWmAaET7ZDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950238; c=relaxed/simple;
	bh=c9BG+dddiuTYPj3MATPxipFhaT5LiNMb0S58a/cOgpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbb2zxq8MWtyLv+JUNg/Wvzejpc9CB+ccTuspZ3ejlEq7R9jxEq0OlD1o+0NVnP1aozrsXppmUCTB/qD8xVhWikfjzhjENUrLm4CMs5ToxNAa904uy4CP3Mx0XnHnYED64mHAdrYVh6cpPiadwVn5k3VJExSq7QWwxzPKFHZtzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hrc8UAiI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hrc8UAiI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f20666e72so50737885ad.1
        for <mhi@lists.linux.dev>; Fri, 07 Feb 2025 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950236; x=1739555036; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvlJDdsD4/VUKIsEz1kRWlYd5CsK3CkVo9g/8YQ1yzY=;
        b=hrc8UAiIr9aLLEoWE3hNmOTQ7clHbK6/te7Sh7CmdrWZeFJB+nGJ08+GvNGpLMuLIv
         0ZvMFnkq1sJvvaDikf36LM+3UgVaWawbAgPKS8l7iunvOJkN16f267H4TX/4gccEOX+q
         0fYGuptWyluInOVJjmjCNOxee/mCfbE2ZIEwPSRKRYledrJ5gQwlhmz5lY2Xibh2yjaB
         pKpBNuwlVJlpanXQTdoCRsD4q4UkWVKUzO9aJMzaOKKXmRpdY9M0zFTxeIfXFN64XWaB
         l7RKL53LKWfBd6pkRU3eiYqNk2/ghh82IUdFpNS7zQ47IbFoWHTfT9BjFm2FizTf2JIh
         /CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950236; x=1739555036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvlJDdsD4/VUKIsEz1kRWlYd5CsK3CkVo9g/8YQ1yzY=;
        b=GvzFPWd9VhZCPb7++nBz4oSShmpvlC+tMS5FaDWLARX9kLRCCcNpYtDUEyvUVpWvCn
         ji2sKz+tee/Su9cg6BLQTuMi0TUqLdHttHRQ7R5Kgu60Uf5S5Qv98dF8wzU1VK1P3H9c
         vfmayC6gsN240i58R0YCWuePzapBF9JgWIhKSBfEjpuHEMarBFr4XG2aMOeq4Pwpg7Mo
         vxrC2n4hMhkXc0et+AskKUmSZ1APJnrMLRhPZiK6YqY2x8b/3cJL+rcca5IswLrfVZWG
         2V4qpnoT0a7vmLhBnCqR7tpBfvUNijRcET3wq8sQ9waDoW8JaHh76LlA4dD0phsUUwpT
         1c+g==
X-Gm-Message-State: AOJu0YzoGyh9C/b0bv/o96Bf23yE7A5ZMVLm8IueHQHq571EmX6+UmOo
	7MYc+v2ws04SG5TJH24fK3vRDWV6Gz6vnuyLKsOooDYcHRFaAV8XA7GB/HO7XXQwBRjdbzw1trQ
	=
X-Gm-Gg: ASbGncsTilaPAYzCOC1nP5ibauVGQ9eDEQW3UhLSgopQ42sm3z50n2uUi+4H0IxkktO
	5w1aFwncawcXraYaSuZdnFaS001TPtQbdsifl5S+6Btj/1q2ekbLl6tThd8HZubwzW4JO84yRb7
	96CBstn9FhIRU/ADm85LoGragumZo13tK9onXyMby/FUDCY+ogfPKRFEv0DXElygXG4ZEPuAg+8
	gwGA2zmqk08LSS1QYcL8NJ5Uu+1SZoy82/HE+n0abeGYfnz573kl0LjOl8n2akzAwS89k3pqQlL
	GuKZbyJH6QCt+M6NH8lWlDWG8Q==
X-Google-Smtp-Source: AGHT+IFYaPnu8nAAzI4VlaiplnIV/qm5sPf037YcNY/ispLSCgTlWlOwIEh32JjPqZCnATuTeyyZqg==
X-Received: by 2002:a17:903:1cd:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f4e6a5767mr52384765ad.8.1738950236602;
        Fri, 07 Feb 2025 09:43:56 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368a25casm33325135ad.218.2025.02.07.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:43:56 -0800 (PST)
Date: Fri, 7 Feb 2025 23:13:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250207174353.rxsxblcrnkieise3@thinkpad>
References: <20250127215859.261105-1-linux@treblig.org>
 <20250201160721.bgfyi3cwilvibl74@thinkpad>
 <Z55eWunU1NRkV2QP@gallifrey>
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z55eWunU1NRkV2QP@gallifrey>

On Sat, Feb 01, 2025 at 05:48:10PM +0000, Dr. David Alan Gilbert wrote:
> * Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org) wrote:
> > On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > 
> > Subject prefix should be:
> > 
> > 'bus: mhi: host:"
> 
> Ah, do you need me to post a v2 for that?

No need. I will ammend it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
