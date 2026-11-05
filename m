Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873321;
	b=MuP3yZ0BBeL49jZ5BPw4SIkLuGIkNUlqU78Yt/TssqXroTKLfCznQmbFAvHq5EvL8qgB
	 73B6JxvXeAh94Bvt/BEftG4zzbfkQZD6y0VUtDEN1O6ZCVJEz5iI91OXjPbwzHsTdjnPk
	 rbUzuSG16dZWesHFSDtySA1wC9lEOWLLEe8AVAD0gf527Z7gxxRFHIsYQvHFF0V37QsxC
	 /2wsuQXaJkHDsSoWp4k7OEm5kQ+Dk0J7GLoiKWRzhkDVaJPiwiy1RlvnuWOGzPCg2VzZ1
	 EZW2oqCotql5KRs5hm1OIct1O9Wc2qXjWvm2ZXJL3eZZBcJiNO/hGJ3UstkyH4EF9ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873321;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Z2qCIfu1coqF5CKQo/xHkFXbKW7Y+rLlNCa31RZmxiE=;
	b=0Ykw0gkFQt2ZTPG7fSBEnNzFVqu2sC7IzIj8YpAZUDES208HYm4+P7/mltHgmqLbIOHy
	 BVCq8tF2pKv9CW5nY9VPZfZ2zMn34c2mxoxD09UUkQHPJ7Zzrx5hOihhWYRI2qQJMGWud
	 NT4F5X0ikxTjO/jlgI32gEKiqXNQn6booTUTruzECUQ/v4y6vDYvdLwaSdsMwOe0wkR06
	 XlxYge25iLdik9ShMycXr2j//p2zAnuSQwGltF44wXzE8nPV/9yKWcghegiF4r0kIrQcr
	 itX5i/SBi5TY9+njUR/JF00ixGwvUZoFyr86a2Gxp/KtKGKYhLqNDkSZ2FudS/w+z1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8B60A261B
	for <linux-alpha@vger.kernel.org>; Thu,  5 Nov 2026 10:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA8B60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c03a445cb8so1046525137.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 02:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873319; x=1794478119;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2qCIfu1coqF5CKQo/xHkFXbKW7Y+rLlNCa31RZmxiE=;
        b=CbVgV0A04TfD9KFVRRyh0YusdSq2AxA6ciluWhzyQQvQr/x+Ry9pPEo7eF9m3Aa9tN
         fQyJLxXkcqqRf31R8R9M4mvRVTL1S+3XghtRzVyzqfWSNzYXEjuxFdtU73J7xGkXOadq
         gua8s89lxm5osCqdwh4xbCRn/XVUxQMRcvJuwZTEZbK4kSrismRsiUdNYu11HkRSuMAb
         U6kGS4jWWmaB/TcBj5bU2F5GlJLt5YmXWGqEw32XzBwtWZTGJSlYQhJw/uvzFlZ+Jtg/
         7YQ0/KEiB+TwagTm8sUm75qqaWzxUjmVzdcF7xT/4sQ7R8AJ8iKP1c0CTEcdPk/qiKT8
         zaXg==
X-Forwarded-Encrypted: i=1; AKwUvBzQkDDayZpmly/tFRFYtNSuNVqDrE4kT/2nZ0Np9WcLY+G2nVbYMlB53mOmvN+RLcCxNgfcr2ylQzHL0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/PgvhQRvN0gH6OT0VJ9pAlhhLUrfGaJAlWrEXoOcJythsXfYDS
	XiUoW7DFgtoXwep1Fj5Qkg4OsAQyfVdoffwtZTnK7FFI6maWjyDmzKlYxu4lBHRauhA=
X-Gm-Gg: AYBFou1b0BvCdpC29mWqbNu11ZFEtUamJ8izj8/aTz0fOlTXsSU74fbf0rZLZWHSbOS
	Fvm+NFS79Zk17eiUcqkVaxS754kprp9O4YkVa09+EGhSOm9oomOE+zrZaInECUhA8LWfIKZEjWF
	SLwe2nEdRFOxqzHYBhh0MomrpVmKPh3kji0Odg5Hl7jjZZTF4BAGC7StLcuyF3w365bKmvqVBrE
	/uCVmfGbH39Y6jGM6pT6slANYezZepp/boe46PdZ/EacH8S+hJ4lICVmn/iuPeD29iuCV9vgXYD
	mfRQhFAK1DoB54ZEyIPaaiQDLUDIULGjfY8K5N2gnPxK7A1XyCKqJz87ePhnxRoOKbx44O3ghaQ
	TIohMAEN6eFUPfXCT7gsFoi6mJ0RQWeVrwLWlcGiupgBU1ZAkidHCZ8Mj2SzJs1Xszrb4hmLRBw
	p82nxVDsD9DkeISA9yKYGf7yizB2Fvp5dYyk3Gp7ziH9TdcBIR9e9u8hyGHDRie1ApGCyfC79ry
	PAOIrcgZajn1A8yoWhxfWfxLgjYKeJa+H6oiTSv3jdt5ocVyYfAFvZv+ViAa7NI6QE4ODmPIim6
	ORUBA+en6k5WduFavuQ3nkhcrp/z3WBVadPjXJDK4Vo8V4qDi82IXxMm87JBdUrYHxAqjE5VRNP
	EJ48c0vTkrko=
X-Received: by 2002:a05:6102:a206:10b0:7d2:8610:3223 with SMTP id ada2fe7eead31-7d286103264mr1374783137.34.1793873319515;
        Thu, 05 Nov 2026 02:08:39 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8dbb18asm3945061e0c.12.2026.11.05.02.08.36
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:08:38 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-99075306daaso889519241.3
        for <linux-alpha@vger.kernel.org>; Thu, 05 Nov 2026 02:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBypuFB1EqxoZsnngq1GM8x8DpRG2NuOB182uAjWs6B+eWNLlWKAjJTrV2z/inrljpGDKWQbBj8Ulk66oQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5494:b0:7cb:bc5e:7d9f with SMTP id
 ada2fe7eead31-7d072bb3829mr8787869137.11.1793873316184; Thu, 05 Nov 2026
 02:08:36 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org> <20261104-work-procfs-core-v2-16-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-16-76ace653a773@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 11:08:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAk9CwoXpak8+EQjdvJ2Ab9fo1bvj_D5GqBzXB7urEUQ@mail.gmail.com>
X-Gm-Features: AclHuK_D2R6ZzQFy7DOLUQHC3VotRoglnOuhbtIFU-Oniz4UMRG_6kQUnblEqeo
Message-ID: <CAMuHMdXAk9CwoXpak8+EQjdvJ2Ab9fo1bvj_D5GqBzXB7urEUQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 16/23] proc: let procfs copy out reads that
 don't go through seq_file
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

Hi Christian,

On Wed, 4 Nov 2026 at 20:33, Christian Brauner <brauner@kernel.org> wrote:
> proc_reg_read() and proc_reg_read_iter() pin the entry and call
> ->proc_read() or ->proc_read_iter() which copy to userspace
> themselves. Like for seq_file reads and for writes, a reader can make
> a page fault in that copy take as long as it wants and
> remove_proc_entry() waits for it.
>
> So do what kernfs does for these reads as well. An entry that implements
> ->proc_read_buf() fills a kernel buffer of at most ->proc_read_size
> bytes, a page if the entry doesn't care, and procfs copies it to
> userspace after unpinning the entry. The entry moves the position like
> it did for ->proc_read() but that only sticks if the copy to userspace
> worked, like in kernfs_file_read_iter(). If the copy fails halfway the
> read fails with -EFAULT and the position stays, where
> simple_read_from_buffer() returned what it had copied until then.
> procfs remembers ->proc_read_size in the entry like ->proc_write_size.
>
> Larger reads come up short, like with kernfs. An entry whose readers
> want all of a large file in one read asks for PROC_ENTRY_FULL_READS and
> procfs fills the read in pieces of ->proc_read_size, unpinning the entry
> in between. A piece whose copy fails ends the read with what the pieces
> before it returned. kexec-tools treats any short read of /proc/vmcore
> as fatal for example (cf. [1]).
>
> These entries are read through ->read_iter() so readv(), splice(), aio,
> the RWF flags, kernel_read() and io_uring work for them like for the
> ->proc_read_iter() ones. io_uring's nonblocking attempt gets -EAGAIN
> though, like loop_rw_iter() gave it for ->proc_read() entries. Neither
> the allocation nor the entry can honor IOCB_NOWAIT, and io_uring would
> take a short read of a record file for an unfinished one and glue the
> next record to it. So it retries from a worker like before.
>
> An entry that implements ->proc_read_buf() and also declares a seq_file
> or one of the other read methods fails to register.
>
> No users yet.
>
> [1]: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/util_lib/elf_info.c
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for your patch!

> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h

> @@ -84,6 +91,15 @@ struct proc_ops {
>          */
>         ssize_t (*proc_write_buf)(struct file *, char *, size_t, loff_t *);
>         unsigned int proc_write_size;
> +       /*
> +        * procfs calls ->proc_read_buf() to fill a kernel buffer of at most
> +        * ->proc_read_size bytes, PAGE_SIZE if that's 0, and copies it to
> +        * userspace afterwards. Larger reads come up short unless the entry
> +        * asks for PROC_ENTRY_FULL_READS. The position the entry moves to only
> +        * sticks if the copy works.
> +        */
> +       ssize_t (*proc_read_buf)(struct file *, char *, size_t, loff_t *);

As for proc_write_buf, I think it would be good to use this conversion
as an opportunity to replace "char *" by "void *", which will probably
let you drop several casts from users.

> +       unsigned int proc_read_size;
>  } __randomize_layout;
>
>  /* definitions for hide_pid field */
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
