Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872383;
	b=VEnKyeo+BwlLQHW43D/v5jA6W0gYWE3HcRqUrb3o3V3LMgcGRXAmmavmDodKn9FrGroz
	 znn3JDo++SazmxP/yeYWICGnU8QpMhcsR/83f/S0jaryzhjmNsM0TpDlQy+hB/uqlNTmU
	 dZpLOT4h9qdADSGsqTWY+BFLdUof1ZDm3Sl+wg+Pe1hnQ/Po40TU06jzsRwD4wdrgSZo6
	 i/opKXpcDcKbxlzFBQjGWb8raRpZIuU6++0Zkhlqb6P6A7G2F1C1lJ/oaztD5APnGla/h
	 eDm6oI/L7gYoYeqogGdWo3pJ5NGmr2bvj/5qFAYtJKELS3DrlA5be9Bg+M8zdLVNzKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872383;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=ZPhdYX6qExCSaRjpA3k/CsiFXgEvk5q5arZlKWRGa6PizwICC3kCAmux7Taq3zxEX1FM
	 t8JuXKrIB0YRsooSuX1xxYt3yz8VkCgcU7zCw0yom/adtOWwZ0AmgnHcoyPy2r5RHjWd5
	 uHR1c/WlwN6N5dyde6AaeSrnXRVkImC8mr9+GMi1ps5bfkHQjCwpEDTTadgJnLao19Np6
	 B/xMBYIqlpXv0NMCb56QBXGMVmfkLN1b82lhHPTI+CL//yCm3qojggJ6hQnUrbNfY/wec
	 fWBLwKz63UjHnwoPAlsn7fGJbsLCQ3lqvdEDU7zD930Wrcxv71toCDpNXZevmi/NPLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AF606A326
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 09:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D0AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53653e30353so21945421cf.2
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 01:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872382; x=1794477182;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=FwFTT2m9A4gekSnbm3PQdZSHEtdRBqRqLWzAOEgFtwr0cYFmUKe+seAMl+c+xcpzpc
         VcRNheWMGX74NPpnSJjnAQIHXPzVcI5ESn8GHAgVDu9kaHguiyDkX0L3WEvrMqcgO18l
         +dsZh6rb4/06Ov4uMnDOvdtzbczMIWwazTjcpDD6fQJ1v6rCUIcIxTqg2ir3O3h+dzix
         BHuFBWV1Bo2s2FhIp5ygDKsCIkEURXvt5y5SaX10KAEKu9sTYKjUQjItCFFiEFDwl9rI
         rRQM91LOCEdp47TsN4EAloaFyRKZ90U0XdMOQ5WhGLOd9D5OpQhtFQJp/P7u39lpypLF
         v/3A==
X-Forwarded-Encrypted: i=1; AKwUvByJNP8wEKbhNGFbAlpgXzzdEWWobt1YBnFiR+CO+tdUx74OysShViXDr5Q+kBT5nvpnjGclt8yBQ6UJCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+T/N2W6G9UEKK8ypqjtFocYtQl0YL/Roaj+uA/aWhy7Bih3W3/
	513agaH8FHOcVrKcX2nhhukA2zYRWoYb4uUEeQtzOYv28zQExpp4LsJPXquD9SUfrMY=
X-Gm-Gg: AYBFou20a1L+fsx4B7EIkifo6xc8AaNqYZ3i7J/5/4HeUE/wFiXgFPwoB5HBe7EvsqB
	6BH/zI1VEpKunpP5bP6FNnzuE6NIzFLmgmVbex0YSqzi/iSzxad8yqWqfhvJm7TzKyyvHfe6B/J
	/1d85lJRyNC3vfMLp0ZXgWu7jq1pOBQPVK0BrouJ9lbwVUzBLlPuNORd6yaDeKtecrQ7TOh1ho3
	Nvv9jN924aOFNOUhze6HQdxngwlJA1ZUwZat6ZD8w+70EcLaJ/BKP1/wJmSt4A31Tdy5Xee7N+a
	hg/2lierTnac+/ptxfmTuAWo5Xj/JZ2XmNURmp21dq5cm9x9prO0J5xkI2pxwr0UW9qeg9hRyO8
	X+d5TNgI2fCarrGNO++5d5i7+yTASR2lzqt6y8rdnL4Q7ND0a4V/A3nSV2M4J5nRtO++e/3Xw/c
	jLPeIFUKlG3LaKTBmlDO4NT3XE2+w6FRIWnCpaGkbDMjdRptappFC/J09lTaqMlP1gWE3lcJ+Yw
	8cycHuHaja7oPDydzf1ju47L9I4z6ifDsvaNYVnA/lXD3PdXlbJiO7sNTmS6k8SZz4tHc0zEFxZ
	GHY9uBPfl26qsY+TTahH5oitpJCval38CwRxQjAFW3/JYF0SeYoBY5hC8e2HL1qGtly06Q==
X-Received: by 2002:a05:622a:1aaa:b0:535:8519:6ebb with SMTP id d75a77b69052e-542b3a78c43mr300128371cf.4.1793872382368;
        Thu, 05 Nov 2026 01:53:02 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm47649331cf.11.2026.11.05.01.53.01
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:53:01 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f269e335eso195896385a.3
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 01:53:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxVfqneiYw/AhUEvh5SIHZtl9SBp1b67K8JjN0NHUjs4M4uAirV2audwbMuSE4l0yBlYPGtMsnSeDjRug==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
