From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [regression] 2.6.25-rc4 snd-es18xx broken on Alpha
Date: Sun, 9 Mar 2008 18:34:25 +0300
Message-ID: <20080309153425.GA1391@jurassic.park.msu.ru>
References: <20080308035828.E9403DBA2@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080308035828.E9403DBA2@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Fri, Mar 07, 2008 at 09:58:28PM -0600, Bob Tracy wrote:
> (1) Using the sox-based "play" command to play a short ".wav" file
>     results in the file being played approx. 1.5 times, i.e., it plays
>     all the way through, then restarts from the beginning and quits
>     somewhere in the middle of the second playback.  At least the
>     sound doesn't seem distorted...
> 
> (2) Using "mpg123" results in silence at first, then after about 30
>     seconds, a tight loop of random repeating sound (doesn't sound like
>     part of the mp3 file, but it's probably derived from it :-)) until
>     the process is forcibly killed.

Sounds like a DMA screwup. However, I'm pretty sure that it's not a
generic ALSA problem with ISA DMA, as my good old GUS MAX still works
perfectly on lx164 (machine that is very similar to your miata) as
I checked yesterday with patched 2.6.25-rc4. :-)

> I have to hit <ctrl>C twice to interrupt playback.
> 
> /proc/asound/cards looks normal:
> 
>  0 [ES1888         ]: ES1888 - ESS AudioDrive ES1888
>                       ESS AudioDrive ES1888 at 0x220, irq 5, dma1 1, dma2 5

I wonder if it still works on x86 - perhaps you ought to ask ALSA folks.
I'll search my machine room next week - I recall that there were a dozen
of old ISA soundcards, maybe there is some es18xx stuff, but chances
are slim...

Ivan.
