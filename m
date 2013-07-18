From: Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC PATCH 00/10] Alpha support for QEMU
Date: Thu, 18 Jul 2013 15:04:25 -0700
Message-ID: <51E86669.5040608@twiddle.net>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net> <20130718011435.GA20007@stolen.phys.waikato.ac.nz> <51E7EFC6.6070003@twiddle.net> <20130718212815.GA32459@stolen.phys.waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=LPaELhKU+KtXUbGXIvQyAUL5HWqlzFM7h+SsyOSwXZ8=;
        b=zMMrFq2at387Vs6/NixroLqqdFNf46fDBx9Bjn8uhGWDDDVEefXjC4lwmR5fQmce/j
         kbLauE0xOiij06bEK2gbj0eXGX4MGxv+FXvc2GYgib3VKK/oPbt2KwE4A2nFwALuwc9U
         1cv8sErOqVLwDWjUaYzajojMkytM1wUL9H+lPzfMsAL5qDZbL2jYFlVcDjo/tqOq6z9q
         FaQQX5FS8v22LnIkjul2dKSPVL4Gb5fLVmnkjCrbojZno5bmfjsO0Oa8pneTwr7Q0YNk
         zRoPFuEMBx6SyC0ZfmejWyngtgccMKLKYZ7Gjt8LLNXLPq4UEVZZ+G6yHM4A4zNU3bMF
         4Kcg==
In-Reply-To: <20130718212815.GA32459@stolen.phys.waikato.ac.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <cree@waikato.ac.nz>
Cc: linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 07/18/2013 02:28 PM, Michael Cree wrote:
> The kernel without the patch set has the "Using epoch 2000" line and
> the kernel with the patch set is missing the "Using epoch 2000" line.

Ah hah.  You appear to be missing CONFIG_RTC_DRV_ALPHA in the new kernel, so
you have no support for the RTC at all.  Please re-try.

> On the kernel without the patch set the dummy-RTC timer interrupt received
> 30876 interrupts in a 30s period which is within measurement uncertainty of
> the expected 30*1024 = 30720 interrupts.
> 
> On the kernel with the patch set the dummy-RTC timer interrupt received 14419 
> interrupts on CPU-1, 13935 interrupts on CPU-2 and 2619 interrupts on CPU-3
> over a 30s period.

Grr.  Naturally, the old kernel obfuscates which timers are being delivered
where.  So a direct comparison doesn't appear possible.  But those separated
numbers seem uncomfortably low.

I've just pushed a new branch to

  git://github.com/rth7680/linux.git axp-qemu-7

Please try that with CONFIG_ALPHA_WTINT disabled.  I'd like to eliminate that
as a source of uncertainty for your system.


r~
