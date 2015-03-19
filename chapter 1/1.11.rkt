#lang planet neil/sicp

;递归过程
(define (pro n) 
  (if (< n 3) n (+(pro (- n 1)) (* 2 (pro (- n 2))) (* 3 (pro (- n 3))))))

(pro 10)

;迭代过程
(define (pro2 n)
  (pro2-iter 2 1 0 3 n))
(define (pro2-iter fn-1 fn-2 fn-3 count max-count)
  (cond ((< max-count 3) max-count)
        ((or (> count max-count) (= count max-count)) (+ fn-1 (* 2 fn-2) (* 3 fn-3)))
        ((< count max-count) (pro2-iter (+ fn-1 (* 2 fn-2) (* 3 fn-3)) fn-1 fn-2 (+ count 1) max-count))
        ))

(pro2 10)