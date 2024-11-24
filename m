Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481472500BA
	for <linux-alpha@vger.kernel.org>; Sun, 24 Nov 2024 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732484893; cv=none; b=OZ4ADZdwwDCQCEIglVnUgWkH45L01gSdyhbfXpM9tsV+MMIOB74gjdCld8ZrkRdsUrtOSB5sIpR+LwwqeNywqS5cZNUxlJnPU5dXRMWT4W1uPuKaQ3yl5j8szHfujHGxG89UJI3QeCEzng2lz02ILUwsVfFijD5v2BZz/i/NmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732484893; c=relaxed/simple;
	bh=C6u2IXfaNju+x4lzG1+/hMfGr7fqZDIUnKuP+3vy5es=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=EH+11gcvnb6Sbg0iLjrv0cezkxyjoniT3GZum3Uhx4fZhKDuYdZv6RQbD1Cy3kSO/lzo2mOtxHiJ1WuBOcSxS/0hPNyeLp+k13SV96MuKvtFXQsK1Z3dAZXHG934lPPSYGtY7GGqByucwtdbWwXrq/FPf8bw3SUxUimvKvaOSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL9d+FRc; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL9d+FRc"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa53a971480so165737266b.1
        for <linux-alpha@vger.kernel.org>; Sun, 24 Nov 2024 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732484889; x=1733089689; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IXjctcAynFsYRJ9lHcoTepktSWq3nb5A5thyEudzag0=;
        b=GL9d+FRcVDsOqLQoFbzSrzHBfYz60QhnDZMI8eLbOmI6BBCLCeydtUwtUObv2A935w
         82VptloEyZ91cuB91Dy+cjhfuZdpPdC2X4PkfbN3f3atGVaZ7n8QhCuoOuZDZ/V8ASOp
         ijkPw8adiSrjS5BlUGScxnTSDrNXX80WYZeINpDTCu8xMPmS+LEl1YpZl2ivegzeeTtH
         OP7chnXk7WT+VlshGUos9aKaAUD4m2Gzvs2uC9MS33aYR8Xt4vSXijBubWnvCMe24yJ9
         B8XZ0i3c6pC6xhPpBV8EMIkzZ2I55JliaCGBAeCRUtAU1q81k2XEV+7BaOJs5J+jPF5A
         9q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732484889; x=1733089689;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXjctcAynFsYRJ9lHcoTepktSWq3nb5A5thyEudzag0=;
        b=ZFbDYA6DL+oJPa5GE4aqpv5qQVBo751I3WeeLDNG0TnMiEyqNvZIgU4jh5SHtabR3h
         J+rayLmzV/bsQWjGYe+enRNo4X3f8c5aoK8ClkXBbvKBXTfS/SBiSG+oL7g7uWZH+VmE
         IS/rOM0RJG9lVSat3Bu7Rpz4+rNSocXpYP0FO8Bx7/ldjUTAdEQ4I3fefBSAoQMREw4x
         bWdniSTPTj/uy9L2oE/4JtDcpyYAbWXuUmOG9gON2kVm0oIFSD97L0BVe1O6n9cV8t4N
         c+3TQyxjuoF9noEZ8igEaJjp2yLwsZxVVTAe+coADiFjFhk611aso3L0L4iZrurTdTOB
         tOlQ==
X-Gm-Message-State: AOJu0Yy0CJ7/ZQv0CX1IImmT8jBL3UjmAzDdnWUSCLkZkaFgGaVsx87X
	ln2cXCgJrR/Le0WHD6/VG7lN2Pj0XM0YhRPlveYMbMUBkcyshxIUh0Mc/S3BiSGloQ9ThlaqzrH
	W+nQlo27lEqaggJpG2ljXk/PEM5Z/wPgx
X-Gm-Gg: ASbGnct8pVeMwJ+PnuyyPL+8wKafVmyHOcSEedctRu3ZAcxeQ2l1fO+o6lWbboRf0Qf
	ll6GzztIOAYZ3/gIWZ0aQRWU/dG7D8eDw
X-Google-Smtp-Source: AGHT+IHUhAQVJIkxtuiXrmt96R9M1zkfnrAulRX0SmVMH7sRFgdojcPvtws0KtnqaN3QCAwHGQo7dbOJQdQh3C0ZhTU=
X-Received: by 2002:a17:906:3155:b0:a9a:bbcc:508c with SMTP id
 a640c23a62f3a-aa509906371mr877335566b.2.1732484889206; Sun, 24 Nov 2024
 13:48:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 24 Nov 2024 22:47:57 +0100
Message-ID: <CA+=Fv5Qs2DKHqTjDRG5Hvx4+A8feMAkNHJ+_0GL67GOBbYCu2Q@mail.gmail.com>
Subject: Kernel Oops on alpha with kernel version >=6.9.x
To: linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,


First some background:
I've been trying to boot recent kernels on my alpha machines. Anything
after linux-6.8.12 gives me trouble. After doing a kernel bisect, I
found that commit 9187210eee7d87eea37b45ea93454a88681894a4
(net-next-6.9) is where my troubles begin. The problem consists in
that the boot process gets stuck when trying to set parameters for
network interfaces. The bad commit does make a lot of updates to the
network code.

When booting the system with kernel 6.12.0 I'm able to boot into
single-user mode, but when starting system services one by one I
trigger a kernel Oops when the network interface is renamed (see stack
dump below). Looking at the changes made by the bad commit, it seems
to (among other things) be replacing the locking mechanism (RCU
instead of rtnl_lock). The stack dump from the kernel Oops suggests
that something is happening in the RCU locking code. I'm no expert on
RCU-stuff but I read somewhere that it is done by volatile access on
all systems other than DEC Alpha, where a memory barrier instruction
is required. This indicates that the change could affect Alpha
architecture differently? Inspecting the changes to networking code in
the bad commit, particularly the changes made to net/core/dev.c, I put
together the patch below. This patch reverts one of the lines changed
in the "bad commit" for net/core/dev.c. After reverting the change on
just this line, I'm able to boot kernel 6.12.0 on my Alpha ES-40 to
full multi-user again. I've tested this on an Alpha ES40 and an
UP2000+ and the problem is 100% reproducible on both machines. The
patch might not be a real solution to the problem but could be a good
place to start looking when figuring out what's really going on.

Not sure what is the next step here, it would be interesting to hear
if anyone else has seen this or is able to reproduce it?

------------------------------------
Patch to "fix" the problem:
-----------------------------------

diff --git a/net/core/dev.c b/net/core/dev.c
index 13d00fc10f55..26fda14367e5 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1261,7 +1261,7 @@ int dev_change_name(struct net_device *dev,
const char *newname)

        netdev_name_node_del(dev->name_node);

-       synchronize_net();
+       synchronize_rcu();

        netdev_name_node_add(net, dev->name_node);


--------------------------
dmesg/kernel log:
-------------------------

[   93.431592] tulip 0000:01:02.0 enp1s2: renamed from eth0

[   93.436475] Unable to handle kernel paging request at virtual
address 0000000000000000
[   93.436475] CPU 1
[   93.436475] rcu_exp_gp_kthr(17): Oops -1
[   93.436475] pc = [<0000000000000000>]  ra = [<0000000000000000>]
ps = 0000    Not tainted
[   93.436475] pc is at 0x0
[   93.436475] ra is at 0x0
[   93.436475] v0 = 0000000000000007  t0 = fffffc0000e62440  t1 =
0000000000000001
[   93.436475] t2 = 0000000000000000  t3 = 0000000000000001  t4 =
0000000000000001
[   93.436475] t5 = 0000000000000001  t6 = 0000000000000001  t7 =
fffffc0003138000
[   93.436475] s0 = fffffc0000e62440  s1 = fffffc0000ec3a10  s2 =
fffffc0000ec3a10
[   93.436475] s3 = fffffc0000ec3a10  s4 = fffffc00003a90f0  s5 =
fffffc0000e62440
[   93.436475] s6 = 0000000000000000
[   93.436475] a0 = 0000000000000000  a1 = 0000000000000000  a2 =
0000000000000000
[   93.436475] a3 = 0000000000000000  a4 = 0000000000000001  a5 =
fffffc0000517744
[   93.436475] t8 = 0000000000000001  t9 = 0000000000000001  t10=
fffffc0000e3d320
[   93.436475] t11= fffffc0000220240  pv = fffffc0000b73210  at =
0000000000000000
[   93.436475] gp = fffffc0000eb3a10  sp = 00000000ea2ea184
[   93.436475] Disabling lock debugging due to kernel taint
[   93.436475] Trace:
[   93.436475] [<fffffc00003aee60>] wait_rcu_exp_gp+0x30/0xa0
[   93.436475] [<fffffc0000b6c200>] __cond_resched+0x30/0x90
[   93.436475] [<fffffc00003569b8>] kthread_worker_fn+0xc8/0x1f0
[   93.436475] [<fffffc000035863c>] kthread+0x17c/0x1c0
[   93.436475] [<fffffc00003568f0>] kthread_worker_fn+0x0/0x1f0
[   93.436475] [<fffffc0000311128>] ret_from_kernel_thread+0x18/0x20

[   93.436475] Code:
[   93.436475]  00000000
[   93.436475]  00000000
[   93.436475]  00063301
[   93.436475]  0000077c
[   93.436475]  00001111
[   93.436475]  000022a2
