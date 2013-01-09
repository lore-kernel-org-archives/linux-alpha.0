From: Michel Lespinasse <walken@google.com>
Subject: Re: [PATCH 0/8] vm_unmapped_area: finish the mission
Date: Tue, 8 Jan 2013 17:32:05 -0800
Message-ID: <CANN689EMBPqVCZdTZm1G0PznGpYR6Y5tMUOspE+emHaX=TkVtA@mail.gmail.com>
References: <1357694895-520-1-git-send-email-walken@google.com>
Mime-Version: 1.0
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=GFRPmMWG1L5zDAqMeL1BTZybnm6hsHhk50j+9eqPbVQ=;
        b=cg0zdTR7WLjxGmo3zkQNbJhbKyAnp+YzpV+ozhxYq277OmaeOhWubee3T1uWMyPPZC
         PiG7s7UId08SHM4F7nBSNXTXU7nI+wnqIT35EfHQe5puVYIeME8dBlSwOj7px8z0x8ND
         VtlJPYst4J/NLj+z3lPqeJD2Ivm/Qyx26kWR/OKFg/R/qBkRiu1xLutDXUF7Z36OLbXL
         eNwDRTG732hQOV0sA33Rhl0SZCHCLhTucHFtB+bOzppU/4BGFHfxXbcssksj9Hf/04O9
         OID07g+B6MQp3vP1Usxl6hiPlj4DYZgUNYF3hRwR4DKuPN4Q0RgJJJyrpkl6K7VuiOcA
         7zcQ==
In-Reply-To: <1357694895-520-1-git-send-email-walken@google.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Matt Turner <mattst88@gmail.com>, David Howells <dhowells@redhat.com>, Tony Luck <tony.luck@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org

Whoops, I was supposed to find a more appropriate subject line before
sending this :]

On Tue, Jan 8, 2013 at 5:28 PM, Michel Lespinasse <walken@google.com> wrote:
> These patches, which apply on top of v3.8-rc kernels, are to complete the
> VMA gap finding code I introduced (following Rik's initial proposal) in
> v3.8-rc1.

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
