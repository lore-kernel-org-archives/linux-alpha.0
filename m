Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30F22654F
	for <linux-alpha@vger.kernel.org>; Fri, 10 Jan 2025 18:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534543; cv=none; b=nk1/GhPbWSO/74cH4kA1WCndtmlnNJ4+oqkDtX/1bJR9klugmLh5Ot8ysV83cVibYJ4zHmzq7u67xNCcTwbLsYWY2fKT0A2uoasZFp6M9nZUmRos25V8H80oUoqZl8Lpbr3gltFeQdY9BreM1ZTlQ3+xSIMWg13vuP7JZIWLYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534543; c=relaxed/simple;
	bh=yFE2RvhsdHiuE5lhdo52Dzo1ojzSWSiC8Ss1voWwr0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fzYGGonsnGVA7YR+dc4bPCS0fmIySJ1OAbMMhLyfZkQqQfEoAUG/faCr3MnstJFbzYO13t2oIgO7ptzc8tSXH+ucsb9jNYurY5gOH58jTXyTaWsLvx9kLvRLh7Y7sE2ts1QHFhDfVAw0yqiprSQ9KV752NAE1C4gwseCKi70vUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qXm0akH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qXm0akH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4361f371908so16549935e9.0
        for <linux-alpha@vger.kernel.org>; Fri, 10 Jan 2025 10:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534511; x=1737139311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t56obMWOlMyKyO7q6Si1cnEbfn2qyXwrpnzxR+4ONcI=;
        b=4qXm0akHB0cuC/EDQ8VuOoCpDXwtoPfxrekyuf3Jr5mxf6WGp7rbhmhHeDIXklqxd6
         T9lxWQyVYIV47B5OJUReQPTb2cO2OVBUtcNSPlShJjCRvFudrMBkxkEdOt7YD8B8s+2v
         Xr3EQaZc/p07fpcwbTqNiK+qV7HY0Toaji/thgJjB5yEeJhTxg1FeoYSHEY8Jfy2/8EZ
         jiZa5Ti+Lb8moW5SGa97W3jyG6bI8MyoEEfqB2DFyV9BFxFzztzkYfBsUkAjDJ+UDd9H
         nFSU4xK+FYnLvbOSILO7311XYQqvF516GEImEec3eyOp+/ymIWgUdw/GtFKY2TxOmoyN
         vLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534511; x=1737139311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t56obMWOlMyKyO7q6Si1cnEbfn2qyXwrpnzxR+4ONcI=;
        b=ByahKFJ23nUBaMxUqT4f7qiv4GIdMOSsStREkBsnytmFKtzjvB7g3kCWE7uDcUVPe4
         NHEdQd8xLivOC1Iw9Fux1w7SxNTHs7/3WXdJK4PnCljh9wZffyKEphSZr+brTSs9japC
         SWAgRYk9jBj4p/NCnMDFt3fo4n6qvz/l67enwUad6KZPcyHhUpnIWJEcVTc4NENAZ3vD
         HTMtQ567j+lA9SMNKcoZV6KF3thDazjORdZ+YJM40LJIroFl8Aev6eSG8zXA1gxejm65
         wCnUePYqx3ISlpwe8UgLIyu8y8IPMe9jL0PSlkjcU4XxVEgGTmbjmicKlEBNwujimQDP
         kv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7Hf/V8nbVd3IVZ/4E2eaVJh1Tpb4fypNq/PokLGW1RPJKH0JSXnh5vHqxVXlFLev1Vkh8Rw4sz5pP4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzybG7zddsWoFYKkHkfVU4yWi4hQPeRjHvNnQYTre3dcVHuFolD
	PtrRa20punKoeDneFMpu4MmAQPqmhsT0YH7dsKMGTIvwaV5u3RjjImB9NO2r1oh9VqvaEVJLLvY
	fW6BJ+kw7DQ==
X-Google-Smtp-Source: AGHT+IHNze04KHr3mNrPu4oWzk1uJr6kUgfUG8uUPvBwU8SZTj2uxyjbDaOwELGdGilpgEGrHE3bExV1JNVQyA==
X-Received: from wmba16.prod.google.com ([2002:a05:600c:6dd0:b0:434:f350:9fc])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:70a:b0:38a:4184:1519 with SMTP id ffacd0b85a97d-38a873051e1mr10550801f8f.23.1736534511095;
 Fri, 10 Jan 2025 10:41:51 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:55 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-29-8419288bc805@google.com>
Subject: [PATCH RFC v2 29/29] mm: asi: Stop ignoring asi=on cmdline flag
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

At this point the minimum requirements are in place for the kernel to
operate correctly with ASI enabled.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/mm/asi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/asi.c b/arch/x86/mm/asi.c
index f10f6614b26148e5ba423d8a44f640674573ee40..3e3956326936ea8550308ad004dbbb3738546f9f 100644
--- a/arch/x86/mm/asi.c
+++ b/arch/x86/mm/asi.c
@@ -207,14 +207,14 @@ void __init asi_check_boottime_disable(void)
 		pr_info("ASI disabled through kernel command line.\n");
 	} else if (ret == 2 && !strncmp(arg, "on", 2)) {
 		enabled = true;
-		pr_info("Ignoring asi=on param while ASI implementation is incomplete.\n");
+		pr_info("ASI enabled through kernel command line.\n");
 	} else {
 		pr_info("ASI %s by default.\n",
 			enabled ? "enabled" : "disabled");
 	}
 
 	if (enabled)
-		pr_info("ASI enablement ignored due to incomplete implementation.\n");
+		setup_force_cpu_cap(X86_FEATURE_ASI);
 }
 
 /*

-- 
2.47.1.613.gc27f4b7a9f-goog

