From: Balint Cristian <rezso@rdsor.ro>
Subject: Re: Mounting UFS disks under linux-alpha
Date: Thu, 29 Aug 2002 15:21:44 -0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <200208291521.44807.rezso@rdsor.ro>
References: <Pine.SOL.4.03.10208150929230.22467-100000@norton>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <Pine.SOL.4.03.10208150929230.22467-100000@norton>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "IOS Group, Nottingham" <ios@eee.nottingham.ac.uk>, linux-alpha@vger.kernel.org

  I dont think UFS under linux is so stable (even if it is mountable), 
recomand you to migrate to ext2,3 or reiserfs.
  Is possible to exist multiple version of UFS and yours to be unrecognizable
i dont know.


On Thursday 15 August 2002 04:38, IOS Group, Nottingham wrote:
> Dear List,
>
> I want to mount some tru64 disks on alphas I have
> migrated from tru64 to linux-alpha but I find that
> it is not straight forward.
>
> On one machine the format is ADFS which I don't think
> is supported under linux - is this correct?
>
> On another the format is definitely UFS but I am still
> unable to mount the disk.  (I have got the ufs module
> compiled and loaded into the system).
>
> ---under linux
>
> >> lsmod
>
> Module                  Size  Used by    Not tainted
> ufs                    85600   0  (unused)
> ide-cd                 38688   0  (autoclean)
> cdrom                  39032   0  (autoclean) [ide-cd]
> .......
> ---
>
> --- under tru64
>
> >> cat /etc/fstab
>
> /dev/rz6a        /              ufs rw 1 1
> /proc            /proc  procfs rw 0 0
> /dev/rz6g        /usr   ufs rw 1 2
> /dev/rz6h        /opt   ufs rw 1 2
> etc etc
> ---
>
> When I try to mount any of the ufs partitions I get
>
> mount -v -t ufs /dev/sdb1 /tmp_mnt
> mount: wrong fs type, bad option, bad superblock on /dev/sdb1,
>        or too many mounted file systems
>
>
> Any hints? Is there any way to probe a disk to find out what
> partitions are on it, do I have to load anyhting apart from
> the ufs.o module (do I have to compile it into the kernel
> instead).
>
> Sorry about the lameness of these questions but it is driving
> me mad and I can't find a simple definitive working answer
> in the docs.
>
>
> Thanks SA
>
>
>
>
> ----------------------------------------------------
> 	   No Spam under any circumstances
> ----------------------------------------------------
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-alpha" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

