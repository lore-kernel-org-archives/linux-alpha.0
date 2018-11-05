From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v2 0/5] alpha: system call table generation support
Date: Mon, 5 Nov 2018 13:31:20 -0800
Message-ID: <CAEdQ38FckCWguy5MUYkjwhmc3eA30WXB5QNGaU2Yv8gjHvGc=A@mail.gmail.com>
References: <1541079817-3431-1-git-send-email-firoz.khan@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=es6sn83DsjZ2o3p3EMzKWdnO4TfOxjtYsgKkLaMwZW4=;
        b=QnGHu7jUyjhC82gNuz543MWkEKM0wLVVwXU6fqI27xDdVEc37Hfc/P6yLcoRNeFDZ8
         nnLuBi4BKEQF2fh3vBTMAUW5emapk8sNbbe20eJJ4kt8dXBX89gXdH6G0CwKolP48s50
         x8QOW3h9MfqCGx6mHXktB8jPqRXGxhWjiY7uLjnOXCiGTpWbgHX9xVYeo5Q9wgB2wyNG
         haaE/HcEBnJTvyjC3H3xLzfQBZ65NMYyYvkqrJH7HhQDWzM4Vx78cJ9I9l5z3MmKkvWy
         4wZRyVQWtM/5hfscVM6dhuL0JEi/GNtRMt+S6jxmu06bqJdZ9TCbMRe774Pie/a4zizH
         blwQ==
In-Reply-To: <1541079817-3431-1-git-send-email-firoz.khan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: firoz.khan@linaro.org
Cc: linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, Greg KH <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, y2038@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>, linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, deepa.kernel@gmail.com, marcin.juszkiewicz@linaro.org

On Thu, Nov 1, 2018 at 6:44 AM Firoz Khan <firoz.khan@linaro.org> wrote:
>
> The purpose of this patch series is, we can easily
> add/modify/delete system call table support by cha-
> nging entry in syscall.tbl file instead of manually
> changing many files. The other goal is to unify the
> system call table generation support implementation
> across all the architectures.
>
> The system call tables are in different format in
> all architecture. It will be difficult to manually
> add, modify or delete the system calls in the resp-
> ective files manually. To make it easy by keeping a
> script and which'll generate uapi header file and
> syscall table file.
>
> syscall.tbl contains the list of available system
> calls along with system call number and correspond-
> ing entry point. Add a new system call in this arch-
> itecture will be possible by adding new entry in the
> syscall.tbl file.

Sounds like a worthy goal.

I tried applying the patches and it seems they haven't been rebased
since v4.18. My rebases are in
https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git/log/?h=for-linus

They seem to work for me, FWIW.

Is your plan to have the patches go through the separate architecture
trees, or go in together? I think I'd at least prefer for another
architecture to take the plunge before alpha.
