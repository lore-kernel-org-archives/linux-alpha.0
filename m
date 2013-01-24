From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 3/8] mm: use vm_unmapped_area() on frv architecture
Date: Thu, 24 Jan 2013 14:13:10 +0000
Message-ID: <27625.1359036790@warthog.procyon.org.uk>
References: <1358990991-21316-4-git-send-email-walken@google.com> <1358990991-21316-1-git-send-email-walken@google.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1358990991-21316-4-git-send-email-walken@google.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michel Lespinasse <walken@google.com>
Cc: dhowells@redhat.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org

Michel Lespinasse <walken@google.com> wrote:

> Update the frv arch_get_unmapped_area function to make use of
> vm_unmapped_area() instead of implementing a brute force search.
> 
> Signed-off-by: Michel Lespinasse <walken@google.com>
> Acked-by: Rik van Riel <riel@redhat.com>

Acked-by: David Howells <dhowells@redhat.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
