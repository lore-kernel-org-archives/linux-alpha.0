From: "Riccardo Vestrini" <riccardov@sssup.it>
Subject: make bootimage and make bootpfile not working
Date: Tue, 06 Jul 2004 16:57:39 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <web-4798086@sssup.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org

I tried many times to obtain a network-bootable kernel 
image both with kernel 2.6.7 and 2.4.26, but I always got 
link errors while executing make bootpfile and make 
bootimage

at last I succeded building a bootpzfile with 2.6.7, but I 
had to comment printk function in lib/dump_stack.c

If someone is interested and can understand kernel 
programming more than me I can submit the error messages

bye all


                         Riccardo Vestrini
                        <riccardov@sssup.it>
