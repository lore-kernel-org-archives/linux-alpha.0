From: Matt Turner <mattst88@gmail.com>
Subject: Re: fdisk vs. BSD disklabels and slices
Date: Sun, 6 Jan 2019 14:46:54 -0800
Message-ID: <CAEdQ38GPTUMbi6A7yPMC_3-V_dfxzqQk00we9w_sC+4h5sRuTg@mail.gmail.com>
References: <20190106223135.GA26510@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+v7cvK1s9dsW7yjUSiCVghXnhfD1KD0oTTqdSGAGFAs=;
        b=HTfD7sK5mPoYFGsE4cdw+l4p/QxBOlwnHcuLW4HQjboafDf35pkIynM32BLo0pqMCf
         4vw6eCxepMMs1pVqnTDe7Ov6A5X+9lJv/pA2DooEpQHVwQTkAVX2zhgpKHH1gfEurQFT
         v8+qotVQtfXwbGUr0juLaoIB7F1mUyX4khH6R2hLt5yYLhfneW61qZGDR8s4IdQUoqNo
         40AMly0PccHmuZQtuym0S5zAi7ZiTBr6ag1NV2GBXtfxyiIGXlBRRX/xD1W1JXmAYeCh
         bIuPO63oCiO3rd02uK1wYMrk2y9SRs89wmS6hdsMBGXQvjRBS71WLriTv+HIy55AnXu8
         vCTA==
In-Reply-To: <20190106223135.GA26510@gherkin.frus.com>
Resent-Message-ID: <HVKd8XhhZoE.A.LYC.3VoMcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAEdQ38GPTUMbi6A7yPMC_3-V_dfxzqQk00we9w_sC+4h5sRuTg@mail.gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, mcree@orcon.nz.net

On Sun, Jan 6, 2019 at 2:31 PM Bob Tracy <rct@gherkin.frus.com> wrote:
>
> Has anyone reading this used a recent version of "fdisk" to create a BSD
> disklabel and disk slices from scratch on an Alpha?  If so, would you
> please describe the procedure in enough detail that relevant Linux
> installation documentation could be updated?  It would seem to be anything
> *but* intuitive :-(.

fdisk's BSD disklabel support has been unusable raw disks, as far as I
understand, since v2.23. See
https://www.spinics.net/lists/util-linux-ng/msg11869.html

> If "fdisk" is the wrong utility, I need a pointer to the correct one(s).
> At this point, I'm seriously considering digging out my old Debian 4.0
> CDs and harvesting the essential pieces.
>
> As always, thanks in advance.

Use 'parted' instead. It works well. Reminds me that I need to change
the Gentoo handbook to reference parted instead of fdisk.

> For what it's worth, the new Gentoo "install-alpha-minimal" image fixed
> the "qla1280" firmware loading issue for the most part (a module reload
> is required to get the firmware to load).

Good to hear. I suspect the module is in the initramfs but the
firmware is on the root file system. Hmm..

