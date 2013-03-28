From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Thu, 28 Mar 2013 11:25:11 +0100
Message-ID: <20130328102511.GA4658@skade.schwarzvogel.de>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
 <BFB01C0A-95E5-4C2B-8AF2-A06BE1FF74E0@orcon.net.nz>
 <20130325133710.GD14280@mudshark.cambridge.arm.com>
 <20130325150958.GA13894@skade.schwarzvogel.de>
 <D7731577-A2C0-4FC5-A7E3-62F251A18798@orcon.net.nz>
 <20130327175631.GA99121@skade.schwarzvogel.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130327175631.GA99121@skade.schwarzvogel.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi! 

On a whim, I tried fiddling with ALPHA_LEGACY_START_ADDRESS.
While this necessitates switching the system type  to
GENERIC_ALPHA, it makes the whole thing work. I suspect the
change in segment size shifted stuff around enough to make the
DP264 layout a "legacy" one. 

Regards,
Tobias


-- 
Sent from aboard the Culture ship
	ROU (Killer-class) Trade Surplus
