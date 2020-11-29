From mathcomp Require Import ssreflect ssrbool.

Definition task := forall n : nat, 0 = n * 0.

Theorem solution: task.
Proof.
  by rewrite /task.
Qed.
