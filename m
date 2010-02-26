From: "Dialup Jon Norstog" <thursday@allidaho.com>
Subject: Re: Does SRM care what IDE optical drive it sees?
Date: Thu, 25 Feb 2010 21:22:14 -0700
Message-ID: <20100226041316.M99801@allidaho.com>
References: <20100226040843.GA28184@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20100226040843.GA28184@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>, linux-alpha@vger.kernel.org
Cc: debian-alpha@lists.debian.org

Bob,

I've had several "Miata" machines, from both series.  They are indeed
sensitive to what is on the IDE channel. At the same time, if "show config"
prints out the drive, SRM is doing its job. I think the flaw is probably in
the controller chip. In general, what works best on those machines
 is the original Toshiba 24X CDrom drive. I've had issues with the Red Hat 7.x
distros, which were supposedly pressed CDs rather than burned.  Those, I was
able to install by swapping out the Toshiba for an old Creative 8X drive. 
Other times a SCSI CDrom worked best.  You could try swapping out for the CDRW
once your install is complete;it will probably work in software.

I'm using an XP1000 now, and it does quite well in SRM with CDRW and even
DVD-R drives.  


jn



---------- Original Message -----------
From: Bob Tracy <rct@gherkin.frus.com>
To: linux-alpha@vger.kernel.org
Cc: debian-alpha@lists.debian.org
Sent: Thu, 25 Feb 2010 22:08:44 -0600
Subject: Does SRM care what IDE optical drive it sees?

> Situation: I've got a PWS 433au (Miata) on which I've been trying to 
> do a "from scratch" install of Lenny.  (See the gory details on 
> debian-alpha).  To make a long story short, I had reason to try and 
> replace the existing CD-ROM drive with a CD-RW burner, and the Alpha 
> refused to boot.  I couldn't even get the power-up diagnostics to run.
> 
> I put the original CD-ROM drive back in the system (and removed the new
> one).  Result: everything works correctly.
> 
> Is SRM really that picky about the optical drive?  Or did I simply
> install a defective drive (not likely, but I'll consider the
> possibility)?
> 
> -- 
> ------------------------------------------------------------------------
> Bob Tracy          |  "Every normal man must be tempted at times to spit
> rct@frus.com       |   upon his hands, hoist the black flag, and 
> begin                   |   slitting throats."	-- H.L. Mencken
> ------------------------------------------------------------------------
> --
> To unsubscribe from this list: send the line "unsubscribe linux-
> alpha" in the body of a message to majordomo@vger.kernel.org More 
> majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
------- End of Original Message -------

