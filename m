From: Nick Krause <xerofoify@gmail.com>
Subject: FIX ME message in osf_sys.c
Date: Thu, 3 Jul 2014 13:21:35 -0400
Message-ID: <CAPDOMVj3sJSfgA7hBv9Tx0oz5ZX73robsTZygVJfU_QZ9A65dg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=JUHe/kJwaNY3pay0LZLeLo6NRDYb9ha6KmCd9gd2x9s=;
        b=T9U9QGYB2SLWI5IouMJk7iDeH+7LbMfFJQ+k4PQBQ5AmU3HuSoNW8VbHtNRIqw4aU/
         FLAVlE8Z+/WOdH4A5a+BMlSu2e4ZLxz7zmFiYRTp3pYLq6rvivxP+Sa4VVC6+Ewj8jxf
         Fa0N+z2J2brTCZiOVM8Y8Llcrjy0tgrsv6NzzVLFttdDBZ6jVPAeMa6oAYQ5zo2DYEg+
         uTWttux5k+VXWGPSKbKYdjoQNgoh3Ck/AzQdB2I7wSfj+6k6GzvMwBdOogcY2kFazUgI
         vafKTBEuxMTpWJ27LQWYHvvvCBs1BkkBFm6RBGSkWnmo7hcgBeXG7SiRwHLtFq184fFf
         RD9w==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

There seems to be a Fix Me message on line 892 due to info.si_addr = NULL.
I am wondering what value I should declare this variable to instead of Null.
Cheers Nick
