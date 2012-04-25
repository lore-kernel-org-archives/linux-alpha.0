From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: [PATCH] alpha: add io{read,write}{16,32}be functions
Date: Tue, 24 Apr 2012 21:11:24 -0500
Message-ID: <20120425021124.GA3017@burratino>
References: <1322640100-14534-1-git-send-email-mcree@orcon.net.nz>
 <20120424055123.GA7140@burratino>
 <CAEdQ38HE70B-4w3t71rn_S-eX7BMnc6f=dD49guuBim+dQnPzA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=a99S2hyglQDzEKL9xlyMS+UwVngFXuyc0St7RlBwKiM=;
        b=ZK2uQZIWcUE+Us0lMNYj+5bPwpARqHtiL2r/FELOK/7HC1LPOY/pcRyr2e8sisjmME
         8wjRcyEO99TIk0A1HU2FhIZPIcwE36PdEH9J8pCDEoFJ8gZG0x3bS1FlxuB9ldVc/mQN
         ZhD3fkUVaYTqruD9bD5bb9NEpFNQhrvyTeHJhzxxQ8Y+ukCbKD8h/d734ScqRTU/LDdo
         obKwVosUIXP3qI/Rvw8mVq/+F0fv9TYG0E+08ytikv6zz53pxG0oTXgDNOeTYu6BjVQS
         AnK3sTswNvqwf4r7lxMtrRiMLrfpfBy6IcorI6Yz9ondO+dNC0GTF8H/9an6IMj7uA4j
         wvag==
Content-Disposition: inline
In-Reply-To: <CAEdQ38HE70B-4w3t71rn_S-eX7BMnc6f=dD49guuBim+dQnPzA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, =?utf-8?B?UmHDumw=?= Porcel <armin76@gentoo.org>

Matt Turner wrote:

> I recently got my kernel.org tree set up again, so I just applied
> this.

Thanks!  Glad to see more DEC syscalls flowing in.
