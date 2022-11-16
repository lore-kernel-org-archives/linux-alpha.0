From: David Hildenbrand <david@redhat.com>
Subject: [PATCH mm-unstable v1 02/20] selftests/vm: cow: basic COW tests for non-anonymous pages
Date: Wed, 16 Nov 2022 11:26:41 +0100
Message-ID: <20221116102659.70287-3-david@redhat.com>
References: <20221116102659.70287-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsTqZl0nOjwsFV0t/qpSlinYmclwrJt/DidxFTRh6SM=; b=NMuky+EY562sfX
	7UQg5E1JrMmypQI2XL0LnX1UvO9etZaqno4wI5DyRvoPNJqXMz9vFeh9TL8q97QYE+kcFe9MVHveW
	U/O4FX2IHjU0/ptUROqRmGnvcW3Z044BRkn4PNSzMGk5DjHuPElCumVK/k57H/8oreIQwVgBM0FpI
	tOpJm3Yx4b8MPZz9veHQJGj4LLYan8yZHhQTN6R3OxDO4TycXo87wMcKaQ/vhT5fBIT6JcWO31Wgp
	q8nhG9jmj9a0TxLVuFggwsatmr8NFbfNzBKmgo5vgiHM8YAV+kZKBoQYXuPM5iDbhcjV98t361znC
	SFUbLadv/D7c7du1jmRA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GX1A4FEx/LE5NKT2fU0VhMZiNOmIzFjwXIrq7S69i44=;
	b=DLmS6RW7I0ARkX4rkN+k1YsBhcjxSi+wWvBcNCE4bG+7jVnHbNdpQTBuScg/Zm5BJRCh+W
	mImUCNmYegIN9uJch1A2SCQ6SiOPFZHY86zCs/YQvGyx/JHUlqVyzG/szhUP7OCJoAwqw/
	/cNUJap+K4g6ztFrgbvxQfE12Fvz0vk=
In-Reply-To: <20221116102659.70287-1-david@redhat.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>, Nadav Amit <>

Let's add basic tests for COW with non-anonymous pages in private
mappings: write access should properly trigger COW and result in the
private changes not being visible through other page mappings.

Especially, add tests for:
* Zeropage
* Huge zeropage
* Ordinary pagecache pages via memfd and tmpfile()
* Hugetlb pages via memfd

Fortunately, all tests pass.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 tools/testing/selftests/vm/cow.c | 338 ++++++++++++++++++++++++++++++-
 1 file changed, 337 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/cow.c b/tools/testing/selftests/vm/cow.c
index d202bfd63585..fb07bd44529c 100644
--- a/tools/testing/selftests/vm/cow.c
+++ b/tools/testing/selftests/vm/cow.c
@@ -19,6 +19,7 @@
 #include <sys/mman.h>
 #include <sys/ioctl.h>
 #include <sys/wait.h>
+#include <linux/memfd.h>
 
 #include "local_config.h"
 #ifdef LOCAL_CONFIG_HAVE_LIBURING
@@ -35,6 +36,7 @@ static size_t thpsize;
 static int nr_hugetlbsizes;
 static size_t hugetlbsizes[10];
 static int gup_fd;
+static bool has_huge_zeropage;
 
 static void detect_thpsize(void)
 {
@@ -64,6 +66,31 @@ static void detect_thpsize(void)
 	close(fd);
 }
 
+static void detect_huge_zeropage(void)
+{
+	int fd = open("/sys/kernel/mm/transparent_hugepage/use_zero_page",
+		      O_RDONLY);
+	size_t enabled = 0;
+	char buf[15];
+	int ret;
+
+	if (fd < 0)
+		return;
+
+	ret = pread(fd, buf, sizeof(buf), 0);
+	if (ret > 0 && ret < sizeof(buf)) {
+		buf[ret] = 0;
+
+		enabled = strtoul(buf, NULL, 10);
+		if (enabled == 1) {
+			has_huge_zeropage = true;
+			ksft_print_msg("[INFO] huge zeropage is enabled\n");
+		}
+	}
+
+	close(fd);
+}
+
 static void detect_hugetlbsizes(void)
 {
 	DIR *dir = opendir("/sys/kernel/mm/hugepages/");
@@ -1148,6 +1175,312 @@ static int tests_per_anon_test_case(void)
 	return tests;
 }
 
+typedef void (*non_anon_test_fn)(char *mem, const char *smem, size_t size);
+
+static void test_cow(char *mem, const char *smem, size_t size)
+{
+	char *old = malloc(size);
+
+	/* Backup the original content. */
+	memcpy(old, smem, size);
+
+	/* Modify the page. */
+	memset(mem, 0xff, size);
+
+	/* See if we still read the old values via the other mapping. */
+	ksft_test_result(!memcmp(smem, old, size),
+			 "Other mapping not modified\n");
+	free(old);
+}
+
+static void run_with_zeropage(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, tmp;
+
+	ksft_print_msg("[RUN] %s ... with shared zeropage\n", desc);
+
+	mem = mmap(NULL, pagesize, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		return;
+	}
+
+	smem = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE | MAP_ANON, -1, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Read from the page to populate the shared zeropage. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, pagesize);
+munmap:
+	munmap(mem, pagesize);
+	if (smem != MAP_FAILED)
+		munmap(smem, pagesize);
+}
+
+static void run_with_huge_zeropage(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, *mmap_mem, *mmap_smem, tmp;
+	size_t mmap_size;
+	int ret;
+
+	ksft_print_msg("[RUN] %s ... with huge zeropage\n", desc);
+
+	if (!has_huge_zeropage) {
+		ksft_test_result_skip("Huge zeropage not enabled\n");
+		return;
+	}
+
+	/* For alignment purposes, we need twice the thp size. */
+	mmap_size = 2 * thpsize;
+	mmap_mem = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mmap_mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		return;
+	}
+	mmap_smem = mmap(NULL, mmap_size, PROT_READ,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mmap_smem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* We need a THP-aligned memory area. */
+	mem = (char *)(((uintptr_t)mmap_mem + thpsize) & ~(thpsize - 1));
+	smem = (char *)(((uintptr_t)mmap_smem + thpsize) & ~(thpsize - 1));
+
+	ret = madvise(mem, thpsize, MADV_HUGEPAGE);
+	ret |= madvise(smem, thpsize, MADV_HUGEPAGE);
+	if (ret) {
+		ksft_test_result_fail("MADV_HUGEPAGE failed\n");
+		goto munmap;
+	}
+
+	/*
+	 * Read from the memory to populate the huge shared zeropage. Read from
+	 * the first sub-page and test if we get another sub-page populated
+	 * automatically.
+	 */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+	if (!pagemap_is_populated(pagemap_fd, mem + pagesize) ||
+	    !pagemap_is_populated(pagemap_fd, smem + pagesize)) {
+		ksft_test_result_skip("Did not get THPs populated\n");
+		goto munmap;
+	}
+
+	fn(mem, smem, thpsize);
+munmap:
+	munmap(mmap_mem, mmap_size);
+	if (mmap_smem != MAP_FAILED)
+		munmap(mmap_smem, mmap_size);
+}
+
+static void run_with_memfd(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, tmp;
+	int fd;
+
+	ksft_print_msg("[RUN] %s ... with memfd\n", desc);
+
+	fd = memfd_create("test", 0);
+	if (fd < 0) {
+		ksft_test_result_fail("memfd_create() failed\n");
+		return;
+	}
+
+	/* File consists of a single page filled with zeroes. */
+	if (fallocate(fd, 0, 0, pagesize)) {
+		ksft_test_result_fail("fallocate() failed\n");
+		goto close;
+	}
+
+	/* Create a private mapping of the memfd. */
+	mem = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto close;
+	}
+	smem = mmap(NULL, pagesize, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Fault the page in. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, pagesize);
+munmap:
+	munmap(mem, pagesize);
+	if (smem != MAP_FAILED)
+		munmap(smem, pagesize);
+close:
+	close(fd);
+}
+
+static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
+{
+	char *mem, *smem, tmp;
+	FILE *file;
+	int fd;
+
+	ksft_print_msg("[RUN] %s ... with tmpfile\n", desc);
+
+	file = tmpfile();
+	if (!file) {
+		ksft_test_result_fail("tmpfile() failed\n");
+		return;
+	}
+
+	fd = fileno(file);
+	if (fd < 0) {
+		ksft_test_result_skip("fileno() failed\n");
+		return;
+	}
+
+	/* File consists of a single page filled with zeroes. */
+	if (fallocate(fd, 0, 0, pagesize)) {
+		ksft_test_result_fail("fallocate() failed\n");
+		goto close;
+	}
+
+	/* Create a private mapping of the memfd. */
+	mem = mmap(NULL, pagesize, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto close;
+	}
+	smem = mmap(NULL, pagesize, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Fault the page in. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, pagesize);
+munmap:
+	munmap(mem, pagesize);
+	if (smem != MAP_FAILED)
+		munmap(smem, pagesize);
+close:
+	fclose(file);
+}
+
+static void run_with_memfd_hugetlb(non_anon_test_fn fn, const char *desc,
+				   size_t hugetlbsize)
+{
+	int flags = MFD_HUGETLB;
+	char *mem, *smem, tmp;
+	int fd;
+
+	ksft_print_msg("[RUN] %s ... with memfd hugetlb (%zu kB)\n", desc,
+		       hugetlbsize / 1024);
+
+	flags |= __builtin_ctzll(hugetlbsize) << MFD_HUGE_SHIFT;
+
+	fd = memfd_create("test", flags);
+	if (fd < 0) {
+		ksft_test_result_skip("memfd_create() failed\n");
+		return;
+	}
+
+	/* File consists of a single page filled with zeroes. */
+	if (fallocate(fd, 0, 0, hugetlbsize)) {
+		ksft_test_result_skip("need more free huge pages\n");
+		goto close;
+	}
+
+	/* Create a private mapping of the memfd. */
+	mem = mmap(NULL, hugetlbsize, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd,
+		   0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_skip("need more free huge pages\n");
+		goto close;
+	}
+	smem = mmap(NULL, hugetlbsize, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED) {
+		ksft_test_result_fail("mmap() failed\n");
+		goto munmap;
+	}
+
+	/* Fault the page in. */
+	tmp = *mem + *smem;
+	asm volatile("" : "+r" (tmp));
+
+	fn(mem, smem, hugetlbsize);
+munmap:
+	munmap(mem, hugetlbsize);
+	if (mem != MAP_FAILED)
+		munmap(smem, hugetlbsize);
+close:
+	close(fd);
+}
+
+struct non_anon_test_case {
+	const char *desc;
+	non_anon_test_fn fn;
+};
+
+/*
+ * Test cases that target any pages in private mappings that are non anonymous:
+ * pages that may get shared via COW ndependent of fork(). This includes
+ * the shared zeropage(s), pagecache pages, ...
+ */
+static const struct non_anon_test_case non_anon_test_cases[] = {
+	/*
+	 * Basic COW test without any GUP. If we miss to break COW, changes are
+	 * visible via other private/shared mappings.
+	 */
+	{
+		"Basic COW",
+		test_cow,
+	},
+};
+
+static void run_non_anon_test_case(struct non_anon_test_case const *test_case)
+{
+	int i;
+
+	run_with_zeropage(test_case->fn, test_case->desc);
+	run_with_memfd(test_case->fn, test_case->desc);
+	run_with_tmpfile(test_case->fn, test_case->desc);
+	if (thpsize)
+		run_with_huge_zeropage(test_case->fn, test_case->desc);
+	for (i = 0; i < nr_hugetlbsizes; i++)
+		run_with_memfd_hugetlb(test_case->fn, test_case->desc,
+				       hugetlbsizes[i]);
+}
+
+static void run_non_anon_test_cases(void)
+{
+	int i;
+
+	ksft_print_msg("[RUN] Non-anonymous memory tests in private mappings\n");
+
+	for (i = 0; i < ARRAY_SIZE(non_anon_test_cases); i++)
+		run_non_anon_test_case(&non_anon_test_cases[i]);
+}
+
+static int tests_per_non_anon_test_case(void)
+{
+	int tests = 3 + nr_hugetlbsizes;
+
+	if (thpsize)
+		tests += 1;
+	return tests;
+}
+
 int main(int argc, char **argv)
 {
 	int err;
@@ -1155,9 +1488,11 @@ int main(int argc, char **argv)
 	pagesize = getpagesize();
 	detect_thpsize();
 	detect_hugetlbsizes();
+	detect_huge_zeropage();
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case());
+	ksft_set_plan(ARRAY_SIZE(anon_test_cases) * tests_per_anon_test_case() +
+		      ARRAY_SIZE(non_anon_test_cases) * tests_per_non_anon_test_case());
 
 	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
 	pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
@@ -1165,6 +1500,7 @@ int main(int argc, char **argv)
 		ksft_exit_fail_msg("opening pagemap failed\n");
 
 	run_anon_test_cases();
+	run_non_anon_test_cases();
 
 	err = ksft_get_fail_cnt();
 	if (err)
-- 
2.38.1
