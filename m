From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Thu, 23 Mar 2023 17:28:55 +0100
Message-ID: <CAMuHMdWkavUwZrfuJ5YSsb2kkHVZ0TCzcme5o6CkYGcSDVt+jw@mail.gmail.com>
References: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com> <20230323150238.GA2550157@bhelgaas>
 <ZBxrfy83MRjnReAs@smile.fi.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
In-Reply-To: <ZBxrfy83MRjnReAs@smile.fi.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kern

Hi Andy,

On Thu, Mar 23, 2023 at 4:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Mar 23, 2023 at 10:02:38AM -0500, Bjorn Helgaas wrote:
> > I poked around looking for similar patterns elsewhere with:
> >   git grep "#define.*for_each_.*_p("
> >   git grep "#define.*for_each_.*_idx("
> >
> > I didn't find any other "_p" iterators and just a few "_idx" ones, so
> > my hope is to follow what little precedent there is, as well as
> > converge on the basic "*_for_each_resource()" iterators and remove the
> > "_idx()" versions over time by doing things like the
> > pci_claim_resource() change.
>
> The p is heavily used in the byte order conversion helpers.

I can't seem to find them. Example?

Or do you mean cpu_to_be32p()? There "p" means pointer,
which is something completely different.

> > What do you think?  If it seems like excessive churn, we can do it
> > as-is and still try to reduce the use of the index variable over time.
>
> I think _p has a precedent as well. But I can think about it a bit, maybe
> we can come up with something smarter.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
