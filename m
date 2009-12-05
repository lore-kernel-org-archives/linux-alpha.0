From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: kernel fails to build without CONFIG_ALPHA_LEGACY_START_ADDRESS
Date: Sat, 05 Dec 2009 19:27:09 +0100
Message-ID: <4B1AA5FD.6050601@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

If CONFIG_ALPHA_LEGACY_START_ADDRESS is not set, which is needed to be
unset if the machine is Marvel/Titan/Wildfire, it fails to build:

  CC      arch/alpha/kernel/err_marvel.o
cc1: warnings being treated as errors
arch/alpha/kernel/err_marvel.c: In function 'marvel_print_err_cyc':
arch/alpha/kernel/err_marvel.c:119: error: format '%ld' expects type
'long int', but argument 6 has type 'u64'
arch/alpha/kernel/err_marvel.c: In function 'marvel_print_po7_ugbge_sym':
arch/alpha/kernel/err_marvel.c:321: error: format '%ld' expects type
'long int', but argument 4 has type 'u64'
arch/alpha/kernel/err_marvel.c:321: error: format '%ld' expects type
'long int', but argument 5 has type 'u64'
arch/alpha/kernel/err_marvel.c: In function 'marvel_print_pox_spl_cmplt':
arch/alpha/kernel/err_marvel.c:560: error: format '%ld' expects type
'long int', but argument 4 has type 'long long unsigned int'
arch/alpha/kernel/err_marvel.c:560: error: format '%ld' expects type
'long int', but argument 5 has type 'long long unsigned int'
arch/alpha/kernel/err_marvel.c:560: error: format '%ld' expects type
'long int', but argument 6 has type 'long long unsigned int'
make[1]: *** [arch/alpha/kernel/err_marvel.o] Error 1
make: *** [arch/alpha/kernel] Error 2
