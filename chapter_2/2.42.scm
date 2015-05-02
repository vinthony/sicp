#lang planet neil/sicp
;;生成list [r,b]
(define (enumerate-interval r b)
  (if (or (< r b) (= r b))(cons r (enumerate-interval (+ 1 r) b))
      '()
      ))
(display (enumerate-interval 1 10))
(newline)
;; reduce过程
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))
          )
      ))

;;map之后将所有的item push进list
(define (flatmap proc seq) 
  (accumulate append nil (map proc seq)))

(define empty-board '())

;;过滤器
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))
        ))

;;增加新的行到原来的数据中
(define (adjoin-position new-row k rest-of-queens) 
  (cons new-row rest-of-queens))

;; 得到alist[item]
(define (get alist item)
  (cond 
    ((null? alist) 0)
    ((= item 0) (car alist))
        (else 
         (get (cdr alist) (- item 1)))
      ))
(get (list 1 2 3 4 5) 1)
(newline)
;;保证第k个相对于其他皇后安全
(define (safe? k pos-list)
  (define (safe-iter new-row rest-of-queens i)
    (if (null? rest-of-queens)
        true
        (let ((row-of-current-queen (car rest-of-queens)))
          (if (or (= row-of-current-queen new-row)
                  (= new-row (+ i row-of-current-queen))
                  (= new-row (- row-of-current-queen i)))
              false
              (safe-iter new-row (cdr rest-of-queens) (+ i 1))
              )
          )
        ))
  (safe-iter (car pos-list) (cdr pos-list) 1)
  )

;;;useless
;(define (safe? k pos-list);;保证第k个相对于其他皇后安全
;  (define (safe-iter i)
;    (cond 
;      ((or (= i 0) (< i 0)) true)
;      ((= (get pos-list i) (get pos-list k)) false) ;; 行
;          ((= (+ (get pos-list i) i) (+ (get pos-list k) k)) false) ;;对角线
;          
;          (else (safe-iter (- i 1)))
;        ))
;  (safe-iter (- k 1))
;  )

(define (queens board-size)
  (define (queen-cols k) ;; 返回在棋盘的前K列中放皇后的所有解的序列
    (if (= k 0)
        (list empty-board)
        (filter ;;过滤不安全的list 
         (lambda (positions) (safe? k positions))
         (flatmap ;; 生成当前k的list
          (lambda (rest-of-queens)
            (map (lambda (new-row) 
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size))) ;; (list 1...8)
          (queen-cols (- k 1))))))
 (queen-cols board-size))

;(safe? 2 (list 1 2))
(display (queens 8))