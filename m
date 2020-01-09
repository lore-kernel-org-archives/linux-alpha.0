From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: RE: [PATCH v2 5/9] arc: Constify ioreadX() iomem argument (as in
 generic implementation)
Date: Thu, 9 Jan 2020 06:59:03 +0000
Message-ID: <CY4PR1201MB01201F44C7EBC54F6AA86446A1390@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-6-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <virtualization-bounces@lists.linux-foundation.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578553161; bh=sqFgFf8gDeA6DLe7eNifMlYr3E6rAjwppK+CWXTkHSY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WQEGVbElKm4e9Sx1nyR3bYTz+o6NMHjZ9r85q6gLzV02L44OagJtgu1WI9YHfFUsk
 bqemPNgpMcndc3Q9CedwFNqMClSj6uKA6IQtpWZLqCCNtQG2gY3MIIOZqkngnhN7We
 RrFSqo0WLbxFD+JRH5khDx7bn6YVt0M/iAilIrsB8HwE6ShytEbmYD4lBA/Zs88ZQE
 UjuWlPgdXVpyNOEzD1vSXObFFQy2dcy2qDNWIn4CB05D9Rkrv9NwizowhwOE8hQdIc
 hhgF8ymlr9EBJoouk6gcm+B5nDQ5U8NfXux8Zc777AbZzQBDSChSlHLefc/Ie8P3mZ
 HD93LYxKASA3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8gmFjR/b1fGaQAM2gOqn8nmQPkcV93ur6tT+xau3hk=;
 b=ElhTNwP2fmKqiLkP6K0eVs4wCIBFvBaRLA29KxYaNjUlc3rrSROCayZwnhr75qQ88R6OmPyHS0V739ESZrNJOf35FMuZfmOv/Uv1drt1X0326pJQaFZCo00WJDnqi3FN6ohklNxHE1r/blX9POnbzulv1ZFadJxTbMybIPsb5wU=
In-Reply-To: <20200108200528.4614-6-krzk@kernel.org>
Content-Language: en-US
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Paul Mackerras <paulus@samba.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Nick Kossifidis <mickflemm@gmail.com>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@re>

Hi Krzysztof,

> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the
> address so they can be converted to a "const" version for const-safety
> and consistency among architectures.

Thanks for this clean-up. Looks good to me, so ...

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
