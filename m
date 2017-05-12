From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 1/2] alpha-module: Improve a size determination in
 module_frob_arch_sections()
Date: Fri, 12 May 2017 06:04:40 +0100
Message-ID: <20170512050440.GO390@ZenIV.linux.org.uk>
References: <21258632-0cde-f750-5864-406dc6dfad20@users.sourceforge.net>
 <7e1572c7-8c8e-7b1b-ae56-cbdf1ad23fbc@users.sourceforge.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7e1572c7-8c8e-7b1b-ae56-cbdf1ad23fbc@users.sourceforge.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, May 11, 2017 at 01:54:42PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 May 2017 12:54:29 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.

It's also making it harder to grep for.  For the record: any patches of
that sort in VFS will be dropped.  Preferably - on their author's toes,
after forcing said author to engrave them on bricks.  Ideally - lead ones...
