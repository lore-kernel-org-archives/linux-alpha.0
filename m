From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [PATCH] alpha: fix nautilus PCI setup
Date: Tue, 17 Mar 2020 23:28:25 +0000
Message-ID: <20200317232825.GA6018@mail.rc.ru>
References: <20200314194745.GB12510@mail.rc.ru>
 <CAEdQ38GP8XJpgaWRZKFVpHY1mYGh2oaQnnBPYH86tbCRc=U_Xg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38GP8XJpgaWRZKFVpHY1mYGh2oaQnnBPYH86tbCRc=U_Xg@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Yinghai Lu <yinghai@kernel.org>, linux-pci@vger.kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Jay Estabrook <jay.estabrook@gmail.com>, Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Mon, Mar 16, 2020 at 11:26:24PM -0700, Matt Turner wrote:
> One thing I noticed: this variable is now no longer used.

Right, my fault. I think it would be better to re-submit
the nautilus part, will do that shortly.

Ivan.
