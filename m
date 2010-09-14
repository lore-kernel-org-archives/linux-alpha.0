From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH next 01/16] arch/alpha: Use static const char * const
 where possible
Date: Tue, 14 Sep 2010 08:37:31 -0700
Message-ID: <4C8F96BB.2040609@twiddle.net>
References: <cover.1284435709.git.joe@perches.com> <3b211935182d8ac989fbdfde01fbdc25077151a9.1284435709.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <3b211935182d8ac989fbdfde01fbdc25077151a9.1284435709.git.joe@perches.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

On 09/13/2010 09:23 PM, Joe Perches wrote:
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  arch/alpha/kernel/err_ev6.c    |   12 +++++++-----
>  arch/alpha/kernel/err_marvel.c |   33 +++++++++++++++++----------------
>  arch/alpha/kernel/err_titan.c  |   35 ++++++++++++++++++++---------------
>  arch/alpha/kernel/osf_sys.c    |    4 ++--
>  4 files changed, 46 insertions(+), 38 deletions(-)

Acked-by: Richard Henderson  <rth@twiddle.net>


r~
