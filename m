From: "Matt Turner" <mattst88@gmail.com>
Subject: Questions about possible Alpha futex implementation
Date: Tue, 16 Dec 2008 20:59:54 -0500
Message-ID: <b4198de60812161759l5f2d69d9r8f538a935b5a5872@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=cTHN/T/tqyomaqAZzbvs5XNOTtXmbMSDleXq9hgLDg8=;
        b=bYrxGVnRbWPbCC0+0Y/PlNzG4PsBA3SaglxlP1XsAMMO5ltljqpMLoi4ocqQ2Y7/Ht
         H0xKrw6fUtBjakaMSu7PYEcEzqYvPS5zdEIBrOtjmF1h/7oN0YX99qMNNUHyRVgB4vl3
         gUe4H+7MVK56Xs2YfciomvIP1+0Zf4j+WSFes=
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Hi,

Alpha uses a generic futex implementation, which causes some problems [1].

I've read through the code, and it appears as if the implementation
could be done by using the ldq_l/stq_c instructions, relatively easy I
might add.

I have only a few questions.

1) What are the benefits of a native futex implementation, other than
fixing the glibc test failures?
2) Is there a technical reason it hasn't been implemented on Alpha?
3) Am in correct that it could be done with ldq_l/stq_c instructions?

I'm not experienced with kernel development, but I'd like to learn, so
please bear with me.

Thanks,

Matt Turner

[1] http://bugs.gentoo.org/show_bug.cgi?id=205099
