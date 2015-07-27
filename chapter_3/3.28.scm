 #lang planet neil/sicp
(define (logical-or s1 s2)
  (cond ((and (= s1 0) (= s1 0)) 0)
        ((or (and (= s1 0) (= s2 1)) (and (= s1 1) (= s2 1)) (and (= s1 1) (= s2 0))) 1)
        (else (error "INVALID SIGNAL!" s1 s2))))

(define (or-gate a1 a2 output)
  (define (or-action-produce)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-deplay (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-produce)
  (add-action! a2 or-action-produce)
  'ok)