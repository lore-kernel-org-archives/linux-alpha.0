From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v15 0/9] open: introduce openat2(2) syscall
Date: Tue, 12 Nov 2019 15:01:26 -0800
Message-ID: <201911121457.7D02692@keescook>
References: <20191105090553.6350-1-cyphar@cyphar.com>
 <20191111132404.y523iqicbn6fivx5@yavin.dot.cyphar.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nExhpa8NtyhyvUyh20F6httON+9jpHubOC8X4R1/1QI=;
        b=c4HijsXEjZGJqE7HF/OLTdBXGVnY9qLmNBULMzMpbSwMDUdlWMyYkBAj7Jv9KvJQq9
         uQ/fhhX6CbwBVqkc6vhI0J9bVR6S+eypweTAwvYsABomRnDDk1wGcU2hJ/fV4/K6uu+1
         c9+G8zkVxO8gfkNV8xNJ/wUCIdP5veO1BJPEs=
Content-Disposition: inline
In-Reply-To: <20191111132404.y523iqicbn6fivx5@yavin.dot.cyphar.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Eric Biederman <ebiederm@xmission.com>, Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>, David Drysdale <drysdale@google.com>, Chanho Min <chanho.min@lge.com>, Oleg Nesterov <oleg@redhat.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>

On Tue, Nov 12, 2019 at 12:24:04AM +1100, Aleksa Sarai wrote:
> On 2019-11-05, Aleksa Sarai <cyphar@cyphar.com> wrote:
> > This patchset is being developed here:
> >   <https://github.com/cyphar/linux/tree/openat2/master>
> > 
> > Patch changelog:
> >  v15:
> >   * Fix code style for LOOKUP_IN_ROOT handling in path_init(). [Linus Torvalds]
> >   * Split out patches for each individual LOOKUP flag.
> >   * Reword commit messages to give more background information about the
> >     series, as well as mention the semantics of each flag in more detail.
> > [...]
> 
> Ping -- this patch hasn't been touched for a week. Thanks.

If I've been following correctly, everyone is happy with this series.
(i.e. Linus's comment appear to have been addressed.)

Perhaps the next question is should this go via a pull request by you to
Linus directly during the v5.5 merge window, via akpm, via akpm, via
Christian, or some other path? Besides Linus, it's not been clear who
should "claim" this series. :)

-- 
Kees Cook
