From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/9] net: wireless: rtl818x: Constify ioreadX() iomem
 argument (as in generic implementation)
Date: Sun, 26 Jan 2020 15:11:37 +0000 (UTC)
Message-ID: <20200126151137.C0CA8C43383@smtp.codeaurora.org>
References: <20200108200528.4614-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580051501; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=GgNouC08XBq9czPTNzqE2b2+ochAUWZ+cpydcRWvAGA=;
 b=fw2e9ngGC56jy1CHyl0lyy2Jlb170AKJ9nNz0Gfo/bzDCW7qHzqYEiwgVt/DtTqpCfQftoeN
 24ESUQrbNll5DjiaJsk0h7R0CY3DPRt74cQySEMjGAHz9pbe7baSngPqwApzTnTu+ibE/hIC
 g758S4Dx002EstJwNvKjvj/+Tnk=
In-Reply-To: <20200108200528.4614-3-krzk@kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, Luis

Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume this and patch 9 are going via some other tree so dropping them
from my patchwork queue.

-- 
https://patchwork.kernel.org/patch/11324461/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
