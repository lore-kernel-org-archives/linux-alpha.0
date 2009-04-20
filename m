From: Matt Turner <mattst88@gmail.com>
Subject: Re: BOOTP image build broken?
Date: Mon, 20 Apr 2009 14:57:23 -0400
Message-ID: <b4198de60904201157n6237343fw8b1eb7351e2d6482@mail.gmail.com>
References: <20090420171740.GA10844@eric.schwarzvogel.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=0//KBGPvptv7BIY74dJMWVK/BCYlTpB3WosLJrziKkU=;
        b=x0CKia8neWns7bUIqjpXAwYU6busBoSpBnMS93ZbB+dpLtt1LKf2/qZ4t+5unS+YZn
         NJrrBt1uRtR3T/hYWz3ZWo4Tdhe9CwS5INpFOKfyjqbiNabYJv8ylqgsoQPYSRFM0eIg
         +r8umoJ97oJsPb7tyz3l7i+aZf3NO6Isn8aak=
In-Reply-To: <20090420171740.GA10844@eric.schwarzvogel.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Hi,

This looks like it's been reported as kernel bug #8685.

Matt Turner
