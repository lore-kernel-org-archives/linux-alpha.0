From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Date: Fri, 11 Oct 2019 03:25:19 -0500
Message-ID: <20191011082519.GI9749@gate.crashing.org>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-2-keescook@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=laYyGWVMiiekAtDUsDj7XUb5Ar05M+BPRqXn80Hfauc=; b=RLv2NGAKMsXyf7
	nNwqpm8jIIIWku25iPOcEmm4A4510jY/BGfF4fTvVGEHqxpJ7tQ3VkS8kEm5e89DnciJpFRVIOYMJ
	Dx5hnlLd7nPf5h7gqDZ0Ro3vjddHxdYUBUBtlwn0/+nT4/brUt4vGFVkbgQU6P02nj9WPMFIYWobe
	DwS2yHUv1lQxdkvlWiIu3KtqAMS7iiZuY4lbIatL6AxZX/OE8K03eYiolOhqEo7+ARqV4mxjTnfW+
	n3xKniCQgssrDVe1g82pHhctyB/RAcKLbKWxQ69odynnzDP4L+J+VASZiYQb91C05kl7HpmapZ980
	dV279b4Zh6SbRa0iEyvQ==;
Content-Disposition: inline
In-Reply-To: <20191011000609.29728-2-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>, Dave Hansen <dave.hansen@linux.intel.com>, linux-ia64@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org, Will Deacon <will@kernel.org>, x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org

On Thu, Oct 10, 2019 at 05:05:41PM -0700, Kees Cook wrote:
> The Program Header identifiers are internal to the linker scripts. In
> preparation for moving the NOTES segment declaration into RO_DATA,
> standardize the identifier for the PT_NOTE entry to "note" as used by
> all other architectures that emit PT_NOTE.

All other archs are wrong, and "notes" is a much better name.  This
segment does not contain a single "note", but multiple "notes".


Segher
