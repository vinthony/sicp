#lang racket

(require "huffman.scm")
;;     ___________ 
;;     |         |   
;;   A(4)    ____|_____ 
;;           |        |
;;         B(2)       |
;;                 ___|___
;;               D(1)   C(1)
;;
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;;(decode sample-message sample-tree)