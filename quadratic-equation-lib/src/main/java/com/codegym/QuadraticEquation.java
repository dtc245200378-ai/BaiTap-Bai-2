package com.codegym;

public class QuadraticEquation {
    private double a;
    private double b;
    private double c;

    public QuadraticEquation() {
    }

    public QuadraticEquation(double a, double b, double c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public double getA() {
        return a;
    }

    public void setA(double a) {
        this.a = a;
    }

    public double getB() {
        return b;
    }

    public void setB(double b) {
        this.b = b;
    }

    public double getC() {
        return c;
    }

    public void setC(double c) {
        this.c = c;
    }

    public double getDiscriminant() {
        return b * b - 4 * a * c;
    }

    public double getDelta() {
        return getDiscriminant();
    }

    public double getRoot1() {
        double delta = getDiscriminant();
        if (delta < 0 || a == 0) {
            return 0;
        }
        return (-b + Math.sqrt(delta)) / (2 * a);
    }

    public double getRoot2() {
        double delta = getDiscriminant();
        if (delta < 0 || a == 0) {
            return 0;
        }
        return (-b - Math.sqrt(delta)) / (2 * a);
    }

    public static double[] solve(double a, double b, double c) {
        if (a == 0) {
            if (b == 0) return new double[0];
            return new double[]{-c / b};
        }
        double delta = b * b - 4 * a * c;
        if (delta < 0) return new double[0];
        if (delta == 0) return new double[]{-b / (2 * a)};
        return new double[]{
            (-b + Math.sqrt(delta)) / (2 * a),
            (-b - Math.sqrt(delta)) / (2 * a)
        };
    }
}
