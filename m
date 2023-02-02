From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Date: Thu, 2 Feb 2023 20:20:03 +0000
Message-ID: <Y9wa8zWWec00vGWa@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <Y9te+4n4ajSF++Ex@ZenIV>
 <Y9t6Swqt+A9noVIf@creeky>
 <Y9vUxXEHRb07bh3J@ZenIV>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=JqYAryr4ncgoLGfd4SoGpnz0Btqk8njgp0CFfJJoxYc=; b=ahQdNdoWXNamq8v8GUJXd1cvzs
        bh1QAw2pLpwbgpIkiW4MXAENtYwxA8evdkZ0OHQdhbv785v4kNRqy1WgvLwiSdL2OV13ronn+7d2s
        aght84mc5KaTnWTTx66d3O463syBC9hnW2ENJDYA+7kkHEjRkjRsycbEVYnq8KKwgJPfAR5NewgAp
        LoyOLYSuAIy5OL+iS8gEUrRlwDNoHFhRW+WCFkfyO3w1hJHnPntPNZ3aAsqVlZFw48bqHf9BxD+1F
        SxZdFqZ54EJ3sljftXHys6Zc67Qf/ks1/Qc8Mfe8/U7jPydeBhrXQygMTNdOUydBfWvM3RRbGFd/g
        ofHg7UoQ==;
Content-Disposition: inline
In-Reply-To: <Y9vUxXEHRb07bh3J@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>

On Thu, Feb 02, 2023 at 03:20:37PM +0000, Al Viro wrote:

> "Racy" probably had been about something along the lines of the scenario
> I'd mentioned just upthread, but in 5.5 that "racy" escalated to "does not
> work at all" - if you ever hit a vmalloc-related fault, you are going
> to get an oops.  You still get 8Gb, but beyond that it's broken.
> 
> And it's almost certainly not the problem you are seeing...

Incidentally, direct store to pgd_val() in there looks fishy wrt barriers -
shouldn't there be an smp_wmb() before we shove that sucker into our
top-level table's entry?
