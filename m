From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Fix compile error due to typo in call of do_osf_statfs()
Date: Mon, 16 Aug 2010 09:06:49 -0400
Message-ID: <AANLkTi=bbu2HSzZTc5_aBeS_emoXB0YO4KUSgwwTEnuH@mail.gmail.com>
References: <1281946680-23497-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=ksSi/eirprH9wTI9xIkil3kC6HwdJojsksMAZxwSvXs=;
        b=WixH6aAlPykMMkTz30gAUJTlS+VZuGPGtIYp2FsurhK32D/EC5dvNcXIvcAEkJcHY3
         /g3ppyHetm6cg+PL6koK3FnLuT6VfQwmO1O0vw31Al7YcM/7tw2DDE1WOFXGmRNzoKEg
         Rc5GPYngx6TohXhju7F+dcUCRUAT5yYZxQWsg=
In-Reply-To: <1281946680-23497-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org

On Mon, Aug 16, 2010 at 4:18 AM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> Typo, i.e., missing comma in argument list of call of do_osf_statfs()=
,
> was introduced by commit ebabe9a9001af0af56c0c2780ca1576246e7a74b.
>
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
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
> --
> 1.7.1

Thanks Michael. Will apply.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
