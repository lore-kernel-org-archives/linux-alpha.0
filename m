From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
Date: Sat, 7 Feb 2015 16:18:14 -0800
Message-ID: <CAEdQ38FENfS2V-=Wu1fUsHMsoMWa1WWtoUm6i1HmEBfmTqTy3g@mail.gmail.com>
References: <1423274934-10625-1-git-send-email-mathieu.desnoyers@efficios.com>
 <20150207221625.GB31119@kroah.com> <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=ikZpCmGliXdx7UQx6wJyupKkJKUqWkBkDYGAnECySoU=;
        b=hGB2Z/wCOT03LUH4FRfIK4P7iQSVHRReQo4DgS+8882RvyJRsuodCkCltuSEHICbQd
         yYbZFPV15DAW/QIgc3RzNs5IKHg/EM9zRNO2esKZWAinpqDXo3Jt45zRxQ9qIKsuIfGg
         zs2Me4ELSTNvfXn/V7OBsreBMlNHl/2NVwqhFr59kSNDH/wXbxbMs+i/22a3YDLfOmSc
         5QjPFvbc4VH+4G05DtFsCYlgmH6I2iHuZw2J/Q2ykvpN3BgQjyxpg/xeFIHIoUGzY6dR
         296v7nxOt9fqMOcbEiRl7JmEiWzjGHCl5JZ7aSXk3VQ6GbOiONKmrtOPQN4rdW+2GbVX
         vTlA==
In-Reply-To: <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Huang Ying <ying.huang@intel.com>, LKML <linux-kernel@vger.kernel.org>, Paul McKenney <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Pranith Kumar <bobby.prani@gmail.com>, stable@vger.kernel.org

On Sat, Feb 7, 2015 at 2:30 PM, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> ----- Original Message -----
>> From: "Greg KH" <gregkh@linuxfoundation.org>
>> To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
>> Cc: "Huang Ying" <ying.huang@intel.com>, linux-kernel@vger.kernel.org, "Paul McKenney" <paulmck@linux.vnet.ibm.com>,
>> "David Howells" <dhowells@redhat.com>, "Pranith Kumar" <bobby.prani@gmail.com>, stable@vger.kernel.org
>> Sent: Saturday, February 7, 2015 5:16:25 PM
>> Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
>>
>> On Fri, Feb 06, 2015 at 09:08:21PM -0500, Mathieu Desnoyers wrote:
>> > A lockless_dereference() appears to be missing in llist_del_first().
>> > It should only matter for Alpha in practice.
>>
>> Meta-comment, do we really care about Alpha anymore?  Is it still
>> consered an "active" arch we support?  I haven't seen a single
>> alpha-related stable patch in _years_ if at all, which implies to me
>> that no one is even using it.
>>
>> Not that stable patches for architectures are a valid reference for how
>> much they are used, but it does give me a good indication of what arches
>> have users that actually care about a modern (i.e. within the past 5
>> years) kernel.
>
> Good question. Adding the Alpha maintainers to the CC.
>
> Thanks,
>
> Mathieu

Hello,

Yes, Gentoo has a maintained Alpha port. We care about having modern
kernels (though I have not personally had a lot of time to work on
that recently)

Thanks,
Matt
