From: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [RFC PATCH 0/6] arm64: untag user pointers passed to the kernel
Date: Fri, 9 Mar 2018 18:58:00 +0100
Message-ID: <CAAeHK+xTEp-jcMDxNK4kCKcNtVbu4s4VXxzThsKMMFaTdBv0RQ@mail.gmail.com>
References: <cover.1520600533.git.andreyknvl@google.com>
 <963e112a-88a0-94bc-e6eb-0e9f9a6ee14a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbu/sKFk7PMgjYdqWrJAWw0nkvwr6olpGfdLpRyOdw4=; b=kgH8fszHRWTyR/
	A2teHAZx9YWzwhNvQlU6wGXfmOtzlvkIuVuScpuJsT9nUkwsdsssuqlO8E7+6tTqQI4rRcZm8tIFf
	4Nj/tPK9iueNEdOLdhEryRcLKvB3dAe8oGyz6JRq4ck1rxIdBcUuMsr6veSb3Tk6SsMk8ge+1lsO4
	a1Knc9dvVwNqAtO8UdyvhnHiH5BUkInVtrMi4dlh+U1BbZwwGms8inqexe1VHfahAZwqkX/kK8/EC
	omn+lQwOv947/iIAyPMt54kdqkWd7QKH10j/sgnSiSl/6Qh5+zDgXfLnLPhu/J6Dm/NcuCJN0RnaC
	m2tCpuqfWGkGhxSGBV/A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ytr0eCyhrSlYJUx6v/73vhT/W9iKGUGXQ0WwWeu81/g=;
 b=D2GjXNID2R5u9iwYfdZ19neDQv9gDkz7lYYR62QdIwxHQLwH3d3qynfY+ytqfHo9v8
 outkJWhZzK3dm/kHxulpi5pmilm/eMgeR2bRj4BNgImnAxLt69DKTyG/mL+1vcGuGq7Y
 yqOIgL/DKLXr10SKGHQ25HLf3W6vy8dIh4+YEH+3OChjH5U+Nq/7zuLqDZn8u8cqQt/E
 LbJuoI970WH5zWE+hgDn945HmdW1uAXOfL4MXKmGsUDoACihDScHuw5ZD8DuOe/+Adp7
 VxldyLw+PAmTF/k/awpUwtRA7tgo1UQPnJluMuPJHN9bW5nachCZXrgRrpAiTyuOav/q
 B1Ow==
In-Reply-To: <963e112a-88a0-94bc-e6eb-0e9f9a6ee14a@arm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-mips@linux-mips.org, linux-sh@vger.kernel.org, Lee Smith <Lee.Smith@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Shaohua Li <shli@fb.com>, linux-arch@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, "James E . J . Bottomley" <jejb@parisc-linux.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>, Evgeniy Stepanov <eugenis@google.com>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, adi-buildroot-devel@lists.sourceforge.net, Mike Rapoport <rppt@linux.vnet.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, linux-cris-kernel@axis.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel>

On Fri, Mar 9, 2018 at 3:15 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> Hi Andrey,
>
> On 09/03/18 14:01, Andrey Konovalov wrote:
>>
>> arm64 has a feature called Top Byte Ignore, which allows to embed pointer
>> tags into the top byte of each pointer. Userspace programs (such as
>> HWASan, a memory debugging tool [1]) might use this feature and pass
>> tagged user pointers to the kernel through syscalls or other interfaces.
>
>
> If you propose changing the ABI, then
> Documentation/arm64/tagged-pointers.txt needs to reflect the new one, since
> passing nonzero tags via syscalls is currently explicitly forbidden.
>
> Robin.

Hi Robin!

I will include changes to Documentation/arm64/tagged-pointers.txt in
the next version.

Thanks!
