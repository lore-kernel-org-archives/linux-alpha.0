From: Christian Brauner <christian@brauner.io>
Subject: Re: [PATCH 1/2] arch: mark syscall number 435 reserved for clone3
Date: Mon, 15 Jul 2019 16:29:09 +0200
Message-ID: <20190715142907.7p43dgmx5sz5oouz@brauner.io>
References: <20190714192205.27190-1-christian@brauner.io>
 <20190714192205.27190-2-christian@brauner.io>
 <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6QkSbJ8pehcPJsEqSW/0Jw3Kj7WtEh8gEc9PVJH1CrA=;
 b=YDX5Cni69En7Hnte+J3OlCSJ0HlBPkTtUerLm+TEt90UKpDUfDuJvjCxyA/xsbdN+4
 NlM28WRfcpu6byVaPN4oE7VH4s3k0vd1hEb+a57aabIHxBzldliL2Htoq2btKjK4n7AS
 dEk3INMwrusBqXJOHjVd5y+1ZYzs3lAeIPfrwgpru+b49OUDLgXf6+CpcsZ6fG8itG0F
 1l0rPwOFa7qBIOGncKcrTTI0b32v3jNfOV6b+s6CSQAQGdFNyL4RrykbWCb0WlSmG84g
 rPg2y0ELpTG/hNU8ek2ztwI6ffWkYO0HuhjiHpT2javBLichO07Q+0RuqzlaxnSebk5a
 7e7Q==
Content-Disposition: inline
In-Reply-To: <e14eb2f9-43cb-0b9d-dec4-b7e7dcd62091@de.ibm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de, linux-sh@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Vasily Gorbik <gor@linux.ibm.com>

On Mon, Jul 15, 2019 at 03:56:04PM +0200, Christian Borntraeger wrote:
> I think Vasily already has a clone3 patch for s390x with 435. 

Excellent. I'll leave the # 435 reserved for clone3 on s390x in until
this patch has landed. It shouldn't be a merge conflict and if so it
should be trivial.

Christian
