From: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Subject: [PATCH v2] sock: allow reading and changing sk_userlocks with setsockopt
Date: Fri, 30 Jul 2021 19:07:08 +0300
Message-ID: <20210730160708.6544-1-ptikhomirov@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jh6J86aOfAIBVogN4IlKBvEVrOj1jW+gLb69bLO87g=;
 b=jlI1IS9/ABnSF+NuSfNgBSSF1/aFVw+e9V4nfg49aLsKtQRC3epk5b5nhh9bTex63158Mr7KZOmeSeur8A6koqX0ibVtKROC7aWFFRF1Cz7btsSWpF8tRa6Y9uNrhSehzo2zXjndsCXTYeG9jzQCUY1yAk3PP4XrPqlKJULAeto=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Andrei Vagin <avagin@gmail.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

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

v2: define SOCK_BUF_LOCK_MASK mask
---
 arch/alpha/include/uapi/asm/socket.h  | 2 ++
 arch/mips/include/uapi/asm/socket.h   | 2 ++
 arch/parisc/include/uapi/asm/socket.h | 2 ++
 arch/sparc/include/uapi/asm/socket.h  | 2 ++
 include/net/sock.h                    | 2 ++
 include/uapi/asm-generic/socket.h     | 2 ++
 net/core/sock.c                       | 9 +++++++++
 7 files changed, 21 insertions(+)

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
index f23cb259b0e2..a6fb02f39cc4 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1443,6 +1443,8 @@ static inline int __sk_prot_rehash(struct sock *sk)
 #define SOCK_BINDADDR_LOCK	4
 #define SOCK_BINDPORT_LOCK	8
 
+#define SOCK_BUF_LOCK_MASK (SOCK_SNDBUF_LOCK | SOCK_RCVBUF_LOCK)
+
 struct socket_alloc {
 	struct socket socket;
 	struct inode vfs_inode;
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
diff --git a/net/core/sock.c b/net/core/sock.c
index a3eea6e0b30a..c8c994e48b76 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1357,6 +1357,11 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		ret = sock_bindtoindex_locked(sk, val);
 		break;
 
+	case SO_BUF_LOCK:
+		sk->sk_userlocks = (sk->sk_userlocks & ~SOCK_BUF_LOCK_MASK) |
+				   (val & SOCK_BUF_LOCK_MASK);
+		break;
+
 	default:
 		ret = -ENOPROTOOPT;
 		break;
@@ -1719,6 +1724,10 @@ int sock_getsockopt(struct socket *sock, int level, int optname,
 		v.val64 = sock_net(sk)->net_cookie;
 		break;
 
+	case SO_BUF_LOCK:
+		v.val = sk->sk_userlocks & (SOCK_SNDBUF_LOCK | SOCK_RCVBUF_LOCK);
+		break;
+
 	default:
 		/* We implement the SO_SNDLOWAT etc to not be settable
 		 * (1003.1g 7).
-- 
2.31.1

