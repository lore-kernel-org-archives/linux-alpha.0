Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E647CA6D
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789510896; cv=pass; b=QQDj9U4ewHi4ZF7qnhLQbWwNPS/1siaF1H5Vqxzfcq1XcyhDMRS01R6jzRDNX+Ub+H0abfwhGTIIyvaAean/i+WR99fv/Kp+CFda4AVB6JdW4fF0DQEtouD0mAWflY0rIFWjbOEKkygph6Kd+kIpvYJZdulYmzLOSCMq6ywWviI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789510896; c=relaxed/simple;
	bh=zMEH3dKvgIFeOLNgenpgNKtSSPQyo3I2Bi4hOFPx7Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZWNvWeqATms0ktY3JyEQJji2eg/9+f+J0W2KtekoN0JmJwNT74Fv8IzMAhep00FVm9jSIWxbj4kZUNjLOAsrPXkaAI1cQyNGjY8r0b5D+OHUtcwz96BtGC8IGONPSF2vTlRiowykvZ9l3/lZFXFS+JleMl1/lXB6tQhUIdTHK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IV/k2TQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB07AtjI; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IV/k2TQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB07AtjI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZRMN1316877
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jev5yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so10163378fac.3
        for <linux-alpha@vger.kernel.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=JKRAjFeEY1eW4/eQnWGCIWZ+TXeDAPIOMAogS2gnv6KjZHxK5oaDzYiHMjcr1tq3Ac
         iuLGNTEuLSNhsLb1DWh9NTIZI9WFaQz9YQn7UFAzOCsNt0lGXp4DVNvqLMyRNupoECeG
         ylA/dNkIV7qs0PBI8fXKGPqwgZxiHOq0uY1I5TYuDJuLTgimiagu5AP2CdvfI+S+IxB2
         o5l0y1VRJQp7LAdNKnNPcQkAUEmoM4nknz9kGkNGBkJ0SG7e89VS9bBNG3ZNmtUbJZwt
         JAq6X/8e8hT2+eAYnj/PITluHrWY5ULgqSdXUv0s0/XEHuK1RXXvlD+ut/yMZ1h3JCfp
         04Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=1pk/BeX7aADHV3LWCvx0su60KIZDhA3tDDtzrOYuzq4=;
        b=GF86KUws6r0dqWR3xbZWP/GrfBmRqGvI7eXrCUFtWRyMUxiaM12ZeLAvLVUYePxthu
         MFrIKbV0aS4sLtXP9wSzR+F/vWZUwMiK/TjJ9m12Ht+w20HrpGO7h7oyqDwdOdjhrNpH
         Uj02zu9xVB4qMHzbU/+qCrjY9QCOqIQSKXJdfgOVzHyaAloQAluL6MGVuMY+JtCDanmB
         z6lAyctfpprjJaXSgwlws8476gCa/VoF/hdXdn1bptXwPyCUSOtMXE3GVAiTKMVYe0bJ
         Igh8mff1YtNICLG6izuwZqbfrPKpVU2uyd81ptim7+fMeFgCmMDqHc7lpS0QXrmaouRf
         AE7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=aB07AtjIKjPYRGcvBSuVUhbZlxd1+55zy/NhIuvnz19m7qssQTpE/4jhghs82a98Dx
         rtzGuCLITyYJpv6qqsfwRyWf2V/rvp/BavfnHKk+3jeYdHSZJCYDfk5x4efzm884vIfW
         UjGKSA8ySqC+bc1butY/HkkuCwEw+HH62Uipjk8j8bjqvTXRubAdUvP+c5BJvALTKQeE
         2MFV1Wjr7h5QJcQaotkuVTv077nzlClUSJUJjEEq6X2ukv02bdE+qejZx/+uCM7gRcPt
         xEQKVpHKyQ6abdYF/Q1vdcAj2ZFa315JGdv0g44dh8zUZEwY87qYbRStthdyfxwDukm3
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=Lp8iA3grSzJWGuNtfJz3dF6SXI7sJBjir2X+8A/iV19h/qrnng/zHPsKFhaIVfDKMv
         HnyVwThvtXvbwf+dGJFf/KwLPmAhX3rc9dFGXswx7md6h8/OCCtNaWphqlPRvHYe3fpE
         sfwRKvOnx+PNVT07LZ30TYuWrrjIQoJQzF1N4qYjyI4/b36bIEJuq3Pk9rGUG4CgdLFX
         ooOuzM3/kpJvN0YUUIQmy8SmkvN7hIXF84QBgt5IcwdxRtKJj/SrzRyKDv2Fumr4BBPq
         Kj3lupNRIGD6OPHsk3Rv+fuuhiHWugnm+IB4FeUwi7JvOdTV9f0LD30UlKQ9zRz/TOGV
         7BwA==
X-Forwarded-Encrypted: i=1; AKwUvBxuzsczioIMJCHEHC8OS+iP8y8EjX1HjzJ00vbpE4UPkdlRGZSxqIZoZmL6pITBEKWCrPFHVODGZXxL/g==@vger.kernel.org
X-Gm-Message-State: AFuF++lAKx7BkfEasE/k2FshB2r+PYNX+aMZoEZgmF5Z+553hLMASZm1
	zmDCb7ir3mj5Oz4SSlOXCRqOz+RBaIRgExRitAYIikwiEZ6v1DQjhJufuYkC3POx1rwAuO1ck2I
	rwOOVpVoV1YJmCllWrYAHauNJaGULnhp2WxnWoPSSOt1KcPx8djw+dD2kv+Oi3QnPqkkEnWttjC
	MK+jd3Q+SDQHVrWsqUERb2kWp4Rvt+iRWpZT8UNx8B
X-Gm-Gg: AYBFou3Mwk0dBpcdbr9EGajV+b4fOgi1Eky//9HZDDnei7Ko7zdnXYb+L4+5Ym+acvZ
	If4WJDW/fsRDh07EJd/IfdegT1KR1OhfuLudIL8POus4gWQGFuJuE/DVkJ396jcxgRXtfBbUjHr
	3iA5xDaQm44r36y1YoGRfLMbThmz1S2HDOyZOVaaJ7exigPV5SbGTdRULJ
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189763fac.2.1789510890855;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX5Hsjv6+7ZpIC
 mFwiwCNn9Net5ZWGUrMskNkbP3u+EI9Lij08Jp8R2eVvsu3OZb2n8TSAWnPDwbyH2QdcOmSaUAs
 M9LascCDSYF+XdDtoOo6kvWSUPJsRnc=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-GUID: TR1MRUcCmtNVlDa56BJ5F0wtDEAcOqSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX6vqW2vIsOyMk
 SNUUx/WM0dhjBUYpAtnVwfeQB/sILpZDwalYZGmms8JwUMSUFpDRAiXREprGbsaZqcr4Vo4QKlq
 LgcXz2yyjiQiWigoHONA/GSDIdGi+wk4vtbRqxJ4QqJQwPrPQrVc7JEImLZATooFu9jMzkwyRzK
 rNXtCzpC0m0Ggd8p4zjm0RRBs4MUJJKOI40mNaaAVEpEhZTNhVR+xUg+OCzP2RlFMogECATm0hR
 W0egmxlE1kNVDceDfClLQgZ444ONuqy0OTb84cSpN+pP/UrP86kDJ/3TPOGNPqAZEASLnwoNJGC
 TrdhVUeKAQome5dcNN4q3xL6oPEJ8O7rJjBluoSbtxSksF84fQAWxapD9s43u3kpC3ZTpgZs/u1
 jbJoln+kzg/dMUA+/hu9ecJiu7DBL0+N8rLj+v7q7Gm7JLwWrMJwAtGXRR2N+8sa2YVGyZofdJa
 06bb5KzXpv86lH2kRCg==
X-Proofpoint-ORIG-GUID: TR1MRUcCmtNVlDa56BJ5F0wtDEAcOqSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150326

On Tue, Sep 15, 2026 at 9:02=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 15 Sept 2026 at 04:31, Christian Brauner <brauner@kernel.org> wro=
te:
> >
> > TL;DR, this lets arch code handle fd install and cleanup. fd_prepare()
> > allocates a descriptor like get_unused_fd_flags() does and records it i=
n
> > a slot on the task. fd_stage() attaches the file to that slot and
> > returns the number.
>
> Honestly, I am *not* a fan. At all.
>
> I think this adds complexity rather than removing it.
>
> The diffstat tells a story:
>
> >  106 files changed, 962 insertions(+), 861 deletions(-)
>
> in how this adds a hundred lines more than it deletes.
>
> But to make things worse, it adds them in bad places: low-level
> architecture assembly code.
>
> Those extra lines are *not* making complicated code simpler. Quite the
> reverse. They are taking fairly straightforward "just deal with errors
> with normal cleanup in the place where it makes sense" and makes the
> *straightforward* case simpler, while making the big picture more
> complicated and subtle, and adding new code to places that are not
> simple and just blindly do somethign that makes no sense in that
> context.

With fd's it is more than just about error rollback.. exposing an fd
to userspace mid-way thru an ioctl is an easy security bug to write..

OTOH, "just use FD_PREPARE() / fd_publish()"..

BR,
-R
