From: "Arnd Bergmann" <arnd@arndb.de>
Subject: [GIT PULL] asm-generic: arch/alpha regression fix for 6.1
Date: Fri, 14 Oct 2022 22:35:44 +0200
Message-ID: <796854e9-ccbb-4dc1-aec6-bf3461d9d813@app.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1665779765; x=1665866165; bh=cgminPofg1RLj9BxqHFC5hOgaw0qxKHmXer
        u9UifK8U=; b=Rz9PM/oHl/cDGtURC4z7HWomZI3JSg2jtSA2E7qnpFfUTcPO4rk
        GwxfMcR83vsvOH7u5ZkDlm5sdjfAPR7Z4rXB7QNElcPD3ik+1wNFTvoJOZa+Af2r
        kWaY05mkn/RFMQlcQ0A8HGMynttqEfiDan0UXKt8x3aQ+eOQbswrHdcfv4+xmUrm
        FFxV4uwaLdHhSqS6nEbm8F6hPBfikXFqkY5hCIgWoSZF17BO6vBDbpxP8j13jQ9E
        0Iq3uEssZhoRzQ0pZ12PxfJlvRX8+UK9a0yl8+CD2Gd7u+8oAfq8AO5kLzqUZ+c2
        j1zG+k27kgr8eQnr45eoklRTr9ewjpkK6PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665779765; x=
        1665866165; bh=cgminPofg1RLj9BxqHFC5hOgaw0qxKHmXeru9UifK8U=; b=O
        8aYNMEt6AISbzZRHNYmTYCVpRUvad6zg8iBIa/jtnft2bnqosS9NhOeTamUSoR+v
        TR2MOpW6OWq/4p7Y+hHe8qXEYFZlB/M/R15RFgXsw5Jm6cWzN1dtHJy6zVLDh+V/
        iO8J5OqH37CZlSmQeYmP6brlLR6STonjdCHhv8yllBlM1MEiEfYIU+WX/+d4yR4b
        FqSOZ7Izaf2uwzPKKB5pG8eGIVX1IBnEGzFyYpJ4l10TmvDbHnCNBGkQwed3gtPs
        THVnXqQ240FkZXUnpMYVzQeiqk+qPR+9jp5ceK1us8GmZyA6Tm3wYLQY7O8mzDoU
        4O4xDzOJx2fT8V/DeCtfQ==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>

The following changes since commit e19d4ebc536dadb607fe305fdaf48218d3e32d7c:

  alpha: add full ioread64/iowrite64 implementation (2022-10-04 11:23:29 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git asm-generic-fixes-6.1-1

for you to fetch changes up to 2e21c1575208786f667cb66d8cf87a52160b81db:

  alpha: fix marvel_ioread8 build regression (2022-10-10 10:33:55 +0200)

----------------------------------------------------------------
asm-generic: arch/alpha regression fix for 6.1

A last-minute regression fix in the previous asm-generic
branch contained a new regression from a typo.

----------------------------------------------------------------
Arnd Bergmann (1):
      alpha: fix marvel_ioread8 build regression

 arch/alpha/kernel/core_marvel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
