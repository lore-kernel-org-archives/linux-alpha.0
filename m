From: Matt Turner <mattst88@gmail.com>
Subject: Continuing UP2000+ problems
Date: Sat, 20 Mar 2010 17:57:41 -0400
Message-ID: <b4198de61003201457g55c00160m6f87e442aff98b0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=MmSpuN6W3LyaT33nX+oYffvLloDDbG3Yf3WRBUpCVKc=;
        b=CC6BSepcLjmn+sjrNJfwygUv3g4S6ehI4pbN9Kdc1I74OxX98rQgcQoDvAcr1a2iWT
         bSobpdpgRs7zCgnauPp8jFFCtuaQQxKb95nQn69DhH+FqJlqesN2PlEpLXkvSkvDPLNH
         oAqKwCT5F2VQA2kg1ijvfQ9G6T8DOM54fKwD0=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Petrakis <peter.petrakis@gmail.com>
Cc: Linux on Alpha processors <axp-list@redhat.com>, linux-alpha@vger.kernel.org

Hi Peter and list,

** Firstly: Please Reply-All, since I've cross-posted. **

I've been working on my UP2000+ again. [1]

I've got
 - a known working SROM chip
 - known working processors
 - known working RAM (tested in DS20L) and another set known working
(tested in XP1000)

the UP2000+ starts and prints this over the SROM console

UP2000/UP2000+...X00080901.01.00005757ec60018.02.000004b0.03.0373bef8c1.05.04..06.80000000.14#0000000000000204#.15.3f

   which apparently shows that after "Loading uncompressed firmware
into memory" it hits a fatal error.

I installed Windows NT on my 164UX to be able to use the xload.exe
program in the ebsdk [2]. I can successfully transfer images to the
UP2000+ with xload. I've tried

 - dp264dbm.cmp (as shown in the example in the SROM guide [3])
 - dp264dbm.img
 - dp264fsb.cmp
 - dp264fsb.img
 - dhryV1

Aside, the manual shows `xload dp264dbm.cmp 300000 com1 fast`, but I
had to run `xload dp264dbm.cmp 300000 com1 9600` else I would get

> Syncing with remote terminal...
> Timed out in ReadSerialPort

Once transferred, as shown in the SROM guide, I reconnect with
HyperTerminal and successfully get the SROM> prompt. From here, I
execute `xb` (or `st` followed by A> 300000) and it prints '.06' and
hangs. Nothing else is printed to SROM. Nothing is ever printed to
COM1 (The second serial port on the UX is listening).

A code of 06 in the UP2000+ manual [4], page 67, means "L2 cache and
memory ready." I thought maybe this signifies a problem with L2 cache
or memory, so I've jumpered pins 11-12 of J29 to disable L2 cache, and
have tried two sets of known working RAM. Separately, 06 could mean
"no memory found or bad memory" (as seen under error code 3F). Again,
I've tried two sets of known working RAM, each taken from an EV67+
Alpha.

I've also tried putting the CPU in the second slot, no change.

So I'm stuck. I need ideas.

Alternatively, I need some MMJ cables and a MMJ->DB9 adapter to see
how a PC164 behaves with this stuff. Does anyone have any they'd like
to send me?

Thanks,
Matt Turner

[1] http://www.redhat.com/archives/axp-list/2009-May/thread.html
[2] http://www.alphalinux.org/firmware/ebsdk/
[3] http://h18006.www1.hp.com/cpq-alphaserver/technology/literature/srommini.pdf
[4] http://alphalinux.org/firmware/api/UP2000plus/UP2000plus_user_manual.pdf
