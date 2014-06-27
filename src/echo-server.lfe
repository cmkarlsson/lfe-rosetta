;; File: echo-server.lfe
;; Author: Martin Karlsson
;; This echo-server is a translation from the erlang echo-server rosetta code
;;
;; Use it from shell:
;; (apply 'echo-server 'start '())
;; Then telnet to it
;; $ telnet localhost 12321
;; Hello?
;; Hello?

(defmodule echo-server
   (export (start 0)
           (start 1)
           (handle-tcp 1)
   ))

(defun start ()
  ;; Start on default port
  (start 12321))

(defun start (port)
  ;; Start server on port
  (spawn
    (lambda ()
      (let (((tuple 'ok socket) (gen_tcp:listen port '(#(packet line)))))
        (loop socket))
        )))

(defun loop (socket)
  ;; Accept connections; spawning handlers for each connection
  (let (((tuple 'ok conn) (gen_tcp:accept socket)))
    (io:format "info: received connection (~p)~n" (list conn))
    (let ((spawned-pid (spawn 'echo-server 'handle-tcp '(conn))))
      (gen_tcp:controlling_process conn spawned-pid)
      (loop socket)
      )))

(defun handle-tcp (conn)
  ;; Handles the tcp connection and echos back the data
  ;; sent from the user to the user
 (receive
  ((tuple 'tcp conn data)
   (gen_tcp:send conn data)
   (handle-tcp conn))
  ((tuple 'tcp_closed conn)
   (io:format "info: connection closed (~p)~n" (list conn)))
   ))
