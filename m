Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC2459AE0
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 21:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494737; cv=pass; b=lX8f2sk9wzmc9NWl+jL2wRnhcgtZ7+XL5l/cP5o4wiqmuHijJJg0jmDL0GSGAsD2F4Y5mU85okZ8zNjTVBeacC6U5tzxbETNKu4Zr8pd8HvR2Hbw4F2mIRI/B8Rdlp24axjruNTZL/5FmMjIjX9dATdUs4br8kqp5lmk8iL380I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494737; c=relaxed/simple;
	bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqTbYSkqbJd75iu2xzZMGS5Hn5Zaaj5+65PxmirdTNoVkEwpyIlXsNILgujZvJ5B2z8kUPC53hqY1JZitQPsy6lWpcaqqjAvMmRE6O4NMIiZBoZUPEp8cGMa8KaCAsLwAvfSSJjkYeaECOlYLnf/ZWOfdfM9dP6W02Wt2bSG5e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs9kGkUX; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs9kGkUX"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso9252161fa.1
        for <linux-alpha@vger.kernel.org>; Thu, 08 Oct 2026 14:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494733; cv=none;
        d=google.com; s=arc-20260327;
        b=IWllzFEX12mQtxLM0Omi5DoBvFs3PGARAdeeQ8Jtw0xOVcX8jZgsVt4Aw2tros7l0U
         ViuY84TmS1SaWE+inQasUUzeWgtRKlcTEeJZ4ravHJA9DSgZPRN+yuI3jiGLny0qzUE9
         mEgI9zfpzdfcQq3463sdi79l/O0oxD/25i/Dd+Bz2CoMhm/pFPOPEzW5wGzw3a5e6Jc0
         DBGg7BsNRO6/UJn0KwsctjRzA/4PM/QpNjh+mPEa0EWdEDyNyWYdExZNA8HpyYLkEczw
         eqY5vZGkdKMo1NzBgtxNq8DM3xP44L14cPAWVD+LSvEy65ez5+V9WajCQZp/qvSGWIBX
         HJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
        fh=dfLkjaeE7HBrJkjqERqlmLV6DLZ7cVvv2xyV/+nL0j4=;
        b=OK8bUvo/GBVBihmR4ZLbsjSDQZ7NLbJicfEx1Cpuhs1ieVquUj22zGcFxxiZR74Iaa
         07X9bCouKSkUrV5qSfotr74Bq4J3z75XCUALAzA4TfzXd8lWNRO6ec/5CUbUZR4xk4MX
         m0N5qaNh/a849A1eAI8iyH5//eXoqE+EjyU0L35rfdfKKTZ/G3gxRhqCq5XeFTOzKyWA
         YX/w66gEsUh55PigYtSGkQZGxEmPN8bbJm/C4kw3/DC7G4oFpNiwh78yaQIfq+WO+Ssl
         CVXWDmfNr5lD9lJgXFLr4OJRxLSE73T3kyJ8GtJgP0v82M0t/G2oKvdbyvlXIMxnQBq/
         Ezdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494733; x=1792099533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
        b=Hs9kGkUXVDGQNgSZg7i6qceK2VM4b3QhfkJ9Yn6EqZbxFRE99MYpBCX2GA5l8Lxar8
         PdvGoA1x7DRePTWyF+i5E4xv+2AaPo7WygKG7xjN59vFTcWJxNZ5eUEaJ+3WUoBzM0ae
         cVoHCr2FvwdYydBX9nl99UX1SyYxWQtLHqFYlZJmLH2sNQaY8jsrUA60ZjOTlQsLsmdJ
         spkO6Ke0PZeKs7wRH3/bXuRsNwOd4aa4b8rhRqDwLISs/y78b9usAn/b1Ty4KxwqGCv7
         IzUurzv1kRdiEa7TdWev3fxl5xjpk36T+3DaKzQ+DFTbcL28OVccwiSusdFJrJiIoosN
         63XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494733; x=1792099533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7g+s1Lijk2x3ZtW+DC8TZtx3LkiM/nDXQU5onS2N3s=;
        b=iRjayeocZtauABDGe/S5eqJAyIMmvVn+WVXlMi/zJowjRocmyfZ1cCd4kblnXiwipW
         7QMQxlf9XEhHJNEzp9JnJstauGE3riKVanW3i8RGUlaEKt6ZACPZKHoaEtKjLkg37xoi
         +s/9DvlAYZ1GtY47TCUYuLWrTtZNODTEpgXYI33zUKEyUuhz0dGXjrjW+E1qsBeSfQ0o
         JFQVD2DoaceY6K5inWD9AbD6XdjActlw0eik5Ln2IxuVXMJLJLuTBFSCyvgtZky4Lobf
         p2XBaKKV56JMTd4Ao+N6DYZOHxPV3sTmZAq5DoWyWnz6zdl1qU2trjrjJHozZwJgiwXk
         drwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuktTY0nPlWDa9eBPDXLFmi/w9wMrmEEdzYIXVaCMNsicPImyLiCc5GPjB8IeCB9RbJ08tJnG/7q6YmQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIShCI1LtI8gHsd85bRsNp4i5gQMhbYWol2scWoeUH2P/Rb5ICt
	Yg1lYhu5s0gk7tFokLvk9VH/o5vl8Dau1LkGn03JJxqOQROYAsQzC0TqzjAhMxfcVfqExsRPG97
	I6zoiPf3MbG0yVEtkBDDaWqevQSFangGeT9uI
X-Gm-Gg: AYBFou0cHrrxvv6nC9gvb86X5Go4yFzRqf27c3lmvocTbjkEtcxONI/YES+m3dyVqOn
	4W7YsbjSfuMkHpxaLYX/BWH+9NsQ4Ng+GyLOi+yiRrsYO1ZNQAVGljA/IXU6++Zxe2ImmU2cldD
	Z37D017Ojqa4SY22f+MXim8ianXpl/bPHczartNEOmz1CmfANFfiWmuHambB+IKKPRwwnP4XHIF
	4csP9/jEeryXGFcamyzaKlYmSVRUE254BmAWO5eQEhz0sSKZeusrf77ah9Mx96yakoMHCFnjD+1
	94pjZzlcQbXIQmVjSv3CpXb5b1kJVLS/lnqKDZ/LO4bzUHR3SuI17uM72kg9VmnD1HTpLg3VtfL
	nqMpI0ilUHbkWHA==
X-Received: by 2002:a05:6512:a81:b0:5ba:35ee:bd96 with SMTP id
 2adb3069b0e04-5bcdd54b8cbmr66712e87.41.1791494732764; Thu, 08 Oct 2026
 14:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008195608.965266-1-linmag7@gmail.com> <20261008195608.965266-2-linmag7@gmail.com>
In-Reply-To: <20261008195608.965266-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:25:19 -0400
X-Gm-Features: AclHuK9sf7yMp3FZjXD6vDdr8J77IFSBgkUkzbBb66SHYetuHtwbzGP3_Y_Xu7A
Message-ID: <CAEdQ38GCisZE83bOp13soyDjSrvprWd+avmxNONb3nee4oOUBw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] alpha: load the MMU context when switch_mm()
 switches the current task
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:56=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> ev5_switch_mm() only prepares the incoming PCB. The context is installed
> by PAL_swpctx, which alpha_switch_to() issues against that PCB on the way
> out of the scheduler.
>
> Two callers reach switch_mm_irqs_off() without going through
> alpha_switch_to(): kthread_use_mm(), which borrows an mm for the current
> kernel thread, and sched_force_init_mm() on the CPU-hotplug teardown path=
.
> Neither explicitly loads the context, so the task can carry on running
> under whatever was loaded before while current->mm says otherwise.
>
> The stale page-table root need not be swapper_pg_dir; it may belong to a
> user process that ran on the CPU earlier, and the kthread's user accesses
> can then read and write that process's memory wherever the stale mappings
> allow. Translations taken that way can also end up tagged with the
> borrowed mm's ASN: ev5_switch_mm() writes that ASN into the PCB, which th=
e
> next PAL_swpctx installs against the stale ptbr. An address the stale
> tables do not map faults instead, and since do_page_fault() resolves
> faults against current->mm without reloading the context, the same access
> can fault again on return.
>
> sched_force_init_mm() needs CONFIG_HOTPLUG_CPU, which alpha does not
> support, so kthread_use_mm() is the only one of the two reachable in
> practice; the fix below tests the caller's identity rather than
> special-casing either one.
>
> The scheduler passes the incoming task, which is not current until
> alpha_switch_to() runs; both direct callers pass current. Test for that
> and load the context the way activate_mm() does. Both hold interrupts
> disabled across switch_mm_irqs_off(), so this completes before any
> shootdown can be taken and needs no asn_lock handshake.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Matt Turner <mattst88@gmail.com>


Reviewed-by: Matt Turner <mattst88@gmail.com>
