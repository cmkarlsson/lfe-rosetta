;; Old Lady Swallowed a fly

(defmodule old-lady
  (export all))


  (defun sing ()
      (let ((animals '(#(fly "Perhaps she'll die.")
                       #(spider "It wiggled and jiggled and ticked inside her.")
                       #(bird "How absurd.")
                       #(cat "Imagine that.")
                       #(dog "What a hog.")
                       #(goat "She just opened her throat.")
                       #(snake "For goodness sake!")
                       #(cow "I don't know how.")
                       #(horse "She's dead, of course."))))
        (sing-about animals)))

  (defun sing-about (animals)
    (sing-about animals '()))

  (defun sing-about 
     (((list (tuple animal phrase)) acc)
      ;; Last animal is special
       (io:format "There was on old lady who swallowed a ~s~n-- ~s~n"
         (list (atom_to_list animal) phrase))
       'the-end)
     (((cons (tuple animal phrase) xs) '())
      ;; First animal is special
       (io:format "There was on old lady who swallowed a ~s~n-- ~s~n~n"
         (list (atom_to_list animal) phrase))
       (sing-about xs (cons animal '())))
     (((cons (tuple animal phrase) xs) acc)
       (io:format "There was on old lady who swallowed a ~s~n-- ~s~n"
         (list (atom_to_list animal) phrase))
       (sing-catcher animal acc)
       (sing-about xs (cons animal acc)))
       )

  (defun sing-catcher
    ((_ '())
      (io:format "I don't know why she swallowed the fly~n-- Perhaps she'll die~n~n"))
    ((animal (cons next xs))
       (io:format "She swallowed the ~s to catch the ~s!~n" (list animal next))
       (sing-catcher next xs)))
