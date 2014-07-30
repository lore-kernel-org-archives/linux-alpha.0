From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 1/2] alpha: Remove "strange" OSF/1 fork semantics
Date: Wed, 30 Jul 2014 13:07:10 -1000
Message-ID: <53D97A9E.3090908@twiddle.net>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net>	<1406756552-23864-2-git-send-email-rth@twiddle.net> <yw1xk36u5wrf.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Ug3zd2IP94HzPTUB5HsMxSXhctkvPkoQZxLZPUUAEQQ=;
        b=s7tqs/2L1cn9CDw5gOwkLYjFADUjiwaSmP35L26+68eaHDYyDx3Jbz3KePoDHnsH0U
         x/SZJP9jac+bXqqIeN4layEWuQsVIHDPuFDsh6T7sm7L/dWZw5HZfVgZ3hMj6tZU7+85
         enRQnJDtxU1XKwoIGeFRpVrdP1RxYc6ZcMf7NJgt8Z25+cne75P8jy/OgZfKA7syZaq/
         Lngtlh6diToS67YOixf1ZP6rvsR9uQ3kn+9Y+2HhVTRiTl6+7ENIuAfkOmxPa1/a7k4B
         CSD9ypxYMEmaPtZXfvspZbbX4wE8Z22SAQVuOm9N8N8MTU3wrdZxy/GJ0WjptVj/26UO
         elYA==
In-Reply-To: <yw1xk36u5wrf.fsf@unicorn.mansr.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: linux-kernel@vger.kernel.org, mcree@orcon.net.nz, linux-alpha@vger.kernel.org

On 07/30/2014 12:04 PM, M=E5ns Rullg=E5rd wrote:
> Richard Henderson <rth@twiddle.net> writes:
>=20
>> The assignment to regs->r20 kills the original tls_val input
>> to the clone syscall, which means that clone can no longer be
>> restarted with the original inputs.
>>
>> We could, perhaps, retain this result for true fork, but OSF/1
>> compatibility is no longer important.  Note that glibc has never
>> used the r20 result value, instead always testing r0 vs 0 to
>> determine the child/parent status.
>=20
> What effect does this have on OSF/1 compat?

I don't know, as I've never had access to osf/1 myself.  It depends on =
how that
$20 value is used -- potentially, fork(3) no longer works.

I can imagine that we could retain these assignments under the conditio=
n of
clone_flags =3D=3D 0, which both implies a basic fork as well as the fa=
ct that the
tls_val argument is unused.

But I do have to ask first if anyone actually cares.  Surely the amount=
 of
osf-on-linux emulation is a vanishingly small proportion of the already=
 small
alpha-linux population.


r~
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
