From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Date: Tue, 11 Jul 2023 18:26:17 +0200
Message-ID: <8d8cef73-1733-4e0b-bede-034895a820bd@app.fastmail.com>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689092798; x=1689179198; bh=W5
        R3dRJEuDedU4mfmE2aIPLz0te1yZv4ob1QkUmzMKM=; b=ODbLFxMV5mwHkhiuHu
        8y59t2aO2M11yWSHec1S1N+Tp6IFvOKHClzlg+U848vHZFecknqfAciJTZ3jLeIB
        fD6V6Q5ow1Smr20ur+LFpqZwBINrmTUvnNZsiVh/Y0YWNtYxenQp8zE/pLbpg80z
        ninH5I1YWvHickc/XUbLcXNFu65A/CUBO0j39o5KLFZw5L5woc4vjGNllJsF8iLy
        JKToX960nkwne8mujYhw5PG3fV1/Zkpr/FHN77eaet7FXA9x2JORMQ0E+pIggAz9
        aB8jzB5q9bBBevc3z+DbT3ltAcgPkgF/3YBFaaAJiNO5ypzY2ZGl9sfiJI7VnyBU
        0Gcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689092798; x=1689179198; bh=W5R3dRJEuDedU
        4mfmE2aIPLz0te1yZv4ob1QkUmzMKM=; b=L4keh8DpXJJ7c686XwDTafCd5Xoej
        ZIIO+4gouATQ6mRad2021iqSClCxCaLwgVsKzMgMnwZ6bKhUwQLXz8xy7EFGYXlw
        pbN/VDJmrKTcBxxxuloD6UNM6DK7Vi+lshUrtUQZ9PuoUK1GjrEOtjFBZUuqIR8d
        YH8atg0ARD20qKAZNb5UwhVcvZo9GGR0DWtoHtKhEKARANny0ACXpeSgeey57Sbg
        X5bUZT5GkxA9sJsGMCfQQs3mu6xawiXRdZbqowNEuL2GMnYz/qSRYZeDH766Y7ZJ
        GZEmvFc9+gCVu/tPaDrIVDSOLexdEpAWfpHXNSLh/zFz8p+9xvzSx5Z6Q==
In-Reply-To: <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Gladkov <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Palmer Dabbelt <palmer@sifive.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, christian@brauner.io, Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>, Deepa Dinamani <deepa.kernel@gmail.com>, Helge Deller <deller@gmx.de>, David Howells <dhowells@redhat.com>, fenghua.yu@intel.com, Florian Weimer <fweimer@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, glebfm@altlinux.org, gor@li

On Tue, Jul 11, 2023, at 18:16, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat2 syscall in most places as nuber 452,
> with alpha being the exception where it's 562.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
