From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] do_pipe cleanup: drop its last user in arch/alpha/
Date: Wed, 14 Jan 2009 16:19:11 -0800
Message-ID: <496E80FF.8060106@twiddle.net>
References: <1231923693-17968-1-git-send-email-crquan@gmail.com> <1231924185-18018-1-git-send-email-crquan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1231924185-18018-1-git-send-email-crquan@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cheng Renquan <crquan@gmail.com>
Cc: Bastian Blank <waldi@debian.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, cr_quan@163.com, linux-alpha@vger.kernel.org

Cheng Renquan wrote:
> The last user of do_pipe is in arch/alpha/, after replacing it with
> do_pipe_flags, the do_pipe can be totally dropped.

Ack.


r~
