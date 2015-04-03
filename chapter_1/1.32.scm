#lang planet neil/sicp
;;1.32
;;递归版本 accumulate
(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value 
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))
;;迭代版本
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))
        ))
  (iter a (combiner a null-value))
  )

;;product
(define (product term a next b)
  (accumulate * 1 term a next b))
;;product-iter
(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))
(define (square x)(* x x))
(define (inc x) (+ x 1))
(product square 1 inc 10)
(product-iter square 1 inc 10)
