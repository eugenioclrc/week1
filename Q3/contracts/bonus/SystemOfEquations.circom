pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";
// hint: you can use more than one templates in circomlib-matrix to help you
include "../../node_modules/circomlib-matrix/circuits/matElemSum.circom";
include "../../node_modules/circomlib-matrix/circuits/matMul.circom";
include "../../node_modules/circomlib/circuits/comparators.circom";


template SystemOfEquations(n) { // n is the number of variables in the system of equations
    signal input x[n]; // this is the solution to the system of equations
    signal input A[n][n]; // this is the coefficient matrix
    signal input b[n]; // this are the constants in the system of equations
    signal output out; // 1 for correct solution, 0 for incorrect solution

    // [bonus] insert your code here
    component mul = matMul(n, n, 1);
    component elSum = matElemSum(n, 1);
    component isEqMat[n];
    component isEq = IsEqual();

    // For each row and col we save the matrix product
    for (var i = 0; i < n; i++) {
        for (var j = 0; j < n; j++) {
            mul.a[i][j] <== A[i][j];
        }
        // Save data to make matrix product
        mul.b[i][0] <== x[i];
    }

    // For each row ...
    for (var i=0; i < n; i++) {
        isEqMat[i] = IsEqual();
        
        isEqMat[i].in[0] <== mul.out[i][0];
        isEqMat[i].in[1] <== b[i];

        elSum.a[i][0] <== isEqMat[i].out;
    }

    isEq.in[0] <== elSum.out;
    isEq.in[1] <== n;

    out <== isEq.out;
}

component main {public [A, b]} = SystemOfEquations(3);