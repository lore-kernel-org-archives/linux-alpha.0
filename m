From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 128/199] arch/alpha/math-emu/qrnnd.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:22 +0200
Message-ID: <1274644466-24577-20-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=SfSHeJvOkYM2kGRSha/jyIsxrUlxx0bThEXwXugzinA=;
        b=VLTJ5hVvdenLahsY49NkPyzghjipwDryRiBapGqzaMmXxyXCqMJvwP2Eo0xrfNZZNx
         K+FvpQeA3NO6cEHyTDy/dg6saxz+hIFAjGd5jSjDFqthCVpQg7Lya/3et1mleNkEUYc+
         lWVh7DSg44NuWGKcq8grX4l3FpQO67F/8WSlU=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/math-emu/qrnnd.S:25: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/math-emu/qrnnd.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/math-emu/qrnnd.S b/arch/alpha/math-emu/qrnnd.S
index d6373ec..6aab90f 100644
--- a/arch/alpha/math-emu/qrnnd.S
+++ b/arch/alpha/math-emu/qrnnd.S
@@ -22,7 +22,7 @@
  # License for more details.
 
  # You should have received a copy of the GNU General Public License
- # along with GCC; see the file COPYING.  If not, write to the 
+ # along with GCC; see the file COPYING.  If not, write to the
  # Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
  # MA 02111-1307, USA.
 
-- 
1.7.1.251.gf80a2

