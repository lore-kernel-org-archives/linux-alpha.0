From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 4/8] genirq: Drop redundant irq_init_effective_affinity
Date: Fri,  1 Jul 2022 15:00:52 -0500
Message-ID: <20220701200056.46555-5-samuel@sholland.org>
References: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAFF9415CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322E740B76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3A460648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0B09607D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1656705701; x=1656712901; bh=0L
 WuRMkphck+oUsETtbUMciB/g6XpbS+D68bi898KtM=; b=AqGoMTSNUno8lOmyDh
 KCwBkoAA7CbRzCpTwUdrVZNLF/wgidvQ7dsm+84o2fZ7gQevOX9qgVYV5nm/9kgO
 AMuQd8xE3VTWjlAJ7GrdD9VG7BV18Jcp9kKqlP10nOfIKsoMI+rW7kzM0NAfbTyC
 NWr74D8Q3JSoeOaEx9LsHr33xds/373ohmcrmDKPwF8OjXUOpnM+aWDRtp6nuvq9
 kg59XMZJPKD6+LWdXV+szMDXjt+Bh7ouD13imUf0Q05dynZ6LTdGmF8mVgEGl3Bl
 ONZn3X292lorO+Z+uaZEodDFOzhGvINgJHQDr8YSLNCPUjVe/p4PN6U1+nlRcr03
 GbWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656705701; x=1656712901; bh=0LWuRMkphck+o
 UsETtbUMciB/g6XpbS+D68bi898KtM=; b=oa1e9Su6i+EtxBIhYMfUYN1BBIh7+
 NtLc3K9bSFNOEpdIhhM9orp+f/WF+uOfv1NI8kwLKLdemiOeS5HWJECGkfsHhJiH
 /wrY8WMMNhZUZUQf87Y6I2nlwQL4IKXSCH2sx7h4StxNsLo412pY5+cK8XhqNURa
 IF4psEvV+ZGo699etAF0/P+4jL5LalpbzQlttWsppbNEXfxA/dOghfaTOCAwlKrK
 KEvs69E1t/EoreKt1IwBdd8N4B9H428Bsjz94BHuby3lv0Gnlfekvlya7hY+n98C
 YWKS5+DGo6Bue2FdLbpuwQxoB2okv4DaH6kIF8BDFGbnyGUVJ78Jz+rvQ==
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

It does exactly the same thing as irq_data_update_effective_affinity.

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3:
 - New patch to drop irq_init_effective_affinity

 kernel/irq/manage.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 8c396319d5ac..40fe7806cc8c 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -205,16 +205,8 @@ static void irq_validate_effective_affinity(struct irq_data *data)
 	pr_warn_once("irq_chip %s did not update eff. affinity mask of irq %u\n",
 		     chip->name, data->irq);
 }
-
-static inline void irq_init_effective_affinity(struct irq_data *data,
-					       const struct cpumask *mask)
-{
-	cpumask_copy(irq_data_get_effective_affinity_mask(data), mask);
-}
 #else
 static inline void irq_validate_effective_affinity(struct irq_data *data) { }
-static inline void irq_init_effective_affinity(struct irq_data *data,
-					       const struct cpumask *mask) { }
 #endif
 
 int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
@@ -347,7 +339,7 @@ static bool irq_set_affinity_deactivated(struct irq_data *data,
 		return false;
 
 	cpumask_copy(desc->irq_common_data.affinity, mask);
-	irq_init_effective_affinity(data, mask);
+	irq_data_update_effective_affinity(data, mask);
 	irqd_set(data, IRQD_AFFINITY_SET);
 	return true;
 }
-- 
2.35.1
