From: Matt Turner <mattst88@gmail.com>
Subject: Alpha kernel tree?
Date: Thu, 19 Mar 2009 22:20:57 -0400
Message-ID: <b4198de60903191920vf3a9b17sa3e118e2f3a32e08@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=7e/DzBAC+WcrqY/yLw8yGeWW62SwPPr9hBhRqzFnNkU=;
        b=RxUMFiWBrij9MbzS6QIszyyR/0VHI8VGlzMp32gnI6Qy5pGz0kom/8I/jyVcjAuQRM
         5hJ/5smdPZXJAUuxQRYOjS20sRPTcdHeMc6U5qpkZZw1+ml9A3AzEQH+sThGBj/OtetX
         G7HS9FLnkwSGgRSLtfj1+GP7jnyEp+Mn2TvTU=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jay Estabrook <jay.estabrook@hp.com>, Richard Henderson <rth@twiddle.net>

Hi,

Does anyone have an alpha kernel tree for collecting patches for Linus?

Patches like this one
(http://marc.info/?l=linux-kernel&m=123486766029313&w=2) would
probably be more widely tested if users knew that all they needed to
do was grab the sources from a git tree.

If no tree exists, does anyone volunteer to step up and create one?

Thanks,

Matt Turner
