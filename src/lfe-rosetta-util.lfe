(defmodule lfe-rosetta-util
  (export all))

(defun get-lfe-rosetta-version ()
  (lfe-utils:get-app-src-version "src/lfe-rosetta.app.src"))

(defun get-version ()
  (++ (lfe-utils:get-version)
      `(#(lfe-rosetta ,(get-lfe-rosetta-version)))))
