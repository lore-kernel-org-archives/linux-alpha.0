From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: >=gcc-4.5.0 failing to compile with --disable-checking
Date: Sun, 27 Jun 2010 21:09:51 +0200
Message-ID: <4C27A1FF.8090804@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Uros Bizjak <ubizjak@gmail.com>
Cc: alpha@gentoo.org, linux-alpha@vger.kernel.org

Hi Uros,

Using latest trunk, with:
../configure --host=alpha-unknown-linux-gnu
--build=alpha-unknown-linux-gnu --enable-languages=c --disable-checking

and

make -j5 bootstrap-lean

Fails with the following error:

make[3]: Entering directory `/root/gcc/trunk/build'
rm -f stage_current
make[3]: Leaving directory `/root/gcc/trunk/build'
Comparing stages 2 and 3
warning: gcc/cc1-checksum.o differs
Bootstrap comparison failure!
gcc/cgraph.o differs
gcc/pretty-print.o differs
gcc/real.o differs
gcc/dwarf2out.o differs
gcc/gimple-low.o differs
gcc/tree-vect-stmts.o differs
gcc/combine.o differs
gcc/tree-cfg.o differs
gcc/ira-build.o differs
gcc/dominance.o differs
gcc/sched-ebb.o differs
gcc/tree-ssa-structalias.o differs
gcc/df-scan.o differs
gcc/dfp.o differs
gcc/alpha.o differs
gcc/cfgloopmanip.o differs
gcc/tree-vrp.o differs
gcc/dwarf2asm.o differs
gcc/c-family/c-format.o differs
gcc/c-family/c-omp.o differs
gcc/c-family/c-pragma.o differs
gcc/c-family/c-common.o differs
gcc/alias.o differs
gcc/lto-cgraph.o differs
gcc/var-tracking.o differs
gcc/tree-ssa-reassoc.o differs
gcc/sched-rgn.o differs
gcc/tree-into-ssa.o differs
gcc/tree-ssa-threadedge.o differs
gcc/tree-vect-loop.o differs
gcc/ira-color.o differs
gcc/tree-ssa-loop-ivopts.o differs
gcc/tree-eh.o differs
gcc/c-typeck.o differs
gcc/graphds.o differs
gcc/build/genautomata.o differs
gcc/build/genemit.o differs
gcc/c-parser.o differs
gcc/tree-inline.o differs
gcc/lambda-mat.o differs
gcc/tree-ssa-copy.o differs
gcc/lto-streamer.o differs
gcc/omega.o differs
gcc/loop-iv.o differs
gcc/recog.o differs
gcc/lto-streamer-out.o differs
gcc/cfgexpand.o differs
gcc/loop-invariant.o differs
gcc/loop-unroll.o differs
gcc/reginfo.o differs
gcc/cfghooks.o differs
gcc/passes.o differs
gcc/tree-ssa-operands.o differs
gcc/cse.o differs
gcc/tree-sra.o differs
gcc/emit-rtl.o differs
gcc/sbitmap.o differs
gcc/optabs.o differs
gcc/lto-section-in.o differs
gcc/expr.o differs
gcc/ipa-cp.o differs
gcc/gcse.o differs
gcc/langhooks.o differs
gcc/gimple.o differs
gcc/sparseset.o differs
gcc/cfglayout.o differs
gcc/stor-layout.o differs
gcc/df-problems.o differs
gcc/ddg.o differs
gcc/final.o differs
gcc/tree-ssa-dom.o differs
gcc/ipa.o differs
gcc/cfg.o differs
gcc/sel-sched.o differs
gcc/gimple-fold.o differs
gcc/tree-vect-slp.o differs
gcc/gimplify.o differs
gcc/function.o differs
gcc/sese.o differs
gcc/cfgrtl.o differs
gcc/omp-low.o differs
gcc/simplify-rtx.o differs
gcc/tree-ssa-forwprop.o differs
gcc/tree-ssa-ccp.o differs
gcc/varasm.o differs
gcc/calls.o differs
gcc/sched-deps.o differs
gcc/lto-symtab.o differs
gcc/tree-ssa-loop-im.o differs
gcc/cselib.o differs
gcc/builtins.o differs
gcc/except.o differs
gcc/c-decl.o differs
gcc/haifa-sched.o differs
gcc/tree.o differs
gcc/expmed.o differs
gcc/tree-tailcall.o differs
gcc/tree-ssa-sccvn.o differs
gcc/tree-dfa.o differs
gcc/df-core.o differs
gcc/ipa-inline.o differs
gcc/varpool.o differs
gcc/tree-data-ref.o differs
gcc/sel-sched-ir.o differs
gcc/lambda-code.o differs
gcc/params.o differs
gcc/resource.o differs
make[2]: *** [compare] Error 1
make[2]: Leaving directory `/root/gcc/trunk/build'
make[1]: *** [stage3-bubble] Error 2
make[1]: Leaving directory `/root/gcc/trunk/build'
make: *** [bootstrap-lean] Error 2

Have you hit this problem?

Thanks
