From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [PATCH] i2c-i801: Add missing <linux/slab.h> include.
Date: Mon, 10 Jan 2011 08:03:44 -0600
Message-ID: <20110110140344.GA23957@gherkin.frus.com>
References: <20110104141151.b6035bf3.randy.dunlap@oracle.com> <1294634675-29557-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1294634675-29557-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Pekka Enberg <penberg@kernel.org>, David Woodhouse <David.Woodhouse@intel.com>

On Mon, Jan 10, 2011 at 05:44:35PM +1300, Michael Cree wrote:
> Causes compile error on Alpha, but not on x86 because its version
> of <asm/pci.h> includes <linux/slab.h>.  In any case, it's a bug
> in the driver.
> 
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>

ACK.  Works for me.

--Bob
