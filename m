From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 0/2] alpha updates
Date: Wed, 30 Jul 2014 11:42:30 -1000
Message-ID: <1406756552-23864-1-git-send-email-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=1ZnSyLWipcj5nZl8iIs8dq93vwy9WHx5o+fCCRm/GaE=;
        b=fhLotE5/Aj5zTnKMr4inWmOcH+8MQNrQ4Su2mRuPzsc0aACkGT8sQntqPbR4Mjv6OY
         D34Qaj+/APYnZdTPvogCxLTm77UshqfMIKEyZoniU9mit+FaKiL8g15I2kypkL/JNtLm
         rQyyW5z2Io6bc7FrTI4XO7T8FS8EWf/bF8YydlQwMCR/cOXSivlj3wXN3DKCSe/HbCH5
         MvL6R/QwffUQMAnl/fXL69hQB28lJWXny3qbaHtzPo0ZoE5Y36r7LM7mGC4bTNSC5kxr
         IrWghFmlDObIcRuisBKYJkO9iJV3F2S/xKecKMbqK7xBMSzgQx3GXkEZAck8v87W21Ux
         oycw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: mcree@orcon.net.nz, linux-alpha@vger.kernel.org

The first patch should fix the clone bug that Michael Cree reported.
The second patch adds the three new syscalls since the last update.

The tree can be found at

  git://github.com/rth7680/linux.git axp-next


r~


Richard Henderson (2):
  alpha: Remove "strange" OSF/1 fork semantics
  alpha: Add sched_set/getattr and renameat2 syscalls

 arch/alpha/include/asm/unistd.h      | 2 +-
 arch/alpha/include/uapi/asm/unistd.h | 3 +++
 arch/alpha/kernel/process.c          | 2 --
 arch/alpha/kernel/systbls.S          | 3 +++
 4 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.9.3

