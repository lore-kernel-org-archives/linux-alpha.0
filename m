From: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Subject: RE: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Thu, 30 Jun 2022 10:32:23 +0000
Message-ID: <8bedba3ddffc435ea44a5e2893583acb@AcuMS.aculab.com>
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
 <a36a85a3-3fd3-10ac-cac3-09a90eaf1936@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 864348138B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3866680E36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 379C440AA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB3B40232
In-Reply-To: <a36a85a3-3fd3-10ac-cac3-09a90eaf1936-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>
Content-Language: en-US
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
To: 'Christophe Leroy' <christophe.leroy-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>, 'Michael Schmitz' <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miquel van Smoorenburg <mikevs-qWit8jRvyhWsTnJN9+BGXg@public.gmane.org>, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Mark Salyzyn <salyzyn-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAzMCBKdW5lIDIwMjIgMTA6NDANCj4gDQo+
IExlIDMwLzA2LzIwMjIgw6AgMTA6MDQsIERhdmlkIExhaWdodCBhIMOpY3JpdMKgOg0KPiA+IEZy
b206IE1pY2hhZWwgU2NobWl0eg0KPiA+PiBTZW50OiAyOSBKdW5lIDIwMjIgMDA6MDkNCj4gPj4N
Cj4gPj4gSGkgQXJuZCwNCj4gPj4NCj4gPj4gT24gMjkvMDYvMjIgMDk6NTAsIEFybmQgQmVyZ21h
bm4gd3JvdGU6DQo+ID4+PiBPbiBUdWUsIEp1biAyOCwgMjAyMiBhdCAxMTowMyBQTSBNaWNoYWVs
IFNjaG1pdHogPHNjaG1pdHptaWNAZ21haWwuY29tPiB3cm90ZToNCj4gPj4+PiBPbiAyOC8wNi8y
MiAxOTowMywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+Pj4+Pj4gVGhlIGRyaXZlciBh
bGxvY2F0ZXMgYm91bmNlIGJ1ZmZlcnMgdXNpbmcga21hbGxvYyBpZiBpdCBoaXRzIGFuDQo+ID4+
Pj4+PiB1bmFsaWduZWQgZGF0YSBidWZmZXIgLSBjYW4gc3VjaCBidWZmZXJzIHN0aWxsIGV2ZW4g
aGFwcGVuIHRoZXNlIGRheXM/DQo+ID4+Pj4+IE5vIGlkZWEuDQo+ID4+Pj4gSG1tbSAtIEkgdGhp
bmsgSSdsbCBzdGljayBhIFdBUk5fT05DRSgpIGluIHRoZXJlIHNvIHdlIGtub3cgd2hldGhlciB0
aGlzDQo+ID4+Pj4gY29kZSBwYXRoIGlzIHN0aWxsIGJlaW5nIHVzZWQuDQo+ID4+PiBrbWFsbG9j
KCkgZ3VhcmFudGVlcyBhbGlnbm1lbnQgdG8gdGhlIG5leHQgcG93ZXItb2YtdHdvIHNpemUgb3IN
Cj4gPj4+IEtNQUxMT0NfTUlOX0FMSUdOLCB3aGljaGV2ZXIgaXMgYmlnZ2VyLiBPbiBtNjhrIHRo
aXMgbWVhbnMgaXQNCj4gPj4+IGlzIGNhY2hlbGluZSBhbGlnbmVkLg0KPiA+Pg0KPiA+PiBBbmQg
YWxsIFNDU0kgYnVmZmVycyBhcmUgYWxsb2NhdGVkIHVzaW5nIGttYWxsb2M/IE5vIHdheSBhdCBh
bGwgZm9yIHVzZXINCj4gPj4gc3BhY2UgdG8gcGFzcyB1bmFsaWduZWQgZGF0YT8NCj4gPg0KPiA+
IEkgZGlkbid0IHRoaW5rIGttYWxsb2MoKSBnYXZlIGFueSBzdWNoIGd1YXJhbnRlZSBhYm91dCBh
bGlnbm1lbnQuDQo+IA0KPiBJIGRvZXMgc2luY2UgY29tbWl0IDU5YmI0Nzk4NWMxZCAoIm1tLCBz
bFthb3VdYjogZ3VhcmFudGVlIG5hdHVyYWwNCj4gYWxpZ25tZW50IGZvciBrbWFsbG9jKHBvd2Vy
LW9mLXR3bykiKQ0KDQpMb29rcyBsaWtlIGl0IGlzIGRvbmUgZm9yICdwb3dlci1vZi10d28nIGxl
c3MgdGhhbiBQQUdFX1NJWkUuDQpUaGlzIG1heSBub3QgaGVscCBzY3NpIHRhcGUgd3JpdGVzIHdo
aWNoIGNvdWxkIGVhc2lseSBiZSAoc2F5KSA0NyBieXRlcy4NCkkgdGhpbmsgdGhhdCBvbmx5IGd1
YXJhbnRlZXMgMiBieXRlIGFsaWdubWVudCBvbiBtNjhrLg0KKEFsdGhvdWdoIGluY3JlYXNpbmcg
dGhlIG1pbi1hbGlnbm1lbnQgb24gbTY4ayB0byA0IChvciBldmVuIDgpDQp3aWxsIHByb2JhYmx5
IG1ha2Ugbm8gbWVhc3VyYWJsZSBkaWZmZXJlbmNlLikNCg0KV2hhdCBoYXBwZW5zIGFib3ZlIFBB
R0VfU0laRT8NCkFueSBzdHJ1Y3R1cmUgd2l0aCBhIHRyYWlsaW5nIFtdIGZpZWxkIGNvdWxkIGVh
c2lseSByZXF1ZXN0DQonNjRrICsgYV9iaXQnIGJ5dGVzLg0KWW91IGRvbid0IHJlYWxseSB3YW50
IHRvIGV4dGVuZCB0aGlzIHRvIDEyOGsgLSBidXQgSSBzdXNwZWN0DQp0aGF0IGlzIHdoYXQgaGFw
cGVucy4NCg0KCURhdmlkDQogDQoNCj4gDQo+IENocmlzdG9waGUNCj4gDQo+ID4gVGhlcmUgYXJl
IGNhY2hlLWxpbmUgYWxpZ25tZW50IHJlcXVpcmVtZW50cyBvbiBzeXN0ZW1zIHdpdGggbm9uLWNv
aGVyZW50DQo+ID4gZG1hLCBidXQgb3RoZXJ3aXNlIHRoZSBhbGlnbm1lbnQgY2FuIGJlIG11Y2gg
c21hbGxlci4NCj4gPg0KPiA+IE9uZSBvZiB0aGUgYWxsb2NhdG9ycyBhZGRzIGEgaGVhZGVyIHRv
IGVhY2ggaXRlbSwgSUlSQyB0aGF0IGNhbg0KPiA+IGxlYWQgdG8gJ3VuZXhwZWN0ZWQnIGFsaWdu
bWVudHMgLSBlc3BlY2lhbGx5IG9uIG02OGsuDQo+ID4NCj4gPiBkbWFfYWxsb2NfY29oZXJlbnQo
KSBkb2VzIGFsaWduIHRvIG5leHQgJ3Bvd2VyIG9mIDInLg0KPiA+IEFuZCBzb21ldGltZXMgeW91
IG5lZWQgKGVnKSAxNmsgYWxsb2NhdGVzIHRoYXQgYXJlIDE2ayBhbGlnbmVkLg0KPiA+DQo+ID4g
CURhdmlkDQo+ID4NCj4gPiAtDQo+ID4gUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFt
bGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQo+ID4gUmVn
aXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
