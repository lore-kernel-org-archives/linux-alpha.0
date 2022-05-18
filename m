From: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [PATCH 01/16] signal/alpha: Remove unused definition of TASK_REAL_PARENT
Date: Wed, 18 May 2022 17:53:40 -0500
Message-ID: <20220518225355.784371-1-ebiederm@xmission.com>
References: <871qwq5ucx.fsf_-_@email.froward.int.ebiederm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <871qwq5ucx.fsf_-_@email.froward.int.ebiederm.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: rjw@rjwysocki.net, Oleg Nesterov <oleg@redhat.com>, mingo@kernel.org, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, mgorman@suse.de, bigeasy@linutronix.de, Will Deacon <will@kernel.org>, tj@kernel.org, linux-pm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>, linux-ia64@vger.kernel.org, Robert OCallahan <roc@pernos.co>, Kyle Huey <khuey@pernos.co>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.>

Rather than update this defition when I move tsk->real_parent into
signal_struct remove it now.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 arch/alpha/kernel/asm-offsets.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index 2e125e5c1508..0fca99dc5757 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -21,7 +21,6 @@ void foo(void)
 
         DEFINE(TASK_BLOCKED, offsetof(struct task_struct, blocked));
         DEFINE(TASK_CRED, offsetof(struct task_struct, cred));
-        DEFINE(TASK_REAL_PARENT, offsetof(struct task_struct, real_parent));
         DEFINE(TASK_GROUP_LEADER, offsetof(struct task_struct, group_leader));
         DEFINE(TASK_TGID, offsetof(struct task_struct, tgid));
         BLANK();
-- 
2.35.3

