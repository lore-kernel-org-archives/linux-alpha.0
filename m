From: Mathieu Chouquet-Stringer <mchouque@free.fr>
Subject: Re: strncpy (maybe others) broken on Alpha
Date: Thu, 20 Apr 2006 22:55:55 +0200
Message-ID: <20060420205555.GA11502@bigip.bigip.mine.nu>
References: <20060419213129.GA9148@localhost> <20060419215803.6DE5BDBA1@gherkin.frus.com> <20060420101448.GA20087@localhost> <20060420171102.GA7272@localhost>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060420171102.GA7272@localhost>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, rth@twiddle.net

On Thu, Apr 20, 2006 at 07:11:02PM +0200, Mathieu Chouquet-Stringer wrote:
> And here's the output using gcc version 3.4.4 (Gentoo 3.4.4-r1,
> ssp-3.4.4-1.0, pie-8.7.8), note i didn't use flag except -Wall:

Same code compiled with 2.95.3 fails too (I'll be trying 4.1.0 just for
the kick of it, if it cross-compiles ok but I don't expect it to work
either).


PS: Richard, we're having troubles with at least one of your function
(strncpy) on alpha.  It appears it doesn't copy the source string
properly.
You can read a recap of the thread here:
http://groups.google.com/group/linux.kernel/browse_thread/thread/551729237671f997/11109932eae9fd93?tvc=2&q=group%3A*kernel*+strncpy+mathieu#11109932eae9fd93
-- 
Mathieu Chouquet-Stringer                           mchouque@free.fr

