From mathcomp
  Require Import ssreflect ssrnat.

Definition plus_assoc := forall n m o : nat, n + m + o = n + (m + o).

Theorem plus_assoc_proof: plus_assoc.
Proof.
  rewrite /plus_assoc.
  by move=> n m o; rewrite addnA.
Qed.