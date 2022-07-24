From: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Richard Henderson's address
Date: Sun, 24 Jul 2022 16:19:53 +0900
Message-ID: <YtzymRkPkewIQ3w3@antec>
References: <20220722211854.802252-1-shorne@gmail.com>
 <8c0ad12a-6101-8ba7-f3bf-0be6a9e6054e@linaro.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Ei+8mnSSOURXVLx0NWbMHoyoyHTmjADjelWo1luek4=;
        b=i0U+GSKdH41sf2XWwxT0jwDek92oy3bYs8gPOwEdzlFObHdqTaPqtzDdmZxtGK8TJU
         ihuZtfTybeKhtIsjDYrfKkgHjiLJkS0UUhB4gm3dZ8lFMT01PHHFABp0hPz045vy/tqz
         XtbuXWrm8wDvbeaaPHNKzOF9D4WOob897P2r1UpFtfnR0k1GPRdCQ4ppKIb2OADuLPw7
         97H1nS/0ZFYAGkrLKDcIR+eCJ2/cWFXuoLDxjEjFpXNc61LdYw+1LbmaFO/ZoeAT439G
         nPnYD7//JL1GyJlR4RDsSKn+Tm/GPThchRHBECGmEg2+2dXTTtul86HMAmFc4UGWyabW
         uzww==
Content-Disposition: inline
In-Reply-To: <8c0ad12a-6101-8ba7-f3bf-0be6a9e6054e@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On Sat, Jul 23, 2022 at 05:43:38AM -0700, Richard Henderson wrote:
> On 7/23/22 02:48, Stafford Horne wrote:
> > Richards address at twiddle.net no longer works and we are getting
> > bounces.
> > 
> > This patch updates to his Linaro address.
> > 
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f679152bdbad..e64ca0ac6db7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -797,7 +797,7 @@ S:	Maintained
> >   F:	drivers/staging/media/sunxi/cedrus/
> >   ALPHA PORT
> > -M:	Richard Henderson <rth@twiddle.net>
> > +M:	Richard Henderson <richard.henderson@linaro.org>
> >   M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> >   M:	Matt Turner <mattst88@gmail.com>
> >   L:	linux-alpha@vger.kernel.org
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Ccing other alpha maintainers,
Ccing Arnd too as he might be interested.

Thanks, could this be added to the alpha patches tree?

-Stafford
