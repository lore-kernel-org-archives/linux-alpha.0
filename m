From: Balint Cristian <rezso@rdsor.ro>
Subject: Miata 500 is alphaev6 ? (segfault while configure glibc with --target=alphaev6)
Date: Tue, 9 Sep 2003 14:12:35 +0300
Sender: libc-alpha-owner@sources.redhat.com
Message-ID: <200309091412.35341.rezso@rdsor.ro>
References: <20030903143157.GA17699@localhost> <20030903150024.GA18306@localhost> <20030903151532.GH14376@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-13376-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sources.redhat.com>
List-Subscribe: <mailto:libc-alpha-subscribe@sources.redhat.com>
List-Archive: <http://sources.redhat.com/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sources.redhat.com>
List-Help: <mailto:libc-alpha-help@sources.redhat.com>, <http://sources.redhat.com/ml/#faqs>
In-Reply-To: <20030903151532.GH14376@lug-owl.de>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: libc-alpha@sources.redhat.com

Is subj true ? 
	I get seg fault compiling glibc with --target=alphaev6 some error that segfault at 
the test binary while "cheking long long" 

Is something wrong with gcc or glibc ? Or is not alphaev6, not support alphaev6 instruction set and segfault.

Packages installed:

glibc-2.3.2-78
gcc-3.3.2-3
binutils-2.14.90.0.5-7

