From: SA <bullet.train@ntlworld.com>
Subject: Fwd: Re: kernel compile problems (tulip / tulip_old) + more
Date: Tue, 20 Aug 2002 13:30:22 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200208201330.22849.bullet.train@ntlworld.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org


Dear Kurt Garloff,

> Compile one or both of them as modules.

the tulip_old driver does not appear in my kernel configuration otherwise
I would remove it so I cannot exclude it or load it as a module, it seems to
be included for compile with the tulip driver which I would like comiled into 
the kernel......  What I would like to do is hack the config files to exclude the 
tulip_old driver but I am concerned that this will give me additional problems


SA 



----------  Forwarded Message  ----------

Return-Path: <linux-alpha-owner@vger.kernel.org>
Received: from vger.kernel.org ([209.116.70.75]) by mta06-svc.ntlworld.com
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20020820122356.YWCJ5047.mta06-svc.ntlworld.com@vger.kernel.org>;
          Tue, 20 Aug 2002 13:23:56 +0100
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id <S316897AbSHTMTq>; Tue, 20 Aug 2002 08:19:46 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org
	id <S316898AbSHTMTq>; Tue, 20 Aug 2002 08:19:46 -0400
Received: from etpmod.phys.tue.nl ([131.155.111.35]:21868 "EHLO
	etpmod.phys.tue.nl") by vger.kernel.org with ESMTP
	id <S316897AbSHTMTq>; Tue, 20 Aug 2002 08:19:46 -0400
Received: from nbkurt.casa-etp.nl (nbkurt.casa-etp.nl [192.168.157.3])
	by etpmod.phys.tue.nl (8.9.3/8.9.3/SuSE Linux 8.9.3-0.1) with ESMTP id OAA20489;
	Tue, 20 Aug 2002 14:23:49 +0200
Received: (from garloff@localhost)
	by nbkurt.casa-etp.nl (8.11.6/8.11.6/SuSE Linux 0.5) id g7KCNmX26951;
	Tue, 20 Aug 2002 14:23:49 +0200
Date: 	Tue, 20 Aug 2002 14:23:48 +0200
From: 	Kurt Garloff <garloff@suse.de>
To: SA <bullet.train@ntlworld.com>
Cc: linux-alpha@vger.kernel.org
Subject: Re: kernel compile problems (tulip / tulip_old) + more
Message-ID: <20020820122348.GC26667@nbkurt.etpnet.phys.tue.nl>
Mail-Followup-To: Kurt Garloff <garloff@suse.de>,
	SA <bullet.train@ntlworld.com>, linux-alpha@vger.kernel.org
References: <200208201009.28318.bullet.train@ntlworld.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  micalg=pgp-sha1;
  protocol="application/pgp-signature";
  boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <200208201009.28318.bullet.train@ntlworld.com>
User-Agent: Mutt/1.4i
X-Operating-System: Linux 2.4.18 i686
X-PGP-Info: on http://www.garloff.de/kurt/mykeys.pgp
X-PGP-Key: 1024D/1C98774E, 1024R/CEFC9215
Organization: TU/e(NL), SuSE(DE)
Sender: 	linux-alpha-owner@vger.kernel.org
Precedence: bulk
X-Mailing-List: 	linux-alpha@vger.kernel.org
Status: R 
X-Status: N
On Tue, Aug 20, 2002 at 10:09:28AM +0100, SA wrote:
> I need to recompile the kernel to include osf partition support, however
> it fails to compile because of a conflict between the tulip driver and the
> tulip_old driver - (some errors below) - in the config menus I can only
> find an option relating to the tulip driver (I have a tulip network card).
> Any ideas ?

Compile one or both of them as modules.

Regards,
--
Kurt Garloff  <garloff@suse.de>                          Eindhoven, NL
GPG key: See mail header, key servers         Linux kernel development
SuSE Linux AG, Nuernberg, DE                            SCSI, Security

-------------------------------------------------------


