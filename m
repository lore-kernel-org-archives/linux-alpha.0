From: George France <france@handhelds.org>
Subject: Re: ALPHA Problem please give info..
Date: Sat, 11 Oct 2003 12:54:47 -0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200310111254.47316.france@handhelds.org>
References: <200310111244.h9BCi7QD021471@indianer.linux-kernel.at> <3F88033A.2040504@steudten.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <3F88033A.2040504@steudten.com>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: alpha@steudten.com, Oliver Pitzeier <oliver@linux-kernel.at>
Cc: Alan Bort <333101@personal.net.py>, James Stevenson <james@stev.org>, linux-alpha@vger.kernel.org

Hello Tom,

It is probably the well known compiler bug.  Which is just my wild guess since, I
do not konw anything about the toollchain that you are using.  I would guess that you 
should either use a different toolchain or raid1.c patch below.

I hope this helps.

--George

diff -urP old/drivers/md/raid1.c new/drivers/md/raid1.c
--- old/drivers/md/raid1.c      Tue Jun 25 04:01:48 2002
+++ new/drivers/md/raid1.c      Mon Oct  7 15:22:39 2002
@@ -473,6 +473,12 @@
                goto rb_out;
        
 
+#if defined(CONFIG_ALPHA) && (__GNUC__ == 2) && (__GNUC_MINOR__ == 96) 
+       /* Work around a compiler bug in gcc 2.96 20000731
+          (Red Hat Linux 7.1 2.96-102) */
+       new_disk = *(volatile int *)&new_disk;
+#endif
+
        /* make sure that disk is operational */
        while( !conf->mirrors[new_disk].operational) {
                if (new_disk <= 0) new_disk = conf->raid_disks;
@@ -526,6 +532,11 @@
        
        /* Find the disk which is closest */
        
+#if defined(CONFIG_ALPHA) && (__GNUC__ == 2) && (__GNUC_MINOR__ == 96) 
+       /* Work around a compiler bug in gcc 2.96 20000731
+          (Red Hat Linux 7.1 2.96-102) */
+       disk = *(volatile int *)&disk;
+#endif
        do {
                if (disk <= 0)
                        disk = conf->raid_disks;



On Saturday 11 October 2003 09:18 am, Thomas Steudten wrote:
> Hi
>
> I got a strange oops from the 2.6.0-pre7 kernel on alpha.
> Can anybody who uses this kernel, an alpha cpu, the md/ raid1
> drivers give me the following info please:
>
> - output /proc/cpuinfo or more..
> - disassembly of read_balance() function in raid1.o or from the
>    kernel. The gcc options use to compile from "make V=1 boot".
>    You can generate a new raid1.o with.
>    1. cd ./linux
>    2. rm drivers/md/raid1.o
>    3. make V=1 drivers/md/raid1.o
>    4. look at the gcc line
>    5. Add -g and -fverbose-asm to the end of the gcc line.
>    6. copy paste the gcc line and execute it.
>    7. objdump -S -D -l drivers/md/raid1.o > /tmp/A
>    8. send the disassembly from read_balance from /tmp/A
>       to alpha@steudten.com.
>
> Thanks in advance..
>
> Regards
> Tom
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

