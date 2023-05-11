From: Nhat Pham <nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 02:30:54 -0700
Message-ID: <CAKEwX=OFVkc2GL3jmoC-qAuwZvzxfs7v__aWY=8bLY3MeMq9hA@mail.gmail.com>
References: <20230510195806.2902878-1-nphamcs@gmail.com> <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683797466; x=1686389466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44LgLHJDIULJkMBem069KICIq3uxO214CaUgM8dXQT8=;
        b=BDA3XAW6HVHBBCTylbjq0CrSvwep3z/RKHIin6eHkOxIgxSvF9oCpp4JdMxjhKCg8a
         t6De61RAZB8nwhqVhhnd+GwGOl5A9f6x8ta1mhnXQNHIA8XVVWTsZ3z2sLNVKJGzzpnv
         pVJ84YIgNXNe3zzg0Bt2DTwq5JDGQGStI/fGod4pqnCGfyQ7QKofa8hYUqI7j01kYIh5
         pdBpovGUxFwqp+4kZG7VlWddqhNwbB9KXu5x5m7XiaxjuDvLIgeFm1gLHxbutaTsEe0t
         4R0BYZnEDMzRXc8veBcbo5PxiVrNC+0sZriJIWCU7Z1JN7IWfsEaHn66MIjE5tmEuP4w
         GExw==
In-Reply-To: <0d8e2503-5d4f-4b60-84ff-01a23bcf557f-fsFgPW9xikU7lZ9V/NTDHw@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-team-M8Ki61LpUEw@public.gmane.org, Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "James E . J . Bottomley" <James.Bottomley-JuX6DAaQMKPCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christophe Leroy <christophe.leroy-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>, Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, Al

On Thu, May 11, 2023 at 12:05=E2=80=AFAM Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrot=
e:
>
> On Wed, May 10, 2023, at 21:58, Nhat Pham wrote:
> > cachestat is previously only wired in for x86 (and architectures using
> > the generic unistd.h table):
> >
> > https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
/
> >
> > This patch wires cachestat in for all the other architectures.
> >
> > Signed-off-by: Nhat Pham <nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> The changes you did here look good, but you missed one
> file that has never been converted to the syscall.tbl format:
> arch/arm64/include/asm/unistd32.h along with the __NR_compat_syscalls
> definition in arch/arm64/include/asm/unistd.h, please add those
> as well, and then
>
> Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Just sent a follow-up fixlet for this:

https://lore.kernel.org/linux-mm/20230511092843.3896327-1-nphamcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
/T/#u

Thanks for the suggestion!
