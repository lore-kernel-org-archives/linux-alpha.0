From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 02/39] arch/alpha: Update WARN uses
Date: Sat, 30 Oct 2010 17:17:28 -0400
Message-ID: <AANLkTi=Po5RaY-mL62trrVm+kuK=0JV7z2oQcDJek4kE@mail.gmail.com>
References: <cover.1288471897.git.joe@perches.com> <517a3d5c620dd4843a35a05c9a1c123b4b936cd9.1288471898.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=TtqyvjnCU0kySWuychucuBvsEl73PsnHiCo2+V8lw8o=;
        b=XHcZCfRNvUJ+JAML3MuvXa9A2n3BwzoCuTOtRr0z93BcqhvPr/IhzkDY3sps9y7+W5
         5OyqP8C/aWuo+ebmdoQsnzAWzOphcSFQhpBDrQqq4d/bWVhQUebL0aiDX6wTq3Kk5Dsa
         /IApawrlt8WBfY2dw9uY92naq9/XElrwLcvSg=
In-Reply-To: <517a3d5c620dd4843a35a05c9a1c123b4b936cd9.1288471898.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Joe Perches <joe@perches.com>
Cc: Jiri Kosina <trivial@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 30, 2010 at 5:08 PM, Joe Perches <joe@perches.com> wrote:
> Coalesce long formats.
> Align arguments.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0arch/alpha/kernel/pci-sysfs.c | =A0 14 ++++++--------
> =A01 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sy=
sfs.c
> index b899e95..6f30ac3 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -44,10 +44,9 @@ static int __pci_mmap_fits(struct pci_dev *pdev, i=
nt num,
>
> =A0 =A0 =A0 =A0if (start < size && size - start >=3D nr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> - =A0 =A0 =A0 WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx =
on %s BAR %d "
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "(size 0x%08lx)\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->comm, sparse ? " sparse" : "",=
 start, start + nr,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pci_name(pdev), num, size);
> + =A0 =A0 =A0 WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx =
on %s BAR %d (size 0x%08lx)\n",
> + =A0 =A0 =A0 =A0 =A0 =A0current->comm, sparse ? " sparse" : "", star=
t, start + nr,
> + =A0 =A0 =A0 =A0 =A0 =A0pci_name(pdev), num, size);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> @@ -261,10 +260,9 @@ static int __legacy_mmap_fits(struct pci_control=
ler *hose,
>
> =A0 =A0 =A0 =A0if (start < size && size - start >=3D nr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;
> - =A0 =A0 =A0 WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx =
on hose %d "
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "(size 0x%08lx)\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->comm, sparse ? " sparse" : "",=
 start, start + nr,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 hose->index, size);
> + =A0 =A0 =A0 WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx =
on hose %d (size 0x%08lx)\n",
> + =A0 =A0 =A0 =A0 =A0 =A0current->comm, sparse ? " sparse" : "", star=
t, start + nr,
> + =A0 =A0 =A0 =A0 =A0 =A0hose->index, size);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> --
> 1.7.3.1.g432b3.dirty

What's accomplished here? It looks like you joined two strings (which
were separated as to not overflow the 80-char limit) and spaced a
couple lines over.

I don't see how this makes anything clearer.

Matt
