;; Palindrom Detection

(defmodule palindrom-detection
  (export (palindrom 1)))

(defun palindrom? (s)
  (cond
    ((== (: lists reverse s) s)
      'true)
    ((/= (: lists reverse s) s)
      'false)))
