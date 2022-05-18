From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Wed, 18 May 2022 10:39:17 +1000
Message-ID: <87y1yzoeru.fsf@mpe.ellerman.id.au>
References: <20220421070440.1282704-1-hch@lst.de>
 <YoQcNkB6R/E3vf51@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1652834372;
        bh=PfasWlhYL5IIEatPGqyd0PllM8n5gWkCvmvKfOjR5ZI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ifBigZ+VFYy/C+eimo7bpL5w+3/z23uyazvVk5US29tdXqfEiyiE2kgsivrZ9PIIY
         xi0/+sPtH+wVDTUG0qAjQJTiIjqyDqlL2IbsUzxiu+s+dCJ4zWZp+Ehr10/1HqDsYt
         hEKGFpjk44MjU3NvI8HBJAVNkEuJSlxBdnD/xv1GMNgSd69NNeAHvGIltaDYCpZLAr
         uq0Vu4JdKVZ4PcikfUl4RGDPutZ8MoQlrUs82K/KMzD7oqdCZepJvmEPNAhwA6RjgK
         os8uDWp7ExAUFBZdGl8wH36Vnq/WpSfhCyHnbhrrSltUexy+gwulzJLOZshcUK0aCG
         VuB3+hsPMHw2A==
In-Reply-To: <YoQcNkB6R/E3vf51@zeniv-ca.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Al Viro <viro@zeniv.linux.org.uk> writes:
> On Thu, Apr 21, 2022 at 09:04:40AM +0200, Christoph Hellwig wrote:
>> csum_and_copy_from_user and csum_and_copy_to_user are exported by
>> a few architectures, but not actually used in modular code.  Drop
>> the exports.
>> 
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Acked-by: Al Viro <viro@zeniv.linux.org.uk>
>
> Not sure which tree should it go through - Arnd's, perhaps?

It's already in akpm's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-nonmm-stable&id=6308499b5e99c0c903fde2c605e41d9a86c4be6c

cheers
