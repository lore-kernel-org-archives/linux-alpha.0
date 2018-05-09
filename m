From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: two alpha dma cleanups/fixes
Date: Wed,  9 May 2018 16:04:50 +0200
Message-ID: <20180509140452.20716-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i82abxweN7qu0Vw/QudMNtZaO9NO4mFWGQn5SliektY=;
	b=GN8HlGel0A7MVR49QLhkQ26ir
	JoPXxtFS0i43H10XuKnRGOOQVEVg5jvKjpWvxKSImJe60KD6L0A8T0yF6CXwJGzegpZXXXjr3nYjG
	Qnr1Z/eVxAqR8IG2H3Okb408Bns5fZka/K2/WYB56162EjUebXuBtgX3RkAvJkRp6yATRTBVR/4i8
	MXId1TvosyCVpFbVFCCbm5o19sDuGVJYno3/AzstT8HiPZVNWB2rwkCnQSA/N3aeGh/L6s7FoVr2B
	COgflEdUKa+qj1KusxeQ1YAcC7C3xMOLGdEeCIOmYif1WLc+qtDKVEoelxbWbWwCtG9fNg4wSMg4F
	4nqBvSfSg==;
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Content-Type: text/plain; charset="windows-1252"
To: ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

amVuc2VzIGFwcGVhcnMgdG8gYmUgYnJva2VuLCBidXQgcGF0Y2ggMSBtaWdodCB1bmJyZWFrIGl0
IHdoaWxlIGdldHRpbmcKcmlkIG9mIGEgZG1hX21hcF9vcHMgaW5zdGFuY2UgKHdoaWNoINGWcyBt
eSByZWFsIGdvYWwgaGVyZSksIHBhdGNoIHR3bwpqdXN0IGNsZWFucyB1cCB0aGUgZG1hIGJvaWxl
cnBsYXRlIGNvZGUgYSBiaXQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lvbW11
