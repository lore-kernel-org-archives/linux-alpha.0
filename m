From: Richard Henderson <rth@twiddle.net>
Subject: Re: Bug: retry of clone() on Alpha can result in zeroed process thread
 pointer
Date: Wed, 30 Jul 2014 09:30:44 -1000
Message-ID: <53D947E4.7020305@twiddle.net>
References: <20140723085244.GB4799@omega>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=0UFDWlaXJLHeViwehMpd+DBm/0zaLnseihAqHoYznu0=;
        b=jNxVMrpXPB3wVN0wVWSGlGOaQzt3suOSrWfDa+j1b6rR0lCPrMFJmDwD1AVXYkWsW9
         hEGu1XvcSfjGCXC7OazUrk2cyiAZ4iyE0QZY6XcQ6Q0+cZffbPYFXFMDMDvnMXNLDjgo
         /ihAtR9a97b5jZqQe/fLGthSuXvIbVmF57va9obz0TaNC1CISTpb8uJud5Z9tjX7jlzn
         pTJz3kgAvynjWl6+yvkkeY0dekoDjES3QA90BHjWSBX9vdkE2bGivucT025w8AFO3hns
         HXvT4LYR8a7FfyMuHFPdqXC4WNIBF7ex6lBJ05KnsKsORS9uUuS1Ar8iWR9amAlyaGCj
         91Yw==
In-Reply-To: <20140723085244.GB4799@omega>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Ok, I think I've actually found it this time.  It's here:

> 281		childregs->r20 = 1;	/* OSF/1 has some strange fork() semantics.  */
> 282		regs->r20 = 0;

We need to delay this r20 silliness until after restarts or something.  Or just
kill it -- it's not like glibc uses this return value.


r~
