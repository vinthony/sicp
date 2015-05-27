#lang racket
(display (list 'a 'b 'c)) ;; list(a b c)
(display (list (list 'george))) ;; list(list(geogre))
(display (cdr '((x1 x2) (y1 y2)))) ;; ((y1 y2))
(display (cadr '((x1 x2) (y1 y2)))) ;; (y1 y2)
(display (pair? (car '(a short list)))) ;;#f
(display (memq 'red '((red shoes) (blue shoes))))  ;;#f
(display (memq 'red '(red shoes blue socks))) ;; (red shoes blue socks)