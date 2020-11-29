From mathcomp
     Require Import ssreflect.
Require Import Arith.

Theorem solution: task.
Proof.
  rewrite /task /injective1 /injective2.
  move=> f.
  split=> H m n.
  - move=> H0 H1.
    by case H0; apply H.
  - case: (Nat.eq_dec m n); first done.
    by move/H => H1/H1.
Qed.
