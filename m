Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642354;
	b=AofL0ALBFAMZ7F7O/hPs7eCqrlQeqtggcfIklaLXW5XZL4Xlw8polWjFZpN+DsZVC63f
	 r6zvmyICQMK3/7Zq7EXQaDEsDW7619eZiPfAawIovtbOTwbcPw/ZNO5EXdXOaOfk9bFZG
	 DVI/qrcw/I2EcsigJ+wZx9xdEYR2FWaIde9NxCZFrnEIDPOL8Q8mJIHkEUrAEU27abUxG
	 m7lJwJEoUELBWc6FRpWZurOB54CmtVga4OgPu+7mtk7t1iNRA2QM2j69Vv2JW+P43qYjC
	 VMxwQDGPEEGLVCfD5Zb5xBnIPPRm2iJu7WMfKqNq7ysFyMs6W8DF5/wjoqskraNSI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=SmpC9m3GRiu/JJyfHqdiB6LOCB0X1keTas7ofbQXOCr2JxivpNRTFigUtbxBe/rc8/2P
	 BgqtHJ6fdrcaC2S7wtsMux/mQ8Q4rrlLQYzIZfWtoJZCDpwuduPymJx557E2xqJEeROQt
	 srvTKiUqmbm1c+Rx8j/ri6bDRDj+42z6BBg+7IME8zOPKe7WV4HY/NTBiMR8BuBWfckm2
	 cTI70W3SLA8IEzflbXqxzMGr8CM7ECi35PydSWjnep0l+1h60sKpbJNLBZjy+cBaUV67h
	 BjSl4Tp4LRTbHpxT0INMFCQndgm56d1w5OoRZsq9RUxPcu977sWOyDgrDh3FkM0silQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IKGXYRIR;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983D96072C48
	for <linux-alpha@vger.kernel.org>; Mon,  2 Nov 2026 17:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983D96072C48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IKGXYRIR
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c169ae1cb26so692094266b.1
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 09:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642352; x=1794247152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=IKGXYRIR11LfaJEEDatmG7xY0AFGYIHx7livxaKR5SIoINaZawhLa2GVcF0UFLtpJT
         b8PDqIOzeR4//kzLDtnUtVYXyOzJEhyY9wFRiLuEeY+KGpmZYEiC80QTG300A1Ue9yoF
         l+51cuKgFgM1JkqZzSb/qh8d0A1WYtX5NVxdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642352; x=1794247152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=MKm338GTpdQXMyWUBpqYPD7mn0p6YK8QYrlsGA82UQwNiOwGM2nKgEkhO6Dhxf8rk2
         PtbMhyVRON9kvHwBl+CPleK/qPHg9VZjQCFtvW2Smpoke95ILRpvGaM9YY0tcxXrTwcz
         FwC64OSlt7Pr/4gdaOF0zWU0FCF2yeH5+qEcDhK/D3KCaM2uy+7av4xLkcGYrfw5oC/C
         jdLEHb47Wf8lKEmNbq+PGirl1zS555YvYDS29mmsTmCApP9kR6C+AB48xsQ9WQETGj6w
         sAO1szd9bu79HI+1BeaBLvwKDKiKDdHsxcKYlB6J7y0dz8ewtLHckT0YGJwFYzOxQmJw
         xwEA==
X-Forwarded-Encrypted: i=1; AKwUvBx8NXfUKQXQ/vQ232rQvXnP9CzMywKmkPK1TcljCXC5Gcca8E9snYTFj5oXoPXeIftYEwKFjWPwAtWzfw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1iAHcgW+uzTAN3DmeGjbNbeH6RdJMw+d//UtMRfaIruwtzFky
	WwbsZlHQ1UnfKQtQeh+5CJYy4l5K8CbAt2yNmVPH+ChIPk3n9LMWkibRDxR6K+b4Qk/TK25ta1E
	FKckMx8w=
X-Gm-Gg: AYBFou0BG9lyLkBQB4XnANr2wIcUx3Rx73e7ICgyc81QJQdzlzLmMmKZw+vWODjfMbW
	hpyjwV91IBom4NjclmqFlWV45ymrNq+ApIxJL/2GVw5wTVhA2bSVsLX8jQzuytFS2gzkiIC94/2
	wg1ZAMUNMd/JkX8MxDTGsLleFDsXVAsfuh+w22nKggypmKToITgyHr28ATfslFwmqyd0TtrdwIL
	u48Eo3ghgvgx4MAcmMxKsT6wqAF53gBKzfDNEC8soU6AEIBrWgligozV6Lq3jT3gEMDJN2NVDev
	7gTfa062DlDRONBVZPWT4COU/WyYk2K1piWVeegZ10jvwun5WMxosdcMHa8mWpEeccKWLe5AsqC
	HLn/gMnlEX9QT0+o0z23IpvQQXoeHdvN+HugHcToDQ1hI9qTDYHr/giVqpANpBY7KxvwbqSEq4d
	X8voG+VWfGylWAcJKxAG1hBmD4c7Gl7JjPdgT1hmOZUchcu4eeAHCxOKmuYOKU8F8je/8vvOsqJ
	5psgAFVZASaHz4SkHIh1M3CPsrryuJuULKq8VrURk2i7hTrr+f/jACbFu8VvaNXtk3RWkquKFpA
	NdCu8k/t9O1EB3y3X9I7ALsDUQXVpobqQBXU6XOEE9dnUvU10AmFb1+AQ3gb+xf8qWMw5FBo4Zx
	dmQ==
X-Received: by 2002:a17:907:3e06:b0:c2e:7fe7:2898 with SMTP id a640c23a62f3a-c4ca7a6aa23mr963633566b.12.1793642352077;
        Mon, 02 Nov 2026 09:59:12 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec1586a5sm12161866b.69.2026.11.02.09.59.08
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:59:11 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40e30c26a4so833826066b.0
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 09:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByD5SQcFcSLDdicngFsTtFjd39VwAh7f5JhmW8QStfzIJB8noZivDl0N1ZcgqEXGvNeKZNrA4X5zJvsDQ==@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
