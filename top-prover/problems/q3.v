From mathcomp
    Require Import ssreflect ssrnat.

Definition task := 1 + 1 = 2.

Theorem solution: task.
Proof.
  by rewrite /task.
Qed.
