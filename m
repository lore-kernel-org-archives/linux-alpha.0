From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 2/4] alpha: checkpatch errors in mkbb for if statements
Date: Wed, 16 Jul 2014 00:14:00 -0400
Message-ID: <1405484042-6879-2-git-send-email-xerofoify@gmail.com>
References: <1405484042-6879-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h34UvX0t+SR89wSAQzzuZ+aEvGL0KZFrKPpc/Rqj22A=;
        b=q78cKUAf40UZKoakqO3VxqgJ/NBnMLyYdNqjkE7jx+rCiY5oyY1GiEZHSE7WhCvGTI
         iw3ySkV1WemX3K7qd9S4AMp7plDl21f0CWHC6ddCpAekhWHPUVikP758WD4jCbuaKsZz
         BqS0CDWFeM16tkBeG6tN2SET2zQgCDE28EXIsxuql8u/Isf2aLPvrzBVpWACa/NZcVlM
         KP6M9wkdjZPUp2F9rwRhayKUHcPbZFAEUq05J+yExEpQGDhQseRZdikLXZR0jSzCg5/9
         Ga/qqjF7s4v4CH5zmkInYSXJz0PuOgT1Tsv2/6tMvO5N+OfRZ8Knhh4Hh5vNd2nAEPF5
         Wt1Q==
In-Reply-To: <1405484042-6879-1-git-send-email-xerofoify@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes all errors related to no space between if and parthesises
to remove this errors when running checkpatch against this file.
---
 arch/alpha/boot/tools/mkbb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/boot/tools/mkbb.c b/arch/alpha/boot/tools/mkbb.c
index 6f1b957..214b6c7 100644
--- a/arch/alpha/boot/tools/mkbb.c
+++ b/arch/alpha/boot/tools/mkbb.c
@@ -91,21 +91,21 @@ int main(int argc, char ** argv)
 	int			nread;
 
     /* Make sure of the arg count */
-	if(argc != 3) {
+	if (argc != 3) {
 	fprintf(stderr, "Usage: %s device lxboot\n", argv[0]);
 	exit(0);
 	}
 
     /* First, open the device and make sure it's accessible */
 	dev = open(argv[1], O_RDWR);
-	if(dev < 0) {
+	if (dev < 0) {
 	perror(argv[1]);
 	exit(0);
 	}
 
     /* Now open the lxboot and make sure it's reasonable */
 	fd = open(argv[2], O_RDONLY);
-	if(fd < 0) {
+	if (fd < 0) {
 	perror(argv[2]);
 	close(dev);
 	exit(0);
@@ -113,7 +113,7 @@ int main(int argc, char ** argv)
 
     /* Read in the lxboot */
 	nread = read(fd, &bootloader_image, sizeof(bootblock));
-	if(nread != sizeof(bootblock)) {
+	if (nread != sizeof(bootblock)) {
 	perror("lxboot read");
 	fprintf(stderr, "expected %zd, got %d\n", sizeof(bootblock), nread);
 	exit(0);
@@ -121,7 +121,7 @@ int main(int argc, char ** argv)
 
     /* Read in the bootblock from disk. */
 	nread = read(dev, &bootblock_from_disk, sizeof(bootblock));
-	if(nread != sizeof(bootblock)) {
+	if (nread != sizeof(bootblock)) {
 	perror("bootblock read");
 	fprintf(stderr, "expected %zd, got %d\n", sizeof(bootblock), nread);
 	exit(0);
@@ -132,14 +132,14 @@ int main(int argc, char ** argv)
 
     /* Calculate the bootblock checksum */
 	bootloader_image.bootblock_checksum = 0;
-	for(i = 0; i < 63; i++) {
+	for (i = 0; i < 63; i++) {
 	bootloader_image.bootblock_checksum +=
 			bootloader_image.bootblock_quadwords[i];
 	}
 
     /* Write the whole thing out! */
 	lseek(dev, 0L, SEEK_SET);
-	if(write(dev, &bootloader_image, sizeof(bootblock)) != sizeof(bootblock)) {
+	if (write(dev, &bootloader_image, sizeof(bootblock)) != sizeof(bootblock)) {
 	perror("bootblock write");
 	exit(0);
 	}
-- 
1.9.1

