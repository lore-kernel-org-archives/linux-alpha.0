From: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Date: Tue, 4 Jan 2022 17:23:19 -0500
Message-ID: <YdTI16ZxFFNco7rH@mit.edu>
References: <20220103181956.983342-1-walt@drummond.us>
 <87iluzidod.fsf@email.froward.int.ebiederm.org>
 <YdSzjPbVDVGKT4km@mit.edu>
 <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
Mime-Version: 1.0
Return-path: <linux-scsi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87pmp79mxl.fsf@email.froward.int.ebiederm.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Walt Drummond <walt@drummond.us>, aacraid@microsemi.com, viro@zeniv.linux.org.uk, anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, rth@twiddle.net, richa

On Tue, Jan 04, 2022 at 04:05:26PM -0600, Eric W. Biederman wrote:
> 
> That is all as expected, and does not demonstrate a regression would
> happen if SIGPWR were to treat SIG_DFL as SIG_IGN, as SIGWINCH, SIGCONT,
> SIGCHLD, SIGURG do.  It does show there is the possibility of problems.
> 
> The practical question is does anything send SIGPWR to anything besides
> init, and expect the process to handle SIGPWR or terminate?

So if I *cared* about SIGINFO, what I'd do is ask the systemd
developers and users list if there are any users of the sigpwr.target
feature that they know of.  And I'd also download all of the open
source UPS monitoring applications (and perhaps documentation of
closed-source UPS applications, such as for example APC's program) and
see if any of them are trying to send the SIGPWR signal.

I don't personally think it's worth the effort to do that research,
but maybe other people care enough to do the work.

> > I claim, though, that we could implement VSTATUS without implenting
> > the SIGINFO part of the feature.
> 
> I agree that is the place to start.  And if we aren't going to use
> SIGINFO perhaps we could have an equally good notification method
> if anyone wants one.  Say call an ioctl and get an fd that can
> be read when a VSTATUS request comes in.
> 
> SIGINFO vs SIGCONT vs a fd vs something else is something we can sort
> out when people get interested in modifying userspace.


Once VSTATUS support lands in the kernel, we can wait and see if there
is anyone who shows up wanting the SIGINFO functionality.  Certainly
we have no shortage of userspace notification interfaces in Linux.  :-)

   	   	       		 	      - Ted
