Return-Path: <linux-alpha-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FD7E7545C
	for <linux-alpha@archiver.kernel.org>; Tue,  3 Oct 2023 18:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240719AbjJCSCE (ORCPT <rfc822;linux-alpha@archiver.kernel.org>);
        Tue, 3 Oct 2023 14:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240742AbjJCSCD (ORCPT
        <rfc822;linux-alpha@vger.kernel.org>); Tue, 3 Oct 2023 14:02:03 -0400
X-Greylist: delayed 478 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 03 Oct 2023 11:01:59 PDT
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264BC83
        for <linux-alpha@vger.kernel.org>; Tue,  3 Oct 2023 11:01:59 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 296C12B0006B;
        Tue,  3 Oct 2023 13:53:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 03 Oct 2023 13:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1696355635; x=1696362835; bh=Em
        ic7Z1y2XZwljvtzupGq8cvsW20UYl18kfH5lRmznc=; b=AsoLtHlJErskTrRJFq
        YWB7LiuJuM5uGYXcM2daXNPnZcZ8WsiKuZn2wpyzlqdqjRHSCBO3d+MAAl4fq3QT
        WcbWxKUmZoSgGhADqlbONnGKGrP0WPYftmyN5SHnl0RznO6QDh70iF4WWdmmdr1o
        aIScf5LEdaaGhZvRXtqauEdQYcVTxfnY5fBDKymQI3GW62WysEdhRtl52Reur2xV
        neOI7u8mmhegCJEg8MG+g/gN2FLhcS8X7pM1jBmSWDhpZHC3NL0k4AnK5u5eQSrj
        2JqicmdimqMmRzc060ENJNbBiQ/6lJJQs7iVAB0KB6SoQ6jf1kentb8lURzCMPxW
        GsLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1696355635; x=1696362835; bh=Emic7Z1y2XZwl
        jvtzupGq8cvsW20UYl18kfH5lRmznc=; b=Jau1+o+nsNlGBB4FdY6b7J4VspbNA
        aPd7cmm28YNYn367OO6LUMEIptuTzH5zBRlumJEK4RLdF7HR3VVDrI/hwj37Zese
        n7JroZhW75x6+9gm+lN413ne/nHgr78NfIAyttCubWuBaxkO0eF98iMT2qUh7oiR
        bnM9qrH8wfLq/b/WGafDJrClpK/9Ky/PNHRd1IYuq05u365NxX8nD1U6KBZLuCpv
        TA+R5Olp6FDTDiDJDVx6+qIB0ESjxd14oLsCjLAmJopC38NMetD2FFVUqx64YCjQ
        EgodgWspZ4ZGKgVj3rxWV/D4ycCjCoG/0ltVeXB3Myk6fP0zzX9/IrxaA==
X-ME-Sender: <xms:MFUcZfSC4nOicsWJVAEEwkPxHVw3IOtLiMUmhmi2_A6LGQKSr8wOJg>
    <xme:MFUcZQwW_3Fl-330qGVbPh4Hq3_93YdNnHRKSjwK5RF_peTaRIvfNogMNwzQggPcH
    bj-JvdySS8ylDIut1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeejgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:MFUcZU2D22kzVLiPB8I7PPK9hqXB0jIiyrEVTBJJV7gbFUvmHP7rXg>
    <xmx:MFUcZfCBTWDztQr-WX_3iN9pneFwP2S06aBCQ9hNL6yy7ZThoDvuDw>
    <xmx:MFUcZYi3QcnlGJ6ljx0r1LwaQgk6kVg8ny9_cY5OUXs_1qlaDJpSsw>
    <xmx:M1UcZdKBE_BaqL21RT7ItgK7M7YEJCpJZ6XV5WpeTQIj-mielUA5Km_2a40>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8B48FB60089; Tue,  3 Oct 2023 13:53:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <ac03a633-5d74-4735-a7bb-0214f54242c9@app.fastmail.com>
In-Reply-To: <cdada842-2a7e-5f1d-eea3-3d99b637c26b@intel.com>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
 <20230710185124.3848462-1-sohil.mehta@intel.com>
 <5748f659-4063-0e18-c5d4-941a863d0d93@intel.com>
 <cdada842-2a7e-5f1d-eea3-3d99b637c26b@intel.com>
Date:   Tue, 03 Oct 2023 19:53:31 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Sohil Mehta" <sohil.mehta@intel.com>, linux-api@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>
Cc:     "Richard Henderson" <richard.henderson@linaro.org>,
        "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
        "Matt Turner" <mattst88@gmail.com>,
        "Russell King" <linux@armlinux.org.uk>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        "Geert Uytterhoeven" <geert@linux-m68k.org>,
        "Michal Simek" <monstr@monstr.eu>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Helge Deller" <deller@gmx.de>,
        "Michael Ellerman" <mpe@ellerman.id.au>,
        "Nicholas Piggin" <npiggin@gmail.com>,
        "Christophe Leroy" <christophe.leroy@csgroup.eu>,
        "Heiko Carstens" <hca@linux.ibm.com>,
        "Vasily Gorbik" <gor@linux.ibm.com>,
        "Alexander Gordeev" <agordeev@linux.ibm.com>,
        "Christian Borntraeger" <borntraeger@linux.ibm.com>,
        "Sven Schnelle" <svens@linux.ibm.com>,
        "Yoshinori Sato" <ysato@users.sourceforge.jp>,
        "Rich Felker" <dalias@libc.org>,
        "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        "Andy Lutomirski" <luto@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
        "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Chris Zankel" <chris@zankel.net>,
        "Max Filippov" <jcmvbkbc@gmail.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
        "Jiri Olsa" <jolsa@kernel.org>,
        "Namhyung Kim" <namhyung@kernel.org>,
        "Ian Rogers" <irogers@google.com>,
        "Adrian Hunter" <adrian.hunter@intel.com>,
        "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
        "Sergei Trofimovich" <slyich@gmail.com>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Rohan McLure" <rmclure@linux.ibm.com>,
        "Andreas Schwab" <schwab@linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "Brian Gerst" <brgerst@gmail.com>,
        "Randy Dunlap" <rdunlap@infradead.org>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-alpha.vger.kernel.org>
X-Mailing-List: linux-alpha@vger.kernel.org

On Tue, Oct 3, 2023, at 19:47, Sohil Mehta wrote:
> Arnd, is this a good candidate for 6.7? Though old, the patch applies
> cleanly on 6.6-rc4. I can re-send this one if you would prefer that.
>

Thanks a lot for the reminder, I've added it to my asm-generic
branch for v6.7 now, it should be in linux-next tomorrow.

     Arnd
