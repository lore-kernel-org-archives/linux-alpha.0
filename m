From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] Fix call to replaced SuperIO functions
Date: Sat, 07 Aug 2010 20:53:44 +1200
Message-ID: <4C5D1F18.9040105@orcon.net.nz>
References: <E1OfBMn-00058R-O4@mhlnet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <E1OfBMn-00058R-O4@mhlnet.dk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Morten Holst Larsen <m-larsen@post6.tele.dk>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, stable@kernel.org

On 01/08/10 00:40, Morten Holst Larsen wrote:
> Fix call to replaced SuperIO functions
>
> This patch fixes the failure to compile Alpha Generic because of
> previously overlooked calls to ns87312_enable_ide(). The function has
> been replaced by newer SuperIO code.
>
> Signed-off-by: Morten H. Larsen<m-larsen@post6.tele.dk>

Tested-by: Michael Cree <mcree@orcon.net.nz>

Applied to 2.6.35 and verified that the Alpha generic build compiles and 
is running on an Alpha.  (Well, there 's also a printf format compile 
error elsewhere in the build but that's a separate issue and I will soon 
get around to posting a patch for that.)

When accepted into mainline this should also go to the stable series.

Cheers
Michael.
