Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hTF7kSho"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0847B10FC
	for <linux-alpha@vger.kernel.org>; Thu, 30 Nov 2023 21:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701408028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X88JSiziG/o7myWzNFddeB9QrNNoNgpJlb1gQar3PoQ=;
	b=hTF7kSho2PW7k/yLjqQzIZgVJ5SG6AlneOXtkZAwTWsY9Yybl6GwJ6X/r1ICGLKGEi4GFB
	1sFizwwy/MIAV0m7Ss0QzZ6svkRyvrakmJFBsnKf/XI2iifs0/T4wm90tzwYfkA1wJXipS
	i9S+EHwLi6LMEfr1nAng8jQiRGTw+FI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-ZeI57XL6OpKtwbEI1_8MzA-1; Fri, 01 Dec 2023 00:20:26 -0500
X-MC-Unique: ZeI57XL6OpKtwbEI1_8MzA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c9c99a4fdbso17255901fa.0
        for <linux-alpha@vger.kernel.org>; Thu, 30 Nov 2023 21:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701408025; x=1702012825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X88JSiziG/o7myWzNFddeB9QrNNoNgpJlb1gQar3PoQ=;
        b=ZahMpH7VJpXQmCrLdODwhJXXFg0Mv91RA4p5nlammupJCkDJbsDbgHUrnp4wfzQlIB
         mCdHqYWt/XFi53BkQDIkEepTB5U6CQCNjDw2yS1xUin8JrqpbSPzXxuNfQMA6HRpa+ZU
         SkJr4a6Ds7qyt4tLob87Yq02iu0xzTr0VEoL8/hxOuRSgVbqiiJh/0PiWKGwe9aSjumq
         5XFIQGVvNzrnTGddi67Htvw5QyIsu/k34iLra4UnBvRcTD9TRh1X2la5axhy5lyKLI/k
         0FZeuLOxaHmgKiKjYVOWu1dCG079HHZMWTu/E4GP7UP4K3W9UdyRPDEJo0M5A7NWF9lp
         y6Mg==
X-Gm-Message-State: AOJu0Yw/dRG0qfZGKde77zLy2RevcuCKotFdkMsqdJAKQHEIRVYQLZ4z
	7E8uYhOLaH45w3oOGGN7+yBuWthUzpq8C8EbjyjD0X/BxqhJRyrWOiEXhHr5lKulIaTtXZApFbY
	bzIlt7F+5ZqVFHz72R5/P8Ib9orwbBMHi/IoNciE=
X-Received: by 2002:a19:a408:0:b0:50b:c9b6:3216 with SMTP id q8-20020a19a408000000b0050bc9b63216mr343640lfc.8.1701408025516;
        Thu, 30 Nov 2023 21:20:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESdjRg/qOdpcOoc9ha3XIN7XwU3jvK2LnYcltjH/CQeP85eYFX50MTqViiFNs+mh7TXHCkLsXficufvdwpKuo=
X-Received: by 2002:a19:a408:0:b0:50b:c9b6:3216 with SMTP id
 q8-20020a19a408000000b0050bc9b63216mr343629lfc.8.1701408025249; Thu, 30 Nov
 2023 21:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130113001.29154-1-jirislaby@kernel.org>
In-Reply-To: <20231130113001.29154-1-jirislaby@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Dec 2023 13:20:14 +0800
Message-ID: <CACGkMEtc962wXcFP7kQFcyxRqqyXAF55kpZwv-tQbcCWuOHGTw@mail.gmail.com>
Subject: Re: [PATCH] tty: virtio: drop virtio_cons_early_init()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-alpha@vger.kernel.org, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 7:31=E2=80=AFPM Jiri Slaby (SUSE) <jirislaby@kernel=
.org> wrote:
>
> The last user of virtio_cons_early_init() was dropped in commit
> 7fb2b2d51244 ("s390/virtio: remove the old KVM virtio transport").
>
> So now, drop virtio_cons_early_init() and the logic and headers behind
> too.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: virtualization@lists.linux.dev
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

