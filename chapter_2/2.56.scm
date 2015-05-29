#lang planet neil/sicp
(define (variable? e)(symbol? e))
(define (same-variable? x y)(and (variable? x) (variable? y) (eq? x y)))
(define (=number? a b)
  (and (number? a) (= a b)))
(define (make-sum x y) 
  (cond ((=number? x 0) y)
        ((=number? y 0) x)
        ((and (number? x) (number? y)) (+ x y))
        (else (list '+ x y))
        ))
(define (make-product x y) 
  (cond ((or (=number? x 0) (=number? y 0)) 0)
        ((=number? x 1) y)
        ((=number? y 1) x)
        ((and (number? x) (number? y)) (* x y))
        (else (list '* x y))
        ))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augadd s) (caddr s))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))
(define (exponentiation? m)
  (and (pair? m) (eq? (car m) '**)))
(define (make-exponentiation base exp)
  (cond ((=number? base 0) 1)
        ((=number? exp 1) base)
        (else (list '** base exp))
        )
  )
(define (base m)
  (cadr m))
(define (exponent m)
  (caddr m))
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augadd exp) var)))
        ((product? exp)
         (make-sum (make-product (multiplier exp)
                                 (deriv (multiplicand exp) var))
                   (make-product (deriv (multiplier exp) var)
                                 (multiplicand exp))
                   ))
        ((exponentiation? exp)
         (make-product 
          (make-product (exponent exp) (make-exponentiation (base exp) (- (exponent exp) 1))) (deriv (base exp) var)))
        (else
         (error "unknow expression type -- DERIV" exp))
        ))
(display (deriv '(** x 3 2) 'x))