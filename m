From: Richard Henderson <rth@twiddle.net>
Subject: Re: FIX ME message in osf_sys.c
Date: Thu, 03 Jul 2014 11:15:30 -0700
Message-ID: <53B59DC2.20809@twiddle.net>
References: <CAPDOMVj3sJSfgA7hBv9Tx0oz5ZX73robsTZygVJfU_QZ9A65dg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=GHFW5lqBtEpdb8o2QZ1ZjZ1fiusi/5w8iRtuf8BEHYg=;
        b=ze5/RXBIWG1zPql0hvYxJ3t0MX1KcGaI8Z8trXamNYDH3jpx3NRl/CF8Q3iPF5iPT2
         g54uu9XKdc+lGOLSDGseQcPUHxmXUwQ5kbgMvbUTUSOiq3LLbSGj74Mky3wsLXAKRc0A
         LhTr6uM5BwF+9XqduIFsPjnYtxSQhxLunEldoKKhQiXIUadd0tSZoUTIqAV5P04SvwbB
         tm0G0Zc9+DqtTChXa0YepHN4z2sCvPmyzZk5CzAY0+EgeLOjeYIZI416ZuMj7uemgF00
         eTZswGQ7uvM16yp7oQgx7W05lYhND0B293FZy0a8G3f316XEBU/OTrqSyLpmzIurPJxV
         p3XA==
In-Reply-To: <CAPDOMVj3sJSfgA7hBv9Tx0oz5ZX73robsTZygVJfU_QZ9A65dg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Krause <xerofoify@gmail.com>
Cc: ink@jurassic.park.msu.ru, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 07/03/2014 10:21 AM, Nick Krause wrote:
> There seems to be a Fix Me message on line 892 due to info.si_addr = NULL.
> I am wondering what value I should declare this variable to instead of Null.
> Cheers Nick
> 

The closest thing to compatibility with SIGFPE raised through normal arithmetic
would be the address of the instruction after the callsys that lead to this
system call.  Except that's not available without complicating the call to
osf_setsysinfo, and it doesn't seem worth it.


r~
