From: Witold Baryluk <witold.baryluk@gmail.com>
Subject: Re: dbus-daemon unaligned accesses
Date: Sun, 19 Jan 2020 16:02:56 +0100
Message-ID: <CAEGMnwpdWQ5i35mNzRYb674_Zf7dSyWnErqrGUhcuVbZaSC55g@mail.gmail.com>
References: <20200118160623.GA2136@gherkin.frus.com> <b656550f-76aa-c437-d3d9-36a868b8f093@physik.fu-berlin.de>
 <CAEGMnwooY_KiNzdwUMnQ2k6GyK8884BYAw0-HjrdJGtbnz2PgA@mail.gmail.com> <20200119054916.GA7215@gherkin.frus.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="000000000000f2c89b059c7f787d"
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane-mx.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rtxsIknTNBZqMzqbTkPMji8Zaz0K6iGy0Ttz4WS657I=;
        b=ZhuY4mNwboTHOsYc+jCVb0Qlz+RdQ8yU6XnuV41Jfz4ZzGFF35NOVZQedd66DIX3DW
         FJqDGqTVSuCKZFCduF+zD4kVWlN9UJqDvBD4OrhWqulUd6CQFbD4764/RbrB9HyTJIaT
         Jwx2WXbnTxDMgdIYtZDDei0bWny39p5/PuEonuHeictyz66d1HZyP+bjSvEnEm1lO1bH
         F+M2Kwwpsi8IM2S1YgYvCE9aECOVgnb8+KQkUte3l0X4ZAJEbWTDfnaD1EAccQKCiKNL
         R4g1OlIYD2C+gRpzT48vU81wxUQBOi+BDmAkKZCdK6NfhtlG7f2vGeBlGjsHa6cUwCCY
         pPbA==
In-Reply-To: <20200119054916.GA7215@gherkin.frus.com>
Resent-Message-ID: <Sw5WrzHEWsJ.A.bLB.7-GJeB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAEGMnwpdWQ5i35mNzRYb674_Zf7dSyWnErqrGUhcuVbZaSC55g@mail.gmail.com
To: Bob Tracy <rct@frus.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

--000000000000f2c89b059c7f787d
Content-Type: text/plain; charset="UTF-8"

Yes, it works.

The suggested one line change did work and fixed the issue for me.

I didn't have time to ask for it to be merged.

On Sun, 19 Jan 2020, 06:49 Bob Tracy, <rct@frus.com> wrote:

> On Sat, Jan 18, 2020 at 05:33:31PM +0000, Witold Baryluk wrote:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932381
>
> At first glance, that certainly appears to be the issue.  The
> conversation seems to have stalled-out as of July 2019.
>
> memcpy() looks to be a good way of handling the problem, for the
> reasons mentioned.  Did you try that fix?  If so, did it work for you?
>
> --Bob
>

--000000000000f2c89b059c7f787d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, it works.<div dir=3D"auto"><br></div><div dir=3D"aut=
o">The suggested one line change did work and fixed the issue for me.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t have time to ask=
 for it to be merged.</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sun, 19 Jan 2020, 06:49 Bob Tracy, &lt;<a hre=
f=3D"mailto:rct@frus.com" target=3D"_blank" rel=3D"noreferrer">rct@frus.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, Jan 18, 202=
0 at 05:33:31PM +0000, Witold Baryluk wrote:<br>
&gt; <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D932381"=
 rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://bugs.de=
bian.org/cgi-bin/bugreport.cgi?bug=3D932381</a><br>
<br>
At first glance, that certainly appears to be the issue.=C2=A0 The<br>
conversation seems to have stalled-out as of July 2019.<br>
<br>
memcpy() looks to be a good way of handling the problem, for the<br>
reasons mentioned.=C2=A0 Did you try that fix?=C2=A0 If so, did it work for=
 you?<br>
<br>
--Bob<br>
</blockquote></div>

--000000000000f2c89b059c7f787d--

