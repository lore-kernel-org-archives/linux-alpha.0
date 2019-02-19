From: Matthew Wilcox <willy@infradead.org>
Subject: Re: ext4 corruption on alpha with 4.20.0-09062-gd8372ba8ce28
Date: Tue, 19 Feb 2019 06:44:54 -0800
Message-ID: <20190219144454.GB12668@bombadil.infradead.org>
References: <fb63a4d0-d124-21c8-7395-90b34b57c85a@linux.ee>
 <1c26eab4-3277-9066-5dce-6734ca9abb96@linux.ee>
 <076b8b72-fab0-ea98-f32f-f48949585f9d@linux.ee>
 <20190216174536.GC23000@mit.edu>
 <e175b885-082a-97c1-a0be-999040a06443@linux.ee>
 <20190218120209.GC20919@quack2.suse.cz>
 <4e015688-8633-d1a0-308b-ba2a78600544@linux.ee>
 <20190219132026.GA28293@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=21DHr+RSj+xLDKfUOmmwQEe9U8Yhv3wyd3vmDfQBbJ8=; b=Bg+NNfXr8pMNxktAjX0ExkyVv
        lOVOoBcOoNUemoyU0nqmdAKULhDXV51CARXuwixN51/frSvDKHAQyC9gWmOcQUKqwf2LBzaECW/v9
        5T6e7ypytKZM1hjJQ5+vIH+M8S3EH0yWq0te02Qz3+j4NRy0KO+Vj8f+QrbUEO4qRquWe2sd0K4uM
        29InieQC7y/wRfX+gkc/3SA8hQLf7Dk4jUEnQIR7wCmC+fR3QcDWxZGBHnuSnL5fxuP5FEtyfNNWs
        wYYKgm3NuUkjYL6QAE0DtVmUV+Le0h5If2nKRN/8DgwColGlvf/ZNYAjJDstbSPcDoTIROfGBfSDm
Content-Disposition: inline
In-Reply-To: <20190219132026.GA28293@quack2.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Meelis Roos <mroos@linux.ee>, "Theodore Y. Ts'o" <tytso@mit.edu>, linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, linux-mm@kvack.org

On Tue, Feb 19, 2019 at 02:20:26PM +0100, Jan Kara wrote:
> Thanks for information. Yeah, that makes somewhat more sense. Can you ever
> see the failure if you disable CONFIG_TRANSPARENT_HUGEPAGE? Because your
> findings still seem to indicate that there' some problem with page
> migration and Alpha (added MM list to CC).

Could
https://lore.kernel.org/linux-mm/20190219123212.29838-1-larper@axis.com/T/#u
be relevant?
