From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 6/7] timex: use __kernel_timex internally
Date: Thu, 12 Jul 2018 01:27:07 -0700
Message-ID: <20180712082707.GC8802@infradead.org>
References: <20180707054247.19802-1-deepa.kernel@gmail.com>
 <20180707054247.19802-7-deepa.kernel@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=A3p39y8aA3sVLeA7QmYGcOzlRAS9Lp/mO4/efZWr3Uo=; b=HEcihj15dahPicLcbGy+JKTYr
        EyJ1NkXMYA53qq6/FqV2fmFW4sfayP/A6rWv5hEhTlEuUdkNpAFdVQ7+mmNlBFgY6owaBcyOiXSpR
        AXEc0tHIRDWeKNs2ONI1+fLe89oYFg1T8Hl3bwdO+rtkcmaWLKg/r7j/CxHvQw1dfuhxfy8/3ZWqK
        Uo86QvCiBUmVDeN4yhfLI2VmNtZWd4O1rHvhZE13koQX3gYkUOZpO/Rzip5JWmWUk92jF9Xj+AK6m
        J8SmnSU0Uy3c9kF7mLsEX0xf9gr8OCJj1A+kWjkpssL30YyqkwyJT6O0Ry4oUdwi3rHiNI83BIiLm
    
Content-Disposition: inline
In-Reply-To: <20180707054247.19802-7-deepa.kernel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, arnd@arndb.de, y2038@lists.linaro.org, linux-alpha@vger.kernel.org, netdev@vger.kernel.org

On Fri, Jul 06, 2018 at 10:42:46PM -0700, Deepa Dinamani wrote:
> struct timex is not y2038 safe.
> Replace all uses of timex with y2038 safe __kernel_timex.
> 
> Note that struct __kernel_timex is an ABI interface definition.

If it actually is an ABI interface it should probably have a different
name.
