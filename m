Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718778;
	b=p6DZjBmIcyHfhrUOxsnpET4CT4NVjUXbqz8cokL1Eo39rrNZ5xKd51cx2L16om7QDpL+
	 TgWdzyQzqf8fl2zFEwK5U/B0Q3uR/6BFGneLIXhlOGSPrf2ye8XobiksSU3s4Q8gBrkUD
	 BuRG2eTjOIGHOGMZFy+ZYdZssy1fPt9Qz65eTcTGomxw0b9mcFfDmWzDhrqkt/fW2pIWD
	 3AB72Z1L3u8f3I7Nxp+ib2LQV5wbaUWNNf5oxFVtzHDNOhHdxL5CQVtfEl8KSo4+z0w5M
	 wS66Pv91YDspWiwRWrwf8y22XD/6FWkyoLG9HLThIA95yZKUXBIWUOyHab5yT0k4ycg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QsewQ4bSQyXCreyiSJB98dbyhPJ57LIsDJYpo0Npvlg=;
	b=KAX8wOENJZo3SAYb9npZFbYd1aOUKAi9l6qNwzHDDVcMqqoddWzl5AruYmstIGMYEZlH
	 JP8sFXSnEKeIie17t69TQyL9X/iEldDG8ZKESvUQJmBZMvMulsOevGoh/cZFVfrj3eh4L
	 B6yC5oQxupAYY1yf1X1Z2W4z1nQQfu4sVcKI1Sw7uRKX8U7wKc3CmMyujOK9jwMrE5Qq2
	 UiYsY74nSSbw2ehvkl5xmMc0N102XLES+g2PD3XuIguDR9YjArdHwRGkEN9o9o3Cy3v1u
	 oKVEalzH+ZeJCl6Zb2a/vCjmNVWFEMkYmu2KkoOZ4EXeLUFiTQ4IsPQ3xM6MxoUzJ1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aL3a/B1A";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ACF606A789
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 15:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ACF606A789
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aL3a/B1A
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso6316025a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 07:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718775; cv=none;
        d=google.com; s=arc-20260327;
        b=Q2wjdIdLCjPB7NAwv8gfy6nFwdznKbC9kKjYMkcy6oIsdOB6Foh1N3x0Jp6thcdRKa
         8EVpOAokCAbqZfGiBZ+QsUSmoL9KWRsO/HQ4WggB0mewkfN41KgAXKt74J7iFy277xyE
         g6sXQ95fpO8JAzvTx2J57BGHrwHnjygGHzN9JAJo6GMdD3IMsVwPzmzL3kt5oTQ6CLFa
         Nk+C5QwL+qFYRXV0WM7STty5Yus1q7rzJ6I6s56xTjql2X8yj0Apti27uXJEWWxcCykt
         3mYkHvUq0M3wKZmRIYwbv8CdN/rW89NU3mJfkg2DC8GWi6Z9hWg3AEQaAgkmnkJwgqFr
         cdag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QsewQ4bSQyXCreyiSJB98dbyhPJ57LIsDJYpo0Npvlg=;
        fh=6GzNdb43I/X8/4wp1Sh8Ux9KuwGM30t5gmPz8B6kGFE=;
        b=Kd+kRFQCpU1ZOGXHceMSnYbz5AKkXcCoel+X5mvVLhzdkKvbdNB2P2r5Pa4Bx2J5Oo
         jvZVnCmk6wLcMDZWMYKPLMkCNumDYcnlXpwFWwmCmj88LtQCPNUT4ui7RB+flwOMboGW
         p4ylWRZlor38wDATCWAYBTPSKF5cEMb3kWifz85Ea3WW8hDDAPprh+n0/aXdbLfwkYu0
         5URs8at5mgbR2FAlYwynvUALjks7DNp0kCHHv7OEj4ZK/Uqait1ETtcRtHrhu3I6oZBw
         3si84AY8DAZMTZUjljWqmfvQuZGObXSxAF4J+B4tNxBdKgmpHjpwYLDrBlYB89Mug563
         GZ4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718775; x=1794323575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsewQ4bSQyXCreyiSJB98dbyhPJ57LIsDJYpo0Npvlg=;
        b=aL3a/B1AV+UGrazg+7plNsxS7dL+F6hTVquzpd3MtjPg2vHO1Xtu3j9xxaUuEhbN4O
         Jd1BuY51fqCCfDwgcY5VQg1eh+pVEoieAQXHDFU88zWWKem4tBysSnW978H+TaLviIbL
         gRKWK8TgU6u4ysOmsAus3gO9hkapv6kLExWrMHTG3ZJWiKzCxiZb+/X2Wm/bY7TGHhsd
         kjDmQ7aAxBXh1toLH8155O4HY8ebIirW7k709O585hWJoSj90/UPPaEVr2LznT7IEArg
         yTEHekw7QdfgjNuf1OpfqS71bf9+rN6JCzyzUz3hnJhQpJK8O7OVdGNkpoiO9Lg4pR+S
         zflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718775; x=1794323575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsewQ4bSQyXCreyiSJB98dbyhPJ57LIsDJYpo0Npvlg=;
        b=vyao3XNnwQpjFAqH83H8h0WfZ/2Zu5+3mIJOyplR1oW9vW7QgdEbNszKYooBqgmzMF
         PsWVPs9A5MWi6DkHI32ZJlMwsRCqJEUXcaqAl7BI7bQuX8Emsc9ni6HCKSpOcS2zwvQa
         HWtHt60pnhoTnClVpy5VVOd9IIig4vtHJVTiPIjYUIJLsrVPQpspVNovzIDKaT7S87Hu
         Jd0YS2i9yUZ6OY0Dsl5272aJWXJgWS+PreAPjk2R6XtkxMhpUTH+JoKz6Le7lK7eTWYo
         JGr9OGkoIJlJ8ypsetNvj0X/sHy0iwUY6Lp7lMDkJURJB/1utkBV//8X69ok3QusMGCP
         sSIw==
X-Forwarded-Encrypted: i=1; AKwUvByG8wZcuiVJrIatVvokjd5tWsivUAZpapGJUlUSZL2Kf6FsUh1Escx0K/m5JAViNQgCcA66FvbJBaUpJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kmDtWwGHShqbmywbImE6BxbinAM4gsBuNMt7hwHIZj73b3N21
	tpyzK+1+KSxNVzaqmmk9t97XWYEGsrmm34sPsJJNnUZVyByJBFQmzJWc3LXnHNzKg0j7RXoqkFf
	8OzM0IkEcl921dEfE9TsTJ7kAQ+haxJI=
X-Gm-Gg: AYBFou08HRUWlUPGwkrnbfWAFOxe/RC6qTYN168vHQjTTyff6qdoVWmeH3kGpBqYhMi
	SipYQW1pLAWoVpzi9VSTYfvrtIZrNIeKxPe81vgCuBeQQav1Rq4QAfhq93dksNeETPEDmdArwkQ
	nzbL97rVJlm73JeVEpgRkxRELIrQzM15KXR2iN43o+pp7R1P3+0INlk8JEfA7fgUyglr/pDNkh1
	EH+fW56oTPgraQyH0o9rYoza1QNar+ZfakNh9NGm1NnMCy+lje1xJao8MGi0PS6piki4PDny+10
	v3VKTB7iN0Tc7OSZIn1ix2F8V9wUm/CIWeiD7ExlJ6gkfyrZ3wHUhgyQcDcZjNKT9qdh1ydWira
	BnNe4pTR5k5ss9q3pCAl02HneWlhDhrm64QgFphzJJpHjfjMOFR3f1gYte6hhY7hrMoOO8R/OaX
	BzQSMIJumjl9zpmNJy
X-Received: by 2002:aa7:d746:0:b0:6b1:bbbf:c8da with SMTP id
 4fb4d7f45d1cf-6b4d467f117mr6727840a12.17.1793718775223; Tue, 03 Nov 2026
 07:12:55 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-perf-alpha-profileme-v3-0-4bf6e1dda733@gmail.com> <20261102-perf-alpha-profileme-v3-2-4bf6e1dda733@gmail.com>
In-Reply-To: <20261102-perf-alpha-profileme-v3-2-4bf6e1dda733@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 3 Nov 2026 16:12:44 +0100
X-Gm-Features: AclHuK-5MktQVkWH25f7cHD8D0vNLr-mwxWg2ZtpgvT0msziqP_pJU8QaFNmgoE
Message-ID: <CA+=Fv5QxqE08ZE+FWUhp44=bNypEpqx_JYZH3ELzu+nMD1HpbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf python: Add alpha-profileme.py
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 3, 2026 at 3:19=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> perf report shows where Alpha ProfileMe samples land but cannot
> aggregate the raw status attached to them.
>
> Add a standalone script, using the perf Python module, that summarizes
> it by symbol or, with --pc, by instruction, in the style of DCPI: the
> fraction of samples killed on a wrong path, not retired, mispredicted,
> taken or stalled, the mean PCTR1 window count, and trap counts by type.
> Mispredict and trap types are only counted when I_STAT[TRP] is set,
> since they are stale otherwise. Redirect traps are counted by their
> PALcode entry offset in PMPC.
>
> Raw data is only read from cpu PMU events, as a tracepoint's payload can
> pass for ProfileMe status. Rows are kept apart by PCTR_CTL[SL1], as a
> mean over two things PCTR1 can count means nothing.
>
> On an EV7, sampling a loop whose branch tests random data reports that
> branch mispredicted in 21% of its samples, and 0% with sorted data.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  tools/perf/python/alpha-profileme.py | 172 +++++++++++++++++++++++++++++=
++++++
>  1 file changed, 172 insertions(+)
>
> diff --git a/tools/perf/python/alpha-profileme.py b/tools/perf/python/alp=
ha-profileme.py
> new file mode 100755
> index 000000000000..366b288c6e1b
> --- /dev/null
> +++ b/tools/perf/python/alpha-profileme.py
> @@ -0,0 +1,172 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +"""Summarize Alpha ProfileMe samples.
> +
> +Aggregates the ProfileMe status that the Alpha cpu PMU attaches to each
> +sample as PERF_SAMPLE_RAW data, by symbol or, with --pc, by instruction.
> +
> +Record with raw data, e.g.:
> +  perf record -R -e instructions:p -- ./workload
> +  alpha-profileme.py [-i perf.data] [--pc] [--top N]
> +
> +Columns:
> +  samples   ProfileMe samples attributed to the row
> +  killed%   profiled instruction killed before it was mapped (PM_KILLED_=
BM)
> +  invalid%  instruction did not trap and did not retire valid (VAL clear=
)
> +  mispr%    conditional branch mispredicted (TRP and MIS)
> +  taken%    TAK set; only meaningful for rows that are conditional branc=
hes
> +  stall%    instruction stalled between fetch and map (PM_STALLED)
> +  pctr1     mean PCTR1 count during the window; what it counts depends o=
n
> +            the event: inum retire delay for cycles:p, window cycles for
> +            instructions:p, Bcache misses for bcache-misses:p and Mbox
> +            replay traps for cpu/mbox-replay/p
> +  traps     trap counts by type, only for samples with TRP set
> +
> +Samples from events that set PCTR1 to count different things are printed
> +in separate tables, as their means cannot be compared.
> +"""
> +from __future__ import annotations
> +
> +import argparse
> +from collections import defaultdict
> +import struct
> +import sys
> +from typing import Optional
> +import perf
> +
> +TRAP_TYPES =3D {
> +    0: "replay", 2: "dtb2-3l", 3: "dtb2-4l", 4: "fen", 5: "unalign",
> +    6: "dtb1", 7: "dfault", 8: "opcdec", 10: "mchk", 12: "arith",
> +    14: "mt_fpcr", 15: "reset",
> +}
> +REDIRECTS =3D {0x481: "iacv", 0x581: "itbmiss", 0x681: "intr"}
> +PCTR1_NAMES =3D ("cycles", "retire delay", "bcache misses", "mbox replay=
s")
> +SAMPLE =3D struct.Struct("<IQQQ")
> +
> +
> +class Row:
> +    """ProfileMe status totals for one symbol or instruction."""
> +    def __init__(self) -> None:
> +        self.samples =3D 0
> +        self.killed =3D 0
> +        self.invalid =3D 0
> +        self.mispredict =3D 0
> +        self.taken =3D 0
> +        self.stalled =3D 0
> +        self.pctr1 =3D 0
> +        self.traps: dict[str, int] =3D defaultdict(int)
> +
> +
> +def pct(n: int, d: int) -> float:
> +    """Return n as a percentage of d."""
> +    return 100.0 * n / d if d else 0.0
> +
> +
> +class ProfileMe:
> +    """Aggregates ProfileMe raw sample data."""
> +    def __init__(self, by_pc: bool, top: int) -> None:
> +        self.by_pc =3D by_pc
> +        self.top =3D top
> +        # Keyed by PCTR_CTL[SL1], which sets what PCTR1 counts.
> +        self.tables: dict[int, dict[str, Row]] =3D defaultdict(lambda: d=
efaultdict(Row))
> +        self.skipped =3D 0
> +        self.session: Optional[perf.session] =3D None
> +
> +    def process_event(self, sample: perf.sample_event) -> None:
> +        """Add one sample's ProfileMe status to its row."""
> +        raw =3D sample.raw_buf
> +        # Raw data from another PMU or a tracepoint is not ProfileMe sta=
tus.
> +        if (sample.evsel.type not in (perf.TYPE_HARDWARE, perf.TYPE_RAW)=
 or
> +                not raw or len(raw) < SAMPLE.size):
> +            self.skipped +=3D 1
> +            return
> +        version, pmpc, i_stat, ctl =3D SAMPLE.unpack_from(raw)
> +        if version < 1:
> +            self.skipped +=3D 1
> +            return
> +
> +        symbol =3D sample.symbol or "[unknown]"
> +        if self.by_pc:
> +            if pmpc & 1:
> +                key =3D f"PAL+{pmpc & 0x7fff:#x}"
> +            else:
> +                key =3D f"{pmpc & ~3:#018x} {symbol}"
> +        else:
> +            key =3D f"{sample.dso or '[unknown]'} {symbol}"
> +
> +        r =3D self.tables[(ctl >> 2) & 3][key]
> +        r.samples +=3D 1
> +        trp =3D (i_stat >> 39) & 1
> +        if (ctl >> 26) & 1:
> +            r.killed +=3D 1
> +        if not trp and not (ctl >> 1) & 1:
> +            r.invalid +=3D 1
> +        if ctl & 1:
> +            r.taken +=3D 1
> +        if (ctl >> 27) & 1:
> +            r.stalled +=3D 1
> +        r.pctr1 +=3D (ctl >> 6) & 0xfffff
> +
> +        redirect =3D REDIRECTS.get(pmpc & 0x7fff) if pmpc & 1 else None
> +        if redirect:
> +            r.traps[redirect] +=3D 1
> +        elif trp:
> +            if (i_stat >> 40) & 1:
> +                r.mispredict +=3D 1
> +            else:
> +                tt =3D (i_stat >> 34) & 0xf
> +                r.traps[TRAP_TYPES.get(tt, "other")] +=3D 1
> +
> +    def print_totals(self) -> None:
> +        """Print the busiest rows of each table."""
> +        total =3D sum(r.samples for rows in self.tables.values() for r i=
n rows.values())
> +        print(f"{total} ProfileMe samples, {self.skipped} without Profil=
eMe data")
> +        for sl1, rows in sorted(self.tables.items()):
> +            print(f"\npctr1 counts {PCTR1_NAMES[sl1]}:")
> +            self.print_table(rows)
> +
> +    def print_table(self, rows: dict[str, Row]) -> None:
> +        """Print the busiest rows of one table."""
> +        print(f"{'samples':>8} {'killed%':>7} {'invalid%':>8} {'mispr%':=
>6} "
> +              f"{'taken%':>7} {'stall%':>6} {'pctr1':>7}  {'location':<4=
0} traps")
> +        ordered =3D sorted(rows.items(), key=3Dlambda kv: kv[1].samples,=
 reverse=3DTrue)
> +        for key, r in ordered[:self.top]:
> +            traps =3D " ".join(f"{k}=3D{v}" for k, v in
> +                             sorted(r.traps.items(), key=3Dlambda kv: -k=
v[1]))
> +            print(f"{r.samples:8d} {pct(r.killed, r.samples):7.1f} "
> +                  f"{pct(r.invalid, r.samples):8.1f} "
> +                  f"{pct(r.mispredict, r.samples):6.1f} "
> +                  f"{pct(r.taken, r.samples):7.1f} "
> +                  f"{pct(r.stalled, r.samples):6.1f} "
> +                  f"{r.pctr1 / r.samples:7.1f}  {key:<40} {traps}")
> +
> +    def run(self, input_file: str) -> None:
> +        """Run the session."""
> +        self.session =3D perf.session(perf.data(input_file), sample=3Dse=
lf.process_event)
> +        try:
> +            self.session.process_events()
> +        finally:
> +            # Break the reference cycle between perf.session and self.pr=
ocess_event
> +            # because perf.session lacks cyclic GC support (tp_traverse)=
.
> +            self.session =3D None
> +        self.print_totals()
> +
> +
> +def main() -> None:
> +    """Main function."""
> +    parser =3D argparse.ArgumentParser(description=3D"Summarize Alpha Pr=
ofileMe samples")
> +    parser.add_argument("-i", "--input", default=3D"perf.data", help=3D"=
Input file")
> +    parser.add_argument("--pc", action=3D"store_true", help=3D"aggregate=
 by instruction")
> +    parser.add_argument("--top", type=3Dint, default=3D30, help=3D"rows =
to print")
> +    args =3D parser.parse_args()
> +
> +    analyzer =3D ProfileMe(args.pc, args.top)
> +    try:
> +        analyzer.run(args.input)
> +    except IOError as e:
> +        print(e, file=3Dsys.stderr)
> +        sys.exit(1)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    main()
>
> --
> 2.55.0
>

I tested alpha-profileme.py with fresh ES40 recordings. It kept
window cycles and retire delay in separate tables, and it skipped
the unrelated tracepoint payload in my test. I also decoded the
ES40 recordings successfully on x86-64.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
