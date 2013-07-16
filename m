From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 3/7] alpha: Modernize lib/mpi/longlong.h
Date: Tue, 16 Jul 2013 11:55:40 -0700
Message-ID: <51E5972C.4060306@twiddle.net>
References: <1373994280-12047-1-git-send-email-rth@twiddle.net>  <1373994280-12047-4-git-send-email-rth@twiddle.net> <1373995159.1949.8.camel@joe-AO722>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=oYFtyJMWa8wweMqsK/VhXr7B727HSO1wlcQQ1weWveQ=;
        b=WHD2KOsB9XgT580mhYo9ky6F15Z8KQTqEtcy9sHb3yhkz0tE+JFGpfmzgDhms0wD9z
         Zc59ybGylfVFyIyU+gN82YPDAZPGljZLq7wJ/mXKsJctBDIAGv0FzwRbambyKpeSIS6t
         FevTsssQ1OSj++kU2GGstU+lBwmjm4CySiyfc19hfq2yQkoEoSs4JFBUiT/Xsj57tLzy
         3I+ZSgNPwun8bQKu8hXi6JtpweXxvUOjwSm6iZTb7nMN5DqWbDGZ547oXUEZmQx1mELq
         mlq5LNYnO2Yo7UyVaNIsFtZNrGya1iVtVUq1bo+X+vVMVNSg6BlJq0Jco5u6l3ZDYCW0
         pUvA==
In-Reply-To: <1373995159.1949.8.camel@joe-AO722>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 07/16/2013 10:19 AM, Joe Perches wrote:
> On Tue, 2013-07-16 at 10:04 -0700, Richard Henderson wrote:
>> Remove the compile warning for __udiv_qrnnd not having a prototype.
>> Use the __builtin_alpha_umulh introduced in gcc 4.0.
> 
> Isn't gcc 3.x still a supported compiler?

Further investigation shows the builtin was added for gcc 3.2.
I just failed to update gcc's own longlong.h til 3 years later.

r~
