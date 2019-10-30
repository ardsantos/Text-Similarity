#lang racket

(require rackunit)
(require rackunit/text-ui)
(require "../levenshtein.rkt")

(define str1 "Recursos adicionais")
(define str2 "Recursos passionais")
(define str3 "Computadores legais")
(define str4 "Banana")
(define str5 "Gelo")

(define ldTestes (test-suite "Bateria de Testes Levenshtein"
        (test-case "Textos completamente iguais"
            (check-equal? (levenshtein str1 str1) 1.0))
        (test-case "Textos quase iguais"
            (check-equal? (levenshtein str1 str2) 0.7894736842105263))
        (test-case "Textos muito diferentes"
            (check-equal? (levenshtein str1 str3) 0.15789473684210525)
            (check-equal? (levenshtein str2 str3) 0.21052631578947367))
        (test-case "Textos completamente diferentes"
            (check-equal? (levenshtein str4 str5) 0.0))))

(run-test ldTestes)