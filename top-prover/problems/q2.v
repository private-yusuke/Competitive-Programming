From mathcomp
  Require Import ssreflect ssrnat.

Definition plus_comm := forall n m : nat, n + m = m + n.

Theorem plus_comm_proof: plus_comm.
Proof.
  rewrite /plus_comm.
  by move=> n m; rewrite addnC.
Qed.