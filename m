From: Riccardo Vestrini <riccardov@sssup.it>
Subject: Re: 2.4.27, alpha arch, make bootimage and make bootpfile fails
Date: Mon, 18 Oct 2004 20:26:00 +0200
Message-ID: <41740AB8.50209@sssup.it>
References: <20041012173344.GA21846@gamma.logic.tuwien.ac.at> <20041013233247.A11663@jurassic.park.msu.ru> <20041014130035.GA4152@gamma.logic.tuwien.ac.at> <yw1xis9d8b9b.fsf@ford.guide> <20041015103914.GA24800@gamma.logic.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
In-Reply-To: <20041015103914.GA24800@gamma.logic.tuwien.ac.at>
Resent-Message-ID: <JL4dTD.A.PZE.jrAdBB@murphy>
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-alpha/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Norbert Preining <preining@logic.at>
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Norbert Preining wrote:

> On Don, 14 Okt 2004, M=E5ns Rullg=E5rd wrote:
>=20
>>>Loading the kernel...'root=3D/dev/sda1'
>>>
>>>Halted CPU 0
>>>
>>>halt code =3D 2
>>>kernel stack not valid halt
>>>PC =3D 200000000
>>>boot failure
>>
>>Try building more things as modules instead of builtin, if possible.
>=20
> I have reduced the whole kernel zo more or less nothing included,
> besides the SCSI drivers, and the same still happens.=20
>=20
some month ago I also incurred in this problem, try creating an image=20
with  "make bootpzfile" smaller than 960KB

that is the exact error I encountered while netbooting a 500au=20
workstation, the bigger image I was able to build was 953KB with a 2.6.7=20
kernel

that was the .config :
CONFIG_64BIT=3Dy
CONFIG_ALPHA_CIA=3Dy
CONFIG_ALPHA_EV56=3Dy
CONFIG_ALPHA_EV5=3Dy
CONFIG_ALPHA_LEGACY_START_ADDRESS=3Dy
CONFIG_ALPHA_MIATA=3Dy
CONFIG_ALPHA_PYXIS=3Dy
CONFIG_ALPHA_SRM=3Dy
CONFIG_ALPHA=3Dy
CONFIG_BINFMT_ELF=3Dy
CONFIG_BINFMT_MISC=3Dm
CONFIG_BLK_DEV_FD=3Dm
CONFIG_BLK_DEV_SD=3Dm
CONFIG_BROKEN_ON_SMP=3Dy
CONFIG_BSD_DISKLABEL=3Dy
CONFIG_BSD_PROCESS_ACCT=3Dy
CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
CONFIG_CLEAN_COMPILE=3Dy
CONFIG_CRC32=3Dy
CONFIG_DE4X5=3Dy
CONFIG_DEBUG_KERNEL=3Dy
CONFIG_DUMMY_CONSOLE=3Dy
CONFIG_EARLY_PRINTK=3Dy
CONFIG_EMBEDDED=3Dy
CONFIG_EPOLL=3Dy
CONFIG_EXPERIMENTAL=3Dy
CONFIG_FUTEX=3Dy
CONFIG_GENERIC_ISA_DMA=3Dy
CONFIG_HW_CONSOLE=3Dy
CONFIG_INET=3Dy
CONFIG_INPUT_KEYBOARD=3Dy
CONFIG_INPUT=3Dy
CONFIG_IOSCHED_DEADLINE=3Dy
CONFIG_IOSCHED_NOOP=3Dy
CONFIG_IP_PNP_DHCP=3Dy
CONFIG_IP_PNP=3Dy
CONFIG_ISA=3Dy
CONFIG_KEYBOARD_ATKBD=3Dm
CONFIG_KMOD=3Dy
CONFIG_LOCKD_V4=3Dy
CONFIG_LOCKD=3Dy
CONFIG_LOG_BUF_SHIFT=3D14
CONFIG_MATHEMU=3Dy
CONFIG_MMU=3Dy
CONFIG_MODULE_FORCE_UNLOAD=3Dy
CONFIG_MODULES=3Dy
CONFIG_MODULE_UNLOAD=3Dy
CONFIG_MSDOS_PARTITION=3Dy
CONFIG_NETDEVICES=3Dy
CONFIG_NET_ETHERNET=3Dy
CONFIG_NETLINK_DEV=3Dy
CONFIG_NET_TULIP=3Dy
CONFIG_NET=3Dy
CONFIG_NFS_FS=3Dy
CONFIG_NFS_V3=3Dy
CONFIG_OBSOLETE_MODPARM=3Dy
CONFIG_OSF_PARTITION=3Dy
CONFIG_PACKET_MMAP=3Dy
CONFIG_PACKET=3Dy
CONFIG_PARTITION_ADVANCED=3Dy
CONFIG_PCI_DOMAINS=3Dy
CONFIG_PCI=3Dy
CONFIG_PNP=3Dy
CONFIG_POSIX_MQUEUE=3Dy
CONFIG_PROC_FS=3Dy
CONFIG_PROC_KCORE=3Dy
CONFIG_QUOTACTL=3Dy
CONFIG_RAMFS=3Dy
CONFIG_ROOT_NFS=3Dy
CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
CONFIG_SCSI=3Dm
CONFIG_SCSI_QLOGIC_ISP=3Dm
CONFIG_SERIO_I8042=3Dm
CONFIG_SERIO=3Dm
CONFIG_SOUND_GAMEPORT=3Dy
CONFIG_STANDALONE=3Dy
CONFIG_SUNRPC=3Dy
CONFIG_SWAP=3Dy
CONFIG_SYSCTL=3Dy
CONFIG_SYSFS=3Dy
CONFIG_SYSVIPC=3Dy
CONFIG_TMPFS=3Dy
CONFIG_UNIX98_PTYS=3Dy
CONFIG_UNIX=3Dy
CONFIG_VGA_CONSOLE=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_VT=3Dy
CONFIG_XFS_FS=3Dm
CONFIG_XFS_POSIX_ACL=3Dy
CONFIG_XFS_QUOTA=3Dy
CONFIG_XFS_RT=3Dy
CONFIG_XFS_SECURITY=3Dy


--=20
To UNSUBSCRIBE, email to debian-alpha-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

