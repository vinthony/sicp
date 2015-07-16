 #lang planet neil/sicp
(define (loop? lst)
  (let ((identify (cons '() '())))
    (define (iter remain-lst)
      (cond ((null? remain-lst) #f)
            ((eq? (car remain-lst) identify) #t)
            (else 
             (set-car! remain-lst identify)
             (iter (cdr remain-lst)))
            )
    )
    (iter lst)))