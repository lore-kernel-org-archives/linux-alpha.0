From: nick <yocto6@gmail.com>
Subject: Fix me in  bootpz.c
Date: Mon, 22 Sep 2014 06:26:32 -0400
Message-ID: <541FF958.7090905@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=MIgspaCmyePIPQRvrFDyzVFFXhtwsuHWTakMEoYdj40=;
        b=lYyZH8ZN287Trb/5WJhVgxUwcnp5MhpREHycwIPa/K99eHUcDaXYf9vNgsZyQsmXZB
         bsH/Tcsx9fyFUt06FedGJJ1DPXcTbz8ZB23ME2/ZZZhIMp9789OYeTxane0ujtemg8QT
         VFdWoFSJEALtgzZu5tlrpg1NS/qTJGBfMc2n14ClnmommjNqSgIPxOTyNMVGTiM4GZAF
         eOvLIjT2fR4bgg7WjuWmPtaW7wXJmoLRiaE1kAZwvySdsdack+3NCJVCfEYRj9vna2Ga
         LdPYq7de1xjZT+3ceoLnjolZbrW8iYvArS08RAGNBjJOSgWiJgsQ035nqDD/+TejjEzy
         hYfQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Greetings to Richard and the other maintainers of the alpha arch,
I am wondering what to do about the malloc area fix me message in bootpz.c
and how to fix this issue or is 2 MB the correct value to be defined for
malloc area as of now and I should just remove the fix me messages around 
the malloc define statment?
Regards,
Nick 
