From: Ryan Kirkpatrick <linux@rkirkpat.net>
Subject: XLT366 Memory Compatiblity...
Date: Tue, 8 Jun 2004 05:46:54 -0600 (MDT)
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0406080536550.13212-100000@magellan.rkirkpat.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org

I recently purchased 16 identical 64MB SIMMs off of eBay for a pair of
XLT366s. These SIMMs have 36 chips, labeled 'HY5116100BT-6', which I
surmise are 60ns (from the '-6'), and a google search found they were
16Mbit in size. The SIMMs are parity (from the chip count). There is also
a sticker on one of chips that has '3163667/23BT S023039 64MB'. I was told
they came out of a Compaq Proliant server (don't know the model). All of
this seems to indicate they _should_ be compatible with the XLTs.

One XLT366 is able to post AlpahBIOS with either four or eight of these
SIMMs installed, and the memory count is either 256MB or 512MB
respectively. Yet, when I boot Linux, I get an endless stream of ECC
errors and corrections, slowing the system down so badly Linux is never
able to fully boot. AlphaBIOS version is 5.66.

The other XLT366 is only able to post AlphaBIOS with eight SIMMs
installed, only four results in a rapid sequence of beeps. Furthermore,
the memory count for all eight SIMMs is only 256MB, yet Linux is able to
boot and runs just fine, no ECC errors. AlphaBIOS version is 5.66.

I had always thought these two XLT366s were identical, but I noticed that
at least the memory retention clips are slightly different between the two
(one's are all plastic, other has metal clips). I also swapped SIMMs
between these two systems without any change to behavior.

Lastly, I tested them in a Sparc LX (which also takes 72pin parity
SIMMs). I installed the maximum of six SIMMs (384MB), and it was able to
see the maximum 96MB it supports. Furthermore it was able to boot and run
Linux without issue. It appears that as long as the SIMMs are not fully
utilized they work fine. When fully utilized, they just don't work.

Anyone have any clue what is going on here? I would very much like to have
my pair of XLT366s running with 512MB of RAM each. Am I missing something?
Is the memory incompatible (and if so, what memory is compatible)? Or is
the memory just plain bad? Thanks!

---------------------------------------------------------------------------
|   "For to me to live is Christ, and to die is gain."                    |
|                                            --- Philippians 1:21 (KJV)   |
---------------------------------------------------------------------------
|   Ryan Kirkpatrick  |  Boulder, Colorado  |  http://www.rkirkpat.net/   |
---------------------------------------------------------------------------




