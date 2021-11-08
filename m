From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when
 callback is already registered
Date: Mon, 8 Nov 2021 16:25:47 +0100
Message-ID: <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
Mime-Version: 1.0
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <YYkyUEqcsOwQMb1S@zn.tnic>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, the arch/x86 maintainers <x86@kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>, sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-leds <linux-leds@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>, Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, openipmi-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org, "open list:TENSILICA XTENSA PORT (xtensa)" <l>

Hi Borislav,

On Mon, Nov 8, 2021 at 3:21 PM Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Nov 08, 2021 at 03:07:03PM +0100, Geert Uytterhoeven wrote:
> > I think the addition of __must_check is overkill, leading to the
> > addition of useless error checks and message printing.
>
> See the WARN in notifier_chain_register() - it will already do "message
> printing".

I mean the addition of useless error checks and message printing _to
the callers_.

> > Many callers call this where it cannot fail, and where nothing can
> > be done in the very unlikely event that the call would ever start to
> > fail.
>
> This is an attempt to remove this WARN() hack in
> notifier_chain_register() and have the function return a proper error
> value instead of this "Currently always returns zero." which is bad
> design.
>
> Some of the registration functions around the tree check that retval and
> some don't. So if "it cannot fail" those registration either should not
> return a value or callers should check that return value - what we have
> now doesn't make a whole lot of sense.

With __must_check callers are required to check, even if they know
it cannot fail.

> Oh, and then fixing this should avoid stuff like:
>
> +       if (notifier_registered == false) {
> +               mce_register_decode_chain(&amdgpu_bad_page_nb);
> +               notifier_registered = true;
> +       }
>
> from propagating in the code.

That's unrelated to the addition of __must_check.

I'm not against returning proper errors codes.  I'm against forcing
callers to check things that cannot fail and to add individual error
printing to each and every caller.

Note that in other areas, we are moving in the other
direction, to a centralized printing of error messages,
cfr. e.g. commit 7723f4c5ecdb8d83 ("driver core: platform: Add an
error message to platform_get_irq*()").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
