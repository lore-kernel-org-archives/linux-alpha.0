From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Date: Fri, 22 Apr 2022 15:57:25 -0700
Message-ID: <20220422155725.5347ca6f@kernel.org>
References: <20220421070440.1282704-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650668246;
 bh=eHLSXrt72i6TaH/+If0ihwqLZQ/LBVXgDxHiWMQEzuo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iXFl9zY2I5UHRGR7OaF1h6qlAK5mPZxdv+O0/pAngV8myikt1Swc/85KxvGyNVcfO
 c+CJWtfaiXl8iS4eDwm1tYLL7mlGL2OJEbQRIyx9Oxnmwt2nYscDdw9pUFUKju5Rc3
 8Smqu72LB7YDpmuwjcwdikHO/+HwAQLvXA/jK7PevxaApA0vXIIT+xAvp6YNrYwW6z
 q1/aUsGP3jl+P0ELlTWntjHg6xRI0iccI6aJTjuD8V03kr63SrpkSJD23r6yezDvk8
 TT4cjRbKMoXPFsOx4c8XKhYFXss7sxjKe8fuaZ2qJtOjsu9QfpIkpihlggl0InOGdM
 4UfcD6bK0Sc2g==
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org

On Thu, 21 Apr 2022 09:04:40 +0200 Christoph Hellwig wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Judging by the To: I presume the intention is for Andrew to take this
one, so FWIW:

Acked-by: Jakub Kicinski <kuba@kernel.org>
