From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 0/7] Remove unused SLOW_DOWN_IO
Date: Fri, 22 Apr 2022 10:48:28 -0700
Message-ID: <20220422104828.75c726d0@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650649710;
 bh=5eG88j23VfpqEXG5LElKEOANPUif8PLVVEOgW3NWPM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JFxldeSwtEKgk9Lc8kRCQDX6OUJaNJqjczwvWjMV4j3OqtctIRIdLWhgVFbHcrF3q
 6RV2w/ktTedzqZubriC/58H3Vdm9JiPVMTZntT5U6PsWNK7vp6Lf1pJVILEyJGxmS+
 qbW6cqz9aSs5BypgxKnfiub0ZMs/SwHrot2cRn1CQZuR4f0sF4Z4oMH0Z+a459fUj/
 AqyDYdPlcTk4kUXYFN7XRqxWUhAFDdRXCLT5AegHPef/SkanQTZdABcipo326XcIeu
 cDK0+ZCKSi/1Lz6pPb+mOUQxdS1svIyOTdYSc7OWhpV+sUpJYcDte2V/RzhDmTOY++
 fOwXTN8nCbK0w==
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Chas Williams <3chas3@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>, Matt Turner <mattst88@gmail.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Richard Henderson <rth@twiddle.net>

On Fri, 15 Apr 2022 14:08:10 -0500 Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Only alpha, ia64, powerpc, and sh define SLOW_DOWN_IO, and there are no
> actual uses of it.  The few references to it are in situations that are
> themselves unused.  Remove them all.
> 
> It should be safe to apply these independently and in any order.  The only
> place SLOW_DOWN_IO is used at all is the lmc_var.h definition of DELAY,
> which is itself never used.

Hi Bojrn! Would you mind reposting just patches 1 and 3 for networking?
LMC got removed in net-next (commit a5b116a0fa90 ("net: wan: remove the
lanmedia (lmc) driver")) so the entire series fails to apply and therefore 
defeats all of our patch handling scripts :S
