From: Falk Hueffner <falk.hueffner@student.uni-tuebingen.de>
Subject: Re: raid1.c and gcc problem/oops (was: [INFO] gcc versions used to compile a kernel
Date: 13 Oct 2003 17:12:45 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <87llrp5fyq.fsf@student.uni-tuebingen.de>
References: <3F8ACFA0.10239.10815846@localhost>
	<3F8AB9A9.9010502@steudten.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <3F8AB9A9.9010502@steudten.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alpha@steudten.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Thomas Steudten <alpha@steudten.com> writes:

> On alpha, as i described in this list, i got an oops in raid1.c for
> kernel 2.4.17..21, 2.6.0-test7 with gcc-2.95.3, gcc-3.3 (3.4 is in
> work by me).

It seems like the fix was accidentally not committed for the 3.3
branch (see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=11087). I hope
we can still include it for the upcoming 3.3.2 release.

-- 
	Falk
