Received: from mail.commetrax.com (mail.commetrax.com [141.95.18.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9B2EACE9
	for <linux-alpha@vger.kernel.org>; Mon, 13 Oct 2025 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.18.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342207; cv=none; b=Q0hKD5PzYDHKWXjBZC43X+/gXnO90f9zwWqiBb30O5OKmvmr3giW2PP7utKbUsABkVm2ZDlpCeWkxibaHVZSA3CFlLFRpfklxYJ+R8RwSGjjnyfJ9gG2uf1Zoc6iZ0SfxtimPRV6+0Nph0uPFWVidSvoc9qFY3Wk9kdkOQL+2/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342207; c=relaxed/simple;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=eyq+ci6VgvnEqouD+Af1AYzC4XgwHylXaaKN424rkSN9KVieWgQGQc8c32Q817tsQENZkB6HHbswpK1iImnqjlwbmr9c4yDmu2mIswBJVIXVaJT4MYHpDwXSfi+IzZI2ve80gXLxm9R3XR9gkEDMDArXKY3DB8+rkB+viGzZPok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com; spf=pass smtp.mailfrom=commetrax.com; dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b=GX6YyIFo; arc=none smtp.client-ip=141.95.18.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=commetrax.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b="GX6YyIFo"
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id B7DA923886; Mon, 13 Oct 2025 09:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1760342203;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Date:From:To:Subject:From;
	b=GX6YyIFoZZemq6D8gu9D+dBYe/qRUOSxQNtI91vBePTuPz1flR+0WduzLn2wtQc6D
	 foM6PAbbrYTc6OxrH+TaOqK8HAKvckqko0Lt9Sy8yWeIbMx6V/NchlVAm9LyIQ3mSI
	 5oopBXjcQ5patN21zaXguEJAsC0BlRo1LesNDNkEyzqUhTQSMAZTvtI6mlyqg7OQRa
	 nce1mWCZ8r6b34BzfjBu/vaQLDJHSBb27cgjhl6Zq4ugRNKtSsg13+TBGMuj0YLLgp
	 CE7ZlHMvoE9bKXDNKDrlP0UbUA3LkTExPw6CcrdhJgN2k8viSGCSz+IF8uEQKp4X9H
	 eC9B+spuy85wg==
Received: by mail.commetrax.com for <linux-alpha@vger.kernel.org>; Mon, 13 Oct 2025 07:55:41 GMT
Message-ID: <20251013084500-0.1.c8.16e5r.0.1rfipg33qq@commetrax.com>
Date: Mon, 13 Oct 2025 07:55:41 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <linux-alpha@vger.kernel.org>
Subject: Welders ready to work
X-Mailer: mail.commetrax.com
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we support companies in carrying out industrial projects by providing wel=
ding and assembly of steel structures =E2=80=93 both on-site and in-house=
=2E

In practice, this means we enter with a ready team of welders and fitters=
, take responsibility for preparing the components, their installation an=
d quality control.=20

The client receives a complete, safe and timely delivered structure.

If you have projects that require steel solutions, we would be happy to t=
alk about how we can take over this part of the work and relieve your tea=
m.

Would you be open to a short conversation?


Best regards
Luke Walsh
