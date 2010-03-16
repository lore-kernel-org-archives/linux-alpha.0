From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Will's kernel compilation error
Date: Tue, 16 Mar 2010 17:42:02 -0500
Message-ID: <007801cac559$e798c330$b6ca4990$@com>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <001e01cac4cc$98072ce0$c81586a0$@com> <20100316182534.GA818@ds20.borg.net> <006e01cac54e$dd6b7b10$98427130$@com> <b4198de61003161439s1fc43b75v45595b475053b3d@mail.gmail.com> <4AB85842-79DF-412F-833C-4B784353A1F5@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=qyF86dNwn++htcnQH4d7LRau0Qd9F37Ktk9etZt9UD4=;
        b=gVbhj9tFp9++xiYlqpdIda7EVyAbCuIxmzA+eAro6vi28zkIkabquy0U3KyNGP9RdH
         /cf5pGMeeQrBhqLRzvnMRk8AQdiooyGnKQPodqXrPPbzVKSBJRvxn1C0+OazyFRSJcgz
         K2oc4SWebj0suo/RuOReawpYkQ6TAqKWVyk/k=
In-Reply-To: <4AB85842-79DF-412F-833C-4B784353A1F5@orcon.net.nz>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Michael Cree' <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 'Matt Turner' <mattst88@gmail.com>


> The patch is not suitable, IMHO, for the kernel as it stands.  Some of
> us prefer the small-data model as we must boot off a slow medium that
> is supported by SRM.  Using large-data results in a larger code size.
> 
> It would be nice if the build system could detect the need for the
> large-data model before compilation but I can't see how to do that
> without actually compiling the kernel.
> 
> Therefore I suggest a kernel config item be added to optionally remove
> the -msmall-data compiler option for those who are building kernels
> with data areas greater than 64kB.  I'll drum up a patch later today.
> 
> Cheers
> Michael.

Actually I added several modules into the kernel (raid0/1, router protocols,
and subsystem for TV cards)and it was about 100KB smaller. If push came to
shove, you could simply strip the symbols from the kernel (strip -s vmlinux)
and modules and use gzip -9 (done it in the past and it works fine). Another
thing, how could 2MB make that big of a different on boot time? I used to
use an old 50MB AT drive on my UP2000 (OS installed to 2 IDE drives via a
non-bootable Promise card)and it read at 1MB/s. So, at worst, you're talking
about maybe a 1 to 2 second difference?

Just tested it on my currently modules, went from 35MB to 19MB... not too
shabby.

