From: Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Tue, 27 Mar 2018 15:53:53 -0700
Message-ID: <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VweLvjnQ3ZgUgcFUVqe9pJk73KZr8dMOnZiso2XtKZc=; b=tXBs6xgHGho4Bb
	fx4A0mPLhUF5t0BLbBPI9Td2QSr3/2tkI6FyLmj3fI8jlFf2Fmcrq6FPcnGRYZB/RbsA0yOw9LcDB
	ARV1T/LuZh8quT4jxzpLu4DO22N4dW85TmkbQI4mGrppQPi0PD1Nxiqsyei679ISNDP6e27EMinY5
	Mt0ofSpRrz77MmaDL/UbxkVLPGDdQ/C01N/0NYep5EZZTLa7FjmseYqHiKLpEJ3nepI7exwBowzjr
	s8q/ry/Dl2uC2N+ikIqMzNt1EJqhYj4r+L+iLKAflwEDmm1AifQ2FX9iSFdAAzfuMMVy0HEAJd440
	FsZcUcJkZT31d7muDrlw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=loyG69wHNKT9MD8vZID5AEtRxaGQKi0SO0iiz6eKOM8=;
 b=tVNFiWDGPzaBpGtLqtV67gyo2BOUAkOZTT3EDcPKPeTNVIQUi497/yBANLWkUNp0fn
 U9swGI96r/D3v3WDraDrrEHiAY30KXnI3qBml5JnRimZwIeRgYrSGmxqJeuRxAaf9Y8r
 oR2POJS1zgVRgMpQY4VPyDODefQaSL3PySfUxRXcfEVPdGX+Fv2yqtGbNHz42irNt1g7
 /256RR9tJlhuAoMfyrU3a7PHexQNCSrI8Kraos6PMIBaU0nj7nTA55O4HqcNSvhpetJX
 /81RECXXR22W/EoWZnm5knUo6vDl4rw2CdUU9mKwi2Nk2hJ8fbrdhZ8xp0MlVS0gBSIr
 w7Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=loyG69wHNKT9MD8vZID5AEtRxaGQKi0SO0iiz6eKOM8=;
 b=XXmu9+lJ0RL1minH7B9fQIiiBszZ35//aonmzw4oBnSqfyQyWAzLfb5kefa/oGYyhd
 m0ebDlqD3Dar5NpQ2N56ExxAxA8lTomzZheJYtAU4qwBk7IbVcYqfy5jNzjp2P+CjJAm
 k1SZGTJjR/F5FuYhR9u9obcI/1/2qfSbYAjIo=
In-Reply-To: <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Ilya Smith <blackzert@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Rich Felker <dalias@libc.org>, Jan Kara <jack@suse.cz>, linux-sh <linux-sh@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, linux-ia64@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linu>

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgNjo1MSBBTSwgSWx5YSBTbWl0aCA8YmxhY2t6ZXJ0QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPj4gT24gMjcgTWFyIDIwMTgsIGF0IDEwOjI0LCBNaWNoYWwgSG9j
a28gPG1ob2Nrb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gTW9uIDI2LTAzLTE4IDIyOjQ1
OjMxLCBJbHlhIFNtaXRoIHdyb3RlOgo+Pj4KPj4+PiBPbiAyNiBNYXIgMjAxOCwgYXQgMTE6NDYs
IE1pY2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gRnJp
IDIzLTAzLTE4IDIwOjU1OjQ5LCBJbHlhIFNtaXRoIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gT24gMjMg
TWFyIDIwMTgsIGF0IDE1OjQ4LCBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4g
d3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDc6MzY6MzZQTSAr
MDMwMCwgSWx5YSBTbWl0aCB3cm90ZToKPj4+Pj4+PiBDdXJyZW50IGltcGxlbWVudGF0aW9uIGRv
ZXNuJ3QgcmFuZG9taXplIGFkZHJlc3MgcmV0dXJuZWQgYnkgbW1hcC4KPj4+Pj4+PiBBbGwgdGhl
IGVudHJvcHkgZW5kcyB3aXRoIGNob29zaW5nIG1tYXBfYmFzZV9hZGRyIGF0IHRoZSBwcm9jZXNz
Cj4+Pj4+Pj4gY3JlYXRpb24uIEFmdGVyIHRoYXQgbW1hcCBidWlsZCB2ZXJ5IHByZWRpY3RhYmxl
IGxheW91dCBvZiBhZGRyZXNzCj4+Pj4+Pj4gc3BhY2UuIEl0IGFsbG93cyB0byBieXBhc3MgQVNM
UiBpbiBtYW55IGNhc2VzLiBUaGlzIHBhdGNoIG1ha2UKPj4+Pj4+PiByYW5kb21pemF0aW9uIG9m
IGFkZHJlc3Mgb24gYW55IG1tYXAgY2FsbC4KPj4+Pj4+Cj4+Pj4+PiBXaHkgc2hvdWxkIHRoaXMg
YmUgZG9uZSBpbiB0aGUga2VybmVsIHJhdGhlciB0aGFuIGxpYmM/ICBsaWJjIGlzIHBlcmZlY3Rs
eQo+Pj4+Pj4gY2FwYWJsZSBvZiBzcGVjaWZ5aW5nIHJhbmRvbSBudW1iZXJzIGluIHRoZSBmaXJz
dCBhcmd1bWVudCBvZiBtbWFwLgo+Pj4+PiBXZWxsLCB0aGVyZSBpcyBmb2xsb3dpbmcgcmVhc29u
czoKPj4+Pj4gMS4gSXQgc2hvdWxkIGJlIGRvbmUgaW4gYW55IGxpYmMgaW1wbGVtZW50YXRpb24s
IHdoYXQgaXMgbm90IHBvc3NpYmxlIElNTzsKPj4+Pgo+Pj4+IElzIHRoaXMgcmVhbGx5IHNvIGhl
bHBmdWw/Cj4+Pgo+Pj4gWWVzLCBBU0xSIGlzIG9uZSBvZiB2ZXJ5IGltcG9ydGFudCBtaXRpZ2F0
aW9uIHRlY2huaXF1ZXMgd2hpY2ggYXJlIHJlYWxseSB1c2VkCj4+PiB0byBwcm90ZWN0IGFwcGxp
Y2F0aW9ucy4gSWYgdGhlcmUgaXMgbm8gQVNMUiwgaXQgaXMgdmVyeSBlYXN5IHRvIGV4cGxvaXQK
Pj4+IHZ1bG5lcmFibGUgYXBwbGljYXRpb24gYW5kIGNvbXByb21pc2UgdGhlIHN5c3RlbS4gV2Ug
Y2Fu4oCZdCBqdXN0IGZpeCBhbGwgdGhlCj4+PiB2dWxuZXJhYmlsaXRpZXMgcmlnaHQgbm93LCB0
aGF0cyB3aHkgd2UgaGF2ZSBtaXRpZ2F0aW9ucyAtIHRlY2huaXF1ZXMgd2hpY2ggYXJlCj4+PiBt
YWtlcyBleHBsb2l0YXRpb24gbW9yZSBoYXJkIG9yIGltcG9zc2libGUgaW4gc29tZSBjYXNlcy4K
Pj4+Cj4+PiBUaGF0cyB3aHkgaXQgaXMgaGVscGZ1bC4KPj4KPj4gSSBhbSBub3QgcXVlc3Rpb25p
bmcgQVNMUiBpbiBnZW5lcmFsLiBJIGFtIGFza2luZyB3aGV0aGVyIHdlIHJlYWxseSBuZWVkCj4+
IHBlciBtbWFwIEFTTFIgaW4gZ2VuZXJhbC4gSSBjYW4gaW1hZ2luZSB0aGF0IHNvbWUgZW52aXJv
bm1lbnRzIHdhbnQgdG8KPj4gcGF5IHRoZSBhZGRpdGlvbmFsIHByaWNlIGFuZCBvdGhlciBzaWRl
IGVmZmVjdHMsIGJ1dCBjb25zaWRlcmluZyB0aGlzCj4+IGNhbiBiZSBhY2hpZXZlZCBieSBsaWJj
LCB3aHkgdG8gYWRkIG1vcmUgY29kZSB0byB0aGUga2VybmVsPwo+Cj4gSSBiZWxpZXZlIHRoaXMg
aXMgdGhlIG9ubHkgb25lIHJpZ2h0IHBsYWNlIGZvciBpdC4gQWRkaW5nIHRoZXNlIDIwMCsgbGlu
ZXMgb2YKPiBjb2RlIHdlIGdpdmUgdGhpcyBmZWF0dXJlIGZvciBhbnkgdXNlciAtIG9uIGRlc2t0
b3AsIG9uIHNlcnZlciwgb24gSW9UIGRldmljZSwKPiBvbiBTQ0FEQSwgZXRjLiBCdXQgaWYgb25s
eSBnbGliYyB3aWxsIGltcGxlbWVudCDigJh1c2VyLW1vZGUtYXNscuKAmSBJb1QgYW5kIFNDQURB
Cj4gZGV2aWNlcyB3aWxsIG5ldmVyIGdldCBpdC4KCkkgYWdyZWU6IHB1c2hpbmcgdGhpcyBvZmYg
dG8gbGliYyBsZWF2ZXMgYSBsb3Qgb2YgdGhpbmdzIHVucHJvdGVjdGVkLgpJIHRoaW5rIHRoaXMg
c2hvdWxkIGxpdmUgaW4gdGhlIGtlcm5lbC4gVGhlIHF1ZXN0aW9uIEkgaGF2ZSBpcyBhYm91dApt
YWtpbmcgaXQgbWFpbnRhaW5hYmxlL3JlYWRhYmxlL2V0Yy4KClRoZSBzdGF0ZS1vZi10aGUtYXJ0
IGZvciBBU0xSIGlzIG1vdmluZyB0byBmaW5lciBncmFudWxhcml0eSAob3ZlcgpqdXN0IGJhc2Ut
YWRkcmVzcyBvZmZzZXQpLCBzbyBJJ2QgcmVhbGx5IGxpa2UgdG8gc2VlIHRoaXMgc3VwcG9ydGVk
IGluCnRoZSBrZXJuZWwuIFdlJ2xsIGJlIGdldHRpbmcgdGhlcmUgZm9yIG90aGVyIHRoaW5ncyBp
biB0aGUgZnV0dXJlLCBhbmQKSSdkIGxpa2UgdG8gaGF2ZSBhIHdvcmtpbmcgcHJvZHVjdGlvbiBl
eGFtcGxlIGZvciByZXNlYXJjaGVycyB0bwpzdHVkeSwgZXRjLgoKLUtlZXMKCi0tIApLZWVzIENv
b2sKUGl4ZWwgU2VjdXJpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmM=
