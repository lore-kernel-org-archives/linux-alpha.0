From: "alpha @ steudten Engineering" <alpha@steudten.com>
Subject: kernel-2.6.13.2: MISSING: asm-alpha/diskdump.h
Date: Mon, 03 Oct 2005 20:25:40 +0200
Message-ID: <434177A4.8070101@steudten.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LinuxAlpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


The file asm-alpha/diskdump.h is missing in the 2.6.13 patch .2
build for alpha arch.

The build breaks also with # CONFIG_DISKDUMP is not set

Thomas
