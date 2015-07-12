#lang racket
(require "huffman.scm")
(require "2.68.scm")
(require "2.69.scm")
(define sample-tree (list (list 'A 1) (list 'BOOM 1) (list 'NA 16) (list 'SHA 3) (list 'GET 3) (list 'YIP 9) (list 'JOB 2) (list 'WAH 1)))
(define message '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))
(length (encode message (generate-huffman-tree sample-tree)))

;;如果采用定长编码，一共8个符号，最少编码位数为3 ，故产生的编码长度为3*（3+9+3+9+10+2） = 108