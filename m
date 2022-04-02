From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] alpha: add null pointer check
Date: Sat, 2 Apr 2022 15:45:28 +0000
Message-ID: <YkhvmH/eonkrT1M1@zeniv-ca.linux.org.uk>
References: <20220402083436.2413189-1-lv.ruyi@zte.com.cn>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qrD3dLInNfleLqlGuKhkZmbWrdw03gFeC7x6uS63Upw=; b=fgT1s3C0m31iB+jxF8elaB2Ur1
        KV8NTuktgsQyRbCUN1IhPGKFP4jqRt2oYZReQr5NgEyzb3bxttifzIXyv/jqIUxDbN3eBvRyPc2Qq
        7360sHDlk9/k+xfzMUGKTUXq5fx//O8pvJmRA4dpwamuln78K+WBCTBaelhk5WFsYL9cICIMt2bVz
        PH7wr5YRIii8EPyI+/sD+0s0LyDJnlssn1tFVEkS2e0l+/steVQCDS6QzhO3pcNxq1ZZ8qJHGv69I
        L+xyI73E1TF7toXK+lRVsRKx/GjLccZtEsxr0iiC+qwUCTUmdy7DVF0h2DrHVIn8QXNKnqUHFia7C
        B2Ce7yig==;
Content-Disposition: inline
In-Reply-To: <20220402083436.2413189-1-lv.ruyi@zte.com.cn>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cgel.zte@gmail.com
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, lv.ruyi@zte.com.cn, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>

On Sat, Apr 02, 2022 at 08:34:36AM +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> kmalloc is a memory allocation function which can return NULL when some
> internal memory errors happen. Add null pointer check to avoid
> dereferencing null pointer.

Why is that fix correct?  The only caller (module_frob_arch_sections())
has no way to tell we'd failed.  _IF_ ignoring the failure is the right
thing to do, the analysis needs to be covered in commit message.
