From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 1/3] Fix call to replaced SuperIO functions
Date: Thu, 9 Sep 2010 00:09:32 -0400
Message-ID: <AANLkTikmsGM72sV5tqXaStcJ0oNT=rFHBp-jbveU3sx7@mail.gmail.com>
References: <1284005311-15698-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type;
        bh=C5B7cqwvxBwLKqtcENxx9u1YlP9IMCfAR+8i2S9DHEA=;
        b=B3Lk4vrAsHn3UXmA8EkGEM8hqAUI4cld4K270wJldrcdDSjD6a3yhLIiz01vrX36aU
         PSxrN2vvTyA76rmzwyqf44b34OYpefIRJ/+hUE/z6TnzIPRhY8P1h3tShMX1Lt3/KTXG
         gECpjYaSTmQSItXTdGoftN/m8YMMuFtgi1BmU=
In-Reply-To: <1284005311-15698-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stable@kernel.org
Cc: linux-alpha@vger.kernel.org, "Morten H. Larsen" <m-larsen@post6.tele.dk>, Matt Turner <mattst88@gmail.com>

Whoops, please ignore the PATCH 1/3 title. This is the only patch
going to -stable.
