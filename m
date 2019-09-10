From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
Date: Tue, 10 Sep 2019 08:35:32 +0200
Message-ID: <20190910063532.GB1579@gmail.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
 <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
 <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
 <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5pt4UqpgmKd7lVjRi+NEqddnmVHEYCiueawV+Qa/vQ=; b=gR8QlOtjTrC0rW
	+LwPE1uLwG4/RYFKwMC2EIf8DMBPX/spa7O4+EUTXR5I76Laz1JZeVmfA6DJVH0fsSmRnIlEMJloR
	rdWnBOyImFYngl9+oeLo1HA8I5P9es+iip9FqHSM07oV08ReOvybYzwifurg4PbJ/RO4l5fMZG8mM
	VLzLcjVlLJR1qKWAqRlJR3hyPaR+1zkKc8jw/jRro6zC0NeMZHlCiNyUOVZ3u/O6Y8ZHWC1DliRcU
	PHgw9m2dloA0sCeGaFkzX1u5+o+byvG5M8Lh6lH4zKYSwHHJ04JW8n5Mz5cLdO5W57GhwnDsYEGvt
	e0yD3HmnmK8NwzCgPmrg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9uC8BSyBqqvpBHr+UBJrMjpTjeLS9eaSkiimfXBOGmI=;
 b=RT2CZzYflWq0hJIviZ1qNiz7T8GR4+WUrisMZXe3m9cauTkqIyyVGGFPULrde7A02W
 tj7FplDkEllE02owPbUYDzEtapP1C48use/4kFc7fZZmFt/DdDZTI55D8qvOaO2r24Ne
 q4FNPrvlkjfx+lYW3lSYcZ69k2e463dcG9Y4rn+PPa/Glpr++eDfgJ8gFO5kdGQ+ZZAk
 nXhnUxrt/DhKZTkCCWYef7FPywkEzNn0z8LUShNXRMIkZZwOG/G3kJoXGIwG7zGeC0aS
 TI+DZ2QVgsA7VVK9EZCvbN7bPdpk9PkNXAPdUVWeWNcFfO4yiY8K5tj2pJUrGvJYeUSW
 9/rw==
Content-Disposition: inline
In-Reply-To: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Alexei Starovoitov <ast@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, Sep 7, 2019 at 10:42 AM Andy Lutomirski <luto@amacapital.net> wrote:
> >
> > Linus, you rejected resolveat() because you wanted a *nice* API
> 
> No. I rejected resoveat() because it was a completely broken garbage
> API that couldn't do even basic stuff right (like O_CREAT).
> 
> We have a ton of flag space in the new openat2() model, we might as
> well leave the old flags alone that people are (a) used to and (b) we
> have code to support _anyway_.
> 
> Making up a new flag namespace is only going to cause us - and users -
> more work, and more confusion. For no actual advantage. It's not going
> to be "cleaner". It's just going to be worse.

I suspect there is a "add a clean new flags namespace" analogy to the 
classic "add a clean new standard" XKCD:

	https://xkcd.com/927/

Thanks,

	Ingo
