#lang racket

(define balance 100)
(define (withdraw amount)
  (if (>= balance amount) 
      (begin (set! balance (- balance amount)) balance)
      "Insufficient funds"
      ))
(withdraw 25)
(withdraw 25)
(withdraw 25)
(withdraw 60)

;; new withdraw

(define new-withdraw
 (let ((balance 100))
   (lambda (amount) 
     (if (>= balance amount)
         (begin (set! balance (- balance amount)) balance)
         "Insufficient funds"))))

(new-withdraw 25)
(new-withdraw 25)
(new-withdraw 25)
(new-withdraw 60)


(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds")))

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))
(W1 50)
(W2 70)




;; 3.1

(define (make-accumulator init)
  (lambda (s) (begin (set! init (+ init s)) init)))
(display "3.1\n")
(define A (make-accumulator 5))
(A 10)
(A 10)