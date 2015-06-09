#lang planet neil/sicp
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (partial-tree elts n)
  (if (= n 0) 
      (cons '() elts) ;; 如果没有元素 返回 空树
      (let ((left-size (quotient (- n 1) 2))) ;; (n-1)/2 左子树的大小
        (let ((left-result (partial-tree elts left-size))) ;; 左子树 cons
          (let ((left-tree (car left-result)) ;; 左子树
                (non-left-elts (cdr left-result)) ;; 除了左子树
                (right-size (- n (+ left-size 1)))) ;; 右子树 n- (left-size +1)
            (let ((this-entry (car non-left-elts)) ;; parent 节点
                  (right-result (partial-tree (cdr non-left-elts) right-size))) ;; 右子树 cons
              (let ((right-tree (car right-result)) ;; 右子树
                    (remaining-elts (cdr right-result))) ;;剩余的elements
                (cons (make-tree this-entry left-tree right-tree) ;; 合成 
                      remaining-elts))))
          )
        )
      ))
(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((> x (entry set)) (element-of-set? x (right-branch set)))
        ((< x (entry set)) (element-of-set? x (left-branch set)))
        ))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((> x (entry set) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set)))))
        ((< x (entry set) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
        )))

(define (tree->list-1 tree)
  (if (null? tree) '() 
      (append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree) (cons (entry tree) (copy-to-list (right-branch tree) result-list)))
        ))
  (copy-to-list tree '()))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2)) '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) set2)))
              ((< x1 x2) (intersection-set (cdr set1) set2))
              ((> x1 x2) (intersection-set set1 (cdr set2)))
        ))))
(define (union-set set1 set2)
  (cond ((null? set1) set2) 
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2))) 
                (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                      ((> x1 x2) (union-set set1 (cdr set2)))
                      ))
                ))
        )


(define (union-set-tree  tree1 tree2)
  (tree->list-2 (union-set (list->tree tree1) (list->tree tree2))))
(define (intersection-tree tree1 tree2)
  (tree->list-2 (intersection-tree (list->tree tree1 tree2))))