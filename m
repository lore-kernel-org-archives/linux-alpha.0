From: Richard Nairn <Richard@nairnconsulting.ca>
Subject: Re: Root filesystem ext3
Date: Mon, 29 Sep 2003 09:44:38 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <oprv9p0odnluaogu@mail.NairnConsulting.ca>
References: <001601c3869f$c08416f0$020b10ac@pitzeier.priv.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <001601c3869f$c08416f0$020b10ac@pitzeier.priv.at>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oliver Pitzeier <o.pitzeier@uptime.at>, linux-alpha@vger.kernel.org

ext3 gets loaded as a module, maybe it hasn't loaded it before it gets to 
mounting root?  I will try compiling a newer kernel and use initrd... Does 
the kernel compile with ccc?


On Mon, 29 Sep 2003 17:38:36 +0200, Oliver Pitzeier <o.pitzeier@uptime.at> 
wrote:

>> Sorry, I meant to say I had used tunefs to upgrade it. It does have a
>> journal.. I am using 2.4.9-40 for a kernel. Can that not use
>> ext3 as a root filesystem?
>
> I think 2.4.9-40 has ext3 support... You can check the options "-c" and 
> "-i",
> maybe there's something fucked up!?
>
> Best,
>  Oliver
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
|       Richard Nairn          Specializing in Linux
|     Nairn Consulting         Web / Database Solutions
|        Calgary, AB
| Richard@NairnConsulting.ca
