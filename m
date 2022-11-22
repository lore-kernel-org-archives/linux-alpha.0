From: "Guilherme G. Piccoli" <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 03/11] alpha: Clean-up the panic notifier code
Date: Tue, 22 Nov 2022 10:22:45 -0300
Message-ID: <3f0bc380-e6c9-d1fa-a22f-6ba9051d4219@igalia.com>
References: <20220819221731.480795-1-gpiccoli@igalia.com>
 <20220819221731.480795-4-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhwaQjh+Ia/mFtN/5LUyTZC+iVCvaI8pf7D82ZuYA1w=; b=rCZtr+xwdzOV70
	Cc38qVmhx00bSg0r42bY8REMjqrPmKMypIt5y6YW89isqiBh8H1qai8/5yQmEZh627jpkqKlXc6+o
	GvYeBagh4R88lOyy8f3La2WXTS1J8kfhOsUWWydFWEMGkeQGNKKpBa4ZIfIXdudRavlIljwqPSlKF
	fLBo7Kt4G8LZgSeqd5rwxYMT09WwmA7f3t/RqJzfhBXX8VlwqVqKqfRgKnDoRRVv5BjqEgQA9Uzue
	XBM1TDTFvP45YOQj+W5A3D0eu31wgoJveYgbLqDO284XOOVDKzG50CGdXnXyYEbVKeSlsAwAQFL+b
	kJffwLACujkmYl1JV08g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FY+JqUTCgihErrGkfvd81tTDafGHo4/Ls5aZBztvCRI=; b=AYvzjRrTruNeQnueKgELb+zCk8
	UVbGiVtGj9aoxeLpY3IHAd6Yyk/0XAO+o2htBjsFecMi89SKtq9feHUApjGt4pHm9mbOA9I+V6mQy
	eA1GZ6fQ6GWJNN3dCHh8ww04qprqnImBnhWQLBqyOQGGeGjftBRgox+qxDxtDwCs7Pe3JTcckNuWw
	22NGy7Gh2WlrpbVnmNlxHaFUiSJQ0FGaPuTPCZR61CqiCeq1X2BlTCgPo3VjT41nAbu/kZbhSbP3E
	nCOY/8g75zWymxjFr1MTnfhgzD0q7u7PDtf6dQ4r8PSil1SrtlAunMWnkjmPGBICS5bbVJH8nkYfS
	sle/jWGg==;
Content-Language: en-US
In-Reply-To: <20220819221731.480795-4-gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "kexec" <kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: kexec-bounces+glkk-kexec=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Henderson <rth-/MQLu3FmUzdAfugRpC6u6w@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-dev-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org, kernel-WeLdAqEWwDvk1uMJSBkQmQ@public.gmane.org, Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>

On 19/08/2022 19:17, Guilherme G. Piccoli wrote:
> The alpha panic notifier has some code issues, not following
> the conventions of other notifiers. Also, it might halt the
> machine but still it is set to run as early as possible, which
> doesn't seem to be a good idea.
> 
> So, let's clean the code and set the notifier to run as the
> latest, following the same approach other architectures are
> doing - also, remove the unnecessary include of a header already
> included indirectly.
> 
> Cc: Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>
> Cc: Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Richard Henderson <rth-/MQLu3FmUzdAfugRpC6u6w@public.gmane.org>
> Reviewed-by: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli-wEGTBA9jqPzQT0dZR+AlfA@public.gmane.org>
> 
> ---
> 
> V3:
> - No changes.
> 
> V2:
> - Fixed rth email address;
> - Added Petr's review tag - thanks!
> 

Hi Alpha maintainers, is there anything else to be done here? I'd really
appreciate any advice on how to get this merged.

I'm also adding here Richard's linaro email (and trimming huge CC list).

Thanks in advance!
Cheers,


Guilherme
