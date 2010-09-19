From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 2/4] alpha: remove cast from void*
Date: Sun, 19 Sep 2010 00:52:50 -0400
Message-ID: <AANLkTim4ieLZQEw11vNLzw2UCgruCWRy960eab2cn+74@mail.gmail.com>
References: <1284442059-11641-1-git-send-email-mfm@muteddisk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=yt2moce94MkGoUXDulu2FUr5vsjskVnMJuJZKDzE4aA=;
        b=aSBiVrkXtKH+QqvHNjyTr/Hj5+qUofzu+DsSPmBmKYogEEMBh8CnESe6IPshYCelZm
         pkzZfAeFDXkQ26/ntdPjYBZvnD+6KsBOJ0ChwSMZHvAvgcxw/IP7hwP23R7KpQF3sjdC
         kFN1cLzsCQse01W1o8sm6rYPaSYhoI8IN4yU8=
In-Reply-To: <1284442059-11641-1-git-send-email-mfm@muteddisk.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: matt mooney <mfm@muteddisk.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-alpha@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 14, 2010 at 1:27 AM, matt mooney <mfm@muteddisk.com> wrote:
> Unnecessary cast from void* in assignment.
>
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
> =A0arch/alpha/kernel/pci-sysfs.c | =A0 =A02 +-
> =A0arch/alpha/kernel/srm_env.c =A0 | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sy=
sfs.c
> index 738fc82..b899e95 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -66,7 +66,7 @@ static int pci_mmap_resource(struct kobject *kobj,
> =A0{
> =A0 =A0 =A0 =A0struct pci_dev *pdev =3D to_pci_dev(container_of(kobj,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device, kobj));
> - =A0 =A0 =A0 struct resource *res =3D (struct resource *)attr->priva=
te;
> + =A0 =A0 =A0 struct resource *res =3D attr->private;
> =A0 =A0 =A0 =A0enum pci_mmap_state mmap_type;
> =A0 =A0 =A0 =A0struct pci_bus_region bar;
> =A0 =A0 =A0 =A0int i;
> diff --git a/arch/alpha/kernel/srm_env.c b/arch/alpha/kernel/srm_env.=
c
> index 4afc1a1..f0df3fb 100644
> --- a/arch/alpha/kernel/srm_env.c
> +++ b/arch/alpha/kernel/srm_env.c
> @@ -87,7 +87,7 @@ static int srm_env_proc_show(struct seq_file *m, vo=
id *v)
> =A0 =A0 =A0 =A0srm_env_t =A0 =A0 =A0 *entry;
> =A0 =A0 =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0*page;
>
> - =A0 =A0 =A0 entry =3D (srm_env_t *)m->private;
> + =A0 =A0 =A0 entry =3D m->private;
> =A0 =A0 =A0 =A0page =3D (char *)__get_free_page(GFP_USER);
> =A0 =A0 =A0 =A0if (!page)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> --
> 1.7.2.1

Thanks! Applied.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
