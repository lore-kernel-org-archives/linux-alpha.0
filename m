From: Nick Krause <xerofoify@gmail.com>
Subject: Alpha Checkpatch Errors
Date: Thu, 17 Jul 2014 18:03:19 -0400
Message-ID: <CAPDOMVgJx4NTSDXyS4k9jfWzSw_vJ=TFDBPdCUgxa-Xato1bYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=lTkuxGeGoYx/bG4PGRKxoiaecX2OyiHzkLDhiZzluUg=;
        b=pDbALEw6dBhlr6NfTNGpOy18tdowAmHSI5YzKpiYGButvnpyCWLzw+7Lcpt+STUfYu
         /eLwySkjR/yL+3c/mNbkLBgGICoEQMf1N+WEbyAD3/pMnXYVi31MzfM73Tj5zJQklRIs
         w2VMdeOMnUAbg7EFgVrYQGnpBAu6fjns+9WpZ8pFNqAyiWV/hQckL+mawMA8OVKr1xwK
         78cwzwqyQVJTFLfsFNO++nMNjuwPgt6xaN2u6+0xIUf772olZ0zSw/boBL2BpzWfimUm
         utOiZpNXw+kq+5Ov2wD/z1Xn1MBkHEbRfl5dmhW6WA2SE+zSA9Ud3E+DYiMIqBo7Mkw8
         Y29Q==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, peterz@infradead.org, Andrew Morton <akpm@linux-foundation.org>, mingo@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hey Richard and other Maintainers,
I am wondering about cleaning up the cleanpatch errors for alpha,  as
I  am hitting a lot of in the arch/alpha directory.
It would be nice if I got a list of files that still need coding style
cleanup as this may be of nice to cleanup :).
Cheers Nick
