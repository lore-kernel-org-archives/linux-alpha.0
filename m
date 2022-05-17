From: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Tue, 17 May 2022 22:05:42 +0000
Message-ID: <YoQcNkB6R/E3vf51@zeniv-ca.linux.org.uk>
References: <20220421070440.1282704-1-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=AqOwTe1WYDilo14XAd3xKHqdHGS/uTUyPBKfuE4y0GU=; b=asov2CXAoWleBDgblXMHkwDM03
        6tOIBvwyZ+ZOgZIst9Q7xbqMXazNnGiVmRD09yZK4GTD5dG2ZcxrJfQpiI0hqm2zuaZM8tSMslFE5
        mL+lLmYFvbfmXveMiaE4KPPVuGRZjFqUDnWv56JLkZT3Pk2GkhjwhcVBW3cTDgyxqsbVm9i9eOELH
        OUrs/PysJYtH+uotJPxbqcQ8UZRJDxohiwogO2OdfDYZcFRycs7ECvqN0+3sj1u6gatpn1+2spiyg
        Na7YqttJXM0vMI0s8gXqTvt29ycbf7pDLT/39REMfEU7xt5GFV8fyjPKZRjrErpFkTUWFngwBhYnf
        xZ4yI5ow==;
Content-Disposition: inline
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

On Thu, Apr 21, 2022 at 09:04:40AM +0200, Christoph Hellwig wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Al Viro <viro@zeniv.linux.org.uk>

Not sure which tree should it go through - Arnd's, perhaps?
