From mathcomp
  Require Import ssreflect ssrnat ssrbool.

Definition task := forall n m, n < m \/ n = m \/ n > m.

Theorem solution: task.
Proof.
  move=> n m.
  elim n.
  - elim m.
    + by right; left.
  - elim n.
    
Qed.