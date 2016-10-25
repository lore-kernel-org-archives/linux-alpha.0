From: Richard Henderson <rth@twiddle.net>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Mon, 24 Oct 2016 20:13:22 -0700
Message-ID: <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower> <580E7616.2020806@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=0TY15Y82NAtByzxMak/eYZNT0IQpJxq8WZL980MbQL4=;
        b=rfqnl46i7KyJIU1mhCel1mNcas1dQGFNseV+7jucfAnWmNwcK3mPSEuHUccg7TXd6i
         V+9jao6aDVtI6RXWfGH4egzpTFfNvGTy8fiQuhg2a7mXqf8Pc+Mbr+Mx5YugfATJmXwb
         4N1EMJIYA92Xkzy16gI50gTsLd5bnvuJTVOR48lyDI0+Fteb4DR+PNV78bJkcn1NMLwg
         g9fr5bVlHoVc2ccegbf4o0u1DpMB0EHZNbRsVpILmYM/a3MTwZRZBNJlfKl0ulQnWUkv
         aF5TvfW+jFwq/SCYJjZvVsWcYHTjm+bhti5H0IPMqshpcZEt5XI0J8GDOGUIrR8/gWJX
         YOcQ==
In-Reply-To: <580E7616.2020806@gmx.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Helge Deller <deller@gmx.de>, Michael Cree <mcree@orcon.net.nz>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On 10/24/2016 01:59 PM, Helge Deller wrote:
> Does it only happens for __copy_user() ?
> If yes, I assume the problem happens because of __copy_tofrom_user_nocheck() in
> uaccess.h is always inlined. Maybe un-inlining helps?
> Or, the inline-assembly for jsr/bsr needs tweeking ?

Indeed.  Try changing #ifdef MODULE above __copy_tofrom_user_nocheck to #if 1.


r~
