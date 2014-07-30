From: Richard Henderson <rth@twiddle.net>
Subject: Re: Bug: retry of clone() on Alpha can result in zeroed process thread
 pointer
Date: Wed, 30 Jul 2014 07:56:02 -1000
Message-ID: <53D931B2.4000709@twiddle.net>
References: <20140723085244.GB4799@omega> <53D81EF1.5030306@twiddle.net> <20140730045117.GD2262@stolen.phys.waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=njsEaXT3AKbUG2+9DKTnGi8it1LZmxOzC4aB9pMaDdw=;
        b=baTv+F8JeBnCnESYt5KzUBXMbAdZdft8biJGCLtbW5acp8xeq2PsKxaeVfaz8TpQfw
         XErCMj1O3ESCPnqkJ/aRBgYLAwBumyDvToKFbzqICzjePvtMtZ0QE80Hu54OAuB7B/vf
         6rTJbUOOHiLUrdSQjtLVEUp58xEqFERHdGuc1dOuX7tx14TEBlsoZyVsfh3uIHJniqHt
         Iohv9L+rr7rhWCXmOTFECcfFsUTyYLfh/5xyjkDLukPWsLFNNiRDyaJZjmnPLH0Xg1RR
         rhlI24aG2q2sfk7Gov83hT3LMGxbftF1B/FgwMR1w3sTy+j0Z0+q9YsztLrXPmYvLTV3
         bg/g==
In-Reply-To: <20140730045117.GD2262@stolen.phys.waikato.ac.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org

On 07/29/2014 06:51 PM, Michael Cree wrote:
> On Tue, Jul 29, 2014 at 12:23:45PM -1000, Richard Henderson wrote:
>> I don't think this will help, but it's worth a test, prior to totally
>> re-writing entry.S.  There's a chance of confusion of the value of regs->r0 if
>> there is in fact no error.
> 
> No, it did not help.  The glibc nptl/tst-eintr3 test still occassionally
> sefgaults and that is occurring because rduniq returned a NULL pointer.

Another try.


r~



diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 6cec288..2d6c0e4 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -518,6 +518,7 @@ do_signal
                        case ERESTART_RESTARTBLOCK:
                                /* Set v0 to the restart_syscall and replay */
                                regs->r0 = __NR_restart_syscall;
+                               regs->r19 = r19;
                                regs->pc -= 4;
                                break;
                        }

