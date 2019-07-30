From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] alpha: Replace strncmp with str_has_prefix
Date: Mon, 29 Jul 2019 19:51:05 -0700
Message-ID: <3ec468adbd632c2e435c618a1027c4e6c8f97e38.camel@perches.com>
References: <20190730024401.17152-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730024401.17152-1-hslester96@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuhong Yuan <hslester96@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2019-07-30 at 10:44 +0800, Chuhong Yuan wrote:
> In commit b6b2735514bc
> ("tracing: Use str_has_prefix() instead of using fixed sizes")
> the newly introduced str_has_prefix() was used
> to replace error-prone strncmp(str, const, len).
> Here fix codes with the same pattern.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  arch/alpha/boot/tools/objstrip.c | 3 ++-
>  arch/alpha/kernel/setup.c        | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
[]
> @@ -148,7 +148,8 @@ main (int argc, char *argv[])
>  #ifdef __ELF__
>      elf = (struct elfhdr *) buf;
>  
> -    if (elf->e_ident[0] == 0x7f && strncmp((char *)elf->e_ident + 1, "ELF", 3) == 0) {
> +	if (elf->e_ident[0] == 0x7f &&
> +		str_has_prefix((char *)elf->e_ident + 1, "ELF")) {

While the original indentation didn't use tabs,
please do not make it worse by misaligning.


