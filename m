From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/1] task_work: Add local_irq_enable() into task_work_run()
Date: Sat, 13 Oct 2012 10:09:36 +0900
Message-ID: <CA+55aFwXiu1znTkksgSyxa7v1-3cPWZL5dvth_8hQygSKE1utw@mail.gmail.com>
References: <20121006204736.GA1830@ds20.borg.net> <20121012160337.GA30881@redhat.com>
 <20121012160359.GB30881@redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=jTRG6vNzknWgu49RL+cZqJRXpB1hY1WyIIaq+eF69Z4=;
        b=ZykV4aOB5Wj+BIBdDZDm6jY1LK+tAjeR20CuG6uBJd363rCcZpRa//Wkz7Bj1lOCK8
         ek1yHZIhMq2S5rkx982nX2v1/wZprYkJCB7uWYZVCaXaT38ieqwppnAHfmJPB9eiC/IQ
         B7/aQjDokFwgPdZ9fj4zYARFdEkWuxyq0O7dU+3QYsiEyfocWUqbkwohsgTuZPLiujVk
         7qobRhaOmpsuTyztgD47j3vQqSXyc+HJX/QX9sAR5MbCegaVROSSJjmeuB/md3i5OFmS
         3TjxVamvDZ6rOps5kyFWGSjXgQhsWxMz/seCkjvtJWZ4NOMYuakvjg2bAz3jDyx98zcc
         NVPQ==
In-Reply-To: <20121012160359.GB30881@redhat.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: dl8bcu@dl8bcu.de, peterz@infradead.org, mingo@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Sat, Oct 13, 2012 at 1:03 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> arch/alpha and probably some other architectures call
> do_notify_resume()->task_work_run() with irqs disabled.

I'm going to ignore this patch because I *hope* it is unnecessary
after the pull from Al that I just did.

But if that turns out to be not the case, please holler. Torsten, you
seem to be the one who reported this, can you check the current git
tree?

Thanks,

               Linus
