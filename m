From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 8/8] genirq: Provide an IRQ affinity mask in non-SMP configs
Date: Fri,  1 Jul 2022 15:00:56 -0500
Message-ID: <20220701200056.46555-9-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11B0D404DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B45D340386
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39DD584147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E68E784142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1656705717; x=1656712917; bh=mr
 ZZqztLVKSIkpl2ZtG9SZsAXGvA9Vl+x5zOkvs3Bjg=; b=ifFqAwFeM2wxyJCvKE
 TcogHoKvz8Ikgyvbheen4lB6TK8my3nTFtPtZqZwV2EJoW1d675CVWiRCQYrtpCV
 gjmX3xfutUzOU3hClg0Njj4ieVpzITbRxgXZVuosglRi9Ve/QUV4hEboq9Cl6D5q
 5ZUDm0FkkQme2ysoms3ELh8Ej8sCf/bY7d3513Rv+xbTCp2MmH04t4WPs+p30/R/
 NUoTk/RQLxrRh5NqM1X0miI8sZ9j0rcT8Y1gbcNzWv3fehEjbKWta0Zm2a34hcFz
 IRiPSucdZsSIbDrwFJcccZcbWOSp8i+md8XOrmXWaR/5piNMD50Sh8euiQzn0koH
 sIGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656705717; x=1656712917; bh=mrZZqztLVKSIk
 pl2ZtG9SZsAXGvA9Vl+x5zOkvs3Bjg=; b=P1MvxlIOuM7l0z+qS8yeYED1ddgJs
 ZCs2QYRhK40y97qVVKx50uDXKGc7mEB0wEwGcSiJsX1JtDdjkQWUx99X65YS4sz+
 VfSaSS6Ie4KKuWHsotLfT5em9QY23iuX70+vsHcDY2KRtIP+aVtenEK44OuBMsai
 UBAjIHn3DU+BwynQs3RgoaYjQarWyRcQP7W5Gh2Uup25KvchrpUJqNUtKa3U+bgZ
 BTQhJ+xzfCrqL5QAda74Vyo+egxNHDbWs7GXn2vOV7ssh9klKGGfy1CHr9gnsXME
 J2Ch54d15PxAoSgBunXMCXpz/ijn5crnwUN/1XIG9K1lsPwNHpUnb99dA==
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

IRQ affinity masks are not allocated in uniprocessor configurations.
This requires special case non-SMP code in drivers for irqchips which
have per-CPU enable or mask registers.

Since IRQ affinity is always the same in a uniprocessor configuration,
we can provide a correct affinity mask without allocating one per IRQ.

By returning a real cpumask from irq_data_get_affinity_mask even when
SMP is disabled, irqchip drivers which iterate over that mask will
automatically do the right thing.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
 - Use cpumask_of(0) instead of cpu_possible_mask

 include/linux/irq.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 02073f7a156e..996e22744edd 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -151,7 +151,9 @@ struct irq_common_data {
 #endif
 	void			*handler_data;
 	struct msi_desc		*msi_desc;
+#ifdef CONFIG_SMP
 	cpumask_var_t		affinity;
+#endif
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	cpumask_var_t		effective_affinity;
 #endif
@@ -882,13 +884,19 @@ static inline int irq_data_get_node(struct irq_data *d)
 static inline
 const struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 {
+#ifdef CONFIG_SMP
 	return d->common->affinity;
+#else
+	return cpumask_of(0);
+#endif
 }
 
 static inline void irq_data_update_affinity(struct irq_data *d,
 					    const struct cpumask *m)
 {
+#ifdef CONFIG_SMP
 	cpumask_copy(d->common->affinity, m);
+#endif
 }
 
 static inline const struct cpumask *irq_get_affinity_mask(int irq)
-- 
2.35.1
