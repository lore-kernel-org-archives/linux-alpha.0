From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 08/24] loongarch/cpu: Mark play_dead() __noreturn
Date: Tue, 14 Feb 2023 09:06:20 +0100
Message-ID: <fa2028d1-501f-523e-7b83-2e72d374812c@linaro.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <4da55acfdec8a9132c4e21ffb7edb1f846841193.1676358308.git.jpoimboe@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CexkYCgiU8jqIy3gLQMuVr94YSYODTF1ZIZpmznHWI0=;
        b=oq8fELe1ypAvc08FOz5CbHNTQBld5o23Jvdy+nLY0zG/DnFqza+VDZVuxwBfk8xIVm
         ImZ0fQYX3iD2kpEI2wrrJJ+EOv/ECI1pGCu4gDD9IhpbKAyXQe2Gg+36UgHDi0uWRsxw
         QKFTlhrsHNwTjUGRfM18bUeuqZqenYwJ9+lXPP+TIJmtJqj3qO11s6scjudecRVlXd8G
         yx+52LcS4QzLrkx17Mf0iokjziy/G8h1s4OnVBPi13160Z/MlgxAwmyWSoN4FxAoR886
         R7GzWQlscuhv0+syQCFg7BJqUBMsODphxlVZ4n5BE8SY37bZ4PSRi5tZBcsQ8dac5j5Y
         pIYA==
Content-Language: en-US
In-Reply-To: <4da55acfdec8a9132c4e21ffb7edb1f846841193.1676358308.git.jpoimboe@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp, dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen

T24gMTQvMi8yMyAwODowNSwgSm9zaCBQb2ltYm9ldWYgd3JvdGU6Cj4gcGxheV9kZWFkKCkgZG9l
c24ndCByZXR1cm4uICBBbm5vdGF0ZSBpdCBhcyBzdWNoLiAgQnkgZXh0ZW5zaW9uIHRoaXMKPiBh
bHNvIG1ha2VzIGFyY2hfY3B1X2lkbGVfZGVhZCgpIG5vcmV0dXJuLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwub3JnPgo+IC0tLQo+ICAgYXJjaC9s
b29uZ2FyY2gvaW5jbHVkZS9hc20vc21wLmggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+CgoK
