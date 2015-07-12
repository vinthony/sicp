#lang racket
(require "huffman.scm")
(define sample-tree '(('A 2) ('BOOM 1) ('NA 16) ('SHA 3) ('GET 3) ('YIP 9) ('JOB 2) ('WAH 1)))
(define message '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))
(define (successive-merge ordered-set)
 (cond ((= (length ordered-set) 0) '())
       ((= (length ordered-set) 1) (car ordered-set))
       (else (successive-merge (adjoin-set 
                                (make-code-tree (car ordered-set) (cadr ordered-set)) 
                                (cddr ordered-set))
                               ))
       ))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
;;(generate-huffman-tree sample-tree)
(provide generate-huffman-tree)