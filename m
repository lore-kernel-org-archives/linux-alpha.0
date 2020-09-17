From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: [PATCH 1/5] nfs: simplify nfs4_parse_monolithic
Date: Thu, 17 Sep 2020 10:22:32 +0200
Message-ID: <20200917082236.2518236-2-hch@lst.de>
References: <20200917082236.2518236-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=HKYpexQhsrJ4y+Vhn3pkHKTtzHzhQSByyD4ZaYSZNsI=; b=g8ro5qhhTYxW4cT8WB+KZezeUt
        mZW8CgpW9Q58rjTyaHzpp+V7qrQJllJJ5gKCvd7mWbzq23cbM+3VGCx05kWDwcIYcjSQxItjcbhPK
        9fFDCmMal+UM1RSMjzlgY8DKaL4uP/jtWQ1FPl9N2s4P1KMv84GzQTjy9U36vLb4esJ88vMSL4x+F
        19Ent+mF5iS+qTfSvYuNvF6aMjhq3lcVzQsU6qmeZkX5i6etFpash8aMpi7AEIN5wR9duihf2grrn
        jqqrfBlGzUGrHmkQI6tcDZa5XJPfeXT2KJ49WhCAc7fB+vQziVX96p8tYFJo8PdO537jENjgl7qwW
        iBFHs9Ig==;
In-Reply-To: <20200917082236.2518236-1-hch-jcswGhMUV9g@public.gmane.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Trond Myklebust <trond.myklebust-F/q8l9xzQnoyLce1RVWEUA@public.gmane.org>, Anna Schumaker <anna.schumaker-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Remove a level of indentation for the version 1 mount data parsing, and
simplify the NULL data case a little bit as well.

Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
---
 fs/nfs/fs_context.c | 135 +++++++++++++++++++++-----------------------
 1 file changed, 63 insertions(+), 72 deletions(-)

diff --git a/fs/nfs/fs_context.c b/fs/nfs/fs_context.c
index 524812984e2d43..cbf6a4ba5e5806 100644
--- a/fs/nfs/fs_context.c
+++ b/fs/nfs/fs_context.c
@@ -1049,89 +1049,80 @@ static int nfs4_parse_monolithic(struct fs_context *fc,
 	struct sockaddr *sap = (struct sockaddr *)&ctx->nfs_server.address;
 	char *c;
 
-	if (data == NULL)
-		goto out_no_data;
+	if (!data) {
+		if (is_remount_fc(fc))
+			goto done;
+		return nfs_invalf(fc,
+			"NFS4: mount program didn't pass any mount data");
+	}
 
 	ctx->version = 4;
 
-	switch (data->version) {
-	case 1:
-		if (data->host_addrlen > sizeof(ctx->nfs_server.address))
-			goto out_no_address;
-		if (data->host_addrlen == 0)
-			goto out_no_address;
-		ctx->nfs_server.addrlen = data->host_addrlen;
-		if (copy_from_user(sap, data->host_addr, data->host_addrlen))
-			return -EFAULT;
-		if (!nfs_verify_server_address(sap))
-			goto out_no_address;
-		ctx->nfs_server.port = ntohs(((struct sockaddr_in *)sap)->sin_port);
-
-		if (data->auth_flavourlen) {
-			rpc_authflavor_t pseudoflavor;
-			if (data->auth_flavourlen > 1)
-				goto out_inval_auth;
-			if (copy_from_user(&pseudoflavor,
-					   data->auth_flavours,
-					   sizeof(pseudoflavor)))
-				return -EFAULT;
-			ctx->selected_flavor = pseudoflavor;
-		} else
-			ctx->selected_flavor = RPC_AUTH_UNIX;
-
-		c = strndup_user(data->hostname.data, NFS4_MAXNAMLEN);
-		if (IS_ERR(c))
-			return PTR_ERR(c);
-		ctx->nfs_server.hostname = c;
-
-		c = strndup_user(data->mnt_path.data, NFS4_MAXPATHLEN);
-		if (IS_ERR(c))
-			return PTR_ERR(c);
-		ctx->nfs_server.export_path = c;
-		dfprintk(MOUNT, "NFS: MNTPATH: '%s'\n", c);
+	if (data->version != 1)
+		return generic_parse_monolithic(fc, data);
 
-		c = strndup_user(data->client_addr.data, 16);
-		if (IS_ERR(c))
-			return PTR_ERR(c);
-		ctx->client_address = c;
-
-		/*
-		 * Translate to nfs_fs_context, which nfs_fill_super
-		 * can deal with.
-		 */
+	if (data->host_addrlen > sizeof(ctx->nfs_server.address))
+		goto out_no_address;
+	if (data->host_addrlen == 0)
+		goto out_no_address;
+	ctx->nfs_server.addrlen = data->host_addrlen;
+	if (copy_from_user(sap, data->host_addr, data->host_addrlen))
+		return -EFAULT;
+	if (!nfs_verify_server_address(sap))
+		goto out_no_address;
+	ctx->nfs_server.port = ntohs(((struct sockaddr_in *)sap)->sin_port);
 
-		ctx->flags	= data->flags & NFS4_MOUNT_FLAGMASK;
-		ctx->rsize	= data->rsize;
-		ctx->wsize	= data->wsize;
-		ctx->timeo	= data->timeo;
-		ctx->retrans	= data->retrans;
-		ctx->acregmin	= data->acregmin;
-		ctx->acregmax	= data->acregmax;
-		ctx->acdirmin	= data->acdirmin;
-		ctx->acdirmax	= data->acdirmax;
-		ctx->nfs_server.protocol = data->proto;
-		nfs_validate_transport_protocol(ctx);
-		if (ctx->nfs_server.protocol == XPRT_TRANSPORT_UDP)
-			goto out_invalid_transport_udp;
+	if (data->auth_flavourlen) {
+		rpc_authflavor_t pseudoflavor;
 
-		break;
-	default:
-		goto generic;
+		if (data->auth_flavourlen > 1)
+			goto out_inval_auth;
+		if (copy_from_user(&pseudoflavor, data->auth_flavours,
+				   sizeof(pseudoflavor)))
+			return -EFAULT;
+		ctx->selected_flavor = pseudoflavor;
+	} else {
+		ctx->selected_flavor = RPC_AUTH_UNIX;
 	}
 
+	c = strndup_user(data->hostname.data, NFS4_MAXNAMLEN);
+	if (IS_ERR(c))
+		return PTR_ERR(c);
+	ctx->nfs_server.hostname = c;
+
+	c = strndup_user(data->mnt_path.data, NFS4_MAXPATHLEN);
+	if (IS_ERR(c))
+		return PTR_ERR(c);
+	ctx->nfs_server.export_path = c;
+	dfprintk(MOUNT, "NFS: MNTPATH: '%s'\n", c);
+
+	c = strndup_user(data->client_addr.data, 16);
+	if (IS_ERR(c))
+		return PTR_ERR(c);
+	ctx->client_address = c;
+
+	/*
+	 * Translate to nfs_fs_context, which nfs_fill_super
+	 * can deal with.
+	 */
+
+	ctx->flags	= data->flags & NFS4_MOUNT_FLAGMASK;
+	ctx->rsize	= data->rsize;
+	ctx->wsize	= data->wsize;
+	ctx->timeo	= data->timeo;
+	ctx->retrans	= data->retrans;
+	ctx->acregmin	= data->acregmin;
+	ctx->acregmax	= data->acregmax;
+	ctx->acdirmin	= data->acdirmin;
+	ctx->acdirmax	= data->acdirmax;
+	ctx->nfs_server.protocol = data->proto;
+	nfs_validate_transport_protocol(ctx);
+	if (ctx->nfs_server.protocol == XPRT_TRANSPORT_UDP)
+		goto out_invalid_transport_udp;
+done:
 	ctx->skip_reconfig_option_check = true;
 	return 0;
 
-generic:
-	return generic_parse_monolithic(fc, data);
-
-out_no_data:
-	if (is_remount_fc(fc)) {
-		ctx->skip_reconfig_option_check = true;
-		return 0;
-	}
-	return nfs_invalf(fc, "NFS4: mount program didn't pass any mount data");
-
 out_inval_auth:
 	return nfs_invalf(fc, "NFS4: Invalid number of RPC auth flavours %d",
 		      data->auth_flavourlen);
-- 
2.28.0

