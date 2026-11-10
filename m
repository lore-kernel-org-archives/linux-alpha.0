Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273592;
	b=iGi7RwS63UeA6H3Wg5ov0XtDC8k12UcqVbJWSMh7Q55+NOJsFIqibztjIvZbEyrdQDY8
	 Q1oC3+Wyvy1eJiCtNsSTmuf3DG5Ohw5O0HxcTLjEF0rCWQDS1N8bycmhOwjzAV5nRnGLh
	 8dPjKEQVM6NZ+awvy/fieCi2hchMNjtr0mnyHHPsz59mwVUyohpJnAX5DyQOI9IPa2vs3
	 +7KEPoFd87E+aLEzebfz2rXFt0hbvEKjwF8GYp5vu0BVCIuGI7eEN4zmG0SI0x/Hzem00
	 MTBeTHChgSNw6rJ9m7afJhafvswV9Z8Vf7BTkYxpbVZnj30bLNJf0erFBm2tvIAfKig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=N9otADl1HDuhnvxI0QblNSZiEv9q2jh9QKYHSMon68Iauizt21K36ptaBPBxiCXP5UCh
	 yJ/k1UtcT0Vpwx3TkX2xzCLXBOObBxt2sHw8d6b8mPhtf/9yfet3vUPlC8NchFpx7JXFk
	 IJlo6qQTQcbJ0l9ftyoVWlMZ0f+iFBrh0Bd0KTCX4AFvxYYrq6MMGHFCPFn8MskGPqcxY
	 mU9LKYRFY0DYs6C2xgL2weX2YRRw4QiQVrCuxzwJXcYZEmwfW5Mttk0GGCw5jBX/+n/dc
	 AbH+xwvcNx01sac7vaDl/hy1BENN76Vq1kzeUByPQFnJbq7peyTqTBbB3Hl7txbse2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PNmzH8uQ;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA9606A332
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 01:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CDA9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PNmzH8uQ
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4c9abc1824so221604666b.1
        for <linux-alpha@vger.kernel.org>; Mon, 09 Nov 2026 17:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273589; x=1794878389; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=PNmzH8uQO1Is7gnJl67D10aDQuPCEVbk9zVAIQAqJeSsN0IDU/HOD7U3wwos3yWYHB
         Gue6PvIykulGsnprTLloRvODShIVDoFoPa2dc6Ke+Bd5cyOIlR7QtK2acnFgGNin7QL0
         zbWlxgtPU6XUS+pNmfAnI1ts7t8QiM0dzzCxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273589; x=1794878389;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=Tu6yBWLWg7l2od/3lZCpnGZd2Le2sV7nKKl9McNhUpIQpr8kG6Au8oGhiaZZR6j3Xb
         sMvnwo56TvBWFoqL0KDzAFEZRx2drWNJOhJx1kRwzfoZOgjQ93dtVkQauXi/jPZBPUkA
         krlsAeIniAA20CqWfr2WkY6c5IBwvg0GF6ie3gYgUPdZbPb1K66ubL/zKW08uKsDoQuM
         cJX8IRhKWGlF2ejvJpXDqiXGxwnOoNxMhm7VDFCSdlnSh5C7Wyiao8NjwNbr5diqYJbJ
         6Tgk6Iwa8AuTl7Mwzfez2G7kXsSqzK6f2H8hJRKSp4LjwWTSTEHM/MD+KdJBnIs96Xlt
         2zNA==
X-Forwarded-Encrypted: i=1; AL+hErEziJWAwsRevRSm2FgBIk0DeySdmL1zRrzDBSy6fxh4bJxdYwFSg1kyE9N3LG658LJw9UWNeuncfOU5IA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PNW2m2lEdVaJIrQ2RvRyDJ4hvSx8wupvlAoFE1ltqeOhtUc0W
	wTBSlIEV6xFTsg0yP1eo7FH7aMPIRgjRo9cqq9P0kdfSHwiIv4P3Dv0EBFpNb4CLepqdyQ9UfJX
	NAvPV5bk5Ag==
X-Gm-Gg: AYBFou0AQ651nLj6KLGUasjT5o+vx831YiHJdpPRUeVKWhbNqtiC6PqmY2ZUJvLypwE
	CrPvKc5PEVS2NQWKTSXoZutURQ16mZQbi1NVNN2XK5I5T8k9l0FwFJ1VH76oM9iQw2QqFzurCB3
	xbbxF/8yDr/bR3IUklQhRPr1iwmxuMcrRtDg3ilyGSPM2z306TO12Ja6UjRFzY0F0k/t46ClWef
	9+6ghBF85zMDCJhI0xvBcQHaNlx8Rs6xSifYFlntVxk/HG+e7jA9UTrGHOQCG7oBGAkujmvAvqk
	eC2VcUOMk5cW5WYHVuA2kSeCk5+VtML+9qDafNu3cCrRxu4XJwbe61AVXpYyy8gDV43qkjP/RCn
	g/IMvySLVrBqyaSUsBNpLtwHco2714Gie3jGgyezHTDFW9bhLv9p0nbJ/SbprWHWhNZ9sbXUcTQ
	WotKGMJpNddKlUJnSlyFNFk6GeS5Fv3lV3kv9Yh02vItP4yxqQD2eeGTa/11gH14N4Pi0S340NY
	nBs/dcfrUydo/XKWnxVPK9uU9LitTSZEKPCXwuHHbyCb4w4X+aUK6eC3d6R0z6dMBWCSLRvk/Ee
	L46LJ+RVflxk6NJUpVpRPfq2UP2z2wTAzlQzbhl8SO4RFnHFJDC/hXg2rSFCHENtEkkOYx2W6Na
	2Y6QrSX4tOOEvFUmJQx9ZpTo=
X-Received: by 2002:a17:907:d06:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c5048c75187mr84999566b.0.1794273589473;
        Mon, 09 Nov 2026 17:19:49 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59437fsm40963266b.38.2026.11.09.17.19.49
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:19:49 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4c9abc1824so221604066b.1
        for <linux-alpha@vger.kernel.org>; Mon, 09 Nov 2026 17:19:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEJUaif46Od2OFcnWpT7MFurLxgGAeTsPa5JS4BCuMjzX5n3o7H7fYTL/oE/YnZbJFO0EZiyZh3lDQMTw==@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
