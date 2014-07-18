From: Nick Krause <xerofoify@gmail.com>
Subject: Re: Alpha Checkpatch Errors
Date: Thu, 17 Jul 2014 23:01:29 -0400
Message-ID: <CAPDOMViHhE22ndcjez+vfZWGprsx_Cw0Rn-FpaoNsi63cRnr9g@mail.gmail.com>
References: <CAPDOMVgJx4NTSDXyS4k9jfWzSw_vJ=TFDBPdCUgxa-Xato1bYA@mail.gmail.com>
	<alpine.DEB.2.10.1407180013260.24854@nanos>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=IHTQYJYuny0NsvCbTvVtyVDrMxjw2mSJt/9hauHsRK0=;
        b=E0I1yP9vpNh3+zWt0MnLUz2vA41/8vufFeNQ+ucKVVPxfo48B2M7VUDCa7Y0+WYUfo
         A9dN4SFiOXZ+C+ik/EnprEgUBXhwdoxBhzHmMyfd/GoVNuN6zWtE2VPQrJWlYnN8pFi4
         PsIBBoRMWuHyq7I2ZKVvj9J+UJIA+wJqxrEhkUrg3Hcd+oJmDrEVY3u/O75ukb++FL/6
         ly3PQBaLUU1Ytb6sr/0gJKQUzMbrfLzMD62mR3NtNF/GkZ2VRgIgkgfxSujnoFhKgkAb
         6ZRQ29BRdjFQMyzlGqQnFeTQVIErjX25yf8Ax1eksmoIZmmz0OQBAYnO++20pDJfuV0f
         MuNA==
In-Reply-To: <alpine.DEB.2.10.1407180013260.24854@nanos>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Richard Henderson <rth@twiddle.net>, ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Theodore Ts'o <tytso@mit.edu>

On Thu, Jul 17, 2014 at 6:17 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Thu, 17 Jul 2014, Nick Krause wrote:
>
>> Hey Richard and other Maintainers,
>> I am wondering about cleaning up the cleanpatch errors for alpha,  as
>> I  am hitting a lot of in the arch/alpha directory.
>> It would be nice if I got a list of files that still need coding style
>> cleanup as this may be of nice to cleanup :).
>
> Nick, can you please stop that nonsense? checkpatch.pl is a tool to
> check PATCHES and not to apply random nonsense on existing code. See
> also:
>
>   https://lwn.net/Articles/605597/
>
> Joe, can you please finally remove the -f option from checkpatch.pl ?
>
> Thanks,
>
>         tglx
I understand how about checkpatch. We should remove the -f option as I
agree it gets used too much.
Sorry Nick
