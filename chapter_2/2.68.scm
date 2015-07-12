#lang racket
(require "huffman.scm")
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1)))))
(define sample-message '(A D A B B C A))

(define (contain tree leaf) ;;判断在哪个分支
  (define (iter symbol-list leaf)
    (if (null? symbol-list)
        #f
        (if (eq? (car symbol-list) leaf)
            #t
            (iter (cdr symbol-list) leaf)
        )))
  (iter (symbols tree) leaf))

(define (encode-symbol character tree)
  (define (encode-iter character tree symbol-list)
    (if (null? tree)
      '()
      (if (leaf? tree)
          symbol-list
          (cond ((contain (left-branch tree) character) (encode-iter character (left-branch tree) (append symbol-list (list 0))))
                ((contain (right-branch tree) character) (encode-iter character (right-branch tree) (append symbol-list (list 1))))
                (else (error "ERROR OF CHARACTER" character))
              ))))
  (encode-iter character tree '())
  )

(define (encode message tree) ;; 输入消息和树 完成编码
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
(encode sample-message sample-tree)

(provide encode)