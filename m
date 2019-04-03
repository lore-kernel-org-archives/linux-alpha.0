From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 2/2] arch: add pidfd and io_uring syscalls everywhere
Date: Wed, 3 Apr 2019 09:39:52 -0600
Message-ID: <032faa2f-6317-75b6-8514-076ef1a244e8@kernel.dk>
References: <20190325143521.34928-1-arnd@arndb.de>
 <20190325144737.703921-1-arnd@arndb.de>
 <87tvff24a1.fsf@concordia.ellerman.id.au>
 <20190403111134.GA7159@fuggles.cambridge.arm.com>
 <9d673dfd-0051-3676-653e-6376430d73dd@kernel.dk>
 <20190403151932.GA16866@fuggles.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6NFYgu8LYAIEMT2NkIHo6xQunCeTdqwADUvaKw9GfVk=;
        b=yYh/eTur7DnMoVUVTSWQfaSeue1eEXSo/n7C2icw4HxjDhi+HHbAsz1NzhY/6S43pW
         uvz+olJ3ULS9b4pRtf90ExpxLmmfuxFGHT7xSbYtW9eweV9fM1eg6mmgdVY/hpY6IFBX
         9jUw7pKvw0/982EixG07i8NGFfUIQMuaX0lAlZKrLlcjvbEISfJ0NdI94cP3XSBPUScS
         QLXbTrriXFmfdRttmFTpJJGdO9bkM8pgIAVmsKKQ4DHXCRwaZQYLU7qO3GQOi/589HwF
         5kpIXUlhuL8SU6MVkxLS4/OX0DfQ8SEmxBfiNRTr234UTITD+0gpetb350R52ZSYvo4S
         3LGg==
In-Reply-To: <20190403151932.GA16866@fuggles.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Will Deacon <will.deacon@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Mar

On 4/3/19 9:19 AM, Will Deacon wrote:
> Hi Jens,
> 
> On Wed, Apr 03, 2019 at 07:49:26AM -0600, Jens Axboe wrote:
>> On 4/3/19 5:11 AM, Will Deacon wrote:
>>> will@autoplooker:~/liburing/test$ ./io_uring_register 
>>> RELIMIT_MEMLOCK: 67108864 (67108864)
>>> [   35.477875] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000070
>>> [   35.478969] Mem abort info:
>>> [   35.479296]   ESR = 0x96000004
>>> [   35.479785]   Exception class = DABT (current EL), IL = 32 bits
>>> [   35.480528]   SET = 0, FnV = 0
>>> [   35.480980]   EA = 0, S1PTW = 0
>>> [   35.481345] Data abort info:
>>> [   35.481680]   ISV = 0, ISS = 0x00000004
>>> [   35.482267]   CM = 0, WnR = 0
>>> [   35.482618] user pgtable: 4k pages, 48-bit VAs, pgdp = (____ptrval____)
>>> [   35.483486] [0000000000000070] pgd=0000000000000000
>>> [   35.484041] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>>> [   35.484788] Modules linked in:
>>> [   35.485311] CPU: 113 PID: 3973 Comm: io_uring_regist Not tainted 5.1.0-rc3-00012-g40b114779944 #1
>>> [   35.486712] Hardware name: linux,dummy-virt (DT)
>>> [   35.487450] pstate: 20400005 (nzCv daif +PAN -UAO)
>>> [   35.488228] pc : link_pwq+0x10/0x60
>>> [   35.488794] lr : apply_wqattrs_commit+0xe0/0x118
>>> [   35.489550] sp : ffff000017e2bbc0
>>
>> Huh, this looks odd, it's crashing inside the wq setup.
> 
> Enabling KASAN seems to indicate a double-free, which may well be related.

Does this help?


diff --git a/fs/io_uring.c b/fs/io_uring.c
index bbdbd56cf2ac..07d6ef195d05 100644
--- a/fs/io_uring.c
+++ b/fs/io_uring.c
@@ -2215,6 +2215,7 @@ static int io_sqe_files_register(struct io_ring_ctx *ctx, void __user *arg,
 			fput(ctx->user_files[i]);
 
 		kfree(ctx->user_files);
+		ctx->user_files = NULL;
 		ctx->nr_user_files = 0;
 		return ret;
 	}

-- 
Jens Axboe

