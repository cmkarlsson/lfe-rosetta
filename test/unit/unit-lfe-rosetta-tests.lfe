(defmodule unit-lfe-rosetta-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest my-adder
  (is-equal 4 (: lfe-rosetta my-adder 2 2)))

(deftest palindrom
  (is-equal 'true (: palindrom-detection palindrom? "amanaplanacanalpanama"))
  (is-equal 'false (: palindrom-detection palindrom? "idon'tthinkso")))

(deftest palindrom-case-space
  (is-equal 'true (: palindrom-detection palindrom? "A man a plan a canal Panama"))
  (is-equal 'false (: palindrom-detection palindrom? "Working nine to five")))
