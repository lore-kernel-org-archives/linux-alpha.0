Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1747D1802B8
	for <linux-alpha@vger.kernel.org>; Fri, 10 May 2024 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715383323; cv=none; b=mYi7FmE+buvKH5g+xTv5YSxZNYwzz2ki9E1OMUn6JfpW5yGMoU5eY5lDHEf3Qzmh6XsNs863fVoaVKy5eqkgwcJtAX8kd+NycrzHW5ThMyU0cujww5Z7rKS5+gdge1CMlZ4KJjL9JM3FQblIKg4cl2pajJkkgZYTIujk8K761+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715383323; c=relaxed/simple;
	bh=haxqc5Si2/PmmQFFsT77Su1kQpD/km7HvC8GUGxp7d8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VqUc2ZqUnymMePqsYAW3m718PSFy5Pwd7V1jBBwyz26Yc9coNJgppYHmSIyR/seSIaRWdoo/niMIUS2Ld2RWeqVPSFQkXys+faIR0aOd+O62t3Z5rXciDn/cXgMDkTw5LsHW0shrG2LTMFv61QjgaOJ7BO1/5EiaxQEE1IQ4t9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgpPEZW1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgpPEZW1"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61be530d024so42215397b3.2
        for <linux-alpha@vger.kernel.org>; Fri, 10 May 2024 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715383311; x=1715988111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FY3QHzrdAW09tWueu/aMMES3p9Trxyc8IXrEfxwbZs=;
        b=YgpPEZW16IK6YJwaSjgPiNaOz2PfEh63Vw4QB6S5QZM6887j8HoxutYNDy9/vxVH1D
         bbw5fwXgUem8AQvubpLSs1UZj2zwMEJ5WVp3ESI0R854q7tHxwRXef5/t05fMkqr5xOo
         9hhi0FtEQSKusZAGvQTXeGG2lWJCb2s24UpQRbcv6+9rr3ECawKfZVyq6qX+uGi2LCXn
         dxwyckxX3maS6bobDW+2bOFGOJGXxJ1qf86WvlcPyoy9TEeaXAgj19ef0uTWxg7FC6LU
         x7LE18nPISyXbuRmCCuZu7w/VzwvcI1BMDVsUN+GGRiRX3iqekHGRRexZOzNIO3iwTFv
         1/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715383311; x=1715988111;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FY3QHzrdAW09tWueu/aMMES3p9Trxyc8IXrEfxwbZs=;
        b=vSUfSaFjmELchVecZTsHaMzxf4Ib3IrLFH0Rl+16TJpZeO9XsyEWriaY6hoUSWjLQY
         1CkHgD2xs/6FYVQ5nlK/P5jWDOY+zyhabo0sVnz0pdQeGvbw1cCzBx9ucGLM6q6xJtMw
         FYH7HiJP3XwFnNoigPjXi6FTaG4Mwqvs7fyDg2I0KxWAQTAveTorm0lzQ6t3JjcKQEdE
         uSH665MsSPQgD/RgkK9dBI3Pf1CiLnW1R3RTK6xixPCBvGeWEyYlGY6ccR9efbQz8bIR
         X5WAMFX4j3KQgzj6WXERqRoA4gQzKLBs5Fdq/VLHIVgpY0tfdmqeU8PjWftF1Bjffe8z
         Yd6A==
X-Forwarded-Encrypted: i=1; AJvYcCXYjaeH0O72jjiwBDypE5Q4DymKi8qrSTr4QqRxyiJcbRqIXFifauPy5/KsaeRTJrhDTWZ76PyBwY5WNC0uU8KT9HibCB8zl6lrOto=
X-Gm-Message-State: AOJu0Yw7rtqR/bAZG5/LmbLSaLA8w9KDVL3fDL5TL8tcRAT6iEJYpKa0
	yWbywFnpYABzzUeu+BF3aF6bhzi5Vy5PCTvcD/XBXRtAI4hkA+ya6/sLm8cyTLPG8mmFjini0Ma
	ijeBpSJUoGmU3adjQUjc+7w==
X-Google-Smtp-Source: AGHT+IFZMp0DGKEafMa3Ahm5Z9844uE7chVN6kTpJ6SyutHQMlhk8uS0G9Cz9LuMIQ4TNk1hEStkZ5HXpGe4gEYSFw==
X-Received: from almasrymina.svl.corp.google.com ([2620:15c:2c4:200:3428:1b4e:e75a:d31b])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:b9d:b0:61b:ec24:a014 with
 SMTP id 00721157ae682-622afd6d351mr9807037b3.0.1715383311305; Fri, 10 May
 2024 16:21:51 -0700 (PDT)
Date: Fri, 10 May 2024 16:21:20 -0700
In-Reply-To: <20240510232128.1105145-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510232128.1105145-1-almasrymina@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510232128.1105145-10-almasrymina@google.com>
Subject: [PATCH net-next v9 09/14] net: support non paged skb frags
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: Mina Almasry <almasrymina@google.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"

Make skb_frag_page() fail in the case where the frag is not backed
by a page, and fix its relevant callers to handle this case.

Signed-off-by: Mina Almasry <almasrymina@google.com>


---

v6:
- Rebased on top of the merged netmem changes.

Changes in v1:
- Fix illegal_highdma() (Yunsheng).
- Rework napi_pp_put_page() slightly to reduce code churn (Willem).

---
 include/linux/skbuff.h     | 42 +++++++++++++++++++++++++++++++++++++-
 include/linux/skbuff_ref.h |  9 ++++----
 net/core/dev.c             |  3 ++-
 net/core/gro.c             |  3 ++-
 net/core/skbuff.c          | 11 ++++++++++
 net/ipv4/esp4.c            |  3 ++-
 net/ipv4/tcp.c             |  3 +++
 net/ipv6/esp6.c            |  3 ++-
 8 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index c0b97c93a6de0..0dcf1c5824415 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3490,21 +3490,58 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
 	fragto->offset = fragfrom->offset;
 }
 
+/* Returns true if the skb_frag contains a net_iov. */
+static inline bool skb_frag_is_net_iov(const skb_frag_t *frag)
+{
+	return netmem_is_net_iov(frag->netmem);
+}
+
+/**
+ * skb_frag_net_iov - retrieve the net_iov referred to by fragment
+ * @frag: the fragment
+ *
+ * Returns the &struct net_iov associated with @frag. Returns NULL if this
+ * frag has no associated net_iov.
+ */
+static inline struct net_iov *skb_frag_net_iov(const skb_frag_t *frag)
+{
+	if (!skb_frag_is_net_iov(frag))
+		return NULL;
+
+	return netmem_to_net_iov(frag->netmem);
+}
+
 /**
  * skb_frag_page - retrieve the page referred to by a paged fragment
  * @frag: the paged fragment
  *
- * Returns the &struct page associated with @frag.
+ * Returns the &struct page associated with @frag. Returns NULL if this frag
+ * has no associated page.
  */
 static inline struct page *skb_frag_page(const skb_frag_t *frag)
 {
+	if (skb_frag_is_net_iov(frag))
+		return NULL;
+
 	return netmem_to_page(frag->netmem);
 }
 
+/**
+ * skb_frag_netmem - retrieve the netmem referred to by a fragment
+ * @frag: the fragment
+ *
+ * Returns the &netmem_ref associated with @frag.
+ */
+static inline netmem_ref skb_frag_netmem(const skb_frag_t *frag)
+{
+	return frag->netmem;
+}
+
 int skb_pp_cow_data(struct page_pool *pool, struct sk_buff **pskb,
 		    unsigned int headroom);
 int skb_cow_data_for_xdp(struct page_pool *pool, struct sk_buff **pskb,
 			 struct bpf_prog *prog);
+
 /**
  * skb_frag_address - gets the address of the data contained in a paged fragment
  * @frag: the paged fragment buffer
@@ -3514,6 +3551,9 @@ int skb_cow_data_for_xdp(struct page_pool *pool, struct sk_buff **pskb,
  */
 static inline void *skb_frag_address(const skb_frag_t *frag)
 {
+	if (!skb_frag_page(frag))
+		return NULL;
+
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
index 16c241a234728..0f3c58007488a 100644
--- a/include/linux/skbuff_ref.h
+++ b/include/linux/skbuff_ref.h
@@ -34,14 +34,13 @@ static inline void skb_frag_ref(struct sk_buff *skb, int f)
 
 bool napi_pp_put_page(netmem_ref netmem);
 
-static inline void
-skb_page_unref(struct page *page, bool recycle)
+static inline void skb_page_unref(netmem_ref netmem, bool recycle)
 {
 #ifdef CONFIG_PAGE_POOL
-	if (recycle && napi_pp_put_page(page_to_netmem(page)))
+	if (recycle && napi_pp_put_page(netmem))
 		return;
 #endif
-	put_page(page);
+	put_page(netmem_to_page(netmem));
 }
 
 /**
@@ -54,7 +53,7 @@ skb_page_unref(struct page *page, bool recycle)
  */
 static inline void __skb_frag_unref(skb_frag_t *frag, bool recycle)
 {
-	skb_page_unref(skb_frag_page(frag), recycle);
+	skb_page_unref(skb_frag_netmem(frag), recycle);
 }
 
 /**
diff --git a/net/core/dev.c b/net/core/dev.c
index b879da266c1f3..704c434d8d60c 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3433,8 +3433,9 @@ static int illegal_highdma(struct net_device *dev, struct sk_buff *skb)
 	if (!(dev->features & NETIF_F_HIGHDMA)) {
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page *page = skb_frag_page(frag);
 
-			if (PageHighMem(skb_frag_page(frag)))
+			if (page && PageHighMem(page))
 				return 1;
 		}
 	}
diff --git a/net/core/gro.c b/net/core/gro.c
index e2f84947fb743..10fb2145bcb2b 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -410,7 +410,8 @@ static inline void skb_gro_reset_offset(struct sk_buff *skb, u32 nhoff)
 	pinfo = skb_shinfo(skb);
 	frag0 = &pinfo->frags[0];
 
-	if (pinfo->nr_frags && !PageHighMem(skb_frag_page(frag0)) &&
+	if (pinfo->nr_frags && skb_frag_page(frag0) &&
+	    !PageHighMem(skb_frag_page(frag0)) &&
 	    (!NET_IP_ALIGN || !((skb_frag_off(frag0) + nhoff) & 3))) {
 		NAPI_GRO_CB(skb)->frag0 = skb_frag_address(frag0);
 		NAPI_GRO_CB(skb)->frag0_len = min_t(unsigned int,
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 2e49a6ea21af3..99cf1ee73836d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1352,6 +1352,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
 		struct page *p;
 		u8 *vaddr;
 
+		if (skb_frag_is_net_iov(frag)) {
+			printk("%sskb frag %d: not readable\n", level, i);
+			len -= skb_frag_size(frag);
+			if (!len)
+				break;
+			continue;
+		}
+
 		skb_frag_foreach_page(frag, skb_frag_off(frag),
 				      skb_frag_size(frag), p, p_off, p_len,
 				      copied) {
@@ -3142,6 +3150,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];
 
+		if (WARN_ON_ONCE(!skb_frag_page(f)))
+			return false;
+
 		if (__splice_segment(skb_frag_page(f),
 				     skb_frag_off(f), skb_frag_size(f),
 				     offset, len, spd, false, sk, pipe))
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 3968d3f98e083..4ce0bc41e7806 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -115,7 +115,8 @@ static void esp_ssg_unref(struct xfrm_state *x, void *tmp, struct sk_buff *skb)
 	 */
 	if (req->src != req->dst)
 		for (sg = sg_next(req->src); sg; sg = sg_next(sg))
-			skb_page_unref(sg_page(sg), skb->pp_recycle);
+			skb_page_unref(page_to_netmem(sg_page(sg)),
+				       skb->pp_recycle);
 }
 
 #ifdef CONFIG_INET_ESPINTCP
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 06aab937d60a6..7e7f32f95c684 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2171,6 +2171,9 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			break;
 		}
 		page = skb_frag_page(frags);
+		if (WARN_ON_ONCE(!page))
+			break;
+
 		prefetchw(page);
 		pages[pages_to_map++] = page;
 		length += PAGE_SIZE;
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index 34a9a5b9ed00b..0318aea0d4ce6 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -132,7 +132,8 @@ static void esp_ssg_unref(struct xfrm_state *x, void *tmp, struct sk_buff *skb)
 	 */
 	if (req->src != req->dst)
 		for (sg = sg_next(req->src); sg; sg = sg_next(sg))
-			skb_page_unref(sg_page(sg), skb->pp_recycle);
+			skb_page_unref(page_to_netmem(sg_page(sg)),
+				       skb->pp_recycle);
 }
 
 #ifdef CONFIG_INET6_ESPINTCP
-- 
2.45.0.118.g7fe29c98d7-goog

