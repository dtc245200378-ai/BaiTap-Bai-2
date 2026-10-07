package com.codegym;

public class Main {
    public static void main(String[] args) {
        System.out.println("=== KIỂM THỬ THƯ VIỆN GIẢI PHƯƠNG TRÌNH BẬC 2 ===");

        // Trường hợp 1: Phương trình có 2 nghiệm phân biệt (x^2 - 3x + 2 = 0)
        double a = 1.0, b = -3.0, c = 2.0;
        System.out.println("\n1. Phương trình: " + a + "x^2 + (" + b + ")x + (" + c + ") = 0");
        QuadraticEquation eq1 = new QuadraticEquation(a, b, c);
        System.out.println("   Delta = " + eq1.getDiscriminant());
        if (eq1.getDiscriminant() > 0) {
            System.out.println("   Nghiệm 1 (Root 1): " + eq1.getRoot1());
            System.out.println("   Nghiệm 2 (Root 2): " + eq1.getRoot2());
        }

        // Trường hợp 2: Phương trình có nghiệm kép (x^2 - 2x + 1 = 0)
        a = 1.0; b = -2.0; c = 1.0;
        System.out.println("\n2. Phương trình: " + a + "x^2 + (" + b + ")x + (" + c + ") = 0");
        QuadraticEquation eq2 = new QuadraticEquation(a, b, c);
        System.out.println("   Delta = " + eq2.getDiscriminant());
        if (eq2.getDiscriminant() == 0) {
            System.out.println("   Nghiệm kép: " + eq2.getRoot1());
        }

        // Trường hợp 3: Phương trình vô nghiệm (x^2 + x + 1 = 0)
        a = 1.0; b = 1.0; c = 1.0;
        System.out.println("\n3. Phương trình: " + a + "x^2 + (" + b + ")x + (" + c + ") = 0");
        QuadraticEquation eq3 = new QuadraticEquation(a, b, c);
        System.out.println("   Delta = " + eq3.getDiscriminant());
        if (eq3.getDiscriminant() < 0) {
            System.out.println("   Kết luận: Phương trình vô nghiệm!");
        }
    }
}
