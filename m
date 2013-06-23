From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 31/45] alpha/smp: Use get/put_online_cpus_atomic() to
 prevent CPU offline
Date: Sun, 23 Jun 2013 10:50:42 -0700
Message-ID: <CAEdQ38HLzNoRABCUR7tEoBLJWn86xSd2VfSHxs0MPj5r5GvTXQ@mail.gmail.com>
References: <20130623133642.19094.16038.stgit@srivatsabhat.in.ibm.com> <20130623134516.19094.57189.stgit@srivatsabhat.in.ibm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=q+eaf7ptdMnrGW5p4+mSJQVppX4Z2MU8RowSwW0X1mg=;
        b=MN7d9aYOJeF/iYKwhWAq8U+esUCPidtnku9nCvqN9dOpPdou5ayToLTwwRsymMluL3
         CNvD0476F50ko5vq6ze2BLnjidJccrDgequspH/CVEIKPb/MBFjjuvBi3W8mRSK/cOh0
         oDLv/BffvLUjc/RD9U4ZdbMzao2Zy66a23qBfIOSEq6+QxUXXxxb69X6n6XVjWZQkh+6
         o5NWRsbaJv9qfXyQSnxSlYfniluc9zM23UEIMTZcqR6x4vYCN7bNXL2v0Y7xnalr1WqN
         Onq9kUGhrkPN2tNr+0viuJOQxJ0Z8FXfG7BrUyRx14W2OXa17ucE3he95IJ6vgBmvFf7
         gs0g==
In-Reply-To: <20130623134516.19094.57189.stgit@srivatsabhat.in.ibm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: tglx@linutronix.de, peterz@infradead.org, tj@kernel.org, oleg@redhat.com, paulmck@linux.vnet.ibm.com, rusty@rustcorp.com.au, mingo@kernel.org, akpm@linux-foundation.org, namhyung@kernel.org, walken@google.com, vincent.guittot@linaro.org, laijs@cn.fujitsu.com, rostedt@goodmis.org, wangyun@linux.vnet.ibm.com, xiaoguangrong@linux.vnet.ibm.com, sbw@mit.edu, fweisbec@gmail.com, zhong@linux.vnet.ibm.com, nikunj@linux.vnet.ibm.com, linux-pm@vger.kernel.org, linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Sun, Jun 23, 2013 at 6:45 AM, Srivatsa S. Bhat
<srivatsa.bhat@linux.vnet.ibm.com> wrote:
> Once stop_machine() is gone from the CPU offline path, we won't be able
> to depend on disabling preemption to prevent CPUs from going offline
> from under us.
>
> Use the get/put_online_cpus_atomic() APIs to prevent CPUs from going
> offline, while invoking from atomic context.
>
> Also, remove the non-ASCII character present in this file!

It's not non-ASCII. It's a page break.
