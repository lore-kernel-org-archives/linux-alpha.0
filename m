From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [Patch 4/4] module: trim exception table in module_free()
Date: Wed, 27 May 2009 11:51:26 +0930
Message-ID: <200905271151.28045.rusty@rustcorp.com.au>
References: <20090526083717.5050.32719.sendpatchset@localhost.localdomain> <20090526083751.5050.60959.sendpatchset@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20090526083751.5050.60959.sendpatchset@localhost.localdomain>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Amerigo Wang <amwang@redhat.com>, linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, jdike@addtoit.com, mingo@elte.hu, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org

On Tue, 26 May 2009 06:05:39 pm Amerigo Wang wrote:
>  void module_free(struct module *mod, void *module_region)
>  {
>  	vfree(module_region);
> -	/* FIXME: If module_region == mod->init_region, trim exception
> -	   table entries. */
> +	if (module_region == mod->module_init)
> +		mod->num_exentries = 0;
>  }

Hi Amerigo,

   This looks wrong.  The extable covers both init and core exception entries.   
We want to remove the ones in the module_init section.  The good news is that 
it's sorted, so they're either at the start or the end (except sparc 32).

  The bad news is that this is really a generic problem, and deserves a 
generic fix.  That's easy for archs which use the generic sort_extable(), but 
alpha, ia64 and sparc(32) will need to define their own trim_extable().

Thanks!
Rusty.
