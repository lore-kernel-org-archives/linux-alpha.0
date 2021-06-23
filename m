From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
Date: Wed, 23 Jun 2021 17:26:22 +1200
Message-ID: <55bdad37-187b-e1f5-a359-c5206b20ff4d@gmail.com>
References: <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133>
 <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <YNDsYk6kbisbNy3I@zeniv-ca.linux.org.uk>
 <CAHk-=wh82uJ5Poqby3brn-D7xWbCMnGv-JnwfO0tuRfCvsVgXA@mail.gmail.com>
 <YNEfXhi80e/VXgc9@zeniv-ca.linux.org.uk>
 <CAHk-=wjtagi3g5thA-T8ooM8AXcy3brdHzugCPU0itdbpDYH_A@mail.gmail.com>
 <87h7hpbojt.fsf@disp2133> <20c787ec-4a3c-061c-c649-5bc3e7ef0464@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=cn5envrgx5GAtu7W+COJVqITqJD+Wu8CREApOZRkqO8=;
        b=F04KpScvxEheYc8J+kj6npBZrB1QkG3uPUJUEAd9HSr+Fr/FOVvBk+txbsFbiCy0Dl
         1rXk5hFjSNLWjBumIazVLVTJqxFdQg/Rh0vPJxAQnDgB1TGnfVZ9WHCdaD/QrBoR4otC
         Mk65Lz7xwkKYaBJVQ7c9lOaD+sp/MW0rmUsV6cYp/VCjUxBHv9dAiXbMFHnsz64pkdJE
         jQTKq2GiiLcDZ3fxss/KUXQW1G2jmA5JodTwGY5rGuTDfMI2TcOchMGpAJpeXf9uIW8v
         Yx78DKad7rEWxzb8DJeOag8tt+C9WrJNjigo5zxsu0PCnFiGtLJeLYErU9YRfInKkpYO
         RVTA==
In-Reply-To: <20c787ec-4a3c-061c-c649-5bc3e7ef0464@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Eric W. Biederman" <ebiederm@xmission.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@kernel.org>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Hi Eric,

Am 23.06.2021 um 09:48 schrieb Michael Schmitz:
>>
>> The challenging ones are /proc/pid/syscall and seccomp which want to see
>> all of the system call arguments.  I think every architecture always
>> saves the system call arguments unconditionally, so those cases are
>> probably not as interesting.  But they certain look like they could be
>> trouble.
>
> Seccomp hasn't yet been implemented on m68k, though I'm working on that
> with Adrian. The sole secure_computing() call will happen in
> syscall_trace_enter(), so all system call arguments have been saved on
> the stack.
>
> Haven't looked at /proc/pid/syscall yet ...

Not supported at present (no HAVE_ARCH_TRACEHOOK for m68k). And the 
syscall_get_arguments I wrote for seccomp support only copies the first 
five data registers, which are always saved.

Cheers,

	Michael
