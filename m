From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Date: Wed, 2 Dec 2020 09:14:27 +0200
Message-ID: <20201202071427.GD751215@kernel.org>
References: <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
 <4c752ff0-27a6-b9d7-ab81-8aac1a3b7b65@physik.fu-berlin.de>
 <ea5bae0e-9f27-355f-d841-cf8b362b0b70@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgvV3ZfXAmNocWmfLk/f2PH2RBxQCx6Z5/qUYbmpchM=; b=I9j0oowuXoixkLe79TcrDb0aP
	hPn+ulFcE8XvA4KKg3UVdEXhKzglM6kr9XyYVjKqPdbPSK+dYGCFLZe7KAW8dafiZeeILYwCI4JEg
	U9UVxokVN2dVWfDeESvWP4CzQfqMz0ngXldzC+upIWuyQR4byj4mB0WnudZw7l5INdOweVwtH5UKd
	eAPZqeqBiimas5/C4VXcg7szt3qBwqeUyRMUHdO994Vdc3+eR3SmQ+KWgnnApbL0+Xdq8a/ZV+mIV
	3qhW4DmhTFXLdstmFVIbEuPPDbY1Sr6D7eEbA8k3QvoYl2ybUcifAMYnGDYpYzQU7lw1TjD4tt+T4
	1Lb7b8UpA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606893279;
 bh=r9lBvNLf060yzQHPZcKoDIPwOZLCXF+OC0jER6EqYE8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=wT49VF25j17+qMQAVEXVRjsH4L8jOTzl07zqrb3R6/MykEtip20Xt9J18zFMOaZ2v
 UIE8Gqusz6j75TITTsJbOfI3E3FfrTzJ6BOWagH5bzy9BLdh+yt2jnejJgPuPHA9os
 2VTy7RW8ddzE/3xCPSiM0eGtnB7iUkiaQi7so7e4=
Content-Disposition: inline
In-Reply-To: <ea5bae0e-9f27-355f-d841-cf8b362b0b70@physik.fu-berlin.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>, Jens Axboe <axboe@kernel.dk>, linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hi Adrian,

On Tue, Dec 01, 2020 at 08:55:37PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Mike!
> 
> On 12/1/20 4:07 PM, John Paul Adrian Glaubitz wrote:
> > This fixes the issue for me.
> > 
> > Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> 
> I just booted the kernel from the linux-mm branch and I can't get the hpsa driver
> to work anymore. Even if I compile it into the kernel, the driver is no longer
> loaded and hence I can't access the disks.
> 
> Any idea what could be wrong?

I know nearly nothing about SCSI, I can only suggest to enable all the
debug options available and see if anything shows up :)

> Adrian
> 
> -- 
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer - glaubitz@debian.org
> `. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> 

-- 
Sincerely yours,
Mike.
