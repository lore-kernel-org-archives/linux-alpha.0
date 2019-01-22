From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [PATCH] 4.18-rc7 on alpha: bitsperlong issue
Date: Tue, 22 Jan 2019 10:21:47 +0100
Message-ID: <8a1038a8-2ded-649f-57cd-3d5dabfa4173@amsat.org>
References: <20190121161928.GA12984@gherkin.frus.com>
 <20190121214232.GA14964@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9dlDMd5X8e+UEBMHm/L7VjYzQdNKCKBt59rGhxHuLOQ=;
        b=RaHJ9jglJWGWTfT7N5ElsAfCLqLupWIr7dSZsSQvCHNHsW0fZSRcme88dyciVRsU2q
         uNnb9y6f9NZmbyTRZ1qDUU4pFw1zJ5EIyaEbuxWUg7KRK+h5Xum7/wIdKMat8rEm/F5N
         Y92v7CgrRf5X70Hr2tdNAx08nRayAvCvmNc9BHjamSXFMlqxLXtbZl0i1Dpgk5V8hFA2
         lWcQqH2z7maeGtlbQYsLz8D1bJWbmuYwv3nLJWOC5jMoWljsQIixNvnJzF/q01b9sWVH
         eym+wZrRnIsn+o00/jQLNTKhI4HZzm0OJb1jdCXD/tSCEhjhnvFhOSBIMbpRh6sjiXxx
         3c6g==
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20190121214232.GA14964@gherkin.frus.com>
Content-Language: en-US
Resent-Message-ID: <TP9_A298i0E.A.9OF.9CuRcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/8a1038a8-2ded-649f-57cd-3d5dabfa4173@amsat.org
Content-Type: text/plain; charset="iso-8859-1"
To: Bob Tracy <rct@gherkin.frus.com>, linux-alpha@vger.kernel.org, debian-alpha@lists.debian.org
Cc: mcree@orcon.net.nz, mattst88@gmail.com

Hi Bob,

On 1/21/19 10:42 PM, Bob Tracy wrote:
> Apologies for what is essentially a repost with a proper subject header
> in the sense of trying to get the attention of people who collect/approve
> patches for submission upstream.  See my posting from earlier today
> (followup: [FTBFS] kernel 4.18-rc7 bitsperlong.h issue on alpha) for the
> back story.  As mentioned there, this patch applies cleanly to at least
> all mainline kernel source trees >=3D version 4.18.
>=20
> Further apologies for including the patch as an attachment, but I don't
> trust my mailer not to impose unintended formatting.
>=20
> --Bob
>=20
> Signed-off-by: Bob Tracy <rct@frus.com>
> Tested-by: Bob Tracy <rct@frus.com>

With your "Signed-off-by" tag, the "Tested-by" tag is implicit,
it is expected patches are at least tested by the contributor ;)

That said,
Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Thanks for fixing this,

Phil.

