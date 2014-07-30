From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 2/2] alpha: Add sched_set/getattr and renameat2 syscalls
Date: Wed, 30 Jul 2014 12:54:18 -1000
Message-ID: <53D9779A.7080003@twiddle.net>
References: <1406756552-23864-1-git-send-email-rth@twiddle.net> <1406756552-23864-3-git-send-email-rth@twiddle.net> <20140730222113.GC23324@stolen.phys.waikato.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=fX3iYyBedye5ZC6ahCbTxDSGUTIutGrLFHlj7yrkT98=;
        b=XYdxXyZfc5EJ7UVe/KpDXsuikwcBbm48Q0ewoDLoNupwEK4Wme4LcZysZSV/z+ewLJ
         IgsPrEpGgQBy1hg8dExM0X+4f3/xfY6GOD9vAXGQLxCHJ5SRIpGN1kjkNejP0l2c/CUx
         xM8kE2X8YlA//8PVFIst7C1n0yqf9wHvcZIYR7cANNXd2ExI3ozmg6dffyIO7389J6N/
         t6jZ6me7bRiV+zJ8aMWggpzAlikxI93v6WI7VPW4bS6bI1Sq3LRgDcAux1xtPmfBj/av
         +c7d6nj+DZ4GZ6ryJeh0aFwZNeqLnlD9BTCcPYYcpLFlXXRDQCr3Bck8x1Xr7rbqaFKm
         nRzA==
In-Reply-To: <20140730222113.GC23324@stolen.phys.waikato.ac.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 07/30/2014 12:21 PM, Michael Cree wrote:
> On Wed, Jul 30, 2014 at 11:42:32AM -1000, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  arch/alpha/include/asm/unistd.h      | 2 +-
>>  arch/alpha/include/uapi/asm/unistd.h | 3 +++
>>  arch/alpha/kernel/systbls.S          | 3 +++
>>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> I thought Matt had already sent my patch to do just that to Linus.

Yes, I see now that he has.  Ignore my (exact) duplicate.


r~

