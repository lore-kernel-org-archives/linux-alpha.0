From: maximilian attems <max@stro.at>
Subject: alpha 2.6.31.4 mixart gcc ICE
Date: Thu, 15 Oct 2009 15:37:02 +0200
Message-ID: <20091015133702.GE9971@stro.at>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, debian-kernel@lists.debian.org

with latest 2.6.31.4 fixes alpha linux-2.6 fails on
CC [M]  sound/pci/mixart/mixart_mixer.o
/build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/pci/mixart/mixart_mixer.c: In function 'mixart_pcm_sw_put':
/build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/pci/mixart/mixart_mixer.c:946: error: unrecognizable insn:
(insn 100 18 101 2 /build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/pci/mixart/mixart_mixer.c:932 (set (reg:DI 109)
        (ne:SI (reg/v:DI 72 [ is_aes ])
            (const_int 0 [0x0]))) -1 (nil))
/build/buildd/linux-2.6-2.6.31/debian/build/source_alpha_none/sound/pci/mixart/mixart_mixer.c:946: internal compiler error: in extract_insn, at recog.c:2001
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions
http://experimental.debian.net/fetch.php?&pkg=linux-2.6&ver=2.6.31-1~experimental.2&arch=alpha&stamp=1255523003&file=log&as=raw


