#lang racket

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) 
               balance)
        "Insufficient funds"))
  (define (failed amount)
    "Incorrect password")
  (define (deposit amount)
    (set! balance (+ balance amount)))
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'failed) failed)
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  (lambda (x y) 
    (if (eq? password x)
        (dispatch y)
        (dispatch 'failed)
        )))

(define (make-joint account password new-password)
  (lambda (new-pass mode)
    (if (eq? new-pass new-password) 
        (account password mode)
        ("Incorrect password")
        )))