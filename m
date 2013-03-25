From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Mon, 25 Mar 2013 16:09:58 +0100
Message-ID: <20130325150958.GA13894@skade.schwarzvogel.de>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
 <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
 <20130325133710.GD14280@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130325133710.GD14280@mudshark.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi! 

On Mon, 25 Mar 2013, Will Deacon wrote:
> Any news on these? I've included an updated version of the first patch, with
> the Tested-by-tag and a tweaked commit message below.

As a data point, I tried vanilla 3.8.4 on the weekend. With my
usual config on a UP1500, it will fail at build time with
relocation errors. If I remove -msmall-data (or replace it with
~big~), the machine hangs hard immediatly after aboot telling me
it's starting it. I'll take a closer look later today, but there
seems to be a very fundamental thing wrong with the startup code
in these scenarios.

Regards,
Tobias

-- 
"Brain, konban wa nani o shimashitai?"
"Your Japanese is terrible, Pinky."
