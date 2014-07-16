From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 3/4] alpha: Indent if Statements properly
Date: Wed, 16 Jul 2014 00:14:01 -0400
Message-ID: <1405484042-6879-3-git-send-email-xerofoify@gmail.com>
References: <1405484042-6879-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PxRq3Lj8xUt3E3SZV2NABVRJR9d5hrRyFlISVCzQPa0=;
        b=pIw3E7FMFu1zDOr3S7kU96WevJQQHxqvsU5SKOL7Bmc5HReU1oV+ItSf3bkRT+dkRK
         Ya133lAEoKHYCRtSCDE9/1O8JAuaw5iUNU3ygThvar+fzcNebMcK8Upyx3zeZMSTfgty
         HZG/yYGM3v0ZNVpLxlSgjHgU1SmtBMjmqKW9IpQJeYJNt+bmPhwM2jYFu0AGg6D4jj7K
         F3gILNXPJHA+F4h/wdUte7JE/KBCaVhOB4wGqoS7n8W/nkfHA4WqorPHkeGjuy5rA/mB
         t9x1Z5BLg8PQrbi0y/38VZh7aNA+A5I7ycpx/3zBAduTJ39L4PMl1aCR3u1l5DG2u7Va
         hlzg==
In-Reply-To: <1405484042-6879-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch removes the errors this file gets with checkpatch due
to errors relating to if statements and their enclosing statements
not being indented properly.
---
 arch/alpha/boot/tools/mkbb.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/alpha/boot/tools/mkbb.c b/arch/alpha/boot/tools/mkbb.c
index 214b6c7..69f347e 100644
--- a/arch/alpha/boot/tools/mkbb.c
+++ b/arch/alpha/boot/tools/mkbb.c
@@ -92,39 +92,39 @@ int main(int argc, char ** argv)
 
     /* Make sure of the arg count */
 	if (argc != 3) {
-	fprintf(stderr, "Usage: %s device lxboot\n", argv[0]);
-	exit(0);
+		fprintf(stderr, "Usage: %s device lxboot\n", argv[0]);
+		exit(0);
 	}
 
     /* First, open the device and make sure it's accessible */
 	dev = open(argv[1], O_RDWR);
-	if (dev < 0) {
-	perror(argv[1]);
-	exit(0);
+		if (dev < 0) {
+			perror(argv[1]);
+			exit(0);
 	}
 
     /* Now open the lxboot and make sure it's reasonable */
 	fd = open(argv[2], O_RDONLY);
 	if (fd < 0) {
-	perror(argv[2]);
-	close(dev);
-	exit(0);
+		perror(argv[2]);
+		close(dev);
+		exit(0);
 	}
 
     /* Read in the lxboot */
 	nread = read(fd, &bootloader_image, sizeof(bootblock));
 	if (nread != sizeof(bootblock)) {
-	perror("lxboot read");
-	fprintf(stderr, "expected %zd, got %d\n", sizeof(bootblock), nread);
-	exit(0);
+		perror("lxboot read");
+		fprintf(stderr, "expected %zd, got %d\n", sizeof(bootblock), nread);
+		exit(0);
 	}
 
     /* Read in the bootblock from disk. */
 	nread = read(dev, &bootblock_from_disk, sizeof(bootblock));
 	if (nread != sizeof(bootblock)) {
-	perror("bootblock read");
-	fprintf(stderr, "expected %zd, got %d\n", sizeof(bootblock), nread);
-	exit(0);
+		perror("bootblock read");
+		fprintf(stderr, "expected %zd, got %d\n", sizeof(bootblock), nread);
+		exit(0);
 	}
 
     /* Swap the bootblock's disklabel into the bootloader */
@@ -133,15 +133,15 @@ int main(int argc, char ** argv)
     /* Calculate the bootblock checksum */
 	bootloader_image.bootblock_checksum = 0;
 	for (i = 0; i < 63; i++) {
-	bootloader_image.bootblock_checksum +=
+		bootloader_image.bootblock_checksum +=
 			bootloader_image.bootblock_quadwords[i];
 	}
 
     /* Write the whole thing out! */
 	lseek(dev, 0L, SEEK_SET);
 	if (write(dev, &bootloader_image, sizeof(bootblock)) != sizeof(bootblock)) {
-	perror("bootblock write");
-	exit(0);
+		perror("bootblock write");
+		exit(0);
 	}
 
 	close(fd);
-- 
1.9.1
