From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 03/31] Add alpha-specific parity functions
Date: Mon, 28 Mar 2016 11:33:21 -0700
Message-ID: <56F978F1.1060804@twiddle.net>
References: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
 <56F772FA.1030104@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=2HF4pmoeJgc2DIRshHwNMx4ml8bclX6+FO2frnnaKJM=;
        b=SyJwMeZjVO7CnaDw0fabl4C0Jr0//DV59mR5DB2GiTj12i8ZdIFlBV1GHCBvRMAM/h
         uLdEXRAHvrEFo0b7MxVGuYtpiqRzgTR8oKC+uC1eZnzrYs+MyDTGj0TnWUDMDxWoOLkR
         isY2zZStCO51EPzUNN3u+h1qkLuXa/UUf1g9jySY22ynCyFiaR12m+CnA0S70IflAd8t
         3amCe7ZPqsOL9kZ1sZGT69/fZg8OK7Rarlk8dpj2jG1P6S8mpIPTtzN+XHHTO0UtdU/U
         7LZObgBUwHKTHPc1yYaqfqciODvTiAijNlfks74YZbdIZqg+064zc2cfBMT0vP4K9e9q
         PVWA==
In-Reply-To: <56F772FA.1030104@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "zhaoxiu.zeng" <zhaoxiu.zeng@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 03/26/2016 10:43 PM, zhaoxiu.zeng wrote:
> From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
>
> Signed-off-by: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
> ---
>   arch/alpha/include/asm/bitops.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)

Acked-by: Richard Henderson <rth@twiddle.net>


r~
