From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Subject: [PATCH v3] sock: allow reading and changing sk_userlocks with setsockopt
Date: Wed,  4 Aug 2021 10:55:56 +0300
Message-ID: <20210804075556.2582-1-ptikhomirov@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xo2gd+rzZF+/e9hXZb8afjS3RTViQX8wxnWQo/jaS0=;
 b=FFw9+baAbmqDgRxh9smmjlBqvdaeZ280HDDKiiZdQ4sty/GQPOQSda6s/OYzNlq/l5BW9+UemY/TcW68nyeg2y19zW9OQjg+aqyuTzy1WXhLQ2++lou9RgEj5JV8aMwBAemN5xR/A35dJG4MIuIiVURhPf9C6Wqqq78qhKzdpd4=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Andrei Vagin <avagin@gmail.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, kernel@openvz.org

SOCK_SNDBUF_LOCK and SOCK_RCVBUF_LOCK flags disable automatic socket
buffers adjustment done by kernel (see tcp_fixup_rcvbuf() and
tcp_sndbuf_expand()). If we've just created a new socket this adjustment
is enabled on it, but if one changes the socket buffer size by
setsockopt(SO_{SND,RCV}BUF*) it becomes disabled.

CRIU needs to call setsockopt(SO_{SND,RCV}BUF*) on each socket on
restore as it first needs to increase buffer sizes for packet queues
restore and second it needs to restore back original buffer sizes. So
after CRIU restore all sockets become non-auto-adjustable, which can
decrease network performance of restored applications significantly.

CRIU need to be able to restore sockets with enabled/disabled adjustment
to the same state it was before dump, so let's add special setsockopt
for it.

Let's also export SOCK_SNDBUF_LOCK and SOCK_RCVBUF_LOCK flags to uAPI so
that using these interface one can reenable automatic socket buffer
adjustment on their sockets.

Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
---
Here is a corresponding CRIU commits using these new feature to fix slow
download speed problem after migration:
https://github.com/checkpoint-restore/criu/pull/1568

Origin of the problem:

We have a customer in Virtuozzo who mentioned that nginx server becomes
slower after container migration. Especially it is easy to mention when
you wget some big file via localhost from the same container which was
just migrated.

By strace-ing all nginx processes I see that nginx worker process before
c/r sends data to local wget with big chunks ~1.5Mb, but after c/r it
only succeeds to send by small chunks ~64Kb.

Before:
sendfile(12, 13, [7984974] => [9425600], 11479629) = 1440626 <0.000180>

After:
sendfile(8, 13, [1507275] => [1568768], 17957328) = 61493 <0.000675>

Smaller buffer can explain the decrease in download speed. So as a POC I
just commented out all buffer setting manipulations and that helped.

Note: I'm not sure about the way I export flags to uAPI, probably there
is some other better way without separating BUF and BIND lock flags to
different header files.

v2: define SOCK_BUF_LOCK_MASK mask
v3: reject other flags except SOCK_SNDBUF_LOCK and SOCK_RCVBUF_LOCK, use
mask in sock_getsockopt, export flags to uapi/linux/socket.h
---
 arch/alpha/include/uapi/asm/socket.h  |  2 ++
 arch/mips/include/uapi/asm/socket.h   |  2 ++
 arch/parisc/include/uapi/asm/socket.h |  2 ++
 arch/sparc/include/uapi/asm/socket.h  |  2 ++
 include/net/sock.h                    |  3 +--
 include/uapi/asm-generic/socket.h     |  2 ++
 include/uapi/linux/socket.h           |  5 +++++
 net/core/sock.c                       | 13 +++++++++++++
 8 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/socket.h b/arch/alpha/include/uapi/asm/socket.h
index 6b3daba60987..1dd9baf4a6c2 100644
--- a/arch/alpha/include/uapi/asm/socket.h
+++ b/arch/alpha/include/uapi/asm/socket.h
@@ -129,6 +129,8 @@
 
 #define SO_NETNS_COOKIE		71
 
+#define SO_BUF_LOCK		72
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/mips/include/uapi/asm/socket.h b/arch/mips/include/uapi/asm/socket.h
index cdf404a831b2..1eaf6a1ca561 100644
--- a/arch/mips/include/uapi/asm/socket.h
+++ b/arch/mips/include/uapi/asm/socket.h
@@ -140,6 +140,8 @@
 
 #define SO_NETNS_COOKIE		71
 
+#define SO_BUF_LOCK		72
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
index 5b5351cdcb33..8baaad52d799 100644
--- a/arch/parisc/include/uapi/asm/socket.h
+++ b/arch/parisc/include/uapi/asm/socket.h
@@ -121,6 +121,8 @@
 
 #define SO_NETNS_COOKIE		0x4045
 
+#define SO_BUF_LOCK		0x4046
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64
diff --git a/arch/sparc/include/uapi/asm/socket.h b/arch/sparc/include/uapi/asm/socket.h
index 92675dc380fa..e80ee8641ac3 100644
--- a/arch/sparc/include/uapi/asm/socket.h
+++ b/arch/sparc/include/uapi/asm/socket.h
@@ -122,6 +122,8 @@
 
 #define SO_NETNS_COOKIE          0x0050
 
+#define SO_BUF_LOCK              0x0051
+
 #if !defined(__KERNEL__)
 
 
diff --git a/include/net/sock.h b/include/net/sock.h
index ff1be7e7e90b..6e761451c927 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -68,6 +68,7 @@
 #include <net/tcp_states.h>
 #include <linux/net_tstamp.h>
 #include <net/l3mdev.h>
+#include <uapi/linux/socket.h>
 
 /*
  * This structure really needs to be cleaned up.
@@ -1438,8 +1439,6 @@ static inline int __sk_prot_rehash(struct sock *sk)
 #define RCV_SHUTDOWN	1
 #define SEND_SHUTDOWN	2
 
-#define SOCK_SNDBUF_LOCK	1
-#define SOCK_RCVBUF_LOCK	2
 #define SOCK_BINDADDR_LOCK	4
 #define SOCK_BINDPORT_LOCK	8
 
diff --git a/include/uapi/asm-generic/socket.h b/include/uapi/asm-generic/socket.h
index d588c244ec2f..1f0a2b4864e4 100644
--- a/include/uapi/asm-generic/socket.h
+++ b/include/uapi/asm-generic/socket.h
@@ -124,6 +124,8 @@
 
 #define SO_NETNS_COOKIE		71
 
+#define SO_BUF_LOCK		72
+
 #if !defined(__KERNEL__)
 
 #if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
diff --git a/include/uapi/linux/socket.h b/include/uapi/linux/socket.h
index c3409c8ec0dd..eb0a9a5b6e71 100644
--- a/include/uapi/linux/socket.h
+++ b/include/uapi/linux/socket.h
@@ -26,4 +26,9 @@ struct __kernel_sockaddr_storage {
 	};
 };
 
+#define SOCK_SNDBUF_LOCK	1
+#define SOCK_RCVBUF_LOCK	2
+
+#define SOCK_BUF_LOCK_MASK (SOCK_SNDBUF_LOCK | SOCK_RCVBUF_LOCK)
+
 #endif /* _UAPI_LINUX_SOCKET_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index 9671c32e6ef5..aada649e07e8 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1358,6 +1358,15 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		ret = sock_bindtoindex_locked(sk, val);
 		break;
 
+	case SO_BUF_LOCK:
+		if (val & ~SOCK_BUF_LOCK_MASK) {
+			ret = -EINVAL;
+			break;
+		}
+		sk->sk_userlocks = val | (sk->sk_userlocks &
+					  ~SOCK_BUF_LOCK_MASK);
+		break;
+
 	default:
 		ret = -ENOPROTOOPT;
 		break;
@@ -1720,6 +1729,10 @@ int sock_getsockopt(struct socket *sock, int level, int optname,
 		v.val64 = sock_net(sk)->net_cookie;
 		break;
 
+	case SO_BUF_LOCK:
+		v.val = sk->sk_userlocks & SOCK_BUF_LOCK_MASK;
+		break;
+
 	default:
 		/* We implement the SO_SNDLOWAT etc to not be settable
 		 * (1003.1g 7).
-- 
2.31.1

