From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: relocation truncated to fit: GPREL16 against `.sbss'
Date: Thu, 28 Mar 2013 17:09:03 +1300
Message-ID: <30352957-7402-4F4D-883A-748EC5E3744D@orcon.net.nz>
References: <20130328035943.GC18866@thor.bakeyournoodle.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20130328035943.GC18866@thor.bakeyournoodle.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Tony Breeds <tony@bakeyournoodle.com>
Cc: Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 28/03/2013, at 4:59 PM, Tony Breeds wrote:
> 	I build the cross-compilers on kernel.org and those used for
> linux-next.  It seems linux-next is using an older (4.3.3) gcc because
> if we use a newer one we get several errors like the on in $subject.
>
> In http://marc.info/?l=linux-arch&m=133580603202270&w=2
> Matt explained that it was due to the kernel being to big to fit be
> compiled with -msmall-data.  I was wondering if there is any  
> possibility
> of correcting that?

We have a patch to remove the -msmall-data which I shall be forwarding  
to Linus in the next couple or so days.  That will fix the relocation  
errors for those using recent gcc compilers.

Cheers
Michael.

