From: Bob Tracy <rct@gherkin.frus.com>
Subject: firefox-esr 52.6.0 available for alpha
Date: Wed, 28 Feb 2018 00:43:54 -0600
Message-ID: <20180228064354.GA28665@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <1ho6X0YrMm.A.-4E.zTllaB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20180228064354.GA28665@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org

Yes.  Just in case you don't regularly check for updates to the Debian
"unstable/sid" distribution, the long wait for a modern version of
Firefox on the Alpha is over.  For now...

No idea how much longer Michael and I can keep resurrecting Lazarus.
At some point in the near future, it will no longer be possible to build
Firefox on an Alpha unless someone takes up the gauntlet and puts
together a working Rust compiler.  Considering how few of us there are
who might benefit from the effort, it would definitely have to be a
labor of love, performed by someone who does the impossible just because
someone said he couldn't do it.

Of potential interest are some build statistics for Firefox on at least
two different Alpha platforms.  On one of the Debian buildd systems (an
ES45 with 3 CPUs and an unknown amount of RAM), the build took 11:13:17
and approx. 12 GB of disk space.  On my PWS 433au with 1.5 GB of RAM
(maximum amount) and 2.5 GB of swap (pretty much the minimum required),
the build takes over 5 *days* if tests are enabled.

Anyway, enjoy, and pass along your thanks and kudos to Michael.  I'm
pretty much done with Firefox builds on my local machine after this
go-round.  The PWS is too underpowered and otherwise resource-starved
to continue down this road :-(.

--Bob

