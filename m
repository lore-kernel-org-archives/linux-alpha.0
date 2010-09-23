From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [stable] [PATCH 1/3] Fix call to replaced SuperIO functions
Date: Fri, 24 Sep 2010 08:56:31 +1200
Message-ID: <409546BE-5A3D-4736-8751-F01F5C313194@orcon.net.nz>
References: <1284005311-15698-1-git-send-email-mattst88@gmail.com> <20100923183907.GT23040@kroah.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20100923183907.GT23040@kroah.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Greg KH <greg@kroah.com>
Cc: Matt Turner <mattst88@gmail.com>, stable@kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, linux-alpha@vger.kernel.org

Greg,

In addition to the patch below could we also get:

3e073367a57d41e506f20aebb98e308387ce3090 alpha: Fix printk format errors

added to the 2.6.35 stable queue.  It fixes a compile error when  
compiling a generic Alpha kernel without the legacy boot option.

Thanks
Michael.

On 24/09/2010, at 6:39 AM, Greg KH wrote:

> On Thu, Sep 09, 2010 at 12:08:31AM -0400, Matt Turner wrote:
>> From: Morten H. Larsen <m-larsen@post6.tele.dk>
>>
>> This patch fixes the failure to compile Alpha Generic because of
>> previously overlooked calls to ns87312_enable_ide(). The function has
>> been replaced by newer SuperIO code.
>>
>> Tested-by: Michael Cree <mcree@orcon.net.nz>
>> Signed-off-by: Morten H. Larsen <m-larsen@post6.tele.dk>
>> Signed-off-by: Matt Turner <mattst88@gmail.com>
>> ---
>> This is a build fix for a regression introduced by  
>> 932e0c201d28a728e25d3b64.
>> It therefore only applies to 2.6.35-stable.
>
> Why isn't it also relevant to Linus's tree for .36 and beyond?
>
> Or is this the same as 59b25ed91400ace98d6cf0d59b1cb6928ad5cd37 in
> Linus's tree?  If so, please let me know that, it's important.  I've
> gone and applied that commit, if that is incorrect, please let me  
> know.
>
> thanks,
>
> greg k-h
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

