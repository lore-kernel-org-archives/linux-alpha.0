From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: firefox-esr 52.6.0 available for alpha
Date: Wed, 28 Feb 2018 21:33:26 +1300
Message-ID: <20180228083326.hh6yj2io4srbt34x@tower>
References: <20180228064354.GA28665@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
In-Reply-To: <20180228064354.GA28665@gherkin.frus.com>
Resent-Message-ID: <85sT-xejPyO.A.txF.G6mlaB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180228083326.hh6yj2io4srbt34x@tower
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

On Wed, Feb 28, 2018 at 12:43:54AM -0600, Bob Tracy wrote:
> At some point in the near future, it will no longer be possible to build
> Firefox on an Alpha unless someone takes up the gauntlet and puts
> together a working Rust compiler. 

Rust uses the LLVM backend.  There was once an experimental Alpha
backend to LLVM.  I am currently attempting to forward port it to
more recent LLVM to see if it might be useful.  It only supported
EV6 and better CPUs which is a higher CPU standard than in Debian
Alpha.  I might get it back to EV56 (when BWX was introduced) and
be able to make sub-architectures to optionally switch in MVI and
CIX. But I have no intention of supporting anything without the
BWX.  And I doubt it will ever produce code the quality of gcc.

I do have a patch that would switch the Debian gcc to produce
code, by default, with BWX.  I haven't ever got around to sending
it to the gcc maintainer to switch over Debian Alpha to only
support Alphas with BWX.  But if I did that then if we ever got
LLVM going again on Alpha there would be no baseline
incompatibility.

Cheers
Michael.

