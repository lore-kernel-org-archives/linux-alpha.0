From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH 4/4] alpha: Move two assignments for the variable "res" in
 srm_env_proc_write()
Date: Wed, 18 Jan 2017 15:27:55 +0100
Message-ID: <50d6acaf-e34f-557f-46b6-b182fb9a441a@users.sourceforge.net>
References: <de76a580-c693-f422-ad78-d87bafd42bf3@users.sourceforge.net>
 <986573fa-e636-f864-14dc-5e65a31b454e@users.sourceforge.net>
 <20170118131429.GA12614@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20170118131429.GA12614@lug-owl.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, linux-alpha@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Richard Henderson <rth@twiddle.net>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> A local variable was set to an error code in two cases before a concrete
>> error situation was detected. Thus move the corresponding assignment into
>> an if branch to indicate a software failure there.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Acked-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>

Thanks for your positive feedback.


Unfortunately, I have got the impression that this update step is inappropriate
so far because the suggested change for the handling of the error code “-EFAULT”
can be incomplete (or a bit too much).

Which implementation would you prefer?

A) Keep the variable assignment before the check for the call of
   the function “copy_from_user”

B) Add an assignment in another condition branch at the end.

 		res = (int) ret1;
+	} else {
+		res = -EFAULT;
 	}

Regards,
Markus
