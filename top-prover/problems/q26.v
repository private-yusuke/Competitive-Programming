From mathcomp Require Import ssreflect ssrnat.

Definition task := forall m n, m * n = 3 -> m = 1 \/ n = 1.

Theorem solution: task.
Proof.
  rewrite /task.
  move=> m n H.
  case m, n.
  - discriminate H.
  - by rewrite mul0n in H.
  - by rewrite muln0 in H.
  - case m, n.
    + by [].
    + by left.
    + by right.
    + rewrite -!add1n in H.
Qed.
