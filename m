From: "Oliver Pitzeier" <o.pitzeier@uptime.at>
Subject: RE: Root filesystem ext3
Date: Mon, 29 Sep 2003 17:38:36 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <001601c3869f$c08416f0$020b10ac@pitzeier.priv.at>
References: <oprv9o2wk1luaogu@mail.NairnConsulting.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <oprv9o2wk1luaogu@mail.NairnConsulting.ca>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Richard Nairn' <Richard@nairnconsulting.ca>, linux-alpha@vger.kernel.org

> Sorry, I meant to say I had used tunefs to upgrade it. It does have a 
> journal.. I am using 2.4.9-40 for a kernel. Can that not use 
> ext3 as a root filesystem?

I think 2.4.9-40 has ext3 support... You can check the options "-c" and "-i",
maybe there's something fucked up!?

Best,
 Oliver

