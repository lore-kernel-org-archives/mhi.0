Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07921D58B
	for <mhi@lists.linux.dev>; Mon, 10 Nov 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767810; cv=none; b=iWDWhhmbBOCMjmuSAYQINuMhm7PDY6Y7biQd+PyN608GGpTPToyr9qO+J3oNqRepRh3g+lF2q3btwvR5QsD8ItBR5v+mDygFP/Pi1esyQVQKa6GdN6fhktyhZr1IBDXfFG7Y77Uceo1QVHyTLKyTqupTLbKhb3dGpBhxxiyK5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767810; c=relaxed/simple;
	bh=VQ6/fZmPrvB7qA6vpno+guzDiFQYAH2t03L/Ew0dBIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BoM6q7d1OLjynVwoZHNyQnfdkYe8FPO+3F/55DBe9EXHbFccM1IIJAzN8BX0/csSAa7VXN1vmWQ9ooRpLzQA5NLEHqvzUk8ZM5cVZvuAwZ/enpWFkT030FawWX0ZRZKPlFExB232FnHWc8+Eniz9CAsBpwtjDj8cbJNOqIIhLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JnUu8CYO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JnUu8CYO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59447ca49afso3218492e87.1
        for <mhi@lists.linux.dev>; Mon, 10 Nov 2025 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762767807; x=1763372607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpfkUQML/MBOUs+dxtMBj7gJeTOySOYgrh9cTXWXGS8=;
        b=JnUu8CYOhCTYJkbJjVvChNeOW++P4fjunTYNzqF/bRJivWlHfGEwbHeC5l/wBxNaBB
         xeIf2IoRG+hMLqMGWUhthsVtHP4Kii/ZJQJLdCESb5cTrBLNXiJmzFtNUzX9l7nMCpd+
         QC76PaZ9cAq3Ihh1l91ewr5BuDoWjxrRIuE7G++Xq94hz1vlIDciER4cBgWK7O+PF4XJ
         lTIZ7LwSLue4U1xHDTNe/HntS411NSyt/5x+DT1tMFajhd8avmDQGWUSzpsZwCJ97EBj
         NGRcBDX3cXt4yfsLwdDjmq9c7TayE92bCgNcztk1Zij6/wnRmz/+HdUCwtUGs/B3YwKz
         CrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767807; x=1763372607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NpfkUQML/MBOUs+dxtMBj7gJeTOySOYgrh9cTXWXGS8=;
        b=B/0PiUAgZwUXxGOfDqbVtbOzm45FXLQiRUNfmdqOn9neELVjXXVSH3Z0d0ThcuGuhb
         Dr49BXp3v8C4awVU+t1qCeKQcar//KZKsoMtAJygKvIRlxb54pM6l4CzB1ytvUSoF75q
         jWbN30IG3m/I5Sr5WqYD56ZyYi8F0ONcdVCnCrAHXc+chxUwHKsQZMoRU1OonXwvpL1E
         olb6UCGsqfPlbZ1DY2J2PiM5Sh/+NOuS9MdcYb2jXKQ+tr6aZycNoKv7K73eAW8OQo10
         Nbu5c3dj+CZj89DhpizaaaHc/aO9yab3vgQfSFufLk2ngKMfEu77GyJtpvJ+pBKtc0v5
         Obig==
X-Forwarded-Encrypted: i=1; AJvYcCWQYtrxCuD/wkGW4FPVd7YhKkrUl2zsuXp/SUIUWOIk9f4oRmgIYwtI0ZVAbmly7kf7M6U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ro1ozE3DCivIzbHSCuV5eMaCZGw6OQFFoZ2E2I44W9uHnYNI
	lOpHRtVU85vNVCD57q7exZOmbovf9SMYIJdemu45xYXjP848EnR1bMTkjG/Xl7WpL4foVOK1T/r
	h08cfm7j7UuMj55j/lngWOGjpyNwW/0fF43zKUea51w==
X-Gm-Gg: ASbGncufagUCOLSaZTPVhcrdMqG6aTNh5B6pZzACfLqyiVtNutcLWRJRlQ8ekeFBxmk
	rKZV2VtsgSSvNflec+WbtjxJoM5j7yybZDQhK8NIokSE3jgQoWpl2CU9VpNWEc6Bh5dXRxtn6kG
	1fq9kqw3uvMTwoUxyazLoVyHcjVuFbEgyOL+NEiMCtBE0ISS3IMk8OE/AqATHPoCAI11vgDAQHf
	5mbjmOkxQZj/2r2fnrKvoeVodW1TfyxMa/Jo+O/WZZf2+Zz18nWjecqYznw6SPbu0jFaHd9naA5
	xEtsZuEU3eD1y4/4FJ6Fc8F4Udx+
X-Google-Smtp-Source: AGHT+IHgQciVPQpfcLaTr7J1ezPo0RXgw/svQahgRjh6TaxhfoSliPU4qSC9XOOY2ROeQugwrfeNkmq+pV7jc15hMK8=
X-Received: by 2002:a05:6512:23a6:b0:594:5206:c1e2 with SMTP id
 2adb3069b0e04-5945f1fcbedmr2111007e87.57.1762767806714; Mon, 10 Nov 2025
 01:43:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251106162430.328701-1-marco.crivellari@suse.com> <176275881845.11063.4284661115624687.b4-ty@oss.qualcomm.com>
In-Reply-To: <176275881845.11063.4284661115624687.b4-ty@oss.qualcomm.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 10 Nov 2025 10:43:15 +0100
X-Gm-Features: AWmQ_bm3FNiy763e6HxI-D87P1o2nsjy8IiM1WAZisUGNsfLYyFUSc-C91tcc10
Message-ID: <CAAofZF4kvMqf-DfahwY3sSKZn-rHcB_Gf7mVqDB0fBptgOA=fw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:13=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> [...]
>
> Applied, thanks!
>
> [1/1] bus: mhi: ep: add WQ_PERCPU to alloc_workqueue users
>       commit: 9e24bdfecdb071a3a42fb74be1ab503c958e2740
>

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
