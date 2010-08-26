From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Alpha: Fix a missing comma in sys_osf_statfs()
Date: Thu, 26 Aug 2010 14:21:38 -0400
Message-ID: <AANLkTi=J+MfSmheyfOy5cYAwCa0NeT2SmNDOEAu7d9g2@mail.gmail.com>
References: <20100826164435.28668.25355.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=MheV6nPGb7LIsnWXBj+VNYTgTNEAco1WYrBjLG/lu6Y=;
        b=eFFeLldh1JMX6mwXSD8p/pPvLFSNJ27HaRnUkbBxl5ANepk9ZZq7ZfQszocXjWEWgq
         0lbQcwyBgikdJbuB8UoC90QqybmhWVyhYIu+EmUHDAckRsXim9Uk6BX6WSe0OX9sFysK
         EowH0iVJmmOd00pBUwTFuumuYNfuhLznewbSE=
In-Reply-To: <20100826164435.28668.25355.stgit@warthog.procyon.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Howells <dhowells@redhat.com>
Cc: hch@lst.de, torvalds@osdl.org, akpm@linux-foundation.com, viro@zeniv.linux.org.uk, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Aug 26, 2010 at 12:44 PM, David Howells <dhowells@redhat.com> w=
rote:
> Fix a comma that got accidentally deleted from sys_osf_statfs() leadi=
ng to the
> following warning:
>
> =A0 =A0 =A0 =A0arch/alpha/kernel/osf_sys.c: In function 'SYSC_osf_sta=
tfs':
> =A0 =A0 =A0 =A0arch/alpha/kernel/osf_sys.c:255: error: syntax error b=
efore 'buffer'
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>
> =A0arch/alpha/kernel/osf_sys.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.=
c
> index fb58150..5d1e6d6 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -252,7 +252,7 @@ SYSCALL_DEFINE3(osf_statfs, const char __user *, =
pathname,
>
> =A0 =A0 =A0 =A0retval =3D user_path(pathname, &path);
> =A0 =A0 =A0 =A0if (!retval) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D do_osf_statfs(&path buffer, =
bufsiz);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D do_osf_statfs(&path, buffer,=
 bufsiz);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0path_put(&path);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return retval;
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Thanks, but Michael Cree already sent an identical patch. I've just
been slow to vacuum it up and send it on to Linus. I'll do this ASAP.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
