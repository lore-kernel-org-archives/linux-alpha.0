From: Xose Vazquez Perez <xose@wanadoo.es>
Subject: Re:Alpha is alive
Date: Wed, 12 Nov 2003 02:14:01 +0100
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <3FB18959.6090605@wanadoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

Oliver Pitzeier wrote:

> But what for should anyone buy alphas today? If they need 64-bit, they buy Itanium,
> which is cheaper... If they need good performance, they buy a four-way-Xeon-system -
> which _is_ faster than a ES45 for example....

it depends!

A machine is a set of pieces, a faster CPU doesn't guarantee a faster server!
Today HP has the best server out there(alpha), with faster CPU, buses, memory...

stream [1] is a memory bandwidth test:

--cut--
STREAM Memory Bandwidth

All results are in MB/s --- 1 MB=10^6 B, *not* 2^20 B

------------------------------------------------------------------------
Machine ID                      ncpus    COPY    SCALE      ADD    TRIAD
------------------------------------------------------------------------
HP_AlphaServer_GS1280             64 347712.3 341890.6 373126.5 377727.8
HP_AlphaServer_GS1280             32 177662.1 171680.2 186545.2 180608.2
HP_AlphaServer_GS1280             16  92038.0  92038.0 100902.0 100902.0
HP_Integrity_SuperDome            64  82695.0  82476.0  83013.0  84223.0 (MPI Result) Itanium
Sun_F15K                          72  54665.4  47703.7  46090.7  50724.3
HP_AlphaServer_GS1280              8  45203.0  46102.0  51125.0  50384.0
HP_AlphaServer_ES80                8  39898.0  40532.0  44519.0  44467.0
HP_Integrity_SuperDome            32  41336.0  41294.0  41485.0  42188.0 (MPI Result) Itanium
IBM_eServer_p690+                 32  33737.0  33718.0  40198.0  41064.0
IBM_eServer_p690_Turbo            32  28611.0  28994.0  32222.0  32249.0
HP_SuperDome                      64  25230.7  21163.1  26102.1  26717.2
HP_SuperDome_750                  64  25762.3  21769.9  25675.0  26549.2
IBM_eServer_p690_Turbo            32  22431.0  21441.0  24830.0  25501.0
HP_AlphaServer_GS1280              4  22804.0  23030.0  25359.0  25376.0
IBM_eServer_p670+                 16  20412.0  20881.0  25271.0  25368.0
IBM_eServer_p690_HPC              16  20267.0  20265.0  24706.0  25058.0
Compaq_AlphaServer_GS320-1001     32  21176.5  21176.5  22657.4  23309.4
HP_AlphaServer_ES80                4  19933.0  20106.0  22247.0  22105.0
HP_AlphaServer_ES47                4  19933.0  20106.0  22247.0  22105.0
HP_Integrity_SuperDome            16  20701.0  20699.0  20793.0  21113.0 (MPI Result) Itanium
HP_Integrity_rx8620               16  19913.0  19888.0  20118.0  20511.0 Itanium
Compaq_AlphaServer_GS320          32  19592.0  19200.1  21022.0  20425.6
IBM_eServer_p690_HPC              16  17394.0  17066.0  19676.0  20051.0
Unisys_ES7000_Aries_130           16  13381.7  13268.0  14724.4  15681.8 Itanium
Unisys_ES7000_Aries_130            8  13239.0  13230.0  14668.0  15630.0 Itanium
IBM_eServer_p655+_8p               8  12059.0  12072.0  14925.0  15090.0
HP_SuperDome_750                  32  13059.5  12838.3  13526.4  13591.2
HP_SuperDome                      32  12704.8  12735.1  13484.5  13410.1
HP_AlphaServer_GS1280              2  11397.0  11562.0  12680.0  12680.0
Compaq_AlphaServer_GS320-1001     16  10971.5  11034.5  11707.4  12100.9
IBM_eServer_p655+_4p               4   8369.8   8354.5  11914.0  12038.7
IBM_eServer_p655_651B              8  10397.0  10580.0  11239.0  11275.0
IBM_eServer_p655_651A              4   8109.0   8183.0  11004.0  11172.0
HP_AlphaServer_ES80                2   9843.0   9967.0  10986.0  10986.0
HP_AlphaServer_ES47                2   9843.0   9967.0  10986.0  10986.0
HP_Integrity_rx7620                8  10108.0  10052.0  10237.0  10283.0 Itanium
Compaq_AlphaServer_GS160          16   9796.0   9648.3  10549.5  10212.8
Sun_UE_10000_400                  64  12141.6   7970.4   8599.0   8600.4
IBM_eServer_p650_6M2_Linux         8   6108.0   5936.0   7429.0   7588.0
IBM_eServer_p650_6M2               8   6150.0   6110.0   7284.0   7306.0
Sun_UE_10000                      63   6307.0   6391.0   7203.0   7197.0
Sun_UE_10000                      56   6183.0   6304.0   7131.0   7128.0
Sun_UE_10000                      48   5961.0   6056.0   6861.0   6914.0
HP_SuperDome_750                  16   6508.9   6514.8   6844.6   6870.1
HP_SuperDome                      16   6504.6   6482.3   6856.3   6864.3
HP_8400_750                       16   6125.2   6044.2   6541.9   6580.2
HP_AlphaServer_GS1280              1   5816.0   5816.0   6488.0   6345.0
Sun_UE_10000                      40   5317.0   5374.0   6162.0   6222.0
Sun_UE_10000_400                  48  10536.3   4950.3   6336.5   5940.5
Compaq_AlphaServer_GS320-1001      8   5461.6   5358.5   5795.9   5795.9
HP_AlphaServer_ES80                1   5060.0   5060.0   5689.0   5578.0
HP_AlphaServer_ES47                1   5060.0   5060.0   5689.0   5578.0
IBM_eServer_p680                  24   4835.0   4735.0   5350.0   5313.0
Sun_UE_10000                      32   4397.0   4408.0   5166.0   5188.0
HP_Integrity_rx7620                4   5067.0   5039.0   5120.0   5149.0 Itanium
Compaq_AlphaServer_GS80            8   4898.0   4800.0   5255.5   5133.7
Sun_UE_10000                      24   3568.0   3577.0   4292.0   4305.0
Sun_UE_10000_400                  32   6933.0   3556.6   4312.8   4032.0
HP_rx2600                          1   3453.0   3453.1   4020.4   4027.8 Itanium
HP_V2500                          32   3934.3   4193.3   3926.3   4027.5
HP_V2600_Enterprise               32   3993.9   4139.0   3544.0   3898.3
IBM_SP-PWR3smp-High-222            8   2954.1   2821.0   3889.0   3872.2
HP_V2600_Technical                16   4093.7   4209.4   3663.1   3706.8
Compaq_AlphaServer_ES45-68/1000    4   3486.7   3486.7   3526.8   3583.8
ION_I2X2                           2   3120.2   3112.7   3523.5   3534.8 Itanium
ION_I2X2                           1   2978.6   3004.0   3419.8   3425.7 Itanium
HP_8400_750                        8   3053.8   3049.0   3308.0   3325.3
...
Dell_PowerEdge400SC                1   2315.0   2323.0   2652.0   2624.0 Intel P4 2.4
RackSaverRS1100                    1   1798.0   1818.0   2162.0   2162.0 Opteron 244
...
---end--

ALPHA servers win clearly, behind them are IBM_PPC and Intel_IA64, and very very far
Sun_UltraSPARC and HP_PA-RISC.

[1] http://www.cs.virginia.edu/stream/
--
HTML mails are going to trash automagically

