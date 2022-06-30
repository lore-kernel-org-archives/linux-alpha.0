From: Christophe Leroy <christophe.leroy-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Thu, 30 Jun 2022 09:40:07 +0000
Message-ID: <a36a85a3-3fd3-10ac-cac3-09a90eaf1936@csgroup.eu>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <26852797d822462abc1c9f96def7fa42@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAEF38452F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A4A78456F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34B2E41A3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8B541A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMeKVwvSbRwvoBs30QPDxE281RsKQasxaJqwbmlllu4=;
 b=ZU2IHEXgYTh3xtZ3bfJeDls6oYA+prJXQ7JDCs10uhCGFDAD5KmeqPAVW0s7IpWv3HjV36sWEdiEczP18K3lS58Jk4SLr8GNbGnDMTzKMnS+Grr9IhIWDSbGxx7vVsNl6RAWwNahrTMqw9N/Cm9XngeHed6AA+dEzJDhjbkTjXoPswDnrixJaf613sMVs3IdulxhCSDCyxGsgMoi9vA7uR1GUGuX1NpHdmZZTZacCxImoMvsNafc3iQcHBTcq011F7dLn/MSdzijUNuQyqDhl4zsEKoLw8UhTK+B0Y2vAzRWpc/kbN2fqkCZUERO+Si8biuVETZQU2cWzMr9LO5rTw==
In-Reply-To: <26852797d822462abc1c9f96def7fa42-1XygrNkDbNvwg4NCKwmqgw@public.gmane.org>
Content-Language: en-US
Content-ID: <57345C3932941D43899ACCFE1837141A-CLPaqP/Z8av9SOyiPdwG7kEZadJ+ESx9@public.gmane.org>
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
To: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>, 'Michael Schmitz' <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miquel van Smoorenburg <mikevs-qWit8jRvyhWsTnJN9+BGXg@public.gmane.org>, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Mark Salyzyn <salyzyn-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

DQoNCkxlIDMwLzA2LzIwMjIgw6AgMTA6MDQsIERhdmlkIExhaWdodCBhIMOpY3JpdMKgOg0KPiBG
cm9tOiBNaWNoYWVsIFNjaG1pdHoNCj4+IFNlbnQ6IDI5IEp1bmUgMjAyMiAwMDowOQ0KPj4NCj4+
IEhpIEFybmQsDQo+Pg0KPj4gT24gMjkvMDYvMjIgMDk6NTAsIEFybmQgQmVyZ21hbm4gd3JvdGU6
DQo+Pj4gT24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMTE6MDMgUE0gTWljaGFlbCBTY2htaXR6IDxz
Y2htaXR6bWljQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4+IE9uIDI4LzA2LzIyIDE5OjAzLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+Pj4+Pj4gVGhlIGRyaXZlciBhbGxvY2F0ZXMgYm91bmNl
IGJ1ZmZlcnMgdXNpbmcga21hbGxvYyBpZiBpdCBoaXRzIGFuDQo+Pj4+Pj4gdW5hbGlnbmVkIGRh
dGEgYnVmZmVyIC0gY2FuIHN1Y2ggYnVmZmVycyBzdGlsbCBldmVuIGhhcHBlbiB0aGVzZSBkYXlz
Pw0KPj4+Pj4gTm8gaWRlYS4NCj4+Pj4gSG1tbSAtIEkgdGhpbmsgSSdsbCBzdGljayBhIFdBUk5f
T05DRSgpIGluIHRoZXJlIHNvIHdlIGtub3cgd2hldGhlciB0aGlzDQo+Pj4+IGNvZGUgcGF0aCBp
cyBzdGlsbCBiZWluZyB1c2VkLg0KPj4+IGttYWxsb2MoKSBndWFyYW50ZWVzIGFsaWdubWVudCB0
byB0aGUgbmV4dCBwb3dlci1vZi10d28gc2l6ZSBvcg0KPj4+IEtNQUxMT0NfTUlOX0FMSUdOLCB3
aGljaGV2ZXIgaXMgYmlnZ2VyLiBPbiBtNjhrIHRoaXMgbWVhbnMgaXQNCj4+PiBpcyBjYWNoZWxp
bmUgYWxpZ25lZC4NCj4+DQo+PiBBbmQgYWxsIFNDU0kgYnVmZmVycyBhcmUgYWxsb2NhdGVkIHVz
aW5nIGttYWxsb2M/IE5vIHdheSBhdCBhbGwgZm9yIHVzZXINCj4+IHNwYWNlIHRvIHBhc3MgdW5h
bGlnbmVkIGRhdGE/DQo+IA0KPiBJIGRpZG4ndCB0aGluayBrbWFsbG9jKCkgZ2F2ZSBhbnkgc3Vj
aCBndWFyYW50ZWUgYWJvdXQgYWxpZ25tZW50Lg0KDQpJIGRvZXMgc2luY2UgY29tbWl0IDU5YmI0
Nzk4NWMxZCAoIm1tLCBzbFthb3VdYjogZ3VhcmFudGVlIG5hdHVyYWwgDQphbGlnbm1lbnQgZm9y
IGttYWxsb2MocG93ZXItb2YtdHdvKSIpDQoNCkNocmlzdG9waGUNCg0KPiBUaGVyZSBhcmUgY2Fj
aGUtbGluZSBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzIG9uIHN5c3RlbXMgd2l0aCBub24tY29oZXJl
bnQNCj4gZG1hLCBidXQgb3RoZXJ3aXNlIHRoZSBhbGlnbm1lbnQgY2FuIGJlIG11Y2ggc21hbGxl
ci4NCj4gDQo+IE9uZSBvZiB0aGUgYWxsb2NhdG9ycyBhZGRzIGEgaGVhZGVyIHRvIGVhY2ggaXRl
bSwgSUlSQyB0aGF0IGNhbg0KPiBsZWFkIHRvICd1bmV4cGVjdGVkJyBhbGlnbm1lbnRzIC0gZXNw
ZWNpYWxseSBvbiBtNjhrLg0KPiANCj4gZG1hX2FsbG9jX2NvaGVyZW50KCkgZG9lcyBhbGlnbiB0
byBuZXh0ICdwb3dlciBvZiAyJy4NCj4gQW5kIHNvbWV0aW1lcyB5b3UgbmVlZCAoZWcpIDE2ayBh
bGxvY2F0ZXMgdGhhdCBhcmUgMTZrIGFsaWduZWQuDQo+IA0KPiAJRGF2aWQNCj4gDQo+IC0NCj4g
UmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1p
bHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQo+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11
IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
