From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Sun, 13 Jun 2021 15:18:50 -0700
Message-ID: <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000000fabcb05c4ad21da"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RxQzyytN9Xv/POFiz8Y3R+utq4RPK0XbvLC7geKBN54=;
        b=eI/+uvMTqWinqnHgENJVOiH6LZbpPCrFa2vhgarfRXuzeG+COM4dVsEynMvTS6y/6Q
         LOq6njwdgJIYMLCwnwLTwRKUsWbB0E78FSxFRLi7qu5gVFnqwsbqt3rxLFr58x4618EA
         f3HhTPMdbHBxITRJM9ZQoRDK+/EXfCFm4KkTI=
In-Reply-To: <87sg1lwhvm.fsf@disp2133>
List-ID: <linux-alpha.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Tejun Heo <tj@kernel.org>, Daniel Jacobowitz <drow@nevyn.them.org>, Kees Cook <keescook@chromium.org>

--0000000000000fabcb05c4ad21da
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 13, 2021 at 2:55 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> The alpha_switch_to will remove the extra registers from the stack and
> then call ret which if I understand alpha assembly correctly is
> equivalent to jumping to where $26 points.  Which is
> ret_from_kernel_thread (as setup by copy_thread).
>
> Which leaves ret_from_kernel_thread and everything it calls without
> the extra context saved on the stack.

Uhhuh. Right you are, I think. It's been ages since I worked on that
code and my alpha handbook is somewhere else, but yes, when
alpha_switch_to() has context-switched to the new PCB state, it will
then pop those registers in the new context and return.

So we do set up the right stack frame for the worker thread, but as
you point out, it then gets used up immediately when running. So by
the time the IO worker thread calls get_signal(), it's no longer
useful.

How very annoying.

The (obviously UNTESTED) patch might be something like the attached.

I wouldn't be surprised if m68k has the exact same thing for the exact
same reason, but I didn't check..

                  Linus

--0000000000000fabcb05c4ad21da
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_kpvr1cy80>
X-Attachment-Id: f_kpvr1cy80

IGFyY2gvYWxwaGEva2VybmVsL3Byb2Nlc3MuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YWxwaGEva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvYWxwaGEva2VybmVsL3Byb2Nlc3MuYwppbmRl
eCA1MTEyYWI5OTYzOTQuLmVkYmZlMDNmNGIyYyAxMDA2NDQKLS0tIGEvYXJjaC9hbHBoYS9rZXJu
ZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gvYWxwaGEva2VybmVsL3Byb2Nlc3MuYwpAQCAtMjUxLDgg
KzI1MSwxNyBAQCBpbnQgY29weV90aHJlYWQodW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5z
aWduZWQgbG9uZyB1c3AsCiAKIAlpZiAodW5saWtlbHkocC0+ZmxhZ3MgJiAoUEZfS1RIUkVBRCB8
IFBGX0lPX1dPUktFUikpKSB7CiAJCS8qIGtlcm5lbCB0aHJlYWQgKi8KKwkJLyoKKwkJICogR2l2
ZSBpdCAqdHdvKiBzd2l0Y2ggc3RhY2tzLCBvbmUgZm9yIHRoZSBrZXJuZWwKKwkJICogc3RhdGUg
cmV0dXJuIHRoYXQgaXMgdXNlZCB1cCBieSBhbHBoYV9zd2l0Y2hfdG8sCisJCSAqIGFuZCBvbmUg
Zm9yIHRoZSAidXNlciBzdGF0ZSIgd2hpY2ggaXMgYWNjZXNzZWQKKwkJICogYnkgcHRyYWNlLgor
CQkgKi8KKwkJY2hpbGRzdGFjay0tOworCQljaGlsZHRpLT5wY2Iua3NwID0gKHVuc2lnbmVkIGxv
bmcpIGNoaWxkc3RhY2s7CisKIAkJbWVtc2V0KGNoaWxkc3RhY2ssIDAsCi0JCQlzaXplb2Yoc3Ry
dWN0IHN3aXRjaF9zdGFjaykgKyBzaXplb2Yoc3RydWN0IHB0X3JlZ3MpKTsKKwkJCTIqc2l6ZW9m
KHN0cnVjdCBzd2l0Y2hfc3RhY2spICsgc2l6ZW9mKHN0cnVjdCBwdF9yZWdzKSk7CiAJCWNoaWxk
c3RhY2stPnIyNiA9ICh1bnNpZ25lZCBsb25nKSByZXRfZnJvbV9rZXJuZWxfdGhyZWFkOwogCQlj
aGlsZHN0YWNrLT5yOSA9IHVzcDsJLyogZnVuY3Rpb24gKi8KIAkJY2hpbGRzdGFjay0+cjEwID0g
a3RocmVhZF9hcmc7Cg==
--0000000000000fabcb05c4ad21da--
