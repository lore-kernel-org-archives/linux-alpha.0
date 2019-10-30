From: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v7] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Date: Wed, 30 Oct 2019 08:28:31 -0400
Message-ID: <1DA7B9E0-4BE2-4A9C-9B33-20EEFE3B5069@lca.pw>
References: <20191030102800.GX4097@hirez.programming.kicks-ass.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=RWzCO2fHz2qafmXTHqGMfw05hQL7JfU2b99nb6qM24Q=;
        b=YpggYXtaQ4inUnm3g+hl6gwyTwkQanG/b7sCQFEMdYuTGvIMqBhUMY5gZMcFQHZy6y
         cF0LTgi2OwwLPaUTj9KImOSh0RdB/s2+eDRRFwc6dFQgHXUdn8VGNoe/v116d+Uf2avP
         8dpNHvP2tc1HuM1DWyROKsk4LmIy/FUIvO+FxNMftXJ8zmI7dp2oeqj6SALQVh6sczCU
         QLCoJjUbJqxutPI4YU62/TNiozHON3X0I6wT/vcSg5CGUUz1VTKzyktoFVt9Ba/39ywv
         Oda72R5tMy7ZDaofo/wx+pheOEBl3sltgQCcw4tCvJG2zID09Q6IETVjPUzevh+cU+cc
         mGjw==
In-Reply-To: <20191030102800.GX4097@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Zijlstra <peterz@infradead.org>
Cc: Michal Hocko <mhocko@kernel.org>, Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, heiko.carstens@de.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com, akpm@linux-foundation.org, rppt@linux.ibm.com, anshuman.khandual@arm.com, tglx@linutronix.de, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.com, luto@kernel.org, len.brown@intel



> On Oct 30, 2019, at 6:28 AM, Peter Zijlstra <peterz@infradead.org> wrote:
>=20
> It only makes 'wild' guesses when the BIOS is shit and it complains
> about that.
>=20
> Or do you like you BIOS broken?

Agree. It is the garbage in and garbage out. No need to complicate the exist=
ing code further.=
