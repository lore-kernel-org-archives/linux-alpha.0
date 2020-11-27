From: Youling Tang <tangyouling@loongson.cn>
Subject: [PATCH] alpha: ptrace generic requests
Date: Fri, 27 Nov 2020 11:54:31 +0800
Message-ID: <1606449271-13922-1-git-send-email-tangyouling@loongson.cn>
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Nesterov <oleg@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This removes duplicated code by calling the generic ptrace_request
function for the things they already handle.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/alpha/kernel/ptrace.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 8c43212..eb4d566 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -301,12 +301,6 @@ long arch_ptrace(struct task_struct *child, long request,
 		DBG(DBG_MEM, ("peek $%lu->%#lx\n", addr, ret));
 		break;
 
-	/* When I and D space are separate, this will have to be fixed.  */
-	case PTRACE_POKETEXT: /* write the word at location addr. */
-	case PTRACE_POKEDATA:
-		ret = generic_ptrace_pokedata(child, addr, data);
-		break;
-
 	case PTRACE_POKEUSR: /* write the specified register */
 		DBG(DBG_MEM, ("poke $%lu<-%#lx\n", addr, data));
 		ret = put_reg(child, addr, data);
-- 
2.1.0

