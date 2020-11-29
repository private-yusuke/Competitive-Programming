From mathcomp
     Require Import ssreflect ssrnat.

Require Import Problem.

Theorem solution : task.
Proof.
  rewrite /task.
  move=> n; split.
  - elim.
    done.
    discriminate.
  - move=> ->. constructor.
Qed.
