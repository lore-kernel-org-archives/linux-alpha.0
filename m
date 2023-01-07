From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] alpha: fix FEN fault handling
Date: Sat, 7 Jan 2023 15:03:14 -0800
Message-ID: <f1de15a5-1713-70e7-81af-a0090583d888@twiddle.net>
References: <Y7jD8XDZGnQkTvMI@ZenIV>
 <84c0d4ea-09e2-4907-d03d-939d40fa3c96@twiddle.net> <Y7jdARsEQXPugR0t@ZenIV>
 <Y7nj80buxCO3u69l@ZenIV>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ghLtHCxEHQN0G4J8VZiZj3ppzJlMdwxuQQiALlB0bi8=;
        b=PLZ+fpox0EVHAsl/kse4VxOpAI/itllww8vvFZz4QlOJnDgg38OJlVJQTYWeGMI/JT
         vr3rhlMRPRmsyoaj0ymPqZephZ1JzxYx+fouUUF9V24Wem+dY+QWHBddh2hb7dw/Dk5y
         N4to1k0IwLP5M95xE0Czpv+B+in/EvQjr7uUbOFKFRX+S+Ik+Ob3+u2SthZlnG5WEap9
         DxEaZG7oYh1At1gW/Mvgc6BWIUS7UC/8xGJnKmyS/s2OSX16OzDM2QxnUoTAPCGA75oI
         aNBxCLVQtVwUj1cv+RwriCZnQ0i41doPgYlNLFhBxKdw3oS2wI+Wr1CysiDdx7nCXRCW
         5V9g==
Sender: Richard Henderson <rth7680@gmail.com>
Content-Language: en-US
In-Reply-To: <Y7nj80buxCO3u69l@ZenIV>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On 1/7/23 13:28, Al Viro wrote:
> On Sat, Jan 07, 2023 at 02:46:26AM +0000, Al Viro wrote:
> 
>> Not sure it's worth bothering with in palcode-clipper - for Linux it's
>> useless (run out of timeslice and FEN will end up set, no matter what),
>> nothing in NetBSD or OpenBSD trees generates that call_pal, current
>> FreeBSD doesn't support alpha and their last version to do so hadn't
>> generated that call_pal either...  What else is out there?  OSF?
> 
> BTW, out of curiosity - what was
>                case 5: /* illoc */
>                default: /* unexpected instruction-fault type */
> about in that switch in do_entIF()?
> 
> All documentation I'd been able to find had only 0..4 as expected
> values (bpt/bugcheck/gentrap/fen/opdec)...

No idea.

Historical git (cd52cb6178a7, v2.4.8 -> v2.4.8.1) suggests it's related to shark_mv, so 
perhaps a later revision of DEC PALcode.  But I have no corresponding documentation.


r~
