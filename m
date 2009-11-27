From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH] alpha: convert srm code to seq_file
Date: Fri, 27 Nov 2009 09:45:45 +0300
Message-ID: <20091127064545.GF25983@x200.malnet.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:mime-version:content-type:content-disposition:user-agent;
        bh=zAKhH1kVk39Om37h1QAhVUn26Ox2nWTbnS2C6l7FY6E=;
        b=KxGxXV8A+vw5igBYdveHfAX1EYeyEBT9Mfnq8MMCvpnXqu6n2VyfCqiVAMXUpz6E1C
         Oc798f7Eg1WcPjfLAzK23OydOYuhO12yWVtnaH8/ndKM3C1CH6KqO3MYe1akQcV5PN+Q
         Ska0BbY4jW713ot/jpb7/8FOwQVmCBFO8TB2E=
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru
Cc: akpm@linux-foundation.org, linux-alpha@vger.kernel.org

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/alpha/kernel/srm_env.c |   65 ++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

--- a/arch/alpha/kernel/srm_env.c
+++ b/arch/alpha/kernel/srm_env.c
@@ -33,6 +33,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/proc_fs.h>
+#include <linux/seq_file.h>
 #include <asm/console.h>
 #include <asm/uaccess.h>
 #include <asm/machvec.h>
@@ -79,42 +80,41 @@ static srm_env_t	srm_named_entries[] = {
 static srm_env_t	srm_numbered_entries[256];
 
 
-static int
-srm_env_read(char *page, char **start, off_t off, int count, int *eof,
-		void *data)
+static int srm_env_proc_show(struct seq_file *m, void *v)
 {
-	int		nbytes;
 	unsigned long	ret;
 	srm_env_t	*entry;
+	char		*page;
 
-	if (off != 0) {
-		*eof = 1;
-		return 0;
-	}
+	entry = (srm_env_t *)m->private;
+	page = (char *)__get_free_page(GFP_USER);
+	if (!page)
+		return -ENOMEM;
 
-	entry	= (srm_env_t *) data;
-	ret	= callback_getenv(entry->id, page, count);
+	ret = callback_getenv(entry->id, page, PAGE_SIZE);
 
 	if ((ret >> 61) == 0) {
-		nbytes = (int) ret;
-		*eof = 1;
+		seq_write(m, page, ret);
+		ret = 0;
 	} else
-		nbytes = -EFAULT;
+		ret = -EFAULT;
+	free_page((unsigned long)page);
+	return ret;
+}
 
-	return nbytes;
+static int srm_env_proc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, srm_env_proc_show, PDE(inode)->data);
 }
 
-static int
-srm_env_write(struct file *file, const char __user *buffer, unsigned long count,
-		void *data)
+static ssize_t srm_env_proc_write(struct file *file, const char __user *buffer,
+				  size_t count, loff_t *pos)
 {
 	int res;
-	srm_env_t	*entry;
+	srm_env_t	*entry = PDE(file->f_path.dentry->d_inode)->data;
 	char		*buf = (char *) __get_free_page(GFP_USER);
 	unsigned long	ret1, ret2;
 
-	entry = (srm_env_t *) data;
-
 	if (!buf)
 		return -ENOMEM;
 
@@ -140,6 +140,15 @@ srm_env_write(struct file *file, const char __user *buffer, unsigned long count,
 	return res;
 }
 
+static const struct file_operations srm_env_proc_fops = {
+	.owner		= THIS_MODULE,
+	.open		= srm_env_proc_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+	.write		= srm_env_proc_write,
+};
+
 static void
 srm_env_cleanup(void)
 {
@@ -245,15 +254,10 @@ srm_env_init(void)
 	 */
 	entry = srm_named_entries;
 	while (entry->name && entry->id) {
-		entry->proc_entry = create_proc_entry(entry->name,
-				0644, named_dir);
+		entry->proc_entry = proc_create_data(entry->name, 0644, named_dir,
+						     &srm_env_proc_fops, entry);
 		if (!entry->proc_entry)
 			goto cleanup;
-
-		entry->proc_entry->data		= (void *) entry;
-		entry->proc_entry->read_proc	= srm_env_read;
-		entry->proc_entry->write_proc	= srm_env_write;
-
 		entry++;
 	}
 
@@ -264,15 +268,12 @@ srm_env_init(void)
 		entry = &srm_numbered_entries[var_num];
 		entry->name = number[var_num];
 
-		entry->proc_entry = create_proc_entry(entry->name,
-				0644, numbered_dir);
+		entry->proc_entry = proc_create_data(entry->name, 0644, numbered_dir,
+						     &srm_env_proc_fops, entry);
 		if (!entry->proc_entry)
 			goto cleanup;
 
 		entry->id			= var_num;
-		entry->proc_entry->data		= (void *) entry;
-		entry->proc_entry->read_proc	= srm_env_read;
-		entry->proc_entry->write_proc	= srm_env_write;
 	}
 
 	printk(KERN_INFO "%s: version %s loaded successfully\n", NAME,
