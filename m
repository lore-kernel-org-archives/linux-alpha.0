From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 5/8] genirq: Refactor accessors to use
 irq_data_get_affinity_mask
Date: Fri,  1 Jul 2022 15:00:53 -0500
Message-ID: <20220701200056.46555-6-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F3B423BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D88423CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8298E84142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D085084145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1656705706; x=1656712906; bh=SS
 qXvxPvOnT181Alnoj0HfgL9fqTJVzreJxmfCVyBec=; b=hcAoBpvIf8eiMsWnHm
 b6RJp+0UU2OILuy21U79vOjusxjAcQG94kzCl/SLOhhz8J4ASW+y84iY/hEL50ms
 +t+80HjBAylZNEJe73yGhHSZF1RSQ8RBU9Nk62QyCXZpUC4CexurEGTlBgY/Xqfo
 fnfCIqYMFwRBTgEwEckqi0Kl9E6cHZVfUrF5kxIWdFViA5bUJ11OHLJ7T0XapXw2
 hQWKkSyPabF2oJi63qd5eTn9Zl4sQmG20eYW/wqRNYdW/SrAsFhGxn4LKFrrzqDC
 C0MqxbtLaYxpKOf9o9kKWlf6yKvCjeXy1x18+k24AKggcDhNdzIH/iJu5OZQ3wo4
 ssMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656705706; x=1656712906; bh=SSqXvxPvOnT18
 1Alnoj0HfgL9fqTJVzreJxmfCVyBec=; b=HeWsMOcvIEpk7+MFtWHCXsiI6BlFC
 2TQ2SkcGU6TjX/RAuIxgMoxDlrLAJRLOQUP5M4Vjn/Sk2LIfFF6zmyCdELkbAfiW
 sNvfuqkLM1Vey2QklfYRRWjhcegVctGnxhxUwegYbB0z6YgklYBKnTe07fR9Aokx
 OJk4Rl2PfNKRw931jKDBYNYjhcdhJJxhHzUaHJY1VFb0uXTx2Qq9+O7Z8+sDYq3K
 dW+YTOeJLeT+EWHVFce25KHIXMDeukkeCTF05NMBW9QbVqWeENDneUsjCVRvIwS4
 +pREO1Ryo1aq2EmzH+e4VaMl82vWzrZw+kMmsklRZow8dIJvLbZg3JAtQ==
In-Reply-To: <20220701200056.46555-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Marc Zyngier <maz-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, linux-hyperv-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Hansen <dave.hansen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "James E.J. Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Beulich <jbeulich-IBi9RG/b67k@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "K. Y. Srinivasan" <kys-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Sven Schnelle <svens-yWSVVCS59A8YeIxN5WHPnw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wei Liu <wei.liu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Hemminger <sthemmin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <brgl@bgde>

A couple of functions directly reference the affinity mask. Route them
through irq_data_get_affinity_mask so they will pick up any refactoring
done there.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---

(no changes since v1)

 include/linux/irq.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 505308253d23..69ee4e2f36ce 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -879,16 +879,16 @@ static inline int irq_data_get_node(struct irq_data *d)
 	return irq_common_data_get_node(d->common);
 }
 
-static inline struct cpumask *irq_get_affinity_mask(int irq)
+static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 {
-	struct irq_data *d = irq_get_irq_data(irq);
-
-	return d ? d->common->affinity : NULL;
+	return d->common->affinity;
 }
 
-static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
+static inline struct cpumask *irq_get_affinity_mask(int irq)
 {
-	return d->common->affinity;
+	struct irq_data *d = irq_get_irq_data(irq);
+
+	return d ? irq_data_get_affinity_mask(d) : NULL;
 }
 
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
@@ -910,7 +910,7 @@ static inline void irq_data_update_effective_affinity(struct irq_data *d,
 static inline
 struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 {
-	return d->common->affinity;
+	return irq_data_get_affinity_mask(d);
 }
 #endif
 
-- 
2.35.1
