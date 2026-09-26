Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422FC3AAF5E;
	Sat, 26 Sep 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418532; cv=none; b=ZXn/N4z2ZYR3qEaFeJjXrTS9SqyLNzIv0QMO9414PbSZEK6INbMAZ4Z/aaaLfLK6BH8DiW3fMih6jmfD6TozRYgw5Q98OxZ9y3n4oU+PFCDJIuTrzbx1Re7qOvJ+zCZxjPDuQMmEnq4Z4Hnl0qSJX4U5K7ZtRt5IMgnwssrdKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418532; c=relaxed/simple;
	bh=gnO98IlujCNtMxRlBjO6rmRLbt0edqfUP5GEQsjRiW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u//FoEAadZa4xySgrDz79HnDlvPj23tAjvEcsGVGL7qOU6CxFM4Tl89tlRGZ+tvK6AdCKMXLHxgDsZ9QO58XOr1sDN2be9y+GEfPskhFF6cvj4vC01qSx8ejsSCcxnqLTF0QWjkGSWDoEVWNqzS6fK/Jt3LzxE04NpVjLh0iAEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDrcwj5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDrcwj5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB8F1F000FF;
	Sat, 26 Sep 2026 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418523;
	bh=67HNK0CKGsahnJUPcrc2/mkfUFjOAaSPgaUK9YOt5dw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HDrcwj5oPRG3R6iXIcSdPPT/NMyw3sr4SbkYoQYZT4ph6bDGt5s+33ubzK+q6qA0g
	 BhbocZOZcvwQ8XLYN4+Doml8zGeC+wCPYmCEgS7hLdqYTSlnB3kekqSvze6rdNcwaw
	 ZiIMLzd/noPd1FB6IKgxLAoP5cRu+M5rm7mFLzaz/axjNahlwFG93y8eK0pMMgkjQU
	 WNSasCnS2MSJNUgIXeOtm0wGInnBU6Yn0PAE4L1ammOTpuqxGBCUH8zz4L44qIwIIs
	 B6/1SEjFedlb1dnrBAR7W2hwTiF/2HNkgyTzPh35wAmRqvk0bmvuIqvV+ZXU37p/Vo
	 6t4o6JbC9UqhA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20260904124731.9011-1-hemanth.selam@gmail.com>
References: <20260904124731.9011-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] mhi: fix typo "intented" in comment
Message-Id: <179041852144.233471.17271071144360894830.b4-ty@b4>
Date: Sat, 26 Sep 2026 12:28:41 +0200
Precedence: bulk
X-Mailing-List: mhi@lists.linux.dev
List-Id: <mhi.lists.linux.dev>
List-Subscribe: <mailto:mhi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mhi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2


On Fri, 04 Sep 2026 18:17:30 +0530, Hemanth Selam wrote:
> Correct "intented" to "intended", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.

Applied, thanks!

[1/1] mhi: fix typo "intented" in comment
      commit: b1b35aa26037c2b93ff30087636aee7c87983878

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


