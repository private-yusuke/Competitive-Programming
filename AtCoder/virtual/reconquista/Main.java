import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int T = sc.nextInt();
		int A = sc.nextInt();
		int[] H = new int[N];
		for(int i = 0; i < N; i++) {
			H[i] = sc.nextInt();
		}
		System.out.println(N);
		System.out.println(T);
		System.out.println(A);
		for(int i = 0; i < H.length; i++) {
			System.out.println(H[i]);
		}
	}
}
