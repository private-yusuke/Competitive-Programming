From mathcomp
    Require Import ssreflect ssrnat.

Definition task := forall n m, n * S m = n + n * m.

Theorem solution: task.
Proof.
  rewrite /task.
  move=> n m.
  elim: n => [// | n IHn].
  rewrite -addn1.
  rewrite mulnC.
  rewrite mulnDr.
  rewrite mulnC.
  rewrite IHn.
  rewrite muln1.
  rewrite [(n+1)*m]mulnC.
  rewrite mulnDr.
  rewrite addnA.
  rewrite muln1.
  rewrite -addn1.
  rewrite addnA.
  rewrite mulnC.
  rewrite addnC.
  rewrite [n + 1]addnC.
  by [].
Qed.