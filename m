From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 19/23] y2038: use compat_{get,set}_itimer on alpha
Date: Mon, 2 Dec 2019 05:13:06 -0800
Message-ID: <20191202131306.GA6633@roeck-us.net>
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108211323.1806194-10-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WpIVdJ8zzeydWnGV0Hm0bnq5TGbHkB7RgM4W8WL7sQM=;
        b=ayWr/e+ojhqdyu94ajPFzL4M/3r8yrPBFpdu7nuiYbIwFygf5EZ9TGON0Us19wyU+g
         V68zxsz72/NemBDm2k+BI3fe74hktkIKR7RGb8FhuVdIZtsUYAw7o9e2HbuMfE8yCxLP
         88ucrHc5Me/bP5KjJwif2SovclkPZ5qqjqzxbAKDaCDcYj4vc/U/a0m9OR+cl8q3Fj56
         D5Y2983Lbri5rCyCKWUukztlOgyQ6Wt0kUxIREWGMUD5hqaqiOJiaUzdbkyr9k2SzZN+
         7Cud5lM13oPBVaDrrwFk6+S1C0Vv+gUzOBPptDT+WNZ7Qvzqf9Rl1ulx7/HUzxlCuB8s
         K94w==
Content-Disposition: inline
In-Reply-To: <20191108211323.1806194-10-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: y2038@lists.linaro.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Deepa Dinamani <deepa.kernel@gmail.com>, Christian Brauner <christian@brauner.io>, Heiko Carstens <heiko.carstens@de.ibm.com>, Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-alpha@vger.kernel.org

On Fri, Nov 08, 2019 at 10:12:18PM +0100, Arnd Bergmann wrote:
> The itimer handling for the old alpha osf_setitimer/osf_getitimer
> system calls is identical to the compat version of getitimer/setitimer,
> so just use those directly.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

alpha:allnoconfig, alpha:tinyconfig:

alpha-linux-ld: arch/alpha/kernel/systbls.o: in function `sys_call_table':
(.data+0x298): undefined reference to `compat_sys_setitimer'
alpha-linux-ld: (.data+0x2b0): undefined reference to `compat_sys_getitimer'

Guenter
