From: Deepa Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH 1/8] y2038: timex: remove incorrect time_t truncation
Date: Sun, 10 Nov 2019 12:44:47 -0800
Message-ID: <CABeXuvqFmQU+Qr_2nqTwDO_mKWdcym=DP+4v4ray=GYgUFRetw@mail.gmail.com>
References: <20191108203435.112759-1-arnd@arndb.de> <20191108203435.112759-2-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yaSU/J7wlwhTU7SEKEjJAOkDsbzoJGXODvxt454XJLw=;
        b=KtlviDbx5K8fQa8EmJ8dUdQnS1D25sFLvv2BnO2y7dXoCuUhulaZO74INtMIofaTnK
         VSVZztuWWj7q4rrcrHVu3cnF2vmzUckJjbtc5el/QxweFP48BFjiaaNA19BC5VG9zsHf
         c6aeY/UjfmFSeehd0ik8DWnkOufaXDmX6Sykm+HJzLofRSOFzbN0dGTSvsocWi7A7wpo
         dxeq6+AQu484WIh/EWR4zlREMoUXumyCY82AsEZOdIpJ1YPJXtAUejzCJ0NT4bVu8c2t
         CsLdoHuV3G/OO41dQBMANVf0QE1VdqLwQZe+91mkuxG8vARrlqF1YAieAYJX+14kYlJP
         Y3kw==
In-Reply-To: <20191108203435.112759-2-arnd@arndb.de>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: y2038 Mailman List <y2038@lists.linaro.org>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux Network Devel Mailing List <netdev@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>

Thanks for fixing the bug.

Acked-by: Deepa Dinamani <deepa.kernel@gmail.com>
