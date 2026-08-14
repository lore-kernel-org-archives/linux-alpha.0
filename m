Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B0B3515EC
	for <linux-alpha@vger.kernel.org>; Fri, 14 Aug 2026 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732666; cv=pass; b=Ei2bsuHdUMvP9xbSfJuTUl20YwIM0kcBjghfu0m6GcB/33usw4eQ8ArFhqBXJ1mu163jZbO0HZdfnNuEIKtRrsEneeoZBmQ7+llDE1+aKtXzrzKv80linojnlUnYq91i/xDZ66kW9LOsOrmsLqpzV7psyU2JcvuSM76mDjqeIqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732666; c=relaxed/simple;
	bh=+yTnC3qUCMhYF5izBj08k4AdSicm6irjFGKLdWdw5gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3GrrBW5AQ5hPZ1cJPJvZ4VXw/HEIu24IAPLmXPJiNQCB/LBk6+Ncq+lGYx5jv9fdhOf0O+YasUmEEVruen74YoXeRc5mnGt6trZrRD0de9eUqflO78Zu4Dbk0jeo2ZAEzYxgmF6g953b0/AdYj09f8anE24cmrWN2q39EhC6SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrZu+qdo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjDgTjUq; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrZu+qdo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjDgTjUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786732664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
	b=hrZu+qdoz3Xn9mJSNltKFNpdHGMnq6olmPGRf4aELEhsFnGrW7xHZ6rqspnCW9wOyXStXC
	WN/MCTBGnklfTPNI5L02lycGCvPOS//UzyqZGzw22AY8VP6r5IJzqJ+mHVDs894vgxMwhh
	tr+ub+1uuAOWs2b3AH1+JnG2hEDBtPo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-GRcGnz8bNc2MM7Wi9hgSyg-1; Fri, 14 Aug 2026 14:37:42 -0400
X-MC-Unique: GRcGnz8bNc2MM7Wi9hgSyg-1
X-Mimecast-MFC-AGG-ID: GRcGnz8bNc2MM7Wi9hgSyg_1786732662
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a17c89d8c1so1461442a12.1
        for <linux-alpha@vger.kernel.org>; Fri, 14 Aug 2026 11:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786732662; cv=none;
        d=google.com; s=arc-20260327;
        b=guRTu27ksiPjTyDywfGToDE2wC1A/rKVxOZC0uT8ka79UmzilHHjjYI1JMWcNOgDzS
         jz72rdzF1jQTV++TY/zviv2q9fdpdRpUd3C/UmWcx0FAHD4T6nlppgeDGAGQcz21/AyD
         LC0tt2/Nzw1d5pwUz/g5p5Mx6aGwN322JRpc4syX6PoM6qXVnAw58N2fTw/gl00OHXOa
         hwBmrTXMGMwP1tVEUrX5ECsfYcw6bVHqGDEVpNcud4bdnbey8XwD2YMcSUG/pxjOX5W3
         011StrssUvOaISRZr5Mz3F+4Ovu7wIlZxIMjL3ivQhyg5HoBAc0/6xtZDBfhYAmVC7I7
         S3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        fh=5dmYfdc0BEZ7BSRVQ/zGg++xwK1COhrzjSz2s7FEN1M=;
        b=E5yeN/qyVS9dExobRF90kpFxsyR3Lw/6eHPI5TBtNT30/jKFYJeMRgKPQGlqCap2s6
         7SHIGONqA9hpx6+gzW/DH+r1R8fnbB1JakLuGvq+NICpqQfPyGMvCDi+keGhNrLPzsWN
         e9B148b4loyma6CkBm+zrgANDTa94LpVU+hy+uSm20drWezCDsp85mu+3pj5B23Ak6kp
         zpcWATU9iyyYTPd+wuI64JG4CwBjW9jnef/XQt7BXF4HAPclN9eOLP3KKbZnZkjOBvna
         Urzn81boUGz6fJj0REKquug8rxEbayJiDvUR7PyQM8/gLf8huwYdh4AfWUnBFXxQS/NY
         0vcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786732662; x=1787337462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        b=QjDgTjUq54fJJAwG80FBXraQTxVL2RXfWsMCmAfjNtywUsf3hLrNJ9IPCLgxVhXQhs
         unUSe6/q5mKfDqWnx6ZRWIDH3jjhDmppMox1aGpfM8z9Vv55QcscyMMwJm9MiZQbPGRB
         10reynRego7fAWekupcKLsSVMWMtkzK5g999XF3GiQENlqzshT8CmL95TFIC4nNNhFov
         s6yM2AZnCLexlgnurb9+9xpl7BHVJfcFEWvS4WHwKnYtdNE7Y71Zi1FB3FXNdI6q8h9v
         3r79+JiJN6/FyQM7ij94ZqGqiM8+C5Qrx4FfoVyLTwhVqdt3IG9Eao3Hwhdbd4bJMUxz
         QeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786732662; x=1787337462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3Bw7xg93wntK2DGSQ+p1dtb5GSU+jYFMAY4ihssDQ0=;
        b=Gnp0211d5Sg8sKMOEVDwox0RdClQY0p2WmicGP1+DX0l8PhMtgbwFWs/J4sm916w48
         HEYO7UB2eKlWy2ME/iXj+Q8X2LLV2Xrb42aqUr8uLG1u2iwaa/Y4BYKEwKJKujjb5r+Q
         xbVeID11MMHPd0KEWZuJS7dFJhkbiTppQv0nPtHtHn72L3b79FmMujoompr4y+YqAnEd
         u50FUD85VHJy49zNdtOTc+TPkJxRYEfiRHq29/Rsw8skqChf1k7GOC3YLGC1NdpJp/kr
         vg8rmO2jKhkb4AB0kOSbdLmyEyhDudZ5fmeL9x5GPdq9iZzMQvlMStH5Zuu139LLFQz5
         I9Ig==
X-Forwarded-Encrypted: i=1; AHgh+RqFJVYXtg3kiuY9V3blHiu7hTeyMX3dNEqPBJVbbGKAnmHeGTbXiNh0xnKE5/j+hEGGplZ1tqjGa/f0SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKADvLebE3G31D8yoJYUywK6WuNhQxEXoMDJPTtO8cs75kSudA
	O/Ks3AN5Sxgt37ryQHxnaaooJIOPTcOoJ5F5uRcZyad8MjXDiD3qZpZDXtZ1799GuyLxBpxLyw0
	SCAbKDf3/M2gwXhgSelFOHILtzWwFoW4jMrB/eTv839PMa0cmWPhCasGvujDQYtTXjZ9vjFf+2J
	tknX3xrccKlqoaxEDRs3uN9nKLkeUcZFi3fJWXDm8=
X-Gm-Gg: AR+sD11g4QVEU9us29IHrbDt88VF8q3h+c73BXC3rMWU1B7zDHzwBDVQDEzvvQEUreR
	NTKT8Pti618cvN/vw8O1KQxXDhxzfF4UwW71uuUTupzin2dz2XRljvq2xqIFSACi2flco5S/qA2
	+amRr2XOq/UWter3eXBMgN8SylA9c/h+Eb0nZUoWaLxZP/o0L+13/TcT7+cLRB0VbI0DroPJjUz
	uL449vxXqLJdLYzb08b/Dsqk16oCl5zMK4R9DO+AhBzVw==
X-Received: by 2002:a17:907:1c94:b0:c20:87f9:875a with SMTP id a640c23a62f3a-c212a23ba41mr343802266b.30.1786732661696;
        Fri, 14 Aug 2026 11:37:41 -0700 (PDT)
X-Received: by 2002:a17:907:1c94:b0:c20:87f9:875a with SMTP id
 a640c23a62f3a-c212a23ba41mr343797466b.30.1786732661284; Fri, 14 Aug 2026
 11:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786626275.git.rrobaina@redhat.com> <an7Udt-luZfJO71U@willie-the-truck>
In-Reply-To: <an7Udt-luZfJO71U@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 14 Aug 2026 15:37:30 -0300
X-Gm-Features: AUfX_mwn2tCHNr249W_00_JVZBPk2OAqZsqdPsMuBo2JtJrJsV0GhfYgrjHGFrM
Message-ID: <CAABTaaCcyTLV5TdmzZfpP6LMV+5GeCKqotPoJrb0u9n0h-TaHQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] audit: log all six syscall arguments in the SYSCALL record
To: Will Deacon <will@kernel.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, guoren@kernel.org, 
	monstr@monstr.eu, tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 5:40=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Thu, Aug 13, 2026 at 02:02:50PM -0300, Ricardo Robaina wrote:
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3), silently discarding the remaining two. This
> > leads to the need for auxiliary records when audit-relevant
> > data lands in the 5th or 6th argument of a syscall.
> >
> > This series extends the SYSCALL record to log all six arguments,
> > by adding arguments a4 and a5 inline within the existing record.
> >
> > The audit testsuite runs successfully:
> >
> >  # make test
> >  make -C tests test
> >  chmod +x */test
> >  Running as   user    root
> >         with context unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1=
023
> >         on   system  Fedora
> >
> >  amcast_joinpart/test ................. ok
> >  backlog_wait_time_actual_reset/test .. ok
> >  bpf/test ............................. ok
> >  coredump/test ........................ ok
> >  exec_execve/test ..................... ok
> >  exec_name/test ....................... ok
> >  fanotify/test ........................ ok
> >  field_compare/test ................... ok
> >  file_create/test ..................... ok
> >  file_delete/test ..................... ok
> >  file_permission/test ................. ok
> >  file_rename/test ..................... ok
> >  filter_device/test ................... ok
> >  filter_exclude/test .................. ok
> >  filter_exit/test ..................... ok
> >  filter_inode/test .................... ok
> >  filter_saddr_fam/test ................ ok
> >  filter_sessionid/test ................ ok
> >  io_uring/test ........................ ok
> >  login_tty/test ....................... ok
> >  lost_reset/test ...................... ok
> >  netfilter_pkt/test ................... ok
> >  signal/test .......................... ok
> >  syscalls_file/test ................... ok
> >  syscall_module/test .................. ok
> >  syscall_socketcall/test .............. ok
> >  time_change/test ..................... ok
> >  user_msg/test ........................ ok
> >  All tests successful.
> >  Result: PASS
> >
> > Ricardo Robaina (13):
> >   audit: log all six syscall arguments in the SYSCALL record
> >   alpha: pass all six syscall args to audit_syscall_entry()
> >   arm: pass all six syscall args to audit_syscall_entry()
> >   arm64: pass all six syscall args to audit_syscall_entry()
> >   csky: pass all six syscall args to audit_syscall_entry()
> >   microblaze: pass all six syscall args to audit_syscall_entry()
> >   mips: pass all six syscall args to audit_syscall_entry()
> >   openrisc: pass all six syscall args to audit_syscall_entry()
> >   parisc: pass all six syscall args to audit_syscall_entry()
> >   sh: pass all six syscall args to audit_syscall_entry()
> >   sparc64: pass all six syscall args to audit_syscall_entry()
> >   um: pass all six syscall args to audit_syscall_entry()
> >   xtensa: pass all six syscall args to audit_syscall_entry()
>
> Could audit make use of syscall_get_arguments() instead?
>
> Will
>

Hi Will,

Thanks for reviewing this patch. Yes, I think so. I'll fix that in the v2.

Thanks,
-Ricardo

