From: Greg KH <greg@kroah.com>
Subject: Re: SCSI generic support: Badness in kobject_get
Date: Fri, 2 Apr 2004 14:35:50 -0800
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040402223550.GA12467@kroah.com>
References: <7CA30FDE-84F1-11D8-8FED-000393C43976@postmail.ch>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7CA30FDE-84F1-11D8-8FED-000393C43976@postmail.ch>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wanner <stefan.wanner@postmail.ch>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 03, 2004 at 12:02:52AM +0200, Stefan Wanner wrote:
> Hi
> 
> I have an Alpha AS400 with Debian Linux 3.0 and Kernel 2.6.3

Please use a newer kernel, this bug has been fixed in 2.6.4.

thanks,

greg k-h
