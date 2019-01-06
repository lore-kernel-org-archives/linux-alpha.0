From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: fdisk vs. BSD disklabels and slices
Date: Sun, 6 Jan 2019 17:23:28 -0600
Message-ID: <20190106232328.GA27064@gherkin.frus.com>
References: <20190106223135.GA26510@gherkin.frus.com>
 <CAEdQ38GPTUMbi6A7yPMC_3-V_dfxzqQk00we9w_sC+4h5sRuTg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38GPTUMbi6A7yPMC_3-V_dfxzqQk00we9w_sC+4h5sRuTg@mail.gmail.com>
Resent-Message-ID: <w_PjSdglP2J.A.W1H.B4oMcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190106232328.GA27064@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, mcree@orcon.net.nz

On Sun, Jan 06, 2019 at 02:46:54PM -0800, Matt Turner wrote:
> On Sun, Jan 6, 2019 at 2:31 PM Bob Tracy <rct@gherkin.frus.com> wrote:
> >
> > Has anyone reading this used a recent version of "fdisk" to create a BSD
> > disklabel and disk slices from scratch on an Alpha?  If so, would you
> > please describe the procedure in enough detail that relevant Linux
> > installation documentation could be updated?  It would seem to be anything
> > *but* intuitive :-(.
> 
> fdisk's BSD disklabel support has been unusable raw disks, as far as I
> understand, since v2.23. See
> https://www.spinics.net/lists/util-linux-ng/msg11869.html
> 
> > If "fdisk" is the wrong utility, I need a pointer to the correct one(s).
> > At this point, I'm seriously considering digging out my old Debian 4.0
> > CDs and harvesting the essential pieces.
> >
> > As always, thanks in advance.
> 
> Use 'parted' instead. It works well. Reminds me that I need to change
> the Gentoo handbook to reference parted instead of fdisk.
> 
> > For what it's worth, the new Gentoo "install-alpha-minimal" image fixed
> > the "qla1280" firmware loading issue for the most part (a module reload
> > is required to get the firmware to load).
> 
> Good to hear. I suspect the module is in the initramfs but the
> firmware is on the root file system. Hmm..

Re: parted.  Thanks.  Presumably included in the i-a-m image: count on
me to say something if not :-).  Appreciate the steer.

--Bob

