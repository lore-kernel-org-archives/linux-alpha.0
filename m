From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Will's kernel compilation error
Date: Tue, 16 Mar 2010 20:08:06 +1300
Message-ID: <4B9F2E56.2060303@orcon.net.nz>
References: <b4198de61003151609je8a94ceyf6dd39acfd1a5876@mail.gmail.com> <001e01cac4cc$98072ce0$c81586a0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <001e01cac4cc$98072ce0$c81586a0$@com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Will L Givens <wlgivens@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 16/03/10 18:50, Will L Givens wrote:
> It seems the problem, GPREL16, is pretty wide spread. I've tried building
> the drivers as modules, since that doesn't appear to be a problem *knock on
> wood* but one driver after another, after another, after another generates a
> new GPREL16 error! Raid0 drivers, numerous NetFilter modules, IR drivers
> (guess I can't use a Hauppauge card), and various other components. I'm
> going to try a few more configurations... then hit the sack. I'm pretty sure
> this is going to be a long process.

As has been suggested your best bet for help is to post your .config. 
If you don't want that publicly available then feel free to email it 
privately to Matt and myself.

FWIW, I have two Hauppauge cards (PVR350 card and a Nova-T-500 DVB-T 
card) in my Alpha, and have had no problems compiling the kernel, the 
ivtv modules, the DVB modules, and the IR modules.

If we cannot track down what you are doing differently than the rest of 
us, then there is little chance we can help you.

Cheers
Michael.
