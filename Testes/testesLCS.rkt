#lang racket

(require rackunit)
(require rackunit/text-ui)
(require "../lcs.rkt")

(define str1 "Recursos adicionais")
(define str2 "Recursos passionais")
(define str3 "Computadores legais")
(define str4 "Banana")
(define str5 "Gelo")

(define lcsTestes
    (test-suite "Bateria de Testes LCS"
        (test-case "Textos completamente iguais"
            (check-equal? (lcs str1 str1) 1.0))
        (test-case "Textos quase iguais"
            (check-equal? (lcs str1 str2) 0.7894736842105263))
        (test-case "Textos muito diferentes"
            (check-equal? (lcs str1 str3) 0.3157894736842105)
            (check-equal? (lcs str2 str3) 0.3157894736842105))
        (test-case "Textos completamente diferentes"
            (check-equal? (lcs str4 str5) 0.0))))

(run-test lcsTestes)