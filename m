From: Guenter Roeck <linux@roeck-us.net>
Subject: alpha patches for v4.4.y / v4.9.y
Date: Sun, 14 Mar 2021 11:33:08 -0700
Message-ID: <44a392c3-418d-3503-7c46-0d283134d980@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:from:subject:autocrypt:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=1bU6NjC0SnZeV7Fu48oXhEwNex81yMb6vob2Wzk1Rxw=;
        b=d2wSAzXF5SQ0KZARP6Txa2XTBLCH1AseYtw1cPKF/jz90djMqWHFbqnVnRmzhaPFBT
         TjRSdiRezat38yVQA5+L2fRAvJT4VUisFSfBOMGAuBujCAHyuJcUcC/gCsp88ort9lSM
         PhpZfJcNeSEEZe9SvshTWzQFCTrX3cN8gP1v3xVT9WBwbblIAPN0p8zzqD4y8ZZOs3kl
         4kqaQBGFoNimHq6IwRiP+ARO8azjSQR0tm4YZ+CcQpdvTQrDonZo8ybavUWSOI/RY4mH
         ynlOvTVOb1FY0Oa3y2tGCfLzoPhu+nU/0TUQAVf2vKUZk0j3AJgKxuc94hWx2QkzNN6f
         qGPA==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stable <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Hi,

I recently started to add basic networking tests to my qemu test environment.
When adding the necessary build options to Alpha kernels, I noticed that v4.4.y
and v4.9.y no longer build due to relocation errors such as

net/built-in.o: In function `__copy_tofrom_user_nocheck':
arch/alpha/include/asm/uaccess.h:364:(.text+0xff444):
		relocation truncated to fit: BRSGP against symbol `__copy_user'

The following patches fix the problem.

v4.9.y:

5ed78e5523fd alpha: add $(src)/ rather than $(obj)/ to make source file path
e19a4e3f1bff alpha: merge build rules of division routines
3eec0291830e alpha: make short build log available for division routines
4758ce82e667 alpha: Package string routines together

8525023121de alpha: switch __copy_user() and __do_clean_user() to normal calling conventions

v4.4.y:

5ed78e5523fd alpha: add $(src)/ rather than $(obj)/ to make source file path
e19a4e3f1bff alpha: merge build rules of division routines
3eec0291830e alpha: make short build log available for division routines
4758ce82e667 alpha: Package string routines together

00fc0e0dda62 alpha: move exports to actual definitions
085354f90796 alpha: get rid of tail-zeroing in __copy_user()
8525023121de alpha: switch __copy_user() and __do_clean_user() to normal calling conventions

Only the last patch of each group is really needed; I pulled the other
patches in to avoid conflicts.

Please consider adding those patches to the respective kernels.

Thanks,
Guenter
