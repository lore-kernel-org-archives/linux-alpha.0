Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C82E19047F
	for <linux-alpha@vger.kernel.org>; Wed, 24 Sep 2025 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674103; cv=pass; b=j1FTk4s7o4jEhLkKIpFCvAeJZCekX/6W5v/1rZwc3AlPBNUk6jzPtOXioS4LWRJTpjMMP2ASRfryWNessg4ZufxCRwY1d0JZohp9vCDSaXSOpqmznmQkR+62Dla5NZeIXmGHd/X9wSKqCPWVR6eGAfAhShYzjFUKXIYXC8fw2zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674103; c=relaxed/simple;
	bh=T5QU3kyqQ4HZd835j8icfmeTIQ4EtkoLaxpYQxwyAvQ=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=FWyz/mCmRSmkIkMZO0MFvkxlHzU9rLftDtp7rWBmva4QKaqivdK/dv3Y9txFKkOMTjpJ3+JyuVR2t7gQ5d2dB9wQghNGUqoFQwqK/03LUiWqmjPqGfUv8yP7/qwZYkT5hJjnevwntr5+zYWk6ZyBIValM1t7HMFFZ4ArBHzZ4tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=GkCzUZWZ; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="GkCzUZWZ"
ARC-Seal: i=1; a=rsa-sha256; t=1758674101; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=GNuHAOttmi1xja3U4cqDM871dppQjP0TW9xSJpOQeThrOAD5+PTWRF6QA7gqYrYVcc+aML0pTBFKBrxJ3fDGfsjTVcTJ+HirJQWDqnCVTBAos3V8f5ZiqlBBtMBkNkWTA1x89ks/cS1QTFIgTBrhxYuDuvYipvZQMqN5hWENEwU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674101; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=T5QU3kyqQ4HZd835j8icfmeTIQ4EtkoLaxpYQxwyAvQ=; 
	b=KBAYtS5jZbAmdVCwvf0S72oWkUARWObYripxIliXJIV8Lc4hQc4xjj2OvRijz21H7pjxRIUL/whc7B2TUrRZoD7CUCaXLNRouceO3yvWD4HGnNDwCzdC3UdHz92Uy1UkiTim4DQaHsGz/K/GaGn9ljOheBOojEfCuyI3svgf9iY=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a5b06a0-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653600615.3751156646057;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=GkCzUZWZgrvvrijm+t/AKgss/PJ9GQ8v/cxeCQFV4dug+9ZCW3O9aIqRQBPZQO+Es9AoIaKoH4ube67g5VmJrUEkqumlt2dBma/Lv4NxukPOMjOwfTTJ5b9pBV3bdG1+vNxcGYpQGJnTUn2jiqjyXbBhuQOrIpvrfOEH7DtY0ic=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=T5QU3kyqQ4HZd835j8icfmeTIQ4EtkoLaxpYQxwyAvQ=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-alpha@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-8217-5254007ea3ec.19978ffc40a@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-8217-5254007ea3ec.19978ffc40a
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a5b06a0-98d8-11f0-8217-5254007ea3ec.19978ffc40a
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-8217-5254007ea3ec.19978ffc40a
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-8217-5254007ea3ec.19978ffc40a
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a5b06a0-98d8-11f0-8217-5254007ea3ec.19978ffc40a@zeptomail.com>
X-ZohoMailClient: External

To: linux-alpha@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director
