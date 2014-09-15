From: Seunghun Lee <waydi1@gmail.com>
Subject: Re: [PATCH] vfs: move getname() from callers to do_mount()
Date: Mon, 15 Sep 2014 14:26:44 +0900
Message-ID: <80cfae67-803f-4e94-b3d4-ac189e4c70f5@email.android.com>
References: <1410537212-3153-1-git-send-email-waydi1@gmail.com> <1410700510-15408-1-git-send-email-waydi1@gmail.com> <20140914181259.GQ7996@ZenIV.linux.org.uk> <CA+LGb9aaMpiotK7-NUv4hKcJHbuWQE=DC=p=90ZguWqn44qcTQ@mail.gmail.com> <20140915051850.GT7996@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:content-type:subject:from:date:to:cc
         :message-id;
        bh=Bjn6vALTXtIoyDy/xB4lotCYZO9xoe7X3UD1wa9HgLE=;
        b=vCsVF8PMqjX5p1mons1Tm0zeBK6Sw1LIPSiFC5hmUOd+gRvYcPr34a/gDeSYauQx5g
         gjp9+8nH94OVn0kPEdrRDKC298+x2BZXf/UkM4lje7ib1PKVIEGX48EfFGGfUoXg6J9X
         At5u/FANG00eZpBZQOyxMUTTxCc9yjcHgG5mju7SsxvZ60QS8wB43aekT9QZatkaGf4Q
         2Xs5obd4o/IMsH7QTvVyPigS2J7Yh8fjIzU8vmQ1AeA6jX/Kv6Ny8Yb9txqoLWlTd4d7
         TlF9kstDgEsSgn6LdhlGg9xRfdiykMx03I7PoCMbBq6axiZbqyxSaCTaCny6rXU8iZVA
         Rglw==
In-Reply-To: <20140915051850.GT7996@ZenIV.linux.org.uk>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Bruce Fields <bfields@fieldses.org>, ink@jurassic.park.msu.ru, jlayton@poochiereds.net, linux-fsdevel@vger.kernel.org, linux-alpha@vger.kernel.org, mattst88@gmail.com, rth@twiddle.net, linux-kernel@vger.kernel.org

On September 15, 2014 2:18:50 PM GMT+09:00, Al Viro <viro@ZenIV.linux.o=
rg.uk> wrote:
>On Mon, Sep 15, 2014 at 01:39:19PM +0900, Seunghun Lee wrote:
>> 2014. 9. 15. =EC=98=A4=EC=A0=84 3:13=EC=97=90 "Al Viro" <viro@zeniv.=
linux.org.uk> wrote:
>> > Applied with one modification: this getname/kern_path/putname is
>
>> Ok, I will resend it after modification.
>
>See above...  It's already in vfs.git#for-next.  The last commit of th=
e
>branch at the moment.  The change was trivial - done it while applying
>the
>patch.

Oh sorry, I misunderstood your email.

Thanks.

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
