From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 18:04:38 +0400
Sender: linux-admin-owner@vger.kernel.org
Message-ID: <20040528180438.A1076@jurassic.park.msu.ru>
References: <40B726C0.5030400@steudten.com>
Mime-Version: 1.0
Return-path: <linux-admin-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40B726C0.5030400@steudten.com>; from alpha@steudten.com on Fri, May 28, 2004 at 01:47:12PM +0200
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Steudten <alpha@steudten.com>
Cc: linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Fri, May 28, 2004 at 01:47:12PM +0200, Thomas Steudten wrote:
> No other application seems to fail with gcc-3.4.0 so I think
> this problem is in context to the relocation, modules and gcc-3.4.0.

Correct. It's fixed in 2.6.7-rc1.

Ivan.
