#lang planet neil/sicp
;;integral
(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
         (sum term (next a) next b))))
(define (cube x) (* x x x))
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)  
    )
(integral cube 0 1 0.01)
;;1.29 辛普森规则

(define (sum-cube a b)
  (define (inc x) (+ x 1))
  (sum cube a inc b))
(define (simpson f a b n)
  (define h (/ (- b a) n)) ;; define h
  (define (y k)(f (+ a (* k h)))) ;; define yk
  (define (simpson-term x)  
    (cond 
      ((or (= x 0) (= x n)) (y x))
      ((even? x) (* 4 (y x)))
      ((odd? x) (* 2 (y x)))
      ))
   (define (simpson-next k)
     (+ k 1))
  (* h (/ (sum simpson-term 0 simpson-next n) 3.0))
 )
(simpson cube 0 1 1000)