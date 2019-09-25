From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
Date: Wed, 25 Sep 2019 12:17:28 -0300
Message-ID: <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qOwrMjvO4EXYVWHNx+eqDapcc7JxZvfh+H9mIH8f48=; b=DO5Y8VQ0o8d9lE
	lN0XpQB2QUb5GFGIDYanshdrVWZ1+W/0YQb9XHp3UyC8haN5KDTKVbm9Nb97X+++EUdSpafk2ho7G
	gV9r1/QRVdLqWIc0EQ3TnDdElG6swNzOKYSpI7fmnU2gJsvLaYQXDmmUYq1qeJC8m7MUzHbLbJhJ6
	Q0X0WUM5cwFBCejZ0aYuUn8cF3v56mOXjE17G2K8f/QaeqitsPMYATihdz9Jk7NNTNS9yRBECNVcS
	6d4w64UPImHgCRJwP7uWrXbNLSOW7+VcUGL0Dn6GXRDYjT+XVpRUd3qIT7CqiCKrvtLNZCR0VWlj8
	TNQkP2XB2XE5uOV6bMaQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTBq6P5OxsGLjoGVhyAwZM8k0vklyHGTB2oJI82Er7M=;
 b=eghD7xF1O36vsBrF3R1Ol+O9tfU+0jO9JXTPAGDQj/eD9TEB4fS0VQFijoygPStgr3
 10lJjOrWc1bicRYqBtncYZdXUVZQzGo/mCRUFcwwwv+kexKbN1ES5l5Ac30Iyy/VSy6b
 zUdkmBZi6iQtLRd1ksj9hb1AR/76sVMVefmq8BgklCKkDi+tVqaxFM4AvBWSG3sKDCRC
 NPA4lDaeoCpS8CsgLxRZg802nWrQPQecGCdXqYctiynPyMIAzYncAW7BXnLuqZdmqiq7
 lmNY1mZLDVoPD5SAcNNPdqQCcypDkXcAg+PaiFPMbfZqC2X+xM6M1pHyx+WOo3XdPYs0
 eCpw==
In-Reply-To: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Adam Ford <aford173@gmail.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp

On Wed, Sep 25, 2019 at 9:17 AM Adam Ford <aford173@gmail.com> wrote:

> I tried cma=256M and noticed the cma dump at the beginning didn't
> change.  Do we need to setup a reserved-memory node like
> imx6ul-ccimx6ulsom.dtsi did?

I don't think so.

Were you able to identify what was the exact commit that caused such regression?
