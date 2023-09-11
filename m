From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 2/2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Date: Mon, 11 Sep 2023 21:10:26 +0000
Message-ID: <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
         <20230911180210.1060504-3-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694466747; x=1726002747;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cz+v3li1JoGPwRcSsa49A9A/hlg8ps60ng4auSdFE3o=;
  b=M1JOU/CJ0wzz88ZtrNsSlKwqJguB0PhrBTGFbyeSR90nlrwHECtxjTxv
   EMky+wnen/HNP1HJN1/P0LzRiGCnqnL5N/d75G3jNsYutoXnVLH/0RKhk
   /clLL6NgkeDli2BdRmGsi+FF1vrR7fgvWAR3PWT0urr5jS3XnvZrPH0rE
   O3ROnn6a6rfw0NFsb5LySxhRK8/sId4I97x51hHOm01G/VQlVPzPGZfw+
   cMmLqiS6GzCWdEA0ucEEG0hc9HVv5zqId1N7/fsEDVkmWj0NSRi3mSxzc
   rZkLxqEOLxSX6NlcsCZvgpmk6ZRikvvFUpXpLuvrtQfETQoooY6uXo/g9
   Q==;
In-Reply-To: <20230911180210.1060504-3-sohil.mehta@intel.com>
Content-Language: en-US
Content-ID: <1955378CE723A64F8B91F3A248378666@namprd11.prod.outlook.com>
List-ID: <linux-alpha.vger.kernel.org>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Cc: "svens@linux.ibm.com" <svens@linux.ibm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "brgerst@gmail.com" <brgerst@gmail.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "dalias@libc.org" <dalias@libc.org>, "lukas.bulwahn@gmail.com" <>

T24gTW9uLCAyMDIzLTA5LTExIGF0IDE4OjAyICswMDAwLCBTb2hpbCBNZWh0YSB3cm90ZToKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAo+IGIv
YXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAo+IGluZGV4IDIwZTUwNTg2
ZThhMi4uMjc2N2I4YTQyNjM2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lz
Y2FsbHMvc3lzY2FsbC50YmwKPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzL3N5
c2NhbGwudGJsCj4gQEAgLTUzOSwzICs1MzksNCBAQAo+IMKgNDUwwqDCoMKgwqBub3NwdcKgwqDC
oHNldF9tZW1wb2xpY3lfaG9tZV9ub2RlwqDCoMKgwqDCoMKgwqDCoMKgc3lzX3NldF9tZW1wb2xp
Y3lfaG9tCj4gZV9ub2RlCj4gwqA0NTHCoMKgwqDCoGNvbW1vbsKgwqBjYWNoZXN0YXTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lzX2NhY2hlc3RhdAo+IMKg
NDUywqDCoMKgwqBjb21tb27CoMKgZmNobW9kYXQywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN5c19mY2htb2RhdDIKPiArNDUzwqDCoMKgwqBjb21tb27CoMKg
bWFwX3NoYWRvd19zdGFja8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lzX21hcF9z
aGFkb3dfc3RhY2sKCkkgbm90aWNlZCBpbiBwb3dlcnBjLCB0aGUgbm90IGltcGxlbWVudGVkIHN5
c2NhbGxzIGFyZSBtYW51YWxseSBtYXBwZWQKdG8gc3lzX25pX3N5c2NhbGwuIEl0IGFsc28gaGFz
IHNvbWUgc3BlY2lhbCBleHRyYSBzeXNfbmlfc3lzY2FsbCgpCmltcGxlbWVudGF0aW9uIGJpdHMg
dG8gaGFuZGxlIGJvdGggQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSIGFuZAohQVJDSF9IQVNfU1lT
Q0FMTF9XUkFQUEVSLiBTbyB3b25kZXJpbmcgaWYgaXQgbWlnaHQgbmVlZCBzcGVjaWFsCnRyZWF0
bWVudC4gRGlkIHlvdSBzZWUgdGhvc2UgcGFydHM/Cgo=
