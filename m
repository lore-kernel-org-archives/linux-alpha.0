From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Kernel crash/ oops >= 2.6.5 with gcc 3.4.0 on alpha
Date: Fri, 28 May 2004 19:16:01 +0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040528191601.B1117@jurassic.park.msu.ru>
References: <40B726C0.5030400@steudten.com> <20040528123758.GE19544@MAIL.13thfloor.at> <40B74779.40406@steudten.com> <200405281719.20593.rezso@rdsor.ro>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200405281719.20593.rezso@rdsor.ro>; from rezso@rdsor.ro on Fri, May 28, 2004 at 05:19:20PM -0400
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balint Cristian <rezso@rdsor.ro>
Cc: Herbert Poetzl <herbert@13thfloor.at>, linux-admin@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Fri, May 28, 2004 at 05:19:20PM -0400, Balint Cristian wrote:
> > {standard input}: Assembler messages:
> > {standard input}:7: Warning: setting incorrect section attributes for .got
> >
> Hi  !
> 
> I got same error with 2.6.7-rc1 !

It's not an error, just a warning, and it's unrelated to reported oops.

Ivan.
