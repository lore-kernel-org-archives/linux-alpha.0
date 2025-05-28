Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26D2566FC
	for <linux-alpha@vger.kernel.org>; Wed, 28 May 2025 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419824; cv=none; b=m4l5EevB7izHc2YjvzWeC8RYEcXRCbCJjE+1fbrGoKy/8QGtigduWMkvooqtvD4dZXuuGhGatz1dRmBqW1BbT4Hlv2NfFdd1/bfRlp4/LvCqI7qyMW5MhIdZxSeLdhJqkz/Wa8MeDpbmYJmPigy6Igcntk9B3N+hJ+yOwrQRiQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419824; c=relaxed/simple;
	bh=ikapsARXQZf8eA1s2Uf9Nwh181NRYDlZ4tzTwlRr+TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPzP1cK+b77QDEc+pc2+31gbSKN1/5jNm8BVwWnC1Mo4GfmlyP2T4yQ8SRHpkbmm6/66R1UVyD19KNj5M8ApdaufseTAaNOpwwB4vrEULzQVGmYMT2oaMR2lGONNSLic6U3jdiOTyzXRSJpSNS3YZ5RWdvfaf68Fd3pnBeb4T18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YYdiKkNU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YYdiKkNU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so55947405e9.1
        for <linux-alpha@vger.kernel.org>; Wed, 28 May 2025 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419820; x=1749024620; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SP3lQumpM0dfeFGzUY60+iaib/G0AuztiOAfvL97QZU=;
        b=YYdiKkNUQzfm3uiCpw0OxMdnOA9fZa31CaueYgpMwot0fqJ1Z6PVO837Tq9ptkc7Ig
         UZUenSAGLREnWyUgck6qT0vHfMX1JWmMLdS0dlIAjpzh7afgFjsp3KOkVVKk9HxW9m0e
         TU0vF3vP+3v1GcfI3LFQ6eqJ98SMdlPVuKWVhrTKqFok6wUn6QE3bWd9KDqB0kloY93K
         srQo/Koec6913Wxj2yZVizRGti95aPnq9ldifIlofoIQQuApTeG86WUxcCTozJN8v7ZS
         4SrfUMpchbpn5LQnTLMMMuaRF9IjCjoufsAcSvb2lky2ZbXpcXm3QehPxJGambebDLWf
         7p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419820; x=1749024620;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SP3lQumpM0dfeFGzUY60+iaib/G0AuztiOAfvL97QZU=;
        b=rdNs/krABuK1wZhcLzvR01sI5/GfVy1WeX+9Zf6i3J9W/+ODm10Eivatnbq8UNYY6d
         Lxd/PmsUGZ0OpPqlyPFUsBNeOpfhygQX7oSVhOZiPJOkDeSecXuO5toZicWSA9JIdwmb
         3D7rt2xOeuQZp/aOmXEkOXJuKnKFIlA8uyKZ2ZhY2sUSQMMYlEE2h58u9yNZovdR2HMV
         YZaug5dCYFb9H5mgBskfG6CrRugt+qyRzTufaI40G5syLv2Xocd+D6tdq1V48/68MePf
         GWgZusJ3O5wGfkAYwc6zFdt9mk/Il4WZmUUS209csNppKepdv/QuhUoTYhTRqZfXmV21
         k72Q==
X-Gm-Message-State: AOJu0Yym6rjZl/EjyF89X+bWRAUXnrOC32945X36Ls97wcc7ZK0c79U5
	jqd+S/OoP3Qjl8E1210TbnL4gUssIcpYxENQaCa/m+XPRFKFFffjuTljNyX5JWu5FODssAkWZHF
	RfpDa
X-Gm-Gg: ASbGncs2QnVnDt9jwPpqOAmzJgD02yRKSaxAkndZQAlkuQQfsk92BOkFGFkjyMMl5dk
	gLUq/7DuN7RAoYTbF5UYDvzExYz5ABHPtZAKjMjyD/tA6wdg9azcBYGypudRjGpNbtbnv4yVw5K
	QA7kTT61Ic7lxt5ATzkvmEpCpwubDGWJcoKSRk4kWwzxlF4CdOWcDt0M1Q6Vzj45G4JfomN9RUO
	fVAEDsT+lLCjrDUoMkIrnBgxD2KwQ+BNzuDdK8oKfjIJ9drD1EUQNCaSzi177xct66w0+Tfy+Bq
	GnWwuWHdEpGVDeQpVfGyHjtr6rEnUr2Y/kYKJRaUqfX3CQKAFkPvw8Ny
X-Google-Smtp-Source: AGHT+IHA/pQHUAxpz7PfNmC5aaLi/n/X+Y3CzijRgsbBgSjqgEGsJjQraN2Tg7ZSQn8QgYE+mtdhig==
X-Received: by 2002:a05:600c:511d:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-44c91cc5591mr135670885e9.11.1748419820334;
        Wed, 28 May 2025 01:10:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45072559736sm9495935e9.19.2025.05.28.01.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:10:19 -0700 (PDT)
Date: Wed, 28 May 2025 11:10:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux-alpha@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: [bug report] Linux-2.6.12-rc2
Message-ID: <aDbE6P6e4gd7pbMC@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alpha Maintainers,

Commit 1da177e4c3f4 ("Linux-2.6.12-rc2") from Apr 16, 2005
(linux-next), leads to the following Smatch static checker warning:

arch/alpha/kernel/err_marvel.c:884 marvel_find_io7_with_error() warn: statement has no effect 'csrs->POx_ERR_SUM.csr'
arch/alpha/kernel/err_marvel.c:892 marvel_find_io7_with_error() warn: statement has no effect 'io7->csrs->PO7_ERROR_SUM.csr'

arch/alpha/kernel/err_marvel.c
    797 static struct ev7_pal_io_subpacket *
    798 marvel_find_io7_with_error(struct ev7_lf_subpackets *lf_subpackets)
    799 {
    800         struct ev7_pal_io_subpacket *io = lf_subpackets->io;
    801         struct io7 *io7;
    802         int i;
    803 
    804         /*
    805          * Caller must provide the packet to fill
    806          */
    807         if (!io)
    808                 return NULL;
    809 
    810         /*
    811          * Fill the subpacket with the console's standard fill pattern
    812          */
    813         memset(io, 0x55, sizeof(*io));
    814 
    815         for (io7 = NULL; NULL != (io7 = marvel_next_io7(io7)); ) {
    816                 unsigned long err_sum = 0;
    817 
    818                 err_sum |= io7->csrs->PO7_ERROR_SUM.csr;
    819                 for (i = 0; i < IO7_NUM_PORTS; i++) {
    820                         if (!io7->ports[i].enabled)
    821                                 continue;
    822                         err_sum |= io7->ports[i].csrs->POx_ERR_SUM.csr;
    823                 }
    824 
    825                 /*
    826                  * Is there at least one error? 
    827                  */
    828                 if (err_sum & (1UL << 63))
    829                         break;
    830         }
    831 
    832         /*
    833          * Did we find an IO7 with an error?
    834          */
    835         if (!io7)
    836                 return NULL;
    837 
    838         /*
    839          * We have an IO7 with an error. 
    840          *
    841          * Fill in the IO subpacket.
    842          */
    843         io->io_asic_rev   = io7->csrs->IO_ASIC_REV.csr;
    844         io->io_sys_rev    = io7->csrs->IO_SYS_REV.csr;
    845         io->io7_uph       = io7->csrs->IO7_UPH.csr;
    846         io->hpi_ctl       = io7->csrs->HPI_CTL.csr;
    847         io->crd_ctl       = io7->csrs->CRD_CTL.csr;
    848         io->hei_ctl       = io7->csrs->HEI_CTL.csr;
    849         io->po7_error_sum = io7->csrs->PO7_ERROR_SUM.csr;
    850         io->po7_uncrr_sym = io7->csrs->PO7_UNCRR_SYM.csr;
    851         io->po7_crrct_sym = io7->csrs->PO7_CRRCT_SYM.csr;
    852         io->po7_ugbge_sym = io7->csrs->PO7_UGBGE_SYM.csr;
    853         io->po7_err_pkt0  = io7->csrs->PO7_ERR_PKT[0].csr;
    854         io->po7_err_pkt1  = io7->csrs->PO7_ERR_PKT[1].csr;
    855         
    856         for (i = 0; i < IO7_NUM_PORTS; i++) {
    857                 io7_ioport_csrs *csrs = io7->ports[i].csrs;
    858 
    859                 if (!io7->ports[i].enabled)
    860                         continue;
    861 
    862                 io->ports[i].pox_err_sum   = csrs->POx_ERR_SUM.csr;
    863                 io->ports[i].pox_tlb_err   = csrs->POx_TLB_ERR.csr;
    864                 io->ports[i].pox_spl_cmplt = csrs->POx_SPL_COMPLT.csr;
    865                 io->ports[i].pox_trans_sum = csrs->POx_TRANS_SUM.csr;
    866                 io->ports[i].pox_first_err = csrs->POx_FIRST_ERR.csr;
    867                 io->ports[i].pox_mult_err  = csrs->POx_MULT_ERR.csr;
    868                 io->ports[i].pox_dm_source = csrs->POx_DM_SOURCE.csr;
    869                 io->ports[i].pox_dm_dest   = csrs->POx_DM_DEST.csr;
    870                 io->ports[i].pox_dm_size   = csrs->POx_DM_SIZE.csr;
    871                 io->ports[i].pox_dm_ctrl   = csrs->POx_DM_CTRL.csr;
    872 
    873                 /*
    874                  * Ack this port's errors, if any. POx_ERR_SUM must be last.
    875                  *
    876                  * Most of the error registers get cleared and unlocked when
    877                  * the associated bits in POx_ERR_SUM are cleared (by writing
    878                  * 1). POx_TLB_ERR is an exception and must be explicitly 
    879                  * cleared.
    880                  */
    881                 csrs->POx_TLB_ERR.csr = io->ports[i].pox_tlb_err;
    882                 csrs->POx_ERR_SUM.csr =        io->ports[i].pox_err_sum;
    883                 mb();
--> 884                 csrs->POx_ERR_SUM.csr;                
                        ^^^^^^^^^^^^^^^^^^^^^^
I occasionally try to run Smatch against code that I can't actually
compile and it found this code from before the git era.  These days
we build with -Wall and so this kind of code doesn't normally compile
on x86 or Arm.  We would get a warning like:

test.c:18:9: warning: statement with no effect [-Wunused-value]
   18 |         x;
      |         ^

So it makes me wonder if this code can actually build?

    885         }
    886 
    887         /*
    888          * Ack any port 7 error(s).
    889          */
    890         io7->csrs->PO7_ERROR_SUM.csr = io->po7_error_sum;
    91         mb();
--> 892         io7->csrs->PO7_ERROR_SUM.csr;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    893         
    894         /*
    895          * Correct the io7_pid.
    896          */
    897         lf_subpackets->io_pid = io7->pe;
    898 
    899         return io;
    900 }

regards,
dan carpenter
