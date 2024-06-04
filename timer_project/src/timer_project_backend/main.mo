import Timer "mo:base/Timer";
import Nat "mo:base/Nat";

actor TimerCreator {
  type Times = {
    #_30secs;
    #_1min;
    #_5mins;
  };

  var checkTimerText = "Not done";

  func printDone() : async () {
    checkTimerText := "Done";
  };

  public func setATimer(time : Times) : async Nat {
    var timerId : Nat = 0;
    switch (time) {
      case (#_30secs) {
        checkTimerText := "Not Done";
        timerId := Timer.setTimer<system>(#seconds 30, printDone);
      };
      case (#_1min) {
        checkTimerText := "Not Done";
        timerId := Timer.setTimer<system>(#seconds 60, printDone);
      };
      case (#_5mins) {
        checkTimerText := "Not Done";
        timerId := Timer.setTimer<system>(#seconds 300, printDone);
      };
    };

    return timerId;
  };

  public func cancelATimer(id : Nat) : async Text {
    Timer.cancelTimer(id);
    return "Timer with id " # Nat.toText(id) # "cancelled";
  };

  public func checkTimer() : async Text {
    return checkTimerText;
  };
};
