From: Richard Nairn <Richard@nairnconsulting.ca>
Subject: Re: Root filesystem ext3
Date: Mon, 29 Sep 2003 09:24:22 -0600
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <oprv9o2wk1luaogu@mail.NairnConsulting.ca>
References: <001501c3869c$32798230$020b10ac@pitzeier.priv.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <001501c3869c$32798230$020b10ac@pitzeier.priv.at>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oliver Pitzeier <o.pitzeier@uptime.at>, linux-alpha@vger.kernel.org

Sorry, I meant to say I had used tunefs to upgrade it. It does have a 
journal.. I am using 2.4.9-40 for a kernel. Can that not use ext3 as a 
root filesystem?


On Mon, 29 Sep 2003 17:13:06 +0200, Oliver Pitzeier <o.pitzeier@uptime.at> 
wrote:

>> Is an ext3 filesystem supported for the root filesystem? I am
>> running 7.1,
>> I have upgraded the boot, and my fstab shows it as ext3, but
>> if my server
>> goes down it insists on checking it fully... Suggestions?
>
> You have to bring an ext3 on it... Use tune2fs. See the man-pages for 
> more
> details....
>
> Just changing the fstab will not work. :) Also be sure, that you have 
> ext3
> enabled in your kernel. Check /etc/filesystems and /lib/modules/`uname
> -r`/kernel/ext3. And if you use initrd, it must be loaded at startup 
> (something
> with mkinitrd preload=ext3 ....). I hope you don't have a default 
> kernel? :)
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
