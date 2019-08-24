From: Daniel Colascione <dancol@google.com>
Subject: Re: [PATCH RESEND v11 7/8] open: openat2(2) syscall
Date: Sat, 24 Aug 2019 13:17:33 -0700
Message-ID: <CAKOZuesfxRBJe314rkTKXtjXdz6ki3uAUBYVbu5Q2rd3=ADphQ@mail.gmail.com>
References: <20190820033406.29796-1-cyphar@cyphar.com> <20190820033406.29796-8-cyphar@cyphar.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0zfEO+Of97f0VCldvVRJl3jzEF01O6soGli/loZclzk=;
        b=CiJfEFfo1GhUFTvULOmIWC5bky0UhNotA9EofhxO4+2Cd9KvnmBRPB6hGuQFhuAXwJ
         Mf7+XdP/Zb4xXtjIaOfMfbMaQpe98nHR1WFAIDUqUl6lSfoh5N6YkchHMEss2Z7wmXRv
         mIN1BXAFZpi+SynQvspsYrZxrH8jV01EUoqVt4oI5oVTwO6tctGVNu+Gx+DZX4YcnnWT
         pUO0Oeafs9qrk8HXoIhQUWukfn1efWZ6t1CZQkpVU6dxRoB/3gD8bO7d0APRfzkEuP01
         6A3Oop2AiXmYSlChvGG9uj5KK5z6ZoLIIlfJYts9owMo4k3T92eSIqfy7wB0W5m6uFPz
         fndA==
In-Reply-To: <20190820033406.29796-8-cyphar@cyphar.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Christian Brauner <christian@brauner.io>, Eric Biederman <ebiederm@xmission.com>, Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexei Starovoitov <ast@kernel.org>, Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>, David Drysdale <drysdale@google.com>, Chanho Min <chanho.min@lge.com>, Oleg Nesterov <oleg@redhat.com>, Aleksa Sarai <asarai@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, containers@lists.linux-f

On Mon, Aug 19, 2019 at 8:37 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> The most obvious syscall to add support for the new LOOKUP_* scoping
> flags would be openat(2). However, there are a few reasons why this is
> not the best course of action:
>
>  * The new LOOKUP_* flags are intended to be security features, and
>    openat(2) will silently ignore all unknown flags. This means that
>    users would need to avoid foot-gunning themselves constantly when
>    using this interface if it were part of openat(2). This can be fixed
>    by having userspace libraries handle this for users[1], but should be
>    avoided if possible.
>
>  * Resolution scoping feels like a different operation to the existing
>    O_* flags. And since openat(2) has limited flag space, it seems to be
>    quite wasteful to clutter it with 5 flags that are all
>    resolution-related. Arguably O_NOFOLLOW is also a resolution flag but
>    its entire purpose is to error out if you encounter a trailing
>    symlink -- not to scope resolution.
>
>  * Other systems would be able to reimplement this syscall allowing for
>    cross-OS standardisation rather than being hidden amongst O_* flags
>    which may result in it not being used by all the parties that might
>    want to use it (file servers, web servers, container runtimes, etc).
>
>  * It gives us the opportunity to iterate on the O_PATH interface. In
>    particular, the new @how->upgrade_mask field for fd re-opening is
>    only possible because we have a clean slate without needing to re-use
>    the ACC_MODE flag design nor the existing openat(2) @mode semantics.
>
> To this end, we introduce the openat2(2) syscall. It provides all of the
> features of openat(2) through the @how->flags argument, but also
> also provides a new @how->resolve argument which exposes RESOLVE_* flags
> that map to our new LOOKUP_* flags. It also eliminates the long-standing
> ugliness of variadic-open(2) by embedding it in a struct.
>
> In order to allow for userspace to lock down their usage of file
> descriptor re-opening, openat2(2) has the ability for users to disallow
> certain re-opening modes through @how->upgrade_mask. At the moment,
> there is no UPGRADE_NOEXEC. The open_how struct is padded to 64 bytes
> for future extensions (all of the reserved bits must be zeroed).

Why pad the structure when new functionality (perhaps accommodated via
a larger structure) could be signaled by passing a new flag? Adding
reserved fields to a structure with a size embedded in the ABI makes a
lot of sense --- e.g., pthread_mutex_t can't grow. But this structure
can grow, so the reservation seems needless to me.
