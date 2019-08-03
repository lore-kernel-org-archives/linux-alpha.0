From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] arch/alpha: Remove dead code
Date: Sat, 3 Aug 2019 20:20:51 +0100
Message-ID: <20190803192051.GC1131@ZenIV.linux.org.uk>
References: <1564859856-5916-1-git-send-email-jrdr.linux@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564859856-5916-1-git-send-email-jrdr.linux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, rppt@linux.vnet.ibm.com, mhocko@suse.com, sfr@canb.auug.org.au, mpe@ellerman.id.au, paul.burton@mips.com, colin.king@canonical.com, gregkh@linuxfoundation.org, rfontana@redhat.com, tglx@linutronix.de, arnd@arndb.de, firoz.khan@linaro.org, jannh@google.com, namit@vmware.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Aug 04, 2019 at 12:47:36AM +0530, Souptick Joarder wrote:
> These are dead code since 2.6.11. If there is no plan to use
> it further, this can be removed forever.

What's the point in removing ifdefed-out debugging printks?
