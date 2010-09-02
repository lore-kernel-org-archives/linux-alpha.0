From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 02/91] arch/alpha/Kconfig Update broken web addresses in
 the arch directory.
Date: Thu, 2 Sep 2010 17:49:50 -0400
Message-ID: <AANLkTikDUUoWSWZhtgGyi3QH6uHJz1Op-inH6_V+e21K@mail.gmail.com>
References: <1283461606-7803-1-git-send-email-justinmattock@gmail.com> <1283461606-7803-3-git-send-email-justinmattock@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=THaueyUxlEwtDOJm6MEv3oC6k3Vl70iIXTu+N+NG4A0=;
        b=OQ+rrCQyBmP2CNXTkkb3wEeJG/O4s+4NGJ7Fa2nAaU0T8xBfe2+HTDcG7SWn89OBSp
         7MpMekovA3fgYTJ4kSFgXNqFN+kAIPXofgkur5zY9wWAWkXAiplokxJwxiwyH7uSTIgC
         5WpzGFc4spu7CGaok9BJ0PZcO+tqgJB57gpTM=
In-Reply-To: <1283461606-7803-3-git-send-email-justinmattock@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Justin P. Mattock" <justinmattock@gmail.com>
Cc: trivial@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 2, 2010 at 5:06 PM, Justin P. Mattock
<justinmattock@gmail.com> wrote:
> The below patch updates a broken web address that is no longer
> working due to company buyout, and/or change of location.
> (Please have a look through, and let me know if any of them
> need to be changed, and I'll resend an updated patch).
>
> Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
>
> ---
> =A0arch/alpha/Kconfig | =A0 =A06 ++++--
> =A01 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index b9647bb..16ae162 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -219,7 +219,8 @@ config ALPHA_LX164
> =A0 =A0 =A0 =A0bool "LX164"
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0A technical overview of this board is available at
> - =A0 =A0 =A0 =A0 <http://www.unix-ag.org/Linux-Alpha/Architectures/L=
X164.html>.
> + =A0 =A0 =A0 =A0 <http://web.archive.org/web/*/http://www.unix-ag.or=
g/
> + =A0 =A0 =A0 =A0 Linux-Alpha/Architectures/LX164.html>.
>
> =A0config ALPHA_LYNX
> =A0 =A0 =A0 =A0bool "Lynx"
> @@ -483,7 +484,8 @@ config ALPHA_AVANTI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Avanti AS 200, AS 205, AS 250, AS 255, AS 300, and=
 AS 400-based
> =A0 =A0 =A0 =A0 =A0Alphas. Info at
> - =A0 =A0 =A0 =A0 <http://www.unix-ag.org/Linux-Alpha/Architectures/A=
vanti.html>.
> + =A0 =A0 =A0 =A0 <http://web.archive.org/web/*/http://www.unix-ag.or=
g/Linux-Alpha/
> + =A0 =A0 =A0 =A0 Architectures/Avanti.html>.
>
> =A0config ALPHA_BROKEN_IRQ_MASK
> =A0 =A0 =A0 =A0bool
> --
> 1.7.2.1

Hi Justin,
These two links are pretty useless. I think we'd do better to remove
them until we write proper articles for the AlphaLinux.Org Wiki.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
