 #lang planet neil/sicp
(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)))

(define (ripple-carry-adder a b s c-out)
  (define (iter a b c sum)
    (if (and (null? a) (null? b) (null? c))
        'ok
    (let ((signal-a (car a))
          (signal-b (car b))
          (signal-s (car s))
          (remained-a (cdr a))
          (remained-b (cdr b))
          (remained-s (cdr s))
          (ck (make-wire)))
      (set-signal! ck c)
      (full-adder signal-a signal-b ck signal-s c-out)
      (iter remained-a remained-b remained-s (get-signal c))
          )))
  (iter a b s (get-signal c))
 )

;ripple-carry-adder-delay 的值为三个 or-gate-delay 、两个 inveter-delay 和四个 and-gate-delay 之和