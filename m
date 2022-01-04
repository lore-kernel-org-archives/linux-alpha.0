From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Date: Tue, 4 Jan 2022 01:49:42 +0000
Message-ID: <YdOntksAAhc/oaU1@zeniv-ca.linux.org.uk>
References: <20220103181956.983342-1-walt@drummond.us>
 <YdNE6UXRT02135Pd@zeniv-ca.linux.org.uk>
 <CADCN6nx4VWtR79TBDTENRExjsa=KAGuUpyz06iu2EGmSTPyc+Q@mail.gmail.com>
 <YdOf4WBwR1H93GAt@zeniv-ca.linux.org.uk>
Mime-Version: 1.0
Return-path: <ceph-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YdOf4WBwR1H93GAt@zeniv-ca.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walt Drummond <walt@drummond.us>
Cc: aacraid@microsemi.com, anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, rth@twiddle.net, richard@nod.at, serge@hallyn.com, rostedt@goodmis.org, tglx@linu

On Tue, Jan 04, 2022 at 01:16:17AM +0000, Al Viro wrote:
> On Mon, Jan 03, 2022 at 05:00:58PM -0800, Walt Drummond wrote:
> > I simply wanted SIGINFO and VSTATUS, and that necessitated this.
> 
> Elaborate, please.  What exactly requires more than 32 rt signals?

More to the point, which system had SIGINFO >= SIGRTMIN?  Or signals
with numbers greater than SIGRTMAX, for that matter?

I really don't get it...
