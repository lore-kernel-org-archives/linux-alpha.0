From: Bob Tracy <rct@gherkin.frus.com>
Subject: vmlinux.o linker warning
Date: Sun, 22 Sep 2019 15:53:42 -0500
Message-ID: <20190922205342.GA7209@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
Content-Disposition: inline
Resent-Message-ID: <aekyiw7GY0M.A.h_H.599hdB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/20190922205342.GA7209@gherkin.frus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz

Using gcc 9.2 to build current 5.X kernel.org source trees, I'm seeing
several warnings like the following during the linking of "vmlinux.o":

WARNING: vmlinux.o(__ex_table+0x11d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .alphalib:(unknown)
The relocation at __ex_table+0x11d0 references
section ".alphalib" which is not in the list of
authorized sections.  If you're adding a new section
and/or if this reference is valid, add ".alphalib" to the
list of authorized sections to jump to on fault.
This can be achieved by adding ".alphalib" to 
OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.

This is directly due to the workarounds we put in place on alpha for
dealing with relocation errors during the linking of large executables
(such as "firefox" :-)).

These are warnings, but sending a fix upstream sooner rather than later
would probably be a good idea.

--Bob

