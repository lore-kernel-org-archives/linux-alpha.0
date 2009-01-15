From: Cheng Renquan <crquan@gmail.com>
Subject: Re: [PATCH] do_pipe cleanup: drop its last user in arch/alpha/
Date: Thu, 15 Jan 2009 16:00:55 +0800
Message-ID: <91b13c310901150000i30aba4a4ob0be4706fabb1e08@mail.gmail.com>
References: <1231923693-17968-1-git-send-email-crquan@gmail.com>
	 <1231924185-18018-1-git-send-email-crquan@gmail.com>
	 <496E80FF.8060106@twiddle.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=wBDAHkXACklq3k6zLoknKKzun1Kc9PRtJ+iwI4wTdmQ=;
        b=PB7psC5EHGf9yNUVVunNSEyUcoID+wgErgVRXIeZuyVERrtY12Dz3BW3iUmP/LvTf6
         GpC904W9QYDYUrVsWrV9sRyNhbRIZ4KyNNizaEf4yOlRvxXIrcwq4wiQx6r0Nm9iMj6U
         uNvIRX/BNMPV0P7co1MpSV25LEhOBMuIrtt5U=
In-Reply-To: <496E80FF.8060106@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Richard Henderson <rth@twiddle.net>
Cc: linux-alpha@vger.kernel.org

On Thu, Jan 15, 2009 at 8:19 AM, Richard Henderson <rth@twiddle.net> wr=
ote:
> Cheng Renquan wrote:
>>
>> The last user of do_pipe is in arch/alpha/, after replacing it with
>> do_pipe_flags, the do_pipe can be totally dropped.
>
> Ack.

So then who is the committer of this patch? Could you please consider
update the MAINTAINERS file? Please add the maintainers' git tree, and
this mailling list, I've almost ignored it and forgot to Cc to
linux-alpha@vger.kernel.org.

Thanks.

Something like:

---

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f65a26..8dd39f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -357,6 +357,7 @@ S:	Odd Fixes for 2.4; Maintained for 2.6.
 P:	Ivan Kokshaysky
 M:	ink@jurassic.park.msu.ru
 S:	Maintained for 2.4; PCI support for 2.6.
+L:	linux-alpha@vger.kernel.org

 AMD GEODE CS5536 USB DEVICE CONTROLLER DRIVER
 P:	Thomas Dahlmann

>
> r~
>

--=20
Cheng Renquan (=E7=A8=8B=E4=BB=BB=E5=85=A8), Shenzhen, China
Robert Orben  - "To err is human - and to blame it on a computer is
even more so."
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
