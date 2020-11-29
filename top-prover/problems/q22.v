From mathcomp Require Import ssreflect ssrbool.

Definition task1 := forall P Q, ~ P \/ ~ Q <-> ~ (P /\ Q).
Definition task2 := forall P Q, ~ P /\ ~ Q <-> ~ (P \/ Q).

(*
  Prove task1 or task2. You can choose either one you like.
 *)

Lemma solution1: task1.
Proof.
Abort.

Lemma solution2: task2.
Proof.
  move=> P Q.
  split.
  - by case=> ? ? [].
  - move=> H.
    split => ?.
    apply: H.
    by left.
    apply: H.
    by right.
Qed.


Theorem solution: task1 \/ task2.
Proof.
  (* left. apply solution1. *)
  right. apply solution2.
Qed.
