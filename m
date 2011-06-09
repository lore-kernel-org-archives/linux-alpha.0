From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 0/3] alpha, drm: Update Alpha DRM support
Date: Thu, 9 Jun 2011 19:07:54 -0400
Message-ID: <BANLkTimZ02p83xpsLDXJz3Wv7zQQz6=Kig@mail.gmail.com>
References: <20110609180604.7cac8b5a.jay.estabrook_gmail.com@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=5rMDPFXwxpqSXE+PZkwYj8/UHF78X6ofm0Mp7TQj1MA=;
	b=YVX0Z89ccaQz25y5kScKFEwmPwbD5U8t6SKXBbpg2CiQrUxGWflUOJa6NRQUxxiUDz
	8IXBoFmHXm+OQtlOrGuQCIL+FYJVvw3lAg0wZ/+rwUADZ3ljEnqMJiQKVLOIDssNseL2
	AfiRVenp52ojFs2pqOb4o/fuZOr5VNijRoRUQ=
In-Reply-To: <20110609180604.7cac8b5a.jay.estabrook_gmail.com@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Jay Estabrook <jay.estabrook@gmail.com>
Cc: =?ISO-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, Richard Henderson <rth@twiddle.net>

On Thu, Jun 9, 2011 at 6:06 PM, Jay Estabrook <jay.estabrook@gmail.com> wro=
te:
>
> This patch set fixes Alpha-specific support in the DRM code,
> allowing Radeon KMS and the MGA driver to work properly on
> Alpha-based machines.
>
> Jay
>
> Jay Estabrook (3):
> =A0alpha, drm: Update Alpha DRM support
> =A0alpha, drm: Cleanup Alpha support in DRM generic code
> =A0alpha, drm: Remove obsolete Alpha support in MGA DRM code
> =A0alpha, drm: Add Alpha support to Radeon DRM code
>
> =A0drivers/gpu/drm/drm_bufs.c =A0 =A0 =A0 =A0 =A0| =A0 =A03 ---
> =A0drivers/gpu/drm/drm_vm.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/gpu/drm/mga/mga_drv.h =A0 =A0 =A0 | =A0 19 -------------------
> =A0drivers/gpu/drm/radeon/radeon_ttm.c | =A0 23 +++++++++++++++++++++++
> =A04 files changed, 24 insertions(+), 23 deletions(-)

Patches 1 and 3 are

Tested-by: Matt Turner <mattst88@gmail.com>

They also fix

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D23227

In that report, Michel Danzer had some comments about the patch, so
I'm CC'ing him.

Thanks!
Matt
