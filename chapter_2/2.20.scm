#lang planet neil/sicp
(define (same-parity x . z)
  (define (s-p-iter relist z)
    (cond 
      ((null? z) relist)
      ((or (and (odd? x) (odd? (car z))) (and (even? x) (even? (car z))))
       (s-p-iter (cons (car z) relist) (cdr z)))
          (else (s-p-iter relist (cdr z)))
        )
  )
  (s-p-iter '() z)
)
(same-parity 2 1 2 3 4 5 6 7 8)