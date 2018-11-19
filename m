From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 00/10] perf/core: Generalise event exclusion checking
Date: Mon, 19 Nov 2018 14:08:00 +0100
Message-ID: <20181119130800.GE9761@hirez.programming.kicks-ass.net>
References: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIXhT0JzrMr+u8T8q4QUKKi1S5xXa3Q8RSGuNnwPWYM=; b=QCBO54U/zxSFbW
	dJoqgAHLh1PrJiIzAQz5XOl/J76yBCyM7K7sNkHke4OhQUjSFK8N+WwFoo1VCT6Xezm7KF56DlR9e
	ZZoq467p9mkC43z6m304gSrTbNDrWQpF/TxgSmhNhi/o2tjxf5XEzehTwQL/kifabqvjxhcxGMuMb
	T05DBDMDjErZE2bddy00ps6X5A3SWfA3i8hOKJjJev1H2lgyYWlxvcwS8fWVPcSC/4GO/zesBzRBL
	PPtl3V4lQsLbvbpNwkK2azpP74741a7cpF+3BbKrlcMU35xw0OHGzr2n9i2AizX2JoYywhiMA0Gu6
	uHJU5ePxdQm0pCYarusQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OjEPoOrSvn/SVnSSCA7UFGSNFLgoXG8AkPeL/+L6YF0=; b=sSZI6FDxu+tf8PQCNWEkJ+Tz8
 oT3acWz0M2WVtCMCF5Fpo/a5j98FxzyitYJKXB0XckSeSbEwwHNUuAOBgo45a67zpPJIXS4gFSl2G
 yjqidKF0N1/i+2KxdsNEKvmTjTE8hZ57kV/Esy+Mo16uEadxL6Tp9injSfGZ7jLONWu6dYZdw4mlJ
 hzuv+KZnPqtZK9GOiIidk7wTerGDYgJXbMJF69XsA9jwJHba2o6AGXJq79x1IHh7CPQegUjIM8HpY
 P39BJbhj/xfe1wf8N03bAwk2nTGR8qVbuxjEjB8Ov3ZJj4az77bcMKWwkdVWse0pyrVL0TDgBn6RV
 +hpidC2HQ==;
Content-Disposition: inline
In-Reply-To: <1542363853-13849-1-git-send-email-andrew.murray@arm.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sascha Hauer <s.hauer@pengutronix.de>, x86@kernel.org, Will Deacon <will.deacon@arm.com>, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org

On Fri, Nov 16, 2018 at 10:24:03AM +0000, Andrew Murray wrote:
> Many PMU drivers do not have the capability to exclude counting events
> that occur in specific contexts such as idle, kernel, guest, etc. These
> drivers indicate this by returning an error in their event_init upon
> testing the events attribute flags.
> 
> However this approach requires that each time a new event modifier is
> added to perf, all the perf drivers need to be modified to indicate that
> they don't support the attribute. This results in additional boiler-plate
> code common to many drivers that needs to be maintained. An example of
> this is the addition of exclude_host and exclude_guest in 2011 yet many
> PMU drivers do not support this or indicate an error on events that make
> use of it.
> 
> This patch generalises the test for exclusion and updates PMU drivers to
> use it. This is a functional change as some PMU drivers will now correctly
> report that they don't support certain events whereas they previously did.

Right, I like that idea, and yes, there's a lot of fail around there :/

> A longer term approach may instead be for PMU's to advertise their
> capabilities on registration.

This I think is the better approach. We already have the
PERF_PMU_CAP_flags that can be used to advertise various PMU
capabilities.

Something along these lines I suppose; then every PMU that actually
checks the flags, needs to set the flag, otherwise it'll fail.

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 53c500f0ca79..de15723ea52a 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -244,6 +244,7 @@ struct perf_event;
 #define PERF_PMU_CAP_EXCLUSIVE			0x10
 #define PERF_PMU_CAP_ITRACE			0x20
 #define PERF_PMU_CAP_HETEROGENEOUS_CPUS		0x40
+#define PERF_PMU_CAP_EXCLUDE			0x80
 
 /**
  * struct pmu - generic performance monitoring unit
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 84530ab358c3..d76b724177b9 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9772,6 +9772,14 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 	if (ctx)
 		perf_event_ctx_unlock(event->group_leader, ctx);
 
+	if (!ret) {
+		if ((pmu->capabilities & PERF_PMU_CAP_EXCLUDE) ||
+		    event_has_exclude_flags(event)) {
+			event->destroy(event);
+			ret = -EINVAL;
+		}
+	}
+
 	if (ret)
 		module_put(pmu->module);
