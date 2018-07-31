From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH v2] fs: don't let getdents return bogus names
Date: Tue, 31 Jul 2018 17:51:12 +0100
Message-ID: <20180731165112.GJ30522@ZenIV.linux.org.uk>
References: <20180731161025.189534-1-jannh@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180731161025.189534-1-jannh@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jann Horn <jannh@google.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Chinner <david@fromorbit.com>, Pavel Machek <pavel@ucw.cz>

On Tue, Jul 31, 2018 at 06:10:27PM +0200, Jann Horn wrote:
> +/*
> + * Most filesystems don't filter out bogus directory entry names, and userspace
> + * can get very confused by such names. Behave as if a low-level IO error had
> + * happened while reading directory entries.
> + */
> +bool bogus_dirent_name(int *errp, const char *name, int namlen,
> +		       const char *caller)
> +{
> +	if (namlen == 0) {
> +		pr_err_once("%s: filesystem returned bogus empty name\n",
> +			    caller);
> +		*errp = -EUCLEAN;
> +		return true;
> +	}
> +	if (memchr(name, '/', namlen)) {
> +		pr_err_once("%s: filesystem returned bogus name '%*pEhp' (contains slash)\n",
> +			    caller, namlen, name);
> +		*errp = -EUCLEAN;
> +		return true;
> +	}
> +	return false;
> +}

> +	if (bogus_dirent_name(&buf->result, name, namlen, __func__))
> +		return -EUCLEAN;

These calling conventions st^Ware rather suboptimal.  First of all,
	* none of ->actor() callbacks will ever get called directly.
	* there are only 4 callers.  3 of them (all in fs.h) are
of the form return ....->actor(...) == 0;  The fourth is
        return orig_ctx->actor(orig_ctx, name, namelen, offset, ino, d_type);
in ovl_fill_real(), which itself is an ->actor() callback.

So all these "return -E..." in the instances are completely pointless;
we should just turn filldir_t into pointer-to-function-returning-bool
and get rid of that boilerplate, rather than adding more to it.

Furthermore, who the hell cares which callback has stepped into it?
"The first time it happened from getdents(2) in a 32bit process and
that's all you'll ever get out of me" seems to be less than helpful...

And frankly, I would prefer
	buf->result = check_dirent_name(name, namelen);
	if (unlikely(buf->result))
		return false;
making that thing return -EUCLEAN or 0.  Quite possibly - inlining it
as well...
