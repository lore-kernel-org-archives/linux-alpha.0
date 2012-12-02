From: Matt Turner <mattst88@gmail.com>
Subject: Re: [GIT PULL] Disintegrate UAPI for alpha [ver #2]
Date: Sun, 2 Dec 2012 02:48:03 -0800
Message-ID: <CAEdQ38ERo_2AjLRZTAo-aPNvRybhJaO-dMSmFn8y9_i8=aM7hA@mail.gmail.com>
References: <21103.1349774108@warthog.procyon.org.uk> <20121202030055.GA4687@omega>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=uA9HeNmD2rDYzWMhnXzTPxGdyBbJsZ7g2asjFEfUOn8=;
        b=Iti8Y27z4Hxy3q2Mu/Usv3rx7fKV3Ahup3rObziNcBhAk0zpY86PXKRUTgmKIzebeT
         iQTotMrcbWA5dMz7SddOOpmSrE31yYW2rVtcwlGOut3QPnTVFc9jiL3hLguvq5g+6THM
         QPuF0EcXjxTvRynv2ceUPWYLTuWgB/SRTZclwDi/pZfQgUSjiR8uGJU8DhDFjk6LpJ0V
         Ocn69fAcj+RzqsGQUWUK9lE9gb6VzUJQG1KZnA9mAJX0hnQj4sxE+XDpmL8DUNaPC9LI
         arQgRlqiagwmuiti6hoENOuohLxGeeRO0jhMyzPBSl0Haz+V1Efdb5qXH8EG0e6OTGR0
         HVvw==
In-Reply-To: <20121202030055.GA4687@omega>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, David Howells <dhowells@redhat.com>, rth@twiddle.net, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, mattst88@gmail.com

On Sat, Dec 1, 2012 at 7:00 PM, Michael Cree <mcree@orcon.net.nz> wrote:
> On Tue, Oct 09, 2012 at 10:15:08AM +0100, David Howells wrote:
>> Can you merge the following branch into the alpha tree please.
>>
>> This is to complete part of the UAPI disintegration for which the preparatory
>> patches were pulled recently.
>
> I think the alpha-next tree is currently inactive so nothing has happened
> regarding your merge request.
>
> Any chance you could send it directly to Linus?
>
> (A conflict has arisen in arch/alpha/include/asm/Kbuild against Linus'
> tree but that is easily resolved.)
>
> FWIW you can have my Acked-By but it would be better if one of the
> official Alpha maintainers acknowledged it.

Acked-by: Matt Turner <mattst88@gmail.com>
