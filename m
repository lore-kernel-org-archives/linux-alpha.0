From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: Root filesystem ext3
Date: Mon, 29 Sep 2003 17:13:06 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <001501c3869c$32798230$020b10ac@pitzeier.priv.at>
References: <oprv9nepvgluaogu@mail.NairnConsulting.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <oprv9nepvgluaogu@mail.NairnConsulting.ca>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Richard Nairn' <Richard@nairnconsulting.ca>, linux-alpha@vger.kernel.org

> Is an ext3 filesystem supported for the root filesystem? I am 
> running 7.1, 
> I have upgraded the boot, and my fstab shows it as ext3, but 
> if my server 
> goes down it insists on checking it fully... Suggestions?

You have to bring an ext3 on it... Use tune2fs. See the man-pages for more
details....

Just changing the fstab will not work. :) Also be sure, that you have ext3
enabled in your kernel. Check /etc/filesystems and /lib/modules/`uname
-r`/kernel/ext3. And if you use initrd, it must be loaded at startup (something
with mkinitrd preload=ext3 ....). I hope you don't have a default kernel? :)

Best,
 Oliver

