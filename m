From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 25/29] xtensa: Move EXCEPTION_TABLE to RO_DATA segment
Date: Mon, 14 Oct 2019 00:41:06 -0700
Message-ID: <CAMo8BfKexMmMusB3XOeaMOZHdU4ccz+PMGA=Jy+KQhgD8H_8UQ@mail.gmail.com>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-26-keescook@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXyiD03G4f+T1yZCEI8iN0bp3eZ6jP8QSHvnlOrDtHk=; b=mfLSp5t0iIa5Xk
	4pjWTI37SWVq+i6j9YOg7sindu05ChhuqRWEQr6Lo2DkroqxMU6VAG4QDN2DYdV9pFQtDFFW/+zc2
	nbq6mkyr2CCwB6Hm/AWQizSLbXRRFToV55CMVb0VDvVdPJ1LT8T+BlgqAUM7BpZ6eA1GrrUxXNrF2
	yrYrUO12L7xT6encnXHKHv/nBwitMej2GHmhMFthGgZJ2nEzzBr31hXUGvaf+OagRJQ0meE81OhDd
	8OlIpxgltoPpurtRd1sktX4n4InpaFZ1CIPd1PP5rixovJ/9jkf0bnoOVG5FRrbBm3j5Jttpi4dGQ
	N0Qg+QP88y1tZlIvuing==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sEN7o3yuO56xvPDuUwKgUiAGNAgWvdh9IYFyMwir9eg=;
 b=ULg0x+kVwo2eT+iIl7xEqgOGbAzw68nEs+Tf1EX6WbkwD6JZiL1PJq9RZFvkDJEthU
 ocfdC+Pu3HU8yKboyYft824CwBNxjIEzx8zyCCvt9khKX2P3rnlv1B/RrEDuwgE/1mG/
 dO9bqvuIwHg7kYFJ6cR8Rxh98z5xxnACgBkXR6UU0aSIjsvAx7CLSTrvS1W1Yc6B2hbM
 xVKkvAsHm4h5LvwOcL7O3xZNwPSbX/1EH8Ha7BFbRmH59L7FLoc17rAHr/p/fi2/0aQd
 XhR8EuPvAa5rR0cGHGbuZEBAsY6jzipW6b/VsB7pAItTeOGbyHWLGnGRGwAir0skqH6K
 QqgA==
In-Reply-To: <20191011000609.29728-26-keescook@chromium.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kees Cook <keescook@chromium.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Michael Ellerman <mpe@ellerman.id.au>, Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>, "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>, linux-arm-ke

On Thu, Oct 10, 2019 at 5:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
