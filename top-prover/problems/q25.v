From mathcomp Require Import ssreflect ssrbool.

Definition task :=
  forall a b c : bool, a = b \/ b = c \/ c = a.

Theorem solution: task.
Proof.
  rewrite /task.
  move=> [] [] [].
  by left.
  by left.
  by right; right.
  by right; left.
  by right; left.
  by right; right.
  by left.
  by left.
Qed.
