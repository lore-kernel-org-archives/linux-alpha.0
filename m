From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH v2 5/5] events: Illustrate the transition to local{,64}_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:10 +0200
Message-ID: <20230405141710.3551-6-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX2Wz3EA82OevW9OfamI7/Kvuo0JRd1kfWWZWf7tBPI=;
        b=dcJpf62STM2t7wBeMFWRHA65D4e8ki42FaDdkuuO3agKqVH6m85Cy4lQ8Jc6WqjxoF
         fnnlug9El9w16kuSLGTsPbq74oNaQ+P8JDxMAcNUZHQhE8u+5jySMEVYMmtE4egR+MrD
         Yo63AeJfrWzh2LWw4CUsO/Jz8F4pDt2KwqewSmosxEslt2xhDsBYXNkotYBZ0u2SUb3b
         bY44Ptodk1vZVbJl1WFw1p9lD7pDptPbaK3ykNtKWYarwScxbwyxAFGsy3vIZ++4+u08
         7sJWtj5rpBofs9g4DRnm1uwhZ6aYf1PTSfC6VMfZ4+8IxgDtdbMLLd8hp6MXeYVptMAQ
         HEzw==
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>

This patch illustrates the transition to local{,64}_try_cmpxchg.
It is not intended to be merged as-is.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/events/core.c      | 9 ++++-----
 kernel/events/ring_buffer.c | 5 +++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index d096b04bf80e..d9310e9363f1 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -129,13 +129,12 @@ u64 x86_perf_event_update(struct perf_event *event)
 	 * exchange a new raw count - then add that new-prev delta
 	 * count to the generic event atomically:
 	 */
-again:
 	prev_raw_count = local64_read(&hwc->prev_count);
-	rdpmcl(hwc->event_base_rdpmc, new_raw_count);
 
-	if (local64_cmpxchg(&hwc->prev_count, prev_raw_count,
-					new_raw_count) != prev_raw_count)
-		goto again;
+	do {
+		rdpmcl(hwc->event_base_rdpmc, new_raw_count);
+	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev_raw_count,
+				      new_raw_count));
 
 	/*
 	 * Now we have the new raw value and have updated the prev
diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 273a0fe7910a..111ab85ee97d 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -191,9 +191,10 @@ __perf_output_begin(struct perf_output_handle *handle,
 
 	perf_output_get_handle(handle);
 
+	offset = local_read(&rb->head);
 	do {
 		tail = READ_ONCE(rb->user_page->data_tail);
-		offset = head = local_read(&rb->head);
+		head = offset;
 		if (!rb->overwrite) {
 			if (unlikely(!ring_buffer_has_space(head, tail,
 							    perf_data_size(rb),
@@ -217,7 +218,7 @@ __perf_output_begin(struct perf_output_handle *handle,
 			head += size;
 		else
 			head -= size;
-	} while (local_cmpxchg(&rb->head, offset, head) != offset);
+	} while (!local_try_cmpxchg(&rb->head, &offset, head));
 
 	if (backward) {
 		offset = head;
-- 
2.39.2

