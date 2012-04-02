From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH V1 1/1] NET: add a bpf jit for Alpha
Date: Mon, 2 Apr 2012 16:43:17 -0400
Message-ID: <CAEdQ38FnZXLiPM4CtOhT5X9qj9jLt84x=NhcSSbGO1agSNc24w@mail.gmail.com>
References: <4F75CA89.4010709@googlemail.com> <4F7A033D.4040901@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=RgdF0XqT0QB5id8xB0Sb9okE14awY/fjSwoFbmzZBFs=;
        b=H0WYJT5ZFXcRu3Hnedift3GLcZCPUHla4TseBKVUCe68cJpNDQTWMC04IAh4xsmH+W
         F8aFA18/8IJmx0w/ilUJU6Wsc+SQbjZT820p319rr0OjvL+qGP4gUXEaHREWO/fMJiVe
         6pw7r7Ja21PiR2SGW2Kh7Q2g1GivVDje7Y8kkANn2vMBHamvA6v+PhqMl4x6R+ShqQjC
         5gEaYJHRRe2ylND7vxOHLvrAFMMsbg5Oz31Z2bLIZU61Y/kejtHogJziD/IxMfMy8VRL
         B19mDjhNysDQNUItpMwi2dz01A/gmfGrMr41WxU/fuLXdBsKhZv5RyAfZ3Wi0dj4lzxO
         1YYA==
In-Reply-To: <4F7A033D.4040901@googlemail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Seiffert <kaffeemonster@googlemail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Evans <matt@ozlabs.org>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, rth@redhat.com

On Mon, Apr 2, 2012 at 3:51 PM, Jan Seiffert
<kaffeemonster@googlemail.com> wrote:
> The weekend was cold and windy, so i wrote a bpf jit for the Alpha architecture.
>
> Signed-off-by: Jan Seiffert <kaffeemonster@googlemail.com>
>
> ---
>
> Patch is against net-next and needs Patch 1 of my "Fix negative offsets" Series
> (to get bpf_internal_load_pointer_neg_helper)
>
> The Problem is: i don't have any Alpha machine nor do i really have any clue about
> the arch.
> So this is only compile tested.
> I could really need some Alpha asm guru to give some advice and review this.
> Are the calls done right, are the asm load helper ok, all the conditional and
> sign handling is a little brittle in my mind, etc.

Very cool. I'll try to find some time soon to test this.

Thanks a lot!
Matt
