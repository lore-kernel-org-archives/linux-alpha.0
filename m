From: Matt Turner <mattst88@gmail.com>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Thu, 29 Dec 2016 22:23:04 -0500
Message-ID: <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
References: <20161230030846.GA25929@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=S44AlVNWQwr3d1NqQ5quLn5X7T8I09ifMLqcLzAG/rY=;
        b=XXsJstFhTs/LYaQH4DgNTtIrBXshUlcTrBmOmudRuqYgCetHHLVGD8mj9U1Tgosc6k
         weKj8gJ3J0+qWFd57gVEAvyQHcIDMpj1dluotP2B0avwXOhCYl3eJ0ud1tW9lNqd1cAk
         9qwsOiY+mtlXUn9ppOItBRQd1bS7EmAamzj6CFI/xkfoSeMHhWbctltLCjjmvVZgR3sT
         ZMLi8EXfsrlt7UlhZvjvhnTmoQED/uWR7/Zj7GrfYYmMz34vHtq4B5dFlSIAxMbozCcz
         nd4ECVWTSjBQVluGva9JFvXNfWFMi99kXFWEs8L7XtvG1lTpMk7ASMQu38gwIbBnobH7
         n9gw==
In-Reply-To: <20161230030846.GA25929@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>

FWIW, when I saw your first email I tried compiling with gcc-4.9.4,
5.4.0, and 6.2.0. All compiled my config fine.

I'm guessing it's another symptom of the old "kernel too big" problem?
