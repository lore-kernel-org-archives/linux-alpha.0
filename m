From: Jarek Poplawski <jarkao2@o2.pl>
Subject: Re: INFO alpha CPU: Locking API testsuite: Results kernel 2.6.18.1
Date: Wed, 8 Nov 2006 10:32:01 +0100
Message-ID: <20061108093201.GA2489@ff.dom.local>
References: <454CA335.609@steudten.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <454CA335.609@steudten.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On 04-11-2006 15:27, alpha @ steudten Engineering wrote:
> kernel-2.6.18.1 ALPHA SX164
> No "failed" on x86.
> ------------------------
> | Locking API testsuite:
> ----------------------------------------------------------------------------
>                                  | spin |wlock |rlock |mutex | wsem | rsem |
>   --------------------------------------------------------------------------
>                      A-A deadlock:failed|failed|  ok  |failed|failed|failed|
...
> --------------------------------------------------------
> 143 out of 218 testcases failed, as expected. |
> ----------------------------------------------------

CONFIG_PROVE_LOCKING=y ?

Jarek P.
