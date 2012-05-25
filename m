From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Binutils bug with -Wl,--relax
Date: Fri, 25 May 2012 14:20:15 +1200
Message-ID: <F1E39999-CC7C-4695-9275-6F6A926C508F@orcon.net.nz>
References: <CAEdQ38FNECGvsADRH-_6qzv660er6-Y5b1xhYk9tJ85KL2raBQ@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Transfer-Encoding: 7bit
Return-path: <binutils-return-75737-gcgb-binutils=m.gmane.org@sourceware.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed;
	d=sourceware.org; s=default; x=1338517263; h=Comment:
	DomainKey-Signature:Received:Received:Received:Received:Received:
	Received:Cc:Message-Id:From:To:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:Mime-Version:Subject:Date:References:
	Mailing-List:Precedence:List-Id:List-Unsubscribe:List-Subscribe:
	List-Archive:List-Post:List-Help:Sender:Delivered-To; bh=5eyBKCQ
	oI3Vw0isJlT3a3HkFOBY=; b=G51LnBdmD10Si4yvqr9iS1aFRZ7OhrPz2xx+YTc
	4BCPddqpvlpXczbo1ER+egrrmDU6gnkbBVCX/NCVGkU5jU3VgEL5mzgDGRe7uwg0
	V55+fMviQsjPXOxgqrf4oA26mZipFBxvTCOgMq4i0ko4y5BtuPbcCNzdlCy6W4HV
	VLU4=
In-Reply-To: <CAEdQ38FNECGvsADRH-_6qzv660er6-Y5b1xhYk9tJ85KL2raBQ@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <mailto:binutils-unsubscribe-gcgb-binutils=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:binutils-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/binutils/>
List-Post: <mailto:binutils@sourceware.org>
List-Help: <mailto:binutils-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: binutils-owner@sourceware.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, binutils@sourceware.org, linux-alpha <linux-alpha@vger.kernel.org>, toolchain@gentoo.org, Uros Bizjak <ubizjak@gmail.com>

On 25/05/2012, at 2:07 PM, Matt Turner wrote:
> I began testing gcc-4.7.0 today on alpha and remembered that >=gcc-4.6
> cannot build itself on alpha without passing -Wl,--no-relax.
>
> See http://sources.redhat.com/bugzilla/show_bug.cgi?id=5276

As projects are growing in code size more and more are being affected  
by this bug we are also requiring a lot of use of --no-relax in the  
Debian Alpha port.  That gcc is now being affected by it is a real  
problem.

I am prepared to assist in testing including running debugging  
versions of binutils under gdb to see if we can better isolate the  
problem and find a solution,  but I would need guidance since I know  
very little of the binutils code.

Cheers
Michael.

