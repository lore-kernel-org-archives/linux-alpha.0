From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH] alpha: move arch/alpha/defconfig to
 arch/alpha/configs/defconfig
Date: Mon, 13 May 2019 17:20:33 +0000 (UTC)
Message-ID: <alpine.DEB.2.21.999.1905131720150.5613@utopia.booyaka.com>
References: <20190513021405.12428-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONDHP+hixJmrUzDbxGkikJWqQ2gHYhIszyJlJqoDyO8=; b=cNJtTgiSn/BQK5
	8gDqgyM03nRNaNTn3xJrQyv6LuzOiX0xq27IO1D0iQ+7YLrgzYzeV9obUFKli6+6dIB3zj/hPPA4n
	YTIcqDBI2G5m20tAm83+NHeAebQAM/OxV/0BjWT9bpj6w4kTiq1HqgQjHQdMPZXZ3V7yxbrb5LlmV
	xLitFwin9fzh0J7LoFPyBMQTjxD9RulTO1v48BbGTSMzpaKqP3SreoCl9Rwp9GhIeVXVdp3DQWRHc
	ctXSt7AVmAH6zMnXhLbkd6Tcs0HoRNO5wCSPGZz655kQVN0WixXHCHAWlHWx9NmdI4XhVrqbyAfN/
	lBYfvG9PYCFqpjphErdw==;
In-Reply-To: <20190513021405.12428-1-yamada.masahiro@socionext.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>, linux-alpha@vger.kernel.org, Guo Ren <guoren@kernel.org>, Matt Turner <mattst88@gmail.com>, Vincent Chen <deanbo422@gmail.com>, linux-riscv@lists.infradead.org, Richard Henderson <rth@twiddle.net>

On Mon, 13 May 2019, Masahiro Yamada wrote:

> As of Linux 5.1, alpha and s390 are the last architectures that
> have defconfig in arch/*/ instead of arch/*/configs/.
> 
>   $ find arch -name defconfig | sort
>   arch/alpha/defconfig
>   arch/arm64/configs/defconfig
>   arch/csky/configs/defconfig
>   arch/nds32/configs/defconfig
>   arch/riscv/configs/defconfig
>   arch/s390/defconfig
> 
> The arch/$(ARCH)/defconfig is the hard-coded default in Kconfig,
> and I want to deprecate it after evacuating the remaining defconfig
> into the standard location, arch/*/configs/.
> 
> Define KBUILD_DEFCONFIG like other architectures, and move defconfig
> into the configs/ subdirectory.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Paul Walmsley <paul@pwsan.com>


- Paul
