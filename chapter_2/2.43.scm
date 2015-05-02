#lang racket
;;将flat-map交换顺序后，原来只需计算一次(queen-cols (- n 1)) 现在每个flat-map都会计算一次，
;;而现如今的queen-cols在每次计算时的计算量也比原来大很多，是n^n