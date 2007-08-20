From: Michal Piotrowski <michal.k.k.piotrowski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [2/2] 2.6.23-rc3: known regressions with patches v2
Date: Mon, 20 Aug 2007 18:02:17 +0200
Message-ID: <46C9BB09.30102@googlemail.com>
References: <46C9BA30.9020101@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kvm-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <46C9BA30.9020101-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kvm-devel>,
	<mailto:kvm-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kvm-devel>
List-Post: <mailto:kvm-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:kvm-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kvm-devel>,
	<mailto:kvm-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Sender: kvm-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Errors-To: kvm-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Dan Zwell <dzwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oliver Neukum <oliver-GvhC2dPhHPQdnm+yROfE0A@public.gmane.org>, Bob Tracy <rct-GsGdjl1a1FBK+8ot1e1MDQ@public.gmane.org>, linux-usb-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Paolo Ornati <ornati-dbx96nzIXN7OeuqD6ShaSA@public.gmane.org>, kvm-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Avi Kivity <avi-atKUWr5tajBWk0Htik3J/w@public.gmane.org>, Florin Iucha <florin-zX39fKdjKLBeoWH0uzbU5w@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Roman Jarosz <kedgedev-aRb0bU7PRFPrBKCeMvbIDA@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>

Hi all,

Here is a list of some known regressions in 2.6.23-rc3
with patches available.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

List of Aces

Name                    Regressions fixed since 21-Jun-2007
Adrian Bunk                            9
Andi Kleen                             5
Linus Torvalds                         5
Andrew Morton                          4
Al Viro                                3
Cornelia Huck                          3
Jens Axboe                             3
Tejun Heo                              3



Alpha

Subject         : 2.6.23-rc3 won't boot on alpha
References      : http://lkml.org/lkml/2007/8/14/487
Last known good : ?
Submitter       : Bob Tracy <rct-GsGdjl1a1FBK+8ot1e1MDQ@public.gmane.org>
Caused-By       : ?
Handled-By      : ?
Patch           : http://lkml.org/lkml/2007/8/14/259 ?
Status          : patch available



USB

Subject         : USB hard disk broken in 2.6.23-rc3
References      : http://bugzilla.kernel.org/show_bug.cgi?id=8892
Last known good : ?
Submitter       : Roman Jarosz <kedgedev-aRb0bU7PRFPrBKCeMvbIDA@public.gmane.org>
Caused-By       : ?
Handled-By      : Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Patch           : http://bugzilla.kernel.org/attachment.cgi?id=12432
Status          : patch was suggested

Subject         : USB hard disk problem due to "usb-storage: implement autosuspend" patch
References      : http://lkml.org/lkml/2007/8/9/329
Last known good : ?
Submitter       : Dan Zwell <dzwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Caused-By       : Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
                  commit 8dfe4b14869fd185ca25ee88b02ada58a3005eaf
Handled-By      : Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Patch           : http://lkml.org/lkml/2007/8/10/195
Status          : patch available



Virtualization

Subject         : WARNING: at arch/x86_64/kernel/smp.c:379 smp_call_function_single()
References      : http://lkml.org/lkml/2007/8/10/117
Last known good : ?
Submitter       : Paolo Ornati <ornati-dbx96nzIXN7OeuqD6ShaSA@public.gmane.org>
Caused-By       : Avi Kivity <avi-atKUWr5tajBWk0Htik3J/w@public.gmane.org>
                  commit cec9ad279b66793bee0b5009b7ca311060061efd
Handled-By      : Avi Kivity <avi-atKUWr5tajBWk0Htik3J/w@public.gmane.org>
Patch           : http://lkml.org/lkml/2007/8/19/38
Status          : patch available



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/

-------------------------------------------------------------------------
This SF.net email is sponsored by: Splunk Inc.
Still grepping through log files to find problems?  Stop.
Now Search log events and configuration files using AJAX and a browser.
Download your FREE copy of Splunk now >>  http://get.splunk.com/
