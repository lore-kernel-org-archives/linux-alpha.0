From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 10/10] perf/ring_buffer: use local_try_cmpxchg in __perf_output_begin
Date: Sun,  5 Mar 2023 21:56:28 +0100
Message-ID: <20230305205628.27385-11-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOf0dR/RPpY4HJc+yEr00P2lL8nnE6ZdPZ2RnMEV2qQ=;
        b=AzC0MtpS6jzuzYUPFsrIfgSP8aZbYwDqq5a+izUb9a0flhuTk9IJhffPMtswIUk4wO
         sg+KQDUeI1WfTBjEPCVkavJWGZOiRXkonvodFjQekv1AtQJNs5CNYgKk72i8myvpgGVe
         K9+Gcl430QJD9AbzGRenEZ61TH0KIeWK+0iYs+J05wVbAMYgv5sIn3w1+Cwy1JerQSRC
         KH89b71gdC8EcpGw2scdHdGW+tPap0uAwmnq+3aLE3kGWG2fm1xZDaMDvjLA9woC5Ulu
         0/MPaQHFdc8LJgoZ7thFoEH3DKdiynUC63aS/FSnJG4o6I/92Na/lIc5Pd1rCjK+C5wU
         iyIg==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>

Use local_try_cmpxchg instead of local_cmpxchg (*ptr, old, new) == old in
__perf_output_begin.  x86 CMPXCHG instruction returns success in ZF flag,
so this change saves a compare after cmpxchg.

Also, local_try_cmpxchg implicitly assigns old *ptr value to "old" when
cmpxchg fails. There is no need to re-read the value in the loop.

No functional change intended.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 kernel/events/ring_buffer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 273a0fe7910a..e07c10f4d141 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -191,9 +191,10 @@ __perf_output_begin(struct perf_output_handle *handle,
 
 	perf_output_get_handle(handle);
 
+	offset = local_read(&rb->head);
 	do {
+		head = offset;
 		tail = READ_ONCE(rb->user_page->data_tail);
-		offset = head = local_read(&rb->head);
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

