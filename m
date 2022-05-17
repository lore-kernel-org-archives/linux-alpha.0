From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert
 regular spinlock into trylock on panic path
Date: Tue, 17 May 2022 10:03:13 -0300
Message-ID: <53ceb2c7-f2d7-3b92-4efa-a063487585bc@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com> <YnpXGOXicwdy1E6n@alley>
 <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com> <YoN/x2fpdDU4+nSB@alley>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7k65fdRTQg/wflBs9f0TJRvKoWTammEy4iwKmtzcPs4=; b=JwphrQWQlwv41eSg6yWviuiVog
 J5wXqzK36htCakT79w3A2Ne0aWN5jR+IsfIycbRKa8cYTOEz3LKJ1/8fMTkBDcYeH66jEoAw3pQT9
 Q0dNB7/k5kxpl0sCNoshTAJpyh3wJOAB9WCMtnnpEBEqubkw8NsdGvZv5yFwhjMUy8Bk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7k65fdRTQg/wflBs9f0TJRvKoWTammEy4iwKmtzcPs4=; b=IAMQqg3QEbv06+6FKFP5t2ivTd
 bO9Y7BiY1xJ3d7W4d/Wnv7hfQflVnX1pLX3ZZHVBP9mWq39cLgrHhibHEzyTbPPdOq8scEMqapJpp
 /n5XNdv58nbRwk3o8k61q5udrgtIM5xl21A0sS2Qf/wkC5cNg98POEH3Ssh6h/+bfWRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7k65fdRTQg/wflBs9f0TJRvKoWTammEy4iwKmtzcPs4=; b=OpLRZBE1TUxWd4SJevol7qmbWp
 7cf/63XEfW1McNr9yfxJ/wNA5PzTA6GfEDtrBWeHePG4UP9vT004IKq/Y2n1Wdo9PCU8d40cNtPr7
 evvA1G/GsHzDMrD3kL1RWnjHzehDzDywj5u53TN0tmnpdWb3jYfL8mY4Uh+43rmflK1PctID/9pFc
 ZvUCbSUysCdoW+hfAZNQhZbT4OFisfS/H/quOUTTDHZ+I5zaEEC4729JtousRNxBxXebYRI1Dcqzp
 PvSzoHit05E/cq1DK95qfXV5U60l7efTEeM0sV+06rVod3szWCADFSxvFodt56BQEE6VcTzDLc2Bf
 FOG6Wfyw==;
Content-Language: en-US
In-Reply-To: <YoN/x2fpdDU4+nSB@alley>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>, 
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net
To: Petr Mladek <pmladek@suse.com>
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com, gregkh@linuxfoundation.org, peterz@infradead.org, alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org, feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, zhenwei pi <pizhenwei@bytedance.com>, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org, Mihai Carabas <mihai.carabas@oracle.com>, Shile Zhang <shile.zhang@linux.alibaba.co>

On 17/05/2022 07:58, Petr Mladek wrote:
> [...]
>> Thanks for the review Petr. Patch was already merged - my goal was to be
>> concise, i.e., a patch per driver / module, so the patch kinda fixes
>> whatever I think is wrong with the driver with regards panic handling.
>>
>> Do you think it worth to remove this patch from Greg's branch just to
>> split it in 2? Personally I think it's not worth, but opinions are welcome.
> 
> No problem. It is not worth the effort.
> 

OK, perfect!

Cheers,


Guilherme
