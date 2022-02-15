From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] treewide: Replace zero-length arrays
 with flexible-array members
Date: Tue, 15 Feb 2022 10:17:40 -0800
Message-ID: <202202151016.C0471D6E@keescook>
References: <20220215174743.GA878920@embeddedor>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rU/cr+2YS83r8ZzfG0ihHyfke5lY7dzNO33vRqwTRo0=;
 b=BbY3zUMbpsKVLuD6QiFaFpnxej58wpxQPVVGisDcf+K+2coTsFmZNXGoWqBeKoLb1x
 3ZptFg7el6LpqeSuHR1QjwuSCHfpkEX/T+XcjAHpaQzkvx2kHT7d0+kYGoaayuMfQhPV
 CAs5kcpK7DDzn/NDlTFukbq1xe316LjUYcWLM=
Content-Disposition: inline
In-Reply-To: <20220215174743.GA878920@embeddedor>
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, devicetree@vger.kernel.org, target-devel@vger.kernel.org, linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org, linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, mpi3mr-linuxdrv.pdl@broadcom.com, coresight@lists.linaro.org, sparmaintainer@unisys.com, linux-um@lists.infradead.org, greybus-dev@lists.linaro.org, linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kerne

On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use “flexible array members”[1] for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].
> 
> This code was transformed with the help of Coccinelle:
> (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> 
> @@
> identifier S, member, array;
> type T1, T2;
> @@
> 
> struct S {
>   ...
>   T1 member;
>   T2 array[
> - 0
>   ];
> };

These all look trivially correct to me. Only two didn't have the end of
the struct visible in the patch, and checking those showed them to be
trailing members as well, so:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
