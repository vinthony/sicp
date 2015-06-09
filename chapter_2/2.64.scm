#lang planet neil/sicp
;; 集合作为二叉树
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
(display (list->tree (list 1 3 5 7 9 11)))

;; O(n) 