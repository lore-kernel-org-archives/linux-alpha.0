From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH 7/9] signal: Make individual tasks exiting a first class concept.
Date: Thu, 24 Jun 2021 16:37:19 -0500
Message-ID: <87a6nf54hc.fsf@disp2133>
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
        <87sg1lwhvm.fsf@disp2133>
        <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
        <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com>
        <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
        <87eed4v2dc.fsf@disp2133>
        <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
        <87fsxjorgs.fsf@disp2133>
        <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
        <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
        <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
        <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
        <87a6njf0ia.fsf@disp2133>
        <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
        <87tulpbp19.fsf@disp2133>
        <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
        <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133>
        <87y2az5bmt.fsf_-_@disp2133>
        <CAHk-=wg16ZBqtLngzE2edV8e68Qxje2kFehnKTrBBe5opcsj-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAHk-=wg16ZBqtLngzE2edV8e68Qxje2kFehnKTrBBe5opcsj-w@mail.gmail.com>
        (Linus Torvalds's message of "Thu, 24 Jun 2021 13:11:18 -0700")
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Michael Schmitz <schmitzmic@gmail.com>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Thu, Jun 24, 2021 at 12:03 PM Eric W. Biederman
> <ebiederm@xmission.com> wrote:
>>
>> Implement start_task_exit_locked and rewrite the de_thread logic
>> in exec using it.
>>
>> Calling start_task_exit_locked is equivalent to asyncrhonously
>> calling exit(2) aka pthread_exit on a task.
>
> Ok, so this is the patch that makes me go "Yeah, this seems to all go together".
>
> The whole "start_exit()" thing seemed fairly sane as an interesting
> concept to the whole ptrace notification thing, but this one actually
> made me think it makes conceptual sense and how we had exactly that
> "start exit asynchronously" case already in zap_other_threads().
>
> So doing that zap_other_threads() as that async exit makes me just
> thin kthat yes, this series is the right thing, because it not only
> cleans up the ptrace condition, it makes sense in this entirely
> unrelated area too.
>
> So I think I'm convinced. I'd like Oleg in particular to Ack this
> series, and Al to look it over, but I do think this is the right
> direction.

Thanks.

It took a bit of exploration and playing with things to get here,
but I had the same sense.

Next round I will see if I can clean up the patches a bit more.

Eric
