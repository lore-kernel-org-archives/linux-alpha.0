From: Matt Turner <mattst88@gmail.com>
Subject: Re: getxpid() parent lookup is broken
Date: Tue, 29 May 2012 00:55:10 -0400
Message-ID: <CAEdQ38Ht3bVH1C=xngKtKxHAu2ZJo2n223zQu+Oo=khwm6NdeQ@mail.gmail.com>
References: <1285475695.2697.202.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=E78lAvoEu+1asZtoGa67B0m3TGyZ978UszHk3keGtTo=;
        b=mKutWjjZq2FdPh6XaE56BcrOb+7VoWr15F+WFf91suLWMuDXRVP1aD8O1kc8blMRHO
         OtrNJA1Gjb6YqWm54lBQ1+Xmlc5rVcdTTNuGQo/qBPRxWcXqG2qaN6L2XBVdbItRlMI4
         h/QOZ+Db85ty8X7if5athj/AsdrtMZJO+2hEZwtMqnKjyrEw8UurehnEyxT9hktefjPi
         Podp01mq+t6YPgCxgbyUuhbPQdIKPq4uWmSjcYVuzz1hv2BDQ7cOiZeFejjzKCt9omtk
         yqPnRZF+vweFdA5eu5VYiFzSr9prZei/TK1pssRkBfbM4mWcf9VQ0cvvZzVuhBKc/CEk
         jIwg==
In-Reply-To: <1285475695.2697.202.camel@localhost>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ben Hutchings <ben@decadent.org.uk>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org, Tobias Klausmann <klausman@gentoo.org>, Michael Cree <mcree@orcon.net.nz>

On Sun, Sep 26, 2010 at 12:34 AM, Ben Hutchings <ben@decadent.org.uk> w=
rote:
> I noticed that Tomoyo doesn't build on Alpha because Tomoyo tries to
> call sys_getpid() and sys_getppid(). =A0That's a bug in Tomoyo, but w=
hen I
> looked at why Alpha is different I found that the implementation of
> getxpid() hasn't been kept in sync getppid() for other architectures =
and
> is presumably now incorrect.
>
> sys_getppid():
> =A0 =A0 =A0 =A0rcu_read_lock();
> =A0 =A0 =A0 =A0pid =3D task_tgid_vnr(current->real_parent);
> =A0 =A0 =A0 =A0rcu_read_unlock();
>
> task_tgid_vnr(current->real_parent) expands through various inline
> functions to:
>
> pid_nr_ns(current->real_parent->group_leader->pids[PIDTYPE_PID].pid,
> =A0 =A0 =A0 =A0 =A0current->nsproxy->pid_ns)
>
> sys_getxpid():
> =A0 =A0 =A0 =A0/* See linux/kernel/timer.c sys_getppid for discussion
> =A0 =A0 =A0 =A0 =A0 about this loop. =A0*/
> =A0 =A0 =A0 =A0ldq =A0 =A0 $3, TASK_GROUP_LEADER($2)
> =A0 =A0 =A0 =A0ldq =A0 =A0 $4, TASK_REAL_PARENT($3)
> =A0 =A0 =A0 =A0ldl =A0 =A0 $0, TASK_TGID($2)
> 1: =A0 =A0 =A0ldl =A0 =A0 $1, TASK_TGID($4)
> #ifdef CONFIG_SMP
> =A0 =A0 =A0 =A0mov =A0 =A0 $4, $5
> =A0 =A0 =A0 =A0mb
> =A0 =A0 =A0 =A0ldq =A0 =A0 $3, TASK_GROUP_LEADER($2)
> =A0 =A0 =A0 =A0ldq =A0 =A0 $4, TASK_REAL_PARENT($3)
> =A0 =A0 =A0 =A0cmpeq =A0 $4, $5, $5
> =A0 =A0 =A0 =A0beq =A0 =A0 $5, 1b
> #endif
>
> The comment is obviously out-of-date. =A0This isn't following RCU pro=
tocol
> and it isn't namespace-aware. =A0I think it needs to be turned into a
> wrapper for the generic code.
>
> Ben.
>
> --
> Ben Hutchings
> Once a job is fouled up, anything done to improve it makes it worse.

Hi Ben, Al,

I recently looked at this gentoo bug --
https://bugs.gentoo.org/show_bug.cgi?id=3D405829 and then came across
this email and the two patches. They seem possibly related.

It looks like Al said he thought he had a better way of fixing the
problem, but then I'm not sure if his patches surfaced or not.

Also possibly related, Tobias and Michael have seen some RCU stalls
with recent kernels. Looks like getxpid needs an update?

Thanks,
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
