From: Venkatesh Pallipadi <venki@google.com>
Subject: Re: Matts tree, IRQ related warning
Date: Mon, 1 Nov 2010 10:27:44 -0700
Message-ID: <AANLkTikeuDe3-Bkjd8wsFm4=SQfrM_3_hHhy7Fo2=sY3@mail.gmail.com>
References: <EAE0CA1B516144649F164BBDA1D1EECD@morten>
	<4CCE6C35.2030706@orcon.net.nz>
	<1288612114.2039.11.camel@laptop>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1288632467; bh=R9Ei2qLvMvxlOHY0gzk9of6Xgm8=;
	h=MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	b=wkyE1HAlRjI1njI+1YtgTWn/PiJk64Z1OtIIg7bEo7nBW0jnL3gQW2B+KUoLElpCv
	 Ri0xQtAiDeSBy+giRPTnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=cfMFvkPYJ1OQOoonmGDjwgcu6r4MWgP3FX0ahRbO2o8=;
        b=OtM/zW4qv5RkqmBVyo++ICDswKf/OEF13UE8aq2V7Fs+s3kpD4MmQWtJ55VOhn22/U
         6MqALXrToJNcE9rq3RWA==
In-Reply-To: <1288612114.2039.11.camel@laptop>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Michael Cree <mcree@orcon.net.nz>, Morten Holst Larsen <mhl@mhlnet.dk>, linux-alpha@vger.kernel.org

On Mon, Nov 1, 2010 at 4:48 AM, Peter Zijlstra <a.p.zijlstra@chello.nl> wrote:
> On Mon, 2010-11-01 at 20:28 +1300, Michael Cree wrote:
>> > WARNING: at kernel/softirq.c:138 __local_bh_enable+0xac/0xc0()
>
> That's WARN_ON(!irqs_disabled()), right?
>
> How can that be, you're in the irq_enter path, the hardware should have
> disabled IRQs already, right?
>
>

Code snippet from arch/alpha/kernel/irq.c:handle_irq

        irq_enter();
        /*
         * __do_IRQ() must be called with IPL_MAX. Note that we do not
         * explicitly enable interrupts afterwards - some MILO PALcode
         * (namely LX164 one) seems to have severe problems with RTI
         * at IPL 0.
         */
        local_irq_disable();
        __do_IRQ(irq);
        irq_exit();


So, interrupt seems to be getting disabled after irq_enter and WARN_ON
with this change is coming from irq_enter.

Thanks,
Venki
