From: Christian Brauner <brauner@kernel.org>
Subject: Re: [RFC PATCH 2/2] fs/xattr: wire up syscalls
Date: Tue, 30 Aug 2022 17:56:22 +0200
Message-ID: <20220830155622.4hcj6dka5jswydrg@wittgenstein>
References: <20220830152858.14866-1-cgzones@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661874998;
        bh=4MfZ2CCn8fhHH/Gt5iirr/AOGINTw9QezerOet2l08g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H4kEIIWyxgOlguNNyyYoVWW9S5KnAAsJ+EbiyQQErMIK+stft/vi0m5cy1LomDk2L
         h5VpgDwrWcXRd4Kt0Zxcu2QUgkZMPebEozFNt2ciI5hxfGK3QTONM94Bj8y4E8W0sM
         qtONO/KZG8Gj4rAIvh084ZaWbp0KzPNvMyEkfPXcOXV9s+UfPa7REHR7Yq7sq5VSC/
         c7CYrs0CM8tDqKQ9StIutf7uJEc2kqU+da1fxdoD3dMgrpTIk7JWsIPNpn/gNfah2C
         nfj89MpvCJbSx2PXt9/k3zsgkUpcS5N1U6vsKmV8rNeKNQFs6rFZ+Y4VIwNRB6hra8
         PeEiQsd2EITXw==
Content-Disposition: inline
In-Reply-To: <20220830152858.14866-1-cgzones@googlemail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Christian =?utf-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntr>

On Tue, Aug 30, 2022 at 05:28:38PM +0200, Christian Göttsche wrote:
> Enable the new added extended attribute related syscalls.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---

Fwiw, I think a while ago it was pointed out that for most syscall
additions you can just fold the hookup patch in. It probably also
wouldn't hurt to trim that Cc list significantly down to mostly the
lists...
