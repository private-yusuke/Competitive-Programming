From mathcomp
     Require Import ssreflect.

Require Import Problem.

Theorem solution : task.
Proof.
  by move=> ? ? ? ? H; injection H.
Qed.
