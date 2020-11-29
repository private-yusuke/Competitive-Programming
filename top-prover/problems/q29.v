From mathcomp
     Require Import ssreflect.

Require Import Problem.

Theorem solution: task.
Proof.
  rewrite /task.
  move=> x y.
  split=> Hyp.
  - move=> z.
    by apply R_trans.
  - apply (Hyp y).
    apply R_refl.
Qed.
