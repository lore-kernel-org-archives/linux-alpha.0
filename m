From: Ian Las <ialas@yahoo.com>
Subject: AW: Continuing UP2000+ problems
Date: Sat, 27 Mar 2010 23:52:26 +0000 (GMT)
Message-ID: <437262.12795.qm@web23802.mail.ird.yahoo.com>
References: <b4198de61003201457g55c00160m6f87e442aff98b0@mail.gmail.com>
Reply-To: Linux on Alpha processors <axp-list@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0815999850408960348=="
Return-path: <axp-list-bounces@redhat.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1269733946; bh=HpUbeK7HWXawPBRAg9ONHU+F8A3+SxnUZ0CvAL2GvIM=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type;
	b=QyPXdM+SNdOIGuWvTOGnOo/zb50yGFvWWZ2p/d4V97uKUEmu4NWDtOHDb7I6Dsq+XF/G9POM1YfL8wcQxSQPuNksj9SLL+sVwPO5ojTtyC32uPGqJ7ChfpXDufrQl1cvmdfznnQWVgI0AsDjPQEL4eplFd3N3ZD4pjOPUez3pqI=
In-Reply-To: <b4198de61003201457g55c00160m6f87e442aff98b0@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/options/axp-list>,
	<mailto:axp-list-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/axp-list>
List-Post: <mailto:axp-list@redhat.com>
List-Help: <mailto:axp-list-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/axp-list>,
	<mailto:axp-list-request@redhat.com?subject=subscribe>
Sender: axp-list-bounces@redhat.com
Errors-To: axp-list-bounces@redhat.com
To: Peter Petrakis <peter.petrakis@gmail.com>, Linux on Alpha processors <axp-list@redhat.com>
Cc: linux-alpha@vger.kernel.org

--===============0815999850408960348==
Content-Type: multipart/alternative; boundary="0-1739209088-1269733946=:12795"

--0-1739209088-1269733946=:12795
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Matt,
had worked with the Debug Monitor on an UP2000+ some time ago.

It is normal for the SROM console to print some alphanumerical values.
Unfortunately my UP 2000* is disassembled at the moment therfore I cannot
compare your values.

To load the Debug Monitor you need the dp264dbm.cmp file.
Had same problem with the transfer rate - it works only at
9600 baud.

On a working system the Debug Monitor starts with a short instruction.
If you have a graphic card installed it comes up even with the
graphics console.=A0

I am not shure if this "06" has anything to do with the POST Code.
To verify this you need to insert a POST Code PCB in preferable
the ISA Slot.

From your description I would assume you have problems with
the SDRAM controller - any one of the Dchips or some soldering
problems. To fix this it's quite complicated as there is no
direct access to the pins.
Try to use another startaddress than 300000 for xload.
The size of the DBM is 0x32d34 maybe you can find a working slot
of that size. I was once lucky on a LX164 board and could locate
the faulty address.

On the LX164 and SX164 systems the SROM Mini Debugger is not
present within the "production" SROM. With a MMJ cables and a MMJ->DB9
adapter you will not be able to see anything.

First you have to burn a new SROM which has the Mini Debugger
implemented - is included in the "ebsdk". The Xilinix chips are only
ROMs - so you need new SROMs which are very expensive. ATMEL offers
EEPROMs which can be reburnt but you need for this at least special
adapters as most standard PROM-Burners are not specified for SROMs.

I am planing to rebuild my UP2000+ again.If you need more information
I could do some more tests.

Best Regards,ian




--- Matt Turner <mattst88@gmail.com> schrieb am Sa, 20.3.2010:

Von: Matt Turner <mattst88@gmail.com>
Betreff: Continuing UP2000+ problems
An: "Peter Petrakis" <peter.petrakis@gmail.com>
CC: "Linux on Alpha processors" <axp-list@redhat.com>, linux-alpha@vger.ker=
nel.org
Datum: Samstag, 20. M=E4rz, 2010 21:57 Uhr

Hi Peter and list,

** Firstly: Please Reply-All, since I've cross-posted. **

I've been working on my UP2000+ again. [1]

I've got
 - a known working SROM chip
 - known working processors
 - known working RAM (tested in DS20L) and another set known working
(tested in XP1000)

the UP2000+ starts and prints this over the SROM console

UP2000/UP2000+...X00080901.01.00005757ec60018.02.000004b0.03.0373bef8c1.05.=
04..06.80000000.14#0000000000000204#.15.3f

=A0=A0=A0which apparently shows that after "Loading uncompressed firmware
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
[3] http://h18006.www1.hp.com/cpq-alphaserver/technology/literature/srommin=
i.pdf
[4] http://alphalinux.org/firmware/api/UP2000plus/UP2000plus_user_manual.pd=
f

_______________________________________________
axp-list mailing list
axp-list@redhat.com
https://www.redhat.com/mailman/listinfo/axp-list
=0A=0A__________________________________________________=0ADo You Yahoo!?=
=0ASie sind Spam leid? Yahoo! Mail verf=FCgt =FCber einen herausragenden Sc=
hutz gegen Massenmails. =0Ahttp://mail.yahoo.com 
--0-1739209088-1269733946=:12795
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Hi Matt,<BR>had worked with the Debug Monitor=
 on an UP2000+ some time ago.<BR><BR>It is normal for the SROM console to p=
rint some alphanumerical values.<BR>Unfortunately my UP 2000* is disassembl=
ed at the moment therfore I cannot<BR>compare your values.<BR><BR>To load t=
he Debug Monitor you need the dp264dbm.cmp file.<BR>Had same problem with t=
he transfer rate - it works only at<BR>9600 baud.<BR><BR>On a working syste=
m the Debug Monitor starts with a short instruction.<BR>If you have a graph=
ic card installed it comes up even with the<BR>graphics console.=A0<BR><BR>=
I am not shure if this "06" has anything to do with the POST Code.<BR>To ve=
rify this you need to insert a POST Code PCB in preferable<BR>the ISA Slot.=
<BR><BR>From your description I would assume you have problems with<BR>the =
SDRAM controller - any one of the Dchips or some soldering<BR>problems. To =
fix
 this it's quite complicated as there is no<BR>direct access to the pins.<B=
R>Try to use another startaddress than 300000 for xload.<BR>The size of the=
 DBM is 0x32d34 maybe you can find a working slot<BR>of that size. I was on=
ce lucky on a LX164 board and could locate<BR>the faulty address.<BR><BR>On=
 the LX164 and SX164 systems the SROM Mini Debugger is not<BR>present withi=
n the "production" SROM. With a MMJ cables and a MMJ-&gt;DB9<BR>adapter you=
 will not be able to see anything.<BR><BR>First you have to burn a new SROM=
 which has the Mini Debugger<BR>implemented - is included in the "ebsdk". T=
he Xilinix chips are only<BR>ROMs - so you need new SROMs which are very ex=
pensive. ATMEL offers<BR>EEPROMs which can be reburnt but you need for this=
 at least special<BR>adapters as most standard PROM-Burners are not specifi=
ed for SROMs.<BR><BR>I am planing to rebuild my UP2000+ again.If you need m=
ore information<BR>I could do some more tests.<BR><BR>Best
 Regards,ian<BR><BR><BR><BR><BR>--- Matt Turner <I>&lt;mattst88@gmail.com&g=
t;</I> schrieb am <B>Sa, 20.3.2010:<BR><BLOCKQUOTE style=3D"border-left: 2p=
x solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"><BR>Von: Ma=
tt Turner &lt;mattst88@gmail.com&gt;<BR>Betreff: Continuing UP2000+ problem=
s<BR>An: "Peter Petrakis" &lt;peter.petrakis@gmail.com&gt;<BR>CC: "Linux on=
 Alpha processors" &lt;axp-list@redhat.com&gt;, linux-alpha@vger.kernel.org=
<BR>Datum: Samstag, 20. M=E4rz, 2010 21:57 Uhr<BR><BR><DIV class=3D"plainMa=
il">Hi Peter and list,<BR><BR>** Firstly: Please Reply-All, since I've cros=
s-posted. **<BR><BR>I've been working on my UP2000+ again. [1]<BR><BR>I've =
got<BR> - a known working SROM chip<BR> - known working processors<BR> - kn=
own working RAM (tested in DS20L) and another set known working<BR>(tested =
in XP1000)<BR><BR>the UP2000+ starts and prints this over the SROM
 console<BR><BR>UP2000/UP2000+...X00080901.01.00005757ec60018.02.000004b0.0=
3.0373bef8c1.05.04..06.80000000.14#0000000000000204#.15.3f<BR><BR>=A0=A0=A0=
which apparently shows that after "Loading uncompressed firmware<BR>into me=
mory" it hits a fatal error.<BR><BR>I installed Windows NT on my 164UX to b=
e able to use the xload.exe<BR>program in the ebsdk [2]. I can successfully=
 transfer images to the<BR>UP2000+ with xload. I've tried<BR><BR> - dp264db=
m.cmp (as shown in the example in the SROM guide [3])<BR> - dp264dbm.img<BR=
> - dp264fsb.cmp<BR> - dp264fsb.img<BR> - dhryV1<BR><BR>Aside, the manual s=
hows `xload dp264dbm.cmp 300000 com1 fast`, but I<BR>had to run `xload dp26=
4dbm.cmp 300000 com1 9600` else I would get<BR><BR>&gt; Syncing with remote=
 terminal...<BR>&gt; Timed out in ReadSerialPort<BR><BR>Once transferred, a=
s shown in the SROM guide, I reconnect with<BR>HyperTerminal and successful=
ly get the SROM&gt; prompt. From here, I<BR>execute `xb` (or `st`
 followed by A&gt; 300000) and it prints '.06' and<BR>hangs. Nothing else i=
s printed to SROM. Nothing is ever printed to<BR>COM1 (The second serial po=
rt on the UX is listening).<BR><BR>A code of 06 in the UP2000+ manual [4], =
page 67, means "L2 cache and<BR>memory ready." I thought maybe this signifi=
es a problem with L2 cache<BR>or memory, so I've jumpered pins 11-12 of J29=
 to disable L2 cache, and<BR>have tried two sets of known working RAM. Sepa=
rately, 06 could mean<BR>"no memory found or bad memory" (as seen under err=
or code 3F). Again,<BR>I've tried two sets of known working RAM, each taken=
 from an EV67+<BR>Alpha.<BR><BR>I've also tried putting the CPU in the seco=
nd slot, no change.<BR><BR>So I'm stuck. I need ideas.<BR><BR>Alternatively=
, I need some MMJ cables and a MMJ-&gt;DB9 adapter to see<BR>how a PC164 be=
haves with this stuff. Does anyone have any they'd like<BR>to send me?<BR><=
BR>Thanks,<BR>Matt Turner<BR><BR>[1] <A
 href=3D"http://www.redhat.com/archives/axp-list/2009-May/thread.html" targ=
et=3D"_blank">http://www.redhat.com/archives/axp-list/2009-May/thread.html<=
/A><BR>[2] <A href=3D"http://www.alphalinux.org/firmware/ebsdk/" target=3D"=
_blank">http://www.alphalinux.org/firmware/ebsdk/</A><BR>[3] <A href=3D"htt=
p://h18006.www1.hp.com/cpq-alphaserver/technology/literature/srommini.pdf" =
target=3D"_blank">http://h18006.www1.hp.com/cpq-alphaserver/technology/lite=
rature/srommini.pdf</A><BR>[4] <A href=3D"http://alphalinux.org/firmware/ap=
i/UP2000plus/UP2000plus_user_manual.pdf" target=3D"_blank">http://alphalinu=
x.org/firmware/api/UP2000plus/UP2000plus_user_manual.pdf</A><BR><BR>_______=
________________________________________<BR>axp-list mailing list<BR><A yma=
ilto=3D"mailto:axp-list@redhat.com" href=3D"/mc/compose?to=3Daxp-list@redha=
t.com">axp-list@redhat.com</A><BR><A href=3D"https://www.redhat.com/mailman=
/listinfo/axp-list"
 target=3D"_blank">https://www.redhat.com/mailman/listinfo/axp-list</A><BR>=
</DIV></BLOCKQUOTE></td></tr></table><br>__________________________________=
________________<br>Do You Yahoo!?<br>Sie sind Spam leid? Yahoo! Mail verf=
=FCgt =FCber einen herausragenden Schutz gegen Massenmails. <br>http://mail=
.yahoo.com 
--0-1739209088-1269733946=:12795--


--===============0815999850408960348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
axp-list mailing list
axp-list@redhat.com
https://www.redhat.com/mailman/listinfo/axp-list
--===============0815999850408960348==--

