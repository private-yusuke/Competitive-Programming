From mathcomp
  Require Import ssreflect.

Definition task := forall (f: bool -> bool) b, f (f (f b)) = f b.

(* Hint *)
Lemma lemma: forall (f: bool -> bool) b x y z,
  x = f b -> y = f x -> z = f y -> z = x.
Proof.
  move=> f [] [] []; congruence.
Qed.

Theorem solution: task.
Proof. unfold task. intros. eapply lemma; reflexivity. Qed.