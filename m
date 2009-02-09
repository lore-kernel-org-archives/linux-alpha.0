From: Matt Turner <mattst88@gmail.com>
Subject: Need help fixing DRM locking on Alpha
Date: Mon, 9 Feb 2009 16:43:12 -0500
Message-ID: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=h8usxeUos1PzgxQxoT6By0yY8x9Nj7yKCCAGwMmjVSY=;
        b=EPrHYQhxwYowumGhQGmMvE5x0Hm7dchSkO4lyhS+Idd9jtSM/PY5KnzMn5vi9XRkyU
         4uEQfa2LAJpYTrrT0BekPmp2pbTVGmJsTR1a0PXEwRW12NaRrW6hJ4HS/ZisZ5lVqY5r
         yRJglXK0la2sLSQjNuTGfqnLMjnsdkLySOOH0=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org

Hi,

Lately, I've spent time debugging a problem with the DRM locking code on Alpha.

http://bugs.freedesktop.org/show_bug.cgi?id=16549

After searching through the userspace components (libdrm, mesa,
xserver) and not finding any relevant changes, I think the problem
must be located in the kernel.

David Airlie pointed me to possibly relevant commits to alpha's
system.h which contains cmpxchg.

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=history;f=include/asm-alpha/system.h;h=afe20fa58c990927fd10c5e94d41fe4d8d9eee8a;hb=HEAD

Can anyone see where the bug is located?

Thanks,

Matt Turner
