From: JB <juergen-alpha@juergen-bierlein.org>
Subject: Linux kernel 3.18 and above does not boot on PC164
Date: Tue, 01 Mar 2016 20:08:28 +0100
Message-ID: <2E8978F7-4F10-44C0-92ED-CADF683B61AE@juergen-bierlein.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1456859365; l=1223;
	s=domk; d=juergen-bierlein.org;
	h=To:Date:From:Subject:Content-Type:Content-Transfer-Encoding:
	MIME-Version;
	bh=TDh/TiO+BSE90u769y9OAh6A5sPb2DREulI68jndbE0=;
	b=k5faUUB9RCtoEW7UCY3INd4PX/rvqP+CrwnHTsoEsgbItwxZVh9/EBqv62MYWoZO59m
	hipy5AOipIU/A5MfaKGE+VDDhexvkIsYbR/ihKFbs/XlrukmqE1QpgGz+jfvyQj1YjnWJ
	8V1oeCZVzL8R3FB2NBvWE/NRbNzpzAqJoXQ=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Hi list,

i compiled the latest 3.14.62 kernel for my PC164 EV56 alpha system. This works without any failures since kernel 3.6.4 and above.
Unfortunately i cannot get the linux kernel 3.18 and above to boot (the latest try today was a 4.4.3 Kernel).

The last entries on the screen are:

###############################################
aboot: Linux/Alpha SRM bootloader version 1.0_pre20040408
aboot: switching to OSF/1 PALcode version 1.23
aboot: booting from device 'IDE 0 11 0 1 1 0 0'
aboot: valid disklabel found: 4 partitions.
aboot: loading compressed vmlinux-4.4.3.gz...
aboot: PHDR 0 vaddr 0xfffffc0001010000 offset 0x2000 size 0xebe3b8
aboot: bss at 0xfffffc0001ece3b8, size 0x179540
aboot: zero-filling 1545536 bytes at 0xfffffc0001ece3b8
aboot: starting kernel vmlinux-4.4.3.gz with arguments ro root=/dev/sda4

halted CPU 0

halt code = 6
double error halt
PC = fffffc00010324e4
boot failure
###############################################

Did i miss a new mandatory kernel config option for alpha or am i the only one with this behaviour ?
Hope you can help me a bit ...

Best regards,
Juergen
-- 
Diese Nachricht wurde von meinem Android-Mobiltelefon mit K-9 Mail gesendet.
