From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 01/17] all: don't use bitmap_weight() where possible
Date: Sat, 18 Dec 2021 23:15:54 +0100
Message-ID: <Yb5dmqlYd3owtH29@qmqm.qmqm.pl>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
 <20211218212014.1315894-2-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1639865771; bh=p9dTd1veiWUw4cfb9+OomK8Wcfce+mkX5nKMW8drZII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O71ZaJP5ODxCFPaoR8j66Ikjj4EJrloyQfx49pvi8th2LFY/8l1Q+SCjjVp+gaQ6W
         tnkNCrMB49ZAk1DXlyYTXcurGZnXEZiY4aZzfabzMlUto6ly6alqMIah+MFnX1p0f9
         84z8n8THEbmdF1ajb1sGxeQHQ6cDCJGonzSml/lVMRg0xcU36xIys+6LGgiXwcKgs4
         JTuYI7KUXZnGY5rNyDBEKe2yAB8dDcMwmd6pm652u9UjcTrQO2cJ9RPun1jw3D+0fo
         NWqf1Qpy9qliPjmhfZYXnYERdUbDXnnUg7WbDLTcmnqX03ee/kBb9lrEjJpNr9TH/V
         aAueEb7NrYLKw==
Content-Disposition: inline
In-Reply-To: <20211218212014.1315894-2-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <>

On Sat, Dec 18, 2021 at 01:19:57PM -0800, Yury Norov wrote:
> Don't call bitmap_weight() if the following code can get by
> without it.
>=20
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  drivers/net/dsa/b53/b53_common.c           | 6 +-----
>  drivers/net/ethernet/broadcom/bcmsysport.c | 6 +-----
>  drivers/thermal/intel/intel_powerclamp.c   | 9 +++------
>  3 files changed, 5 insertions(+), 16 deletions(-)
[...]

Looks good, but I think this needs to be split per subsystem.

Best Regards
Micha=B3=A0Miros=B3aw
