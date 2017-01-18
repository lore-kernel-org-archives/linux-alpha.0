From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/4] alpha: Fine-tuning for five function implementations
Date: Wed, 18 Jan 2017 12:40:12 +0100
Message-ID: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 12:26:38 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Return an error code only as a constant in osf_sigstack()
  Move two assignments for the variable "error" in osf_utsname()
  Return directly after a failed copy_from_user() or getname() in two functions
  Move two assignments for the variable "res" in srm_env_proc_write()

 arch/alpha/kernel/osf_sys.c | 51 ++++++++++++++-------------------------------
 arch/alpha/kernel/srm_env.c | 10 +++++----
 2 files changed, 22 insertions(+), 39 deletions(-)

-- 
2.11.0

