From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 1/2] alpha: use .data.init_task instead of .data.init_thread.
Date: Fri, 31 Jul 2009 14:23:15 -0700
Message-ID: <4A7360C3.2060507@twiddle.net>
References: <1249073786-29788-1-git-send-email-tabbott@ksplice.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1249073786-29788-1-git-send-email-tabbott@ksplice.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Abbott <tabbott@ksplice.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Anders Kaseorg <andersk@ksplice.com>, Nelson Elhage <nelhage@ksplice.com>, linux-alpha@vger.kernel.org

On 07/31/2009 01:56 PM, Tim Abbott wrote:
> -	/* Note 2 page alignment above.  */
> -	.data.init_thread : {
> -		*(.data.init_thread)
> -	}

NACK.

You can change the section name, sure, but you cannot remove the 2 page 
alignment that we had via the alignment at the end of the init sections. 
  You'll break current_thread_info which is always computed as 
(kernel-stack-pointer & -(2*PAGE_SIZE)).

Similarly it is *not* a bug that the page_aligned sections were before 
data, because we already knew we had 2 page alignment from the end of 
init + 2 pages of init_thread.


r~
