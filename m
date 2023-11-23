Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CC2D4A;
	Thu, 23 Nov 2023 10:48:47 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5cbcfdeaff3so11971587b3.0;
        Thu, 23 Nov 2023 10:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700765327; x=1701370127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BW4/JJUWKoNDMmEO5Ub2khORc7J8S5l7T6XZYcoByRY=;
        b=P27FwIQ41GBHXr5oRPgGY2+8bUkSLqOqG8g7jZOB66XomaBHMKO1Mv4KDMG/BZyFeN
         vcX3VZRqVIY6o4oRDRu89xASlZ/S0GC6ChMhy4Rq+c4/V97rENzOl/mNEI/HfDnLyBwk
         82u7QCiK7DU7RaMGJjN5RP3ochCp8dTNGoPkn1FGSnnwy8Zm6AVU0nsIOII4i0kxcURf
         sake+BBxg5dAqUyeEz8z8Lfldif5Fkt6S3S0vR36wOCsbDNDpGEtcnHmirRrm7QsZP99
         AHhz5WvY2WLkDNeUVKfWip7wNr59CREFEP1+fTC67WSRXN9VUMgx4yYk76PywfzIxIDN
         LBEw==
X-Gm-Message-State: AOJu0YzNvU0aDre47N7ubYnBYzhW0c6k5NAWimtzXmRq7LI2JwanL5WA
	hS4MQmIYJpuKfgznhx4hdDlQxy3WZk3ZBg==
X-Google-Smtp-Source: AGHT+IHon/DG1pbZWRYOBxv2h46j4yF8+KjvkhBjQnmRAIxgGFfKKhV8sqeJ9lrD7/FkEk0/o7iK+A==
X-Received: by 2002:a25:400b:0:b0:d80:4533:9556 with SMTP id n11-20020a25400b000000b00d8045339556mr114170yba.63.1700765326672;
        Thu, 23 Nov 2023 10:48:46 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x1-20020a25ac81000000b00daf198ef6fbsm447578ybi.21.2023.11.23.10.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 10:48:45 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cbcfdeaff3so11971337b3.0;
        Thu, 23 Nov 2023 10:48:44 -0800 (PST)
X-Received: by 2002:a81:7b54:0:b0:5c9:ed39:5557 with SMTP id
 w81-20020a817b54000000b005c9ed395557mr217201ywc.45.1700765324574; Thu, 23 Nov
 2023 10:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123180246.750674-1-dimitri.ledkov@canonical.com> <20231123180246.750674-4-dimitri.ledkov@canonical.com>
In-Reply-To: <20231123180246.750674-4-dimitri.ledkov@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Nov 2023 19:48:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZ365Xd7+pOyy9WLORSbaXG8+O5Y1gRfd7by8G7QJQEg@mail.gmail.com>
Message-ID: <CAMuHMdXZ365Xd7+pOyy9WLORSbaXG8+O5Y1gRfd7by8G7QJQEg@mail.gmail.com>
Subject: Re: [PATCH 3/5] m68k: stop shipping a.out.h uapi headers
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	"Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dimitri,

Thanks for your patch!

On Thu, Nov 23, 2023 at 7:03=E2=80=AFPM Dimitri John Ledkov
<dimitri.ledkov@canonical.com> wrote:
> Stop shipping a.out.h uapi headers, unused.

Yep, since commit 987f20a9dcce3989 ("a.out: Remove the a.out implementation=
")
in v6.1.

> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
