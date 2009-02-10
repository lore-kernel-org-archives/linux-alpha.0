From: Matt Turner <mattst88@gmail.com>
Subject: Re: Need help fixing DRM locking on Alpha
Date: Tue, 10 Feb 2009 18:18:43 -0500
Message-ID: <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com>
	 <20090210154355.GA27697@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LsL0EpnnPRE4K+zmi0eeq4gnHiBlSRogQSnMW5Ggsm8=;
        b=hTESShW3/JQn7IBUOLHhLwXmY5MuuMJMcDYzKZqejiMzf9XE9b1CJSomN9O+981fMc
         QG5PcXZsyV5xO/o13mFf7HBvoDXHVtJFSIHkWBPoH6cAFGKB29Ykq0cULLE8wdy2EhQ4
         y6dyW+QNJMYtIgnVnw7YU4znAAtVgIfd+NmbE=
In-Reply-To: <20090210154355.GA27697@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org

Hi Ivan,

Your code fixes the problem. Thanks!

I had to make one minor change though: moved 'old' from an output to
an input. That is,

>                 "=m"(__drm_dummy_lock(lock)), \
>                 "=&r"(old)                    \
>               : "r"(new)                      \

becomes

>		  "=m"(__drm_dummy_lock(lock))	\
>		: "r"(old), "r"(new)		\

Please let me know if this change is acceptable. If so, please submit
a patch to the bug report so that proper credit is given to you.

I'm successfully running xserver-1.5.3, mesa-7.2, libdrm-2.4.4, and
xf86-video-ati-6.9.0 with DRI enabled on my UP1500 with a Radeon 9800
AGP. (1230 FPS reported by glxgears :) Next stop is writing an Alpha
virtual machine for Quake 3 :)

Thanks so much,

Matt Turner
