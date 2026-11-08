Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=K8NP5+T/1a9UP6PxSVAIIFIDKvY2mJ8FKOn31dHpeEJy1HiOQ4oNW8tSnDeI6LZiSSXx
	 Mddqe1bpAeSUdkPnOPs9npzejFgl8nt5JBSiMTvbR4ZsRDKZeBpBlmtqf/pwB2Ux6+d6P
	 r4iS8kgt9ai5wGOxZbbS6Dhsfix6fqWqOhIF7/kSI8PpQmIJPr5KKKdX7/HNC7nTdJw5x
	 E2hVyhGUxnZvw57cid2xflJdT/vGgP92t96EpcSc03GKREDsQvUzx76wqHS6/5cEiOw1R
	 rR1XyoVSuWMgTTgPY434YvNeSypEVT138XEsmnPu1F3Vh3p4etT+ToMgeouBa52udPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=eEf1wtbktfMoaNMfVJ8hgHW7EIoNLDLIXyMD0LRhGGTdqUCJmzeoH1+BL2GWnaKs2bdC
	 ujEnKiRRQBHAV420RzaYEoSIDROb2u2ZztkofckRG+Nkf5hLXFKivinaB2Jj7QEDsY+ly
	 JpZNjn56+QMedEs+nroJrWIiDvXYMugPOrALjRpypXSKeIVGDvmIwaiFsZGpS34C5mFUa
	 G68ze2xa9MMDUoN4ZAPHMGo+9dlk00iQBXjvF3Ms/nqdTUbqogAf7Stu9Rxgafpwnpoyu
	 BBk/Npb8xQQe0yFwLQz+PYmwvehvY1EwV8z7w/JRXIF6pWUmI1vZV7wAlkgHDkdiGqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39362606A338
	for <linux-alpha@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39362606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1791575e9.1
        for <linux-alpha@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=vg74nwneqZEIrwwABl+yRRh4X64Ge2o6tf9rstPhPk8zZMGvnBnIVJ2sSqLhzJITMN
         o3jK5ENQg9nfbSETd1Osdsy9yhSpyZeU2OkFuqeoo6V+VlFHjYBw1GvoKUnpQU2nnBR9
         FDdAh9LRAF4vYNaiCtZRyD9eZKQAVF3KpwWaJpZ4MQXxYgKwYFGmwUdj3+0aVsvchfZi
         p9p64z0DS0YFSSubHDXLUJG8cbL3jhBM7zeKJmbIpSE+Mo0PiVSKaMtABf+tHRlwmTof
         d0X4Zd+CeKNrG2gggmcTkn3rts4pw3SqQ4QSgKFqO6Y4zgyZn2adw4010/dDJ6KJjSQQ
         hKdA==
X-Forwarded-Encrypted: i=1; AL+hErGp1YtA+0+DOTSUeEwCDuiIMpDkl4K86o+x2werc8RemHnFe4cSiaMOPhTFTeJ1qrSktQ+DlyZNvbNjlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZgJatxb2zgMt9qAtBQFZtIBQ0rh/iZlz5l1bSGO+MkYTSSSZR
	Nrn4d9GI/ndiengBT4GxWVMPTkX8BVeWcOgEOjSAOLhgNCrc81UQ+IAC
X-Gm-Gg: AYBFou3Pa5uYWCWIqbotk7CNBXsLUpRbbItgqHtlf4q09Ys0XeANlPDmfC75Ryi8bu6
	RA4k5kKu/GOXRlRdugDndKU2n/8sRZkp27fh6jcUkx2XMOpj9UGQVIEHxM910sMBsRleB+M+VWX
	ioA2xFjJA61MZjSgVfqBniZFM8HGl2saXsBnNQVTdQSSFClcHiBSogJXMIPU7MRiQ7cJSvWHIDJ
	pLC090EwKXooBmHI25y/BSq9WYpmLN/mk0ZmuiAKjX8CNegPdGjSvKN/s6X9/lnlaQ45BA+4avd
	hy/0I0mIkmBwHOTW7kk43yZp4tx6dIf2SPZ+IPFMR6w9r9TO1MwjyrLjiWfOHSfewPD5HvHq8eL
	mu/2EH2M9myIqxDgTGZr6UVfKJ51xEx08mUPMZD3Ae9ocZRUuRqTfahiekrghTLkX8qJDM1Pp92
	Wcc4AnadRCNeCbP7u3LwMDXbrNgmlupJLGqtl1hZXaB0Hmsg2gkBU5yQg0meoIY/RpOYrVa23B8
	UruXFwTqxVL8NdBbTI2ngMJBbiXd4vq7E8h/DUzm0fLw16AhX45ebMAdLospEHcww4W5VU6Yo6Q
	CU9MmskL9r1zqE6KMU1KG/U2k98ItegIA1Cmuh8D8AuT6stWjf9dXFofkhdlVlNc
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
