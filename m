From: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays
 with flexible-array members
Date: Tue, 15 Feb 2022 21:19:29 +0200
Message-ID: <Ygv8wY75hNqS7zO6@unreal>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
 <20220215192110.GA883653@embeddedor>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644952780;
 bh=RxAYLCqbUWlxjV9GFahzPwnkRBYKU9aVJMxo+INb+K8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oa82FKq0/HZo1Hieccox0xhuEOltsBpyNCb/oKWHfz9JimsfI5qrPFHosVG+Hw9KD
 FqjMZvJ5BquXlsEM1IUTOugfyhHJjbL+NoooCvHgJp/wzFU4N6mJ3/+qfEy0h1bhbj
 fv9Bo5w4LHHM1g+pM9OlS1+FV6MX0/N+Aa88X5OzELy65s1Xs5Q/258d9WBNoUp0fb
 HMGG+vm/A6PvbbvtXJ00MB45hauRqyRZCekvmCmXYRktZmaEtd9qOIjTryp50cyo1/
 0DT+ajNam/uql+1lfstz9xW/6FSdwogqLIyHb8bwuPl3b0gveaOfCnpwJkPBK0mL1q
 tCTR2Et3rHU/g==
Content-Disposition: inline
In-Reply-To: <20220215192110.GA883653@embeddedor>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, devicetree@vger.kernel.org, target-devel@vger.kernel.org, linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org, linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>, mpi3mr-linuxdrv.pdl@broadcom.com, coresight@lists.linaro.org, sparmaintainer@unisys.com, linux-um@lists.infradead.org, greybus-dev@lists.linaro.org, linux-rpi-kernel@lists.infradead.org, linux-om

On Tue, Feb 15, 2022 at 01:21:10PM -0600, Gustavo A. R. Silva wrote:
> On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> > On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > > There is a regular need in the kernel to provide a way to declare
> > > having a dynamically sized set of trailing elements in a structure.
> > > Kernel code should always use “flexible array members”[1] for these
> > > cases. The older style of one-element or zero-length arrays should
> > > no longer be used[2].
> > > 
> > > This code was transformed with the help of Coccinelle:
> > > (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> > > 
> > > @@
> > > identifier S, member, array;
> > > type T1, T2;
> > > @@
> > > 
> > > struct S {
> > >   ...
> > >   T1 member;
> > >   T2 array[
> > > - 0
> > >   ];
> > > };
> > 
> > These all look trivially correct to me. Only two didn't have the end of
> > the struct visible in the patch, and checking those showed them to be
> > trailing members as well, so:
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> I'll add this to my -next tree.

I would like to ask you to send mlx5 patch separately to netdev. We are working
to delete that file completely and prefer to avoid from unnecessary merge conflicts.

Thanks

> 
> Thanks!
> --
> Gustavo
