From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
Date: Mon, 3 Jan 2022 18:48:09 +0000
Message-ID: <YdNE6UXRT02135Pd@zeniv-ca.linux.org.uk>
References: <20220103181956.983342-1-walt@drummond.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220103181956.983342-1-walt@drummond.us>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Walt Drummond <walt@drummond.us>
Cc: aacraid@microsemi.com, anna.schumaker@netapp.com, arnd@arndb.de, bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, rth@twiddle.net, richard@nod.at, serge@hallyn.com, rostedt@goodmis.org, tglx@linu

On Mon, Jan 03, 2022 at 10:19:48AM -0800, Walt Drummond wrote:
> This patch set expands the number of signals in Linux beyond the
> current cap of 64.  It sets a new cap at the somewhat arbitrary limit
> of 1024 signals, both because it=E2=80=99s what GLibc and MUSL support and
> because many architectures pad sigset_t or ucontext_t in the kernel to
> this cap.  This limit is not fixed and can be further expanded within
> reason.

Could you explain the point of the entire exercise?  Why do we need more
rt signals in the first place?

glibc has quite a bit of utterly pointless future-proofing.  So "they
allow more" is not a good reason - not without a plausible use-case,
at least.
