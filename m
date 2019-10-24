From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 08/12] parisc: use pgtable-nopXd instead of 4level-fixup
Date: Thu, 24 Oct 2019 09:35:12 +0000
Message-ID: <20191024093451.15161-1-peda@axentia.se>
References: <1571822941-29776-9-git-send-email-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIt9WUl36EPMd6/sTow+jAoauCcP0HziIST+STpNbbY=;
 b=fEAnr2/i3O1AFS3nbpfEP8nNqk2J98i29Ta1hHaixE6dDgnhOQxfsfxuZdfA1FoKmOIky8RikVrhIENBJQZaDuSscfbgTUCYfJwUvhLLXD96t0J3rrr38rgQM1Hq/pS9wFlWvV0Gz7tHQUrFL7AK1wapZGeBnZx/qiLMDB7cTGA=
In-Reply-To: <1571822941-29776-9-git-send-email-rppt@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "rppt@kernel.org" <rppt@kernel.org>
Cc: "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "anton.ivanov@cambridgegreys.com" <anton.ivanov@cambridgegreys.com>, "arnd@arndb.de" <arnd@arndb.de>, "davem@davemloft.net" <davem@davemloft.net>, "deanbo422@gmail.com" <deanbo422@gmail.com>, "deller@gmx.de" <deller@gmx.de>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "gerg@linux-m68k.org" <gerg@linux-m68k.org>, "green.hu@gmail.com" <green.hu@gmail.com>, "jdike@addtoit.com" <jdike@addtoit.com>, "kirill@shutemov.name" <kirill@shutemov.name>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, l

On 2019-10-23 12:28, Mike Rapoport <rppt@kernel.org> wrote:
> parisc has two or three levels of page tables and can use appropriate
> pgtable-nopXd and folding of the upper layers.
>
> Replace usage of include/asm-generic/4level-fixup.h and explicit
> definitions of __PAGETABLE_PxD_FOLDED in parisc with
> include/asm-generic/pgtable-nopmd.h for two-level configurations and with
> include/asm-generic/pgtable-nopmd.h for three-lelve configurations and

I think you mean .../pgtable-nopud.h in the latter case.

Cheers,
Peter
