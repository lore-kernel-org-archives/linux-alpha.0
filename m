From: Matt Turner <mattst88@gmail.com>
Subject: Re: alpha 2.6.31.4 mixart gcc ICE
Date: Mon, 30 Nov 2009 22:56:13 -0500
Message-ID: <b4198de60911301956w37ce0696y7332f782a5288ea4@mail.gmail.com>
References: <20091015133702.GE9971@stro.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=OIBx26T6ctHYH5mXw3YqbBK1NVrdyrFmcLSJiiK5cqY=;
        b=xS9iVWwCdRTM4Zc9B/F+QWcoG7ZlDqGtYL9TZIbWhTe2NPlfrg0AgR+dgcfYkhhD7G
         R9oODD0xzJlL0zdhHfT+g7noL2qUtjV3dZG9VdXnDJAEMvyDjjJaI24dyzlEiD+zsWVW
         2SEzoQYPkkIGc/gvylxdfjZEosxbqrYQQGan4=
In-Reply-To: <20091015133702.GE9971@stro.at>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, debian-kernel@lists.debian.org

On Thu, Oct 15, 2009 at 8:37 AM, maximilian attems <max@stro.at> wrote:
> with latest 2.6.31.4 fixes alpha linux-2.6 fails on
> CC [M] =A0sound/pci/mixart/mixart_mixer.o
> /build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/p=
ci/mixart/mixart_mixer.c: In function 'mixart_pcm_sw_put':
> /build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/p=
ci/mixart/mixart_mixer.c:946: error: unrecognizable insn:
> (insn 100 18 101 2 /build/buildd/linux-2.6-2.6.31/debian/build/source=
_alpha_none/sound/pci/mixart/mixart_mixer.c:932 (set (reg:DI 109)
> =A0 =A0 =A0 =A0(ne:SI (reg/v:DI 72 [ is_aes ])
> =A0 =A0 =A0 =A0 =A0 =A0(const_int 0 [0x0]))) -1 (nil))
> /build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/p=
ci/mixart/mixart_mixer.c:946: internal compiler error: in extract_insn,=
 at recog.c:2001
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions
> http://experimental.debian.net/fetch.php?&pkg=3Dlinux-2.6&ver=3D2.6.3=
1-1~experimental.2&arch=3Dalpha&stamp=3D1255523003&file=3Dlog&as=3Draw

What version of gcc is this? Does it happen to be 4.4.2?

If so, see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D42113

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
