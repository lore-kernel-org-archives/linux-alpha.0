From: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 7/7] alpha: Fix type compatibility warning for marvel_map_irq
Date: Wed, 17 Jul 2013 06:03:18 -0700
Message-ID: <51E69616.3000500@twiddle.net>
References: <20130716211259.GA11841@fatphil.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=U/yTYJkk90M6a9R4whbE603h40/8dBSIe3tKF0UNjlg=;
        b=rgJK7jyLtmGSwbMrG66ImsXE6LE7beX8sligwNvfW6ksyX1YQJmwO4LBLCmZPRiP/d
         tpRDYivWCsIuYfhurhhOeQBu+qzt1Jzs32JFv1LGOx1dIFPhsgF9OLEUPhrZQfRxbJ07
         /OsqrKzkUZhf9hYyyOSCyBLFONKeHVVTu2j6TWibzc7/hRGl3hWvbssu5/RatwM+amR0
         Fj+WE3OQJ37gUDz4aiWUW2rbuV27IBOAVR/dBXDFWK6Dq3iVuA6FVOVzujfyqdk2OvGV
         AGRBeEtveNCiIRJ4oHfFbZ7RjlEH/wBEbZFYfT5g6of2/vS8ETiAzwOLkkxTxMbZ4IlY
         qdWQ==
In-Reply-To: <20130716211259.GA11841@fatphil.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil Carmody <pc+lkml@asdf.org>
Cc: linux-alpha@vger.kernel.org

On 07/16/2013 02:12 PM, Phil Carmody wrote:
> Greetings Richard,
> 
> Your
> 
> +       struct pci_dev *dev = (struct pci_dev *)dev;
> 
> should surely (i.e. I'm nowhere near a compiler or kernel tree 
> presently) be
> 
> +       struct pci_dev *dev = (struct pci_dev *)cdev;
> 
> I guess post that, you can have:
> 
> Acked-by: Phil Carmody <pc+lkml@asdf.org>

Ug.  Self-assignment suppressing uninitialized variable warning
is the stupidest extension evar.

Good eyes, thanks.


r~

