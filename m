From: Meelis Roos <mroos@linux.ee>
Subject: Re: ext4 corruption on alpha with 4.20.0-09062-gd8372ba8ce28
Date: Mon, 18 Feb 2019 14:37:24 +0200
Message-ID: <7ffcadd5-47b3-e44a-bd18-7e9f1a636f8d@linux.ee>
References: <fb63a4d0-d124-21c8-7395-90b34b57c85a@linux.ee>
 <1c26eab4-3277-9066-5dce-6734ca9abb96@linux.ee>
 <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
 <20190216174536.GC23000@mit.edu>
 <e175b885-082a-97c1-a0be-999040a06443@linux.ee>
 <20190218120209.GC20919@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218120209.GC20919@quack2.suse.cz>
Content-Language: et-EE
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Kara <jack@suse.cz>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org

> Hum, weird. I have hard time understanding how that change could be causing
> fs corruption on Aplha but OTOH it is not completely unthinkable. With this
> commit we may migrate some block device pages we were not able to migrate
> previously and that could be causing some unexpected issue. I'll look into
> this.

To make things more interesting, it does not happen on any alpha but only one subarch
so far: https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1889207.html
is my original bug report.

-- 
Meelis Roos <mroos@linux.ee>
