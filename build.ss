#!/usr/bin/env gxi

(import :std/make :std/build-script)


(def ldflags (env-ldflags))
(def cppflags (env-cppflags))

(defbuild-script `((gxc:"cmark-gfm" "-ld-options" ,(ldflags "-lcmark-gfm") "-cc-options" ,(cppflags ""))))
