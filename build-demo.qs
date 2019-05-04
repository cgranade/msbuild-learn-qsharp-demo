// Copyright (c) Sarah Kaiser. All rights reserved.
// Licensed under the MIT License.

namespace Build.Demo {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;

/// # Summary
/// Prints out the standard "Hello, world!" message with a
/// bonus favorite number passed as input.
///
/// # Description
/// Takes an `Int` as input and prints the standard test message 
/// as well as what integer the user likes.
///
/// # Input
/// ## FavoriteNumber
/// The integer you think is the coolest.
    function HelloWorld (FavoriteNumber : Int) : Unit {
        Message($"Hello, world! I like the number {FavoriteNumber}.");
    }

/// # Summary
/// Generates a random value from {0,1} by measuring a qubit in 
/// an equal superposition.
///
/// # Description
/// Given a qubit initially in the |0⟩ state, applies the H operation
/// to that qubit such that it has the state (1/√2) |0⟩ + (1/√2) |1⟩.
/// Measurement of this state returns a One Result with probability 0.5
/// and a Zero Result with probability 0.5.
    operation Qrng() : Result {
        using (qubit = Qubit()) {

            H(qubit);
        
            return MResetZ(qubit);
        }
    }

/// # Summary
/// Generates a random value from {0,1} by measuring a qubit in 
/// an equal superposition, and shows the state of the simulator
/// along the way.
///
/// # Description
/// Given a qubit initially in the |0⟩ state, applies the H operation
/// to that qubit such that it has the state (1/√2) |0⟩ + (1/√2) |1⟩.
/// Measurement of this state returns a One Result with probability 0.5
/// and a Zero Result with probability 0.5. The DumpRegister function
/// shows the state of the prepared qubit and the qubit right before 
/// measurement.
    operation QrngVerbose() : Result {
        using (qubit = Qubit()) {
        Message("Here is what the simulator uses to record a qubit in the 0 state:");
        DumpRegister((), [qubit]);

        Message(" ");
        
        H(qubit);
        
        Message("Here is what the simulator uses to record a superposition state:");
        DumpRegister((), [qubit]);
        
        return MResetZ(qubit);
        }
    }
}
 